@extends('admin.layoutsNew.app')
@section('script')
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
@endsection
@section('content')
<svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
    <symbol id="check-circle-fill" fill="currentColor" viewBox="0 0 16 16">
        <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z" />
    </symbol>
    <symbol id="info-fill" fill="currentColor" viewBox="0 0 16 16">
        <path d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16zm.93-9.412-1 4.705c-.07.34.029.533.304.533.194 0 .487-.07.686-.246l-.088.416c-.287.346-.92.598-1.465.598-.703 0-1.002-.422-.808-1.319l.738-3.468c.064-.293.006-.399-.287-.47l-.451-.081.082-.381 2.29-.287zM8 5.5a1 1 0 1 1 0-2 1 1 0 0 1 0 2z" />
    </symbol>
    <symbol id="exclamation-triangle-fill" fill="currentColor" viewBox="0 0 16 16">
        <path d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z" />
    </symbol>
</svg>
<div class="content-wrapper" style="background-color: white;">
    <!-- Content Header (Page header) -->
    @include('admin.includeNew.breadcrumb')
    <!-- /.content-header -->
    <div class="container-fluid">
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-header">
                        <h4 class="text-dark">Get Distance of Technician From The Project Site</h4>
                    </div>
                    <div class="card-body">
                        <div class="form-row">
                            <div class="form-group col-4">
                                <label><strong>
                                        <h6 class="text-dark">Provide your project site address below :</h6>
                                    </strong></label>
                                <input type="text" id="siteAddress" class="form-control" name="site_address" placeholder="Enter project site address">
                                <span style="color:red; font-size:15px" id="errors-container"></span>
                            </div>


                            {{-- <div class="form-group col-4">
                                <label><strong>
                                        <h6 class="text-dark">Select Mode of Transportation :</h6>
                                    </strong></label>
                                <select name="mode" id="mode" class="form-control">
                                    <option value="">Select Mode</option>
                                    <option value="driving">Driving</option>
                                    <option value="transit">Transit</option>
                                    <option value="walking">Walking</option>
                                    <option value="bycycling">Cycling</option>
                                </select>
                                <span style="color:red; font-size:15px" id="errors-container2"></span>
                            </div> --}}



                            <div class="form-group col-4">
                                <button type="button" id="submit" class="btn btn-danger" style="margin-top:39px; margin-left:10px;">Start Execution</button>
                            </div>
                        </div>
                        {{-- <div id="warning-text">
                                <div class="alert alert-danger d-flex align-items-center justify-content-between" role="alert">
                                    <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Danger:"><use xlink:href="#exclamation-triangle-fill"/></svg>
                                    <div class="me-auto">
                                      Something went wrong!
                                    </div>
                                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                </div>
                            </div> --}}
                        <div class="d-none" id="loader">
                            <h6 class="text-dark"><strong>Please wait for the responses from google</strong></h6>
                            <div class="spinner-grow text-danger" role="status">
                                <span class="visually-hidden">Loading...</span>
                            </div>
                        </div>
                        <div class="d-none" id="removable-div">
                            <table class="table table-bordered text-dark" id="data-table">
                                <thead>
                                    <tr>
                                        <th class="text-nowrap">Technician ID</th>
                                        <th>Email</th>
                                        <th>Phone</th>
                                        <th class="text-nowrap">Company Name</th>
                                        <th>Status</th>
                                        <th class="text-nowrap">Skill Sets</th>
                                        <th>Rate</th>
                                        <th>Travel Fee</th>
                                        <th>Preferred?</th>
                                        <th class="text-nowrap">Distance From Address</th>
                                        <th>Duration</th>
                                        <th class="text-nowrap">Is Within Radius ?</th>
                                    </tr>
                                </thead>
                                <tbody id="tbody">

                                </tbody>
                            </table>
                        </div>
                    </div>
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

        $(document).on('click', '#submit', function() {
            // destination means site address
            let destination = $('#siteAddress').val();
            // let mode = $('#mode').val();
            $('#loader').removeClass('d-none');
            $.ajax({
                url: "{{ route('distance.get.response') }}",
                type: "POST",
                data: {
                    "destination": destination,
                    // "mode": mode
                },
                datatype: "JSON",
                success: function(data) {
                    $('#errors-container').empty();
                    $('#removable-div').removeClass('d-none');
                    $('#loader').addClass('d-none');
                    let html = "";
                    $.each(data.technicians, function(key, value) {
                        html += '<tr>' +
                            '<td class="text-center align-middle mt-auto">' + value.technician_id + '</td>' +
                            '<td class="text-center align-middle mt-auto">' + value.email + '</td>' +
                            '<td class="text-center align-middle mt-auto">' + value.phone + '</td>' +
                            '<td class="text-center align-middle mt-auto">' + value.company_name + '</td>' +
                            '<td class="text-center align-middle mt-auto">' + value.status + '</td>' +
                            '<td class="text-center align-middle mt-auto">' + value.skills + '</td>' +
                            '<td class="text-center align-middle mt-auto">' + value.rate + '</td>' +
                            '<td class="text-center align-middle mt-auto">' + value.travel_fee + '</td>' +
                            '<td class="text-center align-middle mt-auto">' + value.preference + '</td>' +
                            '<td class="text-center align-middle mt-auto">' + value.distance + '</td>' +
                            '<td class="text-center align-middle mt-auto">' + value.duration + '</td>' +
                            '<td class="text-center align-middle mt-auto">' + value.radius + '</td>' +
                            '</tr>';
                    });
                    $('#tbody').html(html);



                },
                error: function(data) {
                    if (data.status == 422) {
                        let destination_errors;
                        let mode_errors;
                        destination_errors = data.responseJSON.errors.destination;
                        $.each(destination_errors, function(key, value) {
                            $('#errors-container').text(value);
                        });
                        mode_errors = data.responseJSON.errors.mode;
                        $.each(mode_errors, function(key, value) {
                            $('#errors-container2').text(value);
                        });
                    }
                }
            });
        });
    });
</script>
@endsection