<?php

namespace App\Observers;

use App\Models\Notification;
use App\Traits\EncryptNotificationTrait;
use App\Traits\EncryptHelperTrait;
use Illuminate\Support\Facades\Crypt;

class NotificationTableObserver
{
    use EncryptNotificationTrait, EncryptHelperTrait;
    /**
     * Handle the Notification "created" event.
     * Encrypts sensitive notification data upon creation
     */
    public function created(Notification $notification): void
    {
        $this->encryptSensitiveData($notification);
    }

    /**
     * Handle the Notification "updated" event.
     * Re-encrypts sensitive notification data if it was modified
     */
    public function updated(Notification $notification): void
    {
        if ($notification->isDirty([
            'uio_tt',
            'asd_msg',
            'hjk_ue',
            'lop_md',
            'fgh_ic',
            'jkl_cl',
            'zxc_at',
            'vbn_aid',
            'nmq_am',
            'wer_uid',
            'plm_ut',
            'sdf_un'
        ])) {
            $this->encryptSensitiveData($notification);
        }
    }

    /**
     * Encrypt sensitive notification fields
     * 
     * @param Notification $notification
     * @return void
     */
    protected function encryptSensitiveData(Notification $notification): void
    {
        foreach ($this->encryptableFields as $field) {

            $value = $notification->getAttribute($field);

            // Skip null or empty values
            if ($value === null || $value === '') {
                continue;
            }

            // Skip arrays completely
            if (is_array($value)) {
                continue;
            }

            // 🔥 IMPORTANT: type check MUST come first
            if (is_string($value) && ! $this->isEncrypted($value)) {
                $notification->setAttribute(
                    $field,
                    Crypt::encryptString($value)
                );
            }
        }

        $notification->saveQuietly();
    }


    /**
     * Check if a string is already encrypted
     * 
     * @param string $value
     * @return bool
     */
    protected function isEncrypted(string $value): bool
    {
        try {
            Crypt::decryptString($value);
            return true;
        } catch (\Exception $e) {
            return false;
        }
    }

    /**
     * Handle the Notification "retrieved" event.
     * Automatically decrypt notification data when retrieved
     */
    public function retrieved(Notification $notification): void
    {
        $this->decryptSensitiveData($notification);
    }

