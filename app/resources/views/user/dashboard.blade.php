@extends('layouts.app')
@section('content')
<div class="container-fluid navigation" style="margin-top: 30px;" id="defualtWorkOrder">
  <ul class="nav nav-tabs justify-content-center" id="myTab" role="tablist" style="background-color:#AFE1AF;">
    <li class="nav-item" role="presentation">
      <button class="nav-link active mt-4" id="work-order-tab" data-bs-toggle="tab" data-bs-target="#home" type="button" role="tab" aria-controls="home" aria-selected="true">
        <i class="fa-brands fa-first-order" style="color: green; margin-bottom:15px"></i> WO.Details
      </button>
    </li>
    <li class="nav-item" role="presentation">
      <button class="nav-link mt-4" id="notes-tab" data-bs-toggle="tab" data-bs-target="#home" type="button" role="tab" aria-controls="home" aria-selected="true"><i class="fa-regular fa-note-sticky" style="color: green; margin-bottom:15px;"></i> WO.History</button>
    </li>
    <li class="nav-item" role="presentation">
      <button class="nav-link mt-4" id="site-history-tab" data-bs-toggle="tab" data-bs-target="#home" type="button" role="tab" aria-controls="home" aria-selected="true"><i class="fa-solid fa-stethoscope" style="color: green;margin-bottom:15px;"></i> Site History</button>
    </li>
    <li class="nav-item" role="presentation">
      <button class="nav-link mt-4" id="parts" data-bs-toggle="tab" data-bs-target="#home" type="button" role="tab" aria-controls="home" aria-selected="true"><i class="fas fa-cogs" style="color: green;margin-bottom:15px;"></i> Parts</button>
    </li>
    <li class="nav-item" role="presentation">
      <button class="nav-link mt-4" id="ticket" data-bs-toggle="tab" data-bs-target="#home" type="button" role="tab" aria-controls="home" aria-selected="false"><i class="fas fa-ticket-alt" style="color: green;margin-bottom:15px;"></i> Support Tickets</button>
    </li>
    <li class="nav-item" role="presentation">
      <button class="nav-link mt-4" id="fieldTech" data-bs-toggle="tab" data-bs-target="#home" type="button" role="tab" aria-controls="home" aria-selected="true"><i class="fas fa-user-cog" style="color: green;margin-bottom:15px;"></i> Field Tech</button>
    </li>
    <li class="nav-item" role="presentation">
      <button class="nav-link mt-4" id="check_out" data-bs-toggle="tab" data-bs-target="#home" type="button" role="tab" aria-controls="home" aria-selected="true"><i class="fas fa-sign-in-alt" style="color: green;margin-bottom:15px;"></i> Check-In/Out</button>
    </li>
    {{-- <li class="nav-item" role="presentation">
      <button class="nav-link mt-4" id="tech_distance" data-bs-toggle="tab" data-bs-target="#home" type="button" role="tab" aria-controls="home" aria-selected="true"><i class="fas fa-tasks" style="color: green;margin-bottom:15px;"></i> T.Assign</button>
    </li> --}}
  </ul>
  {{-- <div class="tab-content" id="myTabContent">
    <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">...</div>
    <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">...</div>
    <div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="contact-tab">...</div>
  </div> --}}
  <div class="row justify-content-center d-none" id="workOrderSearchForm">
    <div class="col-md-12">
      @if(auth()->user()->kv == 0)
      <div class="alert alert-info" role="alert">
        <h4 class="alert-heading">@lang('KYC Verification required')</h4>
        <hr>
        <p class="mb-0">Lorem ipsum, dolor sit amet consectetur adipisicing elit. Hic officia quod natus, non dicta perspiciatis, quae repellendus ea illum aut debitis sint amet? Ratione voluptates beatae numquam. <a href="{{ route('user.kyc.form') }}">@lang('Click Here to Verify')</a></p>
      </div>
      @elseif(auth()->user()->kv == 2)
      <div class="alert alert-warning" role="alert">
        <h4 class="alert-heading">@lang('KYC Verification pending')</h4>
        <hr>
        <p class="mb-0">Lorem ipsum, dolor sit amet consectetur adipisicing elit. Hic officia quod natus, non dicta perspiciatis, quae repellendus ea illum aut debitis sint amet? Ratione voluptates beatae numquam. <a href="{{ route('user.kyc.data') }}">@lang('See KYC Data')</a></p>
      </div>
      @endif
      <div class="card shadow whole-card " style=" border-radius:0px; border-top:none ">
        <form action="" id="defaultWO" enctype="multipart/form-data">
          <div class="card-body mt-4 p-4">
            <div class="row">
              <div class="col">
                <h6><i class="fas fa-magnifying-glass" style="font-size: 13px"></i>&nbsp;Work Order</h6>
                <input name="order_id" type="text" class="form-control" id="workOrderSearchInput" placeholder="OrderId/CompanyName/Zipcode" autocomplete="off">
                <input type="hidden" name="workOrderId" id="workOrderId">
              </div>
              <div class="col">
                <h6>Requested Date</h6>
                <input name="open_date" type="text" class="form-control" value="" id="dashboardReqDate" autocomplete="off">
              </div>
              <div class="col">
                <h6>Requested By</h6>
                <input name="requested_by" type="text" class="form-control" id="dashboardReqBy">
              </div>
              <div class="col">
                <h6>Request Type</h6>
                <select name="request_type" class="form-select form-select-sm" aria-label=".form-select-sm example" id="dashboardEmailPhoneSelect">
                  <option value="Email">Email</option>
                  <option value="Phone">Phone</option>
                </select>
              </div>
              <div class="col">
                <h6>Priority</h6>
                <select name="priority" class="form-select form-select-sm" aria-label=".form-select-sm example" id="dashboardPrioritySelect">
                  <option value="1">P1</option>
                  <option value="2">P2</option>
                  <option value="3">P3</option>
                  <option value="3">P4</option>
                  <option value="3">P5</option>
                </select>
              </div>
              <div class="col">
                <h6>Complete By</h6>
                <input name="complete_by" type="text" id="dashboardCompletedBy" class="form-control" autocomplete="off">
              </div>
              <div class="col">
                <h6>Status</h6>
                <select name="status" class="form-select form-select-sm" aria-label=".form-select-sm example" id="dashboardWorkOrderStatus">
                  <option value="7">New</option>
                  <option value="8">Complete</option>
                  <option value="1">Open</option>
                  <option value="2">Dispatched</option>
                  <option value="3">Onsite</option>
                  <option value="5">Hold</option>
                  <option value="6">Closed</option>
                  <option value="4">Invoiced</option>
                </select>
              </div>
            </div>
            <div class="row mt-3">
              <div class="col-md-6">
                <h6>Project Manager</h6>
                <input type="text" class="form-control" id="dashboardPm">
              </div>
              <div class="col-md-6">
                <h6>Sales Person</h6>
                <input type="text" class="form-control" id="dashboardSp">
              </div>
              <div class="col-md-6">
                <h5><b><i class="fas fa-magnifying-glass" style="font-size: 16px"></i>&nbsp;Customer</b></h5>
                <input name="customer_id" type="text" class="form-control" id="dashboardCustomerId" placeholder="Search with Customer Name / Customer Id / Zipcode" autocomplete="off">
              </div>
              <div class="col-md-6">
                <h5><b><i class="fas fa-magnifying-glass" style="font-size: 16px"></i>&nbsp;Site</b></h5>
                <input name="site_id" type="text" class="form-control" id="dashboardSiteId" autocomplete="off" placeholder="Search with Location Name / Site Id / Zipcode">
                <span id="dashboardSiteIdErrors" style="font-size: 14px; color:red;"></span>
              </div>
              <div class="col-md-6">
                <h6>Address</h6>
                <input type="text" class="form-control" id="dashboardCustomerAddress" readonly>
              </div>
              <div class="col-md-6">
                <h6>Address</h6>
                <input type="text" class="form-control" id="dashboardSiteAddress" readonly>
              </div>
              <div class="col-md-6">
                <h6>City</h6>
                <input type="text" class="form-control" id="dashboardCustomerCity" readonly>
              </div>
              <div class="col-md-6">
                <h6>City</h6>
                <input type="text" class="form-control" id="dashboardSiteCity" readonly>
              </div>
              <div class="col-md-6">
                <h6>State</h6>
                <input type="text" class="form-control" style="width: 200px;" id="dashboardCustomerState" readonly>
              </div>
              <div class="col-md-6">
                <h6>State</h6>
                <input type="text" class="form-control" style="width: 200px;" id="dashboardSiteState" readonly>
              </div>
              <div class="col-md-6">
                <h6>Zip Code</h6>
                <input type="text" class="form-control" style="width: 200px;" id="dashboardCustomerZipcode" readonly>
              </div>
              <div class="col-md-6">
                <h6>Zip Code</h6>
                <input type="text" class="form-control" style="width: 200px;" id="dashboardSiteZipcode" readonly>
              </div>
              <div class="col-md-6">
                <h6>Phone</h6>
                <input type="text" class="form-control" style="width: 200px;" id="dashboardCustomerPhone" readonly>
              </div>
              <div class="col-md-6">
                <h6>Phone</h6>
                <input type="text" class="form-control" style="width: 200px;" readonly>
              </div>
              <div class="col-md-3 ">
                <h6>Site Contact Name</h6>
                <input name="site_contact_name" type="text" class="form-control" id="dashboardSiteContact">
              </div>
              <div class="col-md-2 ">
                <h6>Site Contact Phone</h6>
                <input name="site_contact_phone" type="text" class="form-control" id="dashboardSiteContactPhone">
              </div>
              <div class="col-md-2 ">
                <h6>Site Hours Of Operation</h6>
                <input name="h_operation" type="text" class="form-control" id="dashboardSiteHoursOp">
              </div>
              <div class="col-md-2 ">
                <h6>On Site By</h6>
                <input name="on_site_by" type="text" class="form-control" id="dashboardOnsiteBy">
              </div>
              <div class="col-md-3 ">
                <h6>Number of Techs Required</h6>
                <input name="num_tech_required" type="text" class="form-control" id="dashboardNumOfTech">
              </div>
              <div class="col-md-12 ">
                <h6>Scope Of Work</h6>
                <textarea name="scope_work" class="form-control summernote" rows="10" id="dashboardScopeOfWork"></textarea>
              </div>
              <div class="col-md-12 ">
                <h6>Deliverables</h6>
                <textarea name="deliverables" class="form-control summernote"></textarea>
              </div>
              <div class="col-md-12 ">
                <h6>Tools Required</h6>
                <textarea name="r_tools" class="form-control summernote" id="dashboardToolsRequired"></textarea>
              </div>
              <div class="col-md-12 ">
                <h6>Dispatch Instructions</h6>
                <textarea name="instruction" class="form-control summernote"></textarea>
              </div>
              <div class="col-md-12">
                <h3>Insert Image</h3>
                <input type="file" name="pictures[]" class="form-control" multiple>
              </div>

              <div class="dropdown mt-3">
                <button class="btn btn-primary dropdown-toggle m-2" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                  New Notes
                </button>
                <ul class="dropdown-menu">
                  <li><a class="dropdown-item" id="general">General Note</a></li>
                  <li><a class="dropdown-item" id="dispatch">Dispatch Note</a></li>
                  <li><a class="dropdown-item" id="bill">Billing Note</a></li>
                  <li><a class="dropdown-item" id="tech">Tech Support Note</a></li>
                  <li><a class="dropdown-item" id="close">Close Out Note</a></li>
                </ul>
              </div>
              <div class="col-md-12   d-none" id="generalNote">
                <h6>General Notes:</h6><button type="submit" class="btn btn-primary m-2">Save</button>
                <textarea name="general_notes" class="form-control summernote col-mb-12"></textarea>
              </div>
              <div class="col-md-12   d-none" id="closeOut">
                <h6>Closeout Notes:</h6><button class="btn btn-primary m-2" type="submit">Save</button>
                <textarea name="close_out_notes" class="form-control summernote col-mb-12"></textarea>
              </div>
              <div class="col-md-12  d-none" id="dNote">
                <h6>Dispatch Note:</h6><button class="btn btn-primary m-2" type="submit">Save</button>
                <textarea name="dispatch_notes" class="form-control summernote col-mb-12"></textarea>
              </div>
              <div class="col-md-12  d-none" id="bNote">
                <h6>Billing Note:</h6><button class="btn btn-primary m-2" type="submit">Save</button>
                <textarea name="billing_notes" class="form-control summernote col-mb-12"></textarea>
              </div>
              <div class="col-md-12  d-none" id="tNote">
                <h6>Tech Support Note:</h6><button class="btn btn-primary m-2" type="submit">Save</button>
                <textarea name="tech_support_notes" class="form-control summernote col-mb-12"></textarea>
              </div>
              <div class="col-12">
                <button class="btn btn-primary w-100 mt-3" type="submit" style="position: relative;">
                  <span>Submit</span>
                  <div class="spinner-border text-primary  loader d-none" role="status" style="position: absolute; top: 50%; left: 50%;  margin-top:-210px; margin-left:-15px;">
                    <span class="visually-hidden">Loading...</span>
                  </div>
                </button>
              </div>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>

