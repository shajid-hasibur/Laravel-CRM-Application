<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="{{asset('assetsNew/main_css/customer/work_order_view.css')}}">
<style>
    .custom-table {
        border-collapse: collapse;
        width: 100%;
        margin-top: 5px;
    }

    .custom-table th {
        border: 1px solid #000;
        padding: 10px;
        text-align: left;
    }

    .header-text {
        margin-left: 30px;
    }

    hr {
        all: initial;
        display: block;
        border-bottom: 2px dotted black;
        margin-top: 20px;
    }

    th {
        font-weight: normal;
    }
</style>

<body>
    <div class="container">
        <div class="row mb-5">
            <div class="col-md-8">
                <img style="width: 200px;  margin-left:-15px; " src="data:image/jpeg;base64,{{ base64_encode(file_get_contents('assetsNew/dist/img/mainlogo.png')) }}" alt="" class="header-image">
            </div>
            <div class="col-md-4">
                <p class="header-text text-nowrap" style="font-size:18px;color:black;">1905 Marketview Dr.<br>Suite 226 <br>Yorkville, IL 60560</p>
                <p style="font-size:18px;" class="header-text"><u>www.techyeahinc.com</u></p>
            </div>
        </div>
        <table class="custom-table mt-4">
            <tbody>
                <tr class="headerline">
                    <th class="header-cell" id="work-order" style="background-color:#1e90ff;font-size:35px;font-weight:bold;">Tech Yeah Work Order #: {{$views->order_id}}</th>
                </tr>
                <tr>
                    <th><b>Date:</b> {{$views->open_date}}</th>
                </tr>
                <tr>
                    <th><b>Location Name & Site ID:</b> {{@$views->site->location}} ({{@$views->site->site_id}})</th>
                </tr>
                <tr>
                    <th><b>Address, City, State & Zip:</b> {{@$views->site->address_1}}, {{@$views->site->address_2}}, {{@$views->site->city}}, {{@$views->site->state}} - {{@$views->site->zipcode}}</th>
                </tr>
                <tr>
                    <th><b>Site Contact:</b> {{@$views->site_contact_name}}</th>
                </tr>
                <tr>
                    <th><b>Main Telephone:</b> {{@$views->main_tel}}</th>
                </tr>
                <tr>
                    <th><b>Hours:</b> {{@$views->h_operation}}</th>
                </tr>
            </tbody>
        </table>
        <section class=" others-section mt-4">
            <h5><span class="badge-warning p-2 ">Scheduled for :{{@$views->on_site_by}}/{{@$views->h_operation}}</span></h5>
            <div class="contact-info mt-4">
                <h5 style="font-weight: bold; color: black;">Project Manager: {{@$views->customer->project_manager}}</h5>
                <h5 style="font-weight: bold; color: black;">Phone: {{@$views->customer->phone}}</h5>
                <h5 style="font-weight: bold; color: black;">Email: {{@$views->customer->email}}</h5>
            </div>
            <div class="my-4">
                <p>Contact Tech Yeah at {{@$views->customer->phone}} upon arrival at the job site to log in and upon work completion to checkout
                    or you may not receive payment.</p>
                <h5 class="my-4">{!!@$views->instruction!!}</h5>
                <h5>{{@$views->a_instruction}}</h5>
                <div>
                    @if(@$views->e_checkin == null)
                    <h5>Earliest Check-in: N/A</h5>
                    @else
                    <h4>Earliest Check-in: {{@$views->e_checkin}}</h4>
                    @endif
                    @if(@$views->l_checkin == null)
                    <h5>Latest Check-in: N/A</h5>
                    @else
                    <h5>Latest Check-in: {{@$views->l_checkin}}</h5>
                    @endif
                </div>
                <hr>
                <div class="">
                    <h5 class="my-5">REQUIRED TOOLS:</h5>
                    {!! @$views->r_tools !!}
                </div>
            </div>
            <div class="">
                <h5 class="my-5"> <span class="badge-warning py-2">Upon Arrival on Site:</span> </h5>
                <ul>
                    <li class="py-2">Check in with PM {{@$views->customer->project_manager}} at {{@$views->customer->phone}} upon arrival.</li>
                    <li class="py-2">Complete the scope as listed above.</li>
                    <li class="py-2">Send all pictures to <a href="">{{@$views->customer->email}}</a>.</li>
                    <li class="py-2">Check out with the onsite contact.</li>
                    <li class="py-2">Check out with {{@$views->customer->project_manager}} at {{@$views->customer->phone}}.</li>
                </ul>
                <div>
                    <h5 class="my-5"> <span class="p-2 ">Scope Of Work: </span> </h5>
                    {!! @$views->scope_work !!}
                </div>
            </div>
            <div class="">
                <h5 class="my-5"><span class=" p-2 ">Deliverables:</span></h5>
                <p>{!! @$views->deliverables !!}:</p>
            </div>
            <br>
            <br>
            <br>
            <h5>Picture: </h5>
            <div class="" style="text-align: center;">
                @if($imageFileNames)
                @foreach (@$imageFileNames as $imageName)
                @php
                $filePath = public_path('imgs/' . $imageName);
                if (file_exists($filePath)) {
                @$imageData = base64_encode(file_get_contents($filePath));
                } else {
                \Log::error("File not found: " . $filePath);
                @$imageData = null;
                }
                @endphp
                @if (@$imageData)
                <img src="data:image/jpeg;base64,{{ $imageData }}" alt="Random Image" style="border: 2px solid #555; width: 350px; height: 250px; margin: 2px;">
                @else
                <img src="https://t4.ftcdn.net/jpg/02/51/95/53/360_F_251955356_FAQH0U1y1TZw3ZcdPGybwUkH90a3VAhb.jpg" alt="Default Image" style="border: 2px solid #555; width: 350px; height: 250px; margin: 2px;">
                @endif
                @endforeach
                @else
                    <h3>no pictures data available</h3>
                @endif
            </div>

            <div class="mt-5">
                <h5>Description of Work Performed (Please list by date):</h5>
                <div class="d-flex mt-4">
                    <div>
                        <h6>QTY</h6>
                        <input type="text" style=" border: none; border-bottom: 1px solid black;width:100px"><br>
                        <input type="text" style=" border: none; border-bottom: 1px solid black;width:100px"><br>
                        <input type="text" style=" border: none; border-bottom: 1px solid black;width:100px"><br>
                        <input type="text" style=" border: none; border-bottom: 1px solid black;width:100px"><br>
                        <input type="text" style=" border: none; border-bottom: 1px solid black;width:100px"><br>
                        <input type="text" style=" border: none; border-bottom: 1px solid black;width:100px"><br>
                        <input type="text" style=" border: none; border-bottom: 1px solid black;width:100px"><br>
                    </div>
                    <div class="mx-5">
                        <h6>Description</h6>
                        <input type="text" style=" border: none; border-bottom: 1px solid black;width:780px"><br>
                        <input type="text" style=" border: none; border-bottom: 1px solid black;width:780px"><br>
                        <input type="text" style=" border: none; border-bottom: 1px solid black;width:780px"><br>
                        <input type="text" style=" border: none; border-bottom: 1px solid black;width:780px"><br>
                        <input type="text" style=" border: none; border-bottom: 1px solid black;width:780px"><br>
                        <input type="text" style=" border: none; border-bottom: 1px solid black;width:780px"><br>
                        <input type="text" style=" border: none; border-bottom: 1px solid black;width:780px"><br>
                    </div>
                </div>
            </div>

            <div class="flex-container mt-5">
                <div class="form-section" style="width:300px">
                    <p class="form-label">Technician Name (print):</p>
                    <input type="text" class="form-input" value="{{@$views->technician->company_name}}" style="width:300px">
                </div>
                <div class="form-section" style="margin-left:300px">
                    <p class="form-label">Signature:</p>
                    <input type="text" class="form-input" style="width:300px">
                </div>
            </div>
            <p class="mt-5">The work described above has been completed to my satisfaction:</p>
            <div class="flex-container mt-5">
                <div class="form-section">
                    <p class="form-label">Customer Name (please print):</p>
                    <input type="text" class="form-input" value="{{@$views->customer->company_name}}" style="width:300px">
                </div>
                <div class="form-section" style="margin-left:300px">
                    <p class="form-label">Customer Signature:</p>
                    <input type="text" class="form-input" style="width:300px">
                </div>
            </div>
            @php
            $date = date('d-m-y');
            @endphp
            <p class="form-label mt-5">Date:</p>
            <input type="text" class="form-input" value="{{$date}}" style="width:300px">
            <h6 class="text-center" style="margin-top:100px"><b>If you are not satisfied with the work performed on this order, <br>please contact
                    Tech Yeah at 630.474.5234</b></h6>
            <!-- footer -->
            <div style="display: flex; justify-content: space-between; align-items: center; margin-top: 50px; margin-top:100px">
                <div>
                    <b>Tech Yeah</b>
                </div>
                <div>
                    <b>2024</b>
                </div>
            </div>
        </section>
    </div>
</body>