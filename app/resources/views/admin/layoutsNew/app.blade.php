<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>{{ $pageTitle }}</title>
    @stack('style-lib')
    @include('admin.includeNew.css')
    @yield('script')
    @yield('style')
    @stack('custom-css')
</head>

<style>
    body {
        font-family: 'Nunito', sans-serif;
    }
</style>

<body class="hold-transition sidebar-mini layout-fixed">
    <div class="">
        @include('admin.includeNew.preloader')
        @include('admin.includeNew.topbar')
        <div class="m-2">@include('admin.partials.breadcrumb')</div>
        @include('partials.notify')
        <!-- /.navbar -->
        @include('admin.includeNew.sidebar')
        <!-- Content Wrapper. Contains page content -->
        @yield('content')
        <!-- /.content-wrapper -->
        @include('admin.includeNew.footer')

        <!-- Control Sidebar -->
        <aside class="control-sidebar control-sidebar-dark">
            <!-- Control sidebar content goes here -->
        </aside>
        <!-- /.control-sidebar -->
    </div>
    <!-- ./wrapper -->

    @include('admin.includeNew.js')
    @stack('script-lib')
    @stack('custom-scripts')
</body>

</html>
