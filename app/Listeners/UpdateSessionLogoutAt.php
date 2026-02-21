<?php

namespace App\Listeners;

use Illuminate\Auth\Events\Logout;
use Illuminate\Support\Facades\DB;

class UpdateSessionLogoutAt
{
    public function handle(Logout $event): void
    {
        if (!$event->user) {
            return;
        }

        DB::table('qwe_9k2p') // sessions
            ->where('tyu_uid', $event->user->k1_id ?? $event->user->id)
            ->whereNull('asd_lo') // logout_at
            ->orderByDesc('qwe_la') // last_activity
            ->limit(1)
            ->update([
                'asd_lo' => now(),
            ]);
    }
    
}
