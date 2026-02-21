<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\DB;

return new class extends Migration
{
    public function up(): void
    {
        // ChatConversation: chat_conversations => fgh_82lm
        if (Schema::hasTable('chat_conversations') && !Schema::hasTable('fgh_82lm')) {
            Schema::rename('chat_conversations', 'fgh_82lm');
        }
        if (Schema::hasTable('fgh_82lm')) {
            $driver = DB::getDriverName();
            if (in_array($driver, ['mysql','mariadb'])) {
                $cols = DB::select("SHOW COLUMNS FROM fgh_82lm");
                $names = array_column($cols, 'Field');
                if (in_array('customer_id', $names)) {
                    $keys = DB::select("SELECT CONSTRAINT_NAME FROM information_schema.KEY_COLUMN_USAGE WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'fgh_82lm' AND REFERENCED_TABLE_NAME IS NOT NULL");
                    foreach ($keys as $fk) {
                        try { DB::statement("ALTER TABLE `fgh_82lm` DROP FOREIGN KEY `{$fk->CONSTRAINT_NAME}`"); } catch (\Exception $e) {}
                    }
                    DB::statement('ALTER TABLE `fgh_82lm` 
                        CHANGE COLUMN `customer_id` `z1_cid` BIGINT UNSIGNED NULL,
                        CHANGE COLUMN `admin_id` `z1_aid` BIGINT UNSIGNED NULL,
                        CHANGE COLUMN `customer_name` `xcv_nm` VARCHAR(255) NOT NULL,
                        CHANGE COLUMN `customer_email` `xcv_em` VARCHAR(255) NULL,
                        CHANGE COLUMN `status` `sdw_st` VARCHAR(20) NOT NULL DEFAULT "active",
                        CHANGE COLUMN `priority` `sdw_pr` VARCHAR(20) NOT NULL DEFAULT "normal",
                        CHANGE COLUMN `initial_message` `cvb_iq` TEXT NULL,
                        CHANGE COLUMN `has_predefined_answer` `brz_ha` TINYINT(1) NOT NULL DEFAULT 0,
                        CHANGE COLUMN `last_message_at` `vbv_lm` TIMESTAMP NULL DEFAULT NULL,
                        CHANGE COLUMN `customer_acknowledged_recording` `ght_cr` TINYINT(1) NOT NULL DEFAULT 0,
                        CHANGE COLUMN `session_data` `nhy_sd` JSON NULL,
                        CHANGE COLUMN `resolved_at` `lkj_ra` TIMESTAMP NULL DEFAULT NULL,
                        CHANGE COLUMN `resolved_by` `dfg_rb` BIGINT UNSIGNED NULL
                    ');
                }
            }
        }
        // ChatMessage: chat_messages => jkl_23qw
        if (Schema::hasTable('chat_messages') && !Schema::hasTable('jkl_23qw')) {
            Schema::rename('chat_messages', 'jkl_23qw');
        }
        if (Schema::hasTable('jkl_23qw')) {
            $driver = DB::getDriverName();
            if (in_array($driver, ['mysql','mariadb'])) {
                $cols = DB::select("SHOW COLUMNS FROM jkl_23qw");
                $names = array_column($cols, 'Field');
                if (in_array('conversation_id', $names)) {
                    $keys = DB::select("SELECT CONSTRAINT_NAME FROM information_schema.KEY_COLUMN_USAGE WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'jkl_23qw' AND REFERENCED_TABLE_NAME IS NOT NULL");
                    foreach ($keys as $fk) {
                        try { DB::statement("ALTER TABLE `jkl_23qw` DROP FOREIGN KEY `{$fk->CONSTRAINT_NAME}`"); } catch (\Exception $e) {}
                    }
                    DB::statement('ALTER TABLE `jkl_23qw` 
                        CHANGE COLUMN `conversation_id` `mnb_cid` BIGINT UNSIGNED NOT NULL,
                        CHANGE COLUMN `sender_type` `vgt_st` VARCHAR(20) NOT NULL,
                        CHANGE COLUMN `sender_id` `vgt_sid` BIGINT UNSIGNED NULL,
                        CHANGE COLUMN `message_content` `lkj_mc` TEXT NOT NULL,
                        CHANGE COLUMN `message_type` `mnb_mt` VARCHAR(20) NOT NULL DEFAULT "text",
                        CHANGE COLUMN `is_read` `wsx_ir` TINYINT(1) NOT NULL DEFAULT 0,
                        CHANGE COLUMN `metadata` `qa2_md` JSON NULL
                    ');
                }
            }
        }
        // ChatbotAutoResponse: chatbot_auto_responses => wer_72qp
        if (Schema::hasTable('chatbot_auto_responses') && !Schema::hasTable('wer_72qp')) {
            Schema::rename('chatbot_auto_responses', 'wer_72qp');
        }
        if (Schema::hasTable('wer_72qp')) {
            $driver = DB::getDriverName();
            if (in_array($driver, ['mysql','mariadb'])) {
                $cols = DB::select("SHOW COLUMNS FROM wer_72qp");
                $names = array_column($cols, 'Field');
                if (in_array('keyword', $names)) {
                    $keys = DB::select("SELECT CONSTRAINT_NAME FROM information_schema.KEY_COLUMN_USAGE WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'wer_72qp' AND REFERENCED_TABLE_NAME IS NOT NULL");
                    foreach ($keys as $fk) {
                        try { DB::statement("ALTER TABLE `wer_72qp` DROP FOREIGN KEY `{$fk->CONSTRAINT_NAME}`"); } catch (\Exception $e) {}
                    }
                    DB::statement('ALTER TABLE `wer_72qp` 
                        CHANGE COLUMN `keyword` `tyu_kw` VARCHAR(255) NOT NULL,
                        CHANGE COLUMN `response` `rty_rs` TEXT NOT NULL,
                        CHANGE COLUMN `is_active` `wsx_ia` TINYINT(1) NOT NULL DEFAULT 1,
                        CHANGE COLUMN `priority` `vbn_pr` INT NOT NULL DEFAULT 0,
                        CHANGE COLUMN `additional_keywords` `qwe_ak` JSON NULL,
                        CHANGE COLUMN `match_type` `sdf_mt` VARCHAR(20) NOT NULL DEFAULT "contains",
                        CHANGE COLUMN `case_sensitive` `cde_cs` TINYINT(1) NOT NULL DEFAULT 0,
                        CHANGE COLUMN `description` `nhy_ds` TEXT NULL,
                        CHANGE COLUMN `created_by` `pol_cb` BIGINT UNSIGNED NULL,
                        CHANGE COLUMN `updated_by` `ijn_ub` BIGINT UNSIGNED NULL
                    ');
                }
            }
        }
    }
    public function down(): void
    {
        // Reverse ChatbotAutoResponse
        if (Schema::hasTable('wer_72qp') && !Schema::hasTable('chatbot_auto_responses')) {
            Schema::rename('wer_72qp', 'chatbot_auto_responses');
        }
        if (Schema::hasTable('chatbot_auto_responses')) {
            $driver = DB::getDriverName();
            if (in_array($driver, ['mysql','mariadb'])) {
                $cols = DB::select("SHOW COLUMNS FROM chatbot_auto_responses");
                $names = array_column($cols, 'Field');
                if (in_array('tyu_kw', $names)) {
                    DB::statement('ALTER TABLE `chatbot_auto_responses` 
                        CHANGE COLUMN `tyu_kw` `keyword` VARCHAR(255) NOT NULL,
                        CHANGE COLUMN `rty_rs` `response` TEXT NOT NULL,
                        CHANGE COLUMN `wsx_ia` `is_active` TINYINT(1) NOT NULL DEFAULT 1,
                        CHANGE COLUMN `vbn_pr` `priority` INT NOT NULL DEFAULT 0,
                        CHANGE COLUMN `qwe_ak` `additional_keywords` JSON NULL,
                        CHANGE COLUMN `sdf_mt` `match_type` VARCHAR(20) NOT NULL DEFAULT "contains",
                        CHANGE COLUMN `cde_cs` `case_sensitive` TINYINT(1) NOT NULL DEFAULT 0,
                        CHANGE COLUMN `nhy_ds` `description` TEXT NULL,
                        CHANGE COLUMN `pol_cb` `created_by` BIGINT UNSIGNED NULL,
                        CHANGE COLUMN `ijn_ub` `updated_by` BIGINT UNSIGNED NULL
                    ');
                }
            }
        }
        // Reverse ChatMessage
        if (Schema::hasTable('jkl_23qw') && !Schema::hasTable('chat_messages')) {
            Schema::rename('jkl_23qw', 'chat_messages');
        }
        if (Schema::hasTable('chat_messages')) {
            $driver = DB::getDriverName();
            if (in_array($driver, ['mysql','mariadb'])) {
                $cols = DB::select("SHOW COLUMNS FROM chat_messages");
                $names = array_column($cols, 'Field');
                if (in_array('mnb_cid', $names)) {
                    DB::statement('ALTER TABLE `chat_messages` 
                        CHANGE COLUMN `mnb_cid` `conversation_id` BIGINT UNSIGNED NOT NULL,
                        CHANGE COLUMN `vgt_st` `sender_type` VARCHAR(20) NOT NULL,
                        CHANGE COLUMN `vgt_sid` `sender_id` BIGINT UNSIGNED NULL,
                        CHANGE COLUMN `lkj_mc` `message_content` TEXT NOT NULL,
                        CHANGE COLUMN `mnb_mt` `message_type` VARCHAR(20) NOT NULL DEFAULT "text",
                        CHANGE COLUMN `wsx_ir` `is_read` TINYINT(1) NOT NULL DEFAULT 0,
                        CHANGE COLUMN `qa2_md` `metadata` JSON NULL
                    ');
                }
            }
        }
        // Reverse ChatConversation
        if (Schema::hasTable('fgh_82lm') && !Schema::hasTable('chat_conversations')) {
            Schema::rename('fgh_82lm', 'chat_conversations');
        }
        if (Schema::hasTable('chat_conversations')) {
            $driver = DB::getDriverName();
            if (in_array($driver, ['mysql','mariadb'])) {
                $cols = DB::select("SHOW COLUMNS FROM chat_conversations");
                $names = array_column($cols, 'Field');
                if (in_array('z1_cid', $names)) {
                    DB::statement('ALTER TABLE `chat_conversations` 
                        CHANGE COLUMN `z1_cid` `customer_id` BIGINT UNSIGNED NULL,
                        CHANGE COLUMN `z1_aid` `admin_id` BIGINT UNSIGNED NULL,
                        CHANGE COLUMN `xcv_nm` `customer_name` VARCHAR(255) NOT NULL,
                        CHANGE COLUMN `xcv_em` `customer_email` VARCHAR(255) NULL,
                        CHANGE COLUMN `sdw_st` `status` VARCHAR(20) NOT NULL DEFAULT "active",
                        CHANGE COLUMN `sdw_pr` `priority` VARCHAR(20) NOT NULL DEFAULT "normal",
                        CHANGE COLUMN `cvb_iq` `initial_message` TEXT NULL,
                        CHANGE COLUMN `brz_ha` `has_predefined_answer` TINYINT(1) NOT NULL DEFAULT 0,
                        CHANGE COLUMN `vbv_lm` `last_message_at` TIMESTAMP NULL DEFAULT NULL,
                        CHANGE COLUMN `ght_cr` `customer_acknowledged_recording` TINYINT(1) NOT NULL DEFAULT 0,
                        CHANGE COLUMN `nhy_sd` `session_data` JSON NULL,
                        CHANGE COLUMN `lkj_ra` `resolved_at` TIMESTAMP NULL DEFAULT NULL,
                        CHANGE COLUMN `dfg_rb` `resolved_by` BIGINT UNSIGNED NULL
                    ');
                }
            }
        }
    }
};
