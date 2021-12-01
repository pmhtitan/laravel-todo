@extends('errors::minimal')

@section('title', __('Not Found'))
@section('message')
<div class="body-404" id="body-404">
    <div class="text-404">
        <div>ERROR</div>
        <h1 class="h1-404">404</h1>
        <div>
        <hr>
        </div>
       
        <div>Page Not Found</div>
    </div>

    <div class="astronaut-404">
        <img src="https://images.vexels.com/media/users/3/152639/isolated/preview/506b575739e90613428cdb399175e2c8-space-astronaut-cartoon-by-vexels.png" alt="" class="src">
    </div>
</div>

@endsection