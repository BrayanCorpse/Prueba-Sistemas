@extends('layouts.app')
<link href="{{ asset('css/sidebar.css') }}" rel="stylesheet">



@section('content')

@if(session()->has('message'))
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-5">
            <div class="alert alert-light alert-dismissible fade show" role="alert">
                <strong>{{ session()->get('message') }}</strong>
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
                </button>
            </div>
        </div>
    </div>
</div>
@endif

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

                        

                        <h3>User Report</h3>

                        <div class="table-responsive-sm">

                            <a href="{{route('visits')}}" class="btn btn-outline-rose float-right mb-3">
                                Add Visit  <i class="fa fa-building-o fa-lg" aria-hidden="true"></i>
                            </a>

                            <table class="table table-hover table-light">
                                <thead style="background: #FBCED3">
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">Name</th>
                                    <th scope="col">Lastname</th>
                                    <th scope="col">Email</th>
                                    <th scope="col">View Profile</th>
                                </tr>
                                </thead>
                                <tbody>
                                   @php
                                       $id = 0
                                   @endphp
                                    
                                    @foreach ($users as $user)
                                    <tr>
                                        <th scope="row">{{$id = $id + 1}}</th>
                                        <th scope="row">{{$user->name}}</th>
                                        <th scope="row">{{$user->lastname}}</th>
                                        <th scope="row">{{$user->email}}</th>
                                        <th scope="row">
                                            <form action="{{ route('profileInfo', $user) }}" method="POST" >
                                                @csrf
                                                @method('GET')
                                                <button class="btn btn-outline-rose">
                                                    <i class="fa fa-user fa-lg" aria-hidden="true"></i>
                                                </button>
                                            </form>  
                                        </th>
                                    </tr>
                                    @endforeach
                                </tbody>
                            </table>
                            {{ $users->links() }}
                        </div>    
                        
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>
@endsection
