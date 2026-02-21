<?php
// include language configuration file based on selected language
$lang = "us";
if (isset($_GET['lang'])) {
   $lang = $_GET['lang'];
    $_SESSION['lang'] = $lang;
}
if( isset( $_SESSION['lang'] ) ) {
    $lang = $_SESSION['lang'];
}else {
    $lang = "us";
}
require_once ("./admin/lang/" . $lang . ".php");

use Illuminate\Support\Str;

?>

@extends('layouts.admin')

@include('admin.partials.navbar')  

@section("title", "| Technician ")

@section('content')
<meta name="csrf-token" content="{{ csrf_token() }}">

<div class="main-content">

<div class="page-content">
            <div class="container-fluid">

                <!-- start page title -->
                <div class="row">
                    <div class="col-12">
                        <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                            <h4 class="mb-sm-0 font-size-18">Technician</h4>

                            <div class="page-title-right">
                                <ol class="breadcrumb m-0">
                                    <li class="breadcrumb-item"><a href="javascript: void(0);">Service Overview</a></li>
                                    <li class="breadcrumb-item active">Technician</li>
                                </ol>
                            </div>

                        </div>
                    </div>
                </div>
                <!-- end page title -->
                 

                <div class="row align-items-center">
                    <div class="col-md-6">
                        <div class="mb-3">
                            <h5 class="card-title">All Technicians <span class="text-muted fw-normal ms-2">({{ $technicianCount }})</span></h5>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="d-flex flex-wrap align-items-center justify-content-end gap-2 mb-3">
                            <div>
                                <ul class="nav nav-pills">
                                    <li class="nav-item">
                                        <a class="nav-link active" href="{{ route('admin.service.technicians-list') }}" data-bs-toggle="tooltip" data-bs-placement="top" title="List"><i class="bx bx-list-ul"></i></a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="{{ route('admin.service.technicians-grid') }}" data-bs-toggle="tooltip" data-bs-placement="top" title="Grid"><i class="bx bx-grid-alt"></i></a>
                                    </li>
                                </ul>
                            </div>
                            <div>
                                <a href="#" class="btn btn-light"><i class="bx bx-plus me-1"></i> Add New</a>
                            </div>
                            
                            <div class="dropdown">
                                <a class="btn btn-link text-muted py-1 font-size-16 shadow-none dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                    <i class="bx bx-dots-horizontal-rounded"></i>
                                </a>
                              
                                <ul class="dropdown-menu dropdown-menu-end">
                                    <li><a class="dropdown-item" href="#">Action</a></li>
                                    <li><a class="dropdown-item" href="#">Another action</a></li>
                                    <li><a class="dropdown-item" href="#">Something else here</a></li>
                                </ul>
                            </div>
                        </div>

                    </div>
                </div>
                <!-- end row -->

                <div class="row">

                    <div class="table-responsive mb-4">
                        <table class="table align-middle datatable dt-responsive table-check nowrap" style="border-collapse: collapse; border-spacing: 0 8px; width: 100%;">
                            <thead>
                                <tr>
                                    <th scope="col" style="width: 50px;">
                                        <div class="form-check font-size-16">
                                            <input type="checkbox" class="form-check-input" id="checkAll">
                                            <label class="form-check-label" for="checkAll"></label>
                                        </div>
                                    </th>
                                    <th scope="col">Name</th>
                                    <th scope="col">Role</th>
                                    <th scope="col">Email</th>
                                    <th scope="col">Tags</th>
                                    <th style="width: 80px; min-width: 80px;">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                
                                @forelse($technicians as $tech)
                                <tr>
                                    <th scope="row">
                                        <div class="form-check font-size-16">
                                            <input type="checkbox" class="form-check-input" id="contacusercheck{{ $tech->t1_id }}">
                                            <label class="form-check-label" for="contacusercheck{{ $tech->t1_id }}"></label>
                                        </div>
                                    </th>
                                    <td>
                                        <div class="avatar-sm d-inline-block align-middle me-2">
                                            <div class="avatar-title bg-light-subtle text-light font-size-24 m-0 rounded-circle">
                                                <i class="bx bxs-user-circle"></i>
                                            </div>
                                        </div>
                                        <a href="#" class="text-body">{{ $tech->name }}</a>
                                    </td>
                                    <td>{{ $tech->role }}</td>
                                    <td>{{ $tech->email }}</td>
                                    <td>
                                        <div class="d-flex gap-2">
                                            <a href="#" class="badge badge-soft-primary font-size-11">Ruby</a>
                                            <a href="#" class="badge badge-soft-primary font-size-11">Php</a>
                                            <a href="#" class="badge badge-soft-primary font-size-11">2 + more</a>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="dropdown">
                                            <button class="btn btn-link font-size-16 shadow-none py-0 text-muted dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                                                <i class="bx bx-dots-horizontal-rounded"></i>
                                            </button>
                                            <ul class="dropdown-menu dropdown-menu-end">
                                                <li><a class="dropdown-item" href="#">Action</a></li>
                                                <li><a class="dropdown-item" href="#">Another action</a></li>
                                                <li><a class="dropdown-item" href="#">Something else here</a></li>
                                            </ul>
                                        </div>
                                    </td>
                                </tr>
                                @empty
                                <tr>
                                    <td colspan="6" class="text-center">No technicians available.</td>
                                </tr>
                                @endforelse
                            </tbody>
                        </table>
                        <!-- end table -->
                    </div>
                    <!-- end table responsive -->
                    
                </div>
                <!-- end row -->

                <div class="row g-0 align-items-center mb-4">
                    <div class="col-sm-6">
                        <div>
                            <p class="mb-sm-0">Showing 1 to 10 of 57 entries</p>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="float-sm-end">
                            <ul class="pagination mb-sm-0">
                                <li class="page-item disabled">
                                    <a href="#" class="page-link"><i class="mdi mdi-chevron-left"></i></a>
                                </li>
                                <li class="page-item">
                                    <a href="#" class="page-link">1</a>
                                </li>
                                <li class="page-item active">
                                    <a href="#" class="page-link">2</a>
                                </li>
                                <li class="page-item">
                                    <a href="#" class="page-link">3</a>
                                </li>
                                <li class="page-item">
                                    <a href="#" class="page-link">4</a>
                                </li>
                                <li class="page-item">
                                    <a href="#" class="page-link">5</a>
                                </li>
                                <li class="page-item">
                                    <a href="#" class="page-link"><i class="mdi mdi-chevron-right"></i></a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- end row -->

            </div> <!-- container-fluid -->
        </div>
        <!-- End Page-content -->

<!-- End Page-content -->


    @include('admin.partials.footer')
    
</div>

@endsection

@push('scripts')

<script src="{{ asset('admin/js/app.js') }}"></script>
@endpush