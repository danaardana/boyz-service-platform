<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\DB;

return new class extends Migration
{
    /**
     * Run the migrations - Obfuscate Customers table
     */
    public function up(): void
    {
        // Rename table from 'customers' to 'mno_9x8w'
        Schema::rename('customers', 'mno_9x8w');
        
        // Use raw SQL to rename columns (MySQL/MariaDB)
        $driver = DB::getDriverName();
        
        if ($driver === 'mysql' || $driver === 'mariadb') {
            DB::statement('ALTER TABLE `mno_9x8w` 
                CHANGE COLUMN `name` `iop_nm` TEXT NOT NULL,
                CHANGE COLUMN `email` `klj_em` TEXT NOT NULL,
                CHANGE COLUMN `phone` `qaz_ph` TEXT DEFAULT NULL,
                CHANGE COLUMN `address` `wsx_ad` TEXT DEFAULT NULL,
                CHANGE COLUMN `created_at` `edc_ca` TIMESTAMP NULL DEFAULT NULL,
                CHANGE COLUMN `updated_at` `rfv_ua` TIMESTAMP NULL DEFAULT NULL');
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
            DB::statement('ALTER TABLE `mno_9x8w` 
                CHANGE COLUMN `iop_nm` `name` TEXT NOT NULL,
                CHANGE COLUMN `klj_em` `email` TEXT NOT NULL,
                CHANGE COLUMN `qaz_ph` `phone` TEXT DEFAULT NULL,
                CHANGE COLUMN `wsx_ad` `address` TEXT DEFAULT NULL,
                CHANGE COLUMN `edc_ca` `created_at` TIMESTAMP NULL DEFAULT NULL,
                CHANGE COLUMN `rfv_ua` `updated_at` TIMESTAMP NULL DEFAULT NULL');
        }
        
        // Rename table back
        Schema::rename('mno_9x8w', 'customers');
    }
};
