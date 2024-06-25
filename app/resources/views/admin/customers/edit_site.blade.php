@extends('admin.layoutsNew.app')
@section('content')
    <link rel="stylesheet" href="{{ asset('assetsNew/main_css/customer/edit_site.css') }}">

    <div class="content-wrapper" style="background-color: white;">
        <!-- Content Header (Page header) -->
        @include('admin.includeNew.breadcrumb')
        <!-- /.content-header -->
        <div class="container-fluid text-dark">
            <div class="row justify-content-center">
                <div class="col-lg-4">
                    <div class="card">
                        <div class="card-header bg-gray">
                            <div class="row">
                                <div class="col-md-12 d-flex justify-content-between">
                                    <h3>About Site</h3>
                                </div>
                            </div>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-6">
                                    <p><b>Site ID: </b>{{ $edit->site_id }}</p>
                                    <p><b>Company Name: </b>{{ @$edit->customer->company_name }}</p>
                                    <p><b>Standard Rate: </b>{{ @$edit->customer->s_rate }}</p>
                                    <p><b>Address 2: </b>{{ $edit->address_2 }}</p>
                                    <p><b>Property Description: </b>{{ $edit->description }}</p>
                                </div>
                                <div class="col-md-6">
                                    <p><b>Emergency Rate: </b>{{ @$edit->customer->e_rate }}</p>
                                    <p><b>Location Name: </b>{{ $edit->location }}</p>
                                    <p><b>Address 1: </b>{{ $edit->address_1 }}</p>
                                    <p><b>City: </b>{{ $edit->city }}</p>
                                    <p><b>State: </b>{{ $edit->state }}</p>
                                    <p><b>Zip Code: </b>{{ $edit->zipcode }}</p>
                                </div>
                                <a href="{{ url('/customer/delete/site') }}/{{ $edit->id }}"
                                    class="btn btn-danger btn-sm">Delete</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-8">
                    <div class="card">
                        <div class="card-header bg-gray">
                            <div class="row">
                                <div class="col-md-12 d-flex justify-content-between">
                                    <h4><span class="badge bg-success">{{ @$edit->customer->company_name }}</span> Site
                                        Edit</h4>
                                    <a href="{{ url('/customer/customer/zone') }}/{{ $edit->customer->id }}"
                                        class="btn btn-primary">Go Back</a>
                                </div>
                            </div>
                        </div>
                        <div class="card-body text-dark">
                            <form action="{{ url('customer/site/edit/post') }}/{{ $edit->id }}" method="POST"
                                enctype="multipart/form-data">
                                @csrf
                                @method('PUT')
                                <div class="form-row">

                                    <div class="form-group col-md-6">
                                        <label for="">Company Name</label>
                                        <input type="text" class="form-control" name="company_name"
                                            value="{{ $edit->customer->company_name }}" id="company_name">
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="">Standard Rate</label>
                                        <input type="text" class="form-control" name="s_rate"
                                            value="{{ $edit->customer->s_rate }}" id="s_rate">
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="">Emergency Rate</label>
                                        <input type="text" class="form-control" name="e_rate"
                                            value="{{ $edit->customer->e_rate }}" id="e_rate">
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="">Location Name</label>
                                        <input type="text" class="form-control" name="location"
                                            placeholder="Enter Location name...." value="{{ $edit->location }}"
                                            id="location">
                                    </div>

                                    <div class="form-group col-md-6">
                                        <label for="">Address 1</label>
                                        <input type="text" class="form-control" name="address_1"
                                            placeholder="Enter address 1...." value="{{ $edit->address_1 }}"
                                            id="latitude">
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="">Address 2</label>
                                        <input type="text" class="form-control" name="address_2"
                                            placeholder="Enter address 2...." value="{{ $edit->address_2 }}"
                                            id="longitude">
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="">City</label>
                                        <input type="text" class="form-control" name="city"
                                            placeholder="Enter city...." value="{{ $edit->city }}" id="city">
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="">State</label>
                                        <input type="text" class="form-control" name="state"
                                            placeholder="Enter state...." value="{{ $edit->state }}" id="state">
                                    </div>
                                    <div class="form-group col-md-12">
                                        <label for="">Zip Code</label>
                                        <input type="text" class="form-control" name="zipcode"
                                            placeholder="Enter zip...." value="{{ $edit->zipcode }}" id="state">
                                    </div>
                                    <div class="form-group col-md-12">
                                        <label for="">Property Description</label>
                                        <textarea class="form-control" name="description" id="description" cols="30" rows="5"
                                            value="{{ $edit->description }}">{{ $edit->description }}</textarea>
                                    </div>
                                    <div class="form-group col-12">
                                        <button type="submit" class="btn btn-primary w-100">Update</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
