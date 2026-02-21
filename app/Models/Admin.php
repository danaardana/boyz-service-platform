<?php

namespace App\Models;

use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Crypt;

class Admin extends Authenticatable
{
    /**
     * Set custom primary key for obfuscated table
     */
    protected $primaryKey = 'k1_id';
    public $incrementing = true;
    protected $keyType = 'int';
    use Notifiable;

    protected $guard = 'admin'; // Gunakan guard 'admin'
    
    // Obfuscated table name
    protected $table = 'xxy_k7m2p';

    // Use obfuscated timestamp column names
    public const CREATED_AT = 'wer_ca';
    public const UPDATED_AT = 'sdf_ua';

    // Allow both logical attribute names and obfuscated DB column names
    protected $fillable = [
        // logical attribute names used by controllers/forms
        'name',        // maps to qwe_nm
        'email',       // maps to rty_em
        'password',    // maps to jkl_pw
        'remember_token',
        'is_active',
        'verified',
        'security_code',
        'security_code_expires_at',
        'avatar_path',
        'role', 

        // obfuscated DB column names (kept for direct usage)
        'qwe_nm',      // name
        'rty_em',      // email
        'jkl_pw',      // password
        'zxc_rt',      // remember_token
        'asd_ac',      // is_active
        'fgh_vf',      // verified
        'vbn_sc',      // security_code
        'nmq_ea',      // security_code_expires_at
        'hjk_ap',       // avatar_path
        'plm_rl'      // role
    ];

    protected $hidden = [
        'password',
        'remember_token',
        'security_code'
    ];

    protected $casts = [
        'asd_ac' => 'boolean',      // is_active
        'fgh_vf' => 'boolean',      // verified
        'nmq_ea' => 'datetime',    // security_code_expires_at
        'jkl_pw' => 'hashed',      // password
    ];

    /**
     * Get messages assigned to this admin
     
    *public function assignedMessages() 
    *{
    *    return $this->hasMany(ContactMessage::class, 'ujm_aid')->orderBy('zxc_ca', 'desc'); // admin_id
    *}
    */

    /**
     * Get all contact messages (with optional filters)
     */
    public function getAllMessages($filters = [])
    {
        $query = ContactMessage::query();

        if (isset($filters['category'])) {
            $query->where('qwe_cat', $filters['category']); // category
        }

        if (isset($filters['status'])) {
            $query->where('pkm_st', $filters['status']); // status
        }

        if (isset($filters['assigned_to'])) {
            $query->where('ujm_aid', $filters['assigned_to']); // admin_id
        }

        return $query->orderBy('zxc_ca', 'desc'); // created_at
    }

    /**
     * Assign a message to an admin
     */
    public function assignMessage($messageId, $adminId = null)
    {
        $message = ContactMessage::findOrFail($messageId);
        
        return $message->update([
            'ujm_aid' => $adminId ?? $this->k1_id, // admin_id
            'pkm_st' => ContactMessage::STATUS_IN_PROGRESS, // status
            'jkl_lut' => now(), // last_update_time
        ]);
    }

    /**
     * Add an admin response to a message
     */
    public function respondToMessage($messageId, $response)
    {
        // Create MessageResponse record (extra_data was removed)
        return \App\Models\MessageResponse::create([
            'bgt_cmid' => $messageId, // contact_message_id
            'vfr_aid' => $this->k1_id, // admin_id
            'cde_msg' => $response, // message
        ]);
    }

    /**
     * Update message status
     */
    public function updateMessageStatus($messageId, $status)
    {
        $message = ContactMessage::findOrFail($messageId);
        
        return $message->update([
            'pkm_st' => $status, // status
            'jkl_lut' => now(), // last_update_time
        ]);
    }

    /**
     * Get message statistics
     */
    public function getMessageStats()
    {
        $messages = ContactMessage::all();
        
        return [
            'total' => $messages->count(),
            'by_category' => $messages->groupBy(function ($message) {
                return $message->qwe_cat; // category
            })->map->count(),
            'by_status' => $messages->groupBy(function ($message) {
                return $message->pkm_st; // status
            })->map->count(),
            'unassigned' => $messages->filter(function ($message) {
                return empty($message->ujm_aid); // admin_id
            })->count()
        ];
    }

