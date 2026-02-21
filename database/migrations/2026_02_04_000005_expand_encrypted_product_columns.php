<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        if (!Schema::hasTable('prd_4x7m')) {
            return;
        }

        DB::statement("ALTER TABLE `prd_4x7m` MODIFY `qwe_nm` LONGTEXT");
        DB::statement("ALTER TABLE `prd_4x7m` MODIFY `rty_ct` LONGTEXT");
        DB::statement("ALTER TABLE `prd_4x7m` MODIFY `uio_im` LONGTEXT");
        DB::statement("ALTER TABLE `prd_4x7m` MODIFY `asd_ds` LONGTEXT");

        if (Schema::hasTable('opt_6k2p')) {
            DB::statement("ALTER TABLE `opt_6k2p` MODIFY `rty_dn` LONGTEXT");
        }

        if (Schema::hasTable('val_9m3q')) {
            DB::statement("ALTER TABLE `val_9m3q` MODIFY `qwe_vl` LONGTEXT");
            DB::statement("ALTER TABLE `val_9m3q` MODIFY `rty_dv` LONGTEXT");
        }
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        if (!Schema::hasTable('prd_4x7m')) {
            return;
        }

        DB::statement("ALTER TABLE `prd_4x7m` MODIFY `qwe_nm` VARCHAR(255)");
        DB::statement("ALTER TABLE `prd_4x7m` MODIFY `rty_ct` VARCHAR(255)");
        DB::statement("ALTER TABLE `prd_4x7m` MODIFY `uio_im` VARCHAR(255)");
        DB::statement("ALTER TABLE `prd_4x7m` MODIFY `asd_ds` TEXT");

        if (Schema::hasTable('opt_6k2p')) {
            DB::statement("ALTER TABLE `opt_6k2p` MODIFY `rty_dn` VARCHAR(255)");
        }

        if (Schema::hasTable('val_9m3q')) {
            DB::statement("ALTER TABLE `val_9m3q` MODIFY `qwe_vl` VARCHAR(255)");
            DB::statement("ALTER TABLE `val_9m3q` MODIFY `rty_dv` VARCHAR(255)");
        }
    }
};
