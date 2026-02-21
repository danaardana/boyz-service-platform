# Chatbot Management System Documentation

## Overview

The Chatbot Management System combines rule-based auto-responses with ML intent prediction. Admins can configure keyword responses and ML mappings for customer interactions.

Current status: Fully implemented with admin UI, auto-response matching, ML intent prediction, and database integration.

---

## Database Schema (Obfuscated)

### Chatbot Auto Responses Table (`wer_72qp`)

Column mapping (primary fields):
- `id` -> `id`
- `keyword` -> `tyu_kw`
- `response` -> `rty_rs`
- `is_active` -> `wsx_ia`
- `priority` -> `vbn_pr`
- `additional_keywords` -> `qwe_ak`
- `match_type` -> `sdf_mt`
- `case_sensitive` -> `cde_cs`
- `description` -> `nhy_ds`
- `created_by` -> `pol_cb`
- `updated_by` -> `ijn_ub`
- `created_at` -> `created_at`
- `updated_at` -> `updated_at`

### ML Responses Table (`ml_responses`)

No obfuscation changes are currently applied to `ml_responses`. If this table is obfuscated in the future, update this section and the corresponding model queries.

For the full mapping, see `resources/docs/obfuscation-mapping.md`.

---

## Implementation Notes

- Models and controllers should use accessors and model attributes rather than raw obfuscated columns.
- Keep keyword fields queryable. Avoid encrypting keyword and match-type fields unless you add hashed search columns.

---

## Verification Steps

1. Confirm the obfuscated tables exist and match the mapping document.
2. Clear caches:

```bash
php artisan view:clear
php artisan cache:clear
php artisan route:clear
php artisan config:clear
```

3. Test chatbot admin UI and public endpoints:
- `/admin/chatbot`
- `/get-auto-response`

---

Documentation Version: 2.1
Last Updated: February 2026
System Version: v2.2.0
Status: Production Ready
