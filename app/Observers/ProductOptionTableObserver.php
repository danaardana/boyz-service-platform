<?php

namespace App\Observers;
use App\Traits\EncryptNontificationTrait;

use App\Models\ProductOption;
use Illuminate\Support\Facades\Crypt;

class ProductOptionTableObserver
{
    public function created(ProductOption $option): void
    {
        $this->encryptSensitiveData($option);
    }

    public function updated(ProductOption $option): void
    {
        if ($option->isDirty(['rty_dn'])) {
            $this->encryptSensitiveData($option);
        }
    }

    public function retrieved(ProductOption $option): void
    {
        $this->decryptSensitiveData($option);
    }

    protected function encryptSensitiveData(ProductOption $option): void
    {
        if ($option->rty_dn && !$this->isEncrypted($option->rty_dn)) {
            $option->update([
                'rty_dn' => Crypt::encryptString($option->rty_dn)
            ]);
        }
    }

    protected function decryptSensitiveData(ProductOption $option): void
    {
        if ($option->rty_dn && $this->isEncrypted($option->rty_dn)) {
            $option->rty_dn = Crypt::decryptString($option->rty_dn);
        }
    }

    protected function isEncrypted(string $value): bool
    {
        try {
            Crypt::decryptString($value);
            return true;
        } catch (\Throwable $e) {
            return false;
        }
    }
}
