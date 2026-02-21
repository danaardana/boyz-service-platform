@extends('layouts.admin')

@include('admin.partials.navbar')  

@section("title", "Activity Logs")

@section('content')

<div class="main-content">
    <div class="page-content">
        <div class="container-fluid">
            <!-- start page title -->
            <div class="row">
                <div class="col-12">
                    <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                        <div class="page-title-right">
                            <ol class="breadcrumb m-0">
                                <li class="breadcrumb-item"><a href="javascript: void(0);">Tables</a></li>
                                <li class="breadcrumb-item active">Activity Logs</li>
                            </ol>
                        </div>
                    </div>
                </div>
            </div>      
            <!-- end page title -->
                 
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="row align-items-center">
                            <div class="col-md-6">
                                <div class="card-header">
                                    <h4 class="card-title">Activity Logs</h4>
                                    <p class="card-title-desc mb-0">Manage your product catalog with options and availability</p>
                                </div>
                            </div>
                        </div>
                        
                         <div class="card-body">
                                <table id="datatable-buttons" class="table table-bordered dt-responsive nowrap w-100">
                                <thead>
                                    <tr>
                                        <th>No</th>
                                        <th>Event</th>
                                        <th>Activity</th>
                                        <th>Type</th>
                                        <th>Name</th>
                                        <th>Email</th>
                                        <th>Created At</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @forelse($activityLogs as $log)
                                        <tr>
                                            <!-- <td>{{ $loop->iteration }}</td> -->
                                             
                                            <td>{{ $log->id }}</td>
                                            <td>
                                                <span class="avatar-title bg-{{ $log->color }}-subtle text-{{ $log->color }} rounded-circle">
                                                    <i class="{{ $log->icon }}"></i>
                                                </span>
                                                {{ ucwords(str_replace('_', ' ', $log->type)) }}
                                            </td>
                                            <td>{{ Str::limit($log->message, 60) }}</td>
                                            <td>{{ $log->user_type }}</td>
                                            <td>{{ $log->user_name }}</td>
                                            <td>{{ $log->user_email }}</td>
                                            <td>{{ optional($log->created_at)->format('M d, Y') }}</td>
                                        </tr>
                                    @empty
                                        <tr>
                                            <td colspan="9" class="text-center text-muted">
                                                No activity logs found.
                                            </td>
                                        </tr>
                                    @endforelse
                                </tbody>
                            </table>                     
                        </div>
                    </div>
                    <!-- end card -->
                </div> <!-- end col -->
            </div> <!-- end row -->

        </div> <!-- container-fluid -->
    </div>
    <!-- End Page-content -->

    @include('admin.partials.footer')
    
</div>

@endsection


@push("scripts")
<!-- Required datatable js -->
<script src="{{ asset('admin/libs/datatables.net/js/jquery.dataTables.min.js') }}"></script>
<script src="{{ asset('admin/libs/datatables.net-bs4/js/dataTables.bootstrap4.min.js') }}"></script>
<!-- Buttons examples -->
<script src="{{ asset('admin/libs/datatables.net-buttons/js/dataTables.buttons.min.js') }}"></script>
<script src="{{ asset('admin/libs/datatables.net-buttons-bs4/js/buttons.bootstrap4.min.js') }}"></script>
<script src="{{ asset('admin/libs/jszip/jszip.min.js') }}"></script>
<script src="{{ asset('admin/libs/pdfmake/build/pdfmake.min.js') }}"></script>
<script src="{{ asset('admin/libs/pdfmake/build/vfs_fonts.js') }}"></script>
<script src="{{ asset('admin/libs/datatables.net-buttons/js/buttons.html5.min.js') }}"></script>
<script src="{{ asset('admin/libs/datatables.net-buttons/js/buttons.print.min.js') }}"></script>
<script src="{{ asset('admin/libs/datatables.net-buttons/js/buttons.colVis.min.js') }}"></script>

<!-- Responsive examples -->
<script src="{{ asset('admin/libs/datatables.net-responsive/js/dataTables.responsive.min.js') }}"></script>
<script src="{{ asset('admin/libs/datatables.net-responsive-bs4/js/responsive.bootstrap4.min.js') }}"></script>

<!-- Datatable init js -->
<script src="{{ asset('admin/js/pages/datatables.init.js') }}"></script>
<script src="{{ asset('admin/js/app.js') }}"></script>
@endpush 