<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class MessageResponse extends Model
{
    // Obfuscated table name
    protected $table = 'nhy_3m2k';
    protected $primaryKey = 'k4_id';
    public $incrementing = true;
    protected $keyType = 'int';
    const CREATED_AT = 'xsw_ca';
    
    // Only use created_at timestamp, disable updated_at
    const UPDATED_AT = null;
    
    protected $fillable = [
        'bgt_cmid',     // contact_message_id
        'vfr_aid',      // admin_id
        'cde_msg',      // message
    ];

    protected $casts = [
        'xsw_ca' => 'datetime',    // created_at
    ];

    /**
     * Get the contact message that owns the response.
     
    *public function contactMessage(): BelongsTo
    *{
    *    return $this->belongsTo(ContactMessage::class, 'bgt_cmid', 'k3_id'); // contact_message_id 
    *}
    */

    /**
     * Get the admin who created the response.
     */
    public function admin(): BelongsTo
    {
        return $this->belongsTo(Admin::class, 'vfr_aid', 'k1_id'); // admin_id
    }
}