    /**
     * Generate a new security code for password reset
     */
    public function generateSecurityCode()
    {
        $this->vbn_sc = strtoupper(substr(md5(uniqid()), 0, 8)); // security_code
        $this->nmq_ea = now()->addHours(1); // security_code_expires_at
        $this->save();

        return $this->vbn_sc;
    }

    /**
     * Verify if the security code is valid
     */
    public function verifySecurityCode($code)
    {
        if ($this->vbn_sc === null || 
            $this->nmq_ea === null || 
            $this->nmq_ea < now()) {
            return false;
        }

        return strtoupper($code) === $this->vbn_sc;
    }

    /**
     * Clear the security code after use
     */
    public function clearSecurityCode()
    {
        $this->vbn_sc = null; // security_code
        $this->nmq_ea = null; // security_code_expires_at
        $this->save();
    }

    /**
     * Check if admin is verified
     */
    public function isVerified()
    {
        return $this->fgh_vf === true; // verified
    }

    /**
     * Mark admin as verified
     */
    public function markAsVerified()
    {
        $this->fgh_vf = true; // verified
        $this->save();
        return $this;
    }

    /**
     * Mark admin as unverified
     */
    public function markAsUnverified()
    {
        $this->fgh_vf = false; // verified
        $this->save();
        return $this;
    }

    /**
     * Scope to get only verified admins
     */
    public function scopeVerified($query)
    {
        return $query->where('fgh_vf', true); // verified
    }

    /**
     * Scope to get only unverified admins
     */
    public function scopeUnverified($query)
    {
        return $query->where('fgh_vf', false); // verified
    }

    /**
     * Get the email address (decrypt if encrypted).
     * Maps to obfuscated column: rty_em
     */
    public function getEmailAttribute($value)
    {
        // Get from obfuscated column
        $rawValue = $this->attributes['rty_em'] ?? $value;
        return $this->decryptAttribute($rawValue, 'email');
    }

    /**
     * Set the email address (encrypt before storing).
     * Maps to obfuscated column: rty_em
     */
    public function setEmailAttribute($value)
    {
        $this->attributes['rty_em'] = $this->encryptAttribute($value, 'email');
    }

    /**
     * Get the name (decrypt if encrypted).
     * Maps to obfuscated column: qwe_nm
     */
    public function getNameAttribute($value)
    {
        // Get from obfuscated column
        $rawValue = $this->attributes['qwe_nm'] ?? $value;
        return $this->decryptAttribute($rawValue, 'name');
    }

    /**
     * Set the name (encrypt before storing).
     * Maps to obfuscated column: qwe_nm
     */
    public function setNameAttribute($value)
    {
        $this->attributes['qwe_nm'] = $this->encryptAttribute($value, 'name');
    }

    /**
     * Get role (decrypt from obfuscated column: plm_rl)
     */
    public function getRoleAttribute($value)
    {
        $rawValue = $this->attributes['plm_rl'] ?? null;
        return $this->decryptAttribute($rawValue, 'generic');
    }

    /**
     * Set role (encrypt into obfuscated column: plm_rl)
     */
    public function setRoleAttribute($value)
    {
        $this->attributes['plm_rl'] = $this->encryptAttribute($value, 'generic');
    }

    /**
     * Get is_active attribute - maps to obfuscated column: asd_ac
     */
    public function getIsActiveAttribute($value)
    {
        return $this->attributes['asd_ac'] ?? $value;
    }

    /**
     * Set is_active attribute - maps to obfuscated column: asd_ac
     */
    public function setIsActiveAttribute($value)
    {
        $this->attributes['asd_ac'] = $value;
    }

    /**
     * Get verified attribute - maps to obfuscated column: fgh_vf
     */
    public function getVerifiedAttribute($value)
    {
        return $this->attributes['fgh_vf'] ?? $value;
    }

    /**
     * Set verified attribute - maps to obfuscated column: fgh_vf
     */
    public function setVerifiedAttribute($value)
    {
        $this->attributes['fgh_vf'] = $value;
    }

