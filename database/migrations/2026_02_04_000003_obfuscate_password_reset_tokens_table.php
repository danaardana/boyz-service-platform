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
        Schema::table('password_reset_tokens', function (Blueprint $table) {
            $table->renameColumn('email', 'qwe_em');
            $table->renameColumn('token', 'asd_tk');
            $table->renameColumn('created_at', 'zxc_ca');
        });

        Schema::rename('password_reset_tokens', 'rst_7x9m');
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::rename('rst_7x9m', 'password_reset_tokens');

        Schema::table('password_reset_tokens', function (Blueprint $table) {
            $table->renameColumn('qwe_em', 'email');
            $table->renameColumn('asd_tk', 'token');
            $table->renameColumn('zxc_ca', 'created_at');
        });
    }
};
