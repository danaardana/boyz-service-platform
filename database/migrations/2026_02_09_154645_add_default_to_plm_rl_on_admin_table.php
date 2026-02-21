<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\DB;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('xxy_k7m2p', function (Blueprint $table) {
            // pastikan kolom ada
            if (Schema::hasColumn('xxy_k7m2p', 'plm_rl')) {
                // ubah default jadi 'owner'
                DB::statement("
                    ALTER TABLE xxy_k7m2p 
                    MODIFY plm_rl VARCHAR(50) NOT NULL DEFAULT 'owner'
                ");
            }
        });
    }

    public function down(): void
    {
        Schema::table('xxy_k7m2p', function (Blueprint $table) {
            if (Schema::hasColumn('xxy_k7m2p', 'plm_rl')) {
                // rollback: hapus default (tetap NOT NULL)
                DB::statement("
                    ALTER TABLE xxy_k7m2p 
                    MODIFY plm_rl VARCHAR(50) NOT NULL
                ");
            }
        });
    }
};
