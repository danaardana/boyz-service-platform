<?php

namespace App\Traits;

use Illuminate\Support\Facades\Crypt;

trait EncryptHelperTrait
{
    public function encryptSensitiveData(): void
    {
        if (!property_exists($this, 'encryptableFields')) {
            return;
        }

        foreach ($this->encryptableFields as $field) {
            if (!isset($this->{$field})) {
                continue;
            }

            $value = $this->{$field};

            if (!is_string($value)) {
                continue;
            }

            if ($this->isEncrypted($value)) {
                continue;
            }

            $this->{$field} = Crypt::encryptString($value);
        }
    }

    protected function isEncrypted(mixed $value): bool
    {
        if (!is_string($value)) {
            return false;
        }

        try {
            Crypt::decryptString($value);
            return true;
        } catch (\Throwable $e) {
            return false;
        }
    }
}
