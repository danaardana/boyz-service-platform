<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;

class DetectAbnormalSessions extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'app:detect-abnormal-sessions';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Command description';

    /**
     * Execute the console command.
     */
    public function handle()
    {
        $expiredSessions = Session::whereNull('logout_at')
            ->where('last_activity', '<', now()->subHours(24))
            ->get();

        foreach ($expiredSessions as $session) {

            Notification::logSessionExpired($session);

            // Optional: tandai session
            $session->update([
                'logout_at' => now(),
                'ended_reason' => 'expired'
            ]);
        }
    }

}
