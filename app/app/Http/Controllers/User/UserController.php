<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use App\Imports\SitesImport;
use Illuminate\Http\Request;
use App\Lib\GoogleAuthenticator;
use App\Lib\FormProcessor;
use App\Models\Customer;
use App\Models\CustomerSite;
use App\Models\Form;
use App\Models\WorkOrder;
use App\Models\TicketNotes;
use App\Models\SubTicket;
use App\Models\CheckInOut;
use App\Models\Transaction;
use App\Constants\Status;
use App\CustomClass\DistanceMatrixService;
use App\Imports\CustomersImport;
use App\Imports\UserTechImport;
use App\Models\Inventory;
use App\Models\Review;
use App\Models\SkillCategory;
use App\Models\Technician;
use Illuminate\Support\Facades\Validator;
use Maatwebsite\Excel\Facades\Excel;
use Yajra\DataTables\Facades\DataTables;
use Illuminate\Database\QueryException;
use Carbon\Carbon;
use GuzzleHttp\Client;
use Illuminate\Support\Facades\Mail;
use App\Mail\MyTestMail;
use PDF;

class UserController extends Controller
{
    public function home()
    {
        $pageTitle = "Tech Yeah User";
        return view('user.dashboard', compact('pageTitle'));
    }
    public function userViewPdf()
    {

        $pageTitle = "New WorkOrder";
        $work = WorkOrder::latest()->with('customer', 'site')
            ->searchable([
                'order_id',
                'customer:company_name',
                'customer:address->zip_code',
                'site:zipcode',
                'site:location',
                'site:address_1',
            ])->dateFilter()->paginate(getPaginate());
        return view('user.workOrder.list_pdf_view', compact('pageTitle', 'work'));
    }
    public function service()
    {
        $orderId = WorkOrder::orderBy('id', 'desc')->first();
        $rand = rand(101, 999);

        if ($orderId == null) {
            $id = 0;
            $f = $id + 1;
        } else {
            $p = $orderId->id;
            $f = $p + 1;
        }
        $date = date('mdy');
        $id = $date . "-" . $rand;
        $service = new WorkOrder();
        $service->order_id = "S" . $f . $id;
        $service->open_date = date('m/d/y');
        $service->order_type = Status::SERVICE;
        $service->status = Status::NEW;
        $service->save();
        $response = [
            'message' => 'Service work order created successfully without data',
            'id' => $service->id,
        ];
        return response()->json($response);
    }
    public function project()
    {
        $orderId = WorkOrder::orderBy('id', 'desc')->first();
        $rand = rand(101, 999);

        if ($orderId == null) {
            $id = 0;
            $f = $id + 1;
        } else {
            $p = $orderId->id;
            $f = $p + 1;
        }

        $date = date('mdy');
        $id = $date . "-" . $rand;
        $project = new WorkOrder();
        $project->order_id = "P" . $f . $id;
        $project->open_date = date('m/d/y');
        $project->order_type = Status::PROJECT;
        $project->status = Status::NEW;
        $project->save();
        $response = [
            'message' => 'Project work order created successfully without data',
            'id' => $project->id,
        ];
        return response()->json($response);
    }
    public function install()
    {
        $orderId = WorkOrder::orderBy('id', 'desc')->first();
        $rand = rand(101, 999);

        if ($orderId == null) {
            $id = 0;
            $f = $id + 1;
        } else {
            $p = $orderId->id;
            $f = $p + 1;
        }
        $date = date('mdy');
        $id = $date . "-" . $rand;
        $install = new WorkOrder();
        $install->order_id = "I" . $f . $id;
        $install->open_date = date('m/d/y');
        $install->order_type = Status::INSTALL;
        $install->status = Status::NEW;
        $install->save();
        $response = [
            'message' => 'Install work order created successfully without data',
            'id' => $install->id,
        ];
        return response()->json($response);
    }

    public function fieldPopulator(Request $request)
    {
        $workOrder = WorkOrder::findOrFail($request->id);
        return response()->json($workOrder);
    }

    public function updateWorkOrder(Request $request)
    {
        // dd($request->all());
        try {
            $validator = Validator::make($request->all(), [
                'workOrderId' => 'required|exists:work_orders,id',
                'customer_id' => 'required|exists:customers,id',
                'site_id' => 'required|exists:customer_sites,id',
            ]);

            if ($validator->fails()) {
                return response(['errors' => $validator->errors()], 422);
            }

            // $find = WorkOrder::where('order_id', $request->order_id)->firstOrFail();

            // $cusId = null;
            // if ($request->customer_id) {
            //     $cusFind = Customer::where('customer_id', $request->customer_id)->first();
            //     if ($cusFind) {
            //         $cusId = $cusFind->id;
            //     } else {
            //         throw new \Exception('Customer not found.');
            //     }
            // }

            // $siteId = null;
            // if ($request->site_id) {
            //     $siteFind = CustomerSite::where('site_id', $request->site_id)->first();
            //     if ($siteFind) {
            //         $siteId = $siteFind->id;
            //     } else {
            //         throw new \Exception('Customer site not found.');
            //     }
            // }

            // $id = $find->id;

            $update = WorkOrder::find($request->workOrderId);
            $update->priority = $request->priority;
            $update->open_date = $request->open_date;
            $update->requested_by = $request->requested_by;
            $update->request_type = $request->request_type;
            $update->complete_by = $request->complete_by;
            $update->status = $request->status;
            $update->slug = $request->customer_id;
            $update->site_id = $request->site_id;
            $update->scope_work = $request->scope_work;
            $update->num_tech_required = $request->num_tech_required;
            $update->on_site_by = $request->on_site_by;
            $update->site_contact_name = $request->site_contact_name;
            $update->site_contact_phone = $request->site_contact_phone;
            $update->h_operation = $request->h_operation;
            $update->r_tools = $request->r_tools;
            $update->instruction = $request->instruction;
            $update->deliverables = $request->deliverables;
            if ($request->hasFile('pictures')) {
                $pictureFiles = $request->file('pictures');
                $fileNames = [];
                foreach ($pictureFiles as $pictureFile) {
                    $fileNamePicture = $request->workOrderId . '_' . $pictureFile->getClientOriginalName();
                    $pictureFile->move(public_path('imgs'), $fileNamePicture);
                    $fileNames[] = $fileNamePicture;
                }
                $update->pictures = json_encode($fileNames);
            }
            $update->save();

            if ($request->general_notes || $request->billing_notes || $request->tech_support_notes || $request->close_out_notes || $request->dispatch_notes) {
                $note = new TicketNotes();
                $note->work_order_id = $request->workOrderId;
                $note->auth_id = auth()->id();
                $note->general_notes = $request->general_notes;
                $note->billing_notes = $request->billing_notes;
                $note->tech_support_notes = $request->tech_support_notes;
                $note->close_out_notes = $request->close_out_notes;
                $note->dispatch_notes = $request->dispatch_notes;
                $note->save();
            }

            $response = [
                'message' => 'Work order updated successfully',
                'id' => $request->workOrderId
            ];

            return response()->json($response);
        } catch (\Exception $e) {
            $response = [
                'errors' => 'A fatal error occured while we processing your request.'
            ];
            return response()->json($response, 500);
        }
    }
    public function subTicket(Request $request)
    {
        try {
            $subTicket = new SubTicket();
            $subTicket->work_order_id = $request->work_order_id;
            $subTicket->auth_id = auth()->id();
            $subTicket->tech_support_note = $request->tech_support_note;
            $subTicket->save();

            $response = [
                'message' => 'Sub ticket created successfully',
                'id' => $request->work_order_id
            ];
            return response()->json($response);
        } catch (QueryException $e) {
            $errorMessage = 'Error creating sub ticket. Please try again.';
            return response()->json(['error' => $errorMessage], 500);
        }
    }

    public function checkIn(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'tech_name' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }

        if ($request->work_order_id) {
            $company = WorkOrder::where('id', $request->work_order_id)->with('technician')->first();
            $companyName = $company->technician->company_name;
        } else {
            return response()->json(['techNotFound' => 'Technician not found. Please assign a technician first.'], 404);
        }

        $currentTime = Carbon::now()->toTimeString();

        $existingCheckIn = CheckInOut::where('work_order_id', $request->work_order_id)
            ->where('tech_name', $request->tech_name)
            ->whereDate('created_at', Carbon::today())
            ->first();

        if ($existingCheckIn) {
            $response = [
                'errors' => 'This technician has already checked in within the past 24 hours',
            ];
            return response()->json($response, 400);
        }

        $checkIn = new CheckInOut();
        $checkIn->work_order_id = $request->work_order_id;
        $checkIn->time_zone = $request->time_zone;
        $checkIn->date = $request->date;
        $checkIn->tech_name = $request->tech_name;
        $checkIn->company_name = $companyName;
        $checkIn->check_in = $request->check_in;
        $checkIn->save();

        $workOrder = WorkOrder::find($request->work_order_id);
        $workOrder->status = Status::ONSITE;
        $workOrder->save();

        $response = [
            'message' => 'Check In successfully',
            'id' => $request->work_order_id
        ];

        return response()->json($response);
    }

    public function initiateCheckOut($id)
    {
        $type = request()->get('type', 'complete');
        $checkOutTime = date('H:i:s');
        $CheckIn = CheckInOut::find($id);
        if ($CheckIn) {
            $lastCheckIn = $CheckIn
                ->whereNotNull('check_in')
                ->whereNull('check_out')
                ->first();
            if ($lastCheckIn) {
                $lastCheckIn->check_out = $checkOutTime;
                $checkInTime = Carbon::createFromFormat('H:i:s', $lastCheckIn->check_in);
                $checkOutTime = Carbon::createFromFormat('H:i:s', $checkOutTime);
                $totalMinutes  = $checkInTime->diffInMinutes($checkOutTime);
                $totalHours = floor($totalMinutes / 60);
                $remainingMinutes = $totalMinutes % 60;
                $lastCheckIn->total_hours = $totalHours . ':' . $remainingMinutes;
                $lastCheckIn->save();

                $workOrder = WorkOrder::find($lastCheckIn->work_order_id);
                $workOrder->status = ($type === 'round_trip') ? Status::ONSITE : Status::COMPLETE;
                $workOrder->save();

                $response = [
                    'message' => ucfirst($type) . ' Check Out successfully for ' . $lastCheckIn->tech_name,
                    'id' => $lastCheckIn->work_order_id,
                    'total_hours' => $lastCheckIn->total_hours,
                ];
            } else {
                $response = [
                    'message' => 'checked out already',
                    'id' => $CheckIn->work_order_id,
                ];
            }
        }

        return response()->json($response);
    }

    public function checkOutEdit(Request $request, $id)
    {
        // Validate the incoming request data
        $request->validate([
            'tech_name' => 'required|string',
            'check_in' => 'required|date_format:H:i:s',
        ]);

        $checkInOut = CheckInOut::findOrFail($id);

        $checkInOut->tech_name = $request->tech_name;
        $checkInOut->check_in = $request->check_in;
        $checkInOut->check_out = $request->check_out;
        $checkInTime = Carbon::createFromFormat('H:i:s', $request->check_in);
        $checkOutTime = Carbon::createFromFormat('H:i:s', $request->check_out);
        $totalMinutes  = $checkInTime->diffInMinutes($checkOutTime);
        $totalHours = floor($totalMinutes / 60);
        $remainingMinutes = $totalMinutes % 60;
        $checkInOut->total_hours = $totalHours . ':' . $remainingMinutes;
        $checkInOut->save();
        return response()->json(['message' => 'Check-in/out record updated successfully'], 200);
    }

    public function checkOutDelete($id)
    {
        $delete = CheckInOut::find($id);
        $delete->delete();
        return response()->json(['message' => 'Check-in/out record deleted successfully'], 200);
    }


    public function orderIdsiteHistory($id)
    {
        $grab = WorkOrder::with('technician')->findOrFail($id);
        if ($grab->technician === null) {
            $errors = [
                'tech_error' => 'Currently no tech is assigned to this order.',
                'site_error' => 'No site history found.',

            ];
            return response()->json($errors, 404);
        }
        $siteId = $grab->site_id;
        $site = CustomerSite::with('customer', 'workOrder.technician')->where('id', $siteId)->first();
        $i = $site->workOrder->status == Status::CLOSED;
        $siteIdMain = [
            'company_name' => @$site->customer->company_name,
            'location' => $site->location,
            'address_1' => $site->address_1,
            'city' => $site->city,
            'state' => $site->state,
            'zipcode' => $site->zipcode,
            'time_zone' => $site->time_zone,
            'num_tech_required' => $grab->num_tech_required,
            'site_contact_name' => $grab->site_contact_name,
            'site_contact_phone' => $grab->site_contact_phone,
            'r_tools' => $grab->r_tools,
            'fcompany_name' => @$grab->technician->company_name,
            'technician_id' => @$grab->technician->technician_id,
            'ftech_email' => @$grab->technician->email,
            'ftech_address' => @$grab->technician->address_data->address,
            'ftech_country' => @$grab->technician->address_data->country,
            'ftech_city' => @$grab->technician->address_data->city,
            'ftech_state' => @$grab->technician->address_data->state,
            'ftech_zipcode' => @$grab->technician->address_data->zip_code,
            'w_id' => @$grab->id,
            'wT' => @$site->workOrder->where('site_id', $siteId)->count(),
            'wC' => @$site->workOrder->where('site_id', $siteId)->where('status', $i)->count(),
        ];

        $response = [
            'result' => $siteIdMain,
            'tech_message' => "",
            'site_message' => "",
        ];

        return response()->json($response, 200);
    }


    public function Onsite()
    {
        if (request()->ajax()) {
            $query = WorkOrder::OnsiteTicket()->select('id', 'order_id');
            return DataTables::of($query)
                ->addIndexColumn()
                ->make(true);
        }
        $pageTitle = "Onsite Ticket";
        $details = WorkOrder::OnsiteTicket()->get();
        return response()->json(['pageTitle' => $pageTitle, 'details' => $details]);
    }
    public function ticketUpdate(Request $request)
    {
        $requestData = $request->all();
        $rules = [
            'id' => 'required',
            'a_instruction' => 'required'
        ];

        $validator = Validator::make($requestData, $rules);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        } else {
            $workOrder = WorkOrder::findOrFail($requestData['id']);
            $workOrder->a_instruction = $requestData['a_instruction'];
            $workOrder->save();
            return response()->json(['success' => 'Ticket updated successfully.'], 200);
        }
    }

    public function detailsOrder($orderId)
    {
        $id = WorkOrder::where('order_id', $orderId)->first();
        $id = $id->id;
        $view = WorkOrder::with('site', 'customer', 'technician')->find($id);
        return response()->json(['view' => @$view]);
    }
    public function depositHistory(Request $request)
    {
        $pageTitle = 'Deposit History';
        $deposits = auth()->user()->deposits()->searchable(['trx'])->with(['gateway'])->orderBy('id', 'desc')->paginate(getPaginate());
        return view('user.deposit_history', compact('pageTitle', 'deposits'));
    }

    public function userData()
    {
        $user = auth()->user();
        if ($user->profile_complete == 1) {
            return to_route('user.home');
        }
        $pageTitle = "User Data";
        return view('user.user_data', compact('pageTitle', 'user'));
    }

    public function userDataSubmit(Request $request)
    {
        $user = auth()->user();
        if ($user->profile_complete == 1) {
            return to_route('user.home');
        }
        $request->validate([
            'firstname' => 'required',
            'lastname' => 'required',
        ]);
        $user->firstname = $request->firstname;
        $user->lastname = $request->lastname;
        $user->address = [
            'country' => @$user->address->country,
            'address' => $request->address,
            'state' => @$request->state,
            'zip' => $request->zip,
            'city' => $request->city,
        ];
        $user->profile_complete = 1;
        $user->save();
        $notify[] = ['success', 'Registration process completed successfully'];
        return to_route('user.home')->withNotify($notify);
    }

    public function show2faForm()
    {
        $general = gs();
        $ga = new GoogleAuthenticator();
        $user = auth()->user();
        $secret = $ga->createSecret();
        $qrCodeUrl = $ga->getQRCodeGoogleUrl($user->username . '@' . $general->site_name, $secret);
        $pageTitle = '2FA Setting';
        return view('user.twofactor', compact('pageTitle', 'secret', 'qrCodeUrl'));
    }

    public function create2fa(Request $request)
    {
        $user = auth()->user();
        $this->validate($request, [
            'key' => 'required',
            'code' => 'required',
        ]);
        $response = verifyG2fa($user, $request->code, $request->key);
        if ($response) {
            $user->tsc = $request->key;
            $user->ts = 1;
            $user->save();
            $notify[] = ['success', 'Google authenticator activated successfully'];
            return back()->withNotify($notify);
        } else {
            $notify[] = ['error', 'Wrong verification code'];
            return back()->withNotify($notify);
        }
    }

    public function disable2fa(Request $request)
    {
        $this->validate($request, [
            'code' => 'required',
        ]);

        $user = auth()->user();
        $response = verifyG2fa($user, $request->code);
        if ($response) {
            $user->tsc = null;
            $user->ts = 0;
            $user->save();
            $notify[] = ['success', 'Two factor authenticator deactivated successfully'];
        } else {
            $notify[] = ['error', 'Wrong verification code'];
        }
        return back()->withNotify($notify);
    }

    public function transactions()
    {
        $pageTitle = 'Transactions';
        $remarks = Transaction::distinct('remark')->orderBy('remark')->get('remark');

        $transactions = Transaction::where('user_id', auth()->id())->searchable(['trx'])->filter(['trx_type', 'remark'])->orderBy('id', 'desc')->paginate(getPaginate());

        return view('user.transactions', compact('pageTitle', 'transactions', 'remarks'));
    }


    public function kycForm()
    {
        if (auth()->user()->kv == 2) {
            $notify[] = ['error', 'Your KYC is under review'];
            return to_route('user.home')->withNotify($notify);
        }
        if (auth()->user()->kv == 1) {
            $notify[] = ['error', 'You are already KYC verified'];
            return to_route('user.home')->withNotify($notify);
        }
        $pageTitle = 'KYC Form';
        $form = Form::where('act', 'kyc')->first();
        return view('user.kyc.form', compact('pageTitle', 'form'));
    }

    public function kycData()
    {
        $user = auth()->user();
        $pageTitle = 'KYC Data';
        return view('user.kyc.info', compact('pageTitle', 'user'));
    }

    public function kycSubmit(Request $request)
    {
        $form = Form::where('act', 'kyc')->first();
        $formData = $form->form_data;
        $formProcessor = new FormProcessor();
        $validationRule = $formProcessor->valueValidation($formData);
        $request->validate($validationRule);
        $userData = $formProcessor->processFormData($request, $formData);
        $user = auth()->user();
        $user->kyc_data = $userData;
        $user->kv = 2;
        $user->save();

        $notify[] = ['success', 'KYC data submitted successfully'];
        return to_route('user.home')->withNotify($notify);
    }

    public function attachmentDownload($fileHash)
    {
        $filePath = decrypt($fileHash);
        $extension = pathinfo($filePath, PATHINFO_EXTENSION);
        $general = gs();
        $title = slug($general->site_name) . '- attachments.' . $extension;
        $mimetype = mime_content_type($filePath);
        header('Content-Disposition: attachment; filename="' . $title);
        header("Content-Type: " . $mimetype);
        return readfile($filePath);
    }

    public function autoComplete(Request $request)
    {
        $query = $request->input('query');
        $results = Customer::select('id', 'customer_id', 'company_name')
            ->where(function ($queryBuilder) use ($query) {
                $queryBuilder->where('company_name', 'like', '%' . $query . '%')
                    ->orWhere('customer_id', 'like', '%' . $query . '%');
            })
            ->limit(10)
            ->get();

        return response()->json(['results' => $results], 200);
    }

    public function getCustomer(Request $request)
    {
        $customer = Customer::findOrfail($request->id);
        $data = [
            'address' => $customer->address->address,
            'city' => $customer->address->city,
            'state' => $customer->address->state,
            'zipcode' => $customer->address->zip_code,
            'phone' => $customer->phone,
            'email' => $customer->email,
            'project_manager' => $customer->project_manager,
            'sales_person' => $customer->sales_person,
        ];
        return response()->json($data, 200);
    }

    public function storeSite(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'customer_id' => 'required',
            'location' => 'required',
            'address_1' => 'required',
            'site_id' => 'required',
            'city' => 'required',
            'state' => 'required',
            'zipcode' => 'required',
            'timezone' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }

        $site = new CustomerSite();
        $site->customer_id = $request->customer_id;
        $site->site_id = $request->site_id;
        $site->description = $request->description;
        $site->location = $request->location;
        $site->address_1 = $request->address_1;
        $site->address_2 = $request->address_2;
        $site->city = $request->city;
        $site->state = $request->state;
        $site->zipcode = $request->zipcode;
        $site->time_zone = $request->timezone;
        $site->save();
        return response()->json(['success' => 'Site created successfully.'], 200);
    }

    public function getSite(Request $request)
    {
        $site = CustomerSite::with('customer')->findOrFail($request->id);
        $response = [
            'address' => $site->address_1,
            'city' => $site->city,
            'state' => $site->state,
            'zipcode' => $site->zipcode,
            'customer' => $site->customer->company_name,
            'time_zone' => $site->time_zone,
        ];

        return response()->json(['result' => $response], 200);
    }

    public function siteAutoComplete(Request $request)
    {
        $query = $request->input('query');
        $customerId = $request->input('id');
        $results = CustomerSite::select('id', 'site_id', 'location', 'customer_id', 'zipcode')
            ->where('customer_id', $customerId)
            ->where(function ($queryBuilder) use ($query) {
                $queryBuilder->where('site_id', 'like', '%' . $query . '%')
                    ->orWhere('zipcode', 'like', '%' . $query . '%')
                    ->orWhere('location', 'like', '%' . $query . '%');
            })
            ->limit(10)
            ->get();

        if (!$customerId) {
            return response()->json(['errors' => 'Please select a customer first.'], 422);
        }

        return response()->json(['results' => $results], 200);
    }

    public function siteModalAutoComplete(Request $request)
    {
        $query = $request->input('query');
        $results = CustomerSite::select('id', 'site_id', 'location', 'zipcode', 'customer_id')
            ->where(function ($queryBuilder) use ($query) {
                $queryBuilder->where('site_id', 'like', '%' . $query . '%')
                    ->orWhere('zipcode', 'like', '%' . $query . '%')
                    ->orWhere('location', 'like', '%' . $query . '%');
            })
            ->limit(10)
            ->get();

        return response()->json(['results' => $results], 200);
    }

    public function customerAutoComplete(Request $request)
    {
        $query = $request->input('query');
        $results = Customer::select('id', 'customer_id', 'address', 'company_name')
            ->where('customer_id', 'like', '%' . $query . '%')
            ->orWhere('address->zip_code', 'like', '%' . $query . '%')
            ->orWhere('company_name', 'like', '%' . $query . '%')
            ->limit(10)
            ->get();

        if ($results->isEmpty()) {
            return response()->json(['error' => 'No results found'], 404);
        }

        return response()->json(['results' => $results], 200);
    }

    public function siteImport(Request $request)
    {

        $excelFile = $request->all();
        $rules = [
            'site_excel_file' => 'required|mimes:csv',
            'customer_id' => 'required',
        ];
        $messages = [
            'customer_id.required' => 'Please select a customer.',
            'site_excel_file.required' => 'Please select a excel file.',
            'site_excel_file.mimes' => 'Please select a excel file with csv extension.'
        ];
        $validator = Validator::make($excelFile, $rules, $messages);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        } else {
            Excel::import(new SitesImport($request->customer_id), $request->file('site_excel_file'), 'csv');
            return response()->json(['success' => 'Your file was successfully imported.'], 200);
        }
    }

    public function sampleSiteExcel()
    {
        $filePath = storage_path('app/files/site_import.csv');
        return response()->download($filePath);
    }

    public function getWorkOrderSearch(Request $request)
    {
        $query = $request->input('query');

        $results = WorkOrder::leftJoin('customer_sites', 'work_orders.site_id', '=', 'customer_sites.id')
            ->leftJoin('customers', 'work_orders.slug', '=', 'customers.id')
            ->select('work_orders.id', 'work_orders.order_id', 'work_orders.site_id', 'work_orders.slug', 'customers.company_name')
            ->where('work_orders.order_id', 'like', '%' . $query . '%')
            ->orWhere('customer_sites.zipcode', 'like', '%' . $query . '%')
            ->orWhere('customers.company_name', 'like', '%' . $query . '%')
            ->limit(10)
            ->get();

        return response()->json(['results' => $results], 200);
    }

    public function getWorkOrderData(Request $request)
    {
        $workOrder = WorkOrder::with('customer', 'site')->findOrfail($request->id);
        $dataArray = [
            'customer_id' => $workOrder->customer->customer_id,
            'customer_address' => $workOrder->customer->address->address,
            'customer_city' => $workOrder->customer->address->city,
            'customer_state' => $workOrder->customer->address->state,
            'customer_zipcode' => $workOrder->customer->address->zip_code,
            'customer_phone' => $workOrder->customer->phone,
            'scope_work' => $workOrder->scope_work,
            'tools_required' => $workOrder->r_tools,
            'deliverables' => $workOrder->deliverables,
            'instruction' => $workOrder->instruction,
            'customer_site_id' => $workOrder->site->site_id,
            'customer_site_address' => $workOrder->site->address_1,
            'customer_site_city' => $workOrder->site->city,
            'customer_site_state' => $workOrder->site->state,
            'customer_site_zipcode' => $workOrder->site->zipcode,
            'site_contact' => $workOrder->site_contact_name,
            'site_contact_phone' => $workOrder->site_contact_phone,
            'site_hours_operation' => $workOrder->h_operation,
            'onsite_by' => $workOrder->on_site_by,
            'number_of_tech' => $workOrder->num_tech_required,
            'requested_date' => $workOrder->open_date,
            'requested_by' => $workOrder->requested_by,
            'completed_by' => $workOrder->complete_by,
            'request_type' => $workOrder->request_type,
            'status' => $workOrder->status,
            'priority' => $workOrder->priority,
            'project_manager' => $workOrder->customer->project_manager,
            'sales_person' => $workOrder->customer->sales_person,
            'customerId' => $workOrder->slug,
            'siteId' => $workOrder->site_id,
        ];
        return response()->json(['result' => $dataArray], 200);
    }

    public function generalNotes(Request $request)
    {
        $generalNotes = TicketNotes::with('userData:id,firstname,lastname')
            ->select('id', 'general_notes', 'auth_id', 'created_at', 'updated_at')
            ->where('work_order_id', $request->id)
            ->whereNotNull('general_notes')
            ->get();

        $generalNotes = $generalNotes->map(function ($note) {
            $note->general_notes = strip_tags($note->general_notes);
            return $note;
        });

        return DataTables::of($generalNotes)
            ->addIndexColumn()
            ->addColumn('formatted_created_at', function ($note) {
                return Carbon::parse($note->created_at)->format('Y-m-d h:i:s A');
            })
            ->addColumn('formatted_updated_at', function ($note) {
                return Carbon::parse($note->updated_at)->format('Y-m-d h:i:s A');
            })
            ->rawColumns(['formatted_created_at', 'formatted_updated_at'])
            ->make(true);
    }

    public function dispatchNotes(Request $request)
    {
        $dispatchNotes = TicketNotes::with('userData:id,firstname,lastname')
            ->select('id', 'dispatch_notes', 'auth_id', 'created_at', 'updated_at')
            ->where('work_order_id', $request->id)
            ->whereNotNull('dispatch_notes')
            ->get();

        $dispatchNotes = $dispatchNotes->map(function ($note) {
            $note->dispatch_notes = strip_tags($note->dispatch_notes);
            return $note;
        });

        return DataTables::of($dispatchNotes)
            ->addIndexColumn()
            ->addColumn('formatted_created_at', function ($note) {
                return Carbon::parse($note->created_at)->format('Y-m-d h:i:s A');
            })
            ->addColumn('formatted_updated_at', function ($note) {
                return Carbon::parse($note->updated_at)->format('Y-m-d h:i:s A');
            })
            ->rawColumns(['formatted_created_at', 'formatted_updated_at'])
            ->make(true);
    }

    public function billingNotes(Request $request)
    {
        $billinghNotes = TicketNotes::with('userData:id,firstname,lastname')
            ->select('id', 'billing_notes', 'auth_id', 'created_at', 'updated_at')
            ->where('work_order_id', $request->id)
            ->whereNotNull('billing_notes')
            ->get();

        $billinghNotes = $billinghNotes->map(function ($note) {
            $note->billing_notes = strip_tags($note->billing_notes);
            return $note;
        });

        return DataTables::of($billinghNotes)
            ->addIndexColumn()
            ->addColumn('formatted_created_at', function ($note) {
                return Carbon::parse($note->created_at)->format('Y-m-d h:i:s A');
            })
            ->addColumn('formatted_updated_at', function ($note) {
                return Carbon::parse($note->updated_at)->format('Y-m-d h:i:s A');
            })
            ->rawColumns(['formatted_created_at', 'formatted_updated_at'])
            ->make(true);
    }

    public function techSupportNotes(Request $request)
    {
        $techSupportNotes = TicketNotes::with('userData:id,firstname,lastname')
            ->select('id', 'tech_support_notes', 'auth_id', 'created_at', 'updated_at')
            ->where('work_order_id', $request->id)
            ->whereNotNull('tech_support_notes')
            ->get();

        $techSupportNotes = $techSupportNotes->map(function ($note) {
            $note->tech_support_notes = strip_tags($note->tech_support_notes);
            return $note;
        });

        return DataTables::of($techSupportNotes)
            ->addIndexColumn()
            ->addColumn('formatted_created_at', function ($note) {
                return Carbon::parse($note->created_at)->format('Y-m-d h:i:s A');
            })
            ->addColumn('formatted_updated_at', function ($note) {
                return Carbon::parse($note->updated_at)->format('Y-m-d h:i:s A');
            })
            ->rawColumns(['formatted_created_at', 'formatted_updated_at'])
            ->make(true);
    }

    public function closeoutNotes(Request $request)
    {
        $closeoutNotes = TicketNotes::with('userData:id,firstname,lastname')
            ->select('id', 'close_out_notes', 'auth_id', 'created_at', 'updated_at')
            ->where('work_order_id', $request->id)
            ->whereNotNull('close_out_notes')
            ->get();

        $closeoutNotes = $closeoutNotes->map(function ($note) {
            $note->close_out_notes = strip_tags($note->close_out_notes);
            return $note;
        });

        return DataTables::of($closeoutNotes)
            ->addIndexColumn()
            ->addColumn('formatted_created_at', function ($note) {
                return Carbon::parse($note->created_at)->format('Y-m-d h:i:s A');
            })
            ->addColumn('formatted_updated_at', function ($note) {
                return Carbon::parse($note->updated_at)->format('Y-m-d h:i:s A');
            })
            ->rawColumns(['formatted_created_at', 'formatted_updated_at'])
            ->make(true);
    }
    public function workOrderSubTicket(Request $request)
    {
        $subTicket = SubTicket::with('userData:id,firstname,lastname')->select('id', 'tech_support_note', 'auth_id', 'created_at', 'updated_at')->where('work_order_id', $request->id)->whereNotNull('tech_support_note');
        return DataTables::of($subTicket)
            ->addIndexColumn()
            ->addColumn('formatted_created_at', function ($note) {
                return Carbon::parse($note->created_at)->format('Y-m-d h:i:s A');
            })
            ->addColumn('formatted_updated_at', function ($note) {
                return Carbon::parse($note->updated_at)->format('Y-m-d h:i:s A');
            })
            ->rawColumns(['formatted_created_at', 'formatted_updated_at'])
            ->make(true);
    }
    public function checkInOutTable(Request $request)
    {

        $checkInOut = CheckInOut::latest('id', 'date', 'company_name', 'tech_name', 'check_in', 'check_out', 'total_hours', 'time_zone')->where('work_order_id', $request->id);

        return DataTables::of($checkInOut)
            ->addIndexColumn()
            ->make(true);
    }

    //customer parts details
    public function customerParts(Request $request)
    {
        $workOrder = WorkOrder::select('id', 'slug')->findOrFail($request->work_order_id);
        $customerinventory = Inventory::with('customer:id,customer_id,company_name')->where('customer_id', $workOrder->slug)->first();
        $inventoryItem = Inventory::select('item_name')->where('customer_id', $workOrder->slug)->count();
        $inventoryItemTotal = Inventory::where('customer_id', $workOrder->slug)->sum('quantity');

        $response = [
            'customerinventory' => $customerinventory,
            'inventoryItem' => $inventoryItem,
            'inventoryItemTotal' => $inventoryItemTotal,
        ];

        return response()->json($response, 200);
    }

    public function inventoryAutoComplete(Request $request)
    {
        $query = $request->input('query');
        $results = Inventory::select('id', 'part_number', 'ty_part_number')
            ->where('customer_id', $request->customer_id)
            ->where(function ($queryBuilder) use ($query) {
                $queryBuilder->where('part_number', 'like', '%' . $query . '%')
                    ->orWhere('ty_part_number', 'like', '%' . $query . '%');
            })
            ->limit(10)
            ->get();

        return response()->json(['results' => $results], 200);
    }

    public function inventoryItem(Request $request)
    {
        $inventory = Inventory::where('id', $request->id)->first();
        return response()->json($inventory);
    }

    public function inventoryCalculation(Request $request)
    {
        $item = Inventory::find($request->item_id);
        $total_price = '$' . (int)$item->raw_unit_cost * (int)$request->item_value;
        return response()->json($total_price);
    }

    public function skills()
    {
        $skillsets = SkillCategory::all();
        if ($skillsets) {
            return response()->json($skillsets);
        }
    }

    public function newSkill(Request $request)
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

        return response()->json(['message' => 'Skill Saved.'], 200);
    }

    public function newTech(Request $request)
    {
        // dd($request->all());
        $validator = Validator::make($request->all(), [
            'company_name' => 'required|max:100',
            'address' => 'required|max:100',
            'city' => 'required|max:100',
            'state' => 'required|max:100',
            'zip_code' => 'required|max:5',
            'email' => 'required|email',
            'rate' => 'required|numeric',
            'radius' => 'required|max:100',
            'travel_fee' => 'required|numeric',
            'terms' => 'required',
            'phone' => 'required|max:15',
            'primary_contact_email' => 'email|nullable',
            'primary_contact' => 'max:255',
            'country' => 'max:100',
            'title' => 'max:255',
            'cell_phone' => 'max:15',
            'status' => 'max:40',
            'coi_expire_date' => 'date|nullable',
            'msa_expire_date' => 'date|nullable',
            'coi_file' => 'mimes:pdf|max:2048',
            'msa_file' => 'mimes:pdf|max:2048',
            'nda_file' => 'mimes:pdf|max:2048'
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }

        // generating unique 5 digit id starting with 5000
        $fTech = Technician::latest('id')->first();
        if ($fTech == null) {
            $firstReg = 0;
            $fTechId = $firstReg + 1;
            if ($fTechId < 10) {
                $id = '5000' . $fTechId;
            } elseif ($fTechId < 100) {
                $id = '500' . $fTechId;
            } elseif ($fTechId < 1000) {
                $id = '50' . $fTechId;
            } elseif ($fTechId < 10000) {
                $id = '5' . $fTechId;
            } elseif ($fTechId < 100000) {
                $id = '5' . $fTechId;
            }
        } else {
            $id = $fTech->id;
            $fTechId = $id + 1;
            if ($fTechId < 10) {
                $id = '5000' . $fTechId;
            } elseif ($fTechId < 100) {
                $id = '500' . $fTechId;
            } elseif ($fTechId < 1000) {
                $id = '50' . $fTechId;
            } elseif ($fTechId < 10000) {
                $id = '5' . $fTechId;
            } elseif ($fTechId < 100000) {
                $id = '5' . $fTechId;
            }
        }

        $addressData = [
            'address' => $request->address,
            'country' => $request->country,
            'city' => $request->city,
            'state' => $request->state,
            'zip_code' => $request->zip_code
        ];

        $skillsIds = $request->skill_id;
        $technician = new Technician();
        $technician->company_name = $request->company_name;
        $technician->address_data = $addressData;
        $technician->email = $request->email;
        $technician->primary_contact_email = $request->primary_contact_email;
        $technician->phone = $request->phone;
        $technician->primary_contact = $request->primary_contact;
        $technician->title = $request->title;
        $technician->cell_phone = $request->cell_phone;
        $technician->rate = $request->rate;
        $technician->radius = $request->radius;
        $technician->travel_fee = $request->travel_fee;
        $technician->status = $request->status;
        $technician->coi_expire_date = $request->coi_expire_date;
        $technician->msa_expire_date = $request->msa_expire_date;
        $technician->nda = $request->nda;
        $technician->terms = $request->terms;
        $technician->preference = $request->preference;
        $technician->technician_id = $id;

        //pdf store here
        if ($request->coi_file) {
            $pdfFile = $request->file('coi_file');
            $pdfFileNameCoi = $id . '_' . $pdfFile->getClientOriginalName();
            $pdfFile->storeAs('pdfs', $pdfFileNameCoi, 'public');
            $technician->coi_file = $pdfFileNameCoi;
        }
        if ($request->msa_file) {
            $pdfFile = $request->file('msa_file');
            $pdfFileNameMsa = $id . '_' . $pdfFile->getClientOriginalName();
            $pdfFile->storeAs('pdfs', $pdfFileNameMsa, 'public');
            $technician->msa_file = $pdfFileNameMsa;
        }
        if ($request->nda_file) {
            $pdfFile = $request->file('nda_file');
            $pdfFileNameNda = $id . '_' . $pdfFile->getClientOriginalName();
            $pdfFile->storeAs('pdfs', $pdfFileNameNda, 'public');
            $technician->nda_file = $pdfFileNameNda;
        }
        //end pdf
        $technician->save();
        $review = new Review();
        $review->technician_id = $technician->id;
        $review->save();
        $technician->skills()->attach($skillsIds);

        return response()->json(['success' => 'New technician added.'], 200);
    }

    public function ftechAuto(Request $request)
    {
        $query = $request->input('query');
        $results = Technician::select('id', 'technician_id', 'company_name')
            ->where(function ($queryBuilder) use ($query) {
                $queryBuilder->where('technician_id', 'like', '%' . $query . '%')
                    ->orWhere('company_name', 'like', '%' . $query . '%');
            })
            ->limit(10)
            ->get();

        return response()->json(['results' => $results], 200);
    }

    public function techData(Request $request)
    {
        $technician = Technician::with('skills')->findOrFail($request->id);

        $skill_sets = $technician->skills->pluck('skill_name')->toArray();
        $imploded = implode(", ", $skill_sets);
        $response = collect($technician)->except('created_at', 'updated_at', 'available', 'co_ordinates');

        $array = [
            'tech' => $response,
            'skills' => $imploded
        ];

        return response()->json($array);
    }

    public function techImport(Request $request)
    {
        $excelFile = $request->all();
        $rules = [
            'ftech_csv_file' => 'required|mimes:csv|max:5120',
        ];

        $message = [
            'ftech_csv_file.required' => 'Please select a file to upload.',
            'ftech_csv_file.mimes' => 'The uploaded file must be in CSV format.',
            'ftech_csv_file.max' => 'The file size cannot exceed 5MB.',
        ];

        $validator = Validator::make($excelFile, $rules, $message);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        } else {
            Excel::import(new UserTechImport, $request->file('ftech_csv_file'), 'csv');
            return response()->json(['success' => 'Your file was successfully imported.'], 200);
        }
    }

    public function techExcel()
    {
        $filePath = storage_path('app/files/10Data_technicians.csv');
        return response()->download($filePath);
    }

    public function customerImport(Request $request)
    {
        // dd($request->all());
        $excelFile = $request->all();

        $rules = [
            'customer_csv_file' => 'required',
        ];

        $message = [
            'customer_csv_file.required' => 'Please select a file to upload.',
            'customer_csv_file.mimes' => 'The uploaded file must be in CSV format.',
            // 'customer_csv_file.max' => 'The file size cannot exceed 5MB.',
        ];

        $validator = Validator::make($excelFile, $rules, $message);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        } else {
            Excel::import(new CustomersImport, $request->file('customer_csv_file'));
            return response()->json(['success' => 'Your file was successfully imported.'], 200);
        }
    }

    public function customerExcel()
    {
        $filePath = storage_path('app/files/example_customer.csv');
        return response()->download($filePath);
    }

    public function storeCustomer(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'company_name' => 'required|max:100',
            'address' => 'required|max:100',
            'customer_type' => 'required|max:100',
            'phone' => 'required|max:15',
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }

        // generating unique 5 digit id starting with 6000
        $customer = Customer::latest('id')->first();
        if ($customer == null) {
            $firstReg = 0;
            $customerId = $firstReg + 1;
            if ($customerId < 10) {
                $id = '6000' . $customerId;
            } elseif ($customerId < 100) {
                $id = '600' . $customerId;
            } elseif ($customerId < 1000) {
                $id = '60' . $customerId;
            } elseif ($customerId < 10000) {
                $id = '6' . $customerId;
            }
        } else {
            $id = $customer->id;
            $customerId = $id + 1;
            if ($customerId < 10) {
                $id = '6000' . $customerId;
            } elseif ($customerId < 100) {
                $id = '600' . $customerId;
            } elseif ($customerId < 1000) {
                $id = '60' . $customerId;
            } elseif ($customerId < 10000) {
                $id = '6' . $customerId;
            } elseif ($customerId < 100000) {
                $id = '6' . $customerId;
            }
        }

        $addressData = [
            'address' => $request->address,
            'country' => $request->country,
            'city' => $request->city,
            'state' => $request->state,
            'zip_code' => $request->zip_code
        ];

        $customer = new Customer();
        $customer->company_name = $request->company_name;
        $customer->address = $addressData;
        $customer->email = $request->email;
        $customer->customer_type = $request->customer_type;
        $customer->phone = $request->phone;
        $customer->s_rate = $request->s_rate;
        $customer->e_rate = $request->e_rate;
        $customer->travel = $request->travel;
        $customer->billing_term = $request->billing_term;
        $customer->type_phone = $request->type_phone;
        $customer->type_pos = $request->type_pos;
        $customer->type_wireless = $request->type_wireless;
        $customer->type_cctv = $request->type_cctv;
        $customer->team = $request->team;
        $customer->sales_person = $request->sales_person;
        $customer->project_manager = $request->project_manager;
        $customer->customer_id = $id;
        $customer->save();

        return response()->json(['success' => 'New customer added.'], 200);
    }

    public function customerSearch(Request $request)
    {
        $query = $request->input('query');
        $results = Customer::select('id', 'customer_id', 'company_name')
            ->where(function ($queryBuilder) use ($query) {
                $queryBuilder->where('customer_id', 'like', '%' . $query . '%')
                    ->orWhere('company_name', 'like', '%' . $query . '%');
            })
            ->limit(10)
            ->get();

        return response()->json(['results' => $results], 200);
    }

    public function fetchCustomer(Request $request)
    {
        $customer = Customer::findOrFail($request->id);
        // dd($customer);
        $response = collect($customer)->except('created_at', 'updated_at');
        return response()->json($response);
    }

    public function geocode()
    {
        $client = new Client();
        $address = 'Uttara+Sector+7+Park+Dhaka+Bangladesh';
        try {
            $response = $client->request('GET', 'https://geocode.maps.co/search?q={$address}&api_key=65965e39afdc6447994546gcz5fbdb1');
            $statusCode = $response->getStatusCode();

            if ($statusCode == 200) {
                $data = $response->getBody()->getContents();
                return response()->json(['data' => $data]);
            } else {
                return response()->json(['error' => 'Failed to fetch data'], $statusCode);
            }
        } catch (\GuzzleHttp\Exception\RequestException $e) {
            return response()->json(['error' => $e->getMessage()], $e->getCode());
        }
    }

    public function getResponse(Request $request)
    {
        // dd($request->all());
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

        $destination = $request->input('destination');

        $origin = "NewYork,USA";
        $apiKey = config('services.google.api_key');

        $url = "https://maps.googleapis.com/maps/api/distancematrix/json?origins=$origin&destinations=$destination&key=$apiKey";
        $client = new Client();
        $data = $client->get($url);
        $response = json_decode($data->getBody(), true);

        return response()->json($response);
    }


    public function findWorkOrder(Request $request)
    {

        $workOrder = WorkOrder::with('site', 'technician')->find($request->id);

        if (!$workOrder) {
            return response()->json(['message' => 'Work order not found. Please search the work order first.'], 404);
        }

        if ($workOrder->technician === null) {
            $site = $workOrder->site;

            if (!$site) {
                return response()->json(['message' => 'Site information is missing. Please update the work order.'], 400);
            }

            $addressParts = [
                $site->address_1,
                $site->city,
                $site->state,
                $site->zipcode,
            ];

            $addressString = implode(", ", array_filter($addressParts));

            return response()->json($addressString, 200);
        } else {
            return response()->json(['message' => 'This work order already have technician assigned.'], 404);
        }
    }
    public function ifNullWorkOrder(Request $request)
    {
        $workOrder = WorkOrder::find($request->id);
        if (!$workOrder) {
            return response()->json(['message' => 'Work order not found. Please search the work order first.'], 404);
        }
    }

    public function distanceResponse(Request $request)
    {
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

        $destination = $request->input('destination');

        $technicians = Technician::AvailableFtech()->get(['id', 'address_data']);
        if ($technicians->isEmpty()) {
            return response()->json(['errors' => "No available technicians found!"], 404);
        }
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


    public function assignTech(Request $request)
    {
        $orderId = $request->workOrderId;
        $workOrder = WorkOrder::find($orderId);
        $workOrder->ftech_id = $request->ftech_id;
        $workOrder->status = Status::DISPATCHED;
        $workOrder->save();
        $tAvailable = Technician::find($workOrder->ftech_id);
        $tAvailable->available = Status::DISABLE;
        $tAvailable->save();

        $id = [
            $workOrder->id,
        ];

        $response = [
            'id' => $id,
            'message' => 'Technician assigning successful for the selected work order.'
        ];

        $this->sendWorkOrder($orderId, $tAvailable->email);

        return response()->json($response, 200);
    }

    private function sendWorkOrder($orderId, $techEmail)
    {
        //mail sending code
        $to = $techEmail;
        $sub = "Work order details of TechYeah";
        $body = 'http://127.0.0.1:8000/user/pdf/user/work/order/download/' . $orderId;
        $sender = "Tech Yeah";

        $emailData = [
            'subject' => $sub,
            'body' => $body,
            'to' => $to,
            'sender' => $sender,
        ];

        try {
            Mail::to($to)->send(new MyTestMail($emailData));
            return response()->json(['message' => 'Email sent successfully']);
        } catch (\Exception $e) {
            return response()->json(['message' => 'Email failed to send', 'error' => $e->getMessage()], 500);
        }
    }


    public function sendMail(Request $request)
    {
        $to = $request->to_email;
        $subject = $request->subject;
        $body = $request->body_text;
        $sender = 'Tech-Yeah';

        $emailData = [
            'subject' => $subject,
            'body' => $body,
            'to' => $to,
            'sender' => $sender,
        ];

        try {
            Mail::to($to)->send(new MyTestMail($emailData));
            return response()->json(['message' => 'Email sent successfully']);
        } catch (\Exception $e) {
            return response()->json(['message' => 'Email failed to send', 'error' => $e->getMessage()], 500);
        }
    }
    public function wODelete($id)
    {
        $w = WorkOrder::find($id);
        $w->delete();
        $notify[] = ['success', 'delete success'];
        return back()->withNotify($notify);
    }
}
