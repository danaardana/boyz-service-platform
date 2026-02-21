# Product System Documentation

## Overview

The Product System provides a flexible option model for motorcycle parts and accessories. Products can have multiple options with availability and price adjustments.

This system now uses obfuscated tables and encrypted display fields. Models expose readable attributes through accessors.

---

## Database Structure (Obfuscated)

### 1. Products Table (`prd_4x7m`)

Column mapping:
- `id` -> `k7_id`
- `name` -> `qwe_nm` (encrypted)
- `category` -> `rty_ct` (encrypted)
- `image` -> `uio_im` (encrypted)
- `description` -> `asd_ds` (encrypted)
- `stock` -> `fgh_st`
- `sold` -> `jkl_sd`
- `ratings` -> `zxc_rt`
- `average_rating` -> `vbn_ar`
- `is_active` -> `nmq_ia`
- `created_at` -> `wer_ca`
- `updated_at` -> `sdf_ua`

### 2. Product Options Table (`opt_6k2p`)

Column mapping:
- `id` -> `k8_id`
- `product_id` -> `prf_pid`
- `option_name` -> `qwe_on` (queryable, not encrypted)
- `display_name` -> `rty_dn` (encrypted)
- `is_required` -> `uio_ir`
- `sort_order` -> `asd_so`
- `created_at` -> `fgh_ca`
- `updated_at` -> `jkl_ua`

### 3. Product Option Values Table (`val_9m3q`)

Column mapping:
- `id` -> `k9_id`
- `product_option_id` -> `opv_oid`
- `value` -> `qwe_vl` (encrypted)
- `display_value` -> `rty_dv` (encrypted)
- `price_adjustment` -> `uio_pa`
- `is_default` -> `asd_id`
- `is_available` -> `fgh_ia`
- `sort_order` -> `jkl_so`
- `created_at` -> `zxc_ca`
- `updated_at` -> `vbn_ua`

For the full mapping, see `resources/docs/obfuscation-mapping.md`.

---

## Encryption Layers

Encrypted display fields are automatically handled via observers:
- `ProductTableObserver`
- `ProductOptionTableObserver`
- `ProductOptionValueTableObserver`

Backfill for existing data:
```bash
php artisan products:encrypt-existing
```

Note: `option_name` (`qwe_on`) is intentionally not encrypted because it is used in queries such as `motor_type`.

---

## Model Relationships (Accessors)

Models expose readable attributes through accessors while using obfuscated columns internally.

Example:
- `$product->name` maps to `qwe_nm`
- `$option->display_name` maps to `rty_dn`
- `$value->display_value` maps to `rty_dv`

---

## Verification Steps

1. Run obfuscation migration for products:

```bash
php artisan migrate --path=database/migrations/2026_02_04_000004_obfuscate_products_tables.php
```

2. Expand encrypted columns (required for long ciphertext):

```bash
php artisan migrate --path=database/migrations/2026_02_04_000005_expand_encrypted_product_columns.php
```

3. Encrypt existing rows:

```bash
php artisan products:encrypt-existing
```

---

Documentation Version: 2.1
Last Updated: February 2026
System Version: 2.1.x
