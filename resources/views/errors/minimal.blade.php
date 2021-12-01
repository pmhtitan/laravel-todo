<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>@yield('title')</title>

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Nunito&display=swap" rel="stylesheet">

    <!-- Styles -->
    <!-- <link href="{{ asset('css/app.css') }}" rel="stylesheet"> -->
    <link href="{{ asset('css/styles404.css') }}" rel="stylesheet">

    <!-- Javascripts -->
    <!-- <script src="{{ asset('js/app.js') }}"></script> -->
    <script src="{{ asset('js/main.js') }}"></script>

</head>

<body>
    @yield('code')

    @yield('message')

</body>

</html>