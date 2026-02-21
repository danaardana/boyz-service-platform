<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('tgb_5y4v', function (Blueprint $table) {

            // Pastikan kolom customer_id nullable
            // TANPA drop foreign key
            $table->unsignedBigInteger('yhn_cid')->nullable()->change();
        });
    }

    public function down(): void
    {
        Schema::table('tgb_5y4v', function (Blueprint $table) {

            // rollback ke NOT NULL jika perlu
            $table->unsignedBigInteger('yhn_cid')->nullable(false)->change();
        });
    }
};
