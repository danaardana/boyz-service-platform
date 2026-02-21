<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Support\Arr;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use Carbon\Carbon;

class Notification extends Model
{
    use HasFactory;

    protected $table = 'pqr_8x3m'; // Obfuscated admin notifications table
    protected $primaryKey = 'k5_id'; // Obfuscated primary key
    const CREATED_AT = 'ujm_ca';
    const UPDATED_AT = 'bnm_ua';

    protected $fillable = [
        'tya_tp',
        'uio_tt',
        'asd_msg',
        'fgh_ic',
        'jkl_cl',
        'zxc_at',
        'vbn_aid',
        'nmq_am',
        'wer_uid',
        'plm_ut',
        'sdf_un',
        'hjk_ue',
        'lop_md',
        'kiu_ir',
        'yhn_ra'
    ];

    protected $casts = [
        'lop_md' => 'array',
        'kiu_ir' => 'boolean',
        'yhn_ra' => 'datetime',
        'ujm_ca' => 'datetime',
        'bnm_ua' => 'datetime'
    ];

    // Scopes
    public function scopeUnread($query)
    {
        return $query->where('kiu_ir', false);
    }

    public function scopeRead($query)
    {
        return $query->where('kiu_ir', true);
    }

    public function scopeRecent($query, $limit = 10)
    {
        return $query->orderBy('ujm_ca', 'desc')->limit($limit);
    }

    public function scopeByType($query, $type)
    {
        return $query->where('tya_tp', $type);
    }

    public function scopeByActionType($query, $actionType)
    {
        return $query->where('zxc_at', $actionType);
    }

    public function scopeByUserType($query, $userType)
    {
        return $query->where('plm_ut', $userType);
    }

    // Mutators & Accessors
    public function getIdAttribute()
    {
        return $this->k5_id;
    }

    public function getTypeAttribute()
    {
        return $this->tya_tp;
    }

    public function setTypeAttribute($value)
    {
        $this->tya_tp = $value;
    }

    public function getTitleAttribute()
    {
        return $this->uio_tt;
    }

    public function setTitleAttribute($value)
    {
        $this->uio_tt = $value;
    }

    public function getMessageAttribute()
    {
        return $this->asd_msg;
    }

    public function setMessageAttribute($value)
    {
        $this->asd_msg = $value;
    }

    public function getIconAttribute()
    {
        return $this->fgh_ic;
    }

    public function setIconAttribute($value)
    {
        $this->fgh_ic = $value;
    }

    public function getColorAttribute()
    {
        return $this->jkl_cl;
    }

    public function setColorAttribute($value)
    {
        $this->jkl_cl = $value;
    }

    public function getActionTypeAttribute()
    {
        return $this->zxc_at;
    }

    public function setActionTypeAttribute($value)
    {
        $this->zxc_at = $value;
    }

    public function getActionIdAttribute()
    {
        return $this->vbn_aid;
    }

    public function setActionIdAttribute($value)
    {
        $this->vbn_aid = $value;
    }

    public function getActionModelAttribute()
    {
        return $this->nmq_am;
    }

    public function setActionModelAttribute($value)
    {
        $this->nmq_am = $value;
    }

    public function getUserIdAttribute()
    {
        return $this->wer_uid;
    }

    public function setUserIdAttribute($value)
    {
        $this->wer_uid = $value;
    }

    public function getUserTypeAttribute()
    {
        return $this->plm_ut;
    }

    public function setUserTypeAttribute($value)
    {
        $this->plm_ut = $value;
    }

    public function getUserNameAttribute()
    {
        return $this->sdf_un;
    }

    public function setUserNameAttribute($value)
    {
        $this->sdf_un = $value;
    }

    public function getUserEmailAttribute()
    {
        return $this->hjk_ue;
    }

    public function setUserEmailAttribute($value)
    {
        $this->hjk_ue = $value;
    }

    public function getMetadataAttribute()
    {
        return $this->lop_md;
    }

    public function setMetadataAttribute($value)
    {    
        // array → convert to JSON string
        if (is_array($value)) {
            $this->lop_md = json_encode($value, JSON_UNESCAPED_UNICODE);
            return;
        }

        // if it string (json / encrypted / plain)
        $this->lop_md = $value;
    }

