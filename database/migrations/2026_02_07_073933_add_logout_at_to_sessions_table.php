<?php
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up(): void
    {
        Schema::table('qwe_9k2p', function (Blueprint $table) {
            $table->timestamp('asd_lo')->nullable()->after('qwe_la');
        });
    }

    public function down(): void
    {
        Schema::table('qwe_9k2p', function (Blueprint $table) {
            $table->dropColumn('asd_lo');
        });
    }
};

