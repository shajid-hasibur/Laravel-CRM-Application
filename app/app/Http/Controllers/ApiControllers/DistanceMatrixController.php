<?php

namespace App\Http\Controllers\ApiControllers;

use App\Http\Controllers\Controller;
use App\Models\TechDistance;
use Illuminate\Http\Request;
use App\CustomClass\DistanceMatrixService;
use App\Models\Technician;
use GuzzleHttp\Client;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\DB;
use App\Jobs\StoreResponseJob;
use Illuminate\Support\Facades\Queue;

class DistanceMatrixController extends Controller
{
    public function index()
    {
        $pageTitle = "Vendor by distance";
        return view('admin.distanceMeasure.index', compact('pageTitle'));
    }

    public function getResponse(Request $request)
    {
        $input = $request->all();

        $rules = [
            'destination' => 'required',
            // 'mode' => 'required'
        ];

        $message = [
            'destination.required' => 'Project site address is required.',
            // 'mode.required' => 'Mode of transportation is required.',
        ];

        $validator = Validator::make($input, $rules, $message);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }

        $destination = $request->input('destination');
        $mode = $request->input('mode');

        $technicians = Technician::AvailableFtech()->get(['id', 'address_data']);
        $origins = [];

        // processing the origin data as acceptable format for api
        foreach ($technicians as $technician) {
            $addressData['country'] = $technician->address_data->country;
            $addressData['city'] = $technician->address_data->city;
            $addressData['state'] = $technician->address_data->state;
            $addressData['zip_code'] = $technician->address_data->zip_code;

            $formattedOrigin = implode(', ', [
                $addressData['country'],
                $addressData['city'],
                $addressData['state'],
                $addressData['zip_code']
            ]);

            $origins[] = [
                'technician_id' => $technician->id,
                'origin' => $formattedOrigin,
            ];
        }
        $originsString = implode('|', array_column($origins, 'origin'));

        // dd($originsString);
        $distances = new DistanceMatrixService();
        $data = $distances->getDistance($originsString, $destination);
        // dd($data);
        $completeInfo = [];
        foreach ($data['rows'] as $index => $row) {
            if ($row['elements'][0]['status'] === "OK") {
                $technicianId = $origins[$index]['technician_id'];
                $distanceText = $row['elements'][0]['distance']['text'];
                $durationText = $row['elements'][0]['duration']['text'];

                $ftech = Technician::with('skills')->findOrFail($technicianId);

                if ($ftech) {
                    $distanceTextKm = str_replace([' km', ' ', ','], '', $distanceText);
                    $distanceTextKm = (float)$distanceTextKm;

                    // Convert km to miles
                    $distanceTextMiles = $distanceTextKm * 0.621371;

                    $isWithinRadius = $ftech->radius > $distanceTextMiles;
                    if ($isWithinRadius) {
                        $isWithinRadius = "Yes";
                    } else {
                        $isWithinRadius = "No";
                    }

                    $completeInfo[] = [
                        'id' => $ftech->id,
                        'technician_id' => $ftech->technician_id,
                        'email' => $ftech->email,
                        'phone' => $ftech->phone,
                        'company_name' => $ftech->company_name,
                        'distance' => $distanceTextMiles,
                        'status' => $ftech->status,
                        'rate' => $ftech->rate,
                        'travel_fee' => $ftech->travel_fee,
                        'preference' => $ftech->preference,
                        'duration' => $durationText,
                        'radius' => $isWithinRadius,
                        'skills' => $ftech->skills->pluck('skill_name')->toArray(),
                    ];
                }
            }
        }

        usort($completeInfo, function ($a, $b) {
            return $a['distance'] <=> $b['distance'];
        });

        foreach ($completeInfo as &$info) {
            $info['distance'] = number_format($info['distance'], 2) . ' mi';
        }

