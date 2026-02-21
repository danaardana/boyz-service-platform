<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::table('sessions', function (Blueprint $table) {
            // Rename columns first
            $table->renameColumn('id', 'k6_id');
            $table->renameColumn('user_id', 'tyu_uid');
            $table->renameColumn('ip_address', 'rty_ip');
            $table->renameColumn('user_agent', 'wsx_ua');
            $table->renameColumn('payload', 'vbn_pl');
            $table->renameColumn('last_activity', 'qwe_la');
        });

        // Rename table
        Schema::rename('sessions', 'qwe_9k2p');
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        // Rename table back
        Schema::rename('qwe_9k2p', 'sessions');

        Schema::table('sessions', function (Blueprint $table) {
            // Rename columns back
            $table->renameColumn('k6_id', 'id');
            $table->renameColumn('tyu_uid', 'user_id');
            $table->renameColumn('rty_ip', 'ip_address');
            $table->renameColumn('wsx_ua', 'user_agent');
            $table->renameColumn('vbn_pl', 'payload');
            $table->renameColumn('qwe_la', 'last_activity');
        });
    }
};
