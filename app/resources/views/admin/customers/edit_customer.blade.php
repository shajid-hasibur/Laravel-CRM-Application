@extends('admin.layoutsNew.app')
@section('content')
    <link rel="stylesheet" href="{{ asset('assetsNew/main_css/customer/edit_customer.css') }}">
    <div class="content-wrapper" style="background-color: white;">
        <!-- Content Header (Page header) -->
        @include('admin.includeNew.breadcrumb')
        <!-- /.content-header -->
        <div class="container-fluid text-dark">
            <div class="row">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-header">
                            <div class="row">
                                <div class="col-md-12 d-flex justify-content-between">
                                    <h4><span class="badge bg-success">{{ $edit->company_name }}</span></h4>
                                    <a href="{{ route('customer.index') }}" class="btn btn-primary"><i
                                            class="fas fa-list"></i> Customer List</a>
                                </div>
                            </div>
                        </div>
                        <div class="card-body text-dark">
                            <form action="{{ url('customer/edit/post') }}/{{ $edit->id }}" method="POST"
                                enctype="multipart/form-data">
                                @csrf
                                @method('PUT')
                                <div class="form-row">
                                    <div class="form-group col-4">
                                        <label for="company_name">
                                            <h6>Company Name</h6>
                                        </label>
                                        <input type="text" class="form-control" name="company_name"
                                            placeholder="Enter company name" value="{{ $edit->company_name }}">
                                        @error('company_name')
                                            <span style="color:red; font-size:14px">{{ $message }}</span>
                                        @enderror
                                    </div>
                                    <div class="form-group col-4">
                                        <label for="customer_type">
                                            <h6>Customer Type</h6>
                                        </label>
                                        <select name="customer_type" class="form-control">
                                            <option value="">Select Billing Term</option>
                                            <option value="Customer"
                                                {{ $edit->customer_type == 'Customer' ? 'selected' : '' }}>Customer</option>
                                            <option value="Prospecting"
                                                {{ $edit->customer_type == 'Prospecting' ? 'selected' : '' }}>Prospecting
                                            </option>
                                            <option value="Etc" {{ $edit->customer_type == 'Etc' ? 'selected' : '' }}>
                                                Etc</option>
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
                                            placeholder="Enter address" value="{{ @$edit->address->address }}">
                                        @error('address')
                                            <span style="color:red; font-size:14px">{{ $message }}</span>
                                        @enderror
                                    </div>
                                    <div class="form-group col-4">
                                        <label for="city">
                                            <h6>City</h6>
                                        </label>
                                        <input type="text" class="form-control" name="city" placeholder="Enter city"
                                            value="{{ @$edit->address->city }}">
                                        @error('city')
                                            <span style="color:red; font-size:14px">{{ $message }}</span>
                                        @enderror
                                    </div>
                                    <div class="form-group col-4">
                                        <label for="country">
                                            <h6>Country</h6>
                                        </label>
                                        <input type="text" class="form-control" name="country"
                                            placeholder="Enter country" value="{{ @$edit->address->country }}">
                                        @error('country')
                                            <span style="color:red; font-size:14px">{{ $message }}</span>
                                        @enderror
                                    </div>
                                    <div class="form-group col-4">
                                        <label for="state">
                                            <h6>State</h6>
                                        </label>
                                        <input type="text" class="form-control" name="state" placeholder="Enter state"
                                            value="{{ @$edit->address->state }}">
                                        @error('state')
                                            <span style="color:red; font-size:14px">{{ $message }}</span>
                                        @enderror
                                    </div>
                                    <div class="form-group col-4">
                                        <label for="zip_code">
                                            <h6>Zip Code</h6>
                                        </label>
                                        <input type="text" class="form-control" name="zip_code" placeholder="Enter zip"
                                            value="{{ @$edit->address->zip_code }}">
                                        @error('zip_code')
                                            <span style="color:red; font-size:14px">{{ $message }}</span>
                                        @enderror
                                    </div>
                                    <div class="form-group col-4">
                                        <label for="email">
                                            <h6>Email</h6>
                                        </label>
                                        <input type="text" class="form-control" name="email" placeholder="Enter email"
                                            value="{{ $edit->email }}">
                                        @error('email')
                                            <span style="color:red; font-size:14px">{{ $message }}</span>
                                        @enderror
                                    </div>
                                    <div class="form-group col-4">
                                        <label for="phone">
                                            <h6>Phone</h6>
                                        </label>
                                        <input type="number" class="form-control" name="phone" placeholder="Enter phone"
                                            value="{{ $edit->phone }}">
                                        @error('phone')
                                            <span style="color:red; font-size:14px">{{ $message }}</span>
                                        @enderror
                                    </div>
                                    <div class="form-group col-4">
                                        <label for="s_rate">
                                            <h6>Standard Rate</h6>
                                        </label>
                                        <input type="number" class="form-control" name="s_rate"
                                            placeholder="Standard Rate" value="{{ $edit->s_rate }}">
                                        @error('s_rate')
                                            <span style="color:red; font-size:14px">{{ $message }}</span>
                                        @enderror
                                    </div>
                                    <div class="form-group col-4">
                                        <label for="e_rate">
                                            <h6>Emergency Rate</h6>
                                        </label>
                                        <input type="number" class="form-control" name="e_rate"
                                            placeholder="Enter Emergency rate" value="{{ $edit->e_rate }}">
                                        @error('e_rate')
                                            <span style="color:red; font-size:14px">{{ $message }}</span>
                                        @enderror
                                    </div>
                                    <div class="form-group col-4">
                                        <label for="travel">
                                            <h6>Tavel</h6>
                                        </label>
                                        <input type="number" class="form-control" name="travel"
                                            placeholder="Enter travel" value="{{ $edit->travel }}">
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
                                            <option value="NET30" {{ $edit->billing_term == 'NET30' ? 'selected' : '' }}>
                                                NET30</option>
                                            <option value="NET45" {{ $edit->billing_term == 'NET45' ? 'selected' : '' }}>
                                                NET45</option>
                                            <option value="Etc" {{ $edit->billing_term == 'Etc' ? 'selected' : '' }}>
                                                Etc</option>
                                        </select>
                                        @error('billing_term')
                                            <span style="color:red; font-size:14px">{{ $message }}</span>
                                        @enderror
                                    </div>
                                    <div class="form-group col-4">
                                        <label for="type_phone">
                                            <h6>Type Of Phone</h6>
                                        </label>
                                        <input type="text" class="form-control" name="type_phone"
                                            placeholder="Type Of Phone" value="{{ $edit->type_phone }}">
                                        @error('type_phone')
                                            <span style="color:red; font-size:14px">{{ $message }}</span>
                                        @enderror
                                    </div>
                                    <div class="form-group col-4">
                                        <label for="type_wireless">
                                            <h6>Type Of Wireless</h6>
                                        </label>
                                        <input type="text" class="form-control" name="type_wireless"
                                            placeholder="Type Of Wireless" value="{{ $edit->type_wireless }}">
                                        @error('type_wireless')
                                            <span style="color:red; font-size:14px">{{ $message }}</span>
                                        @enderror
                                    </div>
                                    <div class="form-group col-4">
                                        <label for="type_cctv">
                                            <h6>Type Of CCTV</h6>
                                        </label>
                                        <input type="text" class="form-control" name="type_cctv"
                                            placeholder="Type Of CCTV" value="{{ $edit->type_cctv }}">
                                        @error('type_cctv')
                                            <span style="color:red; font-size:14px">{{ $message }}</span>
                                        @enderror
                                    </div>
                                    <div class="form-group col-4">
                                        <label for="type_pos">
                                            <h6>Type Of POS</h6>
                                        </label>
                                        <input type="text" class="form-control" name="type_pos"
                                            placeholder="Type Of POS" value="{{ $edit->type_pos }}">
                                        @error('type_pos')
                                            <span style="color:red; font-size:14px">{{ $message }}</span>
                                        @enderror
                                    </div>
                                    <div class="form-group col-4">
                                        <label for="team">
                                            <h6>Team</h6>
                                        </label>
                                        <select name="team" class="form-control">
                                            <option value="">Select Team</option>
                                            <option value="Blue Team" {{ $edit->team == 'Blue Team' ? 'selected' : '' }}>
                                                Blue Team</option>
                                            <option value="Red Team" {{ $edit->team == 'Red Team' ? 'selected' : '' }}>Red
                                                Team</option>
                                            <option value="Etc" {{ $edit->team == 'Etc' ? 'selected' : '' }}>Etc
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
                                            placeholder="Sales person assign" value="{{ $edit->sales_person }}">
                                        @error('sales_person')
                                            <span style="color:red; font-size:14px">{{ $message }}</span>
                                        @enderror
                                    </div>
                                    <div class="form-group col-6">
                                        <label for="project_manager">
                                            <h6>Project Manager Assigned</h6>
                                        </label>
                                        <input type="text" class="form-control" name="project_manager"
                                            placeholder="Project Manager assign" value="{{ $edit->project_manager }}">
                                        @error('project_manager')
                                            <span style="color:red; font-size:14px">{{ $message }}</span>
                                        @enderror
                                    </div>
                                    <div class="form-group col-12">
                                        <button type="submit" class="btn btn-primary btn-block">Update</button>
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
