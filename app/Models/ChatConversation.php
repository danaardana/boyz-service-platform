<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

class ChatConversation extends Model
{
    use HasFactory;

    // Status Constants
    const STATUS_ACTIVE = 'active';
    const STATUS_RESOLVED = 'resolved';
    const STATUS_CLOSED = 'closed';

    // Priority Constants
    const PRIORITY_LOW = 'low';
    const PRIORITY_NORMAL = 'normal';
    const PRIORITY_HIGH = 'high';
    const PRIORITY_URGENT = 'urgent';

    protected $table = 'fgh_82lm'; // obfuscated table
protected $primaryKey = 'id'; 
public $incrementing = true;
protected $keyType = 'int';
protected $fillable = [
        'z1_cid', // customer_id
        'z1_aid', // admin_id
        'xcv_nm',  // customer_name
        'xcv_em',  // customer_email
        'sdw_st',  // status
        'sdw_pr',  // priority
        'cvb_iq',  // initial_question
        'brz_ha',  // has_predefined_answer
        'vbv_lm',  // last_message_at
        'ght_cr',  // customer_acknowledged_recording
        'nhy_sd',  // session_data
        'lkj_ra',  // resolved_at
        'dfg_rb'   // resolved_by
    ];

    protected $casts = [
        'brz_ha' => 'boolean', // has_predefined_answer
        'ght_cr' => 'boolean', // customer_acknowledged_recording
        'vbv_lm' => 'datetime', // last_message_at
        'nhy_sd' => 'array', // session_data
        'lkj_ra' => 'datetime', // resolved_at
        'created_at' => 'datetime',
        'updated_at' => 'datetime',
    ];

    /**
     * Get the customer associated with this conversation
     */
    public function customer(): BelongsTo
    {
        return $this->belongsTo(Customer::class, 'z1_cid','k2_id'); // customer_id obfuscated
    }

    /**
     * Get the admin assigned to this conversation
     */
    public function admin(): BelongsTo
    {
        return $this->belongsTo(Admin::class, 'z1_aid', 'k1_id'); // admin_id obfuscated
    }

    /**
     * Get all messages in this conversation
     */
    public function messages(): HasMany
    {
        return $this->hasMany(ChatMessage::class, 'mnb_cid')->orderBy('created_at', 'asc');
    }

    /**
     * Get the latest message in this conversation
     */
    public function latestMessage()
    {
        return $this->hasOne(ChatMessage::class, 'mnb_cid')->latest();
    }

    /**
     * Get unread messages count for admin
     */
    public function getUnreadMessagesCountAttribute()
    {
        return $this->messages()
            ->where('vgt_st', 'customer')
            ->where('wsx_ir', false)
            ->count();
    }

    /**
     * Mark all messages as read
     */
    public function markAllAsRead()
    {
        $this->messages()
            ->where('wsx_ir', false)
            ->update(['wsx_ir' => true]);
    }

    /**
     * Create or find customer if email is provided
     */
    public function createOrFindCustomer()
    {
        if ($this->customer_email) {
            $customer = Customer::firstOrCreate(
                ['email' => $this->customer_email],
                ['name' => $this->customer_name]
            );
            $this->update(['z1_cid' => $customer->k2_id]);
            return $customer;
        }
        return null;
    }

    /**
     * Add a system message to the conversation
     */
    public function addSystemMessage($content)
    {
        return $this->messages()->create([
            'vgt_st' => 'admin',
            'vgt_sid' => null,
            'lkj_mc' => $content,
            'mnb_mt' => 'system',
            'wsx_ir' => true
        ]);
    }

    /**
     * Scope for active conversations
     */
    public function scopeActive($query)
    {
        return $query->where('status', self::STATUS_ACTIVE);
    }

    /**
     * Scope for conversations with unread messages
     */
    public function scopeWithUnreadMessages($query)
    {
        return $query->whereHas('messages', function ($q) {
            $q->where('vgt_st', 'customer')
              ->where('wsx_ir', false);
        });
    }

    /**
     * Check if conversation has unread messages
     * Resolved/closed conversations should not show as unread
     */
    public function hasUnreadMessages()
    {
        // If conversation is resolved or closed, it shouldn't be considered as having unread messages
        if (in_array($this->status, [self::STATUS_RESOLVED, self::STATUS_CLOSED])) {
            return false;
        }
        
        return $this->messages()->where('vgt_st', ChatMessage::SENDER_CUSTOMER)
                                ->where('wsx_ir', false)
                                ->exists();
    }

    /**
     * Get count of unread messages
     * Resolved/closed conversations should not show unread count
     */
    public function unreadCount()
    {
        // If conversation is resolved or closed, return 0 unread count
        if (in_array($this->status, [self::STATUS_RESOLVED, self::STATUS_CLOSED])) {
            return 0;
        }
        
        return $this->messages()->where('vgt_st', ChatMessage::SENDER_CUSTOMER)
                                ->where('wsx_ir', false)
                                ->count();
    }
}
