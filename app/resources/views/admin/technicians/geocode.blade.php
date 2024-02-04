@extends('admin.layoutsNew.app')
@section('script')
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
@endsection
@section('content')
<div class="content-wrapper" style="background-color: white;">
    @include('admin.includeNew.breadcrumb')
    <div class="container-fluid">
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-header text-center">
                        <h5>Get Co-Ordinates From Address</h5>
                    </div>
                    <div class="card-body">
                        <form id="tech-coordinates-form">
                            @csrf
                            <div class="row">
                                <div class="form-group col-4">
                                    <label for="Choose Technician">Search Technician</label>
                                    <input type="text" id="tech_autocomplete" class="form-control">
                                    <input type="hidden" id="techId" name="techId" readonly>
                                    <span id="technician_error" style="font-size: 15px; color: red"></span>
                                </div>
                                <div class="form-group col-4">
                                    <label for="Latitude">Latitude</label>
                                    <input type="text" name="tech_lat" id="latitude" class="form-control" readonly>
                                    <span id="technician_lat_error" style="font-size: 15px; color: red"></span>
                                </div>
                                <div class="form-group col-4">
                                    <label for="Longitude">Longitude</label>
                                    <input type="text" name="tech_long" id="longitude" class="form-control" readonly>
                                    <span id="technician_long_error" style="font-size: 15px; color: red"></span>
                                </div>
                                <div class="form-group col-8">
                                    <label for="Longitude">Give An Address</label>
                                    <input type="text" id="address-input" class="form-control">
                                    <span id="responed-address"></span>
                                </div>
                                <div class="form-group col-4">
                                    <button type="button" class="btn btn-primary" id="coordinate-btn" style="margin-top: 32px;">Get Co-Ordinates</button>
                                </div>
                                <div class="form-group col-12 text-left">
                                    <button type="submit" class="btn btn-primary" id="coordinate-btn">Assign Co-Ordinate</button>
                                    <button type="button" class="btn btn-secondary" id="reset-btn">Reset</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $(document).ready(function(){

        $('#reset-btn').on('click',function(){
            $('#tech_autocomplete,#latitude,#longitude,#address-input,#techId').val("");
            $('#technician_error,#technician_lat_error,#technician_long_error').text("");
            $('#responed-address').text("");
        });

        $('#tech-coordinates-form').on('submit',function(e){
            e.preventDefault();
            let formData = new FormData(this);

            $.ajax({
                url: "{{ route('technician.assign.coordinate') }}",
                type: "POST",
                data:formData,
                contentType: false,
                processData: false,
                success:function(data){
                    $('#technician_error,#technician_lat_error,#technician_long_error,#responed-address').text("");
                    $('#tech-coordinates-form')[0].reset();
                    iziToast.success({
                        message: data.success,
                        position: "topRight"
                    });
                },
                error:function(xhr, status, error){
                    $('#technician_error,#technician_lat_error,#technician_long_error').text("");
                    if(xhr.status == 422){
                        let errors = xhr.responseJSON.errors;
                        $('#technician_error').text(errors.techId);
                        $('#technician_lat_error').text(errors.tech_lat);
                        $('#technician_long_error').text(errors.tech_long);
                    }
                }
            });
        });

        $('#tech_autocomplete').autocomplete({
            source: function(request, response) {
                $.ajax({
                    url: "{{ route('technician.autocomplete') }}",
                    type: "GET",
                    dataType: "json",
                    data: {
                        "query": request.term,
                    },
                    success: function(data) {
                        response($.map(data.results, function(item) {
                            return {
                                label: item.company_name + "-" + item.technician_id,
                                value: item.company_name + "-" + item.technician_id,
                                techID: item.id,
                            }
                        }));
                    }
                });
            },
            minLength: 1,
            select: function(event, ui) {
                var selectedTechId = ui.item.techID;
                $('#techId').val(selectedTechId);
            }
        });

        $('#coordinate-btn').on('click', function () {
        const address = $('#address-input').val();

        if (address.length > 0) {
            $('#loader').removeClass('d-none');
            $.ajax({
                url: "{{ route('technician.coordinate.get') }}",
                method: 'GET',
                data: { address: address },
                success: function (response) {
                    console.log(response);
                    const firstObject = response[0];
                    $('#latitude').val(firstObject.lat);
                    $('#longitude').val(firstObject.lon);
                    $('#responed-address').text(firstObject.display_name);
                    $('#loader').addClass('d-none');
                },
                error: function (error) {
                    console.error('Error:', error);
                }
            });
        }
    });

    });
</script>
@endsection