<!-- new work order  -->
<div class="container-fluid" style="margin-top: 50px;">
  <div class="row justify-content-center d-none" id="workOrderCreateForm">
    <div class="col-md-12">
      @if(auth()->user()->kv == 0)
      <div class="alert alert-info" role="alert">
        <h4 class="alert-heading">@lang('KYC Verification required')</h4>
        <hr>
        <p class="mb-0">Lorem ipsum, dolor sit amet consectetur adipisicing elit. Hic officia quod natus, non dicta perspiciatis, quae repellendus ea illum aut debitis sint amet? Ratione voluptates beatae numquam. <a href="{{ route('user.kyc.form') }}">@lang('Click Here to Verify')</a></p>
      </div>
      @elseif(auth()->user()->kv == 2)
      <div class="alert alert-warning" role="alert">
        <h4 class="alert-heading">@lang('KYC Verification pending')</h4>
        <hr>
        <p class="mb-0">Lorem ipsum, dolor sit amet consectetur adipisicing elit. Hic officia quod natus, non dicta perspiciatis, quae repellendus ea illum aut debitis sint amet? Ratione voluptates beatae numquam. <a href="{{ route('user.kyc.data') }}">@lang('See KYC Data')</a></p>
      </div>
      @endif

      <div class="card shadow whole-card p-3">
        <form action="" id="WOFORM">
          <div class="card-body">
            <div class="row ">
              <div class="col ">
                <h6>Work Order</h6>
                <input name="order_id" type="text" class="form-control" id="workOrderCreateInput" readonly>
              </div>
              <div class="col">
                <h6>Requested Date</h6>
                <input name="open_date" type="text" class="form-control" value="" id="workOrderCreateReqDate" readonly autocomplete="off">
              </div>
              <div class="col">
                <h6>Requested By</h6>
                <input name="requested_by" type="text" class="form-control" id="dashboardReqBy">
              </div>
              <div class="col">
                <h6>Request Type</h6>
                <select class="form-select form-select-sm" name="request_type" aria-label=".form-select-sm example" id="dashboardEmailPhoneSelect">
                  <option value="Email">Email</option>
                  <option value="Phone">Phone</option>
                </select>
              </div>
              <div class="col">
                <h6>Priority</h6>
                <select class="form-select form-select-sm" name="priority" aria-label=".form-select-sm example">
                  <option value="1">P1</option>
                  <option value="2">P2</option>
                  <option value="3">P3</option>
                  <option value="3">P4</option>
                  <option value="3">P5</option>
                </select>
              </div>
              <div class="col">
                <h6>Complete By</h6>
                <input name="complete_by" type="text" id="completedByCreateForm" class="form-control" autocomplete="off">
              </div>
              <div class="col">
                <h6>Status</h6>
                <select name="status" class="form-select form-select-sm" aria-label=".form-select-sm example" id="workOrderCreateStatus">
                  <option value="7">New</option>
                  <option value="1">Open</option>
                  <option value="2">Dispatched</option>
                  <option value="3">Onsite</option>
                  <option value="5">Hold</option>
                  <option value="6">Closed</option>
                  <option value="4">Invoiced</option>
                </select>
              </div>
            </div>
            <div class="row mt-3">
              <div class="col-md-6">
                <h6>Project Manager</h6>
                <input type="text" class="form-control" id="customerPmCreateForm">
              </div>
              <div class="col-md-6">
                <h6>Sales Person</h6>
                <input type="text" class="form-control" id="customerSpCreateForm">
              </div>
              <div class="col-md-6">
                <h5><b><i class="fas fa-magnifying-glass" style="font-size: 16px"></i>&nbsp;Customer</b></h5>
                <input name="customer_id" type="text" class="form-control" id="CustomerIdCreateForm" autocomplete="off" placeholder="Search with Customer Name / Customer Id / Zipcode">
              </div>
              <div class="col-md-6">
                <h5><b><i class="fas fa-magnifying-glass" style="font-size: 16px"></i>&nbsp;Site</b></h5>
                <input name="site_id" type="text" class="form-control" id="siteIdCreateForm" autocomplete="off" placeholder="Search with Location Name / Site Id / Zipcode">
                <span id="siteIdCreateFormErrors" style="font-size: 14px; color:red;"></span>
              </div>
              <div class="col-md-6">
                <h6>Address</h6>
                <input type="text" class="form-control" id="customerAddressCreateForm" readonly>
              </div>
              <div class="col-md-6">
                <h6>Address</h6>
                <input type="text" class="form-control" id="siteAddressCreateForm" readonly>
              </div>
              <div class="col-md-6">
                <h6>City</h6>
                <input type="text" class="form-control" id="customerCityCreateForm" readonly>
              </div>
              <div class="col-md-6">
                <h6>City</h6>
                <input type="text" class="form-control" id="siteCityCreateForm" readonly>
              </div>
              <div class="col-md-6">
                <h6>State</h6>
                <input type="text" class="form-control" style="width: 200px;" id="customerStateCreateForm" readonly>
              </div>
              <div class="col-md-6">
                <h6>State</h6>
                <input type="text" class="form-control" style="width: 200px;" id="siteStateCreateForm" readonly>
              </div>
              <div class="col-md-6">
                <h6>Zip Code</h6>
                <input type="text" class="form-control" style="width: 200px;" id="customerZipcodeCreateForm" readonly>
              </div>
              <div class="col-md-6">
                <h6>Zip Code</h6>
                <input type="text" class="form-control" style="width: 200px;" id="siteZipcodeCreateForm" readonly>
              </div>
              <div class="col-md-6">
                <h6>Phone</h6>
                <input type="text" class="form-control" style="width: 200px;" id="customerPhoneCreateForm" readonly>
              </div>
              <div class="col-md-6">
                <h6>Phone</h6>
                <input type="text" class="form-control" style="width: 200px;" readonly>
              </div>
              <div class="col-md-3 ">
                <h6>Site Contact</h6>
                <input name="site_contact_name" type="text" class="form-control" id="dashboardSiteContact">
              </div>
              <div class="col-md-2 ">
                <h6>Site Contact Phone</h6>
                <input name="site_contact_phone" type="text" class="form-control" id="dashboardSiteContactPhone">
              </div>
              <div class="col-md-2 ">
                <h6>Site Hours Of Operation</h6>
                <input name="h_operation" type="text" class="form-control" id="dashboardSiteHoursOp">
              </div>
              <div class="col-md-2 ">
                <h6>On Site By</h6>
                <input name="on_site_by" type="text" class="form-control" id="dashboardOnsiteBy">
              </div>
              <div class="col-md-3 ">
                <h6>Number of Techs Required</h6>
                <input name="num_tech_required" type="text" class="form-control" id="dashboardNumOfTech">
              </div>
              <div class="col-12 ">
                <h6>Scope Of Work</h6>
                <textarea name="scope_work" class="form-control summernote" rows="10" id="dashboardScopeOfWork"></textarea>
              </div>
              <div class="col-md-12 ">
                <h6>Deliverables</h6>
                <textarea name="deliverables" class="form-control summernote" id="dashboardDeliverables"></textarea>
              </div>
              <div class="col-md-12 ">
                <h6>Tools Required</h6>
                <textarea name="r_tools" class="form-control summernote" id="dashboardToolsRequired"></textarea>
              </div>
              <div class="col-md-12 ">
                <h6>Dispatch Instructions</h6>
                <textarea name="instruction" class="form-control summernote" id="dashboardDispatchIns"></textarea>
              </div>
              <div class="col-12">
                <button class="btn btn-primary w-100 mt-3" type="submit">Submit</button>
              </div>
            </div>
          </div>
      </div>
      </form>
    </div>
    </form>
  </div>
