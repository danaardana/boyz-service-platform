<?php

namespace App\Observers;

use App\Models\Session;
use App\Traits\EncryptHelperTrait;
use Illuminate\Support\Facades\Crypt;

class SessionObserver
{
    use EncryptHelperTrait;

    public function created(Session $session): void
    {
        $this->encryptSession($session);
    }

    public function updated(Session $session): void
    {
        $this->encryptSession($session);
    }

    protected function encryptSession(Session $session): void
    {
        if ($session->rty_ip && !$this->isEncrypted($session->rty_ip)) {
            $session->updateQuietly([
                'rty_ip' => Crypt::encryptString($session->rty_ip),
            ]);
        }

        if ($session->wsx_ua && !$this->isEncrypted($session->wsx_ua)) {
            $session->updateQuietly([
                'wsx_ua' => Crypt::encryptString($session->wsx_ua),
            ]);
        }

        if ($session->vbn_pl && !$this->isEncrypted($session->vbn_pl)) {
            $session->updateQuietly([
                'vbn_pl' => Crypt::encryptString($session->vbn_pl),
            ]);
        }
    }
}
