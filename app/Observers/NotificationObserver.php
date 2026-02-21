<?php

namespace App\Observers;

use App\Models\Notification;
use App\Traits\EncryptHelperTrait;
use Illuminate\Support\Facades\Crypt;

class NotificationObserver
{
    use EncryptHelperTrait;

    public function created(Notification $notification): void
    {
        $this->encryptNotification($notification);
    }

    public function updated(Notification $notification): void
    {
        $this->encryptNotification($notification);
    }

    protected function encryptNotification(Notification $n): void
    {
        if ($n->uio_tt && !$this->isEncrypted($n->uio_tt)) {
            $n->updateQuietly([
                'uio_tt' => Crypt::encryptString($n->uio_tt),
            ]);
        }

        if ($n->asd_msg && !$this->isEncrypted($n->asd_msg)) {
            $n->updateQuietly([
                'asd_msg' => Crypt::encryptString($n->asd_msg),
            ]);
        }

        if ($n->plm_ut && !$this->isEncrypted($n->plm_ut)) {
            $n->updateQuietly([
                'plm_ut' => Crypt::encryptString($n->plm_ut),
            ]);
        }

        if ($n->nmq_am && !$this->isEncrypted($n->nmq_am)) {
            $n->updateQuietly([
                'nmq_am' => Crypt::encryptString($n->nmq_am),
            ]);
        }
    }
}
