<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ServiceRequest extends Model
{
    protected $table = 'srv_4k9p';
    protected $primaryKey = 'k10_id';

    const CREATED_AT = 'ujm_ca';
    const UPDATED_AT = 'bnm_ua';

    protected $fillable = [
        'yhn_cid',
        'j1_mid',
        'a1_nm',
        'b2_ct',
        'c3_ad',
        'd4_rt',
        'e5_pd',
        'f6_tn',
        'g7_st',
        'h8_pr',
        'h8_nt',
        'k2_cb',
    ];


    /*
    |--------------------------------------------------------------------------
    | Relationships (optional but recommended)
    |--------------------------------------------------------------------------
    */

    public function customer()
    {
        return $this->belongsTo(Customer::class, 'yhn_cid', 'k2_id');
    }

    public function contactMessage()
    {
        return $this->belongsTo(ContactMessage::class, 'j1_mid', 'k3_id');
    }
}
