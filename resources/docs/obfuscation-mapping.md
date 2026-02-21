# Obfuscation Mapping Documentation

This document records the obfuscation changes applied to the database for security.

## Table: Admins → `xxy_k7m2p`

### Column mapping:
- `id` → `k1_id` (primary key)
- `name` → `qwe_nm`
- `email` → `rty_em`
- `email_verified_at` → `uio_vt`
- `is_active` → `asd_ac`
- `verified` → `fgh_vf`
- `password` → `jkl_pw`
- `remember_token` → `zxc_rt`
- `security_code` → `vbn_sc`
- `security_code_expires_at` → `nmq_ea`
- `created_at` → `wer_ca`
- `updated_at` → `sdf_ua`
- `avatar_path` → `hjk_ap`

---

## Table: Customers → `mno_9x8w`

### Column mapping:
- `id` → `k2_id` (primary key)
- `name` → `iop_nm`
- `email` → `klj_em`
- `phone` → `qaz_ph`
- `address` → `wsx_ad`
- `created_at` → `edc_ca`
- `updated_at` → `rfv_ua`

---

## Table: Contact Messages → `tgb_5y4v`

### Column mapping:
- `id` → `k3_id` (primary key)
- `customer_id` → `yhn_cid` (foreign key)
- `admin_id` → `ujm_aid` (foreign key)
- `content_key` → `ikm_ck`
- `content` → `olp_ct`
- `status` → `pkm_st`
- `category` → `qwe_cat`
- `is_read` → `rty_ir`
- `is_important` → `uio_ii`
- `is_deleted` → `asd_id`
- `deleted_at` → `fgh_da`
- `last_update_time` → `jkl_lut`
- `created_at` → `zxc_ca`
- `updated_at` → `vbn_ua`

---

## Table: Message Responses → `nhy_3m2k`

### Column mapping:
- `id` → `k4_id` (primary key)
- `contact_message_id` → `bgt_cmid` (foreign key)
- `admin_id` → `vfr_aid` (foreign key)
- `message` → `cde_msg`
- `created_at` → `xsw_ca`

---

## Table: Chat Conversations → `fgh_82lm`

### Column mapping:
- `id` → `id`
- `customer_id` → `z1_cid`
- `admin_id` → `z1_aid`
- `customer_name` → `xcv_nm`
- `customer_email` → `xcv_em`
- `status` → `sdw_st`
- `priority` → `sdw_pr`
- `initial_question` → `cvb_iq`
- `has_predefined_answer` → `brz_ha`
- `last_message_at` → `vbv_lm`
- `customer_acknowledged_recording` → `ght_cr`
- `session_data` → `nhy_sd`
- `resolved_at` → `lkj_ra`
- `resolved_by` → `dfg_rb`
- `created_at` → `created_at`
- `updated_at` → `updated_at`

---

## Table: Chat Messages → `jkl_23qw`

### Column mapping:
- `id` → `id`
- `conversation_id` → `mnb_cid`
- `sender_type` → `vgt_st`
- `sender_id` → `vgt_sid`
- `message_content` → `lkj_mc`
- `message_type` → `mnb_mt`
- `is_read` → `wsx_ir`
- `metadata` → `qa2_md`
- `created_at` → `created_at`
- `updated_at` → `updated_at`

---

## Table: Chatbot Auto Responses → `wer_72qp`

### Column mapping:
- `id` → `id`
- `keyword` → `tyu_kw`
- `response` → `rty_rs`
- `is_active` → `wsx_ia`
- `priority` → `vbn_pr`
- `additional_keywords` → `qwe_ak`
- `match_type` → `sdf_mt`
- `case_sensitive` → `cde_cs`
- `description` → `nhy_ds`
- `created_by` → `pol_cb`
- `updated_by` → `ijn_ub`
- `created_at` → `created_at`
- `updated_at` → `updated_at`

---

## Table: Notifications → `pqr_8x3m`

