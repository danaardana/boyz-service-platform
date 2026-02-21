<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\DB;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('notifications', function (Blueprint $table) {

            // SAFE RENAMES (no defaults involved)
            $table->renameColumn('id', 'k5_id');
            $table->renameColumn('type', 'tya_tp');
            $table->renameColumn('title', 'uio_tt');
            $table->renameColumn('message', 'asd_msg');
            $table->renameColumn('icon', 'fgh_ic');
            $table->renameColumn('action_type', 'zxc_at');
            $table->renameColumn('action_id', 'vbn_aid');
            $table->renameColumn('action_model', 'nmq_am');
            $table->renameColumn('user_id', 'wer_uid');
            $table->renameColumn('user_name', 'sdf_un');
            $table->renameColumn('user_email', 'hjk_ue');
            $table->renameColumn('metadata', 'lop_md');
            $table->renameColumn('is_read', 'kiu_ir');
            $table->renameColumn('read_at', 'yhn_ra');
            $table->renameColumn('created_at', 'ujm_ca');
            $table->renameColumn('updated_at', 'bnm_ua');
        });

        // Columns with DEFAULT values → must use raw SQL (MariaDB safe)
        DB::statement("ALTER TABLE notifications CHANGE color jkl_cl VARCHAR(255) NOT NULL DEFAULT 'primary'");
        DB::statement("ALTER TABLE notifications CHANGE user_type plm_ut VARCHAR(255) NOT NULL DEFAULT 'system'");
    }

    public function down(): void
    {
        Schema::table('notifications', function (Blueprint $table) {
            $table->renameColumn('k5_id', 'id');
            $table->renameColumn('tya_tp', 'type');
            $table->renameColumn('uio_tt', 'title');
            $table->renameColumn('asd_msg', 'message');
            $table->renameColumn('fgh_ic', 'icon');
            $table->renameColumn('zxc_at', 'action_type');
            $table->renameColumn('vbn_aid', 'action_id');
            $table->renameColumn('nmq_am', 'action_model');
            $table->renameColumn('wer_uid', 'user_id');
            $table->renameColumn('sdf_un', 'user_name');
            $table->renameColumn('hjk_ue', 'user_email');
            $table->renameColumn('lop_md', 'metadata');
            $table->renameColumn('kiu_ir', 'is_read');
            $table->renameColumn('yhn_ra', 'read_at');
            $table->renameColumn('ujm_ca', 'created_at');
            $table->renameColumn('bnm_ua', 'updated_at');
        });

        DB::statement("ALTER TABLE notifications CHANGE jkl_cl color VARCHAR(255) NOT NULL DEFAULT 'primary'");
        DB::statement("ALTER TABLE notifications CHANGE plm_ut user_type VARCHAR(255) NOT NULL DEFAULT 'system'");
    }
};
