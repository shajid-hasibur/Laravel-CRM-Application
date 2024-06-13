@extends('admin.layoutsNew.app')
@section('script')
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/css/select2.min.css" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.8/js/select2.min.js" defer></script>
@endsection
@section('content')
    @php
        use App\Models\Customer;
        $customers = Customer::all();
    @endphp


    <link rel="stylesheet" href="{{ asset('assetsNew/main_css/customer/create.css') }}">
    <div class="content-wrapper" style="background-color: white;">
        <!-- Content Header (Page header) -->
        @include('admin.includeNew.breadcrumb')
        <div class="container-fluid text-dark">
            <div class="row">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-header">
                            <div class="row">
                                <div class="col-mb-12 col-md-12 d-flex justify-content-between">
                                    <h3></h3>
                                    <div class="justify-content-between">
                                        {{-- <div class="button btn btn-primary my-2" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
                                        <i class="fas fa-user-cog"></i>
                                        Add Customer Site
                                    </div> --}}
                                        <a class="btn btn-primary" href="{{ route('customer.index') }}"><i
                                                class="fas fa-list"></i> Go to Customer List</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="card-body">
                            <form action="{{ route('customer.store') }}" method="POST" enctype="multipart/form-data">
                                @csrf
                                <div class="form-row">
                                    <div class="form-group col-4">
                                        <label for="company_name">
                                            <h6>Company Name</h6>
                                        </label>
                                        <input type="text" class="form-control" name="company_name"
                                            placeholder="Enter company name" value="{{ old('company_name') }}">
                                        @error('company_name')
                                            <span style="color:red; font-size:14px">{{ $message }}</span>
                                        @enderror
                                    </div>
                                    <div class="form-group col-4">
                                        <label for="customer_type">
                                            <h6>Customer Type</h6>
                                        </label>
                                        <select name="customer_type" class="form-control">
                                            <option value="">Select Customer Type</option>
                                            <option value="Customer"
                                                {{ old('customer_type') == 'Customer' ? 'selected' : '' }}>Customer</option>
                                            <option value="Prospecting"
                                                {{ old('customer_type') == 'Prospecting' ? 'selected' : '' }}>Prospecting
                                            </option>
                                            <option value="Etc" {{ old('customer_type') == 'Etc' ? 'selected' : '' }}>Etc
                                            </option>
                                        </select>
                                        @error('customer_type')
                                            <span style="color:red; font-size:14px">{{ $message }}</span>
                                        @enderror
                                    </div>
                                    <div class="form-group col-4">
                                        <label for="address">
                                            <h6>Address</h6>
                                        </label>
                                        <input type="text" class="form-control" name="address"
                                            placeholder="Enter address" value="{{ old('address') }}">
                                        @error('address')
                                            <span style="color:red; font-size:14px">{{ $message }}</span>
                                        @enderror
                                    </div>
                                    <div class="form-group col-4">
                                        <label for="country">
                                            <h6>Country</h6>
                                        </label>
                                        <input type="text" class="form-control" name="country"
                                            placeholder="Enter country" value="{{ old('country') }}">
                                        @error('country')
                                            <span style="color:red; font-size:14px">{{ $message }}</span>
                                        @enderror
                                    </div>
                                    <div class="form-group col-4">
                                        <label for="city">
                                            <h6>City</h6>
                                        </label>
                                        <input type="text" class="form-control" name="city" placeholder="Enter city"
                                            value="{{ old('city') }}">
                                        @error('city')
                                            <span style="color:red; font-size:14px">{{ $message }}</span>
                                        @enderror
                                    </div>
                                    <div class="form-group col-4">
                                        <label for="state">
                                            <h6>State</h6>
                                        </label>
                                        <input id="state" type="text" class="form-control" name="state"
                                            placeholder="Enter state" value="{{ old('state') }}">
                                        @error('state')
                                            <span style="color:red; font-size:14px">{{ $message }}</span>
                                        @enderror
                                    </div>
                                    <div class="form-group col-4">
                                        <label for="zip_code">
                                            <h6>Zip Code</h6>
                                        </label>
                                        <input type="text" class="form-control" name="zip_code" placeholder="Enter zip"
                                            value="{{ old('zip_code') }}">
                                        @error('zip_code')
                                            <span style="color:red; font-size:14px">{{ $message }}</span>
                                        @enderror
                                    </div>
                                    <div class="form-group col-4">
                                        <label for="email">
                                            <h6>Email</h6>
                                        </label>
                                        <input type="text" class="form-control" name="email" placeholder="Enter email"
                                            value="{{ old('email') }}">
                                        @error('email')
                                            <span style="color:red; font-size:14px">{{ $message }}</span>
                                        @enderror
                                    </div>
                                    <div class="form-group col-4">
                                        <label for="phone">
                                            <h6>Phone</h6>
                                        </label>
                                        <input type="number" class="form-control" name="phone" placeholder="Enter phone"
                                            value="{{ old('phone') }}">
                                        @error('phone')
                                            <span style="color:red; font-size:14px">{{ $message }}</span>
                                        @enderror
                                    </div>
                                    <div class="form-group col-4">
                                        <label for="s_rate">
                                            <h6>Standard Rate</h6>
                                        </label>
                                        <input type="number" class="form-control" name="s_rate"
                                            placeholder="Standard Rate" value="{{ old('s_rate') }}">
                                        @error('s_rate')
                                            <span style="color:red; font-size:14px">{{ $message }}</span>
                                        @enderror
                                    </div>
                                    <div class="form-group col-4">
                                        <label for="e_rate">
                                            <h6>Emergency Rate</h6>
                                        </label>
                                        <input type="number" class="form-control" name="e_rate"
                                            placeholder="Enter Emergency rate" value="{{ old('e_rate') }}">
                                        @error('e_rate')
                                            <span style="color:red; font-size:14px">{{ $message }}</span>
                                        @enderror
                                    </div>
                                    <div class="form-group col-4">
                                        <label for="travel">
                                            <h6>Travel</h6>
                                        </label>
                                        <input type="number" class="form-control" name="travel"
                                            placeholder="Enter travel" value="{{ old('travel') }}">
                                        @error('travel')
                                            <span style="color:red; font-size:14px">{{ $message }}</span>
                                        @enderror
                                    </div>
                                    <div class="form-group col-4">
                                        <label for="billing_term">
                                            <h6>Billing Term</h6>
                                        </label>
                                        <select name="billing_term" class="form-control">
                                            <option value="">Select Billing Term</option>

                                            <option value="NET30" {{ old('billing_term') == 'NET30' ? 'selected' : '' }}>
                                                NET30</option>
                                            <option value="NET45" {{ old('billing_term') == 'NET45' ? 'selected' : '' }}>
                                                NET45</option>
                                            <option value="Etc" {{ old('billing_term') == 'Etc' ? 'selected' : '' }}>
                                                Etc</option>
                                        </select>
                                        @error('billing_term')
                                            <span style="color:red; font-size:14px">{{ $message }}</span>
                                        @enderror
                                    </div>
                                    <div class="form-group col-4">
                                        <label for="type_phone">
                                            <h6>Type Of Phone System</h6>
                                        </label>
                                        <input type="text" class="form-control" name="type_phone"
                                            placeholder="Type Of Phone" value="{{ old('type_phone') }}">
                                        @error('type_phone')
                                            <span style="color:red; font-size:14px">{{ $message }}</span>
                                        @enderror
                                    </div>
                                    <div class="form-group col-4">
                                        <label for="type_wireless">
                                            <h6>Type Of Wireless</h6>
                                        </label>
                                        <input type="text" class="form-control" name="type_wireless"
                                            placeholder="Type Of Wireless" value="{{ old('type_wireless') }}">
                                        @error('type_wireless')
                                            <span style="color:red; font-size:14px">{{ $message }}</span>
                                        @enderror
                                    </div>
                                    <div class="form-group col-4">
                                        <label for="type_cctv">
                                            <h6>Type Of CCTV</h6>
                                        </label>
                                        <input type="text" class="form-control" name="type_cctv"
                                            placeholder="Type Of CCTV" value="{{ old('type_cctv') }}">
                                        @error('type_cctv')
                                            <span style="color:red; font-size:14px">{{ $message }}</span>
                                        @enderror
                                    </div>
                                    <div class="form-group col-4">
                                        <label for="type_pos">
                                            <h6>Type Of POS</h6>
                                        </label>
                                        <input type="text" class="form-control" name="type_pos"
                                            placeholder="Type Of POS" value="{{ old('type_pos') }}">
                                        @error('type_pos')
                                            <span style="color:red; font-size:14px">{{ $message }}</span>
                                        @enderror
                                    </div>
                                    <div class="form-group col-4">
                                        <label for="team">
                                            <h6>Team</h6>
                                        </label>
                                        <select name="team" class="form-control" id="">
                                            <option value="">Select Team</option>
                                            <option value="Blue Team" {{ old('team') == 'Blue Team' ? 'selected' : '' }}>
                                                Blue Team</option>
                                            <option value="Red Team" {{ old('team') == 'Red Team' ? 'selected' : '' }}>Red
                                                Team</option>
                                            <option value="Etc" {{ old('team') == 'Etc' ? 'selected' : '' }}>Etc
                                            </option>
                                        </select>
                                        @error('team')
                                            <span style="color:red; font-size:14px">{{ $message }}</span>
                                        @enderror
                                    </div>
                                    <div class="form-group col-6">
                                        <label for="sales_person">
                                            <h6>Sales Person Assigned</h6>
                                        </label>
                                        <input type="text" class="form-control" name="sales_person"
                                            placeholder="Sales person assign" value="{{ old('sales_person') }}">
                                        @error('sales_person')
                                            <span style="color:red; font-size:14px">{{ $message }}</span>
                                        @enderror
                                    </div>
                                    <div class="form-group col-6">
                                        <label for="project_manager">
                                            <h6>Project Manager Assigned</h6>
                                        </label>
                                        <input type="text" class="form-control" name="project_manager"
                                            placeholder="Project Manager assign" value="{{ old('project_manager') }}">
                                        @error('project_manager')
                                            <span style="color:red; font-size:14px">{{ $message }}</span>
                                        @enderror
                                    </div>
                                    <div class="form-group col-12">
                                        <button type="submit" class="btn btn-primary btn-block"><i
                                                class="fas fa-check"></i> Submit</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!--add Site Modal -->
        {{-- <div class="modal fade text-dark" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header bg-primary d-flex justify-content-between">
                    <h5 class="modal-title" id="staticBackdropLabel">Add Site</h5>
                    <button type="button" class="btn-close" id="close-modal" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="container">
                        <div class="row">
                            <div class="form-group col-4">
                                <label class="form-label" for="customer_id">Customer Id:</label>
                                <select class="form-control" name="customer_id" id="customer" style="width:100%;">
                                    <option value="" id="selectId">Select Customer Id</option>
                                    @foreach ($customers as $cu)
                                    <option value="{{$cu->id}}">{{$cu->customer_id}}</option>
                                    @endforeach
                                </select>
                                <span style="color:red; font-size:16px" id="customer_id-error"></span>
                            </div>
                            <div class="form-group col-4">
                                <label for="companyname">Company Name:</label>
                                <input type="text" id="companyname" class="form-control" readonly>
                            </div>
                            <div class="form-group col-4">
                                <label for="location">Location Name:</label>
                                <input type="text" class="form-control" name="location" placeholder="Enter Location name...." id="location">
                                <span style="color:red; font-size:16px" id="location-error"></span>
                            </div>
                            <div class="form-group col-4">
                                <label for="state">State:</label>
                                <input type="text" class="form-control state" name="state" placeholder="Enter state...." id="state">
                                <span style="color:red; font-size:16px" id="state-error"></span>
                            </div>
                            <div class="form-group col-4">
                                <label for="address_1">Address 1:</label>
                                <input type="text" class="form-control" name="address_1" placeholder="Enter address_1...." id="address_1">
                                <span style="color:red; font-size:16px" id="address_1-error"></span>
                            </div>
                            <div class="form-group col-4">
                                <label for="address_2">Address 2:</label>
                                <input type="text" class="form-control" name="address_2" placeholder="Enter address_2...." id="address_2">
                                <span style="color:red; font-size:16px" id="address_2-error"></span>
                            </div>
                            <div class="form-group col-4">
                                <label for="city">City:</label>
                                <input type="text" class="form-control" name="city" placeholder="Enter city...." id="city">
                                <span style="color:red; font-size:16px" id="city-error"></span>
                            </div>
                            <div class="form-group col-4">
                                <label for="zipcode">Zip Code:</label>
                                <input type="text" class="form-control" name="zipcode" placeholder="Enter zip...." id="zipcode">
                                <span style="color:red; font-size:16px" id="zipcode-error"></span>
                            </div>
                            <div class="form-group col-12">
                                <label for="description">Property Description:</label>
                                <textarea class="form-control" name="description" id="description" cols="10" rows="5" placeholder="Enter description...."></textarea>
                                <span style="color:red; font-size:16px" id="description-error"></span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn bg-primary btn-block" id="save">Save</button>
                </div>
            </div>
        </div>
    </div> --}}
    </div>
    {{-- <script>
    $(document).ready(function() {
        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });

        $('#customer').on('change', function() {
            var selectedCusId = $(this).val();
            $.ajax({
                url: '{{ route("customer.comName", ["id" => ":id"]) }}'.replace(':id', selectedCusId),
                type: 'GET',
                success: function(data) {
                    $('#companyname').val(data.company_name);
                },
                error: function() {
                    console.log('Error fetching company name.');
                }
            });
        });

        $("#customer").select2();

        //add site ajax code start
        $(document).on('click', '#save', function() {
            let id = $('#customer').val();
            let location = $('#location').val();
            let description = $('#description').val();
            let address_1 = $('#address_1').val();
            let address_2 = $('#address_2').val();
            let city = $('#city').val();
            let state = $('.state').val();
            let zipcode = $('#zipcode').val();

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
                },
                dataType: "json",
                success: function(response) {
                    if (response.message) {
                        iziToast.success({
                            message: response.message,
                            position: "topRight"
                        });
                        $("#location,#description,#address_1,#address_2,#city,#zipcode,#state").val("");
                        $("#companyname").prop("readonly", false);
                        $("#companyname").val("");
                        $("#companyname").prop("readonly",true);
                        $("#customer_id-error,#location-error,#address_1-error,#address_2-error,#city-error,#zipcode-error,#state-error,#description-error").text("");
                        $("#selectId").prop("selected",true);
                        $("#selectId").change();
                    }
                },
                error: function(response) {
                    if (response.status == 422) {
                        errors = response.responseJSON.errors;
                        $("#customer_id-error,#location-error,#address_1-error,#address_2-error,#city-error,#zipcode-error,#state-error,#description-error").text("");

                        const fieldsToHandle = ["customer_id", "location", "address_1", "address_2", "city", "zipcode", "state", "description"];

                        fieldsToHandle.forEach(field => {
                            if (errors[field]) {
                                $('#' + field + '-error').text(errors[field]);
                            }
                        });
                    }
                }
            });
        });
    });
</script> --}}
@endsection
