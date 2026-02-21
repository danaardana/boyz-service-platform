<?php

namespace App\Observers;

use App\Models\Product;
use App\Traits\EncryptNontificationTrait;
use Illuminate\Support\Facades\Crypt;

class ProductTableObserver
{
    public function created(Product $product): void
    {
        $this->encryptSensitiveData($product);
    }

    public function updated(Product $product): void
    {
        if ($product->isDirty(['qwe_nm', 'rty_ct', 'uio_im', 'asd_ds'])) {
            $this->encryptSensitiveData($product);
        }
    }

    public function retrieved(Product $product): void
    {
        $this->decryptSensitiveData($product);
    }

    protected function encryptSensitiveData(Product $product): void
    {
        $updates = [];

        if ($product->qwe_nm && !$this->isEncrypted($product->qwe_nm)) {
            $updates['qwe_nm'] = Crypt::encryptString($product->qwe_nm);
        }
        if ($product->rty_ct && !$this->isEncrypted($product->rty_ct)) {
            $updates['rty_ct'] = Crypt::encryptString($product->rty_ct);
        }
        if ($product->uio_im && !$this->isEncrypted($product->uio_im)) {
            $updates['uio_im'] = Crypt::encryptString($product->uio_im);
        }
        if ($product->asd_ds && !$this->isEncrypted($product->asd_ds)) {
            $updates['asd_ds'] = Crypt::encryptString($product->asd_ds);
        }

        if (!empty($updates)) {
            $product->update($updates);
        }
    }

    protected function decryptSensitiveData(Product $product): void
    {
        if ($product->qwe_nm && $this->isEncrypted($product->qwe_nm)) {
            $product->qwe_nm = Crypt::decryptString($product->qwe_nm);
        }
        if ($product->rty_ct && $this->isEncrypted($product->rty_ct)) {
            $product->rty_ct = Crypt::decryptString($product->rty_ct);
        }
        if ($product->uio_im && $this->isEncrypted($product->uio_im)) {
            $product->uio_im = Crypt::decryptString($product->uio_im);
        }
        if ($product->asd_ds && $this->isEncrypted($product->asd_ds)) {
            $product->asd_ds = Crypt::decryptString($product->asd_ds);
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
