<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('srv_4k9p', function (Blueprint $table) {

            // Relational references (no foreign keys per your design)
            $table->unsignedBigInteger('yhn_cid')
                  ->nullable()
                  ->after('k10_id');

            $table->unsignedBigInteger('j1_mid')
                  ->nullable()
                  ->after('yhn_cid');

            // Priority
            $table->string('h8_pr')
                  ->default('normal')
                  ->after('g7_st');

            // Created by (encrypted snapshot)
            $table->text('k2_cb')
                  ->nullable()
                  ->after('h8_nt');
        });
    }

    public function down(): void
    {
        Schema::table('srv_4k9p', function (Blueprint $table) {
            $table->dropColumn([
                'yhn_cid',
                'j1_mid',
                'h8_pr',
                'k2_cb',
            ]);
        });
    }
};
