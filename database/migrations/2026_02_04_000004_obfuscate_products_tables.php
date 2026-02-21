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
        Schema::disableForeignKeyConstraints();

        Schema::table('product_option_values', function (Blueprint $table) {
            $table->dropForeign(['product_option_id']);
        });

        Schema::table('product_options', function (Blueprint $table) {
            $table->dropForeign(['product_id']);
        });

        Schema::table('products', function (Blueprint $table) {
            $table->renameColumn('id', 'k7_id');
            $table->renameColumn('name', 'qwe_nm');
            $table->renameColumn('category', 'rty_ct');
            $table->renameColumn('image', 'uio_im');
            $table->renameColumn('description', 'asd_ds');
            $table->renameColumn('stock', 'fgh_st');
            $table->renameColumn('sold', 'jkl_sd');
            $table->renameColumn('ratings', 'zxc_rt');
            $table->renameColumn('average_rating', 'vbn_ar');
            $table->renameColumn('is_active', 'nmq_ia');
            $table->renameColumn('created_at', 'wer_ca');
            $table->renameColumn('updated_at', 'sdf_ua');
        });

        Schema::table('product_options', function (Blueprint $table) {
            $table->renameColumn('id', 'k8_id');
            $table->renameColumn('product_id', 'prf_pid');
            $table->renameColumn('option_name', 'qwe_on');
            $table->renameColumn('display_name', 'rty_dn');
            $table->renameColumn('is_required', 'uio_ir');
            $table->renameColumn('sort_order', 'asd_so');
            $table->renameColumn('created_at', 'fgh_ca');
            $table->renameColumn('updated_at', 'jkl_ua');
        });

        Schema::table('product_option_values', function (Blueprint $table) {
            $table->renameColumn('id', 'k9_id');
            $table->renameColumn('product_option_id', 'opv_oid');
            $table->renameColumn('value', 'qwe_vl');
            $table->renameColumn('display_value', 'rty_dv');
            $table->renameColumn('price_adjustment', 'uio_pa');
            $table->renameColumn('is_default', 'asd_id');
            $table->renameColumn('is_available', 'fgh_ia');
            $table->renameColumn('sort_order', 'jkl_so');
            $table->renameColumn('created_at', 'zxc_ca');
            $table->renameColumn('updated_at', 'vbn_ua');
        });

        Schema::rename('products', 'prd_4x7m');
        Schema::rename('product_options', 'opt_6k2p');
        Schema::rename('product_option_values', 'val_9m3q');

        Schema::table('opt_6k2p', function (Blueprint $table) {
            $table->foreign('prf_pid')->references('k7_id')->on('prd_4x7m')->onDelete('cascade');
        });

        Schema::table('val_9m3q', function (Blueprint $table) {
            $table->foreign('opv_oid')->references('k8_id')->on('opt_6k2p')->onDelete('cascade');
        });

        Schema::enableForeignKeyConstraints();
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::disableForeignKeyConstraints();

        Schema::table('val_9m3q', function (Blueprint $table) {
            $table->dropForeign(['opv_oid']);
        });

        Schema::table('opt_6k2p', function (Blueprint $table) {
            $table->dropForeign(['prf_pid']);
        });

        Schema::rename('val_9m3q', 'product_option_values');
        Schema::rename('opt_6k2p', 'product_options');
        Schema::rename('prd_4x7m', 'products');

        Schema::table('product_option_values', function (Blueprint $table) {
            $table->renameColumn('k9_id', 'id');
            $table->renameColumn('opv_oid', 'product_option_id');
            $table->renameColumn('qwe_vl', 'value');
            $table->renameColumn('rty_dv', 'display_value');
            $table->renameColumn('uio_pa', 'price_adjustment');
            $table->renameColumn('asd_id', 'is_default');
            $table->renameColumn('fgh_ia', 'is_available');
            $table->renameColumn('jkl_so', 'sort_order');
            $table->renameColumn('zxc_ca', 'created_at');
            $table->renameColumn('vbn_ua', 'updated_at');
        });

        Schema::table('product_options', function (Blueprint $table) {
            $table->renameColumn('k8_id', 'id');
            $table->renameColumn('prf_pid', 'product_id');
            $table->renameColumn('qwe_on', 'option_name');
            $table->renameColumn('rty_dn', 'display_name');
            $table->renameColumn('uio_ir', 'is_required');
            $table->renameColumn('asd_so', 'sort_order');
            $table->renameColumn('fgh_ca', 'created_at');
            $table->renameColumn('jkl_ua', 'updated_at');
        });

        Schema::table('products', function (Blueprint $table) {
            $table->renameColumn('k7_id', 'id');
            $table->renameColumn('qwe_nm', 'name');
            $table->renameColumn('rty_ct', 'category');
            $table->renameColumn('uio_im', 'image');
            $table->renameColumn('asd_ds', 'description');
            $table->renameColumn('fgh_st', 'stock');
            $table->renameColumn('jkl_sd', 'sold');
            $table->renameColumn('zxc_rt', 'ratings');
            $table->renameColumn('vbn_ar', 'average_rating');
            $table->renameColumn('nmq_ia', 'is_active');
            $table->renameColumn('wer_ca', 'created_at');
            $table->renameColumn('sdf_ua', 'updated_at');
        });

        Schema::table('product_options', function (Blueprint $table) {
            $table->foreign('product_id')->references('id')->on('products')->onDelete('cascade');
        });

        Schema::table('product_option_values', function (Blueprint $table) {
            $table->foreign('product_option_id')->references('id')->on('product_options')->onDelete('cascade');
        });

        Schema::enableForeignKeyConstraints();
    }
};
