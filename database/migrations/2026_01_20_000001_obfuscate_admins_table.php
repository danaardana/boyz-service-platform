<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\DB;

return new class extends Migration
{
    /**
     * Run the migrations - Obfuscate Admins table
     */
    public function up(): void
    {
        // Rename table from 'admins' to 'xxy_k7m2p'
        Schema::rename('admins', 'xxy_k7m2p');
        
        // Rename all columns
        Schema::table('xxy_k7m2p', function (Blueprint $table) {
            // Note: Laravel doesn't support renaming columns directly in all DBs
            // We'll use raw SQL for better compatibility
        });
        
        // Use raw SQL to rename columns (MySQL/MariaDB)
        $driver = DB::getDriverName();
        
        if ($driver === 'mysql' || $driver === 'mariadb') {
            DB::statement('ALTER TABLE `xxy_k7m2p` 
                CHANGE COLUMN `name` `qwe_nm` TEXT NOT NULL,
                CHANGE COLUMN `email` `rty_em` TEXT NOT NULL,
                CHANGE COLUMN `email_verified_at` `uio_vt` TIMESTAMP NULL DEFAULT NULL,
                CHANGE COLUMN `is_active` `asd_ac` TINYINT(1) NOT NULL DEFAULT 1,
                CHANGE COLUMN `verified` `fgh_vf` TINYINT(1) NOT NULL DEFAULT 0,
                CHANGE COLUMN `password` `jkl_pw` VARCHAR(255) NOT NULL,
                CHANGE COLUMN `remember_token` `zxc_rt` VARCHAR(100) DEFAULT NULL,
                CHANGE COLUMN `security_code` `vbn_sc` VARCHAR(8) DEFAULT NULL,
                CHANGE COLUMN `security_code_expires_at` `nmq_ea` TIMESTAMP NULL DEFAULT NULL,
                CHANGE COLUMN `created_at` `wer_ca` TIMESTAMP NULL DEFAULT NULL,
                CHANGE COLUMN `updated_at` `sdf_ua` TIMESTAMP NULL DEFAULT NULL');
            
            // Check if avatar_path exists before renaming
            if (Schema::hasColumn('xxy_k7m2p', 'avatar_path')) {
                DB::statement('ALTER TABLE `xxy_k7m2p` 
                    CHANGE COLUMN `avatar_path` `hjk_ap` VARCHAR(255) DEFAULT NULL');
            }
        }
    }

    /**
     * Reverse the migrations
     */
    public function down(): void
    {
        $driver = DB::getDriverName();
        
        if ($driver === 'mysql' || $driver === 'mariadb') {
            // Rename columns back
            DB::statement('ALTER TABLE `xxy_k7m2p` 
                CHANGE COLUMN `qwe_nm` `name` TEXT NOT NULL,
                CHANGE COLUMN `rty_em` `email` TEXT NOT NULL,
                CHANGE COLUMN `uio_vt` `email_verified_at` TIMESTAMP NULL DEFAULT NULL,
                CHANGE COLUMN `asd_ac` `is_active` TINYINT(1) NOT NULL DEFAULT 1,
                CHANGE COLUMN `fgh_vf` `verified` TINYINT(1) NOT NULL DEFAULT 0,
                CHANGE COLUMN `jkl_pw` `password` VARCHAR(255) NOT NULL,
                CHANGE COLUMN `zxc_rt` `remember_token` VARCHAR(100) DEFAULT NULL,
                CHANGE COLUMN `vbn_sc` `security_code` VARCHAR(8) DEFAULT NULL,
                CHANGE COLUMN `nmq_ea` `security_code_expires_at` TIMESTAMP NULL DEFAULT NULL,
                CHANGE COLUMN `wer_ca` `created_at` TIMESTAMP NULL DEFAULT NULL,
                CHANGE COLUMN `sdf_ua` `updated_at` TIMESTAMP NULL DEFAULT NULL');
            
            if (Schema::hasColumn('xxy_k7m2p', 'hjk_ap')) {
                DB::statement('ALTER TABLE `xxy_k7m2p` 
                    CHANGE COLUMN `hjk_ap` `avatar_path` VARCHAR(255) DEFAULT NULL');
            }
        }
        
        // Rename table back
        Schema::rename('xxy_k7m2p', 'admins');
    }
};
