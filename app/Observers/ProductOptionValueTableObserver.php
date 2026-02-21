<?php

namespace App\Observers;
use App\Traits\EncryptNontificationTrait;

use App\Models\ProductOptionValue;
use Illuminate\Support\Facades\Crypt;

class ProductOptionValueTableObserver
{
    public function created(ProductOptionValue $value): void
    {
        $this->encryptSensitiveData($value);
    }

    public function updated(ProductOptionValue $value): void
    {
        if ($value->isDirty(['qwe_vl', 'rty_dv'])) {
            $this->encryptSensitiveData($value);
        }
    }

    public function retrieved(ProductOptionValue $value): void
    {
        $this->decryptSensitiveData($value);
    }

    protected function encryptSensitiveData(ProductOptionValue $value): void
    {
        $updates = [];

        if ($value->qwe_vl && !$this->isEncrypted($value->qwe_vl)) {
            $updates['qwe_vl'] = Crypt::encryptString($value->qwe_vl);
        }
        if ($value->rty_dv && !$this->isEncrypted($value->rty_dv)) {
            $updates['rty_dv'] = Crypt::encryptString($value->rty_dv);
        }

        if (!empty($updates)) {
            $value->update($updates);
        }
    }

    protected function decryptSensitiveData(ProductOptionValue $value): void
    {
        if ($value->qwe_vl && $this->isEncrypted($value->qwe_vl)) {
            $value->qwe_vl = Crypt::decryptString($value->qwe_vl);
        }
        if ($value->rty_dv && $this->isEncrypted($value->rty_dv)) {
            $value->rty_dv = Crypt::decryptString($value->rty_dv);
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