    public function getIsReadAttribute()
    {
        return $this->kiu_ir;
    }

    public function setIsReadAttribute($value)
    {
        $this->kiu_ir = $value;
    }

    public function getReadAtAttribute()
    {
        return $this->yhn_ra;
    }

    public function setReadAtAttribute($value)
    {
        $this->yhn_ra = $value;
    }

    public function getCreatedAtAttribute()
    {
        return $this->ujm_ca;
    }

    public function getUpdatedAtAttribute()
    {
        return $this->bnm_ua;
    }

    public function getTimeAgoAttribute()
    {
        return optional($this->ujm_ca)->diffForHumans();
    }

    public function getFormattedDateAttribute()
    {
        return $this->ujm_ca->format('M d, Y H:i');
    }

    // Methods
    public function markAsRead()
    {
        $this->update([
            'kiu_ir' => true,
            'yhn_ra' => now()
        ]);
    }

    public function markAsUnread()
    {
        $this->update([
            'kiu_ir' => false,
            'yhn_ra' => null
        ]);
    }


    // Static helper methods
    public static function createNotification(array $data)
    {
        return self::create([
            'tya_tp' => $data['type'],
            'uio_tt' => $data['title'],
            'asd_msg' => $data['message'],
            'fgh_ic' => $data['icon'] ?? self::getDefaultIcon($data['type']),
            'jkl_cl' => $data['color'] ?? self::getDefaultColor($data['type']),
            'zxc_at' => $data['action_type'] ?? 'general',
            'vbn_aid' => $data['action_id'] ?? null,
            'nmq_am' => $data['action_model'] ?? null,
            'wer_uid' => $data['user_id'] ?? null,
            'plm_ut' => $data['user_type'] ?? 'system',
            'sdf_un' => $data['user_name'] ?? 'System',
            'hjk_ue' => $data['user_email'] ?? null,
            'lop_md' => $data['metadata'] ?? null,
        ]);
    }

    private static function getDefaultIcon($type)
    {
        $icons = [
            'create' => 'bx bx-plus-circle',
            'update' => 'bx bx-edit-alt',
            'delete' => 'bx bx-trash',
            'login' => 'bx bx-log-in',
            'logout' => 'bx bx-log-out',
            'upload' => 'bx bx-upload',
            'download' => 'bx bx-download',
            'view' => 'bx bx-show',
            'system' => 'bx bx-cog',
            'error' => 'bx bx-error',
            'warning' => 'bx bx-error-circle',
            'success' => 'bx bx-check-circle',
            'info' => 'bx bx-info-circle',
        ];

        return $icons[$type] ?? 'bx bx-bell';
    }

    private static function getDefaultColor($type)
    {
        $colors = [
            'create' => 'success',
            'update' => 'warning',
            'delete' => 'danger',
            'login' => 'info',
            'logout' => 'secondary',
            'upload' => 'primary',
            'download' => 'info',
            'view' => 'primary',
            'system' => 'dark',
            'error' => 'danger',
            'warning' => 'warning',
            'success' => 'success',
            'info' => 'info',
        ];

        return $colors[$type] ?? 'primary';
    }

    public static function markAllAsRead()
    {
        return self::unread()->update([
            'kiu_ir' => true,
            'yhn_ra' => now()
        ]);
    }

    public static function getUnreadCount()
    {
        return self::unread()->count();
    }

    public static function getRecentNotifications($limit = 10)
    {
        return self::recent($limit)->get();
    }

