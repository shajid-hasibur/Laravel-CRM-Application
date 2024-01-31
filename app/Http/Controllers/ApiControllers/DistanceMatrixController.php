<?php

namespace App\Http\Controllers\ApiControllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\CustomClass\DistanceMatrixService;
use App\Models\Technician;
use GuzzleHttp\Client;
use Illuminate\Support\Facades\Validator;

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
}
