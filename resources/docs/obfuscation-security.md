# Database Obfuscation & Security

This document describes the obfuscation/security changes applied to the database schema and the corresponding code updates required so the application runs with the obfuscated schema.

## Overview

To harden the production database, table and column names were obfuscated. The mapping is maintained in `resources/docs/obfuscation-mapping.md`. The application codebase was updated to use the obfuscated table and column names where necessary and to make the views null-safe for obfuscated timestamps.

## Key changes

- Models updated to use obfuscated table names and primary keys:
  - `Customer` -> `mno_9x8w` (primary key `k2_id`)
  - `ContactMessage` -> `tgb_5y4v` (primary key `k3_id`)
  - `MessageResponse` -> `nhy_3m2k` (primary key `k4_id`)
  - `Admin` -> `xxy_k7m2p` (primary key `k1_id`)
  - `ChatConversation` -> `fgh_82lm` (customer FK `z1_cid`)
  - `ChatMessage` -> `jkl_23qw`
  - `ChatbotAutoResponse` -> `wer_72qp`
  - `Notification` -> `pqr_8x3m` (primary key `k5_id`)
  - `Session` -> `qwe_9k2p` (primary key `k6_id`)
  - `Product` -> `prd_4x7m` (primary key `k7_id`)
  - `ProductOption` -> `opt_6k2p` (primary key `k8_id`)
  - `ProductOptionValue` -> `val_9m3q` (primary key `k9_id`)

- Views and routes:
  - Admin message views compute a safe message key per loop item and use it when building `route('admin.messages.show', ...)` links, avoiding missing-parameter errors when items are arrays or when primary key names differ.
  - Navbar notifications compute a safe key and guard timestamp formatting.
  - Message inbox views use obsf-aware unread scopes to avoid querying non-existent `is_read` columns.

- Null safety:
  - Calls to `->diffForHumans()` are guarded using `optional()` or conditional checks to prevent calling on null timestamps.

- Encryption layers:
  - Notifications encrypt and decrypt sensitive fields through `NotificationTableObserver`.
  - Sessions encrypt payload, IP address, and user agent via `SessionObserver`.
  - Products, product options, and option values encrypt display content via table observers.
  - Backfill commands exist for legacy data:
    - `php artisan notifications:encrypt-existing`
    - `php artisan products:encrypt-existing`

- Password reset tokens:
  - Table and columns are obfuscated, and a custom password broker supports the new schema.

## Verification steps

1. Ensure the obfuscated schema in the database matches `resources/docs/obfuscation-mapping.md`.
2. Clear compiled views and caches:

```bash
php artisan view:clear
php artisan cache:clear
php artisan route:clear
php artisan config:clear
rm -rf storage/framework/views/*
```

3. Start the server and open the admin messages page:

```bash
php artisan serve --host=127.0.0.1 --port=8000
# then visit http://127.0.0.1:8000/admin/messages
```

4. Check `storage/logs/laravel.log` for exceptions.

---

Documentation generated: February 2026
