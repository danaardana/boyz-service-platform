<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\DB;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::table('xxy_k7m2p', function (Blueprint $table) {
            // Rename id column to k1_id
            if (Schema::hasColumn('xxy_k7m2p', 'id')) {
                $table->renameColumn('id', 'k1_id');
            }
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('xxy_k7m2p', function (Blueprint $table) {
            if (Schema::hasColumn('xxy_k7m2p', 'k1_id')) {
                $table->renameColumn('k1_id', 'id');
            }
        });
    }
};