        return response()->json(['technicians' => $completeInfo], 200);
    }

    public function placesAutocomplete(Request $request)
    {

        $query = $request->input('query');
        $apiKey = config('services.google.api_key');

        $client = new Client();

        $response = $client->get('https://maps.googleapis.com/maps/api/place/autocomplete/json', [
            'query' => [
                'input' => $query,
                'key' => $apiKey,
            ],
        ]);

        $data = json_decode($response->getBody(), true);

        return response()->json($data);
    }

    public function findClosestLocations(Request $request)
    {
        $givenLatitude = "";
        $givenLongitude = "";
        $input = $request->all();

        $rules = [
            'destination' => 'required',
        ];

        $message = [
            'destination.required' => 'Project site address is required.',
        ];

        $validator = Validator::make($input, $rules, $message);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }

        $apiKey = config('services.locationiq.api_key');
        $address = $request->input('destination');
        $encodedAddress = urlencode($address);

        $url = "https://us1.locationiq.com/v1/search?key={$apiKey}&q={$encodedAddress}&format=json";

        $client = new Client();

        try {
            $response = $client->get($url);
            $body = $response->getBody()->getContents();
            $data = json_decode($body, true);
            $givenLatitude = $data[0]['lat'];
            $givenLongitude = $data[0]['lon'];
        } catch (\Exception $e) {
            return response()->json(['errors' => "Error fetching data from Location IQ service."], 503);
        }

        $destination = $givenLatitude . ',' . $givenLongitude;

        $locations = Technician::select(
            'id',
            DB::raw('ST_X(co_ordinates) as longitude'),
            DB::raw('ST_Y(co_ordinates) as latitude')
        )->get();
        $distances = [];

        foreach ($locations as $location) {
            $distance = $location->greatCircleDistance($givenLatitude, $givenLongitude);
            $distances[$location->id] = $distance * 0.621371;
        }

        asort($distances);
        $closestDistances = Technician::select(
            'id',
            DB::raw('ST_X(co_ordinates) as longitude'),
            DB::raw('ST_Y(co_ordinates) as latitude')
        )->whereIn('id', array_slice(array_keys($distances), 0, 3))->get();
        $technicians = [];
        foreach ($closestDistances as $closestDistance) {
            $technicians[] = Technician::select('id', 'address_data')
                ->where('id', $closestDistance->id)->get();
        }

        $mergedTechnicians = collect($technicians)->flatten();
        $origins = [];
        foreach ($mergedTechnicians as $technician) {
            // dd($technician);
            $addressData['country'] = $technician->address_data->country;
            $addressData['city'] = $technician->address_data->city;
            $addressData['state'] = $technician->address_data->state;
            $addressData['zip_code'] = $technician->address_data->zip_code;
            $formattedOrigin = implode(', ', [
                $addressData['country'],
                $addressData['city'],
                $addressData['state'],
                $addressData['zip_code']
            ]);
            $origins[] = [
                'technician_id' => $technician->id,
                'origin' => $formattedOrigin,
            ];
        }
        $originsString = implode('|', array_column($origins, 'origin'));

        $distances = new DistanceMatrixService();

        $data = $distances->getDistance($originsString, $destination);

        $completeInfo = [];
        foreach ($data['rows'] as $index => $row) {
            if ($row['elements'][0]['status'] === "OK") {
                $technicianId = $origins[$index]['technician_id'];
                $distanceText = $row['elements'][0]['distance']['text'];
                $durationText = $row['elements'][0]['duration']['text'];

                $ftech = Technician::with('skills')->findOrFail($technicianId);

                if ($ftech) {
                    $distanceTextKm = str_replace([' km', ' ', ','], '', $distanceText);
                    $distanceTextKm = (float)$distanceTextKm;
                    $distanceTextMiles = $distanceTextKm * 0.621371;
                    $isWithinRadius = $ftech->radius > $distanceTextMiles;
                    if ($isWithinRadius) {
                        $isWithinRadius = "Yes";
                    } else {
                        $isWithinRadius = "No";
                    }

                    $completeInfo[] = [
                        'id' => $ftech->id,
                        'technician_id' => $ftech->technician_id,
                        'email' => $ftech->email,
                        'phone' => $ftech->phone,
                        'company_name' => $ftech->company_name,
                        'distance' => $distanceTextMiles,
                        'status' => $ftech->status,
                        'rate' => $ftech->rate,
                        'travel_fee' => $ftech->travel_fee,
                        'preference' => $ftech->preference,
                        'duration' => $durationText,
                        'radius' => $isWithinRadius,
                        'skills' => $ftech->skills->pluck('skill_name')->toArray(),
                    ];
                }
            }
        }

        usort($completeInfo, function ($a, $b) {
            return $a['distance'] <=> $b['distance'];
        });

        foreach ($completeInfo as &$info) {
            $info['distance'] = number_format($info['distance'], 2) . ' mi';
        }

        foreach ($completeInfo as $response) {
            StoreResponseJob::dispatch($givenLatitude, $givenLongitude, $address, $response)->onQueue('store_responses');
        }

        return response()->json(['technicians' => $completeInfo], 200);
    }
}
