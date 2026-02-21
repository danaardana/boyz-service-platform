<?php

namespace App\Session;

use Illuminate\Contracts\Auth\Guard;
use Illuminate\Contracts\Container\Container;
use Illuminate\Database\ConnectionInterface;
use Illuminate\Database\QueryException;
use Illuminate\Support\Arr;
use Illuminate\Support\Carbon;
use Illuminate\Support\InteractsWithTime;
use Illuminate\Session\ExistenceAwareInterface;
use SessionHandlerInterface;

class ObfuscatedDatabaseSessionHandler implements ExistenceAwareInterface, SessionHandlerInterface
{
    use InteractsWithTime;

    protected ConnectionInterface $connection;
    protected string $table;
    protected int $minutes;
    protected ?Container $container;
    protected bool $exists = false;

    protected string $idColumn = 'k6_id';
    protected string $userIdColumn = 'tyu_uid';
    protected string $ipAddressColumn = 'rty_ip';
    protected string $userAgentColumn = 'wsx_ua';
    protected string $payloadColumn = 'vbn_pl';
    protected string $lastActivityColumn = 'qwe_la';

    public function __construct(ConnectionInterface $connection, string $table, int $minutes, ?Container $container = null, array $columns = [])
    {
        $this->connection = $connection;
        $this->table = $table;
        $this->minutes = $minutes;
        $this->container = $container;

        $this->idColumn = $columns['id'] ?? $this->idColumn;
        $this->userIdColumn = $columns['user_id'] ?? $this->userIdColumn;
        $this->ipAddressColumn = $columns['ip_address'] ?? $this->ipAddressColumn;
        $this->userAgentColumn = $columns['user_agent'] ?? $this->userAgentColumn;
        $this->payloadColumn = $columns['payload'] ?? $this->payloadColumn;
        $this->lastActivityColumn = $columns['last_activity'] ?? $this->lastActivityColumn;
    }

    public function open($savePath, $sessionName): bool
    {
        return true;
    }

    public function close(): bool
    {
        return true;
    }

    public function read($sessionId): string|false
    {
        $session = (object) $this->getQuery()
            ->where($this->idColumn, $sessionId)
            ->first();

        if ($this->expired($session)) {
            $this->exists = true;
            return '';
        }

        if (isset($session->{$this->payloadColumn})) {
            $this->exists = true;
            return base64_decode($session->{$this->payloadColumn});
        }

        return '';
    }

    protected function expired($session): bool
    {
        return isset($session->{$this->lastActivityColumn}) &&
            $session->{$this->lastActivityColumn} < Carbon::now()->subMinutes($this->minutes)->getTimestamp();
    }

    public function write($sessionId, $data): bool
    {
        $payload = $this->getDefaultPayload($data);

        if (! $this->exists) {
            $this->read($sessionId);
        }

        if ($this->exists) {
            $this->performUpdate($sessionId, $payload);
        } else {
            $this->performInsert($sessionId, $payload);
        }

        return $this->exists = true;
    }

    protected function performInsert($sessionId, array $payload)
    {
        try {
            return $this->getQuery()->insert(Arr::set($payload, $this->idColumn, $sessionId));
        } catch (QueryException) {
            $this->performUpdate($sessionId, $payload);
        }
    }

    protected function performUpdate($sessionId, array $payload)
    {
        return $this->getQuery()->where($this->idColumn, $sessionId)->update($payload);
    }

    protected function getDefaultPayload($data): array
    {
        $payload = [
            $this->payloadColumn => base64_encode($data),
            $this->lastActivityColumn => $this->currentTime(),
        ];

        if (! $this->container) {
            return $payload;
        }

        return tap($payload, function (&$payload) {
            $this->addUserInformation($payload)
                ->addRequestInformation($payload);
        });
    }

    protected function addUserInformation(array &$payload): static
    {
        if ($this->container->bound(Guard::class)) {
            $payload[$this->userIdColumn] = $this->userId();
        }

        return $this;
    }

    protected function userId()
    {
        return $this->container->make(Guard::class)->id();
    }

    protected function addRequestInformation(array &$payload): static
    {
        if ($this->container->bound('request')) {
            $payload = array_merge($payload, [
                $this->ipAddressColumn => $this->ipAddress(),
                $this->userAgentColumn => $this->userAgent(),
            ]);
        }

        return $this;
    }

    protected function ipAddress()
    {
        return $this->container->make('request')->ip();
    }

    protected function userAgent(): string
    {
        return substr((string) $this->container->make('request')->header('User-Agent'), 0, 500);
    }

    public function destroy($sessionId): bool
    {
        $this->getQuery()->where($this->idColumn, $sessionId)->delete();
        return true;
    }

    public function gc($lifetime): int
    {
        return $this->getQuery()
            ->where($this->lastActivityColumn, '<=', $this->currentTime() - $lifetime)
            ->delete();
    }

    protected function getQuery()
    {
        return $this->connection->table($this->table)->useWritePdo();
    }

    public function setContainer($container)
    {
        $this->container = $container;
        return $this;
    }

    public function setExists($value)
    {
        $this->exists = (bool) $value;
        return $this;
    }
}
