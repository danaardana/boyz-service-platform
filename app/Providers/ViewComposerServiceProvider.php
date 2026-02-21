<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Facades\View;
use App\Models\ContactMessage;
use App\Models\Notification;

class ViewComposerServiceProvider extends ServiceProvider
{
    /**
     * Register services.
     */
    public function register(): void
    {
        //
    }

    /**
     * Bootstrap services.
     */
    public function boot(): void
    {
        // Share unread messages count and recent messages with all admin views
        View::composer('admin.partials.navbar', function ($view) {
            $unreadMessages = ContactMessage::where('rty_ir', false)->count();
            $recentMessages = ContactMessage::with('customer')
                ->orderBy('zxc_ca', 'desc')
                ->take(5)
                ->get();

            // Add notification data
            $unreadNotifications = Notification::unread()->count();
            $recentNotifications = Notification::recent(10)->get();

            $view->with([
                'unreadMessages' => $unreadMessages,
                'recentMessages' => $recentMessages,
                'unreadNotifications' => $unreadNotifications,
                'recentNotifications' => $recentNotifications
            ]);
        });
    }
} 