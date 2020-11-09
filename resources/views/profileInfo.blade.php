@extends('layouts.app')

<link href="{{ asset('css/sidebar.css') }}" rel="stylesheet">

@section('content')
<div class="wrapper">

@include('partials.sidebar')    

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">
                    {{ __('Dashboard') }}
                </div>
                

                <div class="card-body">
                    @if (session('status'))
                        <div class="alert alert-success" role="alert">
                            {{ session('status') }}
                        </div>
                    @endif
                    <!-- Page Content Holder -->
                    <div id="content">
                
                        <nav class="navbar navbar-default">
                            
                            <div class="container-fluid">
                                <div class="navbar-header">
                                    <button type="button" id="sidebarCollapse" class="navbar-btn">
                                        <span></span>
                                        <span></span>
                                        <span></span>
                                    </button>
                                </div>
                            </div>
                        </nav>

                        <h3>User Info</h3>

                        <hr>
                        <div class="row">

                            <div class="col-sm-6">
                                <div class="card mb-3">
                                    <div class="row no-gutters">
                                        <div class="col-md-4">
                                            
                                            @if ($info->photo == null)
                                                <img src="{{asset('storage/profile.png')}}" class="card-img" alt="profile">
                                            @else
                                                <img src="{{asset($info->photo)}}" class="card-img" alt={{$info->name}}>
                                            @endif
                                            
                                        </div>
                                        <div class="col-md-8">
                                            <div class="card-body">
                                                <button type="button" class="btn btn btn-outline-dark mb-3">
                                                    <span class="badge badge-light">
                                                        <i class="fa fa-hashtag" aria-hidden="true"></i> {{$info->id}}
                                                    </span>
                                                    {{$info->name}} {{$info->lastname}} 
                                                    <span class="sr-only">unread messages</span>
                                                </button>
                                                <p class="card-text">
                                                    <i class="fa fa-envelope-o" aria-hidden="true"></i> {{$info->email}}
                                                </p>
                                                <p class="card-text">
                                                    <small class="text-muted">{{$info->created_at}}</small>
                                                </p>
                                            </div>
                                        </div>
                                        
                                    </div>
                                </div>
                            </div>

                            <div class="col-sm-6">
                                <div class="card mb-3">
                                    <div class="row no-gutters">
                                   
                                        <div class="col-md-12">
                                            <div class="card-body">
                                    
                                                <button type="button" class="btn btn btn-outline-dark mb-3">
                                                    <span class="badge badge-light">
                                                        <i class="fa fa-hashtag" aria-hidden="true"></i>
                                                    </span>
                                                    hotels visited 
                                                    <span class="sr-only">unread messages</span>
                                                </button>
                                                @foreach ($consult as $con)

                                                <p class="card-text">
                                                    <i class="fa fa-building-o fa-lg" aria-hidden="true"></i>
                                                    &nbsp; {{$con->nameh}}.

                                                    &nbsp; <i class="fa fa-hashtag" aria-hidden="true"></i> Visitas: <strong>{{$con->visits}}</strong> en el mes de <strong>{{$con->fecha}}</strong>

                                                </p>

                                                <p class="card-text">

                                                    <i class="fa fa-bed fa-lg" aria-hidden="true"></i>
                                                    &nbsp; {{$con->tipo}}.

                                                    &nbsp; <i class="fa fa-sort-numeric-desc fa-lg" aria-hidden="true"></i>
                                                    &nbsp; Habitación: <strong>{{$con->number}}</strong>
                                                    
                                                    &nbsp; <i class="fa fa-bookmark fa-lg" aria-hidden="true"></i>
                                                    &nbsp; Piso: <strong>{{$con->floorr}}</strong>

                                                </p>

                                                <hr>

                                                @endforeach

                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>

                        </div>
  
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>
@endsection
