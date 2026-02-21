<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Support\Facades\Crypt;
use App\Traits\EncryptHelperTrait;

class ContactMessage extends Model
{
    use HasFactory, EncryptHelperTrait;

    // Obfuscated table name
    protected $table = 'tgb_5y4v';
    protected $primaryKey = 'k3_id';
    public $incrementing = true;
    protected $keyType = 'int';
    
    const CREATED_AT = 'zxc_ca';
    const UPDATED_AT = 'vbn_ua';

    // Status Constants
    const STATUS_NEW = 'new';
    const STATUS_IN_PROGRESS = 'in_progress';
    const STATUS_RESOLVED = 'resolved';
    const STATUS_CLOSED = 'closed';

    // Category Constants
    const CATEGORY_WARRANTY = 'warranty';
    const CATEGORY_INSTALLATION = 'installation';
    const CATEGORY_SUPPORT = 'support';
    const CATEGORY_GENERAL = 'general';   

    protected array $encryptableFields = [
        'olp_ct', // content
        //'ikm_ck', // category / subject
    ];


    protected $fillable = [
        'yhn_cid',      // customer_id
        'ujm_aid',      // admin_id
        'ikm_ck',       // content_key
        'olp_ct',       // content
        'pkm_st',       // status
        'qwe_cat',      // category
        'rty_ir',       // is_read
        'uio_ii',       // is_important
        'asd_id',       // is_deleted
        'fgh_da',       // deleted_at
        'jkl_lut'       // last_update_time
    ];

    protected $casts = [
        'rty_ir' => 'boolean',      // is_read
        'uio_ii' => 'boolean',      // is_important
        'asd_id' => 'boolean',      // is_deleted
        'fgh_da' => 'datetime',    // deleted_at
        'jkl_lut' => 'datetime',   // last_update_time
        'zxc_ca' => 'datetime',    // created_at
        'vbn_ua' => 'datetime',    // updated_at
    ];

    /*
    protected static function booted() {
        static::creating(function ($model) {
            if (empty($model->ikm_ck)) { // content_key
                $model->ikm_ck = "default";
            }
        });
    } */

    protected static function booted()
    {
        static::creating(function ($message) {
            $message->encryptSensitiveData(); // ✅ FIX
        });

        static::updating(function ($message) {
            $message->encryptSensitiveData(); // ✅ FIX
        });
    }

    public function customer(): BelongsTo
    {
        return $this->belongsTo(Customer::class, 'yhn_cid', 'k2_id'); // customer_id
    }

    public function assignedAdmin(): BelongsTo
    {
        return $this->belongsTo(Admin::class, 'ujm_aid', 'k1_id'); // admin_id
    }

    /**
     * Get the responses for this message.
     */
    public function responses(): HasMany
    {
        return $this->hasMany(MessageResponse::class, 'bgt_cmid')->orderBy('xsw_ca', 'asc'); // contact_message_id, created_at
    }

    public function isUnassigned()
    {
        return is_null($this->ujm_aid); // admin_id
    }

    /**
     * Accessors for backward compatibility - map to obfuscated columns
     */
    public function getIsReadAttribute($value)
    {
        return $this->attributes['rty_ir'] ?? $value; // is_read
    }

    public function setIsReadAttribute($value)
    {
        $this->attributes['rty_ir'] = $value; // is_read
    }

    public function getStatusAttribute($value)
    {
        return $this->attributes['pkm_st'] ?? $value; // status
    }

    public function setStatusAttribute($value)
    {
        $this->attributes['pkm_st'] = $value; // status
    }

    public function getCategoryAttribute($value)
    {
        return $this->attributes['qwe_cat'] ?? $value; // category
    }

    public function setCategoryAttribute($value)
    {
        $this->attributes['qwe_cat'] = $value; // category
    }

    public function getAdminIdAttribute($value)
    {
        return $this->attributes['ujm_aid'] ?? $value; // admin_id
    }

    public function setAdminIdAttribute($value)
    {
        $this->attributes['ujm_aid'] = $value; // admin_id
    }

    public function getCustomerIdAttribute($value)
    {
        return $this->attributes['yhn_cid'] ?? $value; // customer_id
    }