</div>
</div>
<div class="container-fluid d-none" id="notes-container">
  <div class="card shadow" style="margin-top:-60px; border-top:none; border-radius:0px">
    <div class="card-body mt-4 p-4">
      <div class="row">
        <div class="form-group col-12">
          <div class="card">
            <div class="card-header">
              <h5>General Notes</h5>
            </div>
            <div class="card-body">
              <table class="table table-bordered" id="general-notes-table" style="width: 100%">
                <tr>
                  <thead class="text-nowrap">
                    <th>#</th>
                    <th>General Notes</th>
                    <th>User</th>
                    <th>Created At</th>
                    <th>Updated At</th>
                    <th>Action</th>
                  </thead>
                </tr>
                <tbody></tbody>
              </table>
            </div>
          </div>
        </div>
        <div class="form-group col-12 mt-4">
          <div class="card">
            <div class="card-header">
              <h5>Dispatch Notes</h5>
            </div>
            <div class="card-body">
              <table class="table table-bordered" id="dispatch-notes-table" style="width: 100%">
                <tr>
                  <thead class="text-nowrap">
                    <th>#</th>
                    <th>Dispatch Notes</th>
                    <th>User</th>
                    <th>Created At</th>
                    <th>Updated At</th>
                    <th>Action</th>
                  </thead>
                </tr>
                <tbody></tbody>
              </table>
            </div>
          </div>
        </div>
        <div class="form-group col-12 mt-4 ">
          <div class="card">
            <div class="card-header">
              <h5>Billing Notes</h5>
            </div>
            <div class="card-body">
              <table class="table table-bordered" id="billing-notes-table" style="width: 100%">
                <tr>
                  <thead class="text-nowrap">
                    <th>#</th>
                    <th>Billing Notes</th>
                    <th>User</th>
                    <th>Created At</th>
                    <th>Updated At</th>
                    <th>Action</th>
                  </thead>
                </tr>
                <tbody></tbody>
              </table>
            </div>
          </div>
        </div>
        <div class="form-group col-12  mt-4">
          <div class="card">
            <div class="card-header">
              <h5>Tech-Support Notes</h5>
            </div>
            <div class="card-body">
              <table class="table table-bordered" id="techSupport-notes-table" style="width: 100%">
                <tr>
                  <thead class="text-nowrap">
                    <th>#</th>
                    <th>Tech-Support Notes</th>
                    <th>User</th>
                    <th>Created At</th>
                    <th>Updated At</th>
                    <th>Action</th>
                  </thead>
                </tr>
                <tbody></tbody>
              </table>
            </div>
          </div>
        </div>
        <div class="form-group col-12  mt-4">
          <div class="card">
            <div class="card-header">
              <h5>Closeout Notes</h5>
            </div>
            <div class="card-body">
              <table class="table table-bordered" id="closeout-notes-table" style="width: 100%">
                <tr>
                  <thead class="text-nowrap">
                    <th>#</th>
                    <th>Closeout Notes</th>
                    <th>User</th>
                    <th>Created At</th>
                    <th>Updated At</th>
                    <th>Action</th>
                  </thead>
                </tr>
                <tbody></tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<div class="container-fluid d-none" id="site_history_view">
  <div class="row" style="margin-top:-60px">
    <div class="col-md-12">
      <div class="card" style="border-top: none; border-radius:0px;  ">
        <div class="card-header">
          <h3>Site History</h3>
        </div>
        <div class="card-body">
          <div class="row">
            <div class="col-6 mx-auto">
              <table class="table table-bordered text-left">
                <tr>
                  <td id="siteHCompany"></td>
                  <td id="siteHLocation"></td>
                </tr>
                <tr>
                  <td id="siteHState"></td>
                  <td id="siteHZipcode"></td>
                </tr>
                <tr>
                  <td id="siteHCity"></td>
                  <td id="siteHAddress"></td>
                </tr>
                <tr>
                  <td id="siteHtech"></td>
                  <td id="siteHname"></td>
                </tr>
                <tr>
                  <td id="siteHphone"></td>
                  <td id="siteHwork"></td>
                </tr>
                <tr>
                  <td id="siteHwcomplete"></td>
                  <td></td>
                </tr>
              </table>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<div class="container-fluid d-none" id="parts_view">
  <div class="card" style="border-top: none; border-radius:0px; margin-top:-60px ">
    <div class="card-header">
      <h3>Parts</h3>
    </div>
    <div class="card-body">
      <div class="row">
        <div class="col-md-6">
          <div class="card">
            <div class="card-header">
              <h3>Select Parts From Inventory</h3>
            </div>
            <form id="parts-form">
              <div class="card-body">
                <div class="row">
                  <div class="form-group col-6">
                    <div class="form-label">Search Parts</div>
                    <input type="text" class="form-control" id="parts-search-parts">
                    <input type="hidden" id="parts-customer-id">
                  </div>
                  <div class="form-group col-6">
                    <div class="form-label">Item Name</div>
                    <input type="text" class="form-control" id="parts-item-name" readonly>
                  </div>
                  <div class="form-group col-6">
                    <div class="form-label">Quantity Left</div>
                    <input type="text" class="form-control" id="parts-quantity" readonly>
                  </div>
                  <div class="form-group col-6">
                    <div class="form-label">Quantity Need</div>
                    <input type="text" class="form-control" id="parts-quantity-need">
                  </div>
                  <div class="form-group col-6">
                    <div class="form-label">Unit Price</div>
                    <input type="text" class="form-control" id="parts-unit-price" readonly>
                  </div>
                  <div class="form-group col-6">
                    <div class="form-label">Total Price</div>
                    <input type="text" class="form-control" id="parts-total-price" readonly>
                  </div>
                  <div class="col-12">
                    <button type="button" id="submit-inventory" class="btn btn-primary btn-sm mt-2 w-100"><i class="fas fa-sign-out-alt"></i> Submit</button>
                  </div>
                </div>
              </div>
            </form>
          </div>
        </div>
        <div class="col-6">
          <div class="card">
            <div class="card-body">
              <label style="font-weight: 600">Customer Inventory Details</label>
              <hr>
              <table class="table table-bordered">
                <thead>
                  <tr class="text-center">
                    <th>Customer Id</th>
                    <th>Company Name</th>
                    <th>Available Parts</th>
                    <th>Total Parts</th>
                  </tr>
                </thead>
                <tbody>
                  <tr class="text-center">
                    <td id="partsCusIdTd"></td>
                    <td id="partsCusNameTd"></td>
                    <td id="partsCusAvailPartsTd"></td>
                    <td id="partsCusTotalPartsTd"></td>
                  </tr>
                </tbody>
              </table>
              <div>
                <label style="font-weight: 600">Required Tools</label>
                <hr>
                <h5 id="r_tools"></h5>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<div class="container-fluid d-none" id="fieldTech_view" style="margin-top:-60px">
  <div class="card" style="border-top:none; border-radius:0px">
    <div class="card-header d-flex justify-content-between">
      <h3>Field Technician</h3>
      <button type="button" class="btn btn-success" id="findClosestTechBtn"><i class="fa fa-magnifying-glass" style="font-size: 13px;"></i>&nbsp;Find Tech</button>
    </div>
    <div class="card-body">
      <div class="row">
        <div class="col-6 mx-auto">
          <h5>Assigned Technician Details</h5>
          <table class="table table-bordered text-left">
            <tr>
              <td id="ftech_company"></td>
              <td id="ftech_country"></td>
            </tr>
            <tr>
              <td id="ftech_id"></td>
              <td id="ftech_city"></td>
            </tr>
            <tr>
              <td id="ftech_email"></td>
              <td id="ftech_state"></td>
            </tr>
            <tr>
              <td id="ftech_address"></td>
              <td id="ftech_zipcode"></td>
            </tr>
            <tr>
              <td></td>
              <td style="text-align: right" id="assignedTechMessage"></td>
            </tr>
          </table>
        </div>

      </div>
    </div>
  </div>
