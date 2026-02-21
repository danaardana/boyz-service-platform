<?php

namespace App\Auth;

use Illuminate\Auth\Passwords\PasswordBrokerManager;
use Illuminate\Contracts\Hashing\Hasher;

class CustomPasswordBrokerManager extends PasswordBrokerManager
{
    protected function createTokenRepository(array $config)
    {
        if (!empty($config['obfuscated'])) {
            $connection = $this->app['db']->connection($config['connection'] ?? null);
            $hasher = $this->app->make(Hasher::class);
            $table = $config['table'];
            $key = $this->app['config']['app.key'];
            $columns = $config['columns'] ?? [];

            return new ObfuscatedDatabaseTokenRepository(
                $connection,
                $hasher,
                $table,
                $key,
                $config['expire'] ?? 60,
                $config['throttle'] ?? 60,
                $columns
            );
        }

        return parent::createTokenRepository($config);
    }
}