### Column mapping:
- `id` → `k5_id` (primary key)
- `type` → `tya_tp` (notification type: login_success, login_failure, system_database, system_api, system_queue, warning, info, and security)
- `title` → `uio_tt` (encrypted - notification title)
- `message` → `asd_msg` (encrypted - notification message)
- `icon` → `fgh_ic` (encrypted - icon class reference)
- `color` → `jkl_cl` (encrypted - color code: info (primary), success, warning, danger, info)
- `action_type` → `zxc_at` (encrypted - action type: create, update, delete, login, failure, database, api, queue, auth, system)
- `action_id` → `vbn_aid` (encrypted - associated record ID)
- `action_model` → `nmq_am` (encrypted - model class name)
- `user_id` → `wer_uid` (encrypted - admin user ID reference)
- `user_type` → `plm_ut` (encrypted - user type: admin, custumer and system)
- `user_name` → `sdf_un` (encrypted - admin username)
- `user_email` → `hjk_ue` (encrypted - admin email)
- `metadata` → `lop_md` (encrypted - JSON metadata for additional context)
- `is_read` → `kiu_ir` (read status: 0 or 1)
- `read_at` → `yhn_ra` (read timestamp)
- `created_at` → `ujm_ca` (creation timestamp)
- `updated_at` → `bnm_ua` (update timestamp)

**Encryption Strategy**: Fields marked as "encrypted" use Laravel's `Crypt::encryptString()` method
- Automatically encrypted on record creation/update
- Automatically decrypted on record retrieval
- Observer: `NotificationTableObserver`


type (tya_tp) → kategori besar (dipakai chart & filter)
action_type (zxc_at) → jenis kejadian
action_id + action_model → traceability
metadata (lop_md) → fleksibel tanpa ubah schema


## Notifications Table `pqr_8x3m`

### Core Concepts
- `tya_tp` : Main event type (login, system, create, update, delete)
- `action_type` : Sub classification (success, failure, database, api, security, queue)
- `color` : Severity & UI indicator (success, info, warning, danger)

### Example
- Login Failure
  - tya_tp: login
  - action_type: failure
  - color: warning

- Database Error
  - tya_tp: system
  - action_type: database
  - color: danger

---

## Table: Sessions → `qwe_9k2p`

### Column mapping:
- `id` → `k6_id` (primary key - session ID)
- `user_id` → `tyu_uid` (admin user ID reference)
- `ip_address` → `rty_ip` (encrypted - client IP address)
- `user_agent` → `wsx_ua` (encrypted - browser/client user agent)
- `payload` → `vbn_pl` (encrypted - serialized session data)
- `last_activity` → `qwe_la` (last activity timestamp)
- `logout_at` → `asd_lo` (timestamp, nullable)

**Encryption Strategy**: Sensitive fields use Laravel's `Crypt::encryptString()` method
- IP address encrypted to prevent tracking
- User agent encrypted for privacy
- Payload encrypted to secure session data
- Automatically encrypted on session creation/update
- Automatically decrypted on session retrieval
- Observer: `SessionObserver`

---

## Table: Password Reset Tokens → `rst_7x9m`

### Column mapping:
- `email` → `qwe_em` (user email)
- `token` → `asd_tk` (reset token hash)
- `created_at` → `zxc_ca` (creation timestamp)

**Notes**:
- Token repository is overridden to support obfuscated columns.
- Table name is configured in `config/auth.php`.

---

## Table: Products → `prd_4x7m`

### Column mapping:
- `id` → `k7_id` (primary key)
- `name` → `qwe_nm` (encrypted)
- `category` → `rty_ct` (encrypted)
- `image` → `uio_im` (encrypted)
- `description` → `asd_ds` (encrypted)
- `stock` → `fgh_st`
- `sold` → `jkl_sd`
- `ratings` → `zxc_rt`
- `average_rating` → `vbn_ar`
- `is_active` → `nmq_ia`
- `created_at` → `wer_ca`
- `updated_at` → `sdf_ua`

---

## Table: Product Options → `opt_6k2p`

### Column mapping:
- `id` → `k8_id` (primary key)
- `product_id` → `prf_pid` (foreign key)
- `option_name` → `qwe_on` (queryable, not encrypted)
- `display_name` → `rty_dn` (encrypted)
- `is_required` → `uio_ir`
- `sort_order` → `asd_so`
- `created_at` → `fgh_ca`
- `updated_at` → `jkl_ua`

