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
use App\Services\GeocodingService;

use function PHPUnit\Framework\isEmpty;

class DistanceMatrixController extends Controller
{
    public function index()
    {
        $pageTitle = "Vendor by distance";
        return view('admin.distanceMeasure.index', compact('pageTitle'));
    }

    public function findClosestLocations(Request $request)
    {
        $numberOfTech = 1;
        $radius = 150;

        if (isset($request->numberOfTech)) {
            $numberOfTech = $request->numberOfTech;
        }

        $incrementStep = $request->has('radiusValue') ? $request->radiusValue : 0;
        $respondedTechnicians = $request->input('respondedTechnicians', []);
        $givenLatitude = $request->input('latitude');
        $givenLongitude = $request->input('longitude');

        $input = $request->all();
        $rules = [
            'destination' => 'required',
            'numberOfTech' => 'required|integer|between:1,20',
        ];
        $message = [
            'destination.required' => 'Project site address is required.',
        ];
        $validator = Validator::make($input, $rules, $message);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }

        $destination = $givenLatitude . ',' . $givenLongitude;

        $locations = Technician::select(
            'id',
            DB::raw('ST_X(co_ordinates) as longitude'),
            DB::raw('ST_Y(co_ordinates) as latitude')
        )->whereNotIn('id', $respondedTechnicians)->get();

        $distances = [];
        foreach ($locations as $location) {
            $distance = $location->greatCircleDistance($givenLatitude, $givenLongitude);
            $distances[$location->id] = $distance * 0.621371;
        }

        $filteredArray = [];
        foreach ($distances as $key => $value) {
            if ($value <= $radius) {
                $filteredArray[$key] = $value;
            }
        }
        asort($filteredArray);
        if (empty($filteredArray)) {
            $radius += $incrementStep;
            $filteredArray = [];
            foreach ($distances as $key => $value) {
                if ($value <= $radius) {
                    $filteredArray[$key] = $value;
                }
            }
            asort($filteredArray);
        }
        $closestDistances = Technician::select(
            'id',
            DB::raw('ST_X(co_ordinates) as longitude'),
            DB::raw('ST_Y(co_ordinates) as latitude')
        )->whereIn('id', array_slice(array_keys($filteredArray), 0, $numberOfTech))->get();

        $technicians = [];
        foreach ($closestDistances as $closestDistance) {
            $technicians[] = Technician::select('id', 'address_data')
                ->where('id', $closestDistance->id)->get();
        }
        $mergedTechnicians = collect($technicians)->flatten();

