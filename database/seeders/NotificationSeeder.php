<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Notification;
use Carbon\Carbon;

class NotificationDummySeeder extends Seeder
{
    public function run(): void
    {
        $start = Carbon::create(2025, 10, 1);
        $end   = Carbon::create(2026, 2, 5);

        $types = [
            'login_success',
            'login_failure',
            'system_database',
            'system_api',
            'system_queue',
            'warning',
            'info',
            'security',
        ];

        foreach (range(1, 250) as $i) {

            $date = Carbon::createFromTimestamp(
                rand($start->timestamp, $end->timestamp)
            );

            $type = $types[array_rand($types)];

            $data = match ($type) {

                'login_success' => [
                    'plm_ut' => 'admin',
                    'sdf_un' => 'AdminUser',
                    'hjk_ue' => 'admin@mail.com',
                    'tya_tp' => 'login',
                    'zxc_at' => 'success',
                    'jkl_cl' => 'success',
                    'fgh_ic' => 'bx bx-log-in',
                    'uio_tt' => 'Login Success',
                    'asd_msg'=> 'Admin logged in successfully',
                ],

                'login_failure' => [
                    'plm_ut' => 'system',
                    'sdf_un' => 'admin',
                    'tya_tp' => 'login_failure',
                    'zxc_at' => 'failure',
                    'jkl_cl' => 'warning',
                    'fgh_ic' => 'bx bx-user-x',
                    'uio_tt' => 'Login Failure',
                    'asd_msg'=> 'Failed login attempt detected',
                ],

                'system_database' => [
                    'plm_ut' => 'system',
                    'sdf_un' => 'System',
                    'tya_tp' => 'system',
                    'zxc_at' => 'database',
                    'jkl_cl' => 'danger',
                    'fgh_ic' => 'bx bx-data',
                    'uio_tt' => 'Database Error',
                    'asd_msg'=> 'Database connection timeout',
                ],

                'system_api' => [
                    'plm_ut' => 'system',
                    'sdf_un' => 'System',
                    'tya_tp' => 'system',
                    'zxc_at' => 'api',
                    'jkl_cl' => 'danger',
                    'fgh_ic' => 'bx bx-cloud',
                    'uio_tt' => 'API Failure',
                    'asd_msg'=> 'External API request failed',
                ],

                'system_queue' => [
                    'plm_ut' => 'system',
                    'sdf_un' => 'System',
                    'tya_tp' => 'system',
                    'zxc_at' => 'queue',
                    'jkl_cl' => 'warning',
                    'fgh_ic' => 'bx bx-timer',
                    'uio_tt' => 'Queue Delay',
                    'asd_msg'=> 'Job queue processing delayed',
                ],

                'security' => [
                    'plm_ut' => 'system',
                    'sdf_un' => 'System',
                    'tya_tp' => 'security',
                    'zxc_at' => 'auth',
                    'jkl_cl' => 'danger',
                    'fgh_ic' => 'bx bx-lock',
                    'uio_tt' => 'Security Alert',
                    'asd_msg'=> 'Suspicious activity detected',
                ],

                default => [
                    'tya_tp' => 'info',
                    'zxc_at' => 'system',
                    'jkl_cl' => 'info',
                    'fgh_ic' => 'bx bx-info-circle',
                    'uio_tt' => 'System Info',
                    'asd_msg'=> 'System running normally',
                ],
            };

            Notification::create(array_merge($data, [
                'lop_md' =>  json_encode([
                    'ip_address' => '192.168.1.' . rand(1, 255),
                    'user_agent' => 'Mozilla/5.0'
                ]),
                'kiu_ir' => 0,
                'ujm_ca' => $date,
                'bnm_ua' => $date,
            ]));
        }
    }
}
