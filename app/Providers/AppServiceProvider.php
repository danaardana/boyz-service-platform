<?php

namespace App\Providers;
use Illuminate\Support\Facades\URL;

use Illuminate\Support\ServiceProvider;

use App\Observers\NotificationObserver;
use App\Observers\SessionObserver;
use App\Observers\NotificationTableObserver;
use App\Observers\ProductTableObserver;
use App\Observers\ProductOptionTableObserver;
use App\Observers\ProductOptionValueTableObserver;
use App\Observers;

use App\Models\Admin;
use App\Models\Customer;
use App\Models\ChatMessage;
use App\Models\ChatConversation;
use App\Models\ContactMessage;
use App\Models\Section;
use App\Models\SectionContent;
use App\Models\Product;
use App\Models\ProductOption;
use App\Models\ProductOptionValue;
use App\Models\MLResponse;
use App\Models\ChatbotAutoResponse;
use App\Models\Session;
use App\Models\Notification;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        //
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        if (env('APP_ENV') === 'production') {
            URL::forceScheme('https');
        } else {
            URL::forceScheme('http');
        }

        header("X-Frame-Options: ALLOWALL");

        /* Register NotificationObserver for models that need notification tracking
        Admin::observe(NotificationObserver::class);
        Notification::observe(NotificationObserver::class);
        ChatMessage::observe(NotificationObserver::class);
        ChatConversation::observe(NotificationObserver::class);
        ContactMessage::observe(NotificationObserver::class);
        Section::observe(NotificationObserver::class);
        SectionContent::observe(NotificationObserver::class);
        Product::observe(NotificationObserver::class);
        MLResponse::observe(NotificationObserver::class);
        ChatbotAutoResponse::observe(NotificationObserver::class);
        */

        // Register obfuscation observers for sensitive tables
        Session::observe(SessionObserver::class);
        Notification::observe(NotificationTableObserver::class);
        Product::observe(ProductTableObserver::class);
        ProductOption::observe(ProductOptionTableObserver::class);
        ProductOptionValue::observe(ProductOptionValueTableObserver::class);
        
        //ContactMessage::observe(ContactMessageObserver::class);
        Notification::observe(NotificationObserver::class);
    }
    
}

class ContactMessageObserver
{
    public function updated(ContactMessage $message): void
    {
        // kosong
    }
}