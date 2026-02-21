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
        Schema::table('mno_9x8w', function (Blueprint $table) {
            // Rename id column to k2_id
            if (Schema::hasColumn('mno_9x8w', 'id')) {
                $table->renameColumn('id', 'k2_id');
            }
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('mno_9x8w', function (Blueprint $table) {
            if (Schema::hasColumn('mno_9x8w', 'k2_id')) {
                $table->renameColumn('k2_id', 'id');
            }
        });
    }
};
