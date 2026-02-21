<?php

namespace App\Services;

use App\Models\Notification;
use App\Models\ContactMessage;
use App\Services\NotificationHelper;

class NotificationService
{
    public static function contactMovedToTrash(ContactMessage $message, $admin = null): void
    {
        Notification::create([
            'tya_tp'  => 'warning',
            'uio_tt'  => 'Message Moved to Trash',
            'asd_msg' => 'A contact message has been moved to trash.',
            'fgh_ic'  => 'bx bx-trash',
            'jkl_cl'  => 'warning',
            'zxc_at'  => 'delete',
            'vbn_aid' => $message->k3_id,
            'nmq_am'  => ContactMessage::class,
            'wer_uid' => $admin?->k1_id,
            'plm_ut'  => 'admin',
            'sdf_un'  => $admin?->qwe_nm,
            'hjk_ue'  => $admin?->rty_em,
            'kiu_ir'  => 0,
        ]);
    }

    public static function contactRestored(ContactMessage $message, $admin = null): void
    {
        Notification::create([
            'tya_tp'  => 'info',
            'uio_tt'  => 'Message Restored',
            'asd_msg' => 'A contact message has been restored from trash.',
            'fgh_ic'  => 'bx bx-undo',
            'jkl_cl'  => 'info',
            'zxc_at'  => 'restore',
            'vbn_aid' => $message->k3_id,
            'nmq_am'  => ContactMessage::class,
            'wer_uid' => $admin?->k1_id,
            'plm_ut'  => 'admin',
            'sdf_un'  => $admin?->qwe_nm,
            'hjk_ue'  => $admin?->rty_em,
            'kiu_ir'  => 0,
        ]);
    }
}
