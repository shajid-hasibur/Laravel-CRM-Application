<?php

namespace App\Http\Controllers\technicians;

use App\CustomClass\DistanceMatrixService;
use App\Exports\FakeTechniciansExport;
use App\Http\Controllers\Controller;
use App\Imports\TechniciansImport;
use App\Models\CheckInOut;
use App\Models\Review;
use App\Models\SkillCategory;
use App\Models\Technician;
use Illuminate\Database\QueryException;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Storage;
use Maatwebsite\Excel\Facades\Excel;
use App\Services\TechnicianService;
use Exception;
use Illuminate\Support\Facades\DB;
use PDF;

class TechnicianController extends Controller
{
    protected $technicianService;
    public function __construct(TechnicianService $technicianService)
    {
        $this->technicianService = $technicianService;
    }
    public function index()
    {
        $pageTitle = 'Technician Details';
        $fTechData = $this->techData();
        $details = $fTechData['data'];
        return $this->techView($pageTitle, $details);
    }
    private function techData()
    {
        $fTechs = Technician::with(['skills']);
        $fTechs = $fTechs->searchable(['technician_id', 'company_name']);
        return [
            'data' => $fTechs->orderBy('id', 'desc')->paginate(getPaginate()),
        ];
    }
    private function DocUnverifiedFtech()
    {
        $fTechs = Technician::DocUnverifiedFtech()->with(['skills']);
        $fTechs = $fTechs->searchable(['technician_id', 'company_name']);
        return [
            'data' => $fTechs->orderBy('id', 'desc')->paginate(getPaginate()),
        ];
    }
    private function DocVerifiedFtech()
    {
        $fTechs = Technician::DocVerifiedFtech()->with(['skills']);
        $fTechs = $fTechs->searchable(['technician_id', 'company_name']);
        return [
            'data' => $fTechs->orderBy('id', 'desc')->paginate(getPaginate()),
        ];
    }
    private function AvailableFtech()
    {
        $fTechs = Technician::AvailableFtech()->with(['skills']);
        $fTechs = $fTechs->searchable(['technician_id', 'company_name']);
        return [
            'data' => $fTechs->orderBy('id', 'desc')->paginate(getPaginate()),
        ];
    }
    private function AssignedFtech()
    {
        $fTechs = Technician::AssignedFtech()->with(['skills']);
        $fTechs = $fTechs->searchable(['technician_id', 'company_name']);
        return [
            'data' => $fTechs->orderBy('id', 'desc')->paginate(getPaginate()),
        ];
    }
    private function techView($pageTitle, $details)
    {
        return view('admin.technicians.index', compact('pageTitle', 'details'));
    }
    public function dUnverifiedTech()
    {
        $pageTitle = "Documents Unverified Technician";
        $fTechData = $this->DocUnverifiedFtech();
        $details = $fTechData['data'];
        return $this->techView($pageTitle, $details);
    }
    public function dVerifiedTech()
    {
        $pageTitle = "Documents Verified Technician";
        $fTechData = $this->DocVerifiedFtech();
        $details = $fTechData['data'];
        return $this->techView($pageTitle, $details);
    }
    public function availableTech()
    {
        $pageTitle = "Available Technician";
        $fTechData = $this->AvailableFtech();
        $details = $fTechData['data'];
        return $this->techView($pageTitle, $details);
    }
    public function disableTech()
    {
        $pageTitle = "Disable Technician";
        $fTechData = $this->AssignedFtech();
        $details = $fTechData['data'];
        return $this->techView($pageTitle, $details);
    }
    public function create()
    {
        $pageTitle = 'Technician Registration';
        $skills = SkillCategory::all();
        return view('admin.technicians.create', compact('pageTitle', 'skills'));
    }

    public function allSkill()
    {
        $skills = SkillCategory::all();
        return response()->json([
            'skills' => $skills,
        ]);
    }

    public function skills(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'skill_name' => 'required|unique:skill_categories|max:100',
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }

