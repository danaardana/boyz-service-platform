<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Product extends Model
{
    protected $table = 'prd_4x7m';
    protected $primaryKey = 'k7_id';
    const CREATED_AT = 'wer_ca';
    const UPDATED_AT = 'sdf_ua';

    protected $fillable = [
        'name',
        'category',
        'image',
        'description',
        'stock',
        'sold',
        'ratings',
        'average_rating',
        'is_active',
    ];

    protected $casts = [
        'nmq_ia' => 'boolean',
        'fgh_st' => 'integer',
        'jkl_sd' => 'integer',
        'zxc_rt' => 'integer',
        'vbn_ar' => 'decimal:1',
    ];

    protected $hidden = [
        'k7_id',
        'qwe_nm',
        'rty_ct',
        'uio_im',
        'asd_ds',
        'fgh_st',
        'jkl_sd',
        'zxc_rt',
        'vbn_ar',
        'nmq_ia',
        'wer_ca',
        'sdf_ua',
    ];

    protected $appends = [
        'id',
        'name',
        'category',
        'image',
        'description',
        'stock',
        'sold',
        'ratings',
        'average_rating',
        'is_active',
        'created_at',
        'updated_at',
    ];

    /**
     * Get the product options for the product.
     */
    public function productOptions(): HasMany
    {
        return $this->hasMany(ProductOption::class, 'prf_pid', 'k7_id')->orderBy('asd_so');
    }

    /**
     * Get all option values for this product through product options.
     */
    public function getAllOptionValues()
    {
        return $this->productOptions()->with('productOptionValues')->get();
    }

    /**
     * Scope a query to only include active products.
     */
    public function scopeActive($query)
    {
        return $query->where('nmq_ia', true);
    }

    public function getIdAttribute()
    {
        return $this->k7_id;
    }

    public function getNameAttribute()
    {
        return $this->qwe_nm;
    }

    public function setNameAttribute($value)
    {
        $this->qwe_nm = $value;
    }

    public function getCategoryAttribute()
    {
        return $this->rty_ct;
    }

    public function setCategoryAttribute($value)
    {
        $this->rty_ct = $value;
    }

    public function getImageAttribute()
    {
        return $this->uio_im;
    }

    public function setImageAttribute($value)
    {
        $this->uio_im = $value;
    }

    public function getDescriptionAttribute()
    {
        return $this->asd_ds;
    }

    public function setDescriptionAttribute($value)
    {
        $this->asd_ds = $value;
    }

    public function getStockAttribute()
    {
        return $this->fgh_st;
    }

    public function setStockAttribute($value)
    {
        $this->fgh_st = $value;
    }

    public function getSoldAttribute()
    {
        return $this->jkl_sd;
    }

    public function setSoldAttribute($value)
    {
        $this->jkl_sd = $value;
    }

    public function getRatingsAttribute()
    {
        return $this->zxc_rt;
    }

    public function setRatingsAttribute($value)
    {
        $this->zxc_rt = $value;
    }

    public function getAverageRatingAttribute()
    {
        return $this->vbn_ar;
    }

    public function setAverageRatingAttribute($value)
    {
        $this->vbn_ar = $value;
    }

    public function getIsActiveAttribute()
    {
        return $this->nmq_ia;
    }

    public function setIsActiveAttribute($value)
    {
        $this->nmq_ia = $value;
    }

    public function getCreatedAtAttribute()
    {
        return $this->wer_ca;
    }

    public function getUpdatedAtAttribute()
    {
        return $this->sdf_ua;
    }
}