---

## Table: Product Option Values → `val_9m3q`

### Column mapping:
- `id` → `k9_id` (primary key)
- `product_option_id` → `opv_oid` (foreign key)
- `value` → `qwe_vl` (encrypted)
- `display_value` → `rty_dv` (encrypted)
- `price_adjustment` → `uio_pa`
- `is_default` → `asd_id`
- `is_available` → `fgh_ia`
- `sort_order` → `jkl_so`
- `created_at` → `zxc_ca`
- `updated_at` → `vbn_ua`

---

## Table: Service Requests → `srv_4k9p`

### Column mapping:
- `id` → `k10_id`  (primary key)
- `customer_id` → `yhn_cid` (reference to customers.k2_id, nullable, no foreign key, no cascade)
- `customer_name` → `a1_nm`  (encrypted – snapshot customer name at request time)
- `customer_contact` → `b2_ct` (encrypted – email / phone)
- `service_type` → `c3_ad`  (service category: installation, maintenance, repair, inquiry)
- `service_source` → `d4_rt`  (source: website, admin, manual, import)
- `preferred_date` → `e5_pd`  (preferred service date, nullable)
- `technician_name` → `f6_tn` (encrypted – technician name, role-based reference, NOT foreign key)
- `status` → `g7_st`  (status: new, reviewed, scheduled, in_progress, completed, cancelled)
- `priority` → `h8_pr` (priority: low, normal, high, urgent)
- `notes` → `i9_nt`  (encrypted – internal notes / follow-up)
- `related_message_id` → `j1_mid` (reference to contact_messages.k3_id, nullable, no foreign key)
- `created_by` → `k2_cb`  (encrypted – creator: admin/system)
- `created_at` → `ujm_ca` (creation timestamp)
- `updated_at` → `bnm_ua` (update timestamp)

---

## Table: Technicians → `tch_9x2q`

### Column mapping:
- `id` → `t1_id` (primary key)
- `name` → `t2_nm` (encrypted – technician full name)
- `email` → `t3_em` (encrypted – technician email, nullable)
- `phone` → `t4_ph` (encrypted – technician phone, nullable)
- `role` → `t5_rl` (role identifier, fixed: technician)
- `status` → `t6_st` (active, inactive)
- `notes` → `t7_nt` (encrypted – internal notes, nullable)
- `created_at` → `ujm_ca` (creation timestamp)
- `updated_at` → `bnm_ua` (update timestamp)

---

## Progress Status

### Admins Table:
- [x] Mapping created
- [x] Migration to rename table and columns
- [x] Admin model updated with accessors/mutators
- [x] AuthController references updated
- [x] AdminSeeder updated
- [x] `check_admins.php` script updated

### Customers Table:
- [x] Mapping created
- [x] Migration to rename table and columns
- [x] Customer model updated with accessors/mutators
- [x] CustomerController already uses model (no update required)

### Contact Messages Table:
- [x] Mapping created
- [x] Migration to rename table and columns
- [x] ContactMessage model updated with obfuscated columns
- [x] Admin model references updated
- [x] ContactController references updated

### Message Responses Table:
- [x] Mapping created
- [x] Migration to rename table and columns
- [x] MessageResponse model updated with obfuscated columns

### ChatConversation, ChatMessage, ChatbotAutoResponse Tables:
- [x] Mapping created
- [x] Migration to rename table and columns
- [x] Update the three models with obfuscated table, fillable, casts, and relations (in progress)
- [x] Update relation references elsewhere after migrations

### Admin Notifications Table:
- [x] Mapping created
- [x] NotificationTableObserver created for automatic encryption/decryption
- [x] Observer registered in AppServiceProvider
- [x] Sensitive fields encrypted: title, message, user_email, metadata

### Sessions Table:
- [x] Mapping created
- [x] SessionObserver created for automatic encryption/decryption
- [x] Observer registered in AppServiceProvider
- [x] Sensitive fields encrypted: ip_address, user_agent, payload

---

*This document will be updated as obfuscation progress continues.*
