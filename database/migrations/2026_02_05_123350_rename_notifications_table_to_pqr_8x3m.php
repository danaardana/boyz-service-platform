<?php

use Illuminate\Support\Facades\DB;
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
        if (Schema::hasTable('notifications') && !Schema::hasTable('pqr_8x3m')) {
            Schema::rename('notifications', 'pqr_8x3m');
        }
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        if (Schema::hasTable('pqr_8x3m') && !Schema::hasTable('notifications')) {
            Schema::rename('pqr_8x3m', 'notifications');
        }
    }
};