        $origins = [];
        foreach ($mergedTechnicians as $technician) {
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
        $techniciansFound = false;
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

                    // if ($distanceTextMiles <= $radius) {
                    $isWithinRadius = $ftech->radius > $distanceTextMiles;
                    if ($isWithinRadius) {
                        $isWithinRadius = "Yes";
                    } else {
                        $isWithinRadius = "No";
                    }

                    $rateString = "";
                    foreach ($ftech->rate as $key => $value) {
                        $rateString .= "$key : $value, ";
                    }

                    $completeInfo[] = [
                        'id' => $ftech->id,
                        'technician_id' => $ftech->technician_id,
                        'email' => $ftech->email,
                        'phone' => $ftech->phone,
                        'company_name' => $ftech->company_name,
                        'distance' => $distanceTextMiles,
                        'status' => $ftech->status,
                        'rate' => rtrim($rateString, ", "),
                        'travel_fee' => $ftech->travel_fee,
                        'preference' => $ftech->preference,
                        'duration' => $durationText,
                        'radius' => $isWithinRadius,
                        'skills' => $ftech->skills->pluck('skill_name')->toArray(),
                        'radius_value' => $radius,
                    ];
                    $techniciansFound = true;
                    // }
                }
            }
        }

        if (!$techniciansFound) {
            return response()->json(['errors' => 'No technicians found in 150 miles radius.'], 404);
        }

        usort($completeInfo, function ($a, $b) {
            return $a['distance'] <=> $b['distance'];
        });

        foreach ($completeInfo as &$info) {
            $info['distance'] = number_format($info['distance'], 2) . ' mi';
        }
        return response()->json(['technicians' => $completeInfo], 200);
    }

    // public function findMoreTech(Request $request)
    // {
    //     // dd($request->clickCount);
    //     // dd($request->responseData);
    //     $response = json_decode($request->responseData, true);
    //     // dd($response);
    //     $responseArray = [];

    //     if (isset($response['technicians']) && is_array($response['technicians'])) {
    //         foreach ($response['technicians'] as $technician) {
    //             if (isset($technician['id'])) {
    //                 $responseArray[] = $technician['id'];
    //             }
    //         }
    //     }

    //     $radius = 150;

    //     if ($request->has('radiusValue')) {
    //         $radius = $radius + $request->radiusValue;
    //     }

    //     $givenLatitude = $request->input('latitude');
    //     $givenLongitude = $request->input('longitude');

    //     $input = $request->all();

    //     $rules = [
    //         'destination' => 'required',
    //     ];

    //     $message = [
    //         'destination.required' => 'Project site address is required.',
    //     ];

    //     $validator = Validator::make($input, $rules, $message);

    //     if ($validator->fails()) {
    //         return response()->json(['errors' => $validator->errors()], 422);
    //     }

    //     $destination = $givenLatitude . ',' . $givenLongitude;

    //     $locations = Technician::select(
    //         'id',
    //         DB::raw('ST_X(co_ordinates) as longitude'),
    //         DB::raw('ST_Y(co_ordinates) as latitude')
    //     )->whereNotIn('id', $responseArray)->get();

    //     // dd($locations);

    //     $distances = [];

    //     foreach ($locations as $location) {
    //         $distance = $location->greatCircleDistance($givenLatitude, $givenLongitude);
    //         $distances[$location->id] = $distance * 0.621371;
    //     }

    //     $filteredArray = [];

    //     foreach ($distances as $key => $value) {
    //         if ($value <= $radius) {
    //             $filteredArray[$key] = $value;
    //         }
    //     }

    //     asort($filteredArray);

    //     $closestDistances = Technician::select(
    //         'id',
    //         DB::raw('ST_X(co_ordinates) as longitude'),
    //         DB::raw('ST_Y(co_ordinates) as latitude')
    //     )->whereIn('id', array_slice(array_keys($filteredArray), 0, 10))->get();

    //     $technicians = [];
    //     foreach ($closestDistances as $closestDistance) {
    //         $technicians[] = Technician::select('id', 'address_data')
    //             ->where('id', $closestDistance->id)->get();
    //     }

    //     $mergedTechnicians = collect($technicians)->flatten();

    //     $origins = [];

    //     foreach ($mergedTechnicians as $technician) {
    //         $addressData['country'] = $technician->address_data->country;
    //         $addressData['city'] = $technician->address_data->city;
    //         $addressData['state'] = $technician->address_data->state;
    //         $addressData['zip_code'] = $technician->address_data->zip_code;
    //         $formattedOrigin = implode(', ', [
    //             $addressData['country'],
    //             $addressData['city'],
    //             $addressData['state'],
    //             $addressData['zip_code']
    //         ]);

    //         $origins[] = [
    //             'technician_id' => $technician->id,
    //             'origin' => $formattedOrigin,
    //         ];
    //     }

    //     $originsString = implode('|', array_column($origins, 'origin'));

    //     $distances = new DistanceMatrixService();

    //     $data = $distances->getDistance($originsString, $destination);

    //     $completeInfo = [];
    //     $techniciansFound = false;
    //     foreach ($data['rows'] as $index => $row) {
    //         if ($row['elements'][0]['status'] === "OK") {
    //             $technicianId = $origins[$index]['technician_id'];
    //             $distanceText = $row['elements'][0]['distance']['text'];
    //             $durationText = $row['elements'][0]['duration']['text'];

    //             $ftech = Technician::with('skills')->findOrFail($technicianId);

    //             if ($ftech) {
    //                 $distanceTextKm = str_replace([' km', ' ', ','], '', $distanceText);
    //                 $distanceTextKm = (float)$distanceTextKm;
    //                 $distanceTextMiles = $distanceTextKm * 0.621371;

    //                 if ($distanceTextMiles <= $radius) {
    //                     $isWithinRadius = $ftech->radius > $distanceTextMiles;
    //                     if ($isWithinRadius) {
    //                         $isWithinRadius = "Yes";
    //                     } else {
    //                         $isWithinRadius = "No";
    //                     }

    //                     //formatting rate into string
    //                     $rateString = "";
    //                     foreach ($ftech->rate as $key => $value) {
    //                         $rateString .= "$key : $value, ";
    //                     }

    //                     $completeInfo[] = [
    //                         'id' => $ftech->id,
    //                         'technician_id' => $ftech->technician_id,
    //                         'email' => $ftech->email,
    //                         'phone' => $ftech->phone,
    //                         'company_name' => $ftech->company_name,
    //                         'distance' => $distanceTextMiles,
    //                         'status' => $ftech->status,
    //                         'rate' => rtrim($rateString, ", "),
    //                         'travel_fee' => $ftech->travel_fee,
    //                         'preference' => $ftech->preference,
    //                         'duration' => $durationText,
    //                         'radius' => $isWithinRadius,
    //                         'skills' => $ftech->skills->pluck('skill_name')->toArray(),
    //                     ];

    //                     $techniciansFound = true;
    //                 }
    //             }
    //         }
    //     }

    //     if (!$techniciansFound) {
    //         return response()->json(['errors' => 'No technicians found in 150 miles radius.'], 404);
    //     }

    //     usort($completeInfo, function ($a, $b) {
    //         return $a['distance'] <=> $b['distance'];
    //     });

    //     foreach ($completeInfo as &$info) {
    //         $info['distance'] = number_format($info['distance'], 2) . ' mi';
    //     }

    //     // foreach ($completeInfo as $response) {
    //     //     StoreResponseJob::dispatch($givenLatitude, $givenLongitude, $destinationAddress, $response)->onQueue('store_responses');
    //     // }

    //     return response()->json(['technicians' => $completeInfo], 200);
    // }

    public function autocomplete(Request $request)
    {
        $geoCode = new GeocodingService;
        $response = $geoCode->geocodeAddress($request->input('query'));

        $array = [];
        if ($response && isset($response["address_components"]) && isset($response["geometry"]["location"])) {
            $fullAddress = "";
            foreach ($response["address_components"] as $component) {
                if (isset($component["long_name"])) {
                    $fullAddress .= $component["long_name"] . ", ";
                }
            }
            $fullAddress = rtrim($fullAddress, ", ");

            $latitude = $response["geometry"]["location"]["lat"];
            $longitude = $response["geometry"]["location"]["lng"];

            $array = [
                "full_name" => $fullAddress,
                "latitude" => $latitude,
                "longitude" => $longitude,
            ];
        }
        return response()->json($array);
        // $url = 'https://api.locationiq.com/v1/autocomplete';
        // $key = config('services.locationiq.api_key');
        // $query = $request->input('query');
        // $limit = 10;
        // $dedupe = 1;

        // $curl = curl_init();

        // curl_setopt_array($curl, [
        //     CURLOPT_URL => "$url?key=$key&q=$query&limit=$limit&dedupe=$dedupe",
        //     CURLOPT_RETURNTRANSFER => true,
        //     CURLOPT_ENCODING => '',
        //     CURLOPT_MAXREDIRS => 10,
        //     CURLOPT_TIMEOUT => 0,
        //     CURLOPT_FOLLOWLOCATION => true,
        //     CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
        //     CURLOPT_CUSTOMREQUEST => 'GET',
        //     CURLOPT_HTTPHEADER => [
        //         'Content-Type: application/json'
        //     ],
        // ]);

        // $response = curl_exec($curl);

        // curl_close($curl);

        // return response()->json($response);
    }
}