<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('xxy_k7m2p', function (Blueprint $table) {
            // Add role column as NOT NULL directly
            $table->text('plm_rl')->after('jkl_pw');
        });
    }

    public function down(): void
    {
        Schema::table('xxy_k7m2p', function (Blueprint $table) {
            $table->dropColumn('plm_rl');
        });
    }
};
