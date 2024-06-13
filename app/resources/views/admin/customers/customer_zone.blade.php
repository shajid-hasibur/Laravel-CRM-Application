@extends('admin.layoutsNew.app')
@section('script')
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/css/select2.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="{{ asset('assetsNew/main_css/customer/customer_zone.css') }}">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.8/js/select2.min.js" defer></script>
@endsection
@section('content')
    <div class="content-wrapper" style="background-color: white;">
        @include('admin.includeNew.breadcrumb')
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container-fluid">
                <a class="navbar-brand" href="{{ url('/customer/customer/zone') }}/{{ $zone->id }}">
                    <h1><span class="badge bg-secondary">{{ $zone->customer_id }}</span></h1>
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                    aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 text-center">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page"
                                href="{{ url('/customer/customer/zone') }}/{{ $zone->id }}">
                                <h4><span class="badge bg-success">{{ $zone->company_name }}</span></h4>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="{{ route('customer.index') }}"><b>All Customer</b></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#"><b>Inventory</b></a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                                data-bs-toggle="dropdown" aria-expanded="false">
                                <b>Action</b>
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item"
                                        href="{{ url('/customer/edit/customer') }}/{{ $zone->id }}">About Customer
                                        Edit</a></li>
                                <li>
                                    <hr class="dropdown-divider">
                                    <h6 class="text-center"><span class="badge-danger">Danger Zone</span></h6>
                                </li>
                                <li><a class="dropdown-item"
                                        href="{{ url('/customer/delete/customer') }}/{{ $zone->id }}">Delete This
                                        Customer</a></li>
                            </ul>
                        </li>
                    </ul>
                    <div class="d-flex">
                        <div class="button btn btn-primary my-2" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
                            Add Site</div>
                        <button class="button btn btn-success m-2" id="siteLoader" data-bs-toggle="modal"
                            data-bs-target="#staticBackdrop1"> Create Work Order</button>
                    </div>
                </div>
            </div>
        </nav>
        <div class="container-fluid text-dark">
            <div class="row mt-2">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-header bg-gray">
                            <h3><i class="fas fa-address-card"></i> About {{ $zone->company_name }}</h3>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-3">
                                    <p><b>Customer Id:</b> {{ $zone->customer_id }}</p>
                                    <p><b>Customer Name:</b> {{ $zone->company_name }}</p>
                                    <p><b>Address:</b> {{ @$zone->address->address }}</p>
                                    <p><b>Country:</b> {{ @$zone->address->country }}</p>
                                    <p><b>City:</b> {{ @$zone->address->city }}</p>
                                    <p><b>State:</b> {{ @$zone->address->state }}</p>
                                    <p><b>Zip Code:</b> {{ @$zone->address->zip_code }}</p>
                                </div>
                                <div class="col-md-3">
                                    <p><b>Email:</b> {{ $zone->email }}</p>
                                    <p><b>Customer Type:</b> {{ $zone->customer_type }}</p>
                                    <p><b>Phone Number:</b> {{ $zone->phone }}</p>
                                    <p><b>Sales Person Assigned:</b> {{ $zone->sales_person }}</p>
                                    <p><b>Project Manager Assigned:</b> {{ $zone->project_manager }}</p>
                                </div>
                                <div class="col-md-3">
                                    <p><b>Standard Rate:</b> {{ $zone->s_rate }}</p>
                                    <p><b>Emergency Rate:</b> {{ $zone->e_rate }}</p>
                                    <p><b>Travel Cost:</b> {{ $zone->travel }}</p>
                                    <p><b>Team:</b> {{ $zone->team }}</p>
                                </div>
                                <div class="col-md-3">
                                    <p><b>Billing Term:</b> {{ $zone->billing_term }}</p>
                                    <p><b>Type of Phone System:</b> {{ $zone->type_phone }}</p>
                                    <p><b>Type Of POS:</b> {{ $zone->type_pos }}</p>
                                    <p><b>Type Of Wireless:</b> {{ $zone->type_wireless }}</p>
                                    <p><b>Type Of CCTV:</b> {{ $zone->type_cctv }}</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-header bg-gray">
                            <h3><i class="fas fa-history"></i> Site history</h3>
                        </div>
                        <div class="card-body py-3">
                            <div class="table-responsive">
                                <table id="example" class="dataTable">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Site ID</th>
                                            <th>Location</th>
                                        </tr>
                                    </thead>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-header bg-gray">
                            <h3><i class="fas fa-file-alt"></i> Work Order history</h3>
                        </div>
                        <div class="card-body py-3">
                            <div class="table-responsive">
                                <table id="example1" class="table table-bordered">
                                    <thead>
                                        <tr>
                                            <th>#SL</th>
                                            <th>Order ID</th>
                                            <th>Opened</th>
                                        </tr>
                                    </thead>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--add Site Modal -->
        <div class="modal fade text-dark " id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false"
            aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog modal-xl">
                <div class="modal-content">
                    <div class="modal-header bg-gray d-flex justify-content-between">
                        <h5 class="modal-title" id="staticBackdropLabel">Add Site</h5>
                        <button type="button" class="btn-close" id="close-modal" data-bs-dismiss="modal"
                            aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <input type="hidden" name="customer_id" value="{{ $zone->id }}" id="customer"
                                readonly>
                            <div class="form-group col-md-4">
                                <label for="">Location Name</label>
                                <input type="text" class="form-control" name="location"
                                    placeholder="Enter Location name...." id="location">
                                <span style="color:red; font-size:16px" id="location-error"></span>
                            </div>
                            <div class="form-group col-md-4">
                                <label for="">Address 1</label>
                                <input type="text" class="form-control" name="address_1"
                                    placeholder="Enter address_1...." id="address_1">
                                <span style="color:red; font-size:16px" id="address_1-error"></span>
                            </div>
                            <div class="form-group col-md-4">
                                <label for="">Address 2</label>
                                <input type="text" class="form-control" name="address_2"
                                    placeholder="Enter address_2...." id="address_2">
                                <span style="color:red; font-size:16px" id="address_2-error"></span>
                            </div>
                            <div class="form-group col-md-4">
                                <label for="">Zip Code</label>
                                <input type="text" class="form-control" name="zipcode" placeholder="Enter zip...."
                                    id="zipcode">
                                <span style="color:red; font-size:16px" id="zipcode-error"></span>
                            </div>
                            <div class="form-group col-md-4">
                                <label for="">City</label>
                                <input type="text" class="form-control" name="city" placeholder="Enter city...."
                                    id="city">
                                <span style="color:red; font-size:16px" id="city-error"></span>
                            </div>
                            <div class="form-group col-md-4">
                                <label for="">State</label>
                                <input type="text" class="form-control" name="state" placeholder="Enter state...."
                                    id="state">
                                <span style="color:red; font-size:16px" id="state-error"></span>
                            </div>
                            <div class="form-group col-md-4">
                                <label for="">Timezone</label>
                                <input type="text" class="form-control" name="time_zone"
                                    placeholder="Enter timezone...." id="time_zone">
                                <span style="color:red; font-size:16px" id="time_zone-error"></span>
                            </div>
                            <div class="form-group col-md-12">
                                <label for="">Property Description</label>
                                <textarea class="form-control" name="description" placeholder="Enter description...." id="description"
                                    cols="10" rows="5"></textarea>
                                <span style="color:red; font-size:16px" id="description-error"></span>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn bg-gray btn-block" id="save">Save</button>
                    </div>
                </div>
            </div>
        </div>
        <!--add Work Order Modal -->
        <div class="modal fade text-dark " id="staticBackdrop1" data-bs-backdrop="static" data-bs-keyboard="false"
            aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog modal-xl modal-dialog-scrollable">
                <div class="modal-content">
                    <div class="modal-header bg-gray d-flex justify-content-between">
                        <h5 class="modal-title" id="staticBackdropLabel">Add Work Order</h5>
                        <button type="button" class="btn-close" id="close-modal" data-bs-dismiss="modal"
                            aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form action="" enctype="multipart/form-data" id="workOrderForm">
                            <div class="row">
                                <input type="hidden" name="slug" value="{{ $zone->id }}" id="slug"
                                    readonly>
                                <div class="form-group col-md-4">
                                    <label for="site_id" class="form-label">Site Location</label>
                                    <select name="site_id" id="site_id" class="form-control" style="width:100%">
                                        <option id="site_id_option">Select Site Location</option>
                                    </select>
                                    <span style="color:red; font-size:16px" id="site_id-error"></span>
                                </div>
                                <div class="form-group col-md-4">
                                    <label for="h_operation" class="form-label">Hours Of Operation</label>
                                    <input type="text" class="form-control" name="h_operation"
                                        value="{{ old('h_operation') }}" id="h_operation">
                                    <span style="color:red; font-size:16px" id="h_operation-error"></span>
                                </div>
                                <div class="form-group col-md-4">
                                    <label for="main_tel" class="form-label">Main Telephone</label>
                                    <input type="text" class="form-control" name="main_tel"
                                        value="{{ old('main_tel') }}" id="main_tel">
                                    <span style="color:red; font-size:16px" id="main_tel-error"></span>
                                </div>
                                <div class="form-group col-md-4">
                                    <label for="site_contact_name" class="form-label">Site Contact Name</label>
                                    <input type="text" class="form-control" name="site_contact_name"
                                        value="{{ old('site_contact_name') }}" id="site_contact_name">
                                    <span style="color:red; font-size:16px" id="site_contact_name-error"></span>
                                </div>
                                <div class="form-group col-md-4">
                                    <label for="site_contact_phone" class="form-label">Site Contact Phone</label>
                                    <input type="number" class="form-control" name="site_contact_phone"
                                        value="{{ old('site_contact_phone') }}" id="site_contact_phone">
                                    <span style="color:red; font-size:16px" id="site_contact_phone-error"></span>
                                </div>
                                <div class="form-group col-md-4">
                                    <label for="date_schedule" class="form-label">Date Schedule</label>
                                    <input type="date" class="form-control" name="date_schedule"
                                        value="{{ old('date_schedule') }}" id="date_schedule">
                                    <span style="color:red; font-size:16px" id="date_schedule-error"></span>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="e_checkin" class="form-label">Earliest CheckIn</label>
                                    <input type="time" class="form-control" name="e_checkin"
                                        value="{{ old('e_checkin') }}" id="e_checkin">
                                    <span style="color:red; font-size:16px" id="e_checkin-error"></span>

                                </div>
                                <div class="form-group col-md-6">
                                    <label for="l_checkin" class="form-label">Latest CheckIn</label>
                                    <input type="time" class="form-control" name="l_checkin"
                                        value="{{ old('l_checkin') }}" id="l_checkin">
                                    <span style="color:red; font-size:16px" id="l_checkin-error"></span>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="instruction" class="form-label">Instruction</label>
                                    <textarea name="instruction" class="form-control" cols="30" rows="5" value="{{ old('instruction') }}"
                                        id="instruction"></textarea>
                                    <span style="color:red; font-size:16px" id="instruction-error"></span>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="a_instruction" class="form-label">Additional Instruction</label>
                                    <textarea name="a_instruction" class="form-control" cols="30" rows="5"
                                        value="{{ old('a_instruction') }}" id="a_instruction"></textarea>
                                    <span style="color:red; font-size:16px" id="a_instruction-error"></span>

                                </div>
                                <div class="form-group col-md-6">
                                    <label for="r_tools" class="form-label">Required Tools</label>
                                    <textarea name="r_tools" class="form-control" cols="30" rows="5" value="{{ old('r_tools') }}"
                                        id="r_tools"></textarea>
                                    <span style="color:red; font-size:16px" id="r_tools-error"></span>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="scope_work" class="form-label">Scope Of Work</label>
                                    <textarea name="scope_work" class="form-control" cols="30" rows="5" value="{{ old('scope_work') }}"
                                        id="scope_work"></textarea>
                                    <span style="color:red; font-size:16px" id="scope_work-error"></span>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="arrival" class="form-label">Upon Arrival On Site</label>
                                    <textarea name="arrival" class="form-control" cols="30" rows="5" value="{{ old('arrival') }}"
                                        id="arrival"></textarea>
                                    <span style="color:red; font-size:16px" id="arrival-error"></span>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="leaving" class="form-label">Before leaving Site</label>
                                    <textarea name="leaving" class="form-control" cols="30" rows="5" value="{{ old('leaving') }}"
                                        id="leaving"></textarea>
                                    <span style="color:red; font-size:16px" id="leaving-error"></span>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="picture" class="form-label">Attached Picture</label>
                                    <input type="file" name="pictures[]" class="form-control" id="picture"
                                        multiple>
                                    <span style="color:red; font-size:16px" id="picture-error"></span>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="documents" class="form-label">Attached Document</label>
                                    <input type="file" name="documents[]" class="form-control" id="documents"
                                        multiple>
                                    <span style="color:red; font-size:16px" id="document-error"></span>
                                </div>
                                <div class="form-group col-6" id="image-frame">
                                    <div id="selectedImages" class="col-12">

                                    </div>
                                </div>
                                <div class="form-group col-6" id="docs-frame">
                                    <div id="selectedDocs" class="col-12">

                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary btn-block" id="save1">
                            <i class="d-none fa fa-spinner fa-spin"></i>
                            <span class="button-text">Save</span>
                        </button><br>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        $(document).ready(function() {
            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                }
            });

            loadSite();
            siteRoute();
            loadWorkOrder();
            workOrderRoute();

            //add site ajax code start
            $(document).on('click', '#save', function() {
                let id = $('#customer').val();
                let location = $('#location').val();
                let description = $('#description').val();
                let address_1 = $('#address_1').val();
                let address_2 = $('#address_2').val();
                let city = $('#city').val();
                let state = $('#state').val();
                let zipcode = $('#zipcode').val();
                let time_zone = $('#time_zone').val();

                $.ajax({
                    type: "POST",
                    url: "{{ route('customer.site.store') }}",
                    data: {
                        'customer_id': id,
                        'location': location,
                        'description': description,
                        'address_1': address_1,
                        'address_2': address_2,
                        'city': city,
                        'state': state,
                        'zipcode': zipcode,
                        'time_zone': time_zone,
                    },
                    dataType: "json",
                    success: function(response) {
                        if (response.message) {
                            $("#location-error,#address_1-error,#address_2-error,#zipcode-error,#city-error,#state-error,#description-error,#time_zone-error")
                                .empty();
                            iziToast.success({
                                message: response.message,
                                position: "topRight"
                            });
                            $("#location,#description,#address_1,#address_2,#city,#state,#zipcode,#time_zone")
                                .val("");
                            loadSite();
                        }
                    },
                    error: function(response) {
                        if (response.status == 422) {
                            errors = response.responseJSON.errors;
                            $("#location-error,#address_1-error,#address_2-error,#zipcode-error,#city-error,#state-error,#description-error,#time_zone-error")
                                .empty();

                            const fieldsToHandle = ["location", "address_1", "address_2",
                                "zipcode", "city", "state", "description", "time_zone"
                            ];

                            fieldsToHandle.forEach(field => {
                                if (errors[field]) {
                                    $('#' + field + '-error').text(errors[field]);
                                }
                            });
                        }
                    }
                });
            });
            //add Work Order ajax code start
            $(document).on('click', '#save1', function() {
                // $('#loaderIcon').css('visibility', 'visible');
                // $('#loaderIcon').show();
                let button = $('#save1');
                let icon = button.find('i');
                icon.removeClass('d-none');
                button.find('.button-text').text('Please Wait !');

                let formData = new FormData();
                formData.append('slug', $('#slug').val());
                formData.append('site_id', $('#site_id').val());
                formData.append('h_operation', $('#h_operation').val());
                formData.append('main_tel', $('#main_tel').val());
                formData.append('site_contact_name', $('#site_contact_name').val());
                formData.append('site_contact_phone', $('#site_contact_phone').val());
                formData.append('date_schedule', $('#date_schedule').val());
                formData.append('e_checkin', $('#e_checkin').val());
                formData.append('l_checkin', $('#l_checkin').val());
                formData.append('instruction', $('#instruction').val());
                formData.append('a_instruction', $('#a_instruction').val());
                formData.append('r_tools', $('#r_tools').val());
                formData.append('scope_work', $('#scope_work').val());
                formData.append('arrival', $('#arrival').val());
                formData.append('leaving', $('#leaving').val());

                let selectedFiles = $('#picture')[0].files;

                for (let i = 0; i < selectedFiles.length; i++) {
                    formData.append('pictures[' + i + ']', selectedFiles[i]);
                }

                let selectedDocs = $('#documents')[0].files;

                for (let index = 0; index < selectedDocs.length; index++) {
                    formData.append('documents[' + index + ']', selectedDocs[index]);
                }


                let siteID = $('#site_id').val();
                if (siteID === "Select Site Location") {
                    formData.append('site_id', "");
                } else {
                    formData.append('site_id', siteID);
                }

                $.ajax({
                    type: "POST",
                    url: "{{ route('customer.order.create') }}",
                    data: formData,
                    processData: false,
                    contentType: false,
                    dataType: "json",
                    success: function(response) {
                        icon.addClass('d-none');
                        button.find('.button-text').text('Save');
                        $('#loaderIcon').hide();
                        if (response.message) {
                            $("#slug-error,#site-error,#h_operation-error,#main_tel-error,#site_contact_name-error,#site_contact_phone-error,#date_schedule-error,#e_checkin-error,#l_checkin-error,#instruction-error,#a_instruction-error,#r_tools-error,#scope_work-error,#arrival-error,#leaving-error")
                                .empty();

                            iziToast.success({
                                message: response.message,
                                position: "topRight"
                            });

                            $("#site,#h_operation,#main_tel,#site_contact_name,#site_contact_phone,#date_schedule,#e_checkin,#l_checkin,#instruction,#a_instruction,#r_tools,#scope_work,#arrival,#leaving,#picture,#documents")
                                .val("");
                            $('#selectedImages').empty();
                            $('#selectedDocs').empty();
                            $('#site_id_option').prop('selected', true);
                            $('#site_id_option').change();
                            loadWorkOrder();
                        }
                    },
                    error: function(response) {
                        icon.addClass('d-none');
                        button.find('.button-text').text('Save');
                        if (response.status == 422) {
                            errors = response.responseJSON.errors;
                            console.log(errors);

                            $("#slug-error,#site_id-error,#h_operation-error,#main_tel-error,#site_contact_name-error,#site_contact_phone-error,#date_schedule-error,#e_checkin-error,#l_checkin-error,#instruction-error,#a_instruction-error,#r_tools-error,#scope_work-error,#arrival-error,#leaving-error")
                                .empty();

                            const fieldsToHandle = ["slug", "site_id", "h_operation",
                                "main_tel", "site_contact_name", "site_contact_phone",
                                "date_schedule", "e_checkin", "l_checkin", "instruction",
                                "a_instruction", "r_tools", "scope_work", "arrival",
                                "leaving"
                            ];

                            fieldsToHandle.forEach(field => {
                                if (errors[field]) {
                                    console.log(errors[field]);
                                    $('#' + field + '-error').text(errors[field]);
                                }
                            });
                        }
                    }
                });
            });

            function loadSite() {
                var url = window.location.href;
                var urlParts = url.split('/');
                var id = urlParts[urlParts.length - 1];
                var ajaxURL = "{{ route('customer.customerZone', ':id') }}";
                ajaxURL = ajaxURL.replace(':id', id);

                $.ajax({
                    url: ajaxURL,
                    type: "GET",
                    cache: false,
                    success: function(data) {
                        let sites = data.sites;
                        var table = $('#example').DataTable();
                        table.clear();
                        sites.forEach((item, index) => {
                            let id = item.id;
                            table.row.add([
                                index + 1,
                                '<a href="" class="site-details" data-id="' + id +
                                '">' + item.site_id + '</a>',
                                '<a href="" class="site-details" data-id="' + id +
                                '">' + item.location + '</a>',
                            ]);
                        });
                        table.draw();
                    }
                });
            }

            function siteRoute() {
                $(document).on('click', '.site-details', function() {
                    let siteId = $(this).data('id');
                    let siteRoute = "{{ route('customer.site.edit', ':id') }}";
                    siteRoute = siteRoute.replace(':id', siteId);
                    $(this).attr('href', siteRoute);
                });
            }

            function loadWorkOrder() {
                var url = window.location.href;
                var urlParts = url.split('/');
                var id = urlParts[urlParts.length - 1];
                var ajaxURL = "{{ route('customer.customerZone', ':id') }}";
                ajaxURL = ajaxURL.replace(':id', id);

                $.ajax({
                    url: ajaxURL,
                    type: "GET",
                    cache: false,
                    success: function(data) {
                        let orders = data.workOrders;
                        var table = $('#example1').DataTable();
                        table.clear();
                        orders.forEach((item, index) => {
                            let id = item.id;
                            table.row.add([
                                index + 1,
                                '<a href="" class="order-details" data-id="' + id +
                                '">' + item.order_id + '</a>',
                                '<a href="" class="order-details" data-id="' + id +
                                '">' + item.open_date + '</a>',
                            ]);
                        });
                        table.draw();
                    }
                });
            }

            function workOrderRoute() {
                $(document).on('click', '.order-details', function() {
                    let orderId = $(this).data('id');
                    let workOrderRoute = "{{ route('customer.work.order.view', ':id') }}";
                    workOrderRoute = workOrderRoute.replace(':id', orderId);
                    $(this).attr('href', workOrderRoute);
                });
            }

            $(document).on("change", "#picture", function() {
                const fileInput = this;
                const imageContainer = $('#selectedImages');
                $('#image-frame').removeClass('d-none');

                imageContainer.empty();

                if (fileInput.files && fileInput.files.length > 0) {
                    for (let i = 0; i < fileInput.files.length; i++) {
                        const reader = new FileReader();
                        const imageElement = document.createElement('img');

                        reader.onload = function(e) {
                            imageElement.src = e.target.result;
                            imageElement.style.height = '100px';
                            imageElement.style.margin = '5px';
                        };
                        reader.readAsDataURL(fileInput.files[i]);

                        imageContainer.append(imageElement);
                    }
                }
            });

            $(document).on('change', '#documents', function() {
                const fileInput = this;
                const pdfContainer = $('#selectedDocs');
                $('#docs-frame').removeClass('d-none');

                pdfContainer.empty();

                if (fileInput.files && fileInput.files.length > 0) {
                    for (let i = 0; i < fileInput.files.length; i++) {
                        const reader = new FileReader();

                        reader.onload = function(e) {
                            const pdfElement = document.createElement('embed');
                            pdfElement.src = e.target.result;
                            pdfElement.style.width = '50%';
                            pdfContainer.append(pdfElement);
                        };
                        reader.readAsDataURL(fileInput.files[i]);
                    }
                }
            });


            $(document).on('click', '#siteLoader', function() {
                var url = window.location.href;
                var urlParts = url.split('/');
                var id = urlParts[urlParts.length - 1];
                var ajaxURL = "{{ route('customer.customerZone', ':id') }}";
                ajaxURL = ajaxURL.replace(':id', id);

                var select2Options = [];

                $.ajax({
                    url: ajaxURL,
                    dataType: 'json',
                    success: function(data) {
                        data.sites.forEach(function(site) {
                            select2Options.push({
                                id: site.id,
                                text: site.location
                            });
                        });

                        $("#site_id").select2({
                            data: select2Options,
                            cache: true
                        });
                    },
                    error: function() {
                        console.error('Error fetching data');
                    }
                });
            });
        });
    </script>
@endsection
