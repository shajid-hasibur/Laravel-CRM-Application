@extends('admin.layoutsNew.app')

@section('script')
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<link rel="stylesheet" href="{{asset('assetsNew/main_css/customer/index.css')}}">
@endsection

@section('content')
<style>
    .nowrap {
        white-space: nowrap;
    }
</style>
<div class="content-wrapper" style="background-color: white;">
    <!-- Content Header (Page header) -->
    @include('admin.includeNew.breadcrumb')
    <!-- /.content-header -->
    <div class="container-fluid text-dark p-1">
        <div class="card p-3">
            <div>
                <div class="row">
                    <div class="col-md-12 d-flex justify-content-between">
                        <h3 class="text-dark"></h3>
                        <div class="justify-content-between">
                            <a href="{{route('customer.create')}}" class="btn btn-primary"><i class="fas fa-plus-circle"></i> Add Customer</a>
                            <div class="button btn btn-primary my-2" data-bs-toggle="modal" data-bs-target="#staticBackdrop"> <i class="fas fa-building"></i>
                                Add Customer Site</div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table id="customers" class="table table-bordered" style="width:100%">
                        <thead>
                            <tr>
                                <th># SL</th>
                                <th>Customer ID</th>
                                <th>Company Name</th>
                                <th>Customer Type</th>
                                {{-- <th>Address</th>
                                <th>Email</th>
                                <th>Phone</th> --}}
                                <th>Standard Rate</th>
                                <th>Emergency Rate</th>
                                <th>Travel</th>
                                {{-- <th>Billing Term</th>
                                <th>Type Of Phone System</th>
                                <th>Type Of POS</th>
                                <th>Type Of CCTV</th>
                                <th>Type Of Wireless</th>
                                <th>Team</th>
                                <th>Sales Person Assign</th>
                                <th>Project Manager Assign</th> --}}
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody></tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="del-confirm" tabindex="-1" role="dialog" aria-labelledby="confirmationModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="confirmationModalLabel">Confirmation</h5>
                    <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    Are you sure you want to delete this customer?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <a href="#" class="btn btn-danger" id="del-button">Delete</a>
                </div>
            </div>
        </div>
    </div>

    <!--add Site Modal -->
    <div class="modal fade text-dark" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog modal-xl">
            <div class="modal-content">
                <div class="modal-header bg-gray d-flex justify-content-between">
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
                                    @foreach($customers as $cu)
                                    <option value="{{$cu->id}}">{{$cu->customer_id}}-{{$cu->company_name}}</option>
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
                    <button type="button" class="btn bg-gray btn-block" id="save">Save</button>
                </div>
            </div>
        </div>
    </div>
</div>
<input type="hidden" value="{{$pageTitle}}" id="pageTitle">
<script>
    $(document).ready(function() {
        let route = "";
        let pageTitle = $("#pageTitle").val();

        if (pageTitle === "Customer With Order") {
            route = "{!! route('customer.index.with.order') !!}";
        } else {
            route = "{!! route('customer.index') !!}";
        }
        renderTable(route);

        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });

        $("#customer").select2();

        $('#customer').on('change', function() {
            var selectedCusId = $(this).val();
            if (selectedCusId == "") {
                $('#companyname').val("");
            }
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
                        $("#companyname").prop("readonly", true);
                        $("#customer_id-error,#location-error,#address_1-error,#address_2-error,#city-error,#zipcode-error,#state-error,#description-error").text("");
                        $("#selectId").prop("selected", true);
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

        function renderTable(route) {
            $('#customers').DataTable({
                processing: true,
                serverSide: true,
                ajax: route,
                columns: [
                    {
                        data: 'DT_RowIndex',
                        orderable: false,
                        searchable: false
                    },
                    {
                        data: 'customer_id',
                        render: function(data, type, row) {
                            return '<a href="/customer/customer/zone/' + row.id + '">' + data + '</a>';
                        }
                    },
                    {
                        data: 'company_name',
                        render: function(data, type, row) {
                            return '<a href="/customer/customer/zone/' + row.id + '">' + data + '</a>';
                        }
                    },
                    { data: 'customer_type' },
                    { data: 's_rate' },
                    { data: 'e_rate' },
                    { data: 'travel' },
                    {
                        data: null,
                        render: function(data, type, row) {
                            return '<div class="button-container d-flex align-items-center">' +
                                '<div class="dropdown">' +
                                '<i class="fas fa-ellipsis-v custom-icon mx-4" id="dropdownMenuButton_' + row.id + '" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="cursor: pointer;"></i>' +
                                '<div class="dropdown-menu" aria-labelledby="dropdownMenuButton_' + row.id + '">' +
                                '<a class="dropdown-item no-modal edit-button" data-id="' + row.id + '">Edit</a>' +
                                '<a class="dropdown-item no-modal delete-button" data-id="' + row.id + '">Delete</a>' +
                                '</div>' +
                                '</div>' +
                                '</div>';
                        }
                    },
                ],
                columnDefs: [
                    {
                        targets: '_all',
                        className: 'nowrap'
                    },
                    {
                        "targets": [7],
                        "orderable": false 
                    }
                ]
            });
        }

        //delete button
        $(document).on('click', '.delete-button', function() {
            let id = $(this).data('id');
            let route = "{{ route('customer.delete',':id') }}";
            route = route.replace(':id', id);

            $('#del-confirm').find('#del-button').attr('href', route);
            $('#del-confirm').modal('show');
        });

        //edit button
        $(document).on('click', '.edit-button', function() {
            let id = $(this).data('id');
            let route = "{{ route('customer.edit',':id') }}";
            route = route.replace(':id', id);
            window.location.href = route;
        });

    });
</script>

@endsection