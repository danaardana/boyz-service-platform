<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class ProductOptionValue extends Model
{
    protected $table = 'val_9m3q';
    protected $primaryKey = 'k9_id';
    const CREATED_AT = 'zxc_ca';
    const UPDATED_AT = 'vbn_ua';

    protected $fillable = [
        'product_option_id',
        'value',
        'display_value',
        'price_adjustment',
        'is_default',
        'is_available',
        'sort_order',
    ];

    protected $casts = [
        'uio_pa' => 'decimal:2',
        'asd_id' => 'boolean',
        'fgh_ia' => 'boolean',
        'jkl_so' => 'integer',
    ];

    protected $hidden = [
        'k9_id',
        'opv_oid',
        'qwe_vl',
        'rty_dv',
        'uio_pa',
        'asd_id',
        'fgh_ia',
        'jkl_so',
        'zxc_ca',
        'vbn_ua',
    ];

    protected $appends = [
        'id',
        'product_option_id',
        'value',
        'display_value',
        'price_adjustment',
        'is_default',
        'is_available',
        'sort_order',
        'created_at',
        'updated_at',
    ];

    /**
     * Get the product option that owns the product option value.
     */
    public function productOption(): BelongsTo
    {
        return $this->belongsTo(ProductOption::class, 'opv_oid', 'k8_id');
    }

    /**
     * Get the product through the product option.
     */
    public function product()
    {
        return $this->productOption?->product;
    }

    /**
     * Scope a query to only include default values.
     */
    public function scopeDefault($query)
    {
        return $query->where('asd_id', true);
    }

    /**
     * Scope a query to only include available values.
     */
    public function scopeAvailable($query)
    {
        return $query->where('fgh_ia', true);
    }

    /**
     * Get formatted price adjustment.
     */
    public function getFormattedPriceAdjustmentAttribute()
    {
        if ($this->price_adjustment > 0) {
            return '+$' . number_format($this->price_adjustment, 2);
        } elseif ($this->price_adjustment < 0) {
            return '-$' . number_format(abs($this->price_adjustment), 2);
        }
        return '';
    }

    public function getIdAttribute()
    {
        return $this->k9_id;
    }

    public function getProductOptionIdAttribute()
    {
        return $this->opv_oid;
    }

    public function setProductOptionIdAttribute($value)
    {
        $this->opv_oid = $value;
    }

    public function getValueAttribute()
    {
        return $this->qwe_vl;
    }

    public function setValueAttribute($value)
    {
        $this->qwe_vl = $value;
    }

    public function getDisplayValueAttribute()
    {
        return $this->rty_dv;
    }

    public function setDisplayValueAttribute($value)
    {
        $this->rty_dv = $value;
    }

    public function getPriceAdjustmentAttribute()
    {
        return $this->uio_pa;
    }

    public function setPriceAdjustmentAttribute($value)
    {
        $this->uio_pa = $value;
    }

    public function getIsDefaultAttribute()
    {
        return $this->asd_id;
    }

    public function setIsDefaultAttribute($value)
    {
        $this->asd_id = $value;
    }

    public function getIsAvailableAttribute()
    {
        return $this->fgh_ia;
    }

    public function setIsAvailableAttribute($value)
    {
        $this->fgh_ia = $value;
    }

    public function getSortOrderAttribute()
    {
        return $this->jkl_so;
    }

    public function setSortOrderAttribute($value)
    {
        $this->jkl_so = $value;
    }

    public function getCreatedAtAttribute()
    {
        return $this->zxc_ca;
    }

    public function getUpdatedAtAttribute()
    {
        return $this->vbn_ua;
    }
}