    /**
     * ACCESS LOGS
     * For owner: show ALL raw data
     */
    public static function getAccessLogs()
    {
        return self::query()
            ->orderByDesc('ujm_ca')
            ->get()
            ->filter(function ($row) {

                // type TIDAK terenkripsi
                $type = strtolower($row->type ?? '');

                // hanya access event
                return in_array($type, ['login', 'logout'], true);
            })
            ->map(function ($row) {

                $meta = $row->metadata ?? [];

                $ua = $meta['user_agent'] ?? '';
                $browser = self::detectBrowser($ua);
                $os = self::detectOS($ua);

                return (object) [
                    'id'         => $row->k5_id,
                    'event'      => ucfirst($row->type), // Login / Logout
                    'type'       => $row->type,
                    'color'      => $row->color,
                    'icon'       => $row->icon,
                    'user_name'  => $row->user_name,
                    'user_email' => $row->user_email,
                    'ip_address' => $meta['ip_address'] ?? '-',
                    'browser'    => $browser,
                    'os'         => $os,
                    'created_at' => $row->created_at,
                    'updated_at' => $row->updated_at,
                ];
            })
            ->values();
    }

    protected static function detectBrowser(string $ua): string
    {
        return match (true) {
            str_contains($ua, 'Chrome')   => 'Chrome',
            str_contains($ua, 'Firefox')  => 'Firefox',
            str_contains($ua, 'Safari') && !str_contains($ua, 'Chrome') => 'Safari',
            str_contains($ua, 'Edge')     => 'Edge',
            default                       => 'Unknown',
        };
    }

    protected static function detectOS(string $ua): string
    {
        return match (true) {
            str_contains($ua, 'Windows NT') => 'Windows',
            str_contains($ua, 'Mac OS X')   => 'MacOS',
            str_contains($ua, 'Linux')      => 'Linux',
            str_contains($ua, 'Android')    => 'Android',
            str_contains($ua, 'iPhone')     => 'iOS',
            default                         => 'Unknown',
        };
    }


    /**
     * ACTIVITY LOGS (optional, future)
     */
    public static function getActivityLogs()
    {
        return self::query()
            ->orderByDesc('ujm_ca')
            ->get()
            ->filter(function ($row) {

                $type = strtolower($row->type ?? '');

                // EXCLUDE access logs
                return !in_array($type, ['login', 'logout'], true);
            })
            ->map(function ($row) {

                return (object) [
                    'id'         => $row->k5_id,
                    'type'       => ucfirst($row->type),
                    'icon'       => $row->icon,
                    'color'      => $row->color,
                    'user_type'  => $row->user_type,
                    'user_name'  => $row->user_name,
                    'user_email' => $row->user_email,
                    'message'    => $row->message,
                    'created_at' => $row->created_at,
                ];
            })
            ->values();
    }

    public function getResponseTimeAttribute(): ?string
    {
        $meta = $this->metadata;
        if (!$meta) return null;

        return $meta['response_time'] ?? null;
    }

    public function getSourceAttribute(): string
    {
        return match ($this->action_type) {
            'create', 'update', 'delete' => 'System',
            'login', 'logout' => 'Auth',
            default => 'API',
        };
    }

    public static function logLoginFailure(array $request)
    {
        return self::create([
            'tya_tp'  => 'login_failure',
            'uio_tt'  => 'Login Failed',
            'asd_msg' => 'Invalid email or password',
            'fgh_ic'  => 'bx bx-log-in-circle',
            'jkl_cl'  => 'danger',
            'zxc_at'  => 'login',
            'wer_uid' => null,
            'plm_ut'  => 'admin',
            'lop_md'  => json_encode([
                'email'      => $request['email'] ?? null,
                'ip'         => $request['ip'] ?? null,
                'user_agent' => $request['user_agent'] ?? null,
                'timestamp' => now()->toISOString(),
            ]),
            'kiu_ir' => 0,
        ]);
    }

    public static function logSessionExpired($session)
    {
        return self::create([
            'tya_tp'  => 'session_expired',
            'uio_tt'  => 'Session Expired',
            'asd_msg' => 'Admin session ended without logout',
            'fgh_ic'  => 'mdi mdi-timer-off',
            'jkl_cl'  => 'warning',
            'zxc_at'  => 'security',
            'wer_uid' => $session->admin_id,
            'plm_ut'  => 'admin',
            'lop_md'  => json_encode([
                'ip_address'=> $session->ip_address,
                'user_agent'=> $session->user_agent,
                'login_at'  => $session->created_at,
                'expired_at'=> now(),
            ]),
            'kiu_ir' => 0,
        ]);
    }



}
