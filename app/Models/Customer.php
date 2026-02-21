<?php

namespace App\Models;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Database\Eloquent\Relations\HasMany;
use App\Traits\EncryptHelperTrait;
use App\Models\ContactMessage;

class Customer extends Model
{
    use HasFactory, EncryptHelperTrait;

    // Obfuscated table name
    protected $table = 'mno_9x8w';
    protected $primaryKey = 'k2_id';
    public $incrementing = true;      // auto increment
    protected $keyType = 'int';

    protected array $encryptableFields = [
        'iop_nm', // name
        'klj_em', // email
        'qaz_ph', // phone
        'adr_ad', // address (if any)
    ];

    protected $fillable = [
        'iop_nm',      // name
        'klj_em',      // email
        'qaz_ph',      // phone
        'wsx_ad',      // address
    ];

    // Map obfuscated timestamp columns
    public const CREATED_AT = 'edc_ca';
    public const UPDATED_AT = 'rfv_ua';

    protected $casts = [
        'edc_ca' => 'datetime',    // created_at
        'rfv_ua' => 'datetime',    // updated_at
    ];

    protected static function booted()
    {
        static::creating(function ($customer) {
            $customer->encryptSensitiveData(); // ✅ FIX
        });

        static::updating(function ($customer) {
            $customer->encryptSensitiveData(); // ✅ FIX
        });
    } 

    /**
     * Get the name (decrypt if encrypted).
     * Maps to obfuscated column: iop_nm
     */
    public function getNameAttribute()
    {
        // Get from obfuscated column directly
        if (!isset($this->attributes['iop_nm'])) {
            return null;
        }
        
        $rawValue = $this->attributes['iop_nm'];
        
        if (empty($rawValue)) {
            return $rawValue;
        }

        try {
            // Check if it looks like encrypted data (starts with eyJ which is base64 for {)
            if (strpos($rawValue, 'eyJ') === 0) {
                // Try to decrypt the value - it's encrypted from database
                return Crypt::decryptString($rawValue);
            } else {
                // It's plain text, return as-is
                return $rawValue;
            }
        } catch (\Throwable $e) {
            // If decryption fails, return empty string or placeholder
            // The MAC invalid error means the data was encrypted with different key
            // We can't recover it, so return a safe fallback
            return '[Data unavailable]';
        }
    }

    /**
     * Set the name (encrypt before storing).
     * Maps to obfuscated column: iop_nm
     */
    public function setNameAttribute($value)
    {
        if (!empty($value)) {
            try {
                $this->attributes['iop_nm'] = Crypt::encrypt($value);
            } catch (\Exception $e) {
                // If encryption fails, store as plain text
                $this->attributes['iop_nm'] = $value;
            }
        } else {
            $this->attributes['iop_nm'] = $value;
        }
    }

    /**
     * Get the email address (decrypt if encrypted).
     * Maps to obfuscated column: klj_em
     */
    public function getEmailAttribute()
    {
        // Get from obfuscated column directly
        if (!isset($this->attributes['klj_em'])) {
            return null;
        }
        
        $rawValue = $this->attributes['klj_em'];
        
        if (empty($rawValue)) {
            return $rawValue;
        }

        try {
            // Check if it looks like encrypted data (starts with eyJ which is base64 for {)
            if (strpos($rawValue, 'eyJ') === 0) {
                // Try to decrypt the value - it's encrypted from database
                return Crypt::decryptString($rawValue);
            } else {
                // It's plain text, return as-is
                return $rawValue;
            }
        } catch (\Throwable $e) {
            // If decryption fails, return empty string or placeholder
            // The MAC invalid error means the data was encrypted with different key
            // We can't recover it, so return a safe fallback
            return '[Email unavailable]';
        }
    }

    /**
     * Set the email address (encrypt before storing).
     * Maps to obfuscated column: klj_em
     */
    public function setEmailAttribute($value)
    {
        if (!empty($value) && filter_var($value, FILTER_VALIDATE_EMAIL)) {
            try {
                $this->attributes['klj_em'] = Crypt::encrypt($value);
            } catch (\Exception $e) {
                // If encryption fails, store as plain text
                $this->attributes['klj_em'] = $value;
            }
        } else {
            $this->attributes['klj_em'] = $value;
        }
    }

    /**
     * Get the phone number (decrypt if encrypted).
     * Maps to obfuscated column: qaz_ph
     */
    public function getPhoneAttribute()
    {
        // Get from obfuscated column directly
        if (!isset($this->attributes['qaz_ph'])) {
            return null;
        }
        
        $rawValue = $this->attributes['qaz_ph'];
        
        if (empty($rawValue)) {
            return $rawValue;
        }

        try {
            // Check if it looks like encrypted data (starts with eyJ which is base64 for {)
            if (strpos($rawValue, 'eyJ') === 0) {
                // Try to decrypt the value - it's encrypted from database
                return Crypt::decryptString($rawValue);
            } else {
                // It's plain text, return as-is
                return $rawValue;
            }
        } catch (\Throwable $e) {
            // If decryption fails, return empty string or placeholder
            // The MAC invalid error means the data was encrypted with different key
            // We can't recover it, so return a safe fallback
            return '[Phone unavailable]';
        }
    }

    /**
     * Set the phone number (encrypt before storing).
     * Maps to obfuscated column: qaz_ph
     */
    public function setPhoneAttribute($value)
    {
        if (!empty($value)) {
            try {
                $this->attributes['qaz_ph'] = Crypt::encrypt($value);
            } catch (\Exception $e) {
                // If encryption fails, store as plain text
                $this->attributes['qaz_ph'] = $value;
            }
        } else {
            $this->attributes['qaz_ph'] = $value;
        }
    }

