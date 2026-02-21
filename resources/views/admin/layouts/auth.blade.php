@php
    // Default language setup for admin auth pages
    $language = [
        'Login' => 'Login',
        'Password' => 'Password',
        'Remember Me' => 'Remember Me',
        'Forgot Password?' => 'Forgot Password?',
        'Sign In' => 'Sign In',
        'Lock Screen' => 'Lock Screen',
        'Unlock' => 'Unlock',
        'Enter your password' => 'Enter your password',
        'Not you? Sign out' => 'Not you? Sign out',
        'Last activity' => 'Last activity',
        'Secure Access' => 'Secure Access',
        'Your session has been locked for security. Please enter your password to continue.' => 'Your session has been locked for security. Please enter your password to continue.',
        'Session locked at' => 'Session locked at',
        'Unlocking...' => 'Unlocking...'
    ];
@endphp
<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>    
    <title>Admin @yield('title')</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta content="Premium Multipurpose Admin & Dashboard Template" name="description" />
    <meta content="Themesbrand" name="author" />
    
    <!-- Prevent caching -->
    <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate">
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Expires" content="0">
    
    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">
    
    <!-- Favicon -->
    <link rel="shortcut icon" href="{{ asset('landing/images/favicon.ico') }}">
    <link rel="icon" type="image/x-icon" href="{{ asset('landing/images/favicon.ico') }}">
    <link rel="apple-touch-icon" href="{{ asset('landing/images/logo-white.png') }}">
    <link rel="icon" type="image/png" sizes="32x32" href="{{ asset('landing/images/logo-white.png') }}">
    <link rel="icon" type="image/png" sizes="16x16" href="{{ asset('landing/images/logo-white.png') }}">
    <link rel="manifest" href="{{ asset('manifest.json') }}">
    
    <!-- preloader css -->
    <link rel="stylesheet" href="{{ asset('admin/css/preloader.min.css') }}" type="text/css" />

    <!-- Bootstrap Css -->
    <link href="{{ asset('admin/css/bootstrap.min.css') }}" id="bootstrap-style" rel="stylesheet" type="text/css" />
    <!-- Icons Css -->
    <link href="{{ asset('admin/css/icons.min.css') }}" rel="stylesheet" type="text/css" />
    <!-- App Css-->
    <link href="{{ asset('admin/css/app.min.css') }}" id="app-style" rel="stylesheet" type="text/css" />
    <!-- choices css -->
    <link href="{{ asset('admin/libs/choices.js/public/assets/styles/choices.min.css') }}" rel="stylesheet" type="text/css" />

    @stack('styles')
</head>

<body data-layout="horizontal">
    <!-- Begin page -->
    <div id="layout-wrapper">

        @yield('content')
        
        <!-- end main content-->
    </div>
    <!-- END layout-wrapper -->

    <!-- JAVASCRIPT -->
    <script src="{{ asset('admin/libs/jquery/jquery.min.js') }}"></script>
    <script src="{{ asset('admin/libs/bootstrap/js/bootstrap.bundle.min.js') }}"></script>
    <script src="{{ asset('admin/libs/metismenu/metisMenu.min.js') }}"></script>
    <script src="{{ asset('admin/libs/simplebar/simplebar.min.js') }}"></script>
    <script src="{{ asset('admin/libs/node-waves/waves.min.js') }}"></script>
    <script src="{{ asset('admin/libs/feather-icons/feather.min.js') }}"></script>
    <!-- pace js -->
    <script src="{{ asset('admin/libs/pace-js/pace.min.js') }}"></script>
    <script src="{{ asset('admin/js/app.js') }}"></script>

    @stack('scripts')
</body>
</html>