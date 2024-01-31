@extends('admin.layoutsNew.app')
@section('script')
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/css/select2.min.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.8/js/select2.min.js" defer></script>
<link rel="stylesheet" href="{{asset('assetsNew/main_css/customer/site.css')}}">
@endsection
@section('content')
@php
use App\Models\Customer;
$customers = Customer::all();
@endphp

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
                            <a href="{{route('customer.create')}}" class="btn btn-primary"><i class="fas fa-user"></i>
                                Add Customer</a>
                            <div class="button btn btn-primary my-2" data-bs-toggle="modal" data-bs-target="#staticBackdrop"> <i class="fas fa-building"></i>
                                Add Customer Site</div>
                        </div>

                    </div>
                </div>

            </div>
            <div class="card-body">
                <table id="example" class="table-responsive table-hover">
                    <thead>
                        <tr class="text-center">
                            <th>#SL</th>
                            <th>Site ID</th>
                            <th>Company Name</th>
                            <th>Standard Rate</th>
                            <th>Emergency Rate</th>
                            <th>Description</th>
                            <th>Location</th>
                            <th>Address 1</th>
                            <th>Address 2</th>
                            <th>City</th>
                            <th>State</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach($sites as $key=>$site)
                        <tr class="text-center table-bordered">
                            <td>{{$key +1}}</td>
                            <td>{{$site->site_id}}</td>
                            <td>{{@$site->customer->company_name}}</td>
                            <td>{{@$site->customer->s_rate}}</td>
                            <td>{{@$site->customer->e_rate}}</td>
                            <td>{{$site->description}}</td>
                            <td>{{$site->location}}</td>
                            <td>{{$site->address_1}}</td>
                            <td>{{$site->address_2}}</td>
                            <td>{{$site->city}}</td>
                            <td>{{$site->state}}</td>
                            <td class="dropdown">
                                <a id="siteActionsDropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <i class="fas fa-ellipsis-v custom-icon" style="cursor: pointer;"></i>
                                </a>
                                <div class="dropdown-menu" aria-labelledby="siteActionsDropdown">
                                    <a class="dropdown-item" href="{{ url('/customer/edit/site') }}/{{ $site->id }}">
                                        <i class="fas fa-pencil-alt"></i> Edit
                                    </a>
                                    <a class="dropdown-item text-danger delete-button" href="{{ url('/customer/delete/site') }}/{{ $site->id }}" data-toggle="modal" data-target="#confirmationModal-{{ $site->id }}">
                                        <i class="fas fa-trash-alt"></i> Delete
                                    </a>

                                </div>
                            </td>

                        </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <div class="modal fade" id="confirmationModal-{{ $site->id }}" tabindex="-1" role="dialog" aria-labelledby="confirmationModalLabel" aria-hidden="true">
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
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                    <a href="{{ url('/customer/delete/site') }}/{{ $site->id }}" class="btn btn-danger">Delete</a>
                </div>
            </div>
        </div>
    </div>

    <!--add Site Modal -->
    <div class="modal fade text-dark" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header bg-primary d-flex justify-content-between">
                    <h5 class="modal-title" id="staticBackdropLabel">Add Site</h5>
                    <button type="button" class="btn-close" id="close-modal" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label class="form-label" for="customer_id"> Customer Id:</label>
                                    <select class="form-control" name="customer_id" id="customer" style="width:100%">
                                        <option value="">Select Customer Id</option>
                                        @foreach($customers as $cu)
                                        <option value="{{$cu->id}}">{{$cu->customer_id}}</option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-body">
                    <div class="form-row">
                        <label for="companyname">Company Name:</label>
                        <input type="text" id="companyname" class="form-control" readonly>
                    </div>
                </div>
                <div class="modal-body">
                    <div class="form-row">
                        <label for="">Location Name</label>
                        <input type="text" class="form-control" name="location" placeholder="Enter Location name...." id="location">
                    </div>
                </div>
                <div class="modal-body">
                    <div class="form-row">
                        <label for="">Property Description</label>
                        <textarea class="form-control" name="description" id="description" cols="10" rows="5">Enter description....</textarea>
                    </div>
                </div>
                <div class="modal-body">
                    <div class="form-row">
                        <label for="">Address 1</label>
                        <input type="text" class="form-control" name="address_1" placeholder="Enter address_1...." id="address_1">
                    </div>
                </div>
                <div class="modal-body">
                    <div class="form-row">
                        <label for="">Address 2</label>
                        <input type="text" class="form-control" name="address_2" placeholder="Enter address_2...." id="address_2">
                    </div>
                </div>
                <div class="modal-body">
                    <div class="form-row">
                        <label for="">City</label>
                        <input type="text" class="form-control" name="city" placeholder="Enter city...." id="city">
                    </div>
                </div>
                <div class="modal-body">
                    <div class="form-row">
                        <label for="">Zip Code</label>
                        <input type="text" class="form-control" name="zipcode" placeholder="Enter zip...." id="zipcode">
                    </div>
                </div>
                <div class="modal-body">
                    <div class="form-row">
                        <label for="">State</label>
                        <input type="text" class="form-control" name="state" placeholder="Enter state...." id="state">
                        <span style="color:red; font-size:14px" id="errors-container"></span>
                        <span style="color:rgb(21, 198, 110); font-size:16px; font-weight:bold" id="success-container"></span>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn bg-primary btn-block" id="save">Save</button>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $(document).ready(function() {
        $('.delete-button').click(function(e) {
            e.preventDefault();
            var targetModal = $(this).data('target');
            $(targetModal).modal('show');
        });
    });
</script>
<script>
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
        var cus = this.value;

        $("#customer").select2({
            data: cus
        });
        //add site ajax code start
        $(document).on('click', '#save', function() {
            let errorsContainer = $('#errors-container');
            let id = $('#customer').val();
            let location = $('#location').val();
            let description = $('#description').val();
            let address_1 = $('#address_1').val();
            let address_2 = $('#address_2').val();
            let city = $('#city').val();
            let state = $('#state').val();
            let zipcode = $('#zipcode').val();
            let showToast = true;
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
                        $('#errors-container').empty();
                        $('#success-container').text(response.message).fadeIn();
                        setTimeout(function() {
                            $('#success-container').fadeOut();
                        }, 3000);
                    }
                    errorsContainer.empty();
                },
                error: function(response) {
                    if (response.status == 422) {
                        errors = response.responseJSON.errors;
                        $.each(errors, function(key, value) {
                            errorsContainer.text(value);
                        });
                    }
                }
            });
        });
    });
</script>
@endsection