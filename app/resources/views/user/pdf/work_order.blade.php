<!DOCTYPE html>
<html>

<head>

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

        #work-order {
            padding-left: 20px;
        }

        @page {
            margin: 100px 65px;
            border: 1px solid orange;

        }

        header {
            position: fixed;
            top: -60px;
            left: 0px;
            right: 0px;
            height: 50px;
        }

        footer {
            position: fixed;
            bottom: -60px;
            height: 50px;
        }

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

        #work-order {
            padding-left: 20px;
        }

        .second-page-content,
        .third-page-content,
        .fourth-page-content {
            page-break-before: always;
        }

        .first-page-header {
            display: block;
        }

        .second-page-header,
        .third-page-header,
        .fourth-page-header {
            display: none;
        }

        @media print {
            .print>.markdown-preview-view {
                width: 100%;
                text-align: justify !important;
                padding: 20px;
                border: 2px solid lightgrey !important;
            }
        }

        @media print {

            .second-page-content,
            .third-page-content,
            .fourth-page-content {
                margin-top: 100px;
            }

            .first-page-header {
                display: block;
            }

            .second-page-header,
            .third-page-header,
            .fourth-page-header {
                display: none;
            }

            .second-page-content:before,
            .third-page-content:before,
            .fourth-page-content:before {
                content: "";
                display: block;
                height: 50px;
                margin-bottom: -50px;
            }

            @page :first {
                header {
                    content: element(first-page-header);
                }
            }

            @page :not(:first) {
                header {
                    content: element(second-page-header);
                }
            }
        }
    </style>
</head>

