# Bilingual Chat System Documentation

## Overview

The Boy Projects Chat System is a bilingual (Indonesian/English) real-time communication platform that enables customers to initiate conversations from the landing page and allows administrators to respond through the admin dashboard.

Current status: Fully implemented with real database integration and real-time polling.

---

## System Architecture

Implementation highlights:
- Database integration for conversations and messages
- Real-time polling (3-second interval) for new messages
- Bilingual interface (customer: Indonesian, admin: English)
- Dual chat modes (landing page vs. admin chat)

---

## Database Schema (Obfuscated)

The chat tables are obfuscated in production. The application uses model accessors so views and APIs still expose readable fields.

### Chat Conversations Table (`fgh_82lm`)

Column mapping (primary fields):
- `id` -> `id`
- `customer_id` -> `z1_cid`
- `admin_id` -> `z1_aid`
- `customer_name` -> `xcv_nm`
- `customer_email` -> `xcv_em`
- `status` -> `sdw_st`
- `priority` -> `sdw_pr`
- `initial_question` -> `cvb_iq`
- `last_message_at` -> `vbv_lm`
- `created_at` -> `created_at`
- `updated_at` -> `updated_at`

### Chat Messages Table (`jkl_23qw`)

Column mapping (primary fields):
- `id` -> `id`
- `conversation_id` -> `mnb_cid`
- `sender_type` -> `vgt_st`
- `sender_id` -> `vgt_sid`
- `message_content` -> `lkj_mc`
- `message_type` -> `mnb_mt`
- `is_read` -> `wsx_ir`
- `metadata` -> `qa2_md`
- `created_at` -> `created_at`
- `updated_at` -> `updated_at`

For the full mapping, see `resources/docs/obfuscation-mapping.md`.

---

## Implementation Notes

- Models are already aligned to the obfuscated schema.
- Controllers and views should use model accessors (for example `message->message_content`) and not query raw column names.
- When querying, prefer model scopes or accessors instead of hard-coded columns.

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

3. Test admin and landing chat flows.

---

Documentation Version: 2.1
Last Updated: February 2026
System Version: v1.3.0
Status: Production Ready
