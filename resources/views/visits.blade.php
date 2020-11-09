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

                        <h3>New Visit</h3>

                        <hr>
                   
                            <div class="form-row align-items-center">
                              <div class="col-sm-6 my-1">
                                <select id="idhotel" class="form-control">
                                  @foreach ($hotels as $hotel)
                                    <option value="{{$hotel->idh}}">{{$hotel->name}} ({{$hotel->location}}) </option>
                                  @endforeach
                                </select>                          
                              </div>
                              <div class="col-sm-2 my-1">
                                <select id="month" class="custom-select mr-sm-2" id="inlineFormCustomSelect">
                                    <option value="enero">enero</option>
                                    <option value="febrero">febrero</option>
                                    <option value="marzo">marzo</option>
                                    <option value="abril">abril</option>
                                    <option value="mayo">mayo</option>
                                    <option value="junio">junio</option>
                                    <option value="julio">julio</option>
                                    <option value="agosto">agosto</option>
                                    <option value="septiembre">septiembre</option>
                                    <option value="octubre">octubre</option>
                                    <option value="noviembre">noviembre</option>
                                    <option value="diciembre">diciembre</option>
                                </select>                          
                              </div>
                              <div class="col-sm-2 my-1">
                                <label class="sr-only" for="inlineFormInputGroupUsername">Visits</label>
                                <div class="input-group">
                                  <div class="input-group-prepend">
                                    <div class="input-group-text">
                                      <i class="fa fa-building-o" aria-hidden="true"></i>
                                    </div>
                                  </div>
                                  <input type="number" class="form-control" id="visit" min="0" value="0">
                                </div>
                              </div>
                            </div>
                            <form id="form" action="{{route('storeVisit')}}" method="POST" class=" mt-2">
                              @csrf @method('POST')
                              <div id="item"></div>

                              <div class="col-sm-12 mt-5 text-center">
                                <button type="button" class="btn btn-outline-primary mr-2" onclick="addItem()">Add Item</button>
                                <button id="save" type="submit" class="btn btn-outline-success" disabled="true">Save a new visit</button>
                              </div>
                            </form>
                            

                            
                   

                        
                        
 
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>
@endsection
