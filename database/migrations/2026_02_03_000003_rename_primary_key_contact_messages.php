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
        Schema::table('tgb_5y4v', function (Blueprint $table) {
            // Rename id column to k3_id
            if (Schema::hasColumn('tgb_5y4v', 'id')) {
                $table->renameColumn('id', 'k3_id');
            }
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('tgb_5y4v', function (Blueprint $table) {
            if (Schema::hasColumn('tgb_5y4v', 'k3_id')) {
                $table->renameColumn('k3_id', 'id');
            }
        });
    }
};
