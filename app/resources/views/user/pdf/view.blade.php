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

    .custom-table tr:nth-child(odd) {
        background-color: #3498db;
        /* Blue background for odd rows */
        color: #fff;
        /* White text for odd rows */
    }
</style>

<body>

    <div class="container">
        <div class="row">
            <div class="col-md-8">
                <img style="width: 200px;" src="data:image/jpeg;base64,{{ base64_encode(file_get_contents('assetsNew/dist/img/mainlogo.png')) }}" alt="" class="header-image">
            </div>
            <div class="col-md-4">
                <h5 class="header-text">1905 Marketview Dr. Yorkville, IL 60560 <br></h5>
                <a style="font-size:20px" href="http://www.techyeahinc.com" class="header-text">www.techyeahinc.com</a>
            </div>
        </div>



        <!-- table -->
        <table class="custom-table mt-4">
            <tbody>
                <tr class="headerline">
                    <th class="header-cell" id="work-order">Tech Yeah Work Order #: {{$views->order_id}}</th>
                </tr>
                <tr>
                    <th>Date: {{$views->open_date}}</th>
                </tr>
                <tr>
                    <th>Location Name & Site ID: {{@$views->site->location}} ({{@$views->site->site_id}})</th>
                </tr>
                <tr>
                    <th>Address, City, State & Zip: {{@$views->site->address_1}}, {{@$views->site->address_2}}, {{@$views->site->city}}, {{@$views->site->state}} - {{@$views->site->zipcode}}</th>
                </tr>
                <tr>
                    <th>Site Contact: {{@$views->site_contact_name}}</th>
                </tr>
                <tr>
                    <th>Main Telephone #: {{$views->main_tel}}</th>
                </tr>
                <tr>
                    <th>Hours: {{$views->h_operation}}</th>
                </tr>
            </tbody>
        </table>




        <!-- sechudle -->


        <!-- Scheduled -->
        <section class=" others-section">
            <h3><span class="badge-warning p-2 rounded">Scheduled for {{$views->date_schedule}}</span></h3>
            <div class="contact-info mt-1">
                <h5 style="font-weight: bold; color: black;">Project Manager: {{@$views->customer->project_manager}}</h5>
                <h5 style="font-weight: bold; color: black;">Phone: {{@$views->customer->phone}}</h5>
                <h5 style="font-weight: bold; color: black;">Email: {{@$views->customer->email}}</h5>
            </div>
            <div class="mt-1">
                <p>Contact Tech Yeah at {{@$views->customer->phone}} upon arrival at the job site to log in and upon work completion to checkout
                    or you may not receive payment.</p>
                <h4 class="mt-5">{{$views->instruction}}</h4>
                <!-- <p class="mt-5">Failure to obtain authorization from Tech Yeah for additional work WILL result in NON-Payment
                            </p> -->

                <h5>{{$views->a_instruction}}</h5>
                <div>
                    @if($views->e_checkin == null)
                    <h4>Earliest Check-in: N/A</h4>
                    @else
                    <h4>Earliest Check-in: {{$views->e_checkin}}</h4>
                    @endif
                    @if($views->l_checkin == null)
                    <h4>Latest Check-in: N/A</h4>
                    @else
                    <h4>Latest Check-in: {{$views->l_checkin}}</h4>
                    @endif

                </div>
                <div class="required-tools d-flex">
                    <h5>REQUIRED TOOLS:</h5>
                    {!! $views->r_tools !!}
                </div>
            </div>
            <div class="scope-of-work">
                <h3>Scope Of Work:</h3>

                {!! $views->scope_work !!}

                <h3>Upon Arrival on Site:</h3>
                <ol>
                    <li>Check in with PM {{@$views->customer->project_manager}} at {{@$views->customer->phone}} upon arrival.</li>
                    <li>Complete the scope as listed above.</li>
                    <li>Send all pictures to <a href="">{{@$views->customer->email}}</a>.</li>
                    <li>Check out with the onsite contact.</li>
                    <li>Check out with {{@$views->customer->project_manager}} at {{@$views->customer->phone}}.</li>
                </ol>
            </div>

            <div class="scope-of-work">
                <h3>Deliverables:</h3>
                {!! $views->deliverables !!}
            </div>

            <div class="form-group col-md-12">
                <h3>Random Picture: </h3>
                @if($imageFileNames != null)
                @foreach ($imageFileNames as $imageName)
                <img src="data:image/jpeg;base64,{{ base64_encode(file_get_contents('imgs/' . $imageName))}}" alt="Random Image" style="border: 2px solid #555; width: 350px; height: 250px; margin: 2px;">
                @endforeach
                @else
                <h3>No Image Found</h3>
                @endif
            </div>



            <div class="flex-container mt-5">
                <div class="form-section">
                    <p class="form-label">Technician Name (print):</p>
                    <input type="text" class="form-input" value="{{@$views->technician->company_name}}">
                </div>
                <div class="form-section">
                    <p class="form-label">Signature:</p>
                    <input type="text" class="form-input">
                </div>
            </div>
            <p class="mt-5">The work described above has been completed to my satisfaction:</p>
            <div class="flex-container mt-3">
                <div class="form-section">
                    <p class="form-label">Customer Name (please print):</p>
                    <input type="text" class="form-input" value="{{@$views->customer->company_name}}">
                </div>
                <div class="form-section">
                    <p class="form-label">Customer Signature:</p>
                    <input type="text" class="form-input">
                </div>
            </div>
            @php
            $date = date('d-m-y');
            @endphp
            <p class="form-label mt-5">Date:</p>
            <input type="text" class="form-input w-25" value="{{$date}}">
            <h5 class="text-center mt-5"><b>If you are not satisfied with the work performed on this order, <br>please contact
                    Tech Yeah at 630.474.5234</b></h5>
            <!-- footer -->
            <div class="container rounded" style="text-align: left; margin-top:50px; ">
                <img style="width: 100px;" src="data:image/jpeg;base64,{{ base64_encode(file_get_contents('assetsNew/dist/img/mainlogo.png')) }}" alt="" class="header-image">
                <p style="display: inline; float: right; margin-top:-1px;">2024</p>
            </div>

        </section>





    </div>

</body>