    /**
     * Decrypt sensitive notification fields
     * 
     * @param Notification $notification
     * @return void
     */
    protected function decryptSensitiveData(Notification $notification): void
    {
        // Decrypt title if encrypted
        if ($notification->uio_tt && $this->isEncrypted($notification->uio_tt))
        {
            try 
            {     
                $decrypted = Crypt::decryptString($notification->uio_tt);
                if (is_string($decrypted) && preg_match('/^s:\d+:"/', $decrypted)) 
                {
                    $notification->uio_tt = unserialize($decrypted);
                } 
                else 
                    {
                    $notification->uio_tt = $decrypted;
                }
            } catch (\Exception $e) {
                \Log::error('Failed to decrypt notification title', [
                    'notification_id' => $notification->k5_id,
                    'error' => $e->getMessage()
                ]);
            }
        }

        // Decrypt message if encrypted
        if ($notification->asd_msg && $this->isEncrypted($notification->asd_msg))
        {
            try 
            {     
                $decrypted = Crypt::decryptString($notification->asd_msg);
                if (is_string($decrypted) && preg_match('/^s:\d+:"/', $decrypted)) 
                {
                    $notification->asd_msg = unserialize($decrypted);
                } 
                else 
                    {
                    $notification->asd_msg = $decrypted;
                }
            } catch (\Exception $e) {
                \Log::error('Failed to decrypt notification message', [
                    'notification_id' => $notification->k5_id,
                    'error' => $e->getMessage()
                ]);
            }
        }

        // Decrypt user email if encrypted
        if ($notification->hjk_ue && $this->isEncrypted($notification->hjk_ue)) {
            try 
            {     
                $decrypted = Crypt::decryptString($notification->hjk_ue);
                if (is_string($decrypted) && preg_match('/^s:\d+:"/', $decrypted)) 
                {
                    $notification->hjk_ue = unserialize($decrypted);
                } 
                else 
                    {
                    $notification->hjk_ue = $decrypted;
                }
            } catch (\Exception $e) {
                \Log::error('Failed to decrypt notification user email', [
                    'notification_id' => $notification->k5_id,
                    'error' => $e->getMessage()
                ]);
            }
        }

        // Decrypt metadata if encrypted
        if ($notification->lop_md && is_string($notification->lop_md)) {
            if ($this->isEncrypted($notification->lop_md))
            {
                try 
                {     
                    $decrypted = Crypt::decryptString($notification->lop_md);
                    if (is_string($decrypted) && preg_match('/^s:\d+:"/', $decrypted)) 
                    {
                        $notification->lop_md = unserialize($decrypted);
                    } 
                    else 
                        {
                        $notification->lop_md = $decrypted;
                    }
                } catch (\Exception $e) {
                    \Log::error('Failed to decrypt notification metadata', [
                        'notification_id' => $notification->k5_id,
                        'error' => $e->getMessage()
                    ]);
                }
            }
        }

        // Decrypt icon (fgh_ic)
        if ($notification->fgh_ic && $this->isEncrypted($notification->fgh_ic)){
            try 
            {     
                $decrypted = Crypt::decryptString($notification->fgh_ic);
                if (is_string($decrypted) && preg_match('/^s:\d+:"/', $decrypted)) 
                {
                    $notification->fgh_ic = unserialize($decrypted);
                } 
                else 
                    {
                    $notification->fgh_ic = $decrypted;
                }
            } catch (\Exception $e) {
                \Log::error('Failed to decrypt notification icon', [
                    'notification_id' => $notification->k5_id,
                    'error' => $e->getMessage()
                ]);
            }
        }

        // Decrypt color (jkl_cl)
        if ($notification->jkl_cl && $this->isEncrypted($notification->jkl_cl)) 
        {
            try 
            {     
                $decrypted = Crypt::decryptString($notification->jkl_cl);
                if (is_string($decrypted) && preg_match('/^s:\d+:"/', $decrypted)) 
                {
                    $notification->jkl_cl = unserialize($decrypted);
                } 
                else 
                    {
                    $notification->jkl_cl = $decrypted;
                }
            } catch (\Exception $e) {
                \Log::error('Failed to decrypt notification color', [
                    'notification_id' => $notification->k5_id,
                    'error' => $e->getMessage()
                ]);
            }
        }

        // Decrypt action_type (zxc_at)
        if ($notification->zxc_at && $this->isEncrypted($notification->zxc_at)) 
        {
            try 
            {     
                $decrypted = Crypt::decryptString($notification->zxc_at);
                if (is_string($decrypted) && preg_match('/^s:\d+:"/', $decrypted)) 
                {
                    $notification->zxc_at = unserialize($decrypted);
                } 
                else 
                    {
                    $notification->zxc_at = $decrypted;
                }
            } catch (\Exception $e) {
                \Log::error('Failed to decrypt notification action_type', [
                    'notification_id' => $notification->k5_id,
                    'error' => $e->getMessage()
                ]);
            }
        }

        // Decrypt action_id (vbn_aid)
        if ($notification->vbn_aid && $this->isEncrypted((string) $notification->vbn_aid)) 
        {
            try 
            {     
                $decrypted = Crypt::decryptString($notification->vbn_aid);
                if (is_string($decrypted) && preg_match('/^s:\d+:"/', $decrypted)) 
                {
                    $notification->vbn_aid = unserialize($decrypted);
                } 
                else 
                    {
                    $notification->vbn_aid = $decrypted;
                }
            } catch (\Exception $e) {
                \Log::error('Failed to decrypt notification action_id', [
                    'notification_id' => $notification->k5_id,
                    'error' => $e->getMessage()
                ]);
            }
        }

        // Decrypt action_model (nmq_am)
        if ($notification->nmq_am && $this->isEncrypted($notification->nmq_am)) 
        {
            try 
            {     
                $decrypted = Crypt::decryptString($notification->nmq_am);
                if (is_string($decrypted) && preg_match('/^s:\d+:"/', $decrypted)) 
                {
                    $notification->nmq_am = unserialize($decrypted);
                } 
                else 
                    {
                    $notification->nmq_am = $decrypted;
                }
            } catch (\Exception $e) {
                \Log::error('Failed to decrypt notification action_model', [
                    'notification_id' => $notification->k5_id,
                    'error' => $e->getMessage()
                ]);
            }
        }

        // Decrypt user_id (wer_uid)
        if ($notification->wer_uid && $this->isEncrypted((string) $notification->wer_uid)) 
        {
            try 
            {     
                $decrypted = Crypt::decryptString($notification->wer_uid);
                if (is_string($decrypted) && preg_match('/^s:\d+:"/', $decrypted)) 
                {
                    $notification->wer_uid = unserialize($decrypted);
                } 
                else 
                    {
                    $notification->wer_uid = $decrypted;
                }
            } catch (\Exception $e) {
                \Log::error('Failed to decrypt notification user_id', [
                    'notification_id' => $notification->k5_id,
                    'error' => $e->getMessage()
                ]);
            }
        }

        // Decrypt user_type (plm_ut)
        if ($notification->plm_ut) 
        {
            try 
            {
                $decrypted = Crypt::decryptString($notification->plm_ut);
                if (is_string($decrypted) && preg_match('/^s:\d+:"/', $decrypted)) 
                {
                    $notification->plm_ut = unserialize($decrypted);
                } 
                else 
                {
                    $notification->plm_ut = $decrypted;
                }

            } catch (\Exception $e) {
                \Log::error('Failed to decrypt notification user_type', [
                    'notification_id' => $notification->k5_id,
                    'error' => $e->getMessage()
                ]);
            }
        }

        // Decrypt user_name (sdf_un)
        if ($notification->sdf_un) 
        {
            try 
            {     
                $decrypted = Crypt::decryptString($notification->sdf_un);
                if (is_string($decrypted) && preg_match('/^s:\d+:"/', $decrypted)) 
                {
                    $notification->sdf_un = unserialize($decrypted);
                } 
                else 
                    {
                    $notification->sdf_un = $decrypted;
                }

            } catch (\Exception $e) {
                \Log::error('Failed to decrypt notification user_name', [
                    'notification_id' => $notification->k5_id,
                    'error' => $e->getMessage()
                ]);
            }
        }
    }
}
