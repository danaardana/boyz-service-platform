<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
class Session extends Model
{
    protected $table = 'qwe_9k2p';
    protected $primaryKey = 'k6_id';

    public $timestamps = false;

    protected $fillable = [
        'tyu_uid', // user_id
        'rty_ip',  // ip_address (encrypted)
        'wsx_ua',  // user_agent (encrypted)
        'vbn_pl',  // payload (encrypted)
        'qwe_la',  // last_activity
        'uio_lo',  // logout_at (encrypted)
    ];

    protected $casts = [
        'qwe_la' => 'integer',
        'uio_lo' => 'datetime',
    ];

    /**
     * Create a new admin login session record
     */
    public static function logAdminLogin($admin, $request)
    {
        // Ensure admin data is properly decrypted before storing in session
        $decryptedEmail = $admin->email; // This will use the model's decryption accessor
        $decryptedName = $admin->name;   // This will use the model's decryption accessor
        
        $sessionData = [
            'k6_id' => session()->getId(),
            'tyu_uid' => $admin->k1_id,
            'rty_ip' => $request->ip(),
            'wsx_ua' => $request->userAgent(),
            'vbn_pl' => base64_encode(serialize([
                'admin_id' => $admin->k1_id,
                'admin_email' => $decryptedEmail,
                'admin_name' => $decryptedName,
                'login_time' => now()->toDateTimeString(),
                'guard' => 'admin',
                '_token' => session()->token(),
                '_flash' => []
            ])),
            'qwe_la' => now()->timestamp
        ];

        return self::updateOrCreate(
            ['k6_id' => $sessionData['k6_id']],
            $sessionData
        );
    }

    /**
     * Get admin login history with proper admin data
     */
    public static function getAdminLoginHistory($adminId = null, $limit = 50)
    {
        $query = DB::table('qwe_9k2p as s')
            ->whereNotNull('s.tyu_uid')
            ->whereNotNull('s.rty_ip')
            ->select([
                's.k6_id as session_id',
                's.tyu_uid as admin_id',
                's.rty_ip as ip_address',
                's.wsx_ua as user_agent',
                's.qwe_la as last_activity',
                's.vbn_pl as payload'
            ])
            ->orderBy('s.qwe_la', 'desc');

        if ($adminId) {
            $query->where('s.tyu_uid', $adminId);
        }

        $sessions = $query->limit($limit)->get();
        
        // Get all unique admin IDs from sessions
        $adminIds = $sessions->pluck('admin_id')->unique()->filter();
        
        // Fetch admin data properly using Admin model (which handles decryption)
        $admins = \App\Models\Admin::whereIn('k1_id', $adminIds)->get()->keyBy('k1_id');

        return $sessions->map(function ($session) use ($admins) {
            // Try to get login time from payload
            $loginTime = null;
            if ($session->payload) {
                try {
                    $payload = @unserialize(base64_decode($session->payload));
                    $loginTime = $payload['login_time'] ?? null;
                } catch (\Exception $e) {
                    // If payload decoding fails, use last_activity as fallback
                    $loginTime = date('Y-m-d H:i:s', $session->last_activity);
                }
            }
            
            // Get admin data (properly decrypted through model)
            $admin = $admins->get($session->admin_id);
            $adminName = $admin ? $admin->name : 'Unknown Admin';
            $adminEmail = $admin ? $admin->email : 'Unknown';
            
            return [
                'session_id' => $session->session_id,
                'admin_id' => $session->admin_id,
                'admin_email' => $adminEmail,
                'admin_name' => $adminName,
                'ip_address' => $session->ip_address,
                'user_agent' => $session->user_agent,
                'login_time' => $loginTime ?: date('Y-m-d H:i:s', $session->last_activity),
                'last_activity' => date('Y-m-d H:i:s', $session->last_activity),
                'browser' => self::parseBrowser($session->user_agent),
                'platform' => self::parsePlatform($session->user_agent)
            ];
        });
    }

    /**
     * Get current admin's sessions
     */
    public static function getCurrentAdminSessions()
    {
        if (!Auth::guard('admin')->check()) {
            return collect();
        }

        return self::getAdminLoginHistory(Auth::guard('admin')->id());
    }

    /**
     * Parse browser from user agent
     */
    private static function parseBrowser($userAgent)
    {
        if (str_contains($userAgent, 'Chrome')) return 'Chrome';
        if (str_contains($userAgent, 'Firefox')) return 'Firefox';
        if (str_contains($userAgent, 'Safari')) return 'Safari';
        if (str_contains($userAgent, 'Edge')) return 'Edge';
        if (str_contains($userAgent, 'Opera')) return 'Opera';
        
        return 'Unknown';
    }

    /**
     * Parse platform from user agent
     */
    private static function parsePlatform($userAgent)
    {
        if (str_contains($userAgent, 'Windows')) return 'Windows';
        if (str_contains($userAgent, 'Mac')) return 'Mac';
        if (str_contains($userAgent, 'Linux')) return 'Linux';
        if (str_contains($userAgent, 'Android')) return 'Android';
        if (str_contains($userAgent, 'iOS')) return 'iOS';
        
        return 'Unknown';
    }

    /**
     * Clean old sessions (older than 30 days)
     */
    public static function cleanOldSessions()
    {
        $thirtyDaysAgo = now()->subDays(30)->timestamp;
        
        return self::where('qwe_la', '<', $thirtyDaysAgo)->delete();
    }

    /**
     * Get session statistics
     */
    public static function getSessionStats()
    {
        $sessions = self::getAdminLoginHistory(null, 500); // Get more data for stats
        
        return [
            'total_sessions' => $sessions->count(),
            'unique_admins' => $sessions->pluck('admin_id')->unique()->count(),
            'browsers' => $sessions->groupBy('browser')->map->count(),
            'platforms' => $sessions->groupBy('platform')->map->count(),
            'recent_logins' => $sessions->take(10)
        ];
    }

    /**
     * Logout and clean session
     */
    public static function logAdminLogout($sessionId = null)
    {
        $sessionId = $sessionId ?? session()->getId();
        
        return self::where('k6_id', $sessionId)->delete();
    }

    public static function detectAbnormalLogin($admin)
    {
        $lastSession = self::where('tyu_uid', $admin->k1_id)
            ->whereNull('asd_lo')
            ->latest('qwe_la')
            ->first();

        if ($lastSession) {
            Notification::create([
                'tya_tp'  => 'system',
                'uio_tt'  => 'Abnormal Login',
                'asd_msg' => 'Previous login did not end with logout.',

                'fgh_ic'  => 'mdi mdi-shield-alert',
                'jkl_cl'  => 'warning',

                'wer_uid' => $admin->k1_id,
                'plm_ut'  => 'admin',
                'sdf_un'  => $admin->name,
                'hjk_ue'  => $admin->email,
                'zxc_at'  => 'auth',

                'lop_md' => [
                'bnm_ua' => $lastSession->last_activity,
                ],
            ]);
        }
    }

}
