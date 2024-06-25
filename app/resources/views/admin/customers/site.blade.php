@extends('admin.layoutsNew.app')
@section('script')
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/css/select2.min.css" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.8/js/select2.min.js" defer></script>
    <link rel="stylesheet" href="{{ asset('assetsNew/main_css/customer/site.css') }}">
@endsection
@section('content')
    @php
        use App\Models\Customer;
        $customers = Customer::all();
    @endphp
    <style>
        .select2-container--default .select2-selection--single {
            height: 38px;
            padding: 8px 12px;
        }

        .select2-container--default .select2-selection--single .select2-selection__arrow b {
            top: 72%;
        }
    </style>

    <div class="content-wrapper" style="background-color: white;">
        <!-- Content Header (Page header) -->
        @include('admin.includeNew.breadcrumb')
        <!-- /.content-header -->
        <div class="container-fluid text-dark">
            <div class="card">
                <div class="card-header">
                    <div class="row">
                        <div class="col-mb-12 d-flex justify-content-between align-items-center mx-1">
                            <h3 class="text-dark"></h3>
                            <div class="justify-content-between">
                                {{-- <a href="{{ route('customer.create') }}" class="btn btn-primary"><i class="fas fa-user"></i>
                                    Add Customer</a> --}}
                                <div class="button btn btn-primary my-2" data-bs-toggle="modal"
                                    data-bs-target="#staticBackdrop"> <i class="fas fa-building"></i>
                                    Add Customer Site</div>
                            </div>

                        </div>
                    </div>

                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table id="siteTable" class="table table-bordered table-hover">
                            <thead>
                                <tr class="text-center">
                                    <th>#SL</th>
                                    <th>Site ID</th>
                                    <th>Location</th>
                                    <th>Company Name</th>
                                    <th>Standard Rate</th>
                                    <th>Emergency Rate</th>
                                    <th>Address</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                {{-- @foreach ($sites as $key => $site)
                                    <tr class="text-center">
                                        <td>{{ $key + 1 }}</td>
                                        <td>{{ $site->site_id }}</td>
                                        <td>{{ @$site->customer->company_name }}</td>
                                        <td>{{ @$site->customer->s_rate }}</td>
                                        <td>{{ @$site->customer->e_rate }}</td>
                                        <td>{{ $site->address_1 }}</td>
                                        <td class="dropdown">
                                            <a id="siteActionsDropdown" data-toggle="dropdown" aria-haspopup="true"
                                                aria-expanded="false">
                                                <i class="fas fa-ellipsis-v custom-icon" style="cursor: pointer;"></i>
                                            </a>
                                            <div class="dropdown-menu" aria-labelledby="siteActionsDropdown">
                                                <a class="dropdown-item"
                                                    href="{{ url('/customer/edit/site') }}/{{ $site->id }}">
                                                    <i class="fas fa-pencil-alt"></i> Edit
                                                </a>
                                                <a class="dropdown-item text-danger delete-button"
                                                    href="{{ url('/customer/delete/site') }}/{{ $site->id }}"
                                                    data-toggle="modal"
                                                    data-target="#confirmationModal-{{ $site->id }}">
                                                    <i class="fas fa-trash-alt"></i> Delete
                                                </a>
                                            </div>
                                        </td>
                                    </tr>
                                @endforeach --}}
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="confirmationModal" tabindex="-1" role="dialog"
            aria-labelledby="confirmationModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="confirmationModalLabel">Confirmation</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        Are you sure you want to delete this site?
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                        <a href="" class="btn btn-danger confirmDelete">Delete</a>
                    </div>
                </div>
            </div>
        </div>

        <!--add Site Modal -->
        <div class="modal fade text-dark" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false"
            aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog modal-xl">
                <div class="modal-content">
                    <div class="modal-header bg-primary d-flex justify-content-between">
                        <h5 class="modal-title" id="staticBackdropLabel">Add Site</h5>
                        <button type="button" class="btn-close" id="close-modal" data-bs-dismiss="modal"
                            aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form id="site_reg_form">
                            @csrf
                            <div class="row">
                                <div class="form-group col-4">
                                    <label>Customer</label>
                                    <select class="form-control" name="customer_id" id="customer" style="width:100%">
                                        <option value="">Select Customer</option>
                                    </select>
                                    <span class="text-danger" id="customerIdError"></span>
                                </div>
                                {{-- <div class="form-group col-4">
                                    <label for="companyname">Company Name:</label>
                                    <input type="text" id="companyname" class="form-control" readonly>
                                </div> --}}
                                <div class="form-group col-4">
                                    <label>Site Id</label>
                                    <input type="text" id="site_id" class="form-control" name="site_id"
                                        placeholder="Enter your site id">
                                    <span class="text-danger" id="siteIdError"></span>
                                </div>
                                <div class="form-group col-4">
                                    <label for="">Location Name</label>
                                    <input type="text" class="form-control" name="location"
                                        placeholder="Enter Location name...." id="location">
                                    <span class="text-danger" id="locationError"></span>
                                </div>
                                <div class="form-group col-4">
                                    <label for="">Address 1</label>
                                    <input type="text" class="form-control" name="address_1"
                                        placeholder="Enter address_1...." id="address_1">
                                    <span class="text-danger" id="address1Error"></span>
                                </div>
                                <div class="form-group col-4">
                                    <label for="">Address 2</label>
                                    <input type="text" class="form-control" name="address_2"
                                        placeholder="Enter address_2...." id="address_2">
                                </div>
                                <div class="form-group col-4">
                                    <label for="">City</label>
                                    <input type="text" class="form-control" name="city"
                                        placeholder="Enter city...." id="city">
                                    <span class="text-danger" id="cityError"></span>
                                </div>
                                <div class="form-group col-4">
                                    <label for="">State</label>
                                    <input type="text" class="form-control" name="state"
                                        placeholder="Enter state...." id="state">
                                    <span class="text-danger" id="stateError"></span>
                                </div>
                                <div class="form-group col-4">
                                    <label for="">Zip Code</label>
                                    <input type="text" class="form-control" name="zipcode"
                                        placeholder="Enter zip...." id="zipcode">
                                    <span class="text-danger" id="zipcodeError"></span>
                                </div>
                                <div class="form-group col-4">
                                    <label for="">Timezone</label>
                                    <input type="text" class="form-control" name="time_zone"
                                        placeholder="Enter timezone...." id="timezone">
                                    <span class="text-danger" id="timeZoneError"></span>
                                </div>
                                <div class="form-group col-12">
                                    <label for="">Property Description</label>
                                    <textarea class="form-control" name="description" id="description" cols="10" rows="5"
                                        placeholder="Enter description...."></textarea>
                                </div>
                            </div>
                    </div>
                    <div class="modal-footer">
                        <div class="d-flex justify-content-between w-100">
                            <button type="submit" class="btn bg-primary w-50 me-2">Save</button>
                            <button type="button" data-bs-dismiss="modal" class="btn bg-secondary w-50"
                                id="cancel">Cancel</button>
                        </div>
                    </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <script>
        $(document).ready(function() {

            $('#siteTable').DataTable({
                processing: true,
                serverSide: true,
                ajax: {
                    url: "{{ route('customer.site.list') }}"
                },
                columns: [{
                        data: 'DT_RowIndex',
                        name: 'DT_RowIndex',
                        searchable: false,
                        orderable: false
                    }, // Index column
                    {
                        data: 'site_id',
                        name: 'site_id'
                    }, // Site ID column

                    {
                        data: 'location',
                        name: 'location'
                    }, // Location column
                    {
                        data: 'customer.company_name',
                        name: 'customer.company_name'
                    }, // Customer Company Name column

                    {
                        data: 'customer.s_rate',
                        name: 'customer.s_rate'
                    }, // Customer Standard Rate column
                    {
                        data: 'customer.e_rate',
                        name: 'customer.e_rate'
                    }, // Customer Extended Rate column
                    {
                        data: 'address_1',
                        name: 'address_1'
                    }, // Address column
                    {
                        data: null,
                        render: function(data, type, row) {
                            return '<div class="button-container d-flex align-items-center">' +
                                '<div class="dropdown">' +
                                '<i class="fas fa-ellipsis-v custom-icon mx-4" id="dropdownMenuButton_' +
                                row.id +
                                '" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="cursor: pointer;"></i>' +
                                '<div class="dropdown-menu" aria-labelledby="dropdownMenuButton_' +
                                row.id + '">' +
                                '<a class="dropdown-item no-modal edit-btn" data-id="' + row.id +
                                '">Edit</a>' +
                                '<a class="dropdown-item no-modal delete-btn" data-id="' + row
                                .id + '">Delete</a>' +
                                '</div>' +
                                '</div>' +
                                '</div>';
                        }
                    },

                ],
            })

            $(document).on('click', '.delete-btn', function() {
                let id = $(this).data('id');
                let route = "{{ route('customer.site.delete', ':id') }}";
                route = route.replace(':id', id);
                $('#confirmationModal').find('.confirmDelete').attr('href', route);
                $('#confirmationModal').modal('show');
            });

            $(document).on('click', '.edit-btn', function() {
                let id = $(this).data('id');
                let route = "{{ route('customer.site.edit', ':id') }}";
                route = route.replace(':id', id);
                window.location.href = route;
            });


            $("#customer").select2({
                ajax: {
                    url: "{{ route('customer.get') }}",
                    type: "GET",
                    dataType: "JSON",
                    delay: 250,
                    data: function(params) {
                        return {
                            q: params.term
                        };
                    },
                    processResults: function(data) {
                        return {
                            results: data
                        };
                    },
                    cache: true,
                    placeholder: 'Search for a customer',
                    minimumInputLength: 1,
                }
            });


            $('#site_reg_form').submit(function(e) {
                e.preventDefault();
                let errorsContainer = $('#errors-container');
                let showToast = true;
                let formData = new FormData(this);

                $.ajax({
                    url: "{{ route('customer.site.store') }}",
                    type: "POST",
                    data: formData,
                    processData: false,
                    contentType: false,
                    success: function(res) {
                        $('#site_reg_form').find('span.text-danger').text("");
                        $('#customer').val(null).trigger('change');
                        $('#site_reg_form').find('input.form-control').val("");
                        iziToast.success({
                            message: res.message,
                            position: "topRight"
                        });
                    },
                    error: function(xhr, status, error) {
                        $('#site_reg_form').find('span.text-danger').text("");
                        if (xhr.status === 422) {
                            $('#customerIdError').text(xhr.responseJSON.errors.customer_id);
                            $('#siteIdError').text(xhr.responseJSON.errors.site_id);
                            $('#siteIdError').text(xhr.responseJSON.errors.site_id);
                            $('#locationError').text(xhr.responseJSON.errors.location);
                            $('#address1Error').text(xhr.responseJSON.errors.address_1);
                            $('#cityError').text(xhr.responseJSON.errors.city);
                            $('#stateError').text(xhr.responseJSON.errors.state);
                            $('#zipcodeError').text(xhr.responseJSON.errors.zipcode);
                            $('#timeZoneError').text(xhr.responseJSON.errors.time_zone);
                        }
                    }
                });
            });
        });
    </script>
@endsection
