<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

class ProductOption extends Model
{
    protected $table = 'opt_6k2p';
    protected $primaryKey = 'k8_id';
    const CREATED_AT = 'fgh_ca';
    const UPDATED_AT = 'jkl_ua';

    protected $fillable = [
        'product_id',
        'option_name',
        'display_name',
        'is_required',
        'sort_order',
    ];

    protected $casts = [
        'uio_ir' => 'boolean',
        'asd_so' => 'integer',
    ];

    protected $hidden = [
        'k8_id',
        'prf_pid',
        'qwe_on',
        'rty_dn',
        'uio_ir',
        'asd_so',
        'fgh_ca',
        'jkl_ua',
    ];

    protected $appends = [
        'id',
        'product_id',
        'option_name',
        'display_name',
        'is_required',
        'sort_order',
        'created_at',
        'updated_at',
    ];

    /**
     * Get the product that owns the product option.
     */
    public function product(): BelongsTo
    {
        return $this->belongsTo(Product::class, 'prf_pid', 'k7_id');
    }

    /**
     * Get the option values for the product option.
     */
    public function productOptionValues(): HasMany
    {
        return $this->hasMany(ProductOptionValue::class, 'opv_oid', 'k8_id')->orderBy('jkl_so');
    }

    /**
     * Get only available option values for the product option.
     */
    public function availableValues(): HasMany
    {
        return $this->hasMany(ProductOptionValue::class, 'opv_oid', 'k8_id')->available()->orderBy('jkl_so');
    }

    /**
     * Get the default option value.
     */
    public function defaultValue(): HasMany
    {
        return $this->hasMany(ProductOptionValue::class, 'opv_oid', 'k8_id')->default();
    }

    /**
     * Scope a query to only include required options.
     */
    public function scopeRequired($query)
    {
        return $query->where('uio_ir', true);
    }

    public function scopeByOptionName($query, string $name)
    {
        return $query->where('qwe_on', $name);
    }

    public function getIdAttribute()
    {
        return $this->k8_id;
    }

    public function getProductIdAttribute()
    {
        return $this->prf_pid;
    }

    public function setProductIdAttribute($value)
    {
        $this->prf_pid = $value;
    }

    public function getOptionNameAttribute()
    {
        return $this->qwe_on;
    }

    public function setOptionNameAttribute($value)
    {
        $this->qwe_on = $value;
    }

    public function getDisplayNameAttribute()
    {
        return $this->rty_dn;
    }

    public function setDisplayNameAttribute($value)
    {
        $this->rty_dn = $value;
    }

    public function getIsRequiredAttribute()
    {
        return $this->uio_ir;
    }

    public function setIsRequiredAttribute($value)
    {
        $this->uio_ir = $value;
    }

    public function getSortOrderAttribute()
    {
        return $this->asd_so;
    }

    public function setSortOrderAttribute($value)
    {
        $this->asd_so = $value;
    }

    public function getCreatedAtAttribute()
    {
        return $this->fgh_ca;
    }

    public function getUpdatedAtAttribute()
    {
        return $this->jkl_ua;
    }
}
