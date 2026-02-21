<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\DB;

return new class extends Migration
{
    /**
     * Run the migrations - Obfuscate Message Responses table
     */
    public function up(): void
    {
        // Check if table already renamed
        $tableExists = Schema::hasTable('nhy_3m2k');
        $oldTableExists = Schema::hasTable('message_responses');
        
        if (!$tableExists && $oldTableExists) {
            // Rename table from 'message_responses' to 'nhy_3m2k'
            Schema::rename('message_responses', 'nhy_3m2k');
        }
        
        // Use raw SQL to rename columns (MySQL/MariaDB)
        $driver = DB::getDriverName();
        
        if ($driver === 'mysql' || $driver === 'mariadb') {
            // Check if columns already renamed
            $columns = DB::select("SHOW COLUMNS FROM nhy_3m2k");
            $columnNames = array_column($columns, 'Field');
            
            // Only rename if columns still have original names
            if (in_array('contact_message_id', $columnNames)) {
                // First, drop foreign keys (try different possible names)
                $foreignKeys = DB::select("
                    SELECT CONSTRAINT_NAME 
                    FROM information_schema.KEY_COLUMN_USAGE 
                    WHERE TABLE_SCHEMA = DATABASE() 
                    AND TABLE_NAME = 'nhy_3m2k' 
                    AND REFERENCED_TABLE_NAME IS NOT NULL
                ");
                
                foreach ($foreignKeys as $fk) {
                    try {
                        DB::statement("ALTER TABLE `nhy_3m2k` DROP FOREIGN KEY `{$fk->CONSTRAINT_NAME}`");
                    } catch (\Exception $e) {
                        // Ignore if doesn't exist
                    }
                }
                
                // Rename columns
                DB::statement('ALTER TABLE `nhy_3m2k` 
                    CHANGE COLUMN `contact_message_id` `bgt_cmid` BIGINT(20) UNSIGNED NOT NULL,
                    CHANGE COLUMN `admin_id` `vfr_aid` BIGINT(20) UNSIGNED NOT NULL,
                    CHANGE COLUMN `message` `cde_msg` TEXT NOT NULL,
                    CHANGE COLUMN `created_at` `xsw_ca` TIMESTAMP NULL DEFAULT NULL');
                
                // Recreate foreign keys with new column names
                // Note: ID columns in referenced tables use their actual column names
                $contactMessageIdColumn = 'id'; // tgb_5y4v uses 'id' as primary key
                $adminIdColumn = Schema::hasColumn('xxy_k7m2p', 'id') ? 'id' : 'k1_id';
                
                DB::statement("ALTER TABLE `nhy_3m2k` 
                    ADD CONSTRAINT `nhy_3m2k_contact_message_id_foreign` 
                    FOREIGN KEY (`bgt_cmid`) REFERENCES `tgb_5y4v` (`{$contactMessageIdColumn}`) ON DELETE CASCADE");
                
                DB::statement("ALTER TABLE `nhy_3m2k` 
                    ADD CONSTRAINT `nhy_3m2k_admin_id_foreign` 
                    FOREIGN KEY (`vfr_aid`) REFERENCES `xxy_k7m2p` (`{$adminIdColumn}`) ON DELETE CASCADE");
                
                // Recreate index
                DB::statement('ALTER TABLE `nhy_3m2k` 
                    ADD INDEX `nhy_3m2k_bgt_cmid_xsw_ca_index` (`bgt_cmid`, `xsw_ca`)');
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
            // Drop index
            DB::statement('ALTER TABLE `nhy_3m2k` DROP INDEX IF EXISTS `nhy_3m2k_bgt_cmid_xsw_ca_index`');
            
            // Drop foreign keys
            DB::statement('ALTER TABLE `nhy_3m2k` DROP FOREIGN KEY IF EXISTS `nhy_3m2k_contact_message_id_foreign`');
            DB::statement('ALTER TABLE `nhy_3m2k` DROP FOREIGN KEY IF EXISTS `nhy_3m2k_admin_id_foreign`');
            
            // Rename columns back
            DB::statement('ALTER TABLE `nhy_3m2k` 
                CHANGE COLUMN `bgt_cmid` `contact_message_id` BIGINT(20) UNSIGNED NOT NULL,
                CHANGE COLUMN `vfr_aid` `admin_id` BIGINT(20) UNSIGNED NOT NULL,
                CHANGE COLUMN `cde_msg` `message` TEXT NOT NULL,
                CHANGE COLUMN `xsw_ca` `created_at` TIMESTAMP NULL DEFAULT NULL');
            
            // Recreate original foreign keys
            DB::statement('ALTER TABLE `nhy_3m2k` 
                ADD CONSTRAINT `message_responses_contact_message_id_foreign` 
                FOREIGN KEY (`contact_message_id`) REFERENCES `contact_messages` (`id`) ON DELETE CASCADE');
            
            DB::statement('ALTER TABLE `nhy_3m2k` 
                ADD CONSTRAINT `message_responses_admin_id_foreign` 
                FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`) ON DELETE CASCADE');
            
            // Recreate original index
            DB::statement('ALTER TABLE `nhy_3m2k` 
                ADD INDEX `message_responses_contact_message_id_created_at_index` (`contact_message_id`, `created_at`)');
        }
        
        // Rename table back
        if (Schema::hasTable('nhy_3m2k') && !Schema::hasTable('message_responses')) {
            Schema::rename('nhy_3m2k', 'message_responses');
        }
    }
};
