@extends('layouts.admin')

@include('admin.partials.navbar')  

@section('content')

<div class="main-content">

    <div class="page-content">
        <div class="container-fluid">

            <!-- start page title -->
            <div class="row">
                <div class="col-12">
                    <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                        <h4 class="mb-sm-0 font-size-18">System Health</h4>

                        <div class="page-title-right">
                            <ol class="breadcrumb m-0">
                                <li class="breadcrumb-item"><a href="javascript: void(0);">Owner Panel</a></li>
                                <li class="breadcrumb-item active">System Health</li>
                            </ol>
                        </div>

                    </div>
                </div>
            </div>
            <!-- end page title -->

            <div class="row">
                <div class="col-xl-3 col-md-6">
                    <!-- card -->
                    <div class="card card-h-100">
                        <!-- card body -->
                        <div class="card-body">
                            <div class="row align-items-center">
                                <div class="col-6">
                                    <span class="text-muted mb-3 lh-1 d-block text-truncate">System Status</span>
                                    <h4 class="mb-3">
                                        <span class="badge bg-success-subtle text-success">Healthy</span>
                                    </h4>
                                </div>
                            </div>
                            <div class="text-nowrap">
                                <span class="ms-1 text-muted font-size-13">Last check: Today, 10:30 AM</span>
                            </div>
                        </div><!-- end card body -->
                    </div><!-- end card -->
                </div><!-- end col -->

                <div class="col-xl-3 col-md-6">
                    <!-- card -->
                    <div class="card card-h-100">
                        <!-- card body -->
                        <div class="card-body">
                            <div class="row align-items-center">
                                <div class="col-12">
                                    <span class="text-muted mb-3 lh-1 d-block text-truncate">Database</span>
                                    <h4 class="mb-3">
                                        <span class="badge bg-success-subtle text-success">Connected</span>
                                    </h4>
                                </div>
                            </div>
                            <div class="text-nowrap">
                                <span class="ms-1 text-muted font-size-13">Response time (ms)</span>
                                <span class="badge bg-success-subtle text-success">123</span>
                            </div>
                        </div><!-- end card body -->
                    </div><!-- end card -->
                </div><!-- end col-->

                <div class="col-xl-3 col-md-6">
                    <!-- card -->
                    <div class="card card-h-100">
                        <!-- card body -->
                        <div class="card-body">
                            <div class="row align-items-center">
                                <div class="col-12">
                                    <span class="text-muted mb-3 lh-1 d-block text-truncate">Error (24h)</span>
                                    <h4 class="mb-3">
                                        Total Error <span class="counter-value" data-target="{{ $widgets['error'] }}">{{ $widgets['error'] }}</span>
                                    </h4>
                                </div>
                            </div>
                            <div class="text-nowrap">
                                <span class="ms-1 text-muted font-size-13">Critical error</span>
                                <span class="badge bg-success-subtle text-success">{{ $widgets['critical'] }}</span>
                            </div>
                        </div><!-- end card body -->
                    </div><!-- end card -->
                </div><!-- end col -->

                <div class="col-xl-3 col-md-6">
                    <!-- card -->
                    <div class="card card-h-100">
                        <!-- card body -->
                        <div class="card-body">
                            <div class="row align-items-center">
                                <div class="col-12">
                                    <span class="text-muted mb-3 lh-1 d-block text-truncate">Storage</span>
                                    <h4 class="mb-3">
                                        Used <span class="counter-value" data-target="25">25</span>%
                                    </h4>
                                </div>
                            </div>
                            <div class="text-nowrap">
                                <span class="ms-1 text-muted font-size-13">Since last week</span>
                                <span class="badge bg-success-subtle text-success">+0.2 points</span>
                            </div>
                        </div><!-- end card body -->
                    </div><!-- end card -->
                </div><!-- end col -->    
            </div><!-- end Widgets row-->

            <div class="row">
                <div class="row">
                    <div class="col-xl-6">
                        <div class="card">
                            <div class="card-header">
                                <h4 class="card-title mb-0">Error Trend</h4>
                            </div>
                            <div class="card-body">

                                <div id="line_chart_datalabel" data-colors='["#5156be", "#2ab57d"]' class="apex-charts" dir="ltr"></div>
                            </div>
                        </div>
                        <!--end card-->
                    </div>

                    <div class="col-xl-6">
                        <div class="card">
                            <div class="card-header">
                                <h4 class="card-title mb-0">Login Failure vs Success</h4>
                            </div>
                            <div class="card-body">

                                <div id="line_chart_dashed" data-colors='["#5156be", "#fd625e", "#2ab57d"]' class="apex-charts" dir="ltr"></div>
                            </div>
                        </div>
                        <!--end card-->
                    </div>
                </div>
                <!-- end row -->
            </div> <!-- end row-->

            <div class="row">                
                    <div class="col-xl-4">
                        <!-- card -->
                        <div class="card card-h-100">
                            <!-- card body -->
                            <div class="card-body">
                                <div class="d-flex flex-wrap align-items-center mb-4">
                                    <h5 class="card-title me-2">System Events Breakdown</h5>
                                    <div class="ms-auto">
                                        <select class="form-select form-select-sm">
                                            <option value="MAY" selected="">May</option>
                                            <option value="AP">April</option>
                                            <option value="MA">March</option>
                                            <option value="FE">February</option>
                                            <option value="JA">January</option>
                                            <option value="DE">December</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="text-center">
                                    <div id="category-chart2" data-colors='["#2ab57d", "#5156be", "#4ba6ef", "#fd625e", "#ffbf53"]' class="apex-charts"></div>
                                    <div class="mt-3">
                                        <p class="text-muted mb-0 font-size-13">
                                            Distribution of transactions across e-commerce platforms and direct sales channels
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- end col System Events Breakdown -->

                    <div class="col-xl-4">
                        <div class="card">
                            <div class="card-header align-items-center d-flex">
                                <h4 class="card-title mb-0 flex-grow-1">Recent System Responses</h4>
                            </div>

                            <div class="card-body px-0">
                                <div class="px-3" data-simplebar style="max-height: 352px;">
                                    <ul class="list-unstyled activity-wid mb-0">

                                        @forelse($systemResponses as $log)
                                            <li class="activity-list activity-border">
                                                <div class="activity-icon avatar-md">
                                                    <span class="avatar-title bg-{{ $log->color }}-subtle text-{{ $log->color }} rounded-circle">
                                                        <i class="{{ $log->icon }}"></i>
                                                    </span>
                                                </div>

                                                <div class="timeline-list-item">
                                                    <div class="d-flex">

                                                        {{-- LEFT --}}
                                                        <div class="flex-grow-1 overflow-hidden me-4">
                                                            <h5 class="font-size-14 mb-1">
                                                                {{ $log->title ?? ucfirst($log->action_type) }}
                                                            </h5>

                                                            <p class="text-truncate text-muted font-size-13">
                                                                {{ $log->message }}
                                                            </p>
                                                        </div>

                                                        {{-- RIGHT --}}
                                                        <div class="flex-shrink-0 text-end me-3">
                                                            <h6 class="mb-1">
                                                                {{ $log->response_time ?? '—' }}
                                                            </h6>
                                                            <div class="font-size-13">
                                                                {{ $log->source }}
                                                            </div>
                                                        </div>

                                                        {{-- ACTION --}}
                                                        <div class="flex-shrink-0 text-end">
                                                            <div class="dropdown">
                                                                <a class="text-muted dropdown-toggle font-size-24"
                                                                role="button"
                                                                data-bs-toggle="dropdown">
                                                                    <i class="mdi mdi-dots-vertical"></i>
                                                                </a>
                                                                <div class="dropdown-menu dropdown-menu-end">
                                                                    <a class="dropdown-item" href="#">
                                                                        View Details
                                                                    </a>
                                                                </div>
                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>
                                            </li>
                                        @empty
                                            <li class="text-center text-muted py-3">
                                                No system responses found.
                                            </li>
                                        @endforelse

                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- end Recent System Responses col -->

                    <div class="col-xl-4">
                        <div class="card">
                            <div class="card-header align-items-center d-flex">
                                <h4 class="card-title mb-0 flex-grow-1">System Health</h4>
                                <div class="flex-shrink-0">
                                    <ul class="nav justify-content-end nav-tabs-custom rounded card-header-tabs" role="tablist">
                                        <li class="nav-item">
                                            <a class="nav-link active" data-bs-toggle="tab" href="#health-all-tab" role="tab">
                                                All
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" data-bs-toggle="tab" href="#health-app-tab" role="tab">
                                                Application
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" data-bs-toggle="tab" href="#health-infra-tab" role="tab">
                                                Infrastructure
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>

                            <div class="card-body px-0">
                                <div class="tab-content">

                                    <!-- ALL SYSTEM -->
                                    <div class="tab-pane active" id="health-all-tab" role="tabpanel">
                                        <div class="table-responsive px-3" data-simplebar style="max-height: 352px;">
                                            <table class="table align-middle table-nowrap table-borderless">
                                                <tbody>

                                                    <tr>
                                                        <td style="width:50px">
                                                            <div class="font-size-18 text-success">
                                                                <i class="mdi mdi-api"></i>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <h5 class="font-size-14 mb-1">API Service</h5>
                                                            <p class="text-muted mb-0 font-size-12">All endpoints responding normally</p>
                                                        </td>
                                                        <td class="text-end">
                                                            <h5 class="font-size-14 mb-0 text-success">Healthy</h5>
                                                            <p class="text-muted mb-0 font-size-12">Latency OK</p>
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td>
                                                            <div class="font-size-18 text-primary">
                                                                <i class="mdi mdi-database"></i>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <h5 class="font-size-14 mb-1">Database</h5>
                                                            <p class="text-muted mb-0 font-size-12">Queries within threshold</p>
                                                        </td>
                                                        <td class="text-end">
                                                            <h5 class="font-size-14 mb-0">Normal</h5>
                                                            <p class="text-muted mb-0 font-size-12">MySQL</p>
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td>
                                                            <div class="font-size-18 text-warning">
                                                                <i class="mdi mdi-alert-circle"></i>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <h5 class="font-size-14 mb-1">Error Rate</h5>
                                                            <p class="text-muted mb-0 font-size-12">Minor warnings detected</p>
                                                        </td>
                                                        <td class="text-end">
                                                            <h5 class="font-size-14 mb-0 text-warning">Warning</h5>
                                                            <p class="text-muted mb-0 font-size-12">Last 24h</p>
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td>
                                                            <div class="font-size-18 text-info">
                                                                <i class="mdi mdi-timer-sand"></i>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <h5 class="font-size-14 mb-1">Queue & Jobs</h5>
                                                            <p class="text-muted mb-0 font-size-12">Background jobs running</p>
                                                        </td>
                                                        <td class="text-end">
                                                            <h5 class="font-size-14 mb-0">Active</h5>
                                                            <p class="text-muted mb-0 font-size-12">Worker Online</p>
                                                        </td>
                                                    </tr>

                                                </tbody>
                                            </table>
                                        </div>
                                    </div>

                                    <!-- APPLICATION -->
                                    <div class="tab-pane" id="health-app-tab" role="tabpanel">
                                        <div class="table-responsive px-3" data-simplebar style="max-height: 352px;">
                                            <table class="table align-middle table-nowrap table-borderless">
                                                <tbody>

                                                    <tr>
                                                        <td style="width:50px">
                                                            <div class="font-size-18 text-success">
                                                                <i class="mdi mdi-account-check"></i>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <h5 class="font-size-14 mb-1">Authentication</h5>
                                                            <p class="text-muted mb-0 font-size-12">Login & session stable</p>
                                                        </td>
                                                        <td class="text-end">
                                                            <h5 class="font-size-14 mb-0">Healthy</h5>
                                                            <p class="text-muted mb-0 font-size-12">Admin Guard</p>
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td>
                                                            <div class="font-size-18 text-info">
                                                                <i class="mdi mdi-email-outline"></i>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <h5 class="font-size-14 mb-1">Email Service</h5>
                                                            <p class="text-muted mb-0 font-size-12">SMTP connected</p>
                                                        </td>
                                                        <td class="text-end">
                                                            <h5 class="font-size-14 mb-0">Normal</h5>
                                                            <p class="text-muted mb-0 font-size-12">Queue Ready</p>
                                                        </td>
                                                    </tr>

                                                </tbody>
                                            </table>
                                        </div>
                                    </div>

                                    <!-- INFRASTRUCTURE -->
                                    <div class="tab-pane" id="health-infra-tab" role="tabpanel">
                                        <div class="table-responsive px-3" data-simplebar style="max-height: 352px;">
                                            <table class="table align-middle table-nowrap table-borderless">
                                                <tbody>

                                                    <tr>
                                                        <td style="width:50px">
                                                            <div class="font-size-18 text-success">
                                                                <i class="mdi mdi-server"></i>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <h5 class="font-size-14 mb-1">Server</h5>
                                                            <p class="text-muted mb-0 font-size-12">CPU & Memory normal</p>
                                                        </td>
                                                        <td class="text-end">
                                                            <h5 class="font-size-14 mb-0">Online</h5>
                                                            <p class="text-muted mb-0 font-size-12">24/7</p>
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td>
                                                            <div class="font-size-18 text-info">
                                                                <i class="mdi mdi-shield-check"></i>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <h5 class="font-size-14 mb-1">Security</h5>
                                                            <p class="text-muted mb-0 font-size-12">No intrusion detected</p>
                                                        </td>
                                                        <td class="text-end">
                                                            <h5 class="font-size-14 mb-0">Secure</h5>
                                                            <p class="text-muted mb-0 font-size-12">Firewall OK</p>
                                                        </td>
                                                    </tr>

                                                </tbody>
                                            </table>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- end System Health col -->

                </div>
                <!-- end row -->
                    
        </div> <!-- container-fluid -->
    </div>
    <!-- End Page-content -->

    @include('admin.partials.footer')
    
</div>

@endsection

@push('scripts')
<script>
    window.errorTrendChart = @json($errorTrendChart);
</script>

<script>
    window.loginChartData = @json($loginChart);
</script>

<script>        
    window.systemHealthChartData = {
        series: [
            {{ $healthChart['error'] }},
            {{ $healthChart['warning'] }},
            {{ $healthChart['info'] }},
            {{ $healthChart['security'] }}
        ],
        labels: ['Error', 'Warning', 'Info', 'Security']
    };
</script>

<!-- apexcharts -->
<script src="{{ asset('admin/libs/apexcharts/apexcharts.min.js') }}"></script>

<!-- apexcharts init -->
<script src="{{ asset('admin/js/pages/apexcharts.init.js') }}"></script>

<!-- Plugins js-->
<script src="{{ asset('admin/libs/admin-resources/jquery.vectormap/jquery-jvectormap-1.2.2.min.js') }}"></script>
<script src="{{ asset('admin/libs/admin-resources/jquery.vectormap/maps/jquery-jvectormap-world-mill-en.js') }}"></script>
<!-- dashboard init -->
<script src="{{ asset('admin/js/pages/dashboard.init.js') }}"></script>

<script src="{{ asset('admin/js/app.js') }}"></script>
@endpush