    public function setCustomerIdAttribute($value)
    {
        $this->attributes['yhn_cid'] = $value; // customer_id
    }

    public function getContentAttribute($value)
    {
        $rawValue = $this->attributes['olp_ct'] ?? $value; // content
        
        if (empty($rawValue)) {
            return $rawValue;
        }

        try {
            // Try to decrypt the value
            $decrypted = Crypt::decryptString($rawValue);
            if (is_string($decrypted) && strlen(trim($decrypted)) > 0) {
                return $decrypted;
            }
        } catch (\Exception $e) {
            // If decryption fails, check if it's already plain text
            if (is_string($rawValue) && strlen(trim($rawValue)) > 0) {
                return $rawValue;
            }
        }
        
        return $rawValue;
    }

    public function setContentAttribute($value)
    {
        if (!empty($value)) {
            try {
                $this->attributes['olp_ct'] = Crypt::encrypt($value);
            } catch (\Exception $e) {
                $this->attributes['olp_ct'] = $value;
            }
        } else {
            $this->attributes['olp_ct'] = $value;
        }
    }

    public function getContentKeyAttribute($value)
    {
        return $this->attributes['ikm_ck'] ?? $value; // content_key
    }

    public function setContentKeyAttribute($value)
    {
        $this->attributes['ikm_ck'] = $value; // content_key
    }

    public function getStatus()
    {
        return $this->pkm_st; // status
    }

    public function getCategory()
    {
        return $this->qwe_cat; // category
    }

    public function getStatusBadgeClass()
    {
        $status = $this->pkm_st; // status
        return match($status) {
            self::STATUS_NEW => 'bg-primary',
            self::STATUS_IN_PROGRESS => 'bg-warning',
            self::STATUS_RESOLVED => 'bg-success',
            self::STATUS_CLOSED => 'bg-secondary',
            default => 'bg-info'
        };
    }

    public function getCategoryBadgeClass()
    {
        $category = $this->qwe_cat; // category
        return match($category) {
            self::CATEGORY_WARRANTY => 'bg-info',
            self::CATEGORY_INSTALLATION => 'bg-warning',
            self::CATEGORY_SUPPORT => 'bg-primary',
            self::CATEGORY_GENERAL => 'bg-secondary',
            default => 'bg-info'
        };
    }

    /**
     * Get user-friendly category display name
     */
    public function getCategoryDisplayName()
    {
        $category = $this->qwe_cat; // category
        return match($category) {
            self::CATEGORY_WARRANTY => 'Warranty',
            self::CATEGORY_INSTALLATION => 'Installation',
            self::CATEGORY_SUPPORT => 'Support',
            self::CATEGORY_GENERAL => 'General',
            default => ucfirst($category)
        };
    }

    public function markAsRead()
    {
        $this->rty_ir = true; // is_read
        $this->save();
    }

    public function markAsUnread()
    {
        $this->rty_ir = false; // is_read
        $this->save();
    }

    public function scopeUnread($query)
    {
        return $query->where('rty_ir', false); // is_read
    }

    public function markAsImportant()
    {
        $this->uio_ii = true; // is_important
        $this->save();
    }

    public function markAsUnimportant()
    {
        $this->uio_ii = false; // is_important
        $this->save();
    }

    public function toggleImportant()
    {
        $this->uio_ii = !$this->uio_ii; // is_important
        $this->save();
        return $this->uio_ii;
    }

    public function moveToTrash()
    {
        $this->asd_id = true; // is_deleted
        $this->fgh_da = now(); // deleted_at
        $this->save();
    }

    public function restoreFromTrash()
    {
        $this->asd_id = false; // is_deleted
        $this->fgh_da = null; // deleted_at
        $this->save();
    }

    public function scopeImportant($query)
    {
        return $query->where('uio_ii', true); // is_important
    }

    public function scopeNotDeleted($query)
    {
        return $query->where('asd_id', false); // is_deleted
    }

    public function scopeTrashed($query)
    {
        return $query->where('asd_id', true); // is_deleted
    }

    public function contactMessages(): HasMany
    {
        return $this->hasMany(
            ContactMessage::class,
            'yhn_cid', // foreign key on contact_messages table
            'k2_id'    // primary key on customers table
        );
    }
}  