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
    .header-text{
       margin-left:30px;
    }
    hr {
  all: initial;
  display: block;
  border-bottom: 2px dotted black;
  margin-top:20px;
}
  th {
    font-weight: normal;
}

    #work-order {
        padding-left: 20px;
    }

    .container {
        display: flex;
        justify-content: space-between;
        align-items: center;
    }

    .header-image {
        width: 200px;
        margin-top: 20px;
    }

    .header-text {
        text-align: right;
        margin-top: -100px;

    }

    .header-cell {
        font-size: 30px;
        text-align: center;
    }
</style>
<div class="container-fluid">
    <div class="card">
        <div class="card-body">
            <section class="container">
                <!-- header section -->
                <nav class="navbar navbar-expand-lg" style="margin-top: -30px">
                    <div class="container custom-navbar justify-content-center"> 
                        <a class="navbar-brand" href="#">
                            <div class="header-flex">
                                <div class="container">
                                    <img style="margin-left:-15px" src="data:image/jpeg;base64,{{ base64_encode(file_get_contents('assetsNew/dist/img/mainlogo.png')) }}" alt="" class="header-image">
                                    <h5 class="header-text" style="color:black">1905 Marketview Dr. <br>Suite 226 <br> Yorkville, IL 60560</h5>
                                </div>
                            </div>
                        </a>
                        <div class="collapse navbar-collapse" id="navbarScroll">
                            <ul class="navbar-nav my-2 my-lg-0 navbar-nav-scroll" style="--bs-scroll-height: 100px;">
                            </ul>
                            <form class="">
                                <h5 style="float: right; color:black" href="http://www.techyeahinc.com" class="header-text">www.techyeahinc.com</h5>
                            </form>
                        </div>
                    </div>
                </nav>

                <!-- Table Tamplate -->
              <table class="custom-table" style="margin-top:-40px">
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
                    <th><b>Main Telephone:</b> {{$views->main_tel}}</th>
                </tr>
                <tr>
                    <th><b>Hours:</b> {{$views->h_operation}}</th>
                </tr>
            </tbody>
        </table>


                    <section class=" others-section mt-4">
            <h4 style="margin-top:50px"><span style="background-color:yellow; padding:5px;" >Scheduled for:{{$views->on_site_by}}/{{$views->h_operation}}</span></h4>
            <div class="contact-info " style="margin-top:-16px">
                <h5 style="font-weight: bold; color: black;">Project Manager: {{@$views->customer->project_manager}}</h5>
                <h5 style="font-weight: bold; color: black;margin-top:-16px">Phone: {{@$views->customer->phone}}</h5>
                <h5 style="font-weight: bold; color: black;margin-top:-16px">Email: {{@$views->customer->email}}</h5>
            </div>
            <div class="mt-4">
                <p>Contact Tech Yeah at {{@$views->customer->phone}} upon arrival at the job site to log in and upon work completion to checkout
                    or you may not receive payment.</p>
                <h5 class="mt-4">{!!$views->instruction!!}</h5>
                <h5>{{$views->a_instruction}}</h5>
                <div style="margin-top:-20px">
                    @if($views->e_checkin == null)
                    <h5>Earliest Check-in: N/A</h5>
                    @else
                    <h4>Earliest Check-in: {{$views->e_checkin}}</h4>
                    @endif
                    @if($views->l_checkin == null)
                    <h5>Latest Check-in: N/A</h5>
                    @else
                    <h5>Latest Check-in: {{$views->l_checkin}}</h5>
                    @endif
                </div>
                <hr>
                <div class="d-flex" style="margin-top:-20px">
                    <h5>REQUIRED TOOLS:  {!! $views->r_tools !!}</h5>
                </div>
            </div>
            <div>
            <h4>  <span style="background-color:yellow; padding:5px;">Upon Arrival on Site:</span> </h4>

            
                <ul>
                    <li class="p-2">Check in with PM {{@$views->customer->project_manager}} at {{@$views->customer->phone}} upon arrival.</li>
                    <li class="p-2">Complete the scope as listed above.</li>
                    <li class="p-2">Send all pictures to <a href="">{{@$views->customer->email}}</a>.</li>
                    <li class="p-2">Check out with the onsite contact.</li>
                    <li class="p-2">Check out with {{@$views->customer->project_manager}} at {{@$views->customer->phone}}.</li>
                </ul>
                <h4>Scope Of Work: </h4>
                {!! $views->scope_work !!}
            </div>
            <div class="">
                <h4><span style="padding:5px;">Deliverables:  {!! $views->deliverables !!}</span></h4>
            </div>
       
              <h4 style="margin-left:7px">Picture: </h4>
           <div style="text-align: center; margin-top:-25px">
           @if($imageFileNames != null)
        @foreach ($imageFileNames as $imageName)
            <img src="data:image/jpeg;base64,{{ base64_encode(file_get_contents('public/imgs/' . $imageName))}}" alt="Random Image" style="border: 2px solid #555; width: 350px; height: 250px; margin: 2px;">
        @endforeach
        @else
        <p>No Image</p>       
         @endif
          </div>
 
            <div class="flex-container " >
                <div class="form-section"style="width:300px; margin-top:50px">
                    <p class="form-label">Technician Name (print):</p>
                    <input type="text" class="form-input" value="{{@$views->technician->company_name}}" style="width:300px; border: none; border-bottom: 1px solid black;">
                </div>
                <div class="form-section" style="margin-left:350px ; margin-top:-60px">
                    <p class="form-label">Signature:</p>
                    <input type="text" class="form-input" style="width:300px; border: none; border-bottom: 1px solid black;">
                </div>
              </div>








              
              <!-- doneeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee -->






                <p class="mt-5">The work described above has been completed to my satisfaction:</p>
               <div class="flex-container mt-5">
                <div class="form-section">
                    <p class="form-label">Customer Name (please print):</p>
                    <input  type="text" class="form-input" value="{{@$views->customer->company_name}}"style="width:300px; border: none; border-bottom: 1px solid black;">
                </div>
                <div class="form-section"style="margin-left:350px ; margin-top:-60px"">
                    <p class="form-label">Customer Signature:</p>
                    <input type="text" class="form-input" style="width:300px; border: none; border-bottom: 1px solid black;">
                </div>
            </div>
            @php
            $date = date('d-m-y');
            @endphp
            <p class="form-label mt-5">Date:</p>
            <input  type="text" class="form-input" value="{{$date}}" style="width:300px; border: none; border-bottom: 1px solid black;">
            
            
          <h6 class="text-center" style="margin-top:100px; text-align: center;"><b>If you are not satisfied with the work performed on this order, <br>please contact Tech Yeah at 630.474.5234</b></h6>



    <div  style="display: flex; justify-content: space-between; align-items: center; margin-top: 50px; margin-top:100px">
<div>

<b> Tech Yeah </b>
</div>
    <div style="float:right">
<b>2024</b>    </div>
</div>
</section>
        </div>
    </div>
</div>
</div>