<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up(): void
    {
        Schema::create('tch_9x2q', function (Blueprint $table) {
            $table->bigIncrements('t1_id');

            // Encrypted snapshot fields
            $table->text('t2_nm');              // technician name
            $table->text('t3_em')->nullable();  // email
            $table->text('t4_ph')->nullable();  // phone

            // Fixed role
            $table->string('t5_rl', 50)->default('technician');

            // Status
            $table->string('t6_st', 30)->default('active');

            // Internal notes
            $table->text('t7_nt')->nullable();

            // Timestamps (obfuscated)
            $table->timestamp('ujm_ca')->nullable();
            $table->timestamp('bnm_ua')->nullable();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('tch_9x2q');
    }
};
