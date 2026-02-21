<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Http\Controllers\Controller;
use App\Traits\EncryptHelperTrait;
use Illuminate\Support\Facades\Crypt;

class Technician extends Model
{
    use EncryptHelperTrait;
    
    protected $table = 'tch_9x2q';
    protected $primaryKey = 't1_id';
    public $timestamps = true;

    const CREATED_AT = 'ujm_ca';
    const UPDATED_AT = 'bnm_ua';

    protected array $encryptableFields = [
        't2_nm',
        't3_em',
        't4_ph',
        't7_nt',
    ];

    protected $fillable = [
        't2_nm',
        't3_em',
        't4_ph',
        't6_st',
        't7_nt',
    ];

    protected static function booted()
    {
        static::creating(function ($tech) {
            $tech->encryptSensitiveData(); 
        });

        static::updating(function ($tech) {
            $tech->encryptSensitiveData(); 
        });
    }

    public function getNameAttribute()
    {
        try {
            return \Crypt::decryptString($this->attributes['t2_nm']);
        } catch (\Throwable $e) {
            return $this->attributes['t2_nm'];
        }
    }

    public function technicianUpdate(Request $request, $id)
    {
        $validator = \Validator::make($request->all(), [
            'name'   => 'required|string|max:255',
            'email'  => 'nullable|email|max:255',
            'phone'  => 'nullable|string|max:20',
            'role'   => 'required|string|max:50',
            'status' => 'required|string|max:50',
            'notes'  => 'nullable|string',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'success' => false,
                'errors'  => $validator->errors()
            ], 422);
        }

        try {
            $tech = Technician::findOrFail($id);

            $tech->update([
                't2_nm' => $request->name,
                't3_em' => $request->email,
                't4_ph' => $request->phone,
                't5_rl' => $request->role,
                't6_st' => $request->status,
                't7_nt' => $request->notes,
            ]);

            // 🔔 Create notification
            \App\Models\Notification::create([
                'tya_tp'  => 'info',
                'uio_tt'  => 'Technician updated',
                'asd_msg' => 'Technician data has been updated',
                'zxc_at'  => 'update',
                'plm_ut'  => 'admin',
            ]);

            return response()->json([
                'success' => true,
                'message' => 'Technician updated successfully'
            ]);

        } catch (\Exception $e) {

            return response()->json([
                'success' => false,
                'message' => $e->getMessage()
            ], 500);
        }
    }


    public function getRoleAttribute()
    {
        $role = $this->attributes['t5_rl'] ?? null;

        return $role ?: 'technician';
    }

    public function getEmailAttribute()
    {
        try {
            return \Crypt::decryptString($this->attributes['t3_em']);
        } catch (\Throwable $e) {
            return $this->attributes['t3_em'];
        }
    }

}
