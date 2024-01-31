@extends('admin.layoutsNew.app')
@section('script')
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://js.pusher.com/7.0/pusher.min.js"></script>
@endsection
@section('content')
<div class="content-wrapper" style="background-color: white;">
    @include('admin.includeNew.breadcrumb')
    <style>
        .button {
            background-color: #4CAF50;
            border: none;
            color: white;
            padding: 15px 30px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 10px;
            cursor: pointer;
            border-radius: 5px;
        }

        .button:hover {
            background-color: #45a049;
        }
    </style>

    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <div class="container">
                    <div class="row">
                        <div class="card">                         
                            <div class="card-body d-flex">
                                <div class="mx-auto my-auto">
                                        <a href="{{ route('technician.download.sampleExcel')}}" class="button" id="excelButton"><i class="fas fa-download"></i> Download Excel Sheet</a>
                                    </i>
                                </div>
                                <div class="mx-auto my-auto">
                                    <label>Select an Excel file to import</label>
                                    <form id="import" action="{{ route('technician.excel.import') }}" method="POST" enctype="multipart/form-data">
                                        @csrf
                                        <div>
                                            <input type="file" class="form-control" name="excel_file" id="fileInput">
                                            <span id="error-container" style="color:red; font-size:16px"></span>
                                        </div><br>
                                        <div class="progress d-none" id="removeClass">
                                            <div class="progress-bar progress-bar-striped progress-bar-animated" id="progressBar" role="progressbar" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100" style="width: 0%"></div>
                                        </div>
                                        <button class="btn btn-success mt-3" type="submit">Import</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $(document).ready(function() {

        const pusher = new Pusher('{{ env('PUSHER_APP_KEY') }}', {
            cluster: '{{ env('PUSHER_APP_CLUSTER') }}',
        });

        const channel = pusher.subscribe('excel-import-progress');

        channel.bind('import.progress', function(data) {
            const percentage = data.percentage;
            console.log(percentage);
            
            if (percentage > 0) {
                $('#progressBar').css('width', percentage + '%').attr('aria-valuenow', percentage).text(percentage + '%');
            }
        });

        $(document).on("submit", "#import", function(event) {
            event.preventDefault();
            var formData = new FormData(this);
            var input = $('#fileInput').val();
            
            if (input) {
                $('#removeClass').removeClass('d-none');
                $('#progressBar').text('0%');
            }

            $.ajax({
                url: "{{ route('technician.excel.import') }}",
                type: "POST",
                data: formData,
                contentType: false,
                processData: false,
                success: function(data) {
                    $('#fileInput').val("");
                    iziToast.success({
                        message: data.success,
                        position: "topRight"
                    });
                    $('#error-container').text("");
                    $('#removeClass').addClass('d-none');
                },
                error: function(xhr, status, error) {
                    // Display import errors if any
                    if (xhr.status === 422) {
                        errors = xhr.responseJSON.errors.excel_file;
                        $('#error-container').text(errors).css('color', 'red');
                    } else {
                        // Handle other errors
                        $('#error-container').text("An error occurred while importing the file.").css('color', 'red');
                    }
                    $('#progress-bar').addClass('d-none');
                }
            });
        });
    });
</script>

    
@endsection