        $skill_category = new SkillCategory();
        $skill_category->skill_name = $request->skill_name;
        $skill_category->save();

        return response()->json(['message' => 'Skill added successfully'], 200);
    }
    public function storeSkills(Request $request)
    {
        $validator = Validator::make($request->all(), [

            'skill_name.*' => 'required|unique:skill_categories,skill_name|max:100',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'errors' => $validator->errors()->all()
            ], 422);
        } else {
            for ($i = 0; $i < count($request->skill_name); $i++) {
                $skill = new SkillCategory();
                $skill->skill_name = $request->skill_name[$i];
                $skill->save();
            }
            return response()->json(['success' => 'Skills added successfully'], 200);
        }
    }
    public function storeTech(Request $request)
    {
        $result = $this->technicianService->registerTechnician($request);
        if (isset($result['technician']) && $result['review']) {
            $notify[] = ['success', 'Technician registration successful'];
            return redirect()->route('technician.index')->withNotify($notify);
        }
    }

    //begin skill List
    public function skillList()
    {
        $pageTitle = 'Technician Skill List';
        $skills = SkillCategory::all();
        if (request()->ajax()) {
            return response()->json(['skills' => $skills], 200);
        } else {
            return view('admin.technicians.skill.skill', compact('pageTitle', 'skills'));
        }
    }
    //end skill List

    //begin edit function
    public function techEdit($id)
    {
        $pageTitle = "Edit Technician";
        $edit = Technician::with('skills')->get()->find($id);
        $skill_sets = $edit->skills->pluck('skill_name')->toArray();
        $skill_sets_string = implode(", ", $skill_sets);
        return view('admin.technicians.edit_technician', compact('pageTitle', 'edit', 'skill_sets_string'));
    }
    public function techDelete($id)
    {
        $delete = Technician::findOrFail($id);
        $delete->delete();
        $notify[] = ['success', 'Data deleted successfully!'];
        return back()->withNotify($notify);
    }
    public function techEditPost(Request $request, $id)
    {
        $result = $this->technicianService->updateTechnician($request, $id);
        if ($result) {
            $notify[] = ['success', 'Technician record updated succesfully'];
            return redirect()->route('technician.index')->withNotify($notify);
        }
    }

    public function catEdit($id)
    {
        $pageTitle = "Edit Category";
        $edit = SkillCategory::find($id);
        return view('admin.technicians.skill.edit.cat_edit', compact('pageTitle', 'edit'));
    }

    //update skill sets
    public function catEditPost(Request $request, $id)
    {
        $update = SkillCategory::find($id);
        $update->skill_name = $request->skill_name;
        $update->save();
        $notify[] = ['success', 'Skill updated succesfully'];
        return to_route('technician.skillList')->withNotify($notify);
    }

    //delete skill sets
    public function catDelete($id)
    {
        try {
            $delete = SkillCategory::findOrFail($id);
            $delete->delete();
            $notify[] = ['success', 'Skill deleted successfully'];
            return back()->withNotify($notify);
        } catch (QueryException $e) {
            if (Str::contains($e->getMessage(), 'foreign key constraint')) {
                $notify[] = ['error', 'You cannot delete this skill because it is currently in use.'];
                return back()->withNotify($notify);
            }
        }
    }

    // getting technicians data from database
    public function getTech(Request $request)
    {
        $id = $request->tech_id;
        $technician = Technician::with('skills', 'review')->findOrFail($id);
        $tech = collect($technician)->except('co_ordinates');
        $skill_sets = $technician->skills->pluck('skill_name')->toArray();
        $skill_sets_string = implode(", ", $skill_sets);

        return response()->json(
            [
                'technician' => $tech,
                'skill_sets' => $skill_sets_string,
            ],
            200
        );
    }

    public function updateStar(Request $request)
    {

        $review = Review::where('technician_id', $request->tech_id)->first();
        if ($review) {
            $review->star_value = $request->star_value;
            $review->save();
            $technician = Technician::findOrFail($request->tech_id);
            $technician->review_id = $review->id;
            $technician->save();
            return response()->json([
                'success' => 'Technician updated',
            ]);
        } else {
            return response()->json([
                'error' => 'Review not found for the specified technician',
            ]);
        }
    }

    public function updateComment(Request $request)
    {
        $review = Review::where('technician_id', $request->tech_id)->first();
        if ($review) {
            $review->comments = $request->comment;
            $review->save();
            return response()->json([
                'success' => 'comments updated',
            ]);
        } else {
            return response()->json([
                'error' => 'Review not found for the specified technician',
            ]);
        }
    }
    //begin pdf view
    public function viewPdf_coi($id_coi)
    {
        $tech = Technician::find($id_coi);

        $filePath = 'public/pdfs/' . $tech->coi_file; // Adjust the path to match your storage configuration
        if (Storage::exists($filePath)) {
            return response()->file(storage_path('app/' . $filePath));
        } else {
            abort(404, 'File not found');
        }
    }
    public function viewPdf_msa($id_msa)
    {
        $tech = Technician::find($id_msa);

        $filePath = 'public/pdfs/' . $tech->msa_file; // Adjust the path to match your storage configuration
        if (Storage::exists($filePath)) {
            return response()->file(storage_path('app/' . $filePath));
        } else {
            abort(404, 'File not found');
        }
    }
    public function viewPdf_nda($id_nda)
    {
        $tech = Technician::find($id_nda);

        $filePath = 'public/pdfs/' . $tech->nda_file; // Adjust the path to match your storage configuration
        if (Storage::exists($filePath)) {
            return response()->file(storage_path('app/' . $filePath));
        } else {
            abort(404, 'File not found');
        }
    }
    //end pdf view

    //return bulk import view
    public function importView()
    {
        $pageTitle = "Bulk Import Technicians";
        return view('admin.technicians.techImport', compact('pageTitle'));
    }

    public function import(Request $request)
    {
        $excelFile = $request->all();
        $rules = [
            'excel_file' => 'required|mimes:csv|max:5120',
        ];

        $message = [
            'excel_file.required' => 'Please select a file to upload.',
            'excel_file.mimes' => 'The uploaded file must be in CSV format.',
            'excel_file.max' => 'The file size cannot exceed 2MB.',
        ];

        $file = $request->file('excel_file');

        $validator = Validator::make($excelFile, $rules, $message);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        } else {
            Excel::import(new TechniciansImport, $file, 'csv');
            return response()->json(['success' => 'Your file was successfully imported.'], 200);
        }
    }

    public function export()
    {
        return Excel::download(new FakeTechniciansExport, 'fake_technicians.csv');
    }

    public function sampleExcel()
    {
        $filePath = storage_path('app/files/10Data_technicians.csv');
        return response()->download($filePath);
    }

    public function progress()
    {
        $progressArray = Cache::get('import-progress');
        return response()->json(['percentage' => $progressArray]);
    }
    public function checkInOut()
    {
        $pageTitle = "Technician Check-In/Out";
        $checkInOut = CheckInOut::searchable(['tech_name', 'company_name', 'date', 'time_zone'])->dateFilter()->paginate(getPaginate());
        return view('admin.technicians.check_in_out', compact('pageTitle', 'checkInOut'));
    }
    public function generatePDFCheckInOut(Request $request)
    {
        $validate = Validator::make(
            $request->all(),
            [
                'date' => 'required',
                'company_name' => 'required'
            ]
        );
        if ($validate->fails()) {
            $notify[] = ['error', 'Input date and Company field'];
            return back()->withNotify($notify);
        }
        $data = CheckInOut::where('date', $request->date)->where('company_name', $request->company_name)->get();
        $pdf = PDF::loadView('admin.technicians.pdf_check_in_out', [
            'data' => $data,
        ]);
        return $pdf->download($request->date . "-" . $request->company_name . "-" . 'checkIn_Out.pdf');
    }

    public function findClosestLocations(Request $request)
    {
        $givenLatitude = '34.5078107';
        $givenLongitude = '-113.6049543';
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
        // return response()->json(['technicians' => $completeInfo], 200);
        $json = json_encode($completeInfo, JSON_PRETTY_PRINT);
        echo "<pre>$json</pre>";
    }

    public function getLocation(Request $request)
    {
        $apiKey = config('services.locationiq.api_key');
        $address = $request->input('address');
        $encodedAddress = urlencode($address);
        $url = "https://us1.locationiq.com/v1/search?key={$apiKey}&q={$encodedAddress}&format=json";

        $response = file_get_contents($url);

        return response()->json(json_decode($response, true));
    }


    public function geocodeIndex()
    {
        $pageTitle = 'Technician Address Conversion';
        return view('admin.technicians.geocode', compact('pageTitle'));
    }

    public function techAutocomplete(Request $request)
    {
        $query = $request->input('query');
        $results = Technician::select('id', 'company_name', 'technician_id')
            ->where(function ($queryBuilder) use ($query) {
                $queryBuilder->where('company_name', 'like', '%' . $query . '%')
                    ->orWhere('technician_id', 'like', '%' . $query . '%');
            })->limit(10)->get();

        return response()->json(['results' => $results], 200);
    }

    public function assignLatLong(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'techId' => 'required',
            'tech_lat' => 'required',
            'tech_long' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }

        try {
            Technician::where('id', $request->techId)->update([
                'co_ordinates' => DB::raw("ST_GeomFromText('POINT($request->tech_long $request->tech_lat)', 4326)"),
            ]);

            return response()->json(['success' => 'Co-Ordinates updated for this technician.'], 200);
        } catch (QueryException $e) {
            return response()->json(['exceptions' => 'Failed to update co-ordinates.'], 500);
        }
    }

    public function multiAssignCoordinate()
    {
        $apiKey = config('services.locationiq.api_key');
        $technicians = Technician::whereRaw("ST_X(co_ordinates) IS NULL OR ST_Y(co_ordinates) IS NULL")->get(['id', 'address_data']);

        if (count($technicians) != 0) {
            foreach ($technicians as $technician) {
                $address['zipcode'] = $technician->address_data->zip_code;
                $address['city'] = $technician->address_data->city;
                $address['state'] = $technician->address_data->state;
                $address['country'] = $technician->address_data->country;

                $address_string = implode(", ", $address);
                $encodedAddress = urlencode($address_string);

                $url = "https://us1.locationiq.com/v1/search?key={$apiKey}&q={$encodedAddress}&format=json";
                $response = file_get_contents($url);
                $coordinates = json_decode($response, true);

                $latitude = $coordinates[0]['lat'];
                $longitude = $coordinates[0]['lon'];

                Technician::where('id', $technician->id)->update([
                    'co_ordinates' => DB::raw("ST_GeomFromText('POINT($longitude $latitude)', 4326)"),
                ]);
            }
            return response()->json(['message' => 'Coordinates updated successfully'], 200);
        } else {
            return response()->json(['warning' => 'No technician found with empty coordinates !'], 422);
        }
    }

    public function geoReverse()
    {
        $lat = "23.8698486";
        $long = "90.3978032";
        $token = config('services.locationiq.api_key');

        $url = 'https://us1.locationiq.com/v1/reverse?key=' . urlencode($token) . '&lat=' . urlencode($lat) . '&lon=' . urlencode($long) . '&format=json';

        $curl = curl_init($url);
        curl_setopt_array($curl, array(
            CURLOPT_RETURNTRANSFER    =>  true,
            CURLOPT_FOLLOWLOCATION    =>  true,
            CURLOPT_MAXREDIRS         =>  10,
            CURLOPT_TIMEOUT           =>  30,
            CURLOPT_CUSTOMREQUEST     =>  'GET',
        ));

        $response = curl_exec($curl);

        $error = curl_error($curl);

        curl_close($curl);
        echo $response;
    }
}
