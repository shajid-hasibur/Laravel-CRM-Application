<!doctype html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <title>{{ $pageTitle }}</title>
    <link rel="shortcut icon" type="image/png" href="{{getImage(getFilePath('logoIcon') .'/favicon.png')}}">
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    @include('user.include.css')
    @stack('style-lib')
    @stack('style')
</head>

<body>
    <div id="app">
        @include('user.include.header')
        <main class="py-1 m-1">
            <div class="mt-5">@include('admin.partials.breadcrumb')</div>
            @include('partials.notify')
            @include('user.subTicket.modal')
            @include('user.sites.modal')
            @include('user.technicians.modal')
            @include('user.customers.modal')
            @yield('content')
        </main>
    </div>
    <script src="{{asset('assets/global/js/bootstrap.bundle.min.js')}}"></script>
    <!-- jquery ui -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
   

    @stack('custom_script')
    @stack('script-lib')
    @stack('script')
</body>

</html>