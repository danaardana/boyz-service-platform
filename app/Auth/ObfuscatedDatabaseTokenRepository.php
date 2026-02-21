<?php

namespace App\Auth;

use Carbon\Carbon;
use Illuminate\Auth\Passwords\TokenRepositoryInterface;
use Illuminate\Contracts\Auth\CanResetPassword;
use Illuminate\Contracts\Hashing\Hasher;
use Illuminate\Database\ConnectionInterface;
use Illuminate\Support\Str;

class ObfuscatedDatabaseTokenRepository implements TokenRepositoryInterface
{
    protected ConnectionInterface $connection;
    protected Hasher $hasher;
    protected string $table;
    protected string $hashKey;
    protected int $expires;
    protected int $throttle;
    protected array $columns;

    public function __construct(
        ConnectionInterface $connection,
        Hasher $hasher,
        string $table,
        string $hashKey,
        int $expires = 60,
        int $throttle = 60,
        array $columns = []
    ) {
        $this->connection = $connection;
        $this->hasher = $hasher;
        $this->table = $table;
        $this->hashKey = $hashKey;
        $this->expires = $expires;
        $this->throttle = $throttle;
        $this->columns = array_merge([
            'email' => 'qwe_em',
            'token' => 'asd_tk',
            'created_at' => 'zxc_ca',
        ], $columns);
    }

    public function create(CanResetPassword $user)
    {
        $email = $user->getEmailForPasswordReset();
        $token = $this->createNewToken();

        $this->deleteExisting($user);

        $this->getTable()->insert($this->getPayload($email, $token));

        return $token;
    }

    public function exists(CanResetPassword $user, $token)
    {
        $record = (array) $this->getTable()
            ->where($this->columns['email'], $user->getEmailForPasswordReset())
            ->first();

        return $record &&
            ! $this->tokenExpired($record) &&
            $this->hasher->check($token, $record[$this->columns['token']]);
    }

    public function recentlyCreatedToken(CanResetPassword $user)
    {
        if ($this->throttle <= 0) {
            return false;
        }

        $record = (array) $this->getTable()
            ->where($this->columns['email'], $user->getEmailForPasswordReset())
            ->first();

        return $record && $this->recentlyCreated($record);
    }

    public function delete(CanResetPassword $user)
    {
        $this->deleteExisting($user);
    }

    public function deleteExpired()
    {
        $expired = Carbon::now()->subSeconds($this->expires * 60);

        $this->getTable()
            ->where($this->columns['created_at'], '<', $expired)
            ->delete();
    }

    protected function deleteExisting(CanResetPassword $user): void
    {
        $this->getTable()
            ->where($this->columns['email'], $user->getEmailForPasswordReset())
            ->delete();
    }

    protected function getPayload(string $email, string $token): array
    {
        return [
            $this->columns['email'] => $email,
            $this->columns['token'] => $this->hasher->make($token),
            $this->columns['created_at'] => new Carbon,
        ];
    }

    protected function tokenExpired(array $record): bool
    {
        $createdAt = Carbon::parse($record[$this->columns['created_at']]);
        return $createdAt->addSeconds($this->expires * 60)->isPast();
    }

    protected function recentlyCreated(array $record): bool
    {
        $createdAt = Carbon::parse($record[$this->columns['created_at']]);
        return $createdAt->addSeconds($this->throttle)->isFuture();
    }

    protected function createNewToken(): string
    {
        return hash_hmac('sha256', Str::random(40), $this->hashKey);
    }

    protected function getTable()
    {
        return $this->connection->table($this->table);
    }
}