    /**
     * Get password attribute - maps to obfuscated column: jkl_pw
     */
    public function getPasswordAttribute($value)
    {
        return $this->attributes['jkl_pw'] ?? $value;
    }

    /**
     * Set password attribute - maps to obfuscated column: jkl_pw
     */
    public function setPasswordAttribute($value)
    {
        $this->attributes['jkl_pw'] = $value;
    }

    /**
     * Generic method to decrypt an attribute.
     */
    protected function decryptAttribute($value, $type = 'generic')
    {
        if (empty($value)) {
            return $value;
        }

        try {
            // Try to decrypt the value
            $decrypted = Crypt::decrypt($value);
            
            // Validate based on type
            if ($type === 'email' && filter_var($decrypted, FILTER_VALIDATE_EMAIL)) {
                return $decrypted;
            } elseif ($type === 'name' && is_string($decrypted) && strlen(trim($decrypted)) > 0) {
                return $decrypted;
            } elseif ($type === 'generic') {
                return $decrypted;
            }
        } catch (\Exception $e) {
            // If decryption fails, check if it's already in plain format
            if ($type === 'email' && filter_var($value, FILTER_VALIDATE_EMAIL)) {
                return $value;
            } elseif ($type === 'name' && is_string($value) && strlen(trim($value)) > 0) {
                return $value;
            }
        }
        
        // Fallback: return the original value
        return $value;
    }

    /**
     * Generic method to encrypt an attribute.
     */
    protected function encryptAttribute($value, $type = 'generic')
    {
        if (empty($value)) {
            return $value;
        }

        try {
            // Validate input based on type before encryption
            $shouldEncrypt = false;
            
            if ($type === 'email' && filter_var($value, FILTER_VALIDATE_EMAIL)) {
                $shouldEncrypt = true;
            } elseif ($type === 'name' && is_string($value) && strlen(trim($value)) > 0) {
                $shouldEncrypt = true;
            } elseif ($type === 'generic') {
                $shouldEncrypt = true;
            }

            if ($shouldEncrypt) {
                return Crypt::encrypt($value);
            } else {
                // If not valid format, store as is (might already be encrypted)
                return $value;
            }
        } catch (\Exception $e) {
            // If encryption fails, store as plain text (fallback)
            return $value;
        }
    }

    /**
     * Check if email value is already encrypted
     */
    private function isEmailEncrypted($value): bool
    {
        if (empty($value)) {
            return false;
        }

        try {
            Crypt::decrypt($value);
            return true;
        } catch (\Exception $e) {
            return false;
        }
    }

    /**
     * Check if email value is already decrypted (plain text email format)
     */
    private function isEmailDecrypted($value): bool
    {
        return !empty($value) && filter_var($value, FILTER_VALIDATE_EMAIL) !== false;
    }

    /**
     * Find an admin by email (handles both encrypted and plain emails)
     */
    public static function findByEmail($email)
    {
        return static::findByAttribute('email', $email);
    }

    /**
     * Find an admin by name (handles both encrypted and plain names)
     */
    public static function findByName($name)
    {
        return static::findByAttribute('name', $name);
    }

    /**
     * Generic method to find admin by any encrypted attribute
     */
    protected static function mapAttributeToColumn($attribute)
    {
        return match ($attribute) {
            'email' => 'rty_em',
            'name' => 'qwe_nm',
            'role'  => 'plm_rl',
            default => $attribute,
        };
    }
    
    protected static function findByAttribute($attribute, $value)
    {
        $column = static::mapAttributeToColumn($attribute);

        // Ambil semua record lalu decrypt manual
        $admins = DB::table('xxy_k7m2p')->select('k1_id', $column)->get();

        foreach ($admins as $adminRecord) {
            try {
                $encryptedValue = $adminRecord->{$column};

                if (!$encryptedValue) {
                    continue;
                }

                $decryptedValue = Crypt::decrypt($encryptedValue);

                if ($decryptedValue === $value) {
                    return static::find($adminRecord->k1_id); 
                }
            } catch (\Exception $e) {
                continue;
            }
        }

        return null;
    }

}
