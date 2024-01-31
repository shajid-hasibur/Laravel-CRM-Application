@extends('admin.layoutsNew.app')
@section('content')
<div class="content-wrapper" style="background-color: white;">
    @include('admin.includeNew.breadcrumb')
    <style>
        .tax {
            border: 1px solid rgb(189, 166, 166);
            padding: 10px;
            background-color: rgb(189, 166, 166);
            color: black;

        }

        table tr {
            color: white;
            border: 2px solid white;
            color: black;


        }

        hr {
            height: 4px;
            background-color: black;
            opacity: 2;
        }

        .margin-shop {
            margin-left: 12px;
        }
    </style>
    <div class="card">
        <div class="card-header d-flex justify-content-end">
            <a class="button btn btn-outline-success" href="{{ route('customer.pdf', ['id' => $invoice]) }}">Download Pdf</a>
            @if($invoice->invoice->status != 1)
            <button class="btn btn-danger ml-2">Payment Pending</button>
            @else
            <button class="btn btn-success ml-2">This invoice is Paid</button>
            @endif
        </div>
        <div class="card-body">
            <div class="container-fluid mt-5">
                <div class="row">
                    <div class="col-md-3">
                        <h4>INVOICE: {{@$invoice->invoice->invoice_number}}</h4>
                    </div>
                    <div class="col-md-6 text-center">
                        <img src="{{asset('assetsNew/dist/img/invoicelogo.png')}}" alt="Company Logo" class="img-fluid" class="mx-1" style="width:140px">
                        <address>
                            <span>Tech Yeah</span>
                            <span>1905 Marketview Dr.</span>
                            <p>Yorkville, IL 60560</p>
                        </address>
                    </div>
                    <div class="col-md-3 text-right">
                        <table class="table" style="border-collapse: collapse; width: 100%;">
                            <tr>
                                <td style="padding: 10px; text-align: left;"><span style="font-weight: bold;"><span class="tax">Customer ID</span></span></td>
                                <td style="padding: 10px; text-align: right;"><span style="color: #008000;">{{@$invoice->customer->customer_id}}</span></td>
                            </tr>
                            <tr>
                                <td style="padding: 10px; text-align: left;"><span class="tax" style="font-weight: bold;">Date</span></td>
                                <td style="padding: 10px; text-align: right;"><span style="color: #ff6600;">{{$invoice->open_date}}</span></td>
                            </tr>
                            <tr>
                                <td style="padding: 10px; text-align: left;"><span class="tax" style=" font-weight: bold;">Site Number</span></td>
                                <td style="padding: 10px; text-align: right;"><span style="color: #800080;">{{@$invoice->site->site_id}}</span></td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div class="row  mt-5">
                    <div class="col-md-3">
                        <h6 class="tax">Bill To:</h6>
                        <span>{{@$invoice->customer->company_name}}. {{@$invoice->customer->address->address}}, {{@$invoice->customer->address->city}}, {{@$invoice->customer->address->state}}, {{@$invoice->customer->address->zip_code}}, {{@$invoice->customer->address->country}}</span>
                    </div>
                    <div class="col-md-6 text-center">

                        <address>
                            <span>Tax ID: 92-0586580</span>
                        </address>
                    </div>
                    <div class="col-md-3 text-left"> <!-- Added class "ship-to-section" -->
                        <div class="margin-shop">
                            <h6 class="tax">Ship To:</h6>
                            <span>{{@$invoice->site->location}}. {{@$invoice->site->city}}, {{@$invoice->site->state}}, {{@$invoice->site->zipcode}} </span>
                        </div>
                    </div>
                </div>
                <table class="table table-hover mt-5 ">
                    <tbody>
                        <tr>
                            <th>Job</th>
                            <th>Complete Date</th>
                            <th>Reference</th>
                            <th>Terms</th>
                            <th>Work Order Number</th>
                        </tr>
                        <tr>
                            <td>p3</td>
                            <td>10/6/2023</td>
                            <td>{{@$invoice->customer->project_manager}}</td>
                            <td>{{@$invoice->customer->billing_term}}</td>
                            <td>{{@$invoice->order_id}}</td>
                        </tr>
                    </tbody>
                </table>

                <table class="table mt-5">
                    <thead>
                        <tr>
                            <th>Qty</th>
                            <th>Description</th>
                            <th>Date</th>
                            <th>Price</th>
                            <th>Amount</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach($wps as $wp)
                        <tr>
                            <td>{{$wp->quantity}}</td>
                            <td>{{$wp->description}}</td>
                            <td>{{$wp->date}}</td>
                            <td>{{$wp->price}}</td>
                            <td>{{$wp->price}}</td>
                        </tr>
                        @endforeach
                    </tbody>
                </table>
                <div class="row mt-5">
                    <div class="col-md-3">
                        <h6>Work Request</h6>
                    </div>
                    <div class="col-md-9">
                        @foreach($wps as $wp)
                        <address>
                            <li type="square">{{$wp->work_request}}</li>
                        </address>
                        @endforeach
                    </div>
                </div>
                <div class="row mt-5">
                    <div class="col-md-3">
                        <h6>Performed</h6>
                    </div>
                    <div class="col-md-9">
                        @foreach($wps as $wp)
                        <address>
                            <li type="circle">{{$wp->work_perform}}</li>
                        </address>
                        @endforeach
                    </div>
                </div>
                <hr>
                <table class="table table-hover" style="width: 500px; float: right;">
                    <tbody>
                        <tr class="tax">
                            <td>Sub-total</td>
                            <td class="text-right">${{$price}}</td>
                        </tr>
                        <tr class="tax">
                            <td>Sales Tax</td>
                            <td class="text-right">$0.26</td>
                        </tr>
                        <tr class="tax">
                            <td>Amount Paid</td>
                            @if($invoice->invoice->status == 1)
                            <td class="text-right">${{$totalPrice}}</td>
                            @else
                            <td class="text-right">$00.00</td>
                            @endif
                        </tr>
                        <tr class="tax">
                            <td>Balance Due</td>
                            @if($invoice->invoice->status == 0)
                            <td class="text-right">${{$totalPrice}}</td>
                            @else
                            <td class="text-right">$00.00</td>
                            @endif
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
@endsection