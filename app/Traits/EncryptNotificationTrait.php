<?php

namespace App\Traits;

use App\Models\Notification;
use App\Traits\EncryptHelperTrait;
use Illuminate\Support\Facades\Crypt;

trait EncryptNotificationTrait
{
    use EncryptHelperTrait;
    
    /**
     * Fields that should be encrypted by NotificationTableObserver.
     */
    protected array $encryptableFields = [
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
    ];

    /**
     * Encrypt all sensitive attributes defined in $encryptableFields.
     */
    public function encryptSensitiveData(): void
    {
        if (!property_exists($this, 'encryptableFields')) {
            return;
        }

        foreach ($this->encryptableFields as $field) {
            if (!isset($this->{$field})) {
                continue;
            }

            $value = $this->{$field};

            if (!is_string($value)) {
                continue;
            }

            if ($this->isEncrypted($value)) {
                continue;
            }

            $this->{$field} = Crypt::encryptString($value);
        }
    }

    protected function isEncrypted(mixed $value): bool
    {
        if (!is_string($value)) {
            return false;
        }

        try {
            Crypt::decryptString($value);
            return true;
        } catch (\Throwable $e) {
            return false;
        }
    }
}
