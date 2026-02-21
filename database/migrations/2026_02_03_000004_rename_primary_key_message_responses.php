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
        Schema::table('nhy_3m2k', function (Blueprint $table) {
            // Rename id column to k4_id
            if (Schema::hasColumn('nhy_3m2k', 'id')) {
                $table->renameColumn('id', 'k4_id');
            }
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('nhy_3m2k', function (Blueprint $table) {
            if (Schema::hasColumn('nhy_3m2k', 'k4_id')) {
                $table->renameColumn('k4_id', 'id');
            }
        });
    }
};
