<?php

namespace App\Traits;

use App\Models\Notification;
use Illuminate\Support\Facades\Auth;
use App\Services\NotificationService;

trait NotificationHelper
{    
    /*
    protected function createCrudNotification(
        string $action,
        string $userType,
        ?string $title = null,
        array $payload = [],
        ?string $actor = null
    ): void {
        NotificationService::createCrudNotification([
            'action'    => $action,
            'user_type' => $userType,
            'title'     => $title,
            'payload'   => $payload,
            'actor'     => $actor,
        ]);
    } */

    protected function createCrudNotification(
        string $action,
        string $userType,
        ?string $message = null,
        array $payload = [],
        ?string $actor = null
    ): void {

        $finalMessage = $message ?? ucfirst($action) . ' action executed';

        // Tentukan action type secara eksplisit
        $actionType = $payload['action_type']
            ?? 'system'; // default aman

        NotificationService::createCrudNotification(
            $action,        // string $type
            $userType,      // string $userType
            $finalMessage,  // string $message
            $actionType,    // ✅ STRING (BUKAN ARRAY)
            $actor
        );
    }
    
    /**
     * Create a system notification when no user is logged in
     */
    protected function createSystemNotification(string $type, string $actionType, $model = null, array $metadata = [])
    {
        $actionModel = $model ? get_class($model) : null;
        $actionId = $model ? $model->id : null;

        $notificationData = $this->generateSystemNotificationContent($type, $actionType, $model, $metadata);

        return Notification::createNotification([
            'type' => $type,
            'title' => $notificationData['title'],
            'message' => $notificationData['message'],
            'action_type' => $actionType,
            'action_id' => $actionId,
            'action_model' => $actionModel,
            'user_type' => 'system',
            'user_name' => 'System',
            'metadata' => array_merge($metadata, [
                'timestamp' => now()->toISOString(),
                'automated' => true
            ])
        ]);
    }

    /**
     * Get current authenticated user based on type
     */
    private function getCurrentUser(string $userType)
    {
        switch ($userType) {
            case 'admin':
                return Auth::guard('admin')->user();
            case 'customer':
            case 'user':
                return Auth::guard('web')->user();
            default:
                // Try to detect the current guard
                if (Auth::guard('admin')->check()) {
                    return Auth::guard('admin')->user();
                } elseif (Auth::guard('web')->check()) {
                    return Auth::guard('web')->user();
                }
                return null;
        }
    }

    /**
     * Get model display name
     */
    private function getModelDisplayName($model, string $actionType): string
    {
        if ($model) {
            $className = class_basename($model);
            return strtolower(preg_replace('/(?<!^)[A-Z]/', ' $0', $className));
        }
        
        return $this->getReadableActionType($actionType);
    }

    /**
     * Get model title for display
     */
    private function getModelTitle($model): string
    {
        if (!$model) return '';
        
        if (isset($model->title) && $model->title) {
            return ": {$model->title}";
        } elseif (isset($model->name) && $model->name) {
            return ": {$model->name}";
        } elseif (isset($model->email) && $model->email) {
            return ": {$model->email}";
        }
        
        return " (ID: {$model->id})";
    }

    /**
     * Get item name from metadata or model
     */
    private function getItemName(array $metadata, $model): string
    {
        if (!empty($metadata['item_name'])) {
            return ": {$metadata['item_name']}";
        }
        
        return $this->getModelTitle($model);
    }

    /**
     * Convert action type to readable format
     */
    private function getReadableActionType(string $actionType): string
    {
        $readableTypes = [
            'section' => 'section',
            'section_content' => 'section content',
            'subsection' => 'subsection',
            'user' => 'user',
            'customer' => 'customer',
            'admin' => 'admin user',
            'product' => 'product',
            'portfolio' => 'portfolio item',
            'testimonial' => 'testimonial',
            'instagram' => 'Instagram feed',
            'tiktok' => 'TikTok feed',
            'promotion' => 'promotion',
            'category' => 'category',
            'message' => 'message',
            'contact' => 'contact message',
            'chat' => 'chat message',
            'conversation' => 'conversation',
            'response' => 'response'
        ];

        return $readableTypes[$actionType] ?? $actionType;
    }

    /**
     * Quick methods for common CRUD operations
     */
    protected function notifyCreated(string $actionType, $model = null, array $metadata = [], string $userType = 'admin')
    {
        return $this->createCrudNotification('create', $actionType, $model, $metadata, $userType);
    }

    protected function notifyUpdated(string $actionType, $model = null, array $metadata = [], string $userType = 'admin')
    {
        return $this->createCrudNotification('update', $actionType, $model, $metadata, $userType);
    }

    protected function notifyDeleted(string $actionType, $model = null, array $metadata = [], string $userType = 'admin')
    {
        return $this->createCrudNotification('delete', $actionType, $model, $metadata, $userType);
    }

    protected function notifyLogin(string $userType = 'admin')
    {
        return $this->createCrudNotification('login', $userType, null, [], $userType);
    }

    protected function notifyLogout(string $userType = 'admin')
    {
        return $this->createCrudNotification('logout', $userType, null, [], $userType);
    }

    /**
     * Create notifications for specific user types
     */
    protected function notifyAdmin(string $type, string $actionType, $model = null, array $metadata = [])
    {
        return $this->createCrudNotification($type, $actionType, $model, $metadata, 'admin');
    }

    protected function notifyCustomer(string $type, string $actionType, $model = null, array $metadata = [])
    {
        return $this->createCrudNotification($type, $actionType, $model, $metadata, 'customer');
    }

    protected function notifySystem(string $type, string $actionType, $model = null, array $metadata = [])
    {
        return $this->createSystemNotification($type, $actionType, $model, $metadata);
    }

    public function encryptSensitiveData(): void
    {
        if (! property_exists($this, 'encryptableFields')) {
            return;
        }

        foreach ($this->encryptableFields as $field) {

            if (! isset($this->{$field})) {
                continue;
            }

            $value = $this->{$field};

            if (! is_string($value)) {
                continue;
            }

            if ($this->isEncrypted($value)) {
                continue;
            }

            $this->{$field} = encrypt($value);
        }
    }

} 