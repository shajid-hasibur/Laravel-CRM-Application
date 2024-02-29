@extends('layouts.app')
@section('content')
<div class="container mt-2">
    <div class="row justify-content-center">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header" style="background-color: #55aa29;">
                    <h3 class="text-white">Recently Created</h3>
                </div>
                <div class="card-body">
                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">Work Order ID</th>
                                <th scope="col">Created Time</th>
                                <th scope="col">Customer</th>
                                <th scope="col">Status</th>
                                <th scope="col">PDf</th>
                                <th scope="col">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach($work as $w)
                            <tr class="text-center">
                                <td>{{$w->order_id}}</td>
                                <td>{{$w->created_at->diffForHumans() }}</td>
                                @if($w->slug == null)
                                <td><button class="btn btn-danger">Pending</button></td>
                                @else
                                <td>{{$w->customer->company_name}}</td>
                                @endif
                                @if($w->status == 7)
                                <td><span class="badge bg-success">NEW</span></td>
                                @elseif($w->status == 3)
                                <td><span class="badge bg-info text-dark">ONSITE</span></td>
                                @elseif($w->status == 2)
                                <td><span class="badge bg-light text-dark">DISPATCHED</span></td>
                                @elseif($w->status == 4)
                                <td><span class="badge bg-dark">INVOICED</span></td>
                                @elseif($w->status == 1)
                                <td><span class="badge bg-primary">OPEN</span></td>
                                @elseif($w->status == 5)
                                <td><span class="badge bg-warning text-dark">ON HOLD</span></td>
                                @elseif($w->status == 6)
                                <td><span class="badge bg-danger">CLOSED</span></td>
                                @elseif($w->status == 8)
                                <td><span class="badge bg-secondary">COMPLETE</span></td>
                                @endif
                                <td>
                                    <a href="{{url('pdf/user/work/order/download/')}}/{{$w->id}}" class="btn btn-primary">Download</a>
                                    <a href="{{url('pdf/user/work/order/view/')}}/{{$w->id}}" class="btn btn-success">View</a>
                                </td>
                                <td><a href="{{url('user/order/delete')}}/{{$w->id}}" class="btn btn-danger">Delete</a></td>
                            </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
            @if ($work->hasPages())
            <div class="card-footer py-4">
                <p class="text-italic">Click below to see next page</p> @php echo paginateLinks($work) @endphp
            </div>
            @endif
        </div>
    </div>
</div>
@endsection
@push('breadcrumb-plugins')
<p class="font-weight-light p-2 mt-3">Do Search by Work Order Id/Company Name/customer zip-code/site zip-code/site location :</p>
<x-search-form dateSearch='yes' />
@endpush