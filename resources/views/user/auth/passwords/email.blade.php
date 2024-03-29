@extends('layouts.app')
@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8 col-lg-7 col-xl-5">
            <div class="card ">
                <div class="card-header bg-primary">
                    <h5 class="card-title text-white">{{ __($pageTitle) }}</h5>
                </div>
                <div class="card-body">
                    <div class="mb-4">
                        <p>@lang('To recover your account please provide your email or username to find your account.')</p>
                    </div>
                    <form method="POST" action="{{ route('user.password.email') }}">
                        @csrf
                        <div class="form-group">
                            <label class="form-label">@lang('Email or Username')</label>
                            <input type="text" class="form-control " name="value" value="{{ old('value') }}" required autofocus="off">
                        </div>

                        <x-captcha />
                        <br>
                        <div class="form-group">
                            <button type="submit" class="btn btn-primary w-100">@lang('Submit')</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
