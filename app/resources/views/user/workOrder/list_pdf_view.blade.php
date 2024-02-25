@extends('layouts.app')
@section('content')
<div class="container mt-2">
    <div class="row justify-content-center">
        <div class="col-md-10">
            <div class="card">
                <div class="card-header bg-success">
                    <h3>Recently Created</h3>
                </div>
                <div class="card-body">
                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">Order ID</th>
                                <th scope="col">Created Time</th>
                                <th scope="col">Customer</th>
                                <th scope="col">PDf</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach($work as $w)
                            <tr>
                                <td>{{$w->order_id}}</td>
                                <td>{{$w->created_at->diffForHumans() }}</td>
                                @if($w->slug == null)
                                <td><button class="btn btn-danger">Pending</button></td>
                                @else
                                <td>{{$w->customer->company_name}}</td>
                                @endif
                                <td><a href="{{url('user/pdf/user/work/order/download/')}}/{{$w->id}}" class="btn btn-primary">Download</a></td>
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