</div>

<div class="container-fluid d-none" id="ticket_view" style="margin-top:-60px">
  <div class="card" style="border-top: none; border-radius:0px; ">
    <div class=" card-header">
      <h3>Support Ticket</h3>
    </div>
    <div class="card-body" style="border-top: none; border-radius:0px;">
      <div class="row">
        <div class="col-md-6">
          <form action="" id="create_sub_ticket">
            <input type="hidden" name="work_order_id" id="w_id">
            <div class="form-group">
              <div class="form-label">Tech Support Note</div>
              <textarea name="tech_support_note" id="" cols="40" rows="5"></textarea>
            </div>
            <button class="btn btn-primary" type="submit">Submit</button>
          </form>
        </div>
        <div class="col-md-6">
          <table class="table table-bordered" id="sub_ticket_table" style="width: 100%">
            <tr>
              <thead class="text-nowrap">
                <th>#</th>
                <th>Tech Support Note</th>
                <th>User</th>
                <th>Created At</th>
                <th>Updated At</th>
                <th>Action</th>
              </thead>
            </tr>
            <tbody></tbody>
          </table>
        </div>
      </div>
    </div>
  </div>
</div>
<div class="container-fluid d-none" id="check_out_view" style="margin-top:-60px">
  <div class="card shadow-lg" style="border-top:none; border-radius:0px ">
    <div class="card-header d-flex">
      <h3 id="Header_time_zone"></h3>
    </div>
    <div class="card-body">
      @php
      use Carbon\Carbon;
      $date = date('m/d/y');
      $time = Carbon::now()->format('H:i:s');
      @endphp
      <div class="row">
        <div class="col-md-12">
          <div class="card ">
            <div class="card-body">
              <form action="" id="create_check_in">
                <input type="hidden" id="check_in_w_id" name="work_order_id">
                <input type="hidden" id="time_zone" name="time_zone">
                <div class="form-group">
                  <div class="form-label">Date</div>
                  <input type="text" class="form-control" name="date" value="{{$date}}" readonly>
                  <div class="form-label">Company Name</div>
                  <input type="text" class="form-control" name="company_name" id="Check_in_ftech_company" readonly>
                  <div class="form-label">Technician Name</div>
                  <input type="text" class="form-control" name="tech_name">
                  <div class="form-label">Check In</div>
                  <input type="time" class="form-control" name="check_in" value="{{$time}}">
                  <button type="submit" class="btn btn-primary mt-4 w-100">
                    <i class="fa-solid fa-right-to-bracket"></i> In
                  </button>
                </div>
              </form>
            </div>
          </div>
        </div>
        <div class="col-md-12 mt-5">
          <table class="table table-bordered" id="checkInOutTable" style="width: 100%">
            <thead class="text-nowrap">
              <tr>
                <th>#</th>
                <th>Date</th>
                <th>Company Name</th>
                <th>Tech name</th>
                <th>Check In</th>
                <th>Check Out</th>
                <th>Tot. Hours</th>
                <th>Timezone</th>
                <th>Action</th>
              </tr>
            </thead>
            <tbody>
              <!-- Table body content -->
            </tbody>
          </table>
        </div>
        @include('user.check-in-out-modal.edit')
        @include('user.check-in-out-modal.round_trip')
      </div>
    </div>
  </div>
