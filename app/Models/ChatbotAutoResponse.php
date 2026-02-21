<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class ChatbotAutoResponse extends Model
{
    use HasFactory;

    protected $table = 'wer_72qp'; // obfuscated table
protected $primaryKey = 'id';
public $incrementing = true;
protected $keyType = 'int';
protected $fillable = [
        'tyu_kw', // keyword
        'rty_rs', // response
        'wsx_ia', // is_active
        'vbn_pr', // priority
        'qwe_ak', // additional_keywords
        'sdf_mt', // match_type
        'cde_cs', // case_sensitive
        'nhy_ds', // description
        'pol_cb', // created_by
        'ijn_ub', // updated_by
    ];

    protected $casts = [
        'qwe_ak' => 'array', // additional_keywords
        'wsx_ia' => 'boolean', // is_active
        'cde_cs' => 'boolean', // case_sensitive
        'vbn_pr' => 'integer', // priority
    ];

    /**
     * Get the admin who created this auto response
     */
    public function creator(): BelongsTo
    {
        return $this->belongsTo(Admin::class, 'pol_cb'); // created_by obfuscated
    }

    /**
     * Get the admin who last updated this auto response
     */
    public function updater(): BelongsTo
    {
        return $this->belongsTo(Admin::class, 'ijn_ub'); // updated_by obfuscated
    }

    /**
     * Scope for active auto responses
     */
    public function scopeActive($query)
    {
        return $query->where('is_active', true);
    }

    /**
     * Scope for ordering by priority
     */
    public function scopeByPriority($query)
    {
        return $query->orderBy('priority', 'desc')->orderBy('created_at', 'asc');
    }

    /**
     * Check if a message matches this auto response
     */
    public function matches($message): bool
    {
        if (!$this->is_active) {
            return false;
        }

        $keywords = array_merge([$this->keyword], $this->additional_keywords ?? []);
        
        foreach ($keywords as $keyword) {
            if ($this->matchesKeyword($message, $keyword)) {
                return true;
            }
        }

        return false;
    }

    /**
     * Check if a message matches a specific keyword
     */
    private function matchesKeyword($message, $keyword): bool
    {
        $messageToCheck = $this->case_sensitive ? $message : strtolower($message);
        $keywordToCheck = $this->case_sensitive ? $keyword : strtolower($keyword);

        switch ($this->match_type) {
            case 'exact':
                return $messageToCheck === $keywordToCheck;
            case 'starts_with':
                return str_starts_with($messageToCheck, $keywordToCheck);
            case 'ends_with':
                return str_ends_with($messageToCheck, $keywordToCheck);
            case 'contains':
            default:
                return str_contains($messageToCheck, $keywordToCheck);
        }
    }

    /**
     * Get all keywords as a formatted string
     */
    public function getAllKeywordsString(): string
    {
        $keywords = array_merge([$this->keyword], $this->additional_keywords ?? []);
        return implode(', ', $keywords);
    }

    /**
     * Static method to find matching auto response for a message
     */
    public static function findMatchingResponse($message): ?self
    {
        return static::active()
            ->byPriority()
            ->get()
            ->first(function ($autoResponse) use ($message) {
                return $autoResponse->matches($message);
            });
    }
}