    /**
     * Get the address (decrypt if encrypted).
     * Maps to obfuscated column: wsx_ad
     */
    public function getAddressAttribute()
    {
        // Get from obfuscated column directly
        if (!isset($this->attributes['wsx_ad'])) {
            return null;
        }
        
        $rawValue = $this->attributes['wsx_ad'];
        
        if (empty($rawValue)) {
            return $rawValue;
        }

        try {
            // Check if it looks like encrypted data (starts with eyJ which is base64 for {)
            if (strpos($rawValue, 'eyJ') === 0) {
                // Try to decrypt the value - it's encrypted from database
                return Crypt::decryptString($rawValue);
            } else {
                // It's plain text, return as-is
                return $rawValue;
            }
        } catch (\Throwable $e) {
            // If decryption fails, return empty string or placeholder
            // The MAC invalid error means the data was encrypted with different key
            // We can't recover it, so return a safe fallback
            return '[Address unavailable]';
        }
    }

    /**
     * Set the address (encrypt before storing).
     * Maps to obfuscated column: wsx_ad
     */
    public function setAddressAttribute($value)
    {
        if (!empty($value)) {
            try {
                $this->attributes['wsx_ad'] = Crypt::encrypt($value);
            } catch (\Exception $e) {
                // If encryption fails, store as plain text
                $this->attributes['wsx_ad'] = $value;
            }
        } else {
            $this->attributes['wsx_ad'] = $value;
        }
    }

    /**
     * Find a customer by email (handles both encrypted and plain emails)
     */
    public static function findByEmail($email)
    {
        // First try to find by plain email (for backward compatibility)
        $customers = static::all();
        foreach ($customers as $customer) {
            try {
                // Compare with decrypted email
                if ($customer->email === $email) {
                    return $customer;
                }
            } catch (\Exception $e) {
                // Continue to next customer if comparison fails
                continue;
            }
        }
        
        return null;
    }

    /**
     * Find a customer by name (handles both encrypted and plain names)
     */
    public static function findByName($name)
    {
        $customers = static::all();
        foreach ($customers as $customer) {
            try {
                // Compare with decrypted name
                if ($customer->name === $name) {
                    return $customer;
                }
            } catch (\Exception $e) {
                // Continue to next customer if comparison fails
                continue;
            }
        }
        
        return null;
    }

    /**
     * Find a customer by phone number (handles both encrypted and plain phone numbers)
     */
    public static function findByPhone($phone)
    {
        $customers = static::all();
        foreach ($customers as $customer) {
            try {
                // Compare with decrypted phone
                if ($customer->phone === $phone) {
                    return $customer;
                }
            } catch (\Exception $e) {
                // Continue to next customer if comparison fails
                continue;
            }
        }
        
        return null;
    }

    /**
     * Relations
     
    *public function contactMessages()
    *{
    *    return $this->hasMany(ContactMessage::class, 'yhn_cid', 'k2_id');  
    *}
    */
    public function chatConversations()
    {    
        return $this->hasMany(
            ChatConversation::class,
            'z1_cid', // foreign key on chat_conversations
            'k2_id'   // primary key on customers
        );
    }

    public function getMessageHistory()
    {
        return $this->contactMessages()
            ->orderBy('edc_ca', 'desc')
            ->get()
            ->groupBy('category');
    }

    public function getMessageStatusesByCategory()
    {
        return $this->contactMessages()
            ->get()
            ->groupBy('category')
            ->map(function ($messages) {
                $latest = $messages->first();
                return [
                    'status' => $latest->status,
                    'last_update' => $latest->last_update_time,
                    'count' => $messages->count()
                ];
            });
    }

    /**
     * Get customer's total contact messages count
     */
    public function getTotalMessagesAttribute()
    {
        return $this->contactMessages()->count();
    }

    /**
     * Get customer's total chat conversations count
     */
    public function getTotalConversationsAttribute()
    {
        return $this->chatConversations()->count();
    }

    /**
     * Get customer's latest activity
     */
    public function getLatestActivityAttribute()
    {
        $latestMessage = $this->contactMessages()->orderBy('zxc_ca', 'desc')->first();
        $latestConversation = $this->chatConversations()->latest()->first();
        
        if ($latestMessage && $latestConversation) {
            return $latestMessage->edc_ca->gt($latestConversation->edc_ca) 
                ? $latestMessage->edc_ca 
                : $latestConversation->edc_ca;
        } elseif ($latestMessage) {
            return $latestMessage->edc_ca;
        } elseif ($latestConversation) {
            return $latestConversation->edc_ca;
        }
        
        return $this->edc_ca;
    }

    /**
     * Check if customer has unread messages
     */
    public function hasUnreadMessages()
    {
        return $this->contactMessages()->where('rty_ir', false)->exists() ||
               $this->chatConversations()->whereHas('messages', function($q) {
                   $q->where('vgt_st', 'customer')->where('wsx_ir', false);
               })->exists();
    }

    /**
     * Get all contact messages belonging to this customer.
     */
    public function contactMessages(): HasMany
    {
        return $this->hasMany(
            ContactMessage::class,
            'yhn_cid', // foreign key in contact_messages table
            'k2_id'    // primary key in customers table
        );
    }

    public function getIopNmAttribute($value)
    {
        try {
            return Crypt::decryptString($value);
        } catch (\Throwable $e) {
            return $value;
        }
    }

    public function getKljEmAttribute($value)
    {
        try {
            return Crypt::decryptString($value);
        } catch (\Throwable $e) {
            return $value;
        }
    }

 
} 
