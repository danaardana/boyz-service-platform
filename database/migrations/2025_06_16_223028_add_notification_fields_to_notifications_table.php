<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('notifications', function (Blueprint $table) {

            if (!Schema::hasColumn('notifications', 'title')) {
                $table->string('title')->after('type');
            }

            if (!Schema::hasColumn('notifications', 'message')) {
                $table->text('message')->after('title');
            }

            if (!Schema::hasColumn('notifications', 'icon')) {
                $table->string('icon')->nullable()->after('message');
            }

            if (!Schema::hasColumn('notifications', 'color')) {
                $table->string('color')->default('primary')->after('icon');
            }

            if (!Schema::hasColumn('notifications', 'action_type')) {
                $table->string('action_type')->after('color');
            }

            if (!Schema::hasColumn('notifications', 'action_id')) {
                $table->unsignedBigInteger('action_id')->nullable()->after('action_type');
            }

            if (!Schema::hasColumn('notifications', 'action_model')) {
                $table->string('action_model')->nullable()->after('action_id');
            }

            if (!Schema::hasColumn('notifications', 'user_id')) {
                $table->unsignedBigInteger('user_id')->nullable()->after('action_model');
            }

            if (!Schema::hasColumn('notifications', 'user_type')) {
                $table->string('user_type')->default('system')->after('user_id');
            }

            if (!Schema::hasColumn('notifications', 'user_name')) {
                $table->string('user_name')->nullable()->after('user_type');
            }

            if (!Schema::hasColumn('notifications', 'user_email')) {
                $table->string('user_email')->nullable()->after('user_name');
            }

            if (!Schema::hasColumn('notifications', 'metadata')) {
                $table->json('metadata')->nullable()->after('user_email');
            }

            if (!Schema::hasColumn('notifications', 'is_read')) {
                $table->boolean('is_read')->default(false)->after('metadata');
            }

            if (!Schema::hasColumn('notifications', 'read_at')) {
                $table->timestamp('read_at')->nullable()->after('is_read');
            }
        });
    }

    public function down(): void
    {
        Schema::table('notifications', function (Blueprint $table) {
            $table->dropColumn([
                'title','message','icon','color','action_type','action_id',
                'action_model','user_id','user_type','user_name','user_email',
                'metadata','is_read','read_at'
            ]);
        });
    }
};
