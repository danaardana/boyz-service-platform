<?php

namespace App\Providers;

use App\Auth\CustomPasswordBrokerManager;
use Illuminate\Auth\Passwords\PasswordBroker;
use Illuminate\Support\ServiceProvider;

class CustomPasswordResetServiceProvider extends ServiceProvider
{
    public function register(): void
    {
        $this->app->singleton('auth.password', function ($app) {
            return new CustomPasswordBrokerManager($app);
        });

        $this->app->bind(PasswordBroker::class, function ($app) {
            return $app->make('auth.password')->broker();
        });

        $this->app->bind('auth.password.broker', function ($app) {
            return $app->make('auth.password')->broker();
        });
    }
}
