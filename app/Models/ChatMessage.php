<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class ChatMessage extends Model
{
    use HasFactory;

    // Sender Type Constants
    const SENDER_CUSTOMER = 'customer';
    const SENDER_ADMIN = 'admin';

    // Message Type Constants
    const TYPE_TEXT = 'text';
    const TYPE_IMAGE = 'image';
    const TYPE_FILE = 'file';
    const TYPE_SYSTEM = 'system';

    protected $table = 'jkl_23qw'; // obfuscated table
    protected $primaryKey = 'id';
    public $incrementing = true;
    protected $keyType = 'int';
    
    protected $fillable = [
        'mnb_cid', // conversation_id
        'vgt_st', // sender_type
        'vgt_sid', // sender_id
        'lkj_mc',  // message_content
        'mnb_mt',  // message_type
        'wsx_ir',  // is_read
        'qa2_md'   // metadata
    ];

    protected $casts = [
        'wsx_ir' => 'boolean', // is_read
        'qa2_md' => 'array', // metadata
        'created_at' => 'datetime',
        'updated_at' => 'datetime',
    ];

    /**
     * Get the conversation this message belongs to
     */
    public function conversation(): BelongsTo
    {
        return $this->belongsTo(ChatConversation::class, 'mnb_cid'); // conversation_id obfuscated
    }

    /**
     * Get the admin sender (if sender_type is admin)
     */
    public function admin(): BelongsTo
    {
        return $this->belongsTo(Admin::class, 'vgt_sid'); // sender_id obfuscated
    }

    /**
     * Check if message is from customer
     */
    public function isFromCustomer(): bool
    {
        return $this->sender_type === self::SENDER_CUSTOMER;
    }

    /**
     * Check if message is from admin
     */
    public function isFromAdmin(): bool
    {
        return $this->sender_type === self::SENDER_ADMIN;
    }

    /**
     * Check if message is a system message
     */
    public function isSystemMessage(): bool
    {
        return $this->message_type === self::TYPE_SYSTEM;
    }

    /**
     * Mark message as read
     */
    public function markAsRead()
    {
        if (!$this->is_read) {
            $this->update(['is_read' => true]);
        }
    }

    /**
     * Get formatted message content based on type
     */
    public function getFormattedContentAttribute()
    {
        switch ($this->message_type) {
            case self::TYPE_IMAGE:
                return $this->metadata['image_url'] ?? $this->message_content;
            case self::TYPE_FILE:
                return $this->metadata['file_name'] ?? $this->message_content;
            case self::TYPE_SYSTEM:
                return "🤖 " . $this->message_content;
            default:
                return $this->message_content;
        }
    }

    /**
     * Scope for unread messages
     */
    public function scopeUnread($query)
    {
        return $query->where('is_read', false);
    }

    /**
     * Scope for customer messages
     */
    public function scopeFromCustomer($query)
    {
        return $query->where('sender_type', self::SENDER_CUSTOMER);
    }

    /**
     * Scope for admin messages
     */
    public function scopeFromAdmin($query)
    {
        return $query->where('sender_type', self::SENDER_ADMIN);
    }
}
