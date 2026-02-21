<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\DB;

return new class extends Migration
{
    /**
     * Run the migrations - Obfuscate Contact Messages table
     */
    public function up(): void
    {
        // Check if table already renamed
        $tableExists = Schema::hasTable('tgb_5y4v');
        $oldTableExists = Schema::hasTable('contact_messages');
        
        if (!$tableExists && $oldTableExists) {
            // Rename table from 'contact_messages' to 'tgb_5y4v'
            Schema::rename('contact_messages', 'tgb_5y4v');
        }
        
        // Use raw SQL to rename columns (MySQL/MariaDB)
        $driver = DB::getDriverName();
        
        if ($driver === 'mysql' || $driver === 'mariadb') {
            // Check if columns already renamed
            $columns = DB::select("SHOW COLUMNS FROM tgb_5y4v");
            $columnNames = array_column($columns, 'Field');
            
            // Only rename if columns still have original names
            if (in_array('customer_id', $columnNames)) {
                // First, drop foreign keys (try different possible names)
                $foreignKeys = DB::select("
                    SELECT CONSTRAINT_NAME 
                    FROM information_schema.KEY_COLUMN_USAGE 
                    WHERE TABLE_SCHEMA = DATABASE() 
                    AND TABLE_NAME = 'tgb_5y4v' 
                    AND REFERENCED_TABLE_NAME IS NOT NULL
                ");
                
                foreach ($foreignKeys as $fk) {
                    try {
                        DB::statement("ALTER TABLE `tgb_5y4v` DROP FOREIGN KEY `{$fk->CONSTRAINT_NAME}`");
                    } catch (\Exception $e) {
                        // Ignore if doesn't exist
                    }
                }
                
                // Rename columns
                DB::statement('ALTER TABLE `tgb_5y4v` 
                    CHANGE COLUMN `customer_id` `yhn_cid` BIGINT(20) UNSIGNED NOT NULL,
                    CHANGE COLUMN `admin_id` `ujm_aid` BIGINT(20) UNSIGNED DEFAULT NULL,
                    CHANGE COLUMN `content_key` `ikm_ck` VARCHAR(255) NOT NULL,
                    CHANGE COLUMN `content` `olp_ct` TEXT NOT NULL,
                    CHANGE COLUMN `status` `pkm_st` VARCHAR(255) NOT NULL DEFAULT "new",
                    CHANGE COLUMN `category` `qwe_cat` VARCHAR(255) NOT NULL DEFAULT "general",
                    CHANGE COLUMN `is_read` `rty_ir` TINYINT(1) NOT NULL DEFAULT 0,
                    CHANGE COLUMN `is_important` `uio_ii` TINYINT(1) NOT NULL DEFAULT 0,
                    CHANGE COLUMN `is_deleted` `asd_id` TINYINT(1) NOT NULL DEFAULT 0,
                    CHANGE COLUMN `deleted_at` `fgh_da` TIMESTAMP NULL DEFAULT NULL,
                    CHANGE COLUMN `last_update_time` `jkl_lut` TIMESTAMP NULL DEFAULT NULL,
                    CHANGE COLUMN `created_at` `zxc_ca` TIMESTAMP NULL DEFAULT NULL,
                    CHANGE COLUMN `updated_at` `vbn_ua` TIMESTAMP NULL DEFAULT NULL');
                
                // Recreate foreign keys with new column names
                // Note: ID columns in referenced tables use their actual column names
                $customerIdColumn = Schema::hasColumn('mno_9x8w', 'id') ? 'id' : 'k2_id';
                $adminIdColumn = Schema::hasColumn('xxy_k7m2p', 'id') ? 'id' : 'k1_id';
                
                DB::statement("ALTER TABLE `tgb_5y4v` 
                    ADD CONSTRAINT `tgb_5y4v_customer_id_foreign` 
                    FOREIGN KEY (`yhn_cid`) REFERENCES `mno_9x8w` (`{$customerIdColumn}`) ON DELETE CASCADE");
                
                DB::statement("ALTER TABLE `tgb_5y4v` 
                    ADD CONSTRAINT `tgb_5y4v_admin_id_foreign` 
                    FOREIGN KEY (`ujm_aid`) REFERENCES `xxy_k7m2p` (`{$adminIdColumn}`) ON DELETE SET NULL");
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
            // Drop foreign keys
            DB::statement('ALTER TABLE `tgb_5y4v` DROP FOREIGN KEY IF EXISTS `tgb_5y4v_customer_id_foreign`');
            DB::statement('ALTER TABLE `tgb_5y4v` DROP FOREIGN KEY IF EXISTS `tgb_5y4v_admin_id_foreign`');
            
            // Rename columns back
            DB::statement('ALTER TABLE `tgb_5y4v` 
                CHANGE COLUMN `yhn_cid` `customer_id` BIGINT(20) UNSIGNED NOT NULL,
                CHANGE COLUMN `ujm_aid` `admin_id` BIGINT(20) UNSIGNED DEFAULT NULL,
                CHANGE COLUMN `ikm_ck` `content_key` VARCHAR(255) NOT NULL,
                CHANGE COLUMN `olp_ct` `content` TEXT NOT NULL,
                CHANGE COLUMN `pkm_st` `status` VARCHAR(255) NOT NULL DEFAULT "new",
                CHANGE COLUMN `qwe_cat` `category` VARCHAR(255) NOT NULL DEFAULT "general",
                CHANGE COLUMN `rty_ir` `is_read` TINYINT(1) NOT NULL DEFAULT 0,
                CHANGE COLUMN `uio_ii` `is_important` TINYINT(1) NOT NULL DEFAULT 0,
                CHANGE COLUMN `asd_id` `is_deleted` TINYINT(1) NOT NULL DEFAULT 0,
                CHANGE COLUMN `fgh_da` `deleted_at` TIMESTAMP NULL DEFAULT NULL,
                CHANGE COLUMN `jkl_lut` `last_update_time` TIMESTAMP NULL DEFAULT NULL,
                CHANGE COLUMN `zxc_ca` `created_at` TIMESTAMP NULL DEFAULT NULL,
                CHANGE COLUMN `vbn_ua` `updated_at` TIMESTAMP NULL DEFAULT NULL');
            
            // Recreate original foreign keys
            DB::statement('ALTER TABLE `tgb_5y4v` 
                ADD CONSTRAINT `contact_messages_customer_id_foreign` 
                FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE');
            
            DB::statement('ALTER TABLE `tgb_5y4v` 
                ADD CONSTRAINT `contact_messages_admin_id_foreign` 
                FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`) ON DELETE SET NULL');
        }
        
        // Rename table back
        if (Schema::hasTable('tgb_5y4v') && !Schema::hasTable('contact_messages')) {
            Schema::rename('tgb_5y4v', 'contact_messages');
        }
    }
};
