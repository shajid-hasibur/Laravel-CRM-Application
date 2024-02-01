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
                        <div class="row">
                            <div class="form-group col-4">
                                <label for="Choose Technician">Search Technician</label>
                                <input type="text" name="tech_id" id="tech_autocomplete" class="form-control">
                            </div>
                            <div class="form-group col-4">
                                <label for="Latitude">Latitude</label>
                                <input type="text" name="tech_id" id="latitude" class="form-control" readonly>
                            </div>
                            <div class="form-group col-4">
                                <label for="Longitude">Longitude</label>
                                <input type="text" name="tech_id" id="longitude" class="form-control" readonly>
                            </div>
                            <div class="form-group col-8">
                                <label for="Longitude">Give An Address</label>
                                <input type="text" id="address-input" class="form-control">
                                <span id="responed-address"></span>
                            </div>
                            <div class="form-group col-4"></div>
                            <div class="form-group col-4">
                                <button type="button" class="btn btn-primary" id="coordinate-btn">Get Co-Ordinates</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $(document).ready(function(){
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