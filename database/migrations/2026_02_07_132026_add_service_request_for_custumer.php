<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up(): void
    {
        Schema::create('srv_4k9p', function (Blueprint $table) {
            $table->id('k10_id');

            $table->string('a1_nm');               // customer_name
            $table->string('b2_ct');               // contact (email / phone)
            $table->text('c3_ad')->nullable();     // address / area

            $table->string('d4_rt');               // request_type
            $table->date('e5_pd')->nullable();     // preferred_date

            $table->string('f6_tn')->nullable();   // technician_name (manual)
            $table->string('g7_st')->default('new'); // status

            $table->text('h8_nt')->nullable();     // internal notes

            $table->timestamp('ujm_ca')->nullable();
            $table->timestamp('bnm_ua')->nullable();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('srv_4k9p');
    }
};