</div>
{{-- <div class="container-fluid d-none" id="fieldTech_view" style="margin-top:-60px">
  <div class="card" style="border-top:none; border-radius:0px ">
    <div class="card-header">
      <h3>Field Technician</h3>
      
    </div>
    <div class="card-body">
      <div class="row">
        <div class="col-md-6">
          <p id="ftech_company"></p>
          <p id="ftech_id"></p>
          <p id="ftech_email"></p>
          <p id="ftech_address"></p>
        </div>
        <div class="col-md-6">
          <p id="ftech_country"></p>
          <p id="ftech_city"></p>
          <p id="ftech_state"></p>
          <p id="ftech_zipcode"></p>
        </div>
      </div>
    </div>
  </div>
</div> --}}
<div class="container-fluid d-none" id="tech_distance_view" style="margin-top:-60px">
  @include('user.distanceMeasureModal.assign')
  @include('user.distanceMeasureModal.contact')
  <div class="card" style="border-top: none; border-radius:0px; margin-top: 40px;">
    <div class="card-header">
      <h3>Measure Technician Distance</h3>
    </div>
    <div class="card-body">
      <div class="d-none" id="loader">
        <h6 class="text-dark"><strong>Please wait for the responses from google</strong></h6>
        <div class="spinner-grow text-danger" role="status">
          <span class="visually-hidden">Loading...</span>
        </div>
      </div>
      <div class="d-none" id="removable-div">
        <div class="table-responsive">
          <table class="table table-bordered text-dark" id="data-table">
            <thead class="text-nowrap">
              <tr>
                <th>Assign</th>
                <th>Technician ID</th>
                <th>Company Name</th>
                <th>Status</th>
                <th>Skill Sets</th>
                <th>Rate</th>
                <th>Travel Fee</th>
                <th>Preferred?</th>
                <th>Distance From Address</th>
                <th>Duration</th>
                <th>Is Within Radius ?</th>
                <th>Action</th>
              </tr>
            </thead>
            <tbody id="tbody"></tbody>
          </table>
        </div>
      </div>
      <div class="d-none" id="confirmation-div">
        <div class="card">
          <div class="card-body">
            <p class="text-bold" id="message"></p>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
@endsection
@push('custom_script')
@include('user.script.workorder')
@endpush