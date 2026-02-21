<?php

namespace App\Services;

use App\Models\Notification;
use App\Models\ContactMessage;
use Illuminate\Support\Facades\Auth; 
use Throwable;
use App\Models\Customer;

class NotificationService
{
    public static function createCrudNotification(
        string $type,
        string $title,
        string $message,
        string $actionType,
        string $actionModel = null,
        $actionId = null,
        string $color = 'info',
        string $icon = 'bx bx-info-circle',
        string $userType = 'system'
    ): void {
        $admin = Auth::guard('admin')->user();

        Notification::create([
            'tya_tp'  => $type,
            'zxc_at'  => $actionType,
            'uio_tt'  => $title,
            'asd_msg' => $message,
            'fgh_ic'  => $icon,
            'jkl_cl'  => $color,
            'vbn_aid' => $actionId,
            'nmq_am'  => $actionModel,
            'wer_uid' => $admin?->k1_id,
            'plm_ut'  => $userType,
            'sdf_un'  => $admin?->qwe_nm,
            'hjk_ue'  => $admin?->rty_em,
            'kiu_ir' => 0,
        ]);
    }

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

        /**
     * Log a system-level error (database, API, queue, unexpected exception).
     */
    public static function logSystemError(
        string $title,
        Throwable $exception,
        array $context = []
    ): Notification 
    {
        return Notification::create([
            'tya_tp'  => 'system_database',
            'uio_tt'  => $title,
            'asd_msg' => $exception->getMessage(),
            'fgh_ic'  => 'bx bx-data',
            'jkl_cl'  => 'danger',
            'zxc_at'  => 'database',
            'plm_ut'  => 'system',
            'lop_md'  => array_merge([
                'exception' => class_basename($exception),
                'file'      => $exception->getFile(),
                'line'      => $exception->getLine(),
            ], $context),
        ]);
    }

    /**
     * Log a validation-related error.
     */
    public static function logValidationError(
        string $title,
        Throwable $exception,
        array $context = []
    ): Notification 
    {
        return Notification::create([
            'tya_tp'  => 'warning',
            'uio_tt'  => $title,
            'asd_msg' => $exception->getMessage(),
            'fgh_ic'  => 'bx bx-error',
            'jkl_cl'  => 'warning',
            'zxc_at'  => 'validation',
            'plm_ut'  => 'customer',
            'lop_md'  => array_merge([
                'exception' => class_basename($exception),
            ], $context),
        ]);
    }

    /**
     * Log an incoming customer message from landing page or public channel.
     */
    public static function logIncomingCustomerMessage(
        Customer $customer,
        ContactMessage $message,
        array $context = []
    ): Notification 
    {
        return Notification::create([
            'tya_tp'  => 'info',
            'uio_tt'  => 'New customer message',
            'asd_msg' => 'A new message has been received from the website.',
            'fgh_ic'  => 'bx bx-file',
            'jkl_cl'  => 'primary',
            'zxc_at'  => 'create',
            'vbn_aid' => $message->k3_id,
            'nmq_am'  => ContactMessage::class,
            'plm_ut'  => 'customer',
            'sdf_un'  => $customer->iop_nm,
            'hjk_ue'  => $customer->klj_em,
            'lop_md'  => array_merge([
                'source'       => 'landing_page',
                'customer_id'  => $customer->k2_id,
                'message_id'   => $message->k3_id,
            ], $context),
        ]);
    }

}