<body>
    <header>
        <div class="first-page-header">
            <div style="clear: both;">
                <img style="width: 180px; float: left; margin-left:-12px;" src="data:image/jpeg;base64,{{ base64_encode(file_get_contents('assetsNew/dist/img/mainlogo.png')) }}" alt="">
                <div style="float: right; text-align: right; ">
                    <h5 class="header-text">1905 Marketview Dr. <br>Suite 226 <br> Yorkville, IL 60560 <br>
                        <u>www.techyeahinc.com</u>
                    </h5>

                </div>
            </div>
        </div>
        <div class="second-page-header">
            <div style="clear: both;">
                <img style="width: 180px; float: left; margin-right: 15px;" src="data:image/jpeg;base64,{{ base64_encode(file_get_contents('assetsNew/dist/img/mainlogo.png')) }}" alt="">
                <div style="float: right; text-align: right;">
                    <h5 class="header-text">Second Page Header</h5>
                </div>
            </div>
        </div>
    </header>
    <footer>
        <p>Tech Yeah</p>
    </footer>

    <main>
        <table class="custom-table" style="margin-top: 50px">
            <tbody>
                <tr class="headerline">
                    <th class="header-cell" id="work-order" style="background-color:#1e90ff;font-size:30px;font-weight:bold;">Tech Yeah Work Order #:
                        {{$views->order_id}}
                    </th>
                </tr>
                <tr>
                    <th><b>Date:</b> {{$views->open_date}}</th>
                </tr>
                <tr>
                    <th><b>Location Name & Site ID:</b> {{@$views->site->location}} ({{@$views->site->site_id}})
                    </th>
                </tr>
                <tr>
                    <th><b>Address, City, State & Zip:</b> {{@$views->site->address_1}},
                        {{@$views->site->address_2}}, {{@$views->site->city}}, {{@$views->site->state}} -
                        {{@$views->site->zipcode}}
                    </th>
                </tr>
                <tr>
                    <th><b>Site Contact:</b> {{@$views->site_contact_name}}</th>
                </tr>
                <tr>
                    <th><b>Main Telephone:</b> {{$views->main_tel}}</th>
                </tr>
                <tr>
                    <th><b>Hours:</b> {{$views->h_operation}}</th>
                </tr>
            </tbody>
        </table>
        <!-- ------------------------------------------- -->

        <h4> <span style="background-color: yellow;padding:5px">Scheduled for </span>:{{$views->on_site_by}}/{{$views->h_operation}}
        </h4>
        <!-- ---------------------------------------------- -->
        <div style="margin-top: -30px">
            <h4 style="font-weight: bold; color: black; margin-bottom: 5px;">Project Manager:
                {{@$views->customer->project_manager}}
            </h4>
            <h4 style="font-weight: bold; color: black; margin: -8px 0 5px 0;">Phone:
                {{@$views->customer->phone}}
            </h4>
            <h4 style="font-weight: bold; color: black; margin: -8px 0 0 0;">Email:
                {{@$views->customer->email}}
            </h4>
        </div>
        <!-- ---------------------------------------------- -->
        <p>Contact Tech Yeah at {{@$views->customer->phone}} upon arrival at the job site to log in and upon work
            completion to checkout
            or you may not receive payment.</p>
        <!-- ------------------------------------------- -->
        <h5>{!!$views->instruction!!}</h5>
        <h5>{{$views->a_instruction}}</h5>
        <div>
            @if($views->e_checkin == null)
            <h4 style="margin-top: -25px">Earliest Check-in: N/A</h4>
            @else
            <h4 style="margin-top: -25px">Earliest Check-in: {{$views->e_checkin}}</h4>
            @endif
            @if($views->l_checkin == null)
            <h4 style="margin-top: -15px">Latest Check-in: N/A</h4>
            @else
            <h4 style="margin-top: -15px">Latest Check-in: {{$views->l_checkin}}</h4>
            @endif
        </div>

        <!-- ---------------------------------------- -->
        <div>
            <h5 style="margin-top: -15px">REQUIRED TOOLS: <span>{!! $views->r_tools !!}</span></h5>
        </div>
        <!-- ----------------------------------------------------------- -->
        <div class="second-page-content">
            <h4 style="margin-top: 50px">Upon Arrival on Site: </h4>
            <ul>
                <li class="p-2">Check in with PM {{@$views->customer->project_manager}} at
                    {{@$views->customer->phone}} upon arrival.
                </li>
                <li class="p-2">Complete the scope as listed above.</li>
                <li class="p-2">Send all pictures to <a href="">{{@$views->customer->email}}</a>.</li>
                <li class="p-2">Check out with the onsite contact.</li>
                <li class="p-2">Check out with {{@$views->customer->project_manager}} at
                    {{@$views->customer->phone}}.
                </li>
            </ul>
            <p><b>Scope Of Work:</b> <span> {!! $views->scope_work !!}</span> </p>
        </div>
        <!-- ----------------------------------------------------------- -->
        <div class="third-page-content">
            <h4 style="margin-top: 50px">Deliverables: {!! $views->deliverables !!} </h4>
            <h4 style="margin-left:7px">Picture: </h4>
            <div style="display: flex; justify-content: center;margin-top:80px">
                <div style="display: grid; grid-template-columns: repeat(3, 1fr); gap: 10px; justify-items: center; margin-top: -25px;">
                    @if($imageFileNames != null)
                    @foreach ($imageFileNames as $imageName)
                    <img src="data:image/jpeg;base64,{{ base64_encode(file_get_contents('imgs/' . $imageName))}}" alt="Random Image" style="border: 2px solid #555; width: 250px; height: 200px; margin: 2px; box-sizing: border-box;">
                    @endforeach
                    @else
                    <div style="grid-column: span 3; text-align: center; height: 400px; width: 100%; display: flex; justify-content: center; align-items: center; border: 1px solid black;">
                        <img style="align-items:center" src="data:image/jpeg;base64,{{ base64_encode(file_get_contents('assetsNew/dist/img/no_image.jpg')) }}" alt="">
                    </div>
                    @endif
                </div>
            </div>
        </div>
        <div class="fourth-page-content">
            <!-- --------------------------------------------------From --------------------------->
            <div>
                <h4 style="margin-top: 70px">Description of Work Performed (Please list by date):</h4>
                <input type="text" class="form-input" value="" style="width:650px; border: none; border-bottom: 1px solid black;">
                <br>
                <input type="text" class="form-input" value="" style="width:650px; border: none; border-bottom: 1px solid black;">
                <br>
                <input type="text" class="form-input" value="" style="width:650px; border: none; border-bottom: 1px solid black;">
                <br>
                <input type="text" class="form-input" value="" style="width:650px; border: none; border-bottom: 1px solid black;">
            </div>
            <h4>Equipment/Materials Used:</h4>
            <label>QTY</label>
            <label style="margin-left: 60px;">Description</label>
        </div>
        <label><input style="width: 25px;border-top:none;border-left:none;border-right:none;" type="text"></label>
        <label><input style="width:550px;margin-left: 60px;border-top:none;border-left:none;border-right:none;" type="text"></label>
        <label><input style="width: 25px;border-top:none;border-left:none;border-right:none;" type="text"></label>
        <label><input style="width:550px;margin-left: 60px;border-top:none;border-left:none;border-right:none;" type="text"></label>
        <label><input style="width: 25px;border-top:none;border-left:none;border-right:none;" type="text"></label>
        <label><input style="width:550px;margin-left: 60px;border-top:none;border-left:none;border-right:none;" type="text"></label>
        <label><input style="width: 25px;border-top:none;border-left:none;border-right:none;" type="text"></label>
        <label><input style="width:550px;margin-left: 60px;border-top:none;border-left:none;border-right:none;" type="text"></label>
        <label><input style="width: 25px;border-top:none;border-left:none;border-right:none;" type="text"></label>
        <label><input style="width:550px;margin-left: 60px;border-top:none;border-left:none;border-right:none;" type="text"></label>
        <label><input style="width: 25px;border-top:none;border-left:none;border-right:none;" type="text"></label>
        <label><input style="width:550px;margin-left: 60px;border-top:none;border-left:none;border-right:none;" type="text"></label>
        <label><input style="width: 25px;border-top:none;border-left:none;border-right:none;" type="text"></label>
        <label><input style="width:550px;margin-left: 60px;border-top:none;border-left:none;border-right:none;" type="text"></label>
        <!-- ---------------------------- -->
        <br>
        <br>
        <div style="display: flex; flex-direction: column;">
            <label><b>Technician Name (print):</b></label>
            <input value="{{@$views->technician->company_name}}" type="text" style="width: 160px; margin-top: 15px; border-left:none;border-right:none;border-top:none;font-size: 15px; white-space: nowrap;position: relative; top: 10px;">
            <label><b style="margin-top: 10px;margin-left:30px">Signature:</b></label>
            <input type="text" style="width: 160px; margin-top: 15px; border-left:none;border-right:none;border-top:none;position: relative; top: 10px;">
        </div>
        <p style="margin-top: 45px;">The work described above has been completed to my satisfaction:</p>

        <div style="display: flex; flex-direction: column; margin-top: 55px">
            <label><b>Customer Name (please print):</b></label>
            <input value="{{@$views->customer->company_name}}" type="text" style="width: 100px; border-left:none; border-right:none; border-top:none; font-size: 15px; white-space: nowrap; position: relative; top: 10px;">
            <label><b style="margin-top: 10px; margin-left:50px">Customer Signature:</b></label>
            <input type="text" style="width: 100px; margin-top: 15px; border-left:none; border-right:none; border-top:none ;position: relative; top: 10px;">
        </div>

        @php
        $date = date('d-m-y');
        @endphp
        <div style="margin-top: 20px;">
            <label style="margin-top: 20px;"><b>Date:</b></label>
            <input type="text" value="{{$date}}" style="width: 120px; margin-top: 15px; border-left:none;border-right:none;border-top:none;position: relative; top: 10px;">
        </div>
        <div style="align-items: center; margin-top: 100px; text-align: center;">
            <b> If you are not satisfied with the work performed on this order, <br>
                please contact Tech Yeah at (833) 832-4002</b>
        </div>
    </main>
</body>

</html>