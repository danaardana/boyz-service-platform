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



<?php echo $__env->make('admin.partials.navbar', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?>  

<?php $__env->startSection("title", "| Technician "); ?>

<?php $__env->startSection('content'); ?>
<meta name="csrf-token" content="<?php echo e(csrf_token()); ?>">

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
                            <h5 class="card-title">All Technicians <span class="text-muted fw-normal ms-2">(<?php echo e($technicianCount); ?>)</span></h5>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="d-flex flex-wrap align-items-center justify-content-end gap-2 mb-3">
                            <div>
                                <ul class="nav nav-pills">
                                    <li class="nav-item">
                                        <a class="nav-link" href="<?php echo e(route('admin.service.technicians-list')); ?>" data-bs-toggle="tooltip" data-bs-placement="top" title="List"><i class="bx bx-list-ul"></i></a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link active" href="<?php echo e(route('admin.service.technicians-grid')); ?>" data-bs-toggle="tooltip" data-bs-placement="top" title="Grid"><i class="bx bx-grid-alt"></i></a>
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

                    <?php $__empty_1 = true; $__currentLoopData = $technicians; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $tech): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); $__empty_1 = false; ?>

                        <div class="col-xl-3 col-sm-6">
                            <div class="card text-center">
                                <div class="card-body">

                                    
                                    <div class="dropdown text-end">
                                        <a class="text-muted dropdown-toggle font-size-16"
                                        href="#"
                                        role="button"
                                        data-bs-toggle="dropdown">
                                            <i class="bx bx-dots-horizontal-rounded"></i>
                                        </a>

                                        <div class="dropdown-menu dropdown-menu-end">
                                            <a class="dropdown-item"
                                            href="javascript:void(0);" onclick="editTechnician(<?php echo e($tech->t1_id); ?>)">
                                                Edit
                                            </a>

                                            <a class="dropdown-item"
                                            href="javascript:void(0);" onclick="viewTechnician(<?php echo e($tech->t1_id); ?>)">
                                                View
                                            </a>

                                            <form method="POST"
                                                action="#">
                                                <?php echo csrf_field(); ?>
                                                <?php echo method_field('DELETE'); ?>
                                                <button type="submit"
                                                        class="dropdown-item text-danger">
                                                    Remove
                                                </button>
                                            </form>
                                        </div>
                                    </div>

                                    
                                    <?php if(!empty($tech->photo)): ?>
                                        <div class="mx-auto mb-4">
                                            <img src="<?php echo e(asset('storage/' . $tech->photo)); ?>"
                                                alt="<?php echo e($tech->name); ?>"
                                                class="avatar-xl rounded-circle img-thumbnail">
                                        </div>
                                    <?php else: ?>
                                        <div class="avatar-xl mx-auto mb-4">
                                            <div class="avatar-title bg-light-subtle text-secondary display-4 m-0 rounded-circle">
                                                <i class="bx bxs-user-circle"></i>
                                            </div>
                                        </div>
                                    <?php endif; ?>

                                    
                                    <h5 class="font-size-16 mb-1">
                                        <a href="<?php echo e(route('admin.service.technicians.show', $tech->t1_id)); ?>"
                                        class="text-body">
                                            <?php echo e($tech->name ?? '-'); ?>

                                        </a>
                                    </h5>

                                    
                                    <p class="text-muted mb-2">
                                        <?php echo e(ucfirst($tech->role)); ?>

                                    </p>

                                </div>

                                
                                <div class="btn-group" role="group">
                                    <a href="javascript:void(0);" onclick="viewTechnician(<?php echo e($tech->t1_id); ?>)"
                                    class="btn btn-outline-light text-truncate">
                                        <i class="uil uil-user me-1"></i> Profile
                                    </a>
                                    <a href="#"
                                    class="btn btn-outline-light text-truncate">
                                        <i class="uil uil-envelope-alt me-1"></i> Assign
                                    </a>
                                </div>
                            </div>
                        </div>

                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); if ($__empty_1): ?>

                        <div class="col-12 text-center py-5">
                            <p class="text-muted">No technicians found.</p>
                        </div>

                    <?php endif; ?>

                </div>


                <div class="row g-0 align-items-center mb-4 mt-4">

                    <div class="col-sm-6">
                        <p class="mb-sm-0">
                            Showing <?php echo e($technicians->firstItem() ?? 0); ?>

                            to <?php echo e($technicians->lastItem() ?? 0); ?>

                            of <?php echo e($technicians->total()); ?> entries
                        </p>
                    </div>

                    <div class="col-sm-6">
                        <div class="float-sm-end">
                            <?php echo e($technicians->links()); ?>

                        </div>
                    </div>

                </div>


            </div> <!-- container-fluid -->
        </div>
        <!-- End Page-content -->

<!-- End Page-content -->


<!-- Technician Details Modal -->
<div class="modal fade" id="technicianModal" tabindex="-1">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Technician Details</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body" id="technicianModalBody">
                <div class="text-center">
                    <div class="spinner-border"></div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- End Technician Details Modal -->


<!-- Edit Technician Modal -->
<div class="modal fade" id="editTechnicianModal" tabindex="-1">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Edit Technician</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>

            <form id="editTechnicianForm">
                <div class="modal-body">

                    <input type="hidden" id="editTechId">

                    <div class="row">
                        <div class="col-md-4 mb-3">
                            <label>Name</label>
                            <input type="text" class="form-control" id="editTechName" required>
                        </div>

                        <div class="col-md-4 mb-3">
                            <label>Email</label>
                            <input type="email" class="form-control" id="editTechEmail">
                        </div>
                        <div class="col-md-4 mb-3">
                            <label>Phone</label>
                            <input type="text" class="form-control" id="editTechPhone">
                        </div>
                    </div>

                    <div class="row">

                        <div class="col-md-4 mb-3">
                            <label>Status</label>
                            <select class="form-control" id="editTechStatus">
                                <option value="active">Active</option>
                                <option value="inactive">Inactive</option>
                            </select>
                        </div>

                        <div class="col-md-4">
                            <div class="mb-3">
                                <label class="form-label">Role</label>
                                <select class="form-control" id="editTechRole" name="role">
                                    <option value="technician">Technician</option>
                                    <option value="identifier">Identifier</option>
                                </select>
                            </div>
                        </div>

                    </div>

                    <div class="mb-3">
                        <label>Notes</label>
                        <textarea class="form-control" id="editTechNotes"></textarea>
                    </div>

                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-primary">Save Changes</button>
                </div>
            </form>

        </div>
    </div>
</div>


<script>
window.viewTechnician = function(id) 
{

    const modal = new bootstrap.Modal(document.getElementById('technicianModal'));

    document.getElementById('technicianModalBody').innerHTML = `
        <div class="text-center">
            <div class="spinner-border"></div>
        </div>
    `;

    modal.show();

    fetch(`/admin/service/technicians/${id}`, {
        headers: {
            'Accept': 'application/json',
            'X-Requested-With': 'XMLHttpRequest'
        }
    })
    .then(res => res.json())
    .then(data => {

        if (data.success) {

            const tech = data.technician;

            document.getElementById('technicianModalBody').innerHTML = `
                <div class="row">
                    <div class="col-md-4 text-center">
                        <div class="avatar-xl mx-auto mb-4">
                            <div class="avatar-title bg-light-subtle text-primary display-4 rounded-circle">
                                <i class="bx bxs-user-circle"></i>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-8">
                        <h5>${tech.name ?? 'N/A'}</h5>
                        <p><i class="bx bx-envelope me-2"></i>${tech.email ?? 'N/A'}</p>
                        <p><i class="bx bx-phone me-2"></i>${tech.phone ?? 'N/A'}</p>
                        <p><i class="bx bx-badge-check me-2"></i>Status: ${tech.status}</p>
                        <p><i class="bx bx-user me-2"></i>Role: ${tech.role}</p>
                        <p><i class="bx bx-calendar me-2"></i>Created: ${tech.created_at}</p>
                        <p><i class="bx bx-time me-2"></i>Updated: ${tech.updated_at}</p>
                    </div>
                </div>
            `;
        }
    });
};

window.editTechnician = function(id) 
{

    fetch(`/admin/service/technicians/${id}`, {
        headers: {
            'Accept': 'application/json',
            'X-Requested-With': 'XMLHttpRequest'
        }
    })
    .then(res => res.json())
    .then(data => {

        if (data.success) {
            console.log('Edit technician data:', data);

            const tech = data.technician;

            document.getElementById('editTechId').value = tech.id;
            document.getElementById('editTechName').value = tech.name ?? '';
            document.getElementById('editTechEmail').value = tech.email ?? '';
            document.getElementById('editTechPhone').value = tech.phone ?? '';
            document.getElementById('editTechStatus').value = tech.status;
            document.getElementById('editTechNotes').value = tech.notes ?? '';
            document.getElementById('editTechRole').value = tech.role;

            new bootstrap.Modal(document.getElementById('editTechnicianModal')).show();
        } else {
            alert('Failed to load technician data for editing.');
        }
    });
};

document.addEventListener('submit', function(e){

    if (e.target && e.target.id === 'editTechnicianForm') {

        e.preventDefault();

        console.log('Submit triggered');

        const id = document.getElementById('editTechId').value;

        fetch(`/admin/service/technicians/${id}`, {
            method: 'PUT',
            headers: {
                'Content-Type': 'application/json',
                'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
            },
            body: JSON.stringify({
                name: document.getElementById('editTechName').value,
                email: document.getElementById('editTechEmail').value,
                phone: document.getElementById('editTechPhone').value,
                status: document.getElementById('editTechStatus').value,
                notes: document.getElementById('editTechNotes').value,
                status: document.getElementById('editTechStatus').value,
                role: document.getElementById('editTechRole').value
            })
        })
        .then(res => res.json())
        .then(data => {

            if (data.success) {
                location.reload();
            } else {
                alert('Update failed');
            }

        });

    } else {
        alert('Form not found');
    }

});


</script>

<script src="<?php echo e(asset('admin/js/app.js')); ?>"></script>

    <?php echo $__env->make('admin.partials.footer', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?>
    
</div>

<?php $__env->stopSection(); ?>


<?php echo $__env->make('layouts.admin', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?><?php /**PATH C:\Users\rioar\Documents\Porotofolio 1 Boyz Projectz\boyzproject-main\resources\views/admin/service/technicion-grid.blade.php ENDPATH**/ ?>