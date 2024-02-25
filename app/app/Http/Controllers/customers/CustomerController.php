<?php

namespace App\Http\Controllers\customers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Constants\Status;
use App\Models\Customer;
use App\Models\CustomerSite;
use App\Models\SkillCategory;
use App\Models\Technician;
use App\Models\VendorCareList;
use App\Models\WorkOrder;
use App\Models\CustomerInvoice;
use App\Models\workOrderPerformed;
use Illuminate\Support\Facades\Validator;
use PDF;
use Yajra\DataTables\Facades\DataTables;


class CustomerController extends Controller
{
    public function index()
    {
        if (request()->ajax()) {
            $query = Customer::select('id', 'customer_id', 'company_name', 'customer_type', 's_rate', 'e_rate', 'travel');
            return DataTables::of($query)
                ->addIndexColumn()
                ->make(true);
        }

        $pageTitle = "Customer List";
        $customers = Customer::all();
        return $this->viewCustomer($pageTitle, $customers);
    }
    private function viewCustomer($pageTitle, $customers)
    {
        return view('admin.customers.index', compact('pageTitle', 'customers'));
    }
    public function customerWithOrder()
    {
        if (request()->ajax()) {
            $query = Customer::WithOrder()->select('id', 'customer_id', 'company_name', 'customer_type', 's_rate', 'e_rate', 'travel');
            return DataTables::of($query)
                ->addIndexColumn()
                ->make(true);
        }
        $pageTitle = "Customer With Order";
        $customers = Customer::WithOrder()->get();
        return $this->viewCustomer($pageTitle, $customers);
    }
    public function create()
    {
        $pageTitle = "Customer Registration";
        return view('admin.customers.create', compact('pageTitle'));
    }

    //site store
    public function sites(Request $request)
    {
        // dd($request->all());
        $validator = Validator::make($request->all(), [
            'customer_id' => 'required',
            'location' => 'required',
            'address_1' => 'required',
            // 'address_2' => 'required',
            'city' => 'required',
            'state' => 'required',
            'zipcode' => 'required',
            // 'description' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }
        // generating unique 5 digit id starting with 7000
        $site = CustomerSite::latest('id')->first();
        if ($site == null) {
            $firstReg = 0;
            $siteId = $firstReg + 1;
            if ($siteId < 10) {
                $sid = '7000' . $siteId;
            } elseif ($siteId < 100) {
                $sid = '700' . $siteId;
            } elseif ($siteId < 1000) {
                $sid = '70' . $siteId;
            } elseif ($siteId < 10000) {
                $sid = '7' . $siteId;
            }
        } else {
            $sid = $site->id;
            $siteId = $sid + 1;
            if ($siteId < 10) {
                $sid = '7000' . $siteId;
            } elseif ($siteId < 100) {
                $sid = '700' . $siteId;
            } elseif ($siteId < 1000) {
                $sid = '70' . $siteId;
            } elseif ($siteId < 10000) {
                $sid = '7' . $siteId;
            }
        }

        $cusSite = new CustomerSite();
        $cusSite->customer_id = $request->customer_id;
        $cusSite->site_id = $sid;
        $cusSite->description = $request->description;
        $cusSite->location = $request->location;
        $cusSite->address_1 = $request->address_1;
        $cusSite->address_2 = $request->address_2;
        $cusSite->city = $request->city;
        $cusSite->state = $request->state;
        $cusSite->zipcode = $request->zipcode;
        $cusSite->save();

        return response()->json(['message' => 'Site added successfully'], 200);
    }
    //end site

    //begin site list
    public function siteList()
    {
        $pageTitle = "Customer Site List";
        $sites = CustomerSite::with('customer')->get();
        return view('admin.customers.site', compact('pageTitle', 'sites'));
    }
    //end site List

    //edit siteList
    public function editSite($id)
    {
        $pageTitle = "Edit Site";
        $edit = CustomerSite::with('customer')->get()->find($id);
        return view('admin.customers.edit_site', compact('pageTitle', 'edit'));
    }
    public function deleteSite($id)
    {
        $site = CustomerSite::with('customer')->findOrFail($id);
        $customerId = $site->customer->id;
        $site->delete();
        $notify[] = ['success', 'Site deleted successfully'];
        return redirect()->route('customer.customerZone', ['id' => $customerId])->withNotify($notify);
    }
    public function editSitePost(Request $request, $id)
    {
        $request->validate([
            'company_name' => 'required',
            's_rate' => 'required',
            'e_rate' => 'required',
            'description' => 'required',
            'location' => 'required',
            'address_1' => 'required',
            'address_2' => 'required',
            'city' => 'required',
            'state' => 'required',
        ]);

        $update = CustomerSite::find($id);

        $update->description = $request->description;
        $update->location = $request->location;
        $update->address_1 = $request->address_1;
        $update->address_2 = $request->address_2;
        $update->city = $request->city;
        $update->state = $request->state;
        $update->zipcode = $request->zipcode;
        $update->save();
        if ($request->s_rate && $request->e_rate && $request->company_name) {
            $cUpdate = Customer::find($update->customer_id);
            $cUpdate->company_name = $request->company_name;
            $cUpdate->s_rate = $request->s_rate;
            $cUpdate->e_rate = $request->e_rate;
            $cUpdate->save();
        }
        $notify[] = ['success', 'Customer Site updated successful'];
        return back()->withNotify($notify);
    }
    //end edit siteList

    //create customer
    public function storeCustomer(Request $request)
    {
        $request->validate([
            'company_name' => 'required|max:100',
            'address' => 'required|max:100',
            'customer_type' => 'required|max:100',
            // 'email' => 'required|email',
            'phone' => 'required|max:15',
            // 's_rate' => 'required|numeric',
            // 'e_rate' => 'required|numeric',
            // 'travel' => 'max:255',
            // 'billing_term' => 'max:15',
            // 'type_phone' => 'required',
            // 'type_pos' => 'required',
            // 'type_wireless' => 'required',
            // 'type_cctv' => 'required',
            // 'team' => 'required',
            // 'sales_person' => 'required',
            // 'project_manager' => 'required',
        ]);

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

        $notify[] = ['success', 'Customer registration successful'];
        return redirect()->route('customer.index')->withNotify($notify);
    }
    //end create customer

    //edit customer
    public function cusEdit($id)
    {
        $pageTitle = "Customer Edit";
        $edit = Customer::find($id);
        return view('admin.customers.edit_customer', compact('pageTitle', 'edit'));
    }
    public function cusDelete($id)
    {
        $customer = Customer::findOrFail($id);

        if ($customer->workOrder()->exists()) {
            $notify[] = ['error', 'Cannot delete customer with associated work orders'];
            return redirect()->route('customer.index')->withNotify($notify);
        }

        try {
            $customer->delete();
            $notify[] = ['success', 'Customer deleted successfully'];
            return redirect()->route('customer.index')->withNotify($notify);
        } catch (\Exception $e) {
            $notify[] = ['error', 'Failed to delete customer. Please try again'];
            return redirect()->route('customer.index')->withNotify($notify);
        }
    }

    public function cusEditPost(Request $request, $id)
    {
        $request->validate([
            'company_name' => 'required|max:100',
            'address' => 'required|max:100',
            'customer_type' => 'required|max:100',
            'email' => 'required|email',
            'phone' => 'required|max:15',
            // 's_rate' => 'required|numeric',
            // 'e_rate' => 'required|numeric',
            // 'travel' => 'max:255',
            // 'billing_term' => 'max:15',
            // 'type_phone' => 'required',
            // 'type_pos' => 'required',
            // 'type_wireless' => 'required',
            // 'type_cctv' => 'required',
            // 'team' => 'required',
            // 'sales_person' => 'required',
            // 'project_manager' => 'required',
        ]);
        $addressData = [
            'address' => $request->address,
            'country' => $request->country,
            'city' => $request->city,
            'state' => $request->state,
            'zip_code' => $request->zip_code
        ];

        $update = Customer::find($id);

        $update->company_name = $request->company_name;
        $update->email = $request->email;
        $update->customer_type = $request->customer_type;
        $update->phone = $request->phone;
        $update->address = $addressData;
        $update->s_rate = $request->s_rate;
        $update->e_rate = $request->e_rate;
        $update->travel = $request->travel;
        $update->billing_term = $request->billing_term;
        $update->type_phone = $request->type_phone;
        $update->type_pos = $request->type_pos;
        $update->type_wireless = $request->type_wireless;
        $update->type_cctv = $request->type_cctv;
        $update->team = $request->team;
        $update->sales_person = $request->sales_person;
        $update->project_manager = $request->project_manager;
        $update->save();

        $notify[] = ['success', 'Customer Update successful!'];
        return back()->withNotify($notify);
    }

    //Ajax get company name
    public function getComName($id)
    {
        $customer = Customer::find($id);

        if ($customer) {
            return response()->json(['company_name' => $customer->company_name]);
        }

        return response()->json(['company_name' => 'Customer not found']);
    }

    //vendor care list
    public function vendorCareCreate(Request $request)
    {
        $request->validate([
            'site_id' => 'required',
            'technician_id' => 'required',
            'priority' => 'required',
            'fha_rate' => 'required',
        ]);

        // generating unique 5 digit id starting with 8000
        $customer = VendorCareList::orderBy('id', 'desc')->first();
        if ($customer == null) {
            $firstReg = 0;
            $customerId = $firstReg + 1;
            if ($customerId < 10) {
                $id = '8000' . $customerId;
            } elseif ($customerId < 100) {
                $id = '800' . $customerId;
            } elseif ($customerId < 1000) {
                $id = '80' . $customerId;
            } elseif ($customerId < 10000) {
                $id = '8' . $customerId;
            }
        } else {
            $id = $customer->id;
            $customerId = $id + 1;
            if ($customerId < 10) {
                $id = '8000' . $customerId;
            } elseif ($customerId < 100) {
                $id = '800' . $customerId;
            } elseif ($customerId < 1000) {
                $id = '80' . $customerId;
            } elseif ($customerId < 10000) {
                $id = '8' . $customerId;
            }
        }


        $vendorCare = new VendorCareList();

        $vendorCare->order_id = $id;
        $vendorCare->site_id = $request->site_id;
        $vendorCare->technician_id = $request->technician_id;
        $vendorCare->priority = $request->priority;
        $vendorCare->fha_rate = $request->fha_rate;
        $vendorCare->save();

        $notify[] = ['success', 'data store successful!'];
        return back()->withNotify($notify);
    }

    public function vendorCare()
    {
        $pageTitle = "Vendor List Care";

        $vendorCare = VendorCareList::with('site.customer', 'tech')->get();
        $sites = CustomerSite::all();
        $technicians = Technician::all();
        return view('admin.customers.vendor_care', compact('pageTitle', 'vendorCare', 'sites', 'technicians'));
    }

    //customer zone
    public function customerZone($id)
    {
        $pageTitle = "Customer Zone";
        $zone = Customer::find($id);
        $sites = CustomerSite::where('customer_id', $id)->get();
        $workOrders = WorkOrder::where('slug', $id)->get();
        $data = ["sites" => $sites, "workOrders" => $workOrders];

        if (request()->ajax()) {
            return response()->json($data, 200, [], JSON_PRETTY_PRINT)
                ->header('Cache-Control', 'no-cache, no-store, must-revalidate')
                ->header('Pragma', 'no-cache')
                ->header('Expires', '0');
        } else {
            return view('admin.customers.customer_zone', compact('pageTitle', 'zone', 'sites'));
        }
    }

    //begin work order
    public function workOrderAll()
    {
        $pageTitle = "All Work Order List";
        $orderData = $this->orderSearch();
        $workOrders = $orderData['data'];
        return view('admin.customers.all_work_list', compact('pageTitle', 'workOrders'));
    }
    public function orderSearch()
    {
        $workOrders = WorkOrder::with(['site']);
        $workOrders = $workOrders->searchable(['order_id'])->dateFilter();
        return [
            'data' => $workOrders->orderBy('id', 'desc')->paginate(getPaginate()),
        ];
    }
    public function editOrder($id)
    {
        $pageTitle = "Edit Work Order";
        $edit = WorkOrder::with('site', 'customer')->find($id);
        $imageFileNames = json_decode($edit->pictures); // Decode the JSON array.
        return view('admin.customers.work_order_edit', compact('pageTitle', 'edit', 'imageFileNames'));
    }
    public function editPost(Request $request, $id)
    {
        $request->validate([
            'h_operation' => 'required',
            'main_tel' => 'required',
            'site_contact_name' => 'required',
            'site_contact_phone' => 'required',
            'date_schedule' => 'required',
            'e_checkin' => 'required',
            'l_checkin' => 'required',
            'instruction' => 'required',
            'a_instruction' => 'required',
            'r_tools' => 'required',
            'scope_work' => 'required',
            'arrival' => 'required',
            'leaving' => 'required',
        ]);

        $update = WorkOrder::find($id);

        $update->h_operation = $request->h_operation;
        $update->main_tel = $request->main_tel;
        $update->site_contact_name = $request->site_contact_name;
        $update->site_contact_phone = $request->site_contact_phone;
        $update->date_schedule = $request->date_schedule;
        $update->e_checkin = $request->e_checkin;
        $update->l_checkin = $request->l_checkin;
        $update->instruction = $request->instruction;
        $update->a_instruction = $request->a_instruction;
        $update->r_tools = $request->r_tools;
        $update->scope_work = $request->scope_work;
        $update->arrival = $request->arrival;
        $update->leaving = $request->leaving;
        if ($request->hasFile('pictures')) {
            // Retrieve the existing pictures from the database.
            $existingPictures = json_decode($update->pictures, true);

            // Initialize an array to store the new file names.
            $newFileNames = [];

            // Loop through the new pictures and process them.
            foreach ($request->file('pictures') as $pictureFile) {
                $fileNamePicture = $id . '_' . $pictureFile->getClientOriginalName();
                $pictureFile->move(public_path('imgs'), $fileNamePicture);

                // Add the new file name to the array.
                $newFileNames[] = $fileNamePicture;
            }

            // Check if existingPictures is an array and not null.
            if (is_array($existingPictures)) {
                foreach ($existingPictures as $existingPicture) {
                    $pathToDelete = public_path('imgs/' . $existingPicture);
                    if (file_exists($pathToDelete)) {
                        unlink($pathToDelete);
                    }
                }
            }

            // Store the new file names in the database as a JSON string.
            $update->pictures = json_encode($newFileNames);

            // You can choose to store the JSON string in the database or perform other actions as needed.
        }

        if ($request->project_manager && $request->phone && $request->email) {
            $cUpdate = Customer::find($update->slug);
            $cUpdate->project_manager = $request->project_manager;
            $cUpdate->phone = $request->phone;
            $cUpdate->email = $request->email;
            $cUpdate->save();
        }
        if ($request->location && $request->address_1 && $request->address_2 && $request->city && $request->state && $request->zipcode) {
            $sUpdate = CustomerSite::find($update->site_id);
            $sUpdate->location = $request->location;
            $sUpdate->address_1 = $request->address_1;
            $sUpdate->address_2 = $request->address_2;
            $sUpdate->city = $request->city;
            $sUpdate->state = $request->state;
            $sUpdate->zipcode = $request->zipcode;
            $sUpdate->save();
        }
        $update->save();
        $notify[] = ['success', 'Work Order Data Updated successful!'];
        return back()->withNotify($notify);
    }
    public function orderCreate(Request $request)
    {
        $formData = $request->all();

        $validationRules = [
            'site_id' => 'required',
            'h_operation' => 'required',
            'main_tel' => 'required',
            'site_contact_name' => 'required',
            'site_contact_phone' => 'required',
            'date_schedule' => 'required',
            'e_checkin' => 'required',
            'l_checkin' => 'required',
            'instruction' => 'required',
            'a_instruction' => 'required',
            'r_tools' => 'required',
            'scope_work' => 'required',
            'arrival' => 'required',
            'leaving' => 'required',
            'picture' => 'mimes:jpeg,png,jpg,gif',
        ];
        $message = [
            'site_id.required' => 'Site location is required',
            'h_operation.required' => 'Hours of operation is required',
            'main_tel.required' => 'Main telephone is required',
            'site_contact_name.required' => 'Site contact name is required',
            'site_contact_phone.required' => 'Site contact phone is required',
            'date_schedule.required' => 'Date schedule is required',
            'e_checkin.required' => 'Earliest checkIn is required',
            'l_checkin.required' => 'Leatest checkIn is required',
            'instruction.required' => 'Instruction is required',
            'a_instruction.required' => 'Additional instuction is required',
            'r_tools.required' => 'Required tools is required',
            'scope_work.required' => 'Scope of work is required',
            'arrival.required' => 'Upon arrival on site is required',
            'leaving.required' => 'Before leaving site is required',
            // 'picture.required' => 'Attached picture is required',
        ];

        $validator = Validator::make($formData, $validationRules, $message);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }

        $orderId = WorkOrder::orderBy('id', 'desc')->first();
        $rand = rand(101, 999);

        if ($orderId == null) {
            $id = 0;
            $f = $id + 1;
        } else {
            $p = $orderId->id;
            $f = $p + 1;
        }
        $date = date('dmy');
        $open_date = date('m/d/y');
        $id = $date . "-" . $rand;
        $workOrder = new WorkOrder();

        $workOrder->site_id = $request->site_id;
        $workOrder->open_date = $open_date;
        $workOrder->order_id =  $f . $id;
        $workOrder->h_operation = $request->h_operation;
        $workOrder->main_tel = $request->main_tel;
        $workOrder->site_contact_name = $request->site_contact_name;
        $workOrder->site_contact_phone = $request->site_contact_phone;
        $workOrder->date_schedule = $request->date_schedule;
        $workOrder->e_checkin = $request->e_checkin;
        $workOrder->l_checkin = $request->l_checkin;
        $workOrder->instruction = $request->instruction;
        $workOrder->a_instruction = $request->a_instruction;
        $workOrder->r_tools = $request->r_tools;
        $workOrder->scope_work = $request->scope_work;
        $workOrder->arrival = $request->arrival;
        $workOrder->leaving = $request->leaving;
        $workOrder->slug = $request->slug;
        $workOrder->status = 1;

        if ($request->hasFile('pictures')) {
            $pictureFiles = $request->file('pictures');

            $fileNames = [];

            foreach ($pictureFiles as $pictureFile) {
                $fileNamePicture = $id . '_' . $pictureFile->getClientOriginalName();
                $pictureFile->move(public_path('imgs'), $fileNamePicture);

                $fileNames[] = $fileNamePicture;
            }
            $workOrder->pictures = json_encode($fileNames);
        }
        if ($request->hasFile('documents')) {
            $pdfs = $request->file('documents');
            $filesArray = [];

            foreach ($pdfs as $pdf) {
                $fileName = $id . '_' . $pdf->getClientOriginalName();
                $pdf->move(public_path('docs'), $fileName);
                $filesArray[] = $fileName;
            }
            $workOrder->documents = json_encode($filesArray);
        }

        $workOrder->save();
        $invoice = new CustomerInvoice();
        $invoice->invoice_number = getNumber();
        $invoice->work_order_id = $workOrder->id;
        $invoice->save();
        return response()->json(['message' => 'Work order created successfully'], 200);
    }
    public function viewOrder($id)
    {
        $pageTitle = "Work Order View";
        $views = WorkOrder::with('site', 'customer', 'technician')->find($id);
        $wps = workOrderPerformed::where('work_order_id', $id)->get();
        $imageFileNames = json_decode($views->pictures); // Decode the JSON array.
        $btnOpen = @$views->status == Status::OPEN;
        $btnDispatch = @$views->status == Status::DISPATCHED;
        $btnWorkOperation = @$views->status == Status::ONSITE;
        $btnInvoice = @$views->status == Status::INVOICED;
        $btnClosed = @$views->status == Status::CLOSED;
        return view('admin.customers.work_order_view', compact('pageTitle', 'views', 'imageFileNames', 'wps', 'btnWorkOperation', 'btnInvoice', 'btnClosed', 'btnDispatch', 'btnOpen'));
    }
    public function deleteOrder($id)
    {
        $delete = WorkOrder::findOrFail($id);
        $customerId = $delete->customer->id;
        $delete->delete();
        $notify[] = ['success', 'Work Order deleted successfully'];
        return redirect()->route('customer.customerZone', ['id' => $customerId])->withNotify($notify);
    }

    public function ajax()
    {
        $skills = SkillCategory::all();
        return response()->json($skills);
    }

    //begin customer invoice 
    public function allInvoice()
    {
        $pageTitle = "Invoice History";
        $invoices = WorkOrder::with('invoice', 'customer')->searchable(['order_id'])->dateFilter()->orderBy('id', 'desc')->paginate(getPaginate());
        return view('admin.customers.invoices.all_invoice', compact('pageTitle', 'invoices'));
    }
    public function paidInvoice()
    {
        $pageTitle = "Paid Invoices";
        $invoices = WorkOrder::PaidInvoice()->searchable(['order_id'])->dateFilter()->orderBy('id', 'desc')->paginate(getPaginate());
        return view('admin.customers.invoices.paid_invoice', compact('pageTitle', 'invoices'));
    }
    public function dueInvoice()
    {
        $pageTitle = "Due Invoices";
        $invoices = WorkOrder::DueInvoice()->searchable(['order_id'])->dateFilter()->orderBy('id', 'desc')->paginate(getPaginate());
        return view('admin.customers.invoices.due_invoice', compact('pageTitle', 'invoices'));
    }
    public function viewInvoice($id)
    {
        $pageTitle = "Customer Invoice";
        $invoice = WorkOrder::with('invoice', 'customer', 'site')->find($id);
        $wps = workOrderPerformed::where('work_order_id', $id)->get();
        $price = $wps->sum('price');
        $totalPrice = $price + 0.26;
        return view('admin.customers.invoices.index', compact('pageTitle', 'invoice', 'wps', 'totalPrice', 'price'));
    }
    public function pdfInvoice($id)
    {

        $pageTitle = "Download Pdf";
        $invoice = WorkOrder::with('invoice', 'customer', 'site')->find($id);
        $wps = workOrderPerformed::where('work_order_id', $id)->get();
        $price = $wps->sum('price');
        $totalPrice = $price + 0.26;
        $pdf = PDF::loadView('admin.customers.invoices.pdf', compact('pageTitle', 'invoice', 'wps', 'price', 'totalPrice'))->setOptions(['defaultFont' => 'sans-serif']);
        $pdf->setPaper('A4', 'portrait');
        $customerCompanyName = $invoice->customer->company_name;
        $fileName = $customerCompanyName . '_Invoice.pdf';

        return $pdf->download($fileName);
    }
    public function pdfWorkOrder($id)
    {

        $pageTitle = "Download Work Order";
        $views = WorkOrder::with('site', 'customer')->find($id);
        $wps = workOrderPerformed::where('work_order_id', $id)->get();
        $imageFileNames = json_decode($views->pictures); // Decode the JSON array.
        $pdf = PDF::loadView('admin.customers.work_order_pdf', compact('pageTitle', 'views', 'wps', 'imageFileNames'))->setOptions(['defaultFont' => 'sans-serif']);
        $pdf->setPaper('A4', 'portrait');
        $customerCompanyName = $views->customer->company_name;
        $fileName = $customerCompanyName . '_Work_Order.pdf';

        return $pdf->download($fileName);
    }


    public function workPerform(Request $request)
    {

        $validator = Validator::make($request->all(), [
            'quantity' => 'required',
            'price' => 'required',
            'description' => 'required',
            'work_request' => 'required',
            'work_perform' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }

        $date = date('m/d/y');

        $wp = workOrderPerformed::where('work_order_id', $request->work_order_id)->orderByDesc('created_at')->first();
        if (!empty($wp->date)) {
            $checkDate = $wp->date == $date;
        } else {
            $checkDate = $wp;
        }
        if ($checkDate) {
            // Update an existing record
            $wp->quantity = $request->quantity;
            $wp->price = $request->price;
            $wp->description = $request->description;
            $wp->work_request = $request->work_request;
            $wp->work_perform = $request->work_perform;
            $wp->save();
        } else {
            // Create a new record
            $wp = new workOrderPerformed();
            $wp->work_order_id = $request->work_order_id;
            $wp->quantity = $request->quantity;
            $wp->price = $request->price;
            $wp->description = $request->description;
            $wp->work_request = $request->work_request;
            $wp->work_perform = $request->work_perform;
            $wp->date = $date;
            $wp->save();
        }

        return response()->json(['message' => 'Work Perform ' . ($wp->wasRecentlyCreated ? 'added' : 'updated') . ' successfully'], 200);
    }
}
