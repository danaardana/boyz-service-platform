-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 04, 2026 at 02:05 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `boysproject`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fgh_82lm`
--

CREATE TABLE `fgh_82lm` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `z1_cid` bigint(20) UNSIGNED DEFAULT NULL,
  `z1_aid` bigint(20) UNSIGNED DEFAULT NULL,
  `xcv_nm` varchar(255) NOT NULL,
  `xcv_em` varchar(255) DEFAULT NULL,
  `sdw_st` enum('active','resolved','closed') NOT NULL DEFAULT 'active',
  `sdw_pr` enum('low','normal','high','urgent') NOT NULL DEFAULT 'normal',
  `cvb_iq` text DEFAULT NULL,
  `brz_ha` tinyint(1) NOT NULL DEFAULT 0,
  `vbv_lm` timestamp NULL DEFAULT NULL,
  `ght_cr` tinyint(1) NOT NULL DEFAULT 0,
  `nhy_sd` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `lkj_ra` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `dfg_rb` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jkl_23qw`
--

CREATE TABLE `jkl_23qw` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `mnb_cid` bigint(20) UNSIGNED NOT NULL,
  `vgt_st` varchar(20) NOT NULL,
  `vgt_sid` bigint(20) UNSIGNED DEFAULT NULL,
  `lkj_mc` text NOT NULL,
  `mnb_mt` varchar(20) NOT NULL DEFAULT 'text',
  `wsx_ir` tinyint(1) NOT NULL DEFAULT 0,
  `qa2_md` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`qa2_md`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `landing_pages`
--

CREATE TABLE `landing_pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `slug` varchar(255) NOT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `hero_image` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_03_20_create_customers_table', 1),
(5, '2024_03_21_000000_create_admins_table', 1),
(6, '2024_03_21_000000_create_sections_table', 1),
(7, '2024_03_21_000001_create_section_contents_table', 1),
(8, '2024_03_21_create_contact_messages_table', 1),
(9, '2024_03_21_create_predefined_messages_table', 1),
(10, '2024_03_22_add_is_read_to_contact_messages', 1),
(11, '2025_06_03_052802_add_security_code_to_admins_table', 1),
(12, '2025_06_04_054649_create_message_responses_table', 1),
(13, '2025_06_04_054905_remove_extra_data_from_contact_messages_table', 1),
(14, '2025_06_04_060348_remove_updated_at_from_message_responses', 1),
(15, '2025_06_04_060357_drop_users_table', 1),
(16, '2025_06_04_060852_update_admin_table_column_sizes', 1),
(17, '2025_06_04_061203_add_verified_column_to_admins_table', 1),
(18, '2025_06_04_062113_remove_department_and_permissions_from_admins_table', 1),
(19, '2025_06_05_055211_ensure_remember_token_in_admins_table', 1),
(20, '2025_06_05_123304_add_important_and_deleted_to_contact_messages_table', 1),
(21, '2025_06_05_141840_drop_unused_ecommerce_tables', 1),
(22, '2025_06_06_043752_create_products_table', 1),
(23, '2025_06_06_043801_create_product_options_table', 1),
(24, '2025_06_06_043809_create_product_option_values_table', 1),
(25, '2025_06_06_045538_update_products_tables_for_new_dataset', 1),
(26, '2025_06_06_050422_update_existing_contact_message_categories', 1),
(27, '2025_06_06_050429_update_existing_contact_message_categories', 1),
(28, '2025_06_07_030443_create_chat_conversations_table', 1),
(29, '2025_06_07_030457_create_chat_messages_table', 1),
(30, '2025_06_07_033915_update_chat_conversations_table_fix_fields', 1),
(31, '2025_06_11_115757_encrypt_admin_emails_existing_data', 1),
(32, '2025_06_11_122329_increase_admin_email_column_size', 1),
(33, '2025_06_11_122518_encrypt_existing_admin_emails', 1),
(34, '2025_06_11_123046_increase_admin_name_column_size', 1),
(35, '2025_06_11_123157_encrypt_existing_admin_names', 1),
(36, '2025_06_11_125222_increase_customer_columns_for_encryption', 1),
(37, '2025_06_11_125839_encrypt_existing_customer_data', 1),
(38, '2025_06_12_032150_create_chatbot_auto_responses_table', 1),
(39, '2025_06_12_032150_create_ml_responses_table', 1),
(40, '2025_06_16_112714_create_landing_pages_table', 2),
(41, '2025_06_16_181638_add_description_to_section_contents_table', 2),
(42, '2025_06_16_182201_create_notifications_table', 3),
(43, '2025_06_16_182321_create_admin_notifications_table', 3),
(44, '2025_06_16_223028_add_notification_fields_to_notifications_table', 4),
(45, '2025_01_15_120000_merge_notification_tables', 5),
(46, '2025_01_20_000001_obfuscate_admins_table', 6),
(47, '2025_01_20_000002_obfuscate_customers_table', 7),
(48, '2025_01_20_000003_obfuscate_contact_messages_table', 8),
(49, '2025_01_20_000004_obfuscate_message_responses_table', 8),
(50, '2025_01_20_000005_obfuscate_chat_tables', 9),
(51, '2026_02_03_000001_rename_primary_key_admins', 10),
(52, '2026_02_03_000002_rename_primary_key_customers', 10),
(53, '2026_02_03_000003_rename_primary_key_contact_messages', 10),
(54, '2026_02_03_000004_rename_primary_key_message_responses', 10),
(55, '2026_02_04_000000_obfuscate_sessions_table', 11),
(56, '2026_02_04_000003_obfuscate_password_reset_tokens_table', 12),
(57, '2026_02_04_000004_obfuscate_products_tables', 13),
(58, '2026_02_04_000005_expand_encrypted_product_columns', 14);

-- --------------------------------------------------------

--
-- Table structure for table `ml_responses`
--

CREATE TABLE `ml_responses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `intent_key` varchar(255) NOT NULL,
  `response` text NOT NULL,
  `category` varchar(255) NOT NULL DEFAULT 'main_intent',
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `usage_count` int(11) NOT NULL DEFAULT 0,
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`metadata`)),
  `auto_response_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ml_responses`
--

INSERT INTO `ml_responses` (`id`, `intent_key`, `response`, `category`, `is_active`, `usage_count`, `metadata`, `auto_response_id`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'harga', '💰 **INFORMASI HARGA** | Silakan sebutkan produk spesifik untuk info harga detail. Kami ada berbagai pilihan harga dan paket khusus!', 'main_intent', 1, 0, NULL, NULL, NULL, NULL, '2025-06-13 00:05:37', '2025-06-13 00:05:37'),
(2, 'stok_produk', '📦 **CEK STOK PRODUK** | Sebutkan produk yang ingin dicek stocknya. Kami update stok real-time!', 'main_intent', 1, 0, NULL, NULL, NULL, NULL, '2025-06-13 00:05:37', '2025-06-13 00:05:37'),
(3, 'kategori_lighting', '💡 **KATEGORI LIGHTING** | Tersedia berbagai jenis lampu dan aksesori lighting untuk motor matic Anda!', 'main_intent', 1, 0, NULL, NULL, NULL, NULL, '2025-06-13 00:05:37', '2025-06-13 00:05:37'),
(4, 'kategori_mounting_body', '🏍️ **KATEGORI MOUNTING & BODY** | Tersedia mounting dan body kit berkualitas untuk motor matic!', 'main_intent', 1, 0, NULL, NULL, NULL, NULL, '2025-06-13 00:05:37', '2025-06-13 00:05:37'),
(5, 'harga_harga_produk', '💰 **HARGA PRODUK SPESIFIK** | Harga mounting carbon: Rp 450.000-650.000, Body kit: Rp 800.000-1.200.000, Lampu LED: Rp 350.000-550.000, Projector: Rp 750.000-950.000. *Harga dapat berubah, konfirmasi via WhatsApp untuk harga terkini!', 'sub_intent', 1, 0, NULL, NULL, NULL, NULL, '2025-06-13 00:05:37', '2025-06-13 00:05:37'),
(6, 'harga_harga_promo', '🎉 **PROMO & DISKON TERKINI** | Saat ini ada promo bundling mounting + lampu diskon 15%! Flash sale setiap Jumat jam 19:00. Member discount 10%. Follow IG @motorparts_bandung untuk update promo terbaru! 🔥', 'sub_intent', 1, 0, NULL, NULL, NULL, NULL, '2025-06-13 00:05:37', '2025-06-13 00:05:37'),
(7, 'harga_harga_grosir', '🏪 **HARGA GROSIR & RESELLER** | Harga khusus reseller: diskon 20-30% untuk pembelian min 5 pcs. Sistem dropship tersedia. MOQ grosir: 10 pcs. Daftar jadi partner via WhatsApp untuk price list khusus! 💼', 'sub_intent', 1, 0, NULL, NULL, NULL, NULL, '2025-06-13 00:05:37', '2025-06-13 00:05:37'),
(8, 'harga_harga_ongkir', '🚚 **BIAYA PENGIRIMAN** | Bandung-Cimahi: GRATIS ongkir! Luar kota: Rp 15.000-25.000. Same day delivery +Rp 10.000. COD gratis area Bandung. Express overnight +Rp 20.000. Cek ongkir eksak via WhatsApp! 📦', 'sub_intent', 1, 0, NULL, NULL, NULL, NULL, '2025-06-13 00:05:37', '2025-06-13 00:05:37'),
(9, 'harga_harga_instalasi', '🔧 **BIAYA PEMASANGAN** | Jasa pasang mounting: Rp 50.000. Body kit install: Rp 100.000. Lampu setup: Rp 75.000. Home service +Rp 30.000. Weekend service normal rate. Paket install beli produk diskon 50%! ⚡', 'sub_intent', 1, 1, NULL, NULL, NULL, NULL, '2025-06-13 00:05:37', '2025-06-13 00:25:04'),
(10, 'stok_produk_stok_tersedia', '✅ **PRODUK READY STOCK** | Sebagian besar item ready stock! Mounting carbon, LED headlamp, body kit populer tersedia. Update stok real-time cek WhatsApp. Fast moving items selalu kami stock! 📦', 'sub_intent', 1, 0, NULL, NULL, NULL, NULL, '2025-06-13 00:05:37', '2025-06-13 00:05:37'),
(11, 'stok_produk_stok_habis', '⏳ **RESTOCK SCHEDULE** | Item sold out biasanya restock 2-3 hari kerja. Import item 1-2 minggu. Limited edition by request. Join waiting list untuk prioritas stock! Info restock via broadcast WhatsApp 📱', 'sub_intent', 1, 0, NULL, NULL, NULL, NULL, '2025-06-13 00:05:37', '2025-06-13 00:05:37'),
(12, 'stok_produk_stok_booking', '📝 **BOOKING & PRE-ORDER** | Bisa booking stock dengan DP 30%. Pre-order item khusus tersedia. Waiting list gratis! Notification otomatis saat stock ready. Booking berlaku 7 hari! 🎯', 'sub_intent', 1, 0, NULL, NULL, NULL, NULL, '2025-06-13 00:05:37', '2025-06-13 00:05:37'),
(13, 'motor_compatibility', '🏍️ **KOMPATIBILITAS MOTOR** | Produk tersedia untuk motor matic populer. Sebutkan tipe motor spesifik untuk cek compatibility. Custom fitting tersedia untuk motor langka! Konsultasi gratis via WhatsApp 💬', 'main_intent', 1, 0, NULL, NULL, NULL, NULL, '2025-06-13 00:05:37', '2025-06-13 00:05:37'),
(14, 'general_inquiry', '❓ **BANTUAN UMUM** | Silakan tanyakan hal spesifik tentang produk, harga, stok, atau pemasangan. Tim customer service kami siap membantu! WhatsApp aktif 09:00-17:00 WIB 📞', 'main_intent', 1, 0, NULL, NULL, NULL, NULL, '2025-06-13 00:05:37', '2025-06-13 00:05:37'),
(15, 'booking_pemasangan', '📅 **BOOKING PEMASANGAN** | Booking install bisa via WA/call. Jadwal weekday/weekend tersedia. Home service area Bandung +30rb. Estimasi 1-2 jam per produk. Konfirmasi H-1 sebelum install. Garansi pemasangan 6 bulan! 🔧', 'main_intent', 1, 0, NULL, NULL, NULL, NULL, '2025-06-13 00:05:37', '2025-06-13 00:05:37'),
(16, 'durasi_pengiriman', '🚚 **ESTIMASI PENGIRIMAN** | Same day delivery area Bandung (order sebelum 15:00). Luar kota 1-3 hari kerja via JNE/J&T. Gratis ongkir pembelian >500rb. Tracking number dikirim via WA. Barang dikemas bubble wrap + kardus! 📦', 'main_intent', 1, 0, NULL, NULL, NULL, NULL, '2025-06-13 00:05:37', '2025-06-13 00:05:37'),
(17, 'harga_produk', '💰 **DAFTAR HARGA PRODUK** | Mounting phone holder: Rp 75.000-150.000. Body kit Aerox: Rp 250.000-400.000. Lampu LED projector: Rp 180.000-350.000. DRL strip: Rp 120.000-200.000. Harga bervariasi sesuai kualitas dan merk! 🏷️', 'main_intent', 1, 0, NULL, NULL, NULL, NULL, '2025-06-13 00:05:37', '2025-06-13 00:05:37'),
(18, 'info_produk', 'ℹ️ **INFO PRODUK** | Spesialisasi aksesoris motor: Mounting phone holder, Body kit custom, Lampu LED/projector, DRL strip. Semua produk berkualitas tinggi dengan garansi. Katalog lengkap di website! 🛵', 'main_intent', 1, 0, NULL, NULL, NULL, NULL, '2025-06-13 00:05:37', '2025-06-13 00:05:37'),
(19, 'kontak_info', '📞 **KONTAK KAMI** | WhatsApp: 0812-3456-7890 | Telepon: (022) 1234-5678 | Email: info@boyzproject.com | Alamat: Jl. Contoh No.123, Bandung | Jam operasional: 08:00-17:00 WIB (Senin-Sabtu) 🏪', 'main_intent', 1, 0, NULL, NULL, NULL, NULL, '2025-06-13 00:05:37', '2025-06-13 00:05:37'),
(20, 'jam_operasional', '🕐 **JAM OPERASIONAL** | Senin-Jumat: 08:00-17:00 WIB | Sabtu: 08:00-15:00 WIB | Minggu: TUTUP | Customer service online 24/7 via WhatsApp untuk pertanyaan mendesak! ⏰', 'sub_intent', 1, 0, NULL, NULL, NULL, NULL, '2025-06-13 00:05:37', '2025-06-13 00:05:37'),
(21, 'promo_diskon', '🎉 **PROMO SPESIAL** | Diskon 15% pembelian >300rb | Paket install + produk diskon 50% jasa pasang | Gratis ongkir area Bandung min. 200rb | Member VIP cashback 10%! Promo terbatas, buruan order! 🔥', 'main_intent', 1, 0, NULL, NULL, NULL, NULL, '2025-06-13 00:05:37', '2025-06-13 00:05:37'),
(22, 'cara_pemesanan', '📝 **CARA PEMESANAN** | 1. Pilih produk di website/katalog | 2. Chat WA dengan kode produk | 3. Konfirmasi detail & alamat | 4. Transfer DP 50% | 5. Produk dikirim/dijadwalkan install | 6. Pelunasan saat terima barang! 🛒', 'main_intent', 1, 0, NULL, NULL, NULL, NULL, '2025-06-13 00:05:37', '2025-06-13 00:05:37'),
(23, 'garansi_produk', '🛡️ **GARANSI PRODUK** | Garansi produk 6-12 bulan (tergantung jenis) | Garansi pemasangan 6 bulan | Klaim garansi dengan bukti pembelian | Free service 1x dalam masa garansi | Penggantian jika cacat produksi! ✅', 'main_intent', 1, 0, NULL, NULL, NULL, NULL, '2025-06-13 00:05:37', '2025-06-13 00:05:37'),
(24, 'metode_pembayaran', '💳 **METODE PEMBAYARAN** | Transfer Bank: BCA, Mandiri, BRI | E-wallet: OVO, DANA, GoPay | COD area Bandung (+10rb) | Cicilan 0% kartu kredit | Crypto payment (Bitcoin, USDT) tersedia! 💰', 'main_intent', 1, 0, NULL, NULL, NULL, NULL, '2025-06-13 00:05:37', '2025-06-13 00:05:37');

-- --------------------------------------------------------

--
-- Table structure for table `mno_9x8w`
--

CREATE TABLE `mno_9x8w` (
  `k2_id` bigint(20) UNSIGNED NOT NULL,
  `iop_nm` text NOT NULL,
  `klj_em` text NOT NULL,
  `qaz_ph` text DEFAULT NULL,
  `wsx_ad` text DEFAULT NULL,
  `edc_ca` timestamp NULL DEFAULT NULL,
  `rfv_ua` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mno_9x8w`
--

INSERT INTO `mno_9x8w` (`k2_id`, `iop_nm`, `klj_em`, `qaz_ph`, `wsx_ad`, `edc_ca`, `rfv_ua`) VALUES
(3, 'eyJpdiI6IjkxWEFwcGpQbnZGbnFIUjJGcS85Z0E9PSIsInZhbHVlIjoiVTRYTFVxU2s1aW5MMVV2L2FXc1paZz09IiwibWFjIjoiOTk4YzhhM2ZhNjY0ODg4NDkyNTA4OTQ4MzdhNzEzNjU5NTM1OGQ1ZDZmMzBmNzFhYWI4NjQ2ZGNkMjdhMTMzNyIsInRhZyI6IiJ9', 'eyJpdiI6Im1lcVI0WDlzRzEvWDBqTEkvLzZMMHc9PSIsInZhbHVlIjoiVmVZUUkvWkVMWHc1S3JJLzdDZ2FsODBsOXJFamJtTFBhZCszTzhZZmJnTT0iLCJtYWMiOiJkMTUwOGI3OWEyYjM5MWMzNTAzZTI1YmZmNTM4YjBiNjE0OGI3MjI1NjVjMTA2ODVlYmZiNzcxZWNjM2M4YTNiIiwidGFnIjoiIn0=', NULL, NULL, '2025-06-16 08:48:27', '2025-06-16 08:48:27');

-- --------------------------------------------------------

--
-- Table structure for table `nhy_3m2k`
--

CREATE TABLE `nhy_3m2k` (
  `k4_id` bigint(20) UNSIGNED NOT NULL,
  `bgt_cmid` bigint(20) UNSIGNED NOT NULL,
  `vfr_aid` bigint(20) UNSIGNED NOT NULL,
  `cde_msg` text NOT NULL,
  `xsw_ca` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `nhy_3m2k`
--

INSERT INTO `nhy_3m2k` (`k4_id`, `bgt_cmid`, `vfr_aid`, `cde_msg`, `xsw_ca`) VALUES
(1, 1, 1, 'Boleh ka, silahkan nomor transaksinya', '2025-06-15 07:21:13'),
(2, 4, 1, 'Reply to Rio Ardana PutraReply to Rio Ardana PutraReply to Rio Ardana PutraReply to Rio Ardana Putra', '2025-06-16 10:05:32'),
(3, 5, 1, 'Benar, jam kerja terebut', '2025-06-16 15:34:19'),
(6, 4, 1, 'Illuminate\\Mail\\Mailables\\Envelope::__construct(): Argument #1 ($from) must be of type Illuminate\\Mail\\Mailables\\Address|string|null, array given, called in C:\\Users\\rioar\\Documents\\K U L I A H\\Computing Project\\Project2\\boyzproject\\app\\Mail\\MessageReplyMail.php on line 47', '2025-06-16 16:08:02'),
(7, 6, 1, 'oke, buat appoinment hari selasa ya', '2025-06-16 18:33:15'),
(8, 6, 1, 'oke, buat appoinment hari selasa ya', '2025-06-16 18:34:06');

-- --------------------------------------------------------

--
-- Table structure for table `opt_6k2p`
--

CREATE TABLE `opt_6k2p` (
  `k8_id` bigint(20) UNSIGNED NOT NULL,
  `prf_pid` bigint(20) UNSIGNED NOT NULL,
  `qwe_on` varchar(255) NOT NULL,
  `rty_dn` longtext DEFAULT NULL,
  `uio_ir` tinyint(1) NOT NULL DEFAULT 0,
  `asd_so` int(11) NOT NULL DEFAULT 0,
  `fgh_ca` timestamp NULL DEFAULT NULL,
  `jkl_ua` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `opt_6k2p`
--

INSERT INTO `opt_6k2p` (`k8_id`, `prf_pid`, `qwe_on`, `rty_dn`, `uio_ir`, `asd_so`, `fgh_ca`, `jkl_ua`) VALUES
(1, 1, 'motor_type', 'eyJpdiI6Ii9ybGd5cmVxNk4yZ2wxK2tkNllVUkE9PSIsInZhbHVlIjoiVnZWaGJWVUdGcWdvK3JscnJpUWVPZz09IiwibWFjIjoiYzhjZGZmNTBhMWVmNzc5OGI3YjhlMjA3OWFmNDJjZWJlNmIwNTc3MTM5Yjg3OTJjNzU2NzUyODBmNDhkNThiNSIsInRhZyI6IiJ9', 1, 1, '2025-06-12 23:06:47', '2025-06-12 23:06:47'),
(2, 1, 'size', 'eyJpdiI6IlhOcHJEYzV5MDcwM3NFSmRTVGZXWlE9PSIsInZhbHVlIjoiTVZmZi9jK1A3ZWxNanFyeGM1dFRHUT09IiwibWFjIjoiNTVjZGFkNDJhNTYzYzYxYTlhNGMyNTk4NDllZTg4Y2NjYmY3OTQyZGZhODRhNDg0NWM0MzhiZmViYjAxNGMwMSIsInRhZyI6IiJ9', 1, 2, '2025-06-12 23:06:47', '2025-06-12 23:06:47'),
(3, 2, 'motor_type', 'eyJpdiI6ImV0S3RkMmtlM3p5dmMrMWZ0Y0RCbXc9PSIsInZhbHVlIjoiZzYzbkJXUVk4bGIvQWJMbWpPOFRlUT09IiwibWFjIjoiYzk3NGY3YjQ2MzQ1MjVmYmU0ZjFiZTE4Mzg2NTU3ZmZmMDllY2EyYTk0MmRhMDlmMmIwMmY5YTIwYWViNWY4NSIsInRhZyI6IiJ9', 1, 1, '2025-06-12 23:06:47', '2025-06-12 23:06:47'),
(4, 2, 'size', 'eyJpdiI6InZOWGNmdlJmaFhoZUxSK3VFOExkeHc9PSIsInZhbHVlIjoiMGtqV1VabHNWK2dNbEFWTUFqVHpaUT09IiwibWFjIjoiNTMxNjJiZWFhODk5ZGIzMzcwYWQ4MzNmODI0NzMwOTgxNGFiYTQ3Mzg5M2Y0NGQyNmMyMDQ1OTcxZGNhNWE2NyIsInRhZyI6IiJ9', 1, 2, '2025-06-12 23:06:47', '2025-06-12 23:06:47'),
(5, 3, 'quantity', 'eyJpdiI6Iit3ME50Y2tWSnlFRytIRklTSlZ1c2c9PSIsInZhbHVlIjoiM3g5ZU83TllPajBodVN6cUVVYllTUT09IiwibWFjIjoiMjU0NTliYjNlZmEzNmJjODBhZTQ5NjZhNDZhNGUxNTQxY2M1NzgwOWY1MzI4NDdkZTFjZDY5OTkxM2QwZmVhOSIsInRhZyI6IiJ9', 1, 1, '2025-06-12 23:06:47', '2025-06-12 23:06:47');

-- --------------------------------------------------------

--
-- Table structure for table `pqr_8x3m`
--

CREATE TABLE `pqr_8x3m` (
  `k5_id` bigint(20) UNSIGNED NOT NULL,
  `tya_tp` varchar(255) NOT NULL,
  `uio_tt` varchar(255) NOT NULL,
  `asd_msg` text NOT NULL,
  `fgh_ic` varchar(255) DEFAULT NULL,
  `jkl_cl` varchar(255) NOT NULL DEFAULT 'primary',
  `zxc_at` varchar(255) NOT NULL,
  `vbn_aid` bigint(20) UNSIGNED DEFAULT NULL,
  `nmq_am` varchar(255) DEFAULT NULL,
  `wer_uid` bigint(20) UNSIGNED DEFAULT NULL,
  `plm_ut` varchar(255) NOT NULL DEFAULT 'system',
  `sdf_un` varchar(255) DEFAULT NULL,
  `hjk_ue` varchar(255) DEFAULT NULL,
  `lop_md` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `kiu_ir` tinyint(1) NOT NULL DEFAULT 0,
  `yhn_ra` timestamp NULL DEFAULT NULL,
  `ujm_ca` timestamp NULL DEFAULT NULL,
  `bnm_ua` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pqr_8x3m`
--

INSERT INTO `pqr_8x3m` (`k5_id`, `tya_tp`, `uio_tt`, `asd_msg`, `fgh_ic`, `jkl_cl`, `zxc_at`, `vbn_aid`, `nmq_am`, `wer_uid`, `plm_ut`, `sdf_un`, `hjk_ue`, `lop_md`, `kiu_ir`, `yhn_ra`, `ujm_ca`, `bnm_ua`) VALUES
(1, 'login', 'eyJpdiI6IjVRZ2RMQXdmeXRBZ3lhWjNQdUpWSVE9PSIsInZhbHVlIjoib2dhenBOdmxuUkh6Y3RNZFJaRmNOdz09IiwibWFjIjoiYjcyM2QxOTBjNGExNzhlODFjZWQxNWVhNzA5Yzg0MmQ1Y2U0NGU5ZTliZWI1ODczZGY3OWRiZTUzMDc5ZjcyOCIsInRhZyI6IiJ9', 'eyJpdiI6IlNyVEYzY1BOc00wTlN5ZGIzL1QvMEE9PSIsInZhbHVlIjoiS282aGp2NElJZFQxdFcvVGZXVXhjbUhMcWZBY0Y1ZWZqMjVING1pK0E2Sjg5bi9jdHoxZDNsQkQwdHlML3FnNiIsIm1hYyI6IjBjZTgwZDhhNmMyNGU4NmJmNTkwOTAxMjY1Yjc3OTA1Yzg0OGY5ZjlmODQxZjdhNTEyOTIzY2RkMmNlY2Y1MmEiLCJ0YWciOiIifQ==', 'eyJpdiI6IlBjSnRnTHJlNktTN3dMa3M0YytLRmc9PSIsInZhbHVlIjoiRzY3THNya3BFbC9VcW9KOXdZb3FuZz09IiwibWFjIjoiMDlhMDE2YmZiN2VhMjY2MTM4N2ZjMDY3OWUyMDgwYjM2ZmZiYjdlYzhmYzUzYzcyM2YyZWJlYzYyNmU2M2Q5ZiIsInRhZyI6IiJ9', 'eyJpdiI6ImxFSkYrRlV1Um94dFU2Z0NsUE5zZkE9PSIsInZhbHVlIjoiK01PN3d2ZmFGZ0k3UlVTZEVuQTZFQT09IiwibWFjIjoiMTlhNGU0ODQ3N2FkNzZkNjdiOGRmMmM3ZTkxMDYyMDAwMTEyNDhjODM3YWE0NTA5OTdmZGZlMTk2N2FlMWNiYiIsInRhZyI6IiJ9', 'eyJpdiI6ImVoV2lWZjhWMjZMZjd1NUh2VHdYNHc9PSIsInZhbHVlIjoiTUZ3OUxkTkV6dmFhVnovdHoxR2F5dz09IiwibWFjIjoiM2MyZWMwMWU5ZDc5YTIxNDkwZmMwZjkzNWFhNGYyNzQ1M2JiYzNlOTMzZjA5NWNhNzk1OWIyMWQ1ZWE3ZWFiYiIsInRhZyI6IiJ9', NULL, NULL, 1, 'eyJpdiI6Ik1SU2d0dlZlUU5xWVdGYyszRkdjSXc9PSIsInZhbHVlIjoieG1aVkk1TUpBUFozRGttUGlqNytFQT09IiwibWFjIjoiZDdlNDc3Yjk3ZjRmZGMzNjc4MWZkYTIzYWMwM2YyMjQzNjk1NzQwNzcwNTI0NGFiYzFmZDE0NzU3ZjQxMDg4MSIsInRhZyI6IiJ9', 'eyJpdiI6InRoblBSbDJmOFhNTnRMZDEvWm51dHc9PSIsInZhbHVlIjoia1hPblpuSEdpQyttVmhaNkIvOFpoQT09IiwibWFjIjoiMjkxMjZkOWE3MzQzMDI1YWY3ZWI5NGZhZWQwNmQ0MDU3MDhkNWQ0ZTE2N2I2OWIzN2JjNTU4ZTk4YjFiNDQxYiIsInRhZyI6IiJ9', 'eyJpdiI6IktRRm04U1lFa0x3S2pnSnJzYlVxcFE9PSIsInZhbHVlIjoiWWU1ZWxhaW11NzNPK05xMHd3bkRuM3d1c2tCdjZCYkYrOGR0NTV3VzE2ND0iLCJtYWMiOiI2MTJiNWZjZGMyNmM4YjdkODQ4NDU4NTljN2IzZGFhZThiZjExMTNlZGM5MTViZmFkNWQ1YzgxNjBmZTlkMzdiIiwidGFnIjoiIn0=', NULL, 1, '2026-02-03 06:45:04', '2025-06-16 11:34:53', '2026-02-03 22:39:53'),
(2, 'create', 'eyJpdiI6Ii9NQUJrUTNNdEtlaWVzbDd0bzh0eXc9PSIsInZhbHVlIjoibDV5UEZWZkZmWjhrdVVYZlZkQXFZRGQ4ZkVFVlBxdU1QdS9ScHZvWVNUWT0iLCJtYWMiOiJkMzdlMDc0ZTkyMTU5ZmFmZTRkMDIxNWMyZmI1YjAwN2E5M2Q4ODg0NjI1Yzk5OWQzNzVjMDRiMjBhNTIwOTg3IiwidGFnIjoiIn0=', 'eyJpdiI6IkRxRUJ5d0pkVFJ3YXF1a010YkZRL1E9PSIsInZhbHVlIjoiV1FLVythTklseFB0ZzhqMGRzcENIT1BMZElwUktPdHZCYXkyVHlWTGdPMzZibUVHd2FzMU9MTG9VUUp1ZTR0VUV1Y0xjUmpxOVdOblhaRWU4QkI3aEE9PSIsIm1hYyI6ImIwYWQzZGY2ODI3MGMxYzZjM2QwN2JkNDE2NmJhMzZmNjkyNWE2ZmQ1ZmE5MWU2ZGI5ZTQ0YWNlMDFhZDJhOTIiLCJ0YWciOiIifQ==', 'eyJpdiI6Ijhad1g0ajNvcGl4VkIwbUdaVUFIT3c9PSIsInZhbHVlIjoiSDFTRzkwdVVwTkx4TmNTWi9JRXRnSVRuWVlGUU9mdlF6dVlUc3IweUM2ST0iLCJtYWMiOiIzZTg0NGY5ZDAzZDZiYTBjMjFmMzI2ZTI5MTQxMDIxZDBlN2ZmMjcyMWNhZDBmOTk3NzdkMGZhYTYzZjUwOWUwIiwidGFnIjoiIn0=', 'eyJpdiI6IjRZNzRyUDhsU241cVhnb3BORW5kc1E9PSIsInZhbHVlIjoiVEZHVVJ2UExabGp2RUs2UnN6aDdVZz09IiwibWFjIjoiMmJmYWY2M2Q5YzQ2OWE4MGVlY2M2YWRlODc1M2VmN2QxMDY5Y2M0ZWVlZDdhZjcxOTRkMGFiN2NlZmViNTg0NSIsInRhZyI6IiJ9', 'eyJpdiI6IjFsQ3NLSFk1VEJiUVJJSFZDQ0VnY2c9PSIsInZhbHVlIjoidGE2UGFLZnphSnJvQmszRytKVnJBdz09IiwibWFjIjoiOTdkNDQ0ZGI1YWYwOTA4ZmVmMDA0ZmM5ZjYyMTdkYzg1NDVlZDg5MWM2NjlkNmFlMmI3NzJkNDhiNDNlZTdiOSIsInRhZyI6IiJ9', 1, NULL, 1, 'eyJpdiI6IlJiRElraDR6ZGVnbHBGaUpsS0t6RlE9PSIsInZhbHVlIjoiQkE5Mlc5b3hCdEZRUG13NDVBNTkzdz09IiwibWFjIjoiYjdiNjFjNTUxOGU5OGExNjVmN2FhNDk4NDQ5MjQ0OWE5ZGNiMGJmMmU0MjFlNDViOTZmNTg2M2Y4ZThiMGZmZCIsInRhZyI6IiJ9', 'eyJpdiI6InMreXUyODYzb3ArR0duZ2owdXpUZGc9PSIsInZhbHVlIjoiaW5ObWptbU85T0RDSTcyQWVPY1BQQT09IiwibWFjIjoiNTAxY2E3YzVhNmE0ZmU2NTFjYmViMzRjNzg2OWY3ODBkZWZjYWQ5OTBhMDc2YTEzZWQ4MTk2ZTVhZTI0ZTA4MyIsInRhZyI6IiJ9', 'eyJpdiI6Ik1JUmNva2NuM2E1elFKb1ZzK1dUZUE9PSIsInZhbHVlIjoic2JsY21RV0RJOTI1bC9QaWNuVDB6dFU3ZFVyS1BmSzVDZGExcjZGT1Zzcz0iLCJtYWMiOiI5MmI5Y2M3MmQ4ZDBhZGYxMTM1NmZhNzdjNWQ5OGE4MjAzMzU3NTUzNThiZjhmMWJmZDUzNDNiYjNjY2ZkMDNiIiwidGFnIjoiIn0=', 'eyJpdiI6IlVJbUZPQitlTjdXSWNEY2FkYUllVUE9PSIsInZhbHVlIjoiS2dnM1h0SFpaOVJXVzNRRmpXQkhQcFMySnhVbWlCenZJRjd6elJCL21SZEhTZ3V4UTdVMGVwcXNrK1BEd0R4RkdtVHV1MGI1VFdhdnJlb0tHZllrenRLNkhpUGJJanJNRjV3STBtNzRQSTA9IiwibWFjIjoiODBkYjA4MTQ0MjE2NjM2ZmFlZWNhZTY5ZTc3OWQ4NDYyNTU4NmJmMmRlZmJmODU4OGM1YTZkMzQxOTg5YTlhNyIsInRhZyI6IiJ9', 1, '2026-02-03 06:45:04', '2025-06-16 11:29:53', '2026-02-03 22:39:53'),
(3, 'update', 'eyJpdiI6ImtSUzhLTHFoTHJBWTZhcm01L0poemc9PSIsInZhbHVlIjoic01SRTFQRU5RSHJENkhNdGsxaHF2VlhqTnQrblZYOE8zNjVrZDV6R1gxZz0iLCJtYWMiOiI2OTk3MDk0MDFlYzJlOWU5M2JhN2FiNDhjMzRhYTM1ZjJjZTFiM2UwMjkwMGFlMWJlODZmMTdjOGRlZjdlOTZmIiwidGFnIjoiIn0=', 'eyJpdiI6IkIzRGloZGY5bk5xa1FkeFRJNis5VHc9PSIsInZhbHVlIjoiWVY4WXpaMjMyL3pZcXYxNXBucXlSQ0dRVjRPZTB2eWpLeVArR3VlSlNJLzJtR0xJK2NhVEtackVxUE45TDc5UWpRWVBmNFBQS3M2L0J4dTIyUE50U0E9PSIsIm1hYyI6ImI4ZmEyY2ViOGEwNjBiZGE4YzVhNDM3Y2U3YTk2MTA0NWM4ZThhOWQ0YWMyNTljZmM3Y2M2NzIyZDNhMTFiNzkiLCJ0YWciOiIifQ==', 'eyJpdiI6Imk5RW9UcXZYYTRXdU8xYjVqcEs3RWc9PSIsInZhbHVlIjoiSTFlNEUwMm94NE9qcW5VYU5QemRVUT09IiwibWFjIjoiN2VkY2NiOTU5NGIwYzNjMDBjZDFlNDI1MzFlOGQyNGFkMzVlOWMzMmMzYzhmYTU3ZjQ2NDU2YmQ2ZGFlYTc0ZiIsInRhZyI6IiJ9', 'eyJpdiI6IjhWVUF0aHJubkpEdERmb1ZuKzIzRFE9PSIsInZhbHVlIjoiNmNFWVNadzhVcG8vN25FWjdLMFVZUT09IiwibWFjIjoiZTM1YWEzY2UyYzQxMDMyYWJkZjUwOTFmOWQ3MzBjMjM5NWNhNGUwZjJlNmIxMDY2MTVkYjVkMDkwNDg5N2Y1YiIsInRhZyI6IiJ9', 'eyJpdiI6Ino4Q1FyVml0WHhmRHBFbGQxR3V0WFE9PSIsInZhbHVlIjoiYTY2NlJKLzNJRW5UUTNOL0FnL09zZz09IiwibWFjIjoiZjNkZTMzMzA4YTcxN2RmOWNhZjgzYmExM2I0YWYyYmZiODMzYzE1MjJjM2IyM2U4ODc1YTVlYTVjMWEzMjc5MSIsInRhZyI6IiJ9', 2, NULL, 1, 'eyJpdiI6IkNiNjJSNmVzQ3haSm1UaGxQanRtNFE9PSIsInZhbHVlIjoiOEp1ZnRBOWh3OXZsV2UwN0NEd25ZUT09IiwibWFjIjoiYmM2Zjc1MjU3NTc4YzdhMjkxNjRmZDZlNjdkZWE0YTQyOTMzOTU2NzkwMjM2OGI5MWMzNmIwNDMxMmIwYTg1NCIsInRhZyI6IiJ9', 'eyJpdiI6IlJ6NUZ6Q3RlMWNydXZKb1hDK3dpa2c9PSIsInZhbHVlIjoieTRma0lyVEh5OEgyYTJPUFppQ3FaQT09IiwibWFjIjoiZjFhM2NiOGFmODE1NDc4NmU4ZWNmOGNmNDUwODQ5ODQ4NTUxNjdmNzlkY2VlNzY2Njg5MDBlNmY3MzhhYTcwZiIsInRhZyI6IiJ9', 'eyJpdiI6Imc1SmdGUVRON1BicjVVbmIrUU1OWXc9PSIsInZhbHVlIjoiY3NYbTg2clJTRkttMDVjSXh6a0Y2aldTSnYvekEyL2FES2xnTTF2Zmp1Zz0iLCJtYWMiOiI3NWI4Nzk1ZDllMDA2NTRlNDc4NTYyODEwM2ZhYTQxNzQzY2U2MTgyYjA4OWI3M2Q3ZDA4YzFhOTljMGEyMjg2IiwidGFnIjoiIn0=', 'eyJpdiI6IkEvUXZIVFRKWWxUVmJkaXRMV1BzaEE9PSIsInZhbHVlIjoid2xyN3JzdXMveU9wbHZySEdITTRGRE9QVDF4aDVDQmVYOTRMQXJ1ZnRWVUh2SEk3d0N0L0R3ZU1sRUszK0htdzBWd0NHN0gzSTh1YXkzYUplYzlZNHp1bXFjWGtmeEtFdGJtSTBzVG90RVYzUzlsMUZwMUw5dU0wc1FUOHpwWTYiLCJtYWMiOiI0ZmVkOWEwMTZkZTNkNDhiMDBjMTYzMWY4MTFmZGUwODcyNzg3MDIwZjEzZDcyNjUxNDlmNzM2ZDIyZjRkN2MzIiwidGFnIjoiIn0=', 1, '2026-02-03 06:45:04', '2025-06-16 11:24:53', '2026-02-03 22:39:53'),
(4, 'delete', 'eyJpdiI6IjNkQVlpSWE0dkhsdFZ4N2pNSm1KUWc9PSIsInZhbHVlIjoiRUlPZDYwUm4wSHZyU0xNRWZBSFZoSk85bk8vaGtNV2F4STBuVkU4NUsyST0iLCJtYWMiOiIzZThiNjg3YWRkYWJhNzRlMzc1YzNhYmFmYmI1YjExZDc4MmEwZjExYjI5ZGZjNWYwY2M2YWM5YjA0N2EzZWJlIiwidGFnIjoiIn0=', 'eyJpdiI6Ii8wS3kzMUxIdUZOZllTeTVZNFhPUUE9PSIsInZhbHVlIjoiL09CNGVidk9JTnJjK2tlVldRQjhxL0VaRlc1anl3bDFxdndUTHRqbTRZS2FuNmdtOG9FV1FjMlFiWFp5T2IreW5GdGRhSVpWTy9RTk8xQ1pZcnlJMFE9PSIsIm1hYyI6ImM3MDdhOTc2YzJlOGVkZTZmOWYxMmQ1OWY2MGM0ZjhmNjEwN2U3MWQzNjQ2OGU1MzU4NGI1YWZlNGNlNmZmODgiLCJ0YWciOiIifQ==', 'eyJpdiI6IjhQaURvdzMzbG5zQkx4c2tuakc0K1E9PSIsInZhbHVlIjoiUENkM3ZKVkQyNTlDQXM0UUpFMUtzQT09IiwibWFjIjoiM2FmYjcyNDhmOTY2YTcwMTY3NjBiNzBmOWFiY2E3ZWM0YjI5NjM2NTgyOGQ5ZGRlZDIxNTA2ZmVmZjhmMDBiNSIsInRhZyI6IiJ9', 'eyJpdiI6IjlRcnphSHcxS0E5TnVFUnpMa0RNV0E9PSIsInZhbHVlIjoiWllzQnBBanlTU0NtazU0L0xkaXJtdz09IiwibWFjIjoiYmY4MDliNDI1ZWZlNDNjYjMwNTMwMWYzOGE1ZTRkYjZhY2UzODVmNjAxNzk4OTdhMTRlYWY5MGE2NTRlZjE5OCIsInRhZyI6IiJ9', 'eyJpdiI6IkRkRVlZanV4emYyQmJpUHJ3VWs0ekE9PSIsInZhbHVlIjoiay9PREV0dk8zU0xub0ZFeU5YUkx6QT09IiwibWFjIjoiNDNiZTY2N2MwOGQyZjI5ZjBhZTY0NDEwOWI4ZDg5YmYyMjUwNTcxYmM1YjQwNjc5NTIxNjNjNjk0YzVhZmU4NyIsInRhZyI6IiJ9', NULL, NULL, 1, 'eyJpdiI6Ik1kdnBYY2ZzaHRXWE0zRGpKaGF6Umc9PSIsInZhbHVlIjoiQ1pBU0cxNmVmbFdGWFZDRkI2UWR4dz09IiwibWFjIjoiOWIxOWNjNTVmMGFjYmUyNzM2ZTI4OTQzMzNjNGQzZjQ5MWNjNzM0ZDliZDE5YjFlNGNlZDE3OTViM2ExMjQzNiIsInRhZyI6IiJ9', 'eyJpdiI6IjJHZVJPVUJFejgreklWUEtmOXNTVUE9PSIsInZhbHVlIjoiUFprVnRBTEtkQjJrbDVZdnZlNWc2dz09IiwibWFjIjoiNjRkOWZkMDIxMTA4MTNhMTdkYjNjZWM0OGZhODVkMzE2ZTRlMWU4MDA5NWY0NDViYzQ5NTBhZDczZjQ2NTRiMyIsInRhZyI6IiJ9', 'eyJpdiI6IlNWZU9WL2I4WUVXSTZqaTlVU3NBa1E9PSIsInZhbHVlIjoiODNEeEU1dHF5V2hrbUtiVFNORjRubHprUkRkb1p6RDBzVE5MUnZhSmJPYz0iLCJtYWMiOiIwZjRmY2Y5MzdkOTU2N2I3MDg1MmQ5NGNmZTRlMDNkYjRhODJjZjNkZTMzYmJmOWU4ODRiNDM5NjUzOTdiOWI0IiwidGFnIjoiIn0=', 'eyJpdiI6IjVlbVhpUklOUUVlUU1UT1VMWnRWS1E9PSIsInZhbHVlIjoiblNxcUF4bHhjYXVieWN1VDZjVG9UMzlleGJZNHZvMUVZY0cvKzdna3F3dFJ1MUk5RTNQZHNJaEVUb3Z4aFRaa1RhZ2FSdzhPS1U1blBIV2kya2hiMEhiQW9pdkw1eXFGS1p1N3VxeFJISUk9IiwibWFjIjoiMjQ4MTdjZTJlYzNkMWQ0Zjc5NzU5NTYyNTViMTRkNGQ4ZDJmYzhmMzhjOGUzMDQ5ZmI1NzUxNTM4YTg0ZGZkYiIsInRhZyI6IiJ9', 1, '2026-02-03 06:45:04', '2025-06-16 11:19:53', '2026-02-03 22:39:53'),
(5, 'create', 'eyJpdiI6IitVWGxEZ29BOTVIbGN4V1JLbklUNUE9PSIsInZhbHVlIjoiZGFrUEh2d2JPT1lucC9VTnp4eWRpVjZwY2Nxdks5R3QwbTdiSVNDRDdIST0iLCJtYWMiOiIzZjA0MGY0MDJhY2JmN2EyOTBhNzU1ZWY2MWM0NDFjOWNhMmNjZmI0MDlmY2UzMTZhMWY3ZDNiZWNkNDUzNTUyIiwidGFnIjoiIn0=', 'eyJpdiI6IndzdVhGUFJ6UExBZm1ER0o2dEM0YUE9PSIsInZhbHVlIjoiZ1pUZ1kyaXdOVFZ5Z3JoMnp5cW95TUJhSmhJYWlEemduREdJdFIwdHdyRjZ5MjBvaDJsbEdJVDh3M3hab3haUSIsIm1hYyI6ImE5YTU5ZDA3NTFkNmM0OGFhNDA3MzUxYWVjNTI2MjFjNGYzMTUxYzljMzk2ZjMyMWUzNjZhYzRmODFkZGFmYzEiLCJ0YWciOiIifQ==', 'eyJpdiI6InIxdTVSUEZ3RHlYYVBUWE5ZcEtsNFE9PSIsInZhbHVlIjoiRG9iWVNRYUsyNnVuTTF6UUVkemw0dz09IiwibWFjIjoiZjlkZmZlNzcwNjY2ZGE2ZjBkOGI3NjczOGI2NDNhMmY0ZDRmYjQ2M2Y2ODI5MGE2YWRiNmE2NjJlZTZiMTY3NiIsInRhZyI6IiJ9', 'eyJpdiI6Im9jdy9VdHBMeWZuUXZJWU5hZXdLb0E9PSIsInZhbHVlIjoibEJzYVZFT3JTbSs3NHE0ZU5taXpYZz09IiwibWFjIjoiMTFjYWMwZGVmZGRmNWYyMmIxYzVlODdhMzdlNjBhZmY5NGNmOGRlMzJjNWI5MWVkZGNlYjgyY2U5NzZjMWZhYiIsInRhZyI6IiJ9', 'eyJpdiI6IkRiSThldGNiQjY3M21nRjZhb3dlOGc9PSIsInZhbHVlIjoiVHJNeTNiZS9VaVp1YkJFYVJ0SVQ0dz09IiwibWFjIjoiZDAzMzQyZTQ1Yjc0NTlmMDJkNTcwZDk4Zjk4ZjkwNmY0MWNkYjUyYjUyOGE0Zjg2NDJhYmUxZGVmZDBiZmVmZiIsInRhZyI6IiJ9', 2, NULL, 1, 'eyJpdiI6IjRNWERrcmx3M2x4VDc1WkNqUkFzakE9PSIsInZhbHVlIjoiMExsQllwbzVUQzZWaDZUTDg5Uy9YZz09IiwibWFjIjoiZGNiNmI2ZDU1ZjRjYjA3NDgwZTEwZWMxMGZjMmE5NjQwZTQ3ZTFmMzkyMDZmYzg2MzU4OGU3MDM0OGU1MGE5OSIsInRhZyI6IiJ9', 'eyJpdiI6Im0vaGUyUGZsNFlLU29DQVlaODNwb2c9PSIsInZhbHVlIjoibnI2dTBMeDlOWUt3L1Y1cm1iQVV2dz09IiwibWFjIjoiZjhlZTQwZWRjNTZiZjA5NDM5YTI1ZDdhZjY2ZmJmOTA3N2FkYzUxMDZkY2NhNWJmNmRjMmEyNWUxNTA0MGFjNSIsInRhZyI6IiJ9', 'eyJpdiI6InFlWEJraXhUSzRjUTN0MmJhUkNwM2c9PSIsInZhbHVlIjoiSk1FTGZzRFYrUE41a2tSaHdIMC93OXVCV2duS2xIRkhBQ0J1eXNiVEptQT0iLCJtYWMiOiJmNWViNDcxNTU3MmM5MjMwMDExYWI4MjkyNzdjNDVlMzk3MjE2NGZlYTM5MTAyNzQ5ZTc2YjA5MWMwN2M2MjRiIiwidGFnIjoiIn0=', 'eyJpdiI6ImRYam5yYmh5YXc0dENvSzM1OWVTY0E9PSIsInZhbHVlIjoiZHlzQkpJbStDRlJNUnk5R3U1ZjVkY1B6NFo0Q0dPNTk2RGcvSUFrc3BUR2pzQWRlZ2NBcTRwaFVCRXBDcXU3UmJOQzBieXZoU1poOFNvSURaVE1sMXc9PSIsIm1hYyI6IjBlMDE5Y2UyOTE5NzVkNzlmMWIyYWJmNzg2MDQxMDJkZmZlMjNhODFmZDc0NjM1ZWY2NThiNWE1ZDY2YTIyMzEiLCJ0YWciOiIifQ==', 1, '2026-02-03 06:45:04', '2025-06-16 10:39:53', '2026-02-03 22:39:53'),
(6, 'system', 'eyJpdiI6IkZxRjJJN29kbDViUVI5bU8xQ3A5R3c9PSIsInZhbHVlIjoiOENEZDlwVnJvUkExWFJIS2RQbjRyRmlqT01ndGowdHczSHRNWCtnN1dIRT0iLCJtYWMiOiI5NzUyNjU3NjY4ZDJjOTUxMDFmMmViMjAzY2M4MDFjNGM1NGRkN2E2ODdlNzBiNjY4ZDMzMWVlM2JhMWVjMjNjIiwidGFnIjoiIn0=', 'eyJpdiI6Ik1xaFZuNVBIRjBEZUdKOFhORXliNVE9PSIsInZhbHVlIjoiNDgzbm5yUHN5MHcxSXp2RkdyWFhUT21SOGpHWGg3R2R2aFU5cnhIaFpBbmNYMnRxcUVLS1lMb2R1RDh2b1ZTKyIsIm1hYyI6IjVlZTNjNmVmNzI1YzA3ZGFiZThhYjBiMzhiY2IwY2JjNjdmYjZmZjUzMmZjYTg2ZmIwNmQ2MjA4NjM2ZDg5MmMiLCJ0YWciOiIifQ==', 'eyJpdiI6IkI3ZzNFdEVBKzcyYW9kVWdjQzZoM3c9PSIsInZhbHVlIjoiMXIyVUdsN1RramFUL1l4ck5JWEcwUT09IiwibWFjIjoiZjZlNzAyODUyZWYyMDFjZWE3ZGNkOTY0NmEzNWUyMjM1ZjgxNjFlNjIxMjQ1YTJiNmQ4ODU0ZDZlN2UwYTFiZCIsInRhZyI6IiJ9', 'eyJpdiI6IjNVVnIrbmJIbk5FUFFzOE5nQ3RjYWc9PSIsInZhbHVlIjoiUXdpM0RYWEF4a3ByWEd0SnI0emtPQT09IiwibWFjIjoiNGY5OTBlNDBhOTYxMTNmZWRiMzk3MmRjMTk0YWYwNDcwZTY1YjU4MmQ1ZjYxOWIzN2UwMjNlMWJiYzZlMGYwZiIsInRhZyI6IiJ9', 'eyJpdiI6Ik1WRGk4bmZzQWhlWWVWbk5tVDAzWUE9PSIsInZhbHVlIjoiQzhYOEgzVnRqa1dMalRQWWMyalNSQT09IiwibWFjIjoiN2FmOTYxM2FkYjBhNWRjYmZkM2MyM2Q5MzIwYzg2ODQ4NzI3YTY2YWIzZDIyOWIyMTNhM2VhZGQ0ODBkNTkxNCIsInRhZyI6IiJ9', NULL, NULL, NULL, 'eyJpdiI6InYzM0dxU3diTWlpbHVTRlowRzZ1U2c9PSIsInZhbHVlIjoieVBKbHVrcm9laDZxbDhwcWN2dGxYQT09IiwibWFjIjoiZDVkMjg1ZmY3ZGYzNjFjZmE5YjFkZWM0YTU0NWVkZDc2OGZiNTdiNjA4N2JmYjM5NzlmZGM4MGEwNDIzMzFiMCIsInRhZyI6IiJ9', 'eyJpdiI6ImxrT3BYazdId0R2WXk0RlRwN1dNQVE9PSIsInZhbHVlIjoiWHNQOHAvMmtOMktLOGduaXR1RkhpQT09IiwibWFjIjoiNDBjMTAzYjg3NTczODYyNGM4OTZlOWZkOGE0ZTQwMTZkNjRlMDExNDU4MmY4NzgzMTQ3ZjNlN2MzYTYwZDFkMyIsInRhZyI6IiJ9', NULL, NULL, 1, '2026-02-03 06:45:04', '2025-06-16 08:39:53', '2026-02-03 22:39:53'),
(7, 'warning', 'eyJpdiI6IkpzOFZpQkJzaGFtZWUzS01PNHA3Ync9PSIsInZhbHVlIjoiKytYNFlTRGUzcnJwTEd1YVFiT1M4QT09IiwibWFjIjoiN2YwYzVjNDllOGY2MjEyZDBkOGFkMDEwNjA3ODQ5MWQ3NjRiYmZjOWU0ODMyYjBiMGNmNjMxYTRlMjQ1MjYwNSIsInRhZyI6IiJ9', 'eyJpdiI6IlR6eUorc2lYUko0NzFVNW0wRWdCK0E9PSIsInZhbHVlIjoiVHQrZFo1TUg1YVQxcXZTT3h6YThSSzZjMDJ5K0IwTDJMNmhnK3p2RXBERkV0a1R5MG4wZUx4aXd0WDZQYld1SiIsIm1hYyI6IjdlZmJkN2RlNDJjOTBjYzZjMDQwNTgyNTBhYTRhZjJhODY0NzczMWY5YWVkMGU3YzViZjY0MDRjODdkNzE3MTAiLCJ0YWciOiIifQ==', 'eyJpdiI6InFReWRGRTJwYWNsQWN2QnR3RDNrakE9PSIsInZhbHVlIjoiaDRxckF0alFNQUxRVThSTWE5dzB2a0xxZk9uamNReGt3TXFUWWRYeGxpND0iLCJtYWMiOiI2OTRlMjQzZjZiYmE3MGRlY2VjOTZkMGQ3YjQxZjIyYmNkYzg0MWRlMGY2YWE5ZjM1NzlmYmZiZDZiNDYxOTY1IiwidGFnIjoiIn0=', 'eyJpdiI6IjBnQzVzUDFscUlpejF5THNHVmtNN1E9PSIsInZhbHVlIjoiSzZwVjE2Ykx6MnhJMjBrMnJtSytQUT09IiwibWFjIjoiYWNlMjE2YzQ5ZWU1ZmE3NmE2ZjAwNTlmY2I1NDY5MDMxZjFlNzljOTRmNGQwYmEzOGQ3ZjkyZmRlNWFjZGJkMyIsInRhZyI6IiJ9', 'eyJpdiI6IkQvdGg0TURLVGJ3U3NFWmw5cnlKZmc9PSIsInZhbHVlIjoiQ1RmQzVqSHQ4Zmx4dE83SE9Db3hzUT09IiwibWFjIjoiNDc4ZjAxOGRmZTRiY2FkZWY1MzdlNzgwYTlmYTM1ZDhlMDAyMGEzY2JiODMzYjQ0MGYxMTViZjUyOTM1NTdkNCIsInRhZyI6IiJ9', NULL, NULL, NULL, 'eyJpdiI6Ii8wRzg1NHUvNWs2VllSMWlaU1VuQ1E9PSIsInZhbHVlIjoiOFVRSDVIUUFubkRUY0wyRG1XVWd2Zz09IiwibWFjIjoiOWUyNGMwYWEzMGM4NGRiYzUzOWRmYTU2ZWM3YjlkYTBjMWI3YjE0NzI2YTFmZjM3NmNjODU2YzI4YzEyMjNiNSIsInRhZyI6IiJ9', 'eyJpdiI6IjhLL0kwVTNGazc5UnlnYzB5aVFFQ0E9PSIsInZhbHVlIjoianY0L0p3SHlRSy9qVHhwazZqN2I4QT09IiwibWFjIjoiYjJlN2NjNGNjODhkZmEzODAwODAyYzYwODYwYjZiODEwNTc1YjQ5YjU5NWYxNjk5YWEzM2Y5ZGNkZjRiZThhYSIsInRhZyI6IiJ9', NULL, 'eyJpdiI6InkwbkR5NzIzRjgrV2tpL3JiaWpUMkE9PSIsInZhbHVlIjoiSXc5R2RCS3ZEa2hoS3ltT08rRSswZC9aV2xMSzZqZnZOejB1ZGM0c3U0azNVcmRNZFdpbHpYNWNVTVRBR2NseW9Oc08vTWpkV2orbEM0NDZhWSt4ZlE9PSIsIm1hYyI6ImVmOGY4MTkyMTdiNmQyM2RkOTc5ZTViNTcxMjM4NmIwNzZkNTg1YjAwNGRkNWE1ZDk4MGQ0ODcwNTI2YjEzMjQiLCJ0YWciOiIifQ==', 1, '2026-02-03 06:45:04', '2025-06-16 05:39:53', '2026-02-03 22:39:53'),
(8, 'update', 'eyJpdiI6IitVMFNwS3l2bzk2dHJUYnhBMnBKeVE9PSIsInZhbHVlIjoiZDZZUzdKSUZQSXdCUHM2aXpXYzRGQ2N5R0lRYzZrQ1dGYWFUNVR5VmhXND0iLCJtYWMiOiIzNjVlMGIxNTUxOTM1ZGM1MzRhZjI1ZDUwMGM1MDA1MTMwYzkyMGUwOGQ5OGU0YWFhNmIzN2M5MTJmNjhhZWUzIiwidGFnIjoiIn0=', 'eyJpdiI6IlJsQ0VmU1FNRjZFNHp4UXJUZXFEWlE9PSIsInZhbHVlIjoiV1dDQ3oxSjRvU3BqdDgweWFIa3RNTWVzWStMRStUcis1WXhjZG1DNkRuRndYOUE4d1h0Y2Z6Z082M1hXTlM1diIsIm1hYyI6ImE0MDkyYTU0N2QxMTEyYjA4ZTg0YjQ3MjNhNGU4MWQ4MTdkYmViMmRkZmU0NGU1MTMzZDkzZDY0MjRiNGI3OWUiLCJ0YWciOiIifQ==', 'eyJpdiI6IldFbFpaODkwY2VpRXhHSlpFeEJUeXc9PSIsInZhbHVlIjoiZmdCSXN3RUNHQ3QvakJYTWFVWFJkQT09IiwibWFjIjoiYjk5MDA4ZTdmMjZmY2E1MDA0NGUyNzhhZTk4NTk5MmE5ZjZiMmZjYTc3M2YxMThkZWQwZDFhYmZkNjExNzE2MCIsInRhZyI6IiJ9', 'eyJpdiI6IkxDNWVkY1Vhd3RENDlHL2RGZEVtYnc9PSIsInZhbHVlIjoiQldCdC80QW1VRlhLZUtKZzB2YzdtUT09IiwibWFjIjoiYWZjZjUwNGU3MTFiZDg1MWIwMTQ1YmE1NGZkY2FhMTI5NzM1YzdiOTU4YzI1Y2M1YTBlMTMxOGQxYTEzOWVkNiIsInRhZyI6IiJ9', 'eyJpdiI6IkZWbEdlc1Z4dUZWT0cvaGhpOUYrQ1E9PSIsInZhbHVlIjoiTkVDbDFKTWdXMnFEY1dsRFNSMkZGQT09IiwibWFjIjoiMDQ0N2JjZDYzZTFmY2U4NjJhN2ExNDIyZTc5MGFhZTA5ODlkODgxYTkwZjBlMTQ0MjZjZTQ1YTNhOTMyZGVlOCIsInRhZyI6IiJ9', 45, 'eyJpdiI6IlhxellaOGFFN1JabXcvT2NIRThRWkE9PSIsInZhbHVlIjoiMStBcTZvNE5KRXVGaFczWUhOeFRQSDRoOVJRSXRmVWpsK2l5Rkk5OXhsOD0iLCJtYWMiOiJkOWRiNWYzMGE3Y2M5ZjA4NTdhNWY1Zjg3MzhkOTk5NmMwYmE4ZWU5ZDUxMDVlN2YxOTU3ZjVmNWNhYTkxNzk3IiwidGFnIjoiIn0=', 1, 'eyJpdiI6Ilc5SlEvUytzdmt5NWl5clZsQXhyb0E9PSIsInZhbHVlIjoieThpWS9SWXVTR0ZVcGJVekhPTlZWQT09IiwibWFjIjoiN2ZiMTNkNTVlODVjMjRlNDVmNmFlY2I4MmRkMWEyODFlMzMyZTlhMDkyYzZiODk3ODM5MzZmNGNhZmZjZWZmYSIsInRhZyI6IiJ9', 'eyJpdiI6ImV5N09sRjZ3TjlDMDMxQWphaVV3dVE9PSIsInZhbHVlIjoiQmhCdWxVV09SZFVIUEQ4cFpselVVUT09IiwibWFjIjoiNzE5NTIxZWFjYWM4NzUyYzRhZTcxMmQwMjA1YWEzODRiNGE5YzkxNjk4ODE1MTc5NzU2YjExNzA5NzI3ZGI5NCIsInRhZyI6IiJ9', 'eyJpdiI6InpvTUhjZ0FoNFZxdCtNbGpFQ1J3Tmc9PSIsInZhbHVlIjoieGdNQTFMS04zYWI4WlIvNitUSHhIdzRSRWJNRWdtVVMySTVDQjBUajFBUT0iLCJtYWMiOiI4NmE4YTAyMDNiYjY1NTUwY2IwYzJiZTNmNmRlZmY1MzIyZWM3MTI5ZTZiNzkzMjU3YzM1MjJiNTc4OWQzMGEzIiwidGFnIjoiIn0=', 'eyJpdiI6InBJdmpsNGppc0pYcmFmT3pLaXh0WUE9PSIsInZhbHVlIjoidGVpUlBPWThneU54TXBYN2IrM1ZoMG9OR1lzQ09YR2ExLzNhNjhiRzc3Zml1NUwvdXFXM3FWZVl0OEgwazNwcTBmY213WjVzbzdzTHdmN3lHWE5aWnpUSGdBbEdHU0dnUlhXcHlYb2l4aWdqWnNEc1laWCs5WnNtTTNVVTRsVVVCZ2FBMzBiVGVNRy8zOG1ISitONExaVUh6ZjFVUXJ1R0ZVaSt6NkdOWnRpUnlHbllaQmVoN0hzZWZzclZzSlRDaTFOVGk5M0xBb1RXT3A0VTVMTFAzUlJTRUdTWWNtR1VGaE5iaHZCVUVQUEMwT3VoZ0JNR2txOGJ3b21KNStEZWgxWE50TGxyUzdTdmVub2lxd0xZNGIweUhKcDNmbE1qMjZVU2VTd2RYOFZTUjdvc3c2dHZ3VE1yR0YrVG9xRU1XaEdsZ2lid3Qza3lQSXFRK0VTd3FuOXJUMFIwQVl1eTU0YStNeTZ6YmZJPSIsIm1hYyI6IjRkMWFiZjMxYTljOTY2NjQ4MjE0MWIxNDE2NmY4NThjMjc4OTMzODZmZTlhYTAyOTVlM2Y3NjMxOTkwOGRmNjgiLCJ0YWciOiIifQ==', 1, '2026-02-03 06:45:04', '2025-06-16 11:40:51', '2026-02-03 22:39:53'),
(9, 'login', 'eyJpdiI6ImlWOW9SYUh3ZFBjZm1tZXM5RHg1TVE9PSIsInZhbHVlIjoiT3FMaU1yZ1oxZStpVjFEV00wdkNrUT09IiwibWFjIjoiYjJkYjkxNTI4ZjM5MWM4M2QyOTA3Yzk5YWY0Y2IwNTZhYTE0M2E1N2I3ZTkxNWE4MTU3ZjBiMGY0YjE0YzgwNiIsInRhZyI6IiJ9', 'eyJpdiI6ImlTL2wzRnNjSHQrUm9yWWZuQzIwWXc9PSIsInZhbHVlIjoiZVZ4b1JrOUl0MnBGYkZweVBuL3BEOE1rOHVIYVNzN2ZPODkrNHRVcTVhcWpPU0pWc1JDdzVvZzN2QjR6dHFOQSIsIm1hYyI6IjFjNDE3MDRhNmJiN2YwYjkzMGIyMDBkYTFmMGExMGE5MTJlZGU3Zjk1ZWNiNmMxYTA3YTkyODBlM2I0YjQyMzUiLCJ0YWciOiIifQ==', 'eyJpdiI6IktVbTFkWm51d0FsQUNWYWM3dFVmZmc9PSIsInZhbHVlIjoiSFNCcU5xeCtsWGdnQ21Zb25HV0V2Zz09IiwibWFjIjoiMTJjM2QzYTU0NDZkMjUxNTRiYzcyMDU1Zjk0ZTBlZTVmNWYyY2NjNjg2Yjg0MTc3M2E0OTUyNjRlYzZjNjE4YiIsInRhZyI6IiJ9', 'eyJpdiI6ImFNWEhpTUxPbDNQOWlUZjRTbmNBTlE9PSIsInZhbHVlIjoicXJDY0IwVzhOUVQ5bUdXNkE1czB4dz09IiwibWFjIjoiYzAyNGVkNWIwYWM3OTBjZWE4YWQ0NGY2YjdiZGY4ODE5YjI3MmRjOWE1ZTNlYjk5YTYyZTM2YzNmOTQ5NzhkNCIsInRhZyI6IiJ9', 'eyJpdiI6IjFLa2ZkYUVldWtXWHh4cmt5QSs0aXc9PSIsInZhbHVlIjoiMDFWaHY0TnFISmZ6UGNsSW1jMXUxdz09IiwibWFjIjoiMDk1MWNmNjBmMTFhMmQ1NmE1NTQ2ZTYzNDVlMzkwY2VmZGY5YzAwZTExMTkwZWJjNDViNGZmNjVmZmM1OTYxYSIsInRhZyI6IiJ9', NULL, NULL, 1, 'eyJpdiI6IndoUE52V211YkN4YzFtUjdPR0hmbEE9PSIsInZhbHVlIjoiSFI5ZW5HaXkwanhYRU9GbExwMTh0Zz09IiwibWFjIjoiMmExMTkyM2M1OWRiNDI0YzdlODYxNTBhZDEyNGYwMmE1MWQzM2QzNzNhNGUxYzJkNWNhMmUyM2VmNDFhODRiNSIsInRhZyI6IiJ9', 'eyJpdiI6InVQQ01aY1lQbVQrT1hobDQ4WkVvZnc9PSIsInZhbHVlIjoia1lUUzBRWWZkc0xPOTBTQlo0NGx2Zz09IiwibWFjIjoiZDkyMzMzZjliMGU3YzExZTI4YmMyYzM4MzFlMDI4NDFkZTU4ODU4ZTE2NDYyMjY3MDYwNWMxMGE0MjdlMzVhZCIsInRhZyI6IiJ9', 'eyJpdiI6IlBrZWY5Y0NtZEY1Skp2WGRCY0dtNGc9PSIsInZhbHVlIjoiM0xKNFJRdTZJbDQrNTI0bnF3MGR3bERCclJ5RXFUblhnRE8wSHAySlBkRT0iLCJtYWMiOiI2ZGExYzlkYzNlNjU5MDBjMDlhNjY4N2Y2MzkyYzg1YWM4Y2M3ZGE2Y2U2OGE4MzE5MjVkZWYxY2JiN2IzNjI2IiwidGFnIjoiIn0=', 'eyJpdiI6ImE1Ti9yUXdXVVYxbkRWTDJMSWJ3OEE9PSIsInZhbHVlIjoiWHY2L1NRY3AxWWtaV1FNZjFUajY1TUsvUzh6VmpUUEV5eisraGNseXc3eUl3QWVlQnJCQTFaMWpKdTdBL0h0WUx4bG1BQkNITnFNM0lCQ0d2aEN6ek1yaDl5ZDFsVnVZT09mZHE2dXY3UHhIUkpnc2FUSysvNEYwbEQzVGMxbHhra0VNOXZCa3huY3dhdkIxWFljWHVOaFNaWWJ1SlZJek5YeU02aCtHdWgwVERGMjhscm8yMjN1blc2c2cvM01jQmJwQ0t6VUJLeXlkd3pWZXRLZmRiK1N0NHdqaFNlQUhWSzJlOXJFMzYzTkdrMFBHandjQVZOUjR5bi80VzEzakdWdzQ3Z21lSlZSYnlpODBlNlVHRHg4MVJUNmdIMjRGS21lN0svbVB4MThSWGZqNGpHTEltSENjWmgvam05NDMiLCJtYWMiOiJhYjg2Y2Y3OTRlMWQ0NjJkZmNmMmJlZGQ2YTZlYzA0NzQ2ZmY5ZDAxNDdhZDVjNTJiZTBlM2JkNzhiZDdjZWY0IiwidGFnIjoiIn0=', 1, '2025-06-16 15:49:34', '2025-06-16 15:18:39', '2026-02-03 22:39:53'),
(10, 'system', 'eyJpdiI6IlFDVmR5aGE5aWgrU1c2VU4xZ0QvTnc9PSIsInZhbHVlIjoickk0Ni94RmE2UUFwSDlwMG5VaTZZZHEvUW44aXFpWHpZcHV5L0hza2xMQT0iLCJtYWMiOiJkY2VlYjdiZjUyNGIxYjVmOWI1NWYwNzY3MzQzMDM1ZGZlNTkxNmVjMWI5ZjI4ZjI3YTA3M2E3ZjY4ZmQyYTFkIiwidGFnIjoiIn0=', 'eyJpdiI6IlVnNzVuRGlsSkVNblFDVUhlSWFJZEE9PSIsInZhbHVlIjoiZHppWnROeit1YlYwN2lReEp5eVgyUXdZcy9Mdm1vTXZ6bysyRE40Q2QvR29ETU9HQTFBM2o0cVpJZmdUNzZCYTIyNG5KcXVYS1dyNVFzSFpkOTljalE9PSIsIm1hYyI6ImZjMDUyNjYzOTJjODg1MTE1ZjQzYjcxMjMxYTg3NTAxMDg4ZDRkMDFjYmVlYjE4MWM1YWZmMWI0MGY2NGUwMmUiLCJ0YWciOiIifQ==', 'eyJpdiI6Im9uRVhDZDgwejdjbXlQMFUveWJacFE9PSIsInZhbHVlIjoiNFY3bmNwVGlacGxIem5jQ215VU1ucXd0VnZzTlBXdGJBNkJqVXZiM1FwYz0iLCJtYWMiOiIyZmFjZDc5OWVkMjE2MzE5OTQzZjQwZGYyNzAxOTVmNWI1NDQ5YjFiMDI5MzNkNTFhY2RhMGI0NTM1ZmE0NzE2IiwidGFnIjoiIn0=', 'eyJpdiI6InFEZFNGTTFmbGl4djZxdGxNMHdYOVE9PSIsInZhbHVlIjoiR1FTYTVTb2ozSDFWYzFRY1ptTkVnUT09IiwibWFjIjoiZDUzMzY3ODE2YWEzYjVlYTQ2MTk1ZWRjODFjZWFlNWE4NmNkOTFmNGVmMThkMzkxOGVhYzgwY2M1NjNlMjU0YyIsInRhZyI6IiJ9', 'eyJpdiI6Ii9YRTI1R0lXOFdZYk1YZ2tzVHp4MWc9PSIsInZhbHVlIjoiblBQN2k1cTRUY3JpeWwrcFRwL0JkZz09IiwibWFjIjoiNTFjMGVjZWFmZTk0M2QxMWE3ZDQ3NTczMzBhMmUwYTVjYzliMTM4YzE3NDI5NDRmOWRjYjgxNzNkNTYwMzQyMiIsInRhZyI6IiJ9', NULL, NULL, NULL, 'eyJpdiI6ImxNOVZWMFRzeDBNamJ4dkhGalZDenc9PSIsInZhbHVlIjoiOTJSZWloVUtUbWVOcmdRL2VXOG5KUT09IiwibWFjIjoiOTE5YjRmY2U3YzZmMzU1ZTQ3MGU3MzEzMDM0ZTZhN2U0MWU1OTYwMDczMWJiZDJiMzE3ZmY5YTNhMDQwZWY3YiIsInRhZyI6IiJ9', 'eyJpdiI6ImhvbkZaQVBDSVV1YWx1SDBZTkFpdmc9PSIsInZhbHVlIjoiMnFyT0RxTUNqdDljNHpiaVlveDhJdz09IiwibWFjIjoiMjhjZTRiMDRmOGY4ZjI0ODA3NGU5Y2M4MzQ0ZWUyMjk0ZjE0ZDQwYzM1ZDEzMDEzNWM5YjhkNDc0YTNkMDRjMyIsInRhZyI6IiJ9', NULL, NULL, 1, '2025-06-16 15:49:34', '2025-06-16 13:31:32', '2026-02-03 22:39:53'),
(11, 'system', 'eyJpdiI6ImlOMnFIRVpIWEpEVmJXK1ZwZGV5S3c9PSIsInZhbHVlIjoib0MzMGNPTDdBdTdjRjZidnJ2NXpReDYzMTEyMzl0RmZwQWJqam9zUUNhcz0iLCJtYWMiOiJmODI1MzRjNDRmYjE4YTdkNmMzZjYxZjI1MjY1Zjk3NzUxM2NmYjc2YWEzZTk2ZTA5MWY5NGRhYzViNmQ3NWM4IiwidGFnIjoiIn0=', 'eyJpdiI6Im5RWmVuZHEyL2xuVnVDbzJBZklMeVE9PSIsInZhbHVlIjoiYmVscVdpWCtJT0srdVRGTy9RaERoWFRTM3lQNVhLSmVZYURxbUhvRmVQRXhjWHlSeWoyT1FEQmtMME5KZG5MNVR6YzQwZGxnVExFaVFnZm1ka0w3Ync9PSIsIm1hYyI6ImUwYWNmOGI0ZWE1ZGQ3NmFhMTNiZjRlZjA1YTVlZTU1YjMyNjY3YmEzOGMwNDhhODE2MGM4YjZiMjE1MzYxMjMiLCJ0YWciOiIifQ==', 'eyJpdiI6ImJIb3JjNGhYQ3lFby85VWh4cXBTeEE9PSIsInZhbHVlIjoiMjN1YWF2Q0dsNzE3NEFIUURvWGgrQT09IiwibWFjIjoiYzNhMDRiZThhZGU4MjQ1ZjFkOGU3MjIzOTQ3ZDE5NDE3Mjg3NDc3MjVmMzEzZGU3MDEwMjk4ZDQxYmJkMTI3NyIsInRhZyI6IiJ9', 'eyJpdiI6IlU4dXgxT2JIWEplNjdad2x2am0xTFE9PSIsInZhbHVlIjoiMHpiRm5EMEJ6OVR6d3pYRElaYXNwdz09IiwibWFjIjoiYjYxMjNmYjcyNDRmNjRkNmE3OWIwOWZhYmJlMzNmMmRiZmMwNGM3MDY1ZTEwNWE4NTEyOTE3OTMzZjY3ZTU2ZCIsInRhZyI6IiJ9', 'eyJpdiI6IkhzMmIyV3F1OUVMckYzUXFmZTMra2c9PSIsInZhbHVlIjoiQWhXRUpldzloc0JocjVmL0o3akt4dz09IiwibWFjIjoiNGIwNzc2NDM4OTVhODQwMDk3M2UxMzZlZjZlYWFmMzJkOTAzNjRjYTQ5MzI3M2Y3ZTJkMDkwNTM0YmE5MTk1ZCIsInRhZyI6IiJ9', NULL, NULL, NULL, 'eyJpdiI6Ijl4encyTHZBVFYwNUZJMGl5SXU3QWc9PSIsInZhbHVlIjoiWGJaRmtycGh3Q1pyYW5mSU5kODBBUT09IiwibWFjIjoiNzViNWFhYjIyM2IyMDhiNzJmOThhZDZiZTJhOWFjOGEwZjc1YmQwZDk5YmNiZDQ3YmUwZjNiNTkwYmU1ZmFlMCIsInRhZyI6IiJ9', 'eyJpdiI6IlVMbTRodzVCTUxSSEFya01WTEN6QXc9PSIsInZhbHVlIjoiaGVlYWxhbVNILys1NUdQcVVvSWxydz09IiwibWFjIjoiOGY2MWM1MmZiOGIyOWYwMjBmOTY2YmVjOTgxY2UyMDFiNzhmZmEyMmQwNjI3MWE0ZTVmMGQxZDNmODQ1Y2YxMCIsInRhZyI6IiJ9', NULL, NULL, 1, '2026-02-03 06:45:04', '2025-06-16 09:31:32', '2026-02-03 22:39:53'),
(12, 'login', 'eyJpdiI6InBiV2FTdkt1MHJ4RTJIT3V0QUt5VVE9PSIsInZhbHVlIjoiWnpVcHVMb0tPM3g1V2xlMzJqQnYrUT09IiwibWFjIjoiYmEwNzJkOGRjMjFjZjZjNDVlMTM5ODM0YzEzYThiMGVhZTEyOTBlMDE0NWJkZmYwMTA0OTg1NWVmMTQ3YzVmMSIsInRhZyI6IiJ9', 'eyJpdiI6ImRsT05SNmN1RWZyZi9ITmhFL2ZPb2c9PSIsInZhbHVlIjoiaDRucnJPZVdaaXM0WnlMQnBvYnBtZG1TbmxqUFFGRGMvalA4VmpZTTdQdExNbE5XTHduUzNNcFFIYk5KK0VUbyIsIm1hYyI6ImUxMGU0MTQxYzNmYmYxZTliODNlYmJlMjM3YzY1ZjRmOGNlZTViMThiMDg2NGU1YjUyNTAwOWMzZmRhMjM1YmMiLCJ0YWciOiIifQ==', 'eyJpdiI6InVoZFloWDlsa2MyNmVnSmhGL2U3cEE9PSIsInZhbHVlIjoiK2JxT2ZPYmNBbVhvc2w2SVJjTVlNUT09IiwibWFjIjoiMDMwMDI5NzZhNDYwZjhkYjY3OTA4OTZjNGY0MTYxMDdhMDRiYmNlNDY2NzMzOGVkNjU4ODY3ZTk3NGI5NGUwZCIsInRhZyI6IiJ9', 'eyJpdiI6Ilc5UEtRV2ZnMGxveGFXQWZGbjFuVmc9PSIsInZhbHVlIjoibmY0emJSMXg4UkhPclNLRHluLzY4dz09IiwibWFjIjoiOWMwZjBkYmVmNWFlNDNmMzdjMGUwN2I0YWYzYWU5N2FkYWM5OWM3NTBhNWZiNGMyY2JhYTQzOTczMjIyMTExYiIsInRhZyI6IiJ9', 'eyJpdiI6Im1WMng2dmdnWTVtajJEZVczNHVKd1E9PSIsInZhbHVlIjoiZGxQbS80Znk4Y3lVYkNVcU5Vc3pPQT09IiwibWFjIjoiOTMzNTIwMDc1ZjIwZjljYmIwODU0OWRhODRjOWEyMGY3N2VhODExNjhiMWExMDcxZDY0OTI1NWNjNGU4MDE4NiIsInRhZyI6IiJ9', NULL, NULL, 1, 'eyJpdiI6IkJhcE10MnVIMEFCYksrbk5ZVTVvQ2c9PSIsInZhbHVlIjoiQy9lREY0ZmRMb09nUzFuY2FwTytKZz09IiwibWFjIjoiNGMyY2RmNmJkNjhjOTMxZTY3ZDE1M2Y1MWNiY2I0OWY0OTY2YzE4MzQ1MzEwNzNkYTBlMTU2NzIwN2VlZjBmOSIsInRhZyI6IiJ9', 'eyJpdiI6IlZmZDVkRTdQeXhoYXF4MWVCMkorN0E9PSIsInZhbHVlIjoidHpoeFVUSGtsbTVWVW1rWDZ5OGtHUT09IiwibWFjIjoiMTJkZWYwZTNmMDRlOTQ3YWU1ZjFhMDI1MGJhMzcyZDNkYTFlOTc4MGE4MTAzZWYzNmY4ZTVlMTFkYTBlNWQwYyIsInRhZyI6IiJ9', 'eyJpdiI6ImNFdkNKMDVaY2cvU1d6RTlEUnRmU0E9PSIsInZhbHVlIjoiaWd0Z3Vma0U2eS9FNnB2b0xacG9HUE1URGdhYjFRU3JIZmhZOTVZREY3cz0iLCJtYWMiOiJhZWI1MTMxNTRjZjkwNzc1MzYzYWVmZWQ3NDEyZDJkMWY3NDQ3NmI0ZjY1NGJkNWZhNDFiMGMwNzFlOTY1ZjFkIiwidGFnIjoiIn0=', 'eyJpdiI6IkZNM2E2dGZIaDVkQ0xOMzYxTUlOQXc9PSIsInZhbHVlIjoiaXFVSXVrYVcrNnp3VWxqZ2lOQ3dWR0pBR2kzTG5CbEF0YUxyUnhsM3NTUHVOOHlVdlJPanlDRWlEejlENmh3NXhFOXNGK2x1N0dWR0xPWkZjVXVOTytMQlRPZnhiZTlBMXlJQ1RORytsbkdXUVIwV3FuMjFTT3VtZEJycU5xM1pWY255cUJjd0dKNzEySy9FNWd5VXdBPT0iLCJtYWMiOiI5ZGE0ZTUxYWY5Y2QzMTE2ODNkYzE2ZTIwYjM1ZmUxODllOGIxYmM0Y2VmMDBhODI2NjE3ZmRhM2EwNDBiMDQzIiwidGFnIjoiIn0=', 1, '2026-02-03 06:45:04', '2025-06-16 15:01:32', '2026-02-03 22:39:53'),
(13, 'create', 'eyJpdiI6Ilhidm9scm5ibjNtN1BMWFBRblZHY1E9PSIsInZhbHVlIjoibDJzVU90UlljdmN6ZnJHWnBZNzRUOVBuUUtJajJFbUpXV2tKZkZadmFoMD0iLCJtYWMiOiIzZDZiNWNjYTVlZjBlMzQxODk1NThiNWY4YjlmZmNjYTE0ZDBhZmM0ZjBkZGU5NTVhNDVhN2M5ZmYzNzg4MGYyIiwidGFnIjoiIn0=', 'eyJpdiI6IlRaaE5iTE5wb25MNWpTWkIzcFBidUE9PSIsInZhbHVlIjoidGpJUUFGV1NBajJLVEtJYmxtbnFGOGNSeUJOdzJjckFSd2FMMzVsUldnbytJSmtRTHBhMTl0VFdwbjdkeWQwdiIsIm1hYyI6IjE4YWUyNTY5ODNlOGQ4M2FmOWI0OGJkNWViYTJmOWNjYjAxYzEwODgxZmZhYTExZjI1YWVhMDU0OWQzYzM0OGEiLCJ0YWciOiIifQ==', 'eyJpdiI6IndRRVVOcFQzRytBTmxZV09mbnVrd1E9PSIsInZhbHVlIjoiUDlFVE1pM2hsczlmL1RiQ1pjbUZxZz09IiwibWFjIjoiZGIyYTBhZGY1YjRkNGI0MWU1ODA4OWI4NDY3MzFiNmY0ZjFkZWZiOTNjMTQyYjI3ZTIxYzE3Nzk2ZWQ2OTIwMSIsInRhZyI6IiJ9', 'eyJpdiI6IlpBbW9FNHF6ZktGVkNQcXZqUkc4S1E9PSIsInZhbHVlIjoic2dqTUdKVDA3dEplS1N2by9sYjR6Zz09IiwibWFjIjoiMTJlMzI1YWQzMjhiMWE4NTY3ZDQ2YmM4ZDczMDJmNmJiOGRhNjAxNjY4NzU0MTBlZGYxY2U3MmY2Y2ZjZTQyMyIsInRhZyI6IiJ9', 'eyJpdiI6Im1zTmpMZ3JJY28xR0FuYTB1anY3WHc9PSIsInZhbHVlIjoiek1icng1UHl1dzNwRUdoTDI3aDdTUT09IiwibWFjIjoiZGY4OGRmYjI1YWVhNTI0NGI0ZDFhNjg3ZGNlN2VkOWE2NjdlNGQ5YzY0YTE0YjlhOTNmM2VlODcyYjBjNDdkYiIsInRhZyI6IiJ9', 1, 'eyJpdiI6IkVrRjRiM3R2ejIwNzA1Uk5LdGRhUlE9PSIsInZhbHVlIjoieS9jRkkyVUt3MUlGT3N2dXI3Y1AxQW96M0pudUN4VGVXUTJQb2JqbEhiYz0iLCJtYWMiOiIzYzNkNzI0NWZhMTRmNmRkZDgzYTRjMjI0NjNmNmEyMmZkMmI2ODdjNjBhNDk5NGNiODVlNzliMWY4MzcyMTAwIiwidGFnIjoiIn0=', 1, 'eyJpdiI6IllPUGdwYnFYM3RKVnBSc3BzR2ZZUlE9PSIsInZhbHVlIjoiT0t4MEZrRnB0TXZ5ZlZEMnRxOEFiQT09IiwibWFjIjoiNDZkZjY3ZTQ3YWJhMzAwNjJiNmU5NTU0YTUzMzQ0ZWI2YjBkNTJhNmNlNzFmYmVhYjVkNzRlMDFkM2ZhOWY0YyIsInRhZyI6IiJ9', 'eyJpdiI6IklTaDNncSt6Z2xDUFJoUkpCT1laUWc9PSIsInZhbHVlIjoiYVJNOHhhL2ZNWlNUaG1rOXdnMmlWZz09IiwibWFjIjoiNzg4NmQzNDU1MzE2YzczNGQ5ZWJlYjE4ZjhmNGQxZDg0YjlmMmVlNjg3ZTNmNWFlNzA4Y2IwNjJlZGQxMGU5MSIsInRhZyI6IiJ9', 'eyJpdiI6Im5Xb2s5UFNaVDB4RGNBRDBKd3hYSGc9PSIsInZhbHVlIjoiLzhBNERab0dIbldSLys2MENxenlINThCNUE1NnJCRW4yNFFHWDJwWk9nND0iLCJtYWMiOiJhOTg5ZDNjZTRjMjIzNTA5OWEyMmUzMjU4YTdkMjA1YWU4NTNmOGIyNDM1ZGRhYTcwNWNiYWExMDI2ZDlmYjIxIiwidGFnIjoiIn0=', 'eyJpdiI6IjU1Q09wUGxJQ1BFbk5WQTYyZlI2WlE9PSIsInZhbHVlIjoiL2RwWXlTNHFoNDJieTZKc1hIZk9qRWRYVzExN2hqUmlhZVdtcU9LMUtUcE1PY2lXdXFBYzZrV0FSL3FDVEtIUCIsIm1hYyI6ImZiZDVmYmEzNjJhODI3N2Q4ZTlkNzE1MTQxMTFlZDZmNmIwM2U0MWUxOGI1YzU1OGRiNjI1M2ViMWVlNDYwMjYiLCJ0YWciOiIifQ==', 1, '2026-02-03 06:45:04', '2025-06-16 14:46:32', '2026-02-03 22:39:53'),
(14, 'create', 'eyJpdiI6Imdpc1NSTTg4a3kzb3ZaZXllSXFxT0E9PSIsInZhbHVlIjoiU0d3ZGxDaVVWYnlUOUhDUC84dGtOWk11K3FDYysyMU9xTVZnMVgyNzV0ND0iLCJtYWMiOiJhNjA3NTFjNzdmNGYyYmQ4NWYxYTZhOTA1ZjhlZTIzODA2NDU3MWYyMjRkYTRhOTIzN2VhZGMwODI0NzFhYjQwIiwidGFnIjoiIn0=', 'eyJpdiI6ImV0aHZiL1pyMEk4MHM1d3B6RVhhN1E9PSIsInZhbHVlIjoieFZyUWoxdVIxUFk2eWxLM2ZNeXAyWUdCTFFTQk9hQzlHL1d3VTlJU2daSU02cjZIenlYVFZ4Nm15YW9hdmF6QiIsIm1hYyI6ImQ1ZmI5YzZjNmE2YmY0MTZkYjU0MGVhMWIyZWFjZDc1MmUxYWM1M2Q4NTEwYzI0ZWQwMWExNzc5ZGU5NWZjNTYiLCJ0YWciOiIifQ==', 'eyJpdiI6IjUzend3aGUwL1YvRkdycUZmUmFwd2c9PSIsInZhbHVlIjoianEyUk8xaEZybzBOQlE0U0lpZ2dZdz09IiwibWFjIjoiYzQ4NjIzNDhhYTdiZDg1NGFmN2M4MTMyMmM5YjRmMDU3YmViNjBmZDNjODdiZjhmMzg2NDAyYmY1Mzg2M2I2MiIsInRhZyI6IiJ9', 'eyJpdiI6IkdEeU1tRnFHZnZMOFhDTWVwUnRlQlE9PSIsInZhbHVlIjoiV0ZqZ1JJS0FxQzU0aEEwN2JSR21Edz09IiwibWFjIjoiY2M1OGY2YjA1ZWRjNGM2MzI0MWU1Mjg0MTExMTRhNDE2NDNlY2UwYTExYjg5NThlOGU1NmQzZDA2NDNjNjg1NCIsInRhZyI6IiJ9', 'eyJpdiI6InFmSkljaENuUzQrT0JJUGN0eis0Wnc9PSIsInZhbHVlIjoieTNpbGM4REk2Wk5DZ2RaVnZJdnpxdz09IiwibWFjIjoiMGNkYmZhODQwNTFmZGVjNGY5Yjk1YjMzM2U4Mzg2OWZlMGQ2MjhmZGFkOWQ3Mzc5NzAzYzhjMWI1OWYzMmIwYiIsInRhZyI6IiJ9', 1, 'eyJpdiI6IkEveGhLL2lDcFI5cC9UZms2cHQ5dlE9PSIsInZhbHVlIjoiVUwrSlgzeFNrYUJYL1Bzcmh1a2xPWHo0YW9XUE5nQ2lLWmtDaUNnNE5jWT0iLCJtYWMiOiI4NjA0NDIxZjk5ZjgxYTg0Y2IwMzFhMzRmMjQzMzZiMThhMzcyYTE4YTI0ZTA1N2I3NmRjZjQxZjFjMjRiM2JmIiwidGFnIjoiIn0=', 1, 'eyJpdiI6ImVXaUI2dkZqTUVpelJNZ2ozT3ovRXc9PSIsInZhbHVlIjoiUVdyUlRxZ3Z6WEFDTzVramZuK01tZz09IiwibWFjIjoiNTdhNWY2M2U3ZjYyZGMwOTMwZTAwMTA2MDk5NGY2YjY1ZjcyMGVmOGRlOTQxMGFkZmNiMmUxN2M0NmEwZjFkZSIsInRhZyI6IiJ9', 'eyJpdiI6Ik1oSXRwcUtpWjlPdi9yMExxelZPRUE9PSIsInZhbHVlIjoiNkhjL0ZUWjZ1a2Zac3B1dWVCVk1UUT09IiwibWFjIjoiYThmNzNhMDJmOTEyNGYyNGNhYjM0YzA5ZWRkZGE2NzFlZDk5MWQwZjA2MWY5OWVmNjZmZDBkZTg1YzYyYjkwNyIsInRhZyI6IiJ9', 'eyJpdiI6IndheGcrUHNaVU5HT3AzMC9xMThjeXc9PSIsInZhbHVlIjoiOVhxU1VtVDdzcXlnUWdKYUpKVGRKZ1hNOW85ai9iWDVGNFdBeGhFbUNkaz0iLCJtYWMiOiI4MmU3OWQxZjFiNThlNTQyMWU0MThmZDY4MTljNzM1NzI3MDgzNjY1NGI1MmRlNTAwZTYyNzI4NmI0ZTBmMjdiIiwidGFnIjoiIn0=', 'eyJpdiI6Ikx1NSsyUXFyV0FqNHlFVk9XYTdwaUE9PSIsInZhbHVlIjoiNHVpMENFZ1UzUHRjci9yWExFU0lWNnUwUEw1T3UyS0NMUGRCVUpZYW53U2Z0SFlCcGo2YW9RdjhIcU9PanRUWW1LS1FxUGR3Z1FCUHZIKy9iWDNxd0E9PSIsIm1hYyI6ImRlMzA3NjMxODA4M2Q0Njk0ZTc1OTZmOThiNjIwYzJkNGM2NDI5NTgzZDA4NjNmMTU0NTBmYzA3ZTMwYjcxOTAiLCJ0YWciOiIifQ==', 1, '2026-02-03 06:45:04', '2025-06-16 11:31:32', '2026-02-03 22:39:53'),
(15, 'update', 'eyJpdiI6InJYbUpWOGNMd0EvZDloUDZ3WS9QaVE9PSIsInZhbHVlIjoieGE4TmplRitQWXIxa1ZzYVlPYTBnUG9Za0Ird0RqNHZldmtIcFh5RTdlaz0iLCJtYWMiOiIwNWNmNjgwZTlhYzUwMTM3YzVhNTM4MDExYTM4ZGQyMzE3OGYyNmEzYTYzMDRlYzM4YjFhMzBlZjk1MzVhM2VhIiwidGFnIjoiIn0=', 'eyJpdiI6InFHMmhTUVNDM0JQa3pKbTZjV09xVVE9PSIsInZhbHVlIjoiTG1uaFY5bWdwTnlKczlFT3RsMlN5T0pqeS9EMmlnVFpTekJ4NEIxOWtQOU5qMytmakMrVFE0QW5GcjV1eVRiSiIsIm1hYyI6IjYxM2ZhNGU0YTQ1ZmJkZDRhYTY3NDhjYzZiMGEzMTMzYjVhNTU3Y2U0NWI4OGEzZGQ2MTA4NzNkYjQxMmI4NmEiLCJ0YWciOiIifQ==', 'eyJpdiI6Im1MSERicXVHditZTkxCOGZPSHRETEE9PSIsInZhbHVlIjoiNzY4a2tKYmE5UlNqS3RWb3ROdytMUT09IiwibWFjIjoiYzRlMmIwMWRkMzc1NWIwZTU3ZGYzYTM1ZThlMmUxYWNiYzNhOThlZTZmMDllODEyMzIwYjQ2ODgyYjM2ZTFhMCIsInRhZyI6IiJ9', 'eyJpdiI6ImM1MWppZ0tUWjJvZGZRV2g3S1dFSEE9PSIsInZhbHVlIjoiNWcxU2FrTEcwaTZOR25GcGE2UFNrUT09IiwibWFjIjoiOWE5NmU3YmI1ZTljMjA1ODQ1MzQwN2FiYWY5MmJiNGIwODIwNWE0OTEzMjFlOGZiNWM1MGRhNmI2MzE5MTU1ZSIsInRhZyI6IiJ9', 'eyJpdiI6InR4V1BlUWJYY0RxTGdxZjBUVVNkNGc9PSIsInZhbHVlIjoiaFUrVTB3WWJMalQ2TEpoTENzd3U1dz09IiwibWFjIjoiOWFmMzgyMDBkY2ZiOWI3ZDE0M2RmN2ExZDVhZWEzOWM1YzVkYTkyOGEzNTM4MTViM2MzNmFjMjkyNmYzNDE3YSIsInRhZyI6IiJ9', 1, 'eyJpdiI6IktXV1JseUVYa3VObjEzRFl4V2NrM0E9PSIsInZhbHVlIjoiYVZ4TXFUdEpuWEhaMDJvSnJjSXdGckpQT0VvRVYxTitER0xJTWtoUEZqdz0iLCJtYWMiOiI4MTg2OWZjY2EwNzVjZDBmZTk4ZTZiYTEzZjU3ZmNlNmNkYTRmMWQ5MmI0NjlmZTFiODE5NDA4YzgxY2YwNTdkIiwidGFnIjoiIn0=', 1, 'eyJpdiI6Ijd5TUNmUllSWEZEN0NEZlEyVjQrL0E9PSIsInZhbHVlIjoiMmNRa0ZaMTJ4WUZKeVBOZkRhcTJoZz09IiwibWFjIjoiYjdkZGFjMmZiZDgyM2U4ZjIzMzYzMjA4MTM2ZjY0NTAwYzdmZjFhZTQ3ODA2ZTVhYTk4MTlkNzczMmM2ZjVmMSIsInRhZyI6IiJ9', 'eyJpdiI6Ik1HbldLRDA5Q0JoT2dsak5iRDRWTkE9PSIsInZhbHVlIjoiWDNPdFp3ZHQzVmxETEVGd2t5YlFxdz09IiwibWFjIjoiNWNiNDMwNzEwYWRkMzA5OGI3NDllNTk4ZGY0N2M0NzRiM2RhNmIwZDg4NWI5ZTE0NjI5MzkyY2FkNTEzZmQwZCIsInRhZyI6IiJ9', 'eyJpdiI6IkRQdURnM2VCRVJWOFl1KzdhTTNCN2c9PSIsInZhbHVlIjoidisyODlpZnVkakVUNzNRYjFTdWRmMDZWZ2RIVGNmSFptdWJBTUdlQ2wrbz0iLCJtYWMiOiJhNDA3ODA1NzQ3MDczNjgzZDQxODcwOTg3ZmVmY2IwNWFjMDU3YjU4OTkyY2EyZThjNzNkOThlYzRhZDA1MWVmIiwidGFnIjoiIn0=', 'eyJpdiI6Ik9la1FYQkJMT1lzU2JkSllLRHVSdHc9PSIsInZhbHVlIjoiQktQNERNRjY1V0hsUEtuU2VDL3RZaWQwODhVWVMybTJLYzJKQkI3NkpUdEp2aUNtM2hRcWdDcjRmK3FYMjlrUCIsIm1hYyI6ImMzZjU5Y2IwNTUwZDlhMmJlZDRlZGZkZWY0OTFkMjRiMDM3MzM4YTk4ZTUzYTE0OGRhMmQ1MGQzYTJjZDk3ZDkiLCJ0YWciOiIifQ==', 1, '2026-02-03 06:45:04', '2025-06-16 07:31:32', '2026-02-03 22:39:53'),
(16, 'info', 'eyJpdiI6IjdNbGR4Z0RnZFd5ZkxaSGhDQWp1MEE9PSIsInZhbHVlIjoiTUwvVVFPS0cxdGk0Z3c1WFg4eDdGMUtJR1prWWVxR2swSmlyQ0ZIYncvUT0iLCJtYWMiOiJhMzJjNGJiZTcxMTI0ZDliZjY0NzNiMDY5MmNkMTlhN2NjMjUzMjU4OGNjOGFjZGY4NmQ3YTUxZjUyNjUxNWVkIiwidGFnIjoiIn0=', 'eyJpdiI6IjRtZWd4R0JzMkZHcEtZR1FUYVRzUmc9PSIsInZhbHVlIjoiL1dXWXpsOVFOYy9nWUJLQVQ2OFh5eFp4cFpOQVlkUWd3YUw2RWZzWWd2ZFo1MTZIbkxLYmhramRYVUtOVTFTU0orRUJzV29HbGw0TXJGeWRtamI3VGc9PSIsIm1hYyI6ImU3ZmM1M2I4Y2M1ZWYxZjVkNTI5NjZlZWM0MGJhYzUyZWZmZDA0ZmQ5NzEwMWJkODU3MTMwNjM0ZGFkOGFjZjIiLCJ0YWciOiIifQ==', 'eyJpdiI6InRoNmZFTU02VUkxMHl3M2Urc2IrTmc9PSIsInZhbHVlIjoidHhIa2w0VjVDTlhuWGZ4RlZnSE9sbGJlQUVvQmpGaHlCRVJlN3o3SWlQQT0iLCJtYWMiOiI5OWI0N2UyZjA1NGM2NDc4ZmUyZWUwZDU2YWExYjAwZTczOTk2Y2EzNmIwYTc2OTNjZGNmNmFmOGIzOWQzZWU0IiwidGFnIjoiIn0=', 'eyJpdiI6Ill6TUtoZ0MvQnhvNXIySWF0ckNnT0E9PSIsInZhbHVlIjoiejlDenM5VDJTL0xWN0RKU29sOElhUT09IiwibWFjIjoiNThlMTcyYmVjYTczNWIwOWUxMWY0NWY3N2E3MzNmOGU4MTJmZTg4ZDcxZDA0NzdkN2RkNjdiNWJlY2I3ZDNiMiIsInRhZyI6IiJ9', 'eyJpdiI6Ik03ZEV0aXptUlBtcXRCYUdHK3FWanc9PSIsInZhbHVlIjoicnZxUzdoeDJYTzFvRENvS0lEUDc3dz09IiwibWFjIjoiNTE0NGUyZTE1MTkxNDk2NDk2Y2I4NzEwOTIyN2ViYzFhNjFhOTMzNzUxNjk0MTI1M2JlMTJlYjVlODFkNWIxNyIsInRhZyI6IiJ9', NULL, NULL, NULL, 'eyJpdiI6IkRYVFJyV05Rd1hxejF6SElqQWhGakE9PSIsInZhbHVlIjoiTlRCalJTaTFOaVNzUW43RTY1ckpYdz09IiwibWFjIjoiNWE4OTVmNDA2NTEyNTE2ZThmZWFlOGQxY2ZkODk2NWY4ZThlYWFlNWFkOTI5NGEwOWUxYjhjOGYxNTc2Mjc3NSIsInRhZyI6IiJ9', 'eyJpdiI6IkE0UHpsSDcxMWtldzJ6NWxxa05uZ3c9PSIsInZhbHVlIjoiaHR5b3lNWWtMYlBWb1AvY3B5SE1kdz09IiwibWFjIjoiZmE5N2MzOWM2ZTJlMGU1MjBkNTlmYWM5ZjE3ZDQyZjc5ZjNmMmI5YjY2NGI4MDY5OWVmMmZjNGM2ZjE5OTZmZCIsInRhZyI6IiJ9', NULL, 'eyJpdiI6Ikpiam4vUFlWUzRUT0twcWNQT0Rnb0E9PSIsInZhbHVlIjoiRE14cFZrdC92bWR1MStYazJqZUxQaDZiYWRlRm1PMjRCMW8vWUZDby93aFZsbEtpOU1Sd1RCNjF0OFpDbjRzMEdGOG4vR0Vjd1BqMjErRTZ6ajc3VEE9PSIsIm1hYyI6IjZmNzNlOWMzNGQ5MGMyNWJjODdhYmM1YTgyZWIwZTVhZjg1ZmQ0ODNhMDE2MTJjNmU4NzAxY2U2ZjBkOTkxN2UiLCJ0YWciOiIifQ==', 1, '2026-02-03 06:45:04', '2025-06-15 15:31:32', '2026-02-03 22:39:53'),
(17, 'warning', 'eyJpdiI6InhwVTZpYUFkZS9YZXlyZVBQQ1lJWUE9PSIsInZhbHVlIjoiU0ZOcWJrcndrZjNxVThQc2ZucGo1VnVHMGREdGNUTnBySDM4eFlCMTZtUT0iLCJtYWMiOiI1NmQyMWYzZGZhZTczZGRlZjhmMmE3OGQ4ODM4NzY2NWJiMjZhYzcyMzc1YWZkOTllMDNjODg2ZTNhOTkxNWQ2IiwidGFnIjoiIn0=', 'eyJpdiI6IkM2V2p0NTMzM05wMHFOUGpQZWE1MXc9PSIsInZhbHVlIjoiVldGN1dwZVVnY2xwUzNNVUxRRm1jYUxLOVdGVnZ1NDJnRGFJc2s5RXprcWhzcFh6blUrTEUvZklsMHByV1BvSmVoelVROVd4OXBlMUNUNVA0TzFWb1VFYnZjbUJ4V1NCOUhFekZ5M1ZxUEU9IiwibWFjIjoiY2Y0OWY2MTBhYzBlYzQ2ODk1NTBkOGVkNmVhNTczZWYwZDUxOTIzNWJkZDRjYmQzMzRhOGQwYzY1OWQzY2VhZCIsInRhZyI6IiJ9', 'eyJpdiI6InNVQ1k5TFhxYXR6bzNXTDNTVmRoY1E9PSIsInZhbHVlIjoiYmx2UFBHVFZRejJRVU1jL0dQOEhmNFFDNjJ1a0dmL3ZwbVRkYytpUFA1ST0iLCJtYWMiOiI4N2Q1OGM5MjllNTYyNzg0Mjk5MTc3NDk0YjMyNTM4ZjE0ZDY5ODM5NjFkODg4MWE2NWZhOTFkNzcyMjM2NDM1IiwidGFnIjoiIn0=', 'eyJpdiI6IllBY2Q0YVgzMGliUGxVSTQ0RDJ0anc9PSIsInZhbHVlIjoiNFRTTGtKNVBQNC9PNnFIZTBUemE5UT09IiwibWFjIjoiNTQ2MzkzNjVlOTRiYWIxYTU2OTYyNWViNjg5NWEwODVlOWEyMmYzZWJkNzMzMDA5MDkxNzFmZDk4NWU0OTQzMiIsInRhZyI6IiJ9', 'eyJpdiI6Imw5eEJMWnFFaEJnQXNXdE5ReHFnenc9PSIsInZhbHVlIjoiVlk0OXpBMUloaU5CcEZ1Rm9zam5OZz09IiwibWFjIjoiYjk5OTlhZWIzZGEzMjZhNzIxY2IxZTViMDhlZmZiNmVkMDFiODcxYmM1ZjJiMmNhNGY0MmJjMWY3NjljYTBlYSIsInRhZyI6IiJ9', NULL, NULL, NULL, 'eyJpdiI6ImU0SC85YTJqY2k5VWlTWVMwdHJ2dEE9PSIsInZhbHVlIjoiUHE2NlRhUTBDZW1HbW9WdjIvVE1XQT09IiwibWFjIjoiN2UwY2QxZjVlZWUxNmJlNWFmODBkYzk2ZDcxNDNmYTYzMTBlNWRhODZhNWYxNWY0ZWNkNmRjZWI3N2FjYjdhOCIsInRhZyI6IiJ9', 'eyJpdiI6IlFKSUdsZC9rNnY1dk1uR0JKSHd6S0E9PSIsInZhbHVlIjoiVUN1UkZyWWRRSm5zUE50d0RIRkFuM0szR3EyMXdISnRpb1VpelBtc0p1dz0iLCJtYWMiOiJhZDk2YzQzNjFhMmJiNDMzN2YxMzVhNDcyYjQyNWE0YzI4YmNjYzU4NzMzNTJkMzQ2ZTVhYWRlZThmMjQ4ODg3IiwidGFnIjoiIn0=', NULL, 'eyJpdiI6ImpBbWNlYkZKMFZDUGNyVU9DbkR5RUE9PSIsInZhbHVlIjoiVmxCRmhmSGsyc2kzRTEwUSthZ3dVeGdHY2l2V3ZSb28rc0ZLdFUrbnFhSGNmdU9CNS8xVkMwbjRSdVVBMVVtSiIsIm1hYyI6ImU5NGQzYWZiYTJhNjRhODM1OTU0MjliM2QxNGQxMzhiMzIxMmUwMDJjM2Q1YzI2NThhZjUwZTIxZTIwZTQyNWUiLCJ0YWciOiIifQ==', 1, '2026-02-03 06:45:04', '2025-06-14 15:31:32', '2026-02-03 22:39:53'),
(18, 'success', 'eyJpdiI6IkYyOXFqWlE2a3RBSElKWUhFUE9BQmc9PSIsInZhbHVlIjoiWC81N0FWRTV3aTdkc2RpUkRwYVo4NmpYZzdvdnRyVGNTTlpuTHNEYzMrYz0iLCJtYWMiOiIzYmM5ZWQwMWFhYjk0MTZjYTg0MTg1NWZhNTY3OTBjMGYxZjdkYWU5MTYxODgyMGU1ODYzMTJhMzVmOGM5ZjllIiwidGFnIjoiIn0=', 'eyJpdiI6IlM3dzNEYXhGV0R1dFRGMCs0V1J3UXc9PSIsInZhbHVlIjoiVHJHVHBpNVFYUDRRZkgxSHNySW1iVWlMeWtxcFg2LysvUXRjNVorMHpoVm41WmcvSGN0VDZMd3pRZ1l1cmZoME8zckZseGNjVlJXcUo5TGM5bFJ0SFE9PSIsIm1hYyI6ImRlZmNmZTk0ODg2ZTJkYTkwNzIzOWQ3ZTMyZGU1OGIzZTIzMmJjMjg1N2Y5MmY4ZTNiYjQwMjE3YTk2MzJiMDEiLCJ0YWciOiIifQ==', 'eyJpdiI6ImIyVE9MZFZLOFltajVDNWE4Rm81UWc9PSIsInZhbHVlIjoidVQ4MFUwdFlpMUFON2xkL3p4V1VVWlJLV0QyUWFJK2IxR3VYRlJDOWtVUT0iLCJtYWMiOiIyOWJlNjdmZWQyMTMzYWYyZDE4ZWI0NzViM2ZkNWVhNGNhYWY3NjE2Mjk3MzBhNzYzYTM4YmUzZjAxMmI1MGIyIiwidGFnIjoiIn0=', 'eyJpdiI6IlVhOGNoU1QxdXQrVjkrQnc2TUFZbEE9PSIsInZhbHVlIjoibVF2MVR1WGpCaXhPeStQTWNRMkRudz09IiwibWFjIjoiNTk2YjY0MjBjODBlNjU3N2ZiZjUwNDBlZjU5ZTBiM2I1ZmUwNGY0ODM5ZmU4MTFhNDY0ZmEyOGMxODA1OWQ2OSIsInRhZyI6IiJ9', 'eyJpdiI6IlZYanBBM0NhTk5acWVucmp1NmFzRWc9PSIsInZhbHVlIjoiRXViTGJrU1dmTFI0MmFhOGNySEhiZz09IiwibWFjIjoiNGNkMjFlZmI5MzMzM2M5YjBjMjdiNzRkYzYwM2U0NzNkYzE1N2UzNDExNGRkZjg1OWE0YjU2OWFkMTQ4ODY3YiIsInRhZyI6IiJ9', NULL, NULL, NULL, 'eyJpdiI6ImR6TXAyYXNvNW5IL3JDUUdzMHUvZ2c9PSIsInZhbHVlIjoiMzhza2o2MWYvcmYzNW5qNG1uOHJydz09IiwibWFjIjoiM2EwOWQxNDYwZjVjNjc3M2Y5MmM2YTc5MWUzMjhkZjMxNTQzYzkyMTQ4OWE3M2VlMDg4MmM3Y2U4MTg5YzllNyIsInRhZyI6IiJ9', 'eyJpdiI6IkVaWGZieC91emtxSnl5R2VlQ29LdGc9PSIsInZhbHVlIjoiUjNoV3UvVzVFV1ZVUlJqVmJicG5odz09IiwibWFjIjoiODg0NDA0MTA1OTU1ZDczOGMwNGQ2ZDAzZDcwZmI1Y2RjYzU2OGQ3YWIwNzRkNWQ5YjEwMmFkZDNlZWY1M2EyZiIsInRhZyI6IiJ9', NULL, 'eyJpdiI6ImxzVUFKLzJleWtmMUtGOUo0alNNeWc9PSIsInZhbHVlIjoibkI2VmF0eG5WYmdtMWdZK09BWXl1MGlENnhYZzQxbktaYmpNNXF0UlNXMVVySkpkN28vcElJcGtsOEpWT1FZdSIsIm1hYyI6ImUxNzQ4YTAyYjNiNmEzZGQxY2Y4ZWYzYWEwZDVmYTQ2NmJjNzMzNjg4ZDkxNDgwODlmYzBiZjBjMzMyMzFkNWEiLCJ0YWciOiIifQ==', 1, '2026-02-03 06:45:04', '2025-06-13 15:31:32', '2026-02-03 22:39:53'),
(19, 'create', 'eyJpdiI6IjZoWXdFbDk2ZlNQaUpGK0hqVTJEY1E9PSIsInZhbHVlIjoiSEx6SjhQZzFxdXNLaCtpMFJrNTZYeHhDbUZHM3k0cEJPcktwMlY3dG9pVT0iLCJtYWMiOiJiMDFmYWFkYjYwMjg2NjdlZTBhMTI3N2IzMzdkY2MzZTJhNDQyYzIzNDI1NWM4NmVlM2FkNmQ3NGU2N2QwNjlmIiwidGFnIjoiIn0=', 'eyJpdiI6Ik1sc1J5cTE2U0F2d3FsM1Q3b1VlZXc9PSIsInZhbHVlIjoiL3VIdGZUbFB4WGpLb0gzdFRnN0NYam11VG9NekwreGJYa0kwSEFEc0hkdnZGUHhESjFUYXhFcCtnMXR6a3JPY1d6UzBxMXE1ODA2TkswSmxLNk9HQmc9PSIsIm1hYyI6IjlmZGM4ZmYxZDg4NjI1MjY5NTM2ODdjZTM2ZGFjOGRhOWM2N2I4Y2EwNGNiMWUxNDg4NzcwNGRmOGUyOTUyM2MiLCJ0YWciOiIifQ==', 'eyJpdiI6IkF0anduWWhLSEZVVkxtYktDd0QwS0E9PSIsInZhbHVlIjoiL0hrT3kzR3FFZnVHSm9hWEFEVDFDYStjRllrZ080bER1R2UzWFZBVDFmMD0iLCJtYWMiOiIxNGYwZjZlZWM1NGM4OWY5ZmE5NGM3NmViNDNjZTg5NjhlYWQwNjA5MzI5MmNhYjIzNWI0ZTdlMDRlYWI0YTg4IiwidGFnIjoiIn0=', 'eyJpdiI6InQxQ3B0Y25EKy8wQjVnSU1TV0lub2c9PSIsInZhbHVlIjoieVhCU0pTazBSTmZCY091d2VmMnhqZz09IiwibWFjIjoiOTFlOTMzNDA0ZTBjZWVmMDZhMDhjY2QwNDY4NDJhOTdhNzFiMDMxYmU1YjFjNmM1NjBmZjY5MDJjZWFlM2MyNSIsInRhZyI6IiJ9', 'eyJpdiI6IllIcTdFQks2UGpzUkpROU1xZm1udHc9PSIsInZhbHVlIjoiSzdFS3FSb044bi8xOEJEajRNb2F0UT09IiwibWFjIjoiYWEzNTQ4Nzg4ZWNjZWZiZjU3N2MyMDA4ZWQyNGJhYzk4YzVkM2Y2MWQ5N2ZhNzI3N2EwODU4ZmVhZTY1OGE1NCIsInRhZyI6IiJ9', 5, 'eyJpdiI6InE0clIzRmdOMW9uMjdHZlkzeG9BYXc9PSIsInZhbHVlIjoibEJyTXRjRDhFbU5uaVdqbTdrcnpPdEM3TS9Dd1Y0NWJLWFdtTzc1WjdwST0iLCJtYWMiOiIyMGVjOTJhNWIyZjI4MzFhN2M2NDc5Y2RlOWI5ZjdiNzljYzZjZjhlZGM0YzA4ZmI0OGY5Mjk2YzdkYTNkODY0IiwidGFnIjoiIn0=', NULL, 'eyJpdiI6IngraVNCSjh1UjZla2tZR3JXZzlyYVE9PSIsInZhbHVlIjoiK1Qra2FZdlA2c25tdW1XdnZ2M2kyQT09IiwibWFjIjoiZGE5MTBhYTZmOGYwNDlmNmZiM2E4N2NjN2FkYjMxYTM3ZDlkYTE4MmYyZjhiZTcxZmZlODY1NmVlZjdkZDk5MyIsInRhZyI6IiJ9', 'eyJpdiI6IllwV0JlbWZvQmwwTThiK2JaS0FBMEE9PSIsInZhbHVlIjoiaUJieGVsUHAvMjEyTE91RjlKd0d6QT09IiwibWFjIjoiYTMyOTUyYzcxOTI3YWQ3YWU5ZmIyZGJlMDg2NGE5MDRmNTczZDY3ZDgxMDllNzQ4Y2IxMzQ1ZmI3OTA1NGMwMyIsInRhZyI6IiJ9', NULL, 'eyJpdiI6IlkvTzNtaVRFMHJNKzN1S3dJUWRIS3c9PSIsInZhbHVlIjoiSmt2VEtsSndWdWFLU3dpajlQNFM0cDBBRU1PZXhtRTJLTVEvZENRWWpEclAzdGVEa1Vsc0ZkeEZEa3pLS3FmOW9aNlBSd2VFdnkzb20walhNdUJOa1ZZSEcrdVhwSEttc21LNEFaQmxIUFBaWUkxenppUm0vM01PMEtyUnNOQ0NscjNjVUVFMHZ6b1lmODErd0UvRmlUdDdmWEhuN2RJdWhRREtFYjFMS2w2NlB2M29rNlZBNDJpZWRmVldNVWhzamlwREh5MDlXaW1DbTJlZnlsRktoQT09IiwibWFjIjoiMzNlZjZhYjRhODM1ODY1MDRjZjUwNmI5ZGM1Y2IyNTA0ZWI0ZmIwNGIwZDI0NDNjYzRmMzZhODc4NGMyMDIwMiIsInRhZyI6IiJ9', 1, '2026-02-03 06:45:04', '2025-06-16 15:33:12', '2026-02-03 22:39:53'),
(20, 'create', 'eyJpdiI6Ik9nYUdpTzVEdUNKazliME5OVmt4NVE9PSIsInZhbHVlIjoia0VFZjRkTDlidXpHWXFVS0ZBNkhhTGcrdlhoRnlqb0Nqb2hTMzY2dGNaMD0iLCJtYWMiOiJlY2QzZWIzYmYzYzQ0ZmRkZTJkM2JhOTg2Yzg0NzYyODNkOGZhNDUwNTE3NjUyZjlmNGNjMTcwNjI3MGU5ZjNkIiwidGFnIjoiIn0=', 'eyJpdiI6Im5DVi9HT3NuOVRCcUdqcEdaZ095bXc9PSIsInZhbHVlIjoibzYvQXBYMlc5TGtIZTUwY3ZWQ2I1UW1Wa010V2hqN2pGbzdwTWQ3bWMwZHhPeTE5NjZnUWZWclBtL21uNTZ0MkJHOC92U2xLMHhyMVhxakMvWHZEZXc9PSIsIm1hYyI6Ijg2ZjQ4ZjM4ZTI1MDA2NzUwNDMwYTgzNjkxNDNmNjUwMGFjYTNmYThhNDczZDhkMWI2YjhkZWM0NjQ2MzQwY2MiLCJ0YWciOiIifQ==', 'eyJpdiI6IjMyc1hFTGgvMmg0ME95d0JLOU0zckE9PSIsInZhbHVlIjoiSzhwdGorUEFOVnlWVUdpOENzTUJvcFE3Yk5UTDRTM3RIenBPOVRtSmVLUT0iLCJtYWMiOiI0YjYyZGFmNDgyNWQzMTk3OGVhMGU5YzEwNWE3NzYyMDc3YmRhZjc3YmU1NGZhMzAzMGIzMmQ0ODZkMmU0Y2ZiIiwidGFnIjoiIn0=', 'eyJpdiI6ImNCcDRKaUZKYUZzM01BZzV2TlZ2aUE9PSIsInZhbHVlIjoidXlWQUpCK0dmcllGRXVvL2ZNWGg3dz09IiwibWFjIjoiYzUxZTUwYTg3ZDhkY2FlZGQwYTIxYzVhYTBkNGE3YmY4ZDA0M2VmNzk2MzhjYTU3MjdhNzZiMWQ4YmJhOTQ4NSIsInRhZyI6IiJ9', 'eyJpdiI6InBGNDNHblMrZ1RRSjVzRzhZYVBua3c9PSIsInZhbHVlIjoicnhBYXMrWkt4N3lyZDdENllKOFVKUT09IiwibWFjIjoiNThiOTNlZDE1ZmY4NTBkNmUyMzg5ZWIyNGNiMGZkZWZmOTU1MTI3YjAxMTU3NjI4Y2ExMDc3ZTQxM2NlN2MyNyIsInRhZyI6IiJ9', 5, 'eyJpdiI6IllMRlpvZWcwblNwSE9XMU4waVpiNWc9PSIsInZhbHVlIjoiT1VjdkVOLzVtVTYxTXlvaVlEM0I3Z2FyNzhDRHRjQnN2S2tEbU4zR056ST0iLCJtYWMiOiJjMzI1OTAxNmIyNzliOTBlMGNmYjg3ZmI0ZDhmOGNhOGM3NDFlYjNlNGQ2ODZhNTA2YzVjOGVhZGM2ODAyMDcxIiwidGFnIjoiIn0=', NULL, 'eyJpdiI6Ijg3RTcxUWFIeW4vT2xNMXFDK3lieHc9PSIsInZhbHVlIjoiYjl6UnorRlYrZXp1VDkvaDlocmxuQT09IiwibWFjIjoiMjdlNjU4MDgwNjQzOWY4MGMxMTI3YmQ5OWVlZDI3NDg0Mjg0MDVlNzY5OGY4MGQ2OTBhNzY1ODFhNTY3MWNjMCIsInRhZyI6IiJ9', 'eyJpdiI6IjZhWlBoL0JDdkludmlWc2ZveVVVU0E9PSIsInZhbHVlIjoiano2bTQ1clFTdlVGWGUrVmFES2dLZz09IiwibWFjIjoiZWI0MzU4ODhmNGVkN2MyMzUwMmQ0OTFhNzFiNjI0NDhlMDA3NWY4NmU5MmMzMjJkNGI1OWRjYjk3ZWUxYjViMyIsInRhZyI6IiJ9', NULL, 'eyJpdiI6IlBCc3VMWUgzbzRwNTQreVlNb0E3REE9PSIsInZhbHVlIjoiYVBCVmx3a3BzSmkzNkpDRWhUeWdnRFpsUHhnaUFaRVdLdXdZTzgzeUR2K3RTL2NQejg3SnhyMG8wbDZSUHNseWJwNDBZaEw4TER1a25NcnB5bWRHaHo1NWhJYlBGKy8rSTJVS0x4dSt6R0loZi92VmQ3K1piVGtPbUcybW9hOEo1eVcySXFONEc1d1NwUTM4NmRobVU0VXFPOEVUUS9DS21OVDN2dkkxZFhCYTdPRHBUV0NWYS9HKzhtbk5XUE4xL0kyRUJvSXduYTdtWGk1dDNCUGovdkxSQ1dpNXlwc3M4TGJ4dzhpeVlwUT0iLCJtYWMiOiI2NzZlNzBlODcxZjM1ZWE2MTM1YzM0MzBlZmNlNTExZjI3MWEzMjU1OWU0YThjMWI3ODA4ZmI1ZjMwMmIyZjQ1IiwidGFnIjoiIn0=', 1, '2026-02-03 06:45:04', '2025-06-16 15:33:12', '2026-02-03 22:39:53'),
(21, 'update', 'eyJpdiI6IkVFUUJNTWdCZmdKNG5VUDU5YytneVE9PSIsInZhbHVlIjoiZE9rOURNNzJIWTh1Qmd4ODFWZ1VMc1FqMEU0SExITVl4bE9EWjdpSWkrcz0iLCJtYWMiOiI1MDU3ODFkZjA0M2RlYTkyOWY3OGZhY2UwNjkzMjhhMzViYWI4NTBiMzA3ZDcxZmQ1NjI2NWU3NzI2NDlhZWRhIiwidGFnIjoiIn0=', 'eyJpdiI6IjlMYmJkUWlGTklnQllWZS9WQitpZFE9PSIsInZhbHVlIjoiaDhXU0RnbmMwZStOTVhCTnJZNUZweGhIMmc0TWtsZVdMaFZzcVFad1JUZytkUk9ncmRnUXg4ZndTN1pyV1VUNkVkNU12ZEpUNDB0dXVNNmJGRkZLUUE9PSIsIm1hYyI6ImVlNmU5NmQxZmFhZTNhNGIwMzQ2MGZhM2RkMjgxZjU5MDY0ZTU2OTI3ZjAwYTI5NWNiZjllOTY5NTg5MGUyNGMiLCJ0YWciOiIifQ==', 'eyJpdiI6IkU3TkRkZlAyMzJMa2tXSDVsVGhVM3c9PSIsInZhbHVlIjoiQmdIQksvaWZiVytQb0FhT0hQNnJ4dz09IiwibWFjIjoiODUzZTI2YjRlOTJlMzY2YmExYzBlNzcyNGYzNjY3M2Y1ZjczN2E0ZmUyZTAxNDczMjM0OTA0NDU0Yzg3OTBiYiIsInRhZyI6IiJ9', 'eyJpdiI6IkRiZWVHSHFCN3dTVWUxRVBVWDNrRFE9PSIsInZhbHVlIjoieVRRRFdSaGovcVJ0RFdIT1JLa3hDdz09IiwibWFjIjoiOWIwN2Q0MjEwNjU4MjgwMTJkNGEzZWU4OTczMTM0MWNmZTIzYWIxMjE2ZjBhNzA4MmU2ZTkwZWQ1YTY5OTE0OSIsInRhZyI6IiJ9', 'eyJpdiI6ImJCMDNOS2VxaGUwWW1HV2ttdTNJY2c9PSIsInZhbHVlIjoiQ3VURVRvY1kwcE1WRTAxMVRMaDEzUT09IiwibWFjIjoiMjVlNTQ4ZjM2ZmY4NzkyZGUwZjdmY2UyYmYyZWVmNDMxMTY2NzQwMWFiMGJlOWY2YWM4MmQwZjhhZDM3YjljZCIsInRhZyI6IiJ9', 5, 'eyJpdiI6Im5sRG1tREhvNFUvWkdxNjdhRUZpaEE9PSIsInZhbHVlIjoiZlFvdG85UmNvNkxjbFFXQXRoUUlqSDRWMXI2YUg4SXZtT21uWmdMZHJOUT0iLCJtYWMiOiI0NzAxZDY3ZjMzYjQyYzk5MzRmMTg2YzFhZGU3NTg1MDU5ZGNiNmE2YjhkYmVjMTc4NjA5YWM0NzgzNDBkYmMyIiwidGFnIjoiIn0=', NULL, 'eyJpdiI6ImkvaGIvL093cXZMZEhpZUQzc29hSVE9PSIsInZhbHVlIjoiREhXc3poL2U2VDI1TDczUWFvditDQT09IiwibWFjIjoiNTc2NWRkOTEzNzI3YWMxYzczM2M2YThhMDAxNDRmYTI0MGZmMjYwMTkyNzNlMzAxNzUwMjZlYzlmMGU1OGNhZSIsInRhZyI6IiJ9', 'eyJpdiI6IlR0R0Q3aGlEMnJYZmQzYWFvMjEyUUE9PSIsInZhbHVlIjoieUZPbGhVbkxxN2JtM1NzMm5EVnpmQT09IiwibWFjIjoiMWU5ZjNkYmNkMTgzOWY3N2EwZGRmMzkyYTExN2RhMzA2OTJmZGE0MjY4OGE5MDk4NDM1NjVlYjVjMTE5NWQ0YyIsInRhZyI6IiJ9', NULL, 'eyJpdiI6Ink1N3V2M2J1Y0p5VjB2b1VqTTBzL2c9PSIsInZhbHVlIjoiODFPL2l4WTNCSldoL0o4T1ZkbHVNL1hhUDJ1ZkpFdGxvV2FETTBoakd6QjU3cWNwaExrWi9nczI4ZWtHVHJpYVdyYUVDL0xMbnBGbWZhbTIwNUgxT0RaVFBDVlVSbWtaYmpaOGZmcUhWWGw5YzJYVVpCaUdubTZzbm9xZWFwN0ZuallLRGl6YTF6d3NoOHp1ZmluK2NsUm9lc2k3anlqRUd0b3cvVXlNWElJYjBOWnJzc3RJNTh0cGtjd1JSOFM5UjZZK0dNK3FCVDN4MU41UmdyMGxqaFRrZ0R2czM2bG50QTArN1UvVUY1OHprWFpRcTlxTEkxVyt2aVVCY1NxVjZIcGgwUXZxbitzRjYyTkMwWWxJb3JsTnh3U21jVG56d1ZaYmlaODU4Q1JBZlYzU1RrOHBQc2FwSUxDYk41bW1DZW5ZWG5EY2tPTHN0c3BmcFlnWk5HZ0J3N05pZFk0SEpkaExOYyttQkhGSUI4Yk9UdGdBZjhTVFdCdGo5cy9MWGovNDFpWHh6dUdMQVhaSzhmVUdFZ0ZHSHIvRmhaMG45L2pVUERMR2JMQWdieWozT3lNZ2tuQ2ZqRUlOeXJhUlpMclpLcnVEbkQybkpDVW9pb2luMVlPNE0wNUhiSFQ2RXc3TmFNZDMvckFxdmpSL2dtaW9ZSUpPdmczSGRrcEVpc2tTYkxOb2lOWlVPc3E4djhMTGVoa0RPZ1ppUDRKdng1ZVR3cVh0U2wva21JYTNWcG9rdHdQL2luQzJCKzRvZ0JRRmlmc2VlczNrbERhcmYxWTBlb2l0UUlhM25pcGlxTkR0OXpRWEpzNENXOEMrb2Nibk5lZ3JWNGpudENWaXZqSXJJNmxFbUhoZzl1SVlBV3JkdnNFOU94cE5rc1l6NG13a2Z5M01weHBraFI0c1ZxYzM5U1JHdVNXWDk1Tzdma3hnd3ZhTlhLYUpFbk5aUjdCM3NNSTF4Mkg3em4zT1pMaExDQmpIYkFZM2R0cUFNc21MMDF6M3ZtRCs1Z0tPZStURXRQa09YUlh3UUJCWWl3SUwvWWd6VGZmTGFpaGlTWmF5WUZBQ2FtQ1FtRHFVN09qQWZ4cE1zR0RTQi9vTEdETGQxSDJ2cFpwbnhzaC8veFMrQU4xZkswUmxDZXVlcXc5WnNCcFVSSDA9IiwibWFjIjoiODE4MjU2MThjNTZlOTEwYWNlNGMwMWZkNzk4NjkwNWRhY2E3MzA3NThhMzg0N2E3YzRkMzAwMzQ3MmU0ZmFhZSIsInRhZyI6IiJ9', 1, '2026-02-03 06:45:04', '2025-06-16 15:34:08', '2026-02-03 22:39:53'),
(22, 'update', 'eyJpdiI6IjhtdHNFbk5mK1RRYnpMYnFXNG40T3c9PSIsInZhbHVlIjoieTdLSmhkYjQ2Q3M2TjhZZU9IL2lkUHhQYXVwTnA0cFJJTGlRczExcjZxbz0iLCJtYWMiOiJiYWE1MDYxNjYwN2RhYTFmMjRjZGZkNjA3OTc2YTI5OTA2NmY0NzIwNjVhNGRlNDgzZGU3ZmFkM2Y3NWI3NWE5IiwidGFnIjoiIn0=', 'eyJpdiI6InMwSWE0cjhSdU9hdmh2MCsxeGg4NlE9PSIsInZhbHVlIjoiL2pScFcvb1hyQitJYWl3dWxDMXEvaXo1eFNXeEdxVG1Oc212UG5YZ1MrT0wyS043ZnAxWTBxL05vd2NNSkZwbE9lVCtqOXZkcjVudGFhTGpheUVpRnc9PSIsIm1hYyI6ImM4ZjAwOGE0NjI2Y2QyM2Y1YTEwNDg0ZjZiYWM2MDJlOTQzMGYwMTUwMmI1Y2Y1ZTYwNzIwZWQ4OGZlMjlmMjUiLCJ0YWciOiIifQ==', 'eyJpdiI6IisxWE1PRjBKUTJocEdqYmxjVGxOY1E9PSIsInZhbHVlIjoidHNYcGFhVXd3dmpzQmlNbG1NUWhQQT09IiwibWFjIjoiNDhkM2RjMGYzNDI5OThmOWVkN2Y2ZjVjNDhkNTljNTE3ODkxOGYzNzYzNDY1NTE2Nzc5YTAyMDIyMjA3YjI0YSIsInRhZyI6IiJ9', 'eyJpdiI6IllaWEU4bllTS1RuUXFXK29TK1V1K1E9PSIsInZhbHVlIjoiNzN5OGNoOENISWRldHFRYUYxaEZzUT09IiwibWFjIjoiNmUxZTk3Nzg3Y2FlOGE0YzNkZDFlMzBiNTBkNGVlZGNlM2RjNTliZGNmYzM3ZTJjMzViOTg2NjBhNTQzZjg2NSIsInRhZyI6IiJ9', 'eyJpdiI6ImN5MlBvWldTK0xuSCtnakdTNW9kZGc9PSIsInZhbHVlIjoiditBd0tGVm1HL0dDTmUrd0lOTC94UT09IiwibWFjIjoiOTljZDVjZmQ2YmE3YzdmMjUzOGExNDg2MjFmOGJjYmI4NmQ2ZmIwYzAzYmZiZmEwODM3NGZhZTgwOGE5NmYyZCIsInRhZyI6IiJ9', 5, 'eyJpdiI6InpWUEJqdzdscFozSGJkN2toeGF2eGc9PSIsInZhbHVlIjoiaWJlKzRYZzhDNUtBcFlqWXJiaWJrOVduaHZoczFRVXRRRGNKMWk0eUo0RT0iLCJtYWMiOiI4YjEwOGVlYzdmN2ViZDViOTlmNjRhZWZjODFjM2E2ZDYxNzgyZmUwODAzMWY2MGNhODU0ZGUxN2FmY2I5ZWVmIiwidGFnIjoiIn0=', NULL, 'eyJpdiI6ImpWZHVxQ0lYb2xjdTNhc2Q5a1ptWXc9PSIsInZhbHVlIjoieFVjZVBVNnBNMUphQkdobzJzM1R0QT09IiwibWFjIjoiNTdmOWM0MWZmMzBiMmNiY2QxZDI1ZjFkNTkxZDRlOTVlZDMxNzQ1M2FlZTRjNDdhZWM5NjFmNDhkYWRkZjdhNyIsInRhZyI6IiJ9', 'eyJpdiI6IjlGTS9UdmRPdDA2ODNTSEVIdlBrbFE9PSIsInZhbHVlIjoibEdrWDkxakNudEIrYWFoRUFHaDBZZz09IiwibWFjIjoiZTEwMjY2YzNmZWFjNTE4ZmZhZGI2YjMwODEwMzUxOTZjNTM4NzEyNjI3MWFmNWMyY2U2NDY5NjhlYzczNjA5ZiIsInRhZyI6IiJ9', NULL, 'eyJpdiI6ImNBRUhyZFhveDlyd3JWQzRYRkY2SUE9PSIsInZhbHVlIjoiNVhjb1haMzQ2RTB0WFJydDJNa1BIbG5XcWhKVURRbUtWZTFoVmFHMUd0QVdUT0EydEdlWlRkWUltbld0QnM5L2xQa2JsV1ZCVnNQYzdJa1dIRFhzWDdDdWVDZTdUSExXM0l2SFY0QlFjVkVrK01TWWFmTElITmhBK1kzY3czRXlOQlp4M2JxTnpLTzZmeldTRVltekNDVFU1NWE0L3g1b3R6dzBjbTROaTBaYlE3am0zWkZvekFROFgrQ05kYmxnSnRWWFRnT0d6bUZaUnRxUFpicVZKQ21sQ1IybzJxdjVESy9mbng0eU5VWFF2YTRMNnR0SitWeVN0L3IzRzdmaklLTVIwK2pBSnF3SzJpZzBKUXBmTlNpU1lPbHpJTDJrQTIydlVmeC9PMzRONjY4RzNFRkplckNpZFZ2aUswSHNadC80eDFodHd6cXhFNmpUVm5RdzNSTkVzUTRuNUtPZitDTEUwSkFpa3Fnck9nT2hLVSt4blpYVVBJSlh6Mlh2aXFUZ1kwSll5bzd4TkZzd08reS8zRUhpWHhvazBDK3pWWkJzZy9Ma0gzRHRPYXROcFh0WmlyUXNETXYwRWkxSlgyN3NSN3pBR0hzQlR5Vmc5SGhDWm1qN2NWNDlRNEIvYS9VOXhBZkx4cmxnbmRGTFNjTEZtYlpvMEdQRDhsQ0NMZGIzaWdpL1B6UVZGUUR3bm5Ib3Z6RTNuR3JrRUhxdDVYZm8rOS9XOURmK25rM1lPMzV1MStKSzdXZDdKR25xekFaUzhpb0g2cFpONlRKMDhLSTdyclhUdDdWVE83QlJxU1pDMW1CSjI4L2FqcUtDYi81SHdVdnpmdDA1UlNHU2pMdnJYblI4Q3EvMm00cG5sRHk5VENkajJRVFl3eGptQi9uWmJ1OTV5cWZqYzFvN0tBcU1ycTBCUEJuSEcyOHJZV0ZIWUdSQjNHbGtQcHVzSWFWSlZ6dnUwdHpMcnM4aTl0dXhyTFhpemFRdkJTd1UvTFZwYmNhd0JVU1BxYmZ5Z0ZYNDlQUlBzd2Q1K05LUHFack9YSjhYL3VLVFJOejMxcWtlVHZCYTlKSU0rVDBGMDlRU2dRb2s2d0xkUEllZXR3SjBQU252TWtnZldaZXl5RWoxSWpJWjBrVWhBWVcwZFBaa200N1VPam1TVjRFNjhNZnFTbVJZL1ZUTGh5K2NKMjVka2dxWkxaRlIycXVzTTVpaDNNQWM0bmxLcVo0OWk1aGwvZE9lejhkWEEwYnBYakdVZ3Z1K21YS1BnSVpCIiwibWFjIjoiOTJlOTg1NWMxYjU3MDhmMTNkNWViYjdkMmIwNGMwYjYyMTNmMThkNWZiNjFmMzgwMjQ4MzExNTkxZTBiMThiMSIsInRhZyI6IiJ9', 1, '2026-02-03 06:45:04', '2025-06-16 15:34:19', '2026-02-03 22:39:53');
INSERT INTO `pqr_8x3m` (`k5_id`, `tya_tp`, `uio_tt`, `asd_msg`, `fgh_ic`, `jkl_cl`, `zxc_at`, `vbn_aid`, `nmq_am`, `wer_uid`, `plm_ut`, `sdf_un`, `hjk_ue`, `lop_md`, `kiu_ir`, `yhn_ra`, `ujm_ca`, `bnm_ua`) VALUES
(23, 'update', 'eyJpdiI6IkNvOWtmNlk0a1JCaHMwazZWYmVGOHc9PSIsInZhbHVlIjoiTlRPNzFQV0pJRDg3d0J3UWJmWmF2dz09IiwibWFjIjoiN2MyN2QxZTQyNjU1MTRjMmI4YTBlODcxODNlYTE3ZGU4NzA0ZDNiZjllOTA3ZTk2ZDVlMTUzNjI3YTg1ZTZiYyIsInRhZyI6IiJ9', 'eyJpdiI6IkJNdVJlU2hCZGozV29QTEhIZHVLSEE9PSIsInZhbHVlIjoicEM0cUtRZnBLeVdNaFUzdWlicDNoMWVEbUE4YjhTcHBHcitOYks3Uy83SEtTRlNBRUJ0M2NWWEdNZ05ab214eCIsIm1hYyI6ImFhZjdmZDEzODY5YjcwYTQwNDhlMzM3Njk1ZWI1NTQ1Mjk5OWIwNzhjMmRmMzlhNTlkMzQ3NGJlNmNlOGM4OTMiLCJ0YWciOiIifQ==', 'eyJpdiI6IlFGRzZWQ2JUUFV2cG12dTlZbncxYnc9PSIsInZhbHVlIjoiZmREUGE4akVwcHNEbXFsY0c1Wm45dz09IiwibWFjIjoiNTE3MTkyNTg2NzA1OGE3OTE3YjZmMmNkMGM1NTk1ZjI3OTYxODc0N2U5MjU4ZDQwNzQ2Yzk5MGM5NzcwYzU1YiIsInRhZyI6IiJ9', 'eyJpdiI6IkkxR1h6TEZjSHhyS28yT1JWTGVkRmc9PSIsInZhbHVlIjoiUjFBT0laVit1ekZyN3FNZ2JSZzNVZz09IiwibWFjIjoiM2QzMzlmZTliZDNkOThjOTUzZDExZDUzYTdjM2E4NDg3OGI5OWVkMTAwOTk5YWFmZWZiMDIzMDU1N2I3MDcxOSIsInRhZyI6IiJ9', 'eyJpdiI6IkFKWE9tUkxMUnQwc3lSQzVvMWF5S3c9PSIsInZhbHVlIjoiRnIrRWNXWEx2SmVKdlQxTm5ZSHB6QT09IiwibWFjIjoiYjJjMWQ5OTkzZjBiZjQ1YjFkMTI2ZjJhZWYwZmY3MzNjZjkxOWEzODc5MTIwY2YzZGI0ZTRhYzljZDgwMmYwNCIsInRhZyI6IiJ9', 1, 'eyJpdiI6IkExcVdabmxJblhhcEw3ZFF5ZlNjNUE9PSIsInZhbHVlIjoibXZkdndFcTdESFdMbXllTlg2Mmo2SStIZkpvVzNYNVcwWUN4cVpXWlFwRT0iLCJtYWMiOiJkZGE5OTkxN2FiZWQzNTRmYmQxNTQ3Y2NkMzQwMzVjYjRlODY4M2ZhMjIxMzQ3NDIwZGNmN2Y1YWZlYmQxMjQzIiwidGFnIjoiIn0=', 1, 'eyJpdiI6ImRFcVBaZHZXSC9oOG1seW1zWTZiUVE9PSIsInZhbHVlIjoianBVZlN6N2tHNElVaE9CMUZDeStFdz09IiwibWFjIjoiNTVkZDc2NmI0NGQ5NmViYWQzY2NkZmU2M2ZmMmVjZTE1MjIxOTk1ZWFkMTkzYWFjNDk4NWI4NzA3YzNlNGM0YyIsInRhZyI6IiJ9', 'eyJpdiI6InJ5NnU2N21RQWtvbmtybGZxMWpxaXc9PSIsInZhbHVlIjoiak5PYk5kVmhHNis3QzlRWVFTdzFhUT09IiwibWFjIjoiOGQ0MTlkM2NkNmViNTViMDBmNjI4YjU2YzE4OWU4MWFhODRiMmFlZmYyNmQ0MDE0YWYxZjdhZDllYTdmZDBhZSIsInRhZyI6IiJ9', 'eyJpdiI6InVNN0VaWUJVYnZLbzk1NWhsTVc5emc9PSIsInZhbHVlIjoielkwUUllb29vZEVKWGxFM01WeWQ1Y29tc2Q2N0xFVHNBTzM0cFAxL0d5Zz0iLCJtYWMiOiI0MGUyM2I3ZGY0ZGZmZTlhZTk4Zjc3YTYwZmM0MDE5MjYyYjhmOGU4NGQ3NzQ3NjA1YTNmZGEzMTBmNWE0YWUxIiwidGFnIjoiIn0=', 'eyJpdiI6IndGZ0MrTjhTbjNRNWNhZzNSWnNWMlE9PSIsInZhbHVlIjoiaExRMVZ6SzNiWDVjYnA0YkFETGwraTlSRWwxN2gyM0ZpQThOVXVLQTV5dXkyemFpU2V5cVg3eUYvZmdEMkkwcVlLaDNvWU5rZ0h6WGtiSWVrM2UyanBRMDlyLzdGS1lkTWFkTlpWeHpOdldoNy95c25qZGJuTGhZak1xTTJLZldRdnRnOHoxeTdKV2VFWFVDekNsdEUwZjJwWHc5T2ppd2JKNEV3bVMwMmVVRmxXTXRsTjNkS2s2K2IxaDhRNzZmdFZzcnhkR3diM0p6WEdCOEtLRW9udWZqSTdNbk1reTFDSnJkejJITEN4WWFjczcvSjN0dlBzcE9EejBYbG5xTzRHa3QxVjZjNklKcVNXMHROOVNrS3RKcE9mWG1xajZueDJycHFqYTZrTk1UTVI5bVNRTlBudnp4Z0JJV0czOUM4Zi9zQ2phdlRMRnNwby9MdEYrRXNSb1o4bzZiRURNTkNsUkdLRlV6bXJZRTVSVnkwT0NuR1k2bDEyYitzUUJMdmhJYWlKTDFGcHBhNlk4Q0ZHemxCSnBIZTdoT2d0Q3hRMEhXRm9HeXR0SStmUXFtU2p6VHJBcDI3YXJQcTZUU2trNGY5ZUJFcVUrN3RjeDlMbXB0L1VYcmJNd3ExallNQjRsL0p6ODkwVkwzKzFrcTJZYklnZTd1NUx0eFRqMHQ1ajdzNHZXem9ZZDdQNXF6d3FMa3N2L2RyckYxbmNvV3JEQ2FrUzU5bUZ4NHlNelkzVzdkZ0dsWFhlZXQ0MTRsWEN3STBacXFoYmc1TmhCZ0l3RkdKYStQNk10TGE1V2c5RGpTZXR5QVZ6MUVsbUZhRlNRdnpjVXlHT1pabFFiT0N2ZmVuNHVwVUY2TVVDRlhocUhYOFRxTjRwa29uWEFMSWxNSnRuVGJBbFFNVHlaMy9XejRZQzUycWtycUVrcUpRQ2N3bGFCekErdm8xa3dJdml0UDJ6bGEzY2x3YU1qQmRQQWFQMmRJVGk0Qk5xM2NpTFh2NVNBejBzcGlkYWRPL2tqQlYxTW5NZHh0Z2U1bU9aK3VvL1Vxbkl2OHJzN1BwRWd2SG10UzlIOU5rVllQMHJSQnRxWjFOampGL2oxTU51V1RnWkE3ajJCVlM5bkRkUm5Yd01iZDhCVEVRNm9LbXdEZ01jZitrWFpiNUFnSHFvOHJOaSsrb04yUXRvZVV2S05sKzB1eWlpOUhtTk1GNkVUWGc2bHpwSGk4THNZT0lHSWI2YjhQL1laNzcwMVZ0M01iZHNxN1VIYzd2aTR2dDdiWGIxczFXQjRBUWtFdmFXUTI0dU9qM0pXWkxZa1VqaVB2WkhEdnlMd3Z0Ymx0WVJmZUhIdTRCT0t4Um84M21kendZZnRwajNEUjQ2SXVXOU5EWGVOd0RJT0VCbzA3eXJpRzU5TDhhWEhobEFqaUJzN0xBRFJlR3hSU3orZWU5YjFCNHlBWUdNbk1Da0pOQ2lqaGhxYkd1SlRrVk93c1RDQUovb0dtb3ZTVXRJYjlHeUVsdFFSa01oMDlWS2U4YU9hR3ZFMXJOSVlla3lYRXpXLyttWVc5VzQzTzc2YnU2dERNK1VVN3BudkZXTlcvS096eVNnSkFqelo2clIxK1dOcmJFWlpqTU41K0JHZzZNUHhuYTF2RHBNa2hNTkNLYWdBZDRyTnI5RzR5VW4ycUtpOFBtSXdBbnlrL1l2MlJ0aklodGs2YWVVTlZibnNwRUpZbG45UUxoK0VkYlhMWmFKY3ptQ1hLVzJmVlZYbW5PQ0hEdW43QlpxQUVacE51cnk2RkZJc3krRGJEQndMTXkwU3NVMVBCd3lLdENKT2NoM1JUeDBmQjRZbE95Z3QvYjFBYi8vMldXSEJ1WGxYbmJKZDBXNEgwdjQ0Y2twUDhmVmtmMytURExGeS9TdS92RTMzYkZOeUFkRWFDa0pwTGVJQnFhNi9GMlBqYjliS1o0cXc0Vmp5emFiZkdTdVFLL21EbTRId1lTTzJETjJKZFNSK3VDK1BYWG0zVkJJNFRSZkR1S2hZWDFNLzF2eHJKRHNoNStndzhpR2FHeFdCdnN3VE9Uem83ZTgyamNqOFl2YUU2aHBrMTJ2Y3hPM2xwODVvckFUTkoyNkRlUGpWMXAzNmtnTmZXT1VJaVNMR0F5a1VEb0llTGtITUxJMTlURVdGN0oxaGxBU2EyVXRDTTI1UzVnZ2liRCtYb0Z3TVNRd3FIVkdWN1VzVWluc2hxTGRmUFErT1VoL2ZHRDRLTC9La1dLeU5HRTVHS2NaVDNJNjJXTWhsMDZBK04rMVdEVHd5YklPSGxBZkVIdHg0elZUcURaUT09IiwibWFjIjoiNTJmYzBjMGVlOWQ2ZTAwMjY1OWU3NmFlMTE3M2Y5ODZmYjUzMzNiYjQzYjdkOGIzMzY3MGJkZTQ3OTQzM2Y3NCIsInRhZyI6IiJ9', 1, '2026-02-03 06:45:04', '2025-06-16 15:52:16', '2026-02-03 22:39:53'),
(24, 'update', 'eyJpdiI6Ik53QlBUakc1bVJIL3FQRkRjM3M1Q2c9PSIsInZhbHVlIjoiNEduRCtGbCt3eEZyR2h6aDB0S04rRVYwb0lJWlAycy9vN0srVXJ1Mm9uWT0iLCJtYWMiOiJmM2U5NTRiYjk4NmMzZWZkMTc1YTgyZjg0YTE5NmI1NjliZmFkNzdkZTY1YWJhYmI3MjkyYmNkYTliYzRlMDI5IiwidGFnIjoiIn0=', 'eyJpdiI6ImduRG5pRWlKT3ZnT1ZWS0pENjNDWFE9PSIsInZhbHVlIjoiUTc1TU12REEzM0FOOHZZNUVuaGMvb1g5T2lTaytWaUErbWZtT08vejk5bjF4dzlpZ0J1TkQrby9LYjRIdjBSQ25MNGQ4Z040elVxSHRqeXVGQ1o0MEE9PSIsIm1hYyI6IjhmYTVhZTRlNzRjMGIyMTE5YzI3MjVmMzIxYzAwNGEzMjc4NDg3MTNmNmRjMzBjOGJmZjhkOTliYTYwMzc2MDEiLCJ0YWciOiIifQ==', 'eyJpdiI6ImhiaGl1NUZ3ZWpsSUtLekxsZi9FZ3c9PSIsInZhbHVlIjoibUVNSFluY3ByQ1dyaWY3SEhuUHFmdz09IiwibWFjIjoiOWQ5MDFkMmI2MGE1ZjkxMjVmMjY2YWZjZGI2ZDU1ZjNhNmFkYTAzNjVhMjg5NzlhN2MwYjFkNDg1NGU3MWZkMiIsInRhZyI6IiJ9', 'eyJpdiI6ImdVOG5ESk1vd1J4eGhtaVlEeVlIL2c9PSIsInZhbHVlIjoiOTdXQUxBTlUydTdabFg2UWNkbnhOZz09IiwibWFjIjoiZmM5NzhkZWVkZmJjODEzYjUzN2JkMDU5MzYzYzMxNTFkNDAzZTdlMmMzYzZjZWVmYjNkZDBkNWY4YzgwMmM5MiIsInRhZyI6IiJ9', 'eyJpdiI6ImM1K2ZVU3ljM3hzTTFMQklGV2RtOGc9PSIsInZhbHVlIjoiMEo0YXdKU2RWakNXellUUkhKdFBUQT09IiwibWFjIjoiMGFkZmE0MDhmMmY3MjhkZWJiYzNiNTIxOWQ0NWEyZTljNWIxMmFjYjhiMzkwYWY0NWY5ZDkzNmRkZDZkY2Q4ZCIsInRhZyI6IiJ9', 4, 'eyJpdiI6ImxSemJvTWRReStPdmtTSjhoUWNKMUE9PSIsInZhbHVlIjoiNGFRZS9YRTA3OXM3TnpuTERVeU5WSk5nc3JRQXlQQklEQVkxRUVHMGdNZz0iLCJtYWMiOiJkNjA0NTNiMTVmZWUyOGViYTA3NDQ0MjUyOGEzNTEwMmFjZGU2ZmU1ZDcxZTA4N2Q1MzRmMGVkODA1YTkxYTE1IiwidGFnIjoiIn0=', NULL, 'eyJpdiI6IjB4TlpMWmhxZDJ0OWROc3ZhbGNpWGc9PSIsInZhbHVlIjoiVTZpc0ZDVzAwYVhmTDhIbGtCN1I3QT09IiwibWFjIjoiNzc3Mzg1Y2FjYWFmYjYyZDdhODNiNzAyMDFjMzViYzkxNDFiZTUzMDEzN2QzYmUzMmU3ZGY4MWI5NTNmNzg4NSIsInRhZyI6IiJ9', 'eyJpdiI6IlJ6Q2Z4WjNRdDJGdU9BWVlsbVlTeHc9PSIsInZhbHVlIjoiTDQ2ajZDblp6aXpyb3dJTklNVE9CUT09IiwibWFjIjoiY2JmZTMxMTIyZDJhYWU3MjUzZmQyZWM2YmFmNGNhYWNhOGFkYmMxM2NjODhkMmY2YThjMGNmODRmNGFiNGM0MCIsInRhZyI6IiJ9', NULL, 'eyJpdiI6IlZHcmhOOW5lNEs5elRVc0c3N09aNWc9PSIsInZhbHVlIjoiODg2UHpka1UyVC9LdS9TTm9xSDdKVHFmb0hQK0ZMSFR1N1FpanFDRlFIalhPd21zTVlIaFp3M3creEVlWjRyd01uSFp1RkJYY0NBMGtnLzJnc1BvUFVtYmRmekY4UFhZdDN2RzFKejZWeUFPK3ZCcENOczFEWTNNMHRLL3BRNjJWRkl1aEx2enZUQWhBbGdrVUoxNHFCNDFnNE9MeG1PU0VzMkxoTHlCOXFNaTFVeHBkYzhZaDhhZm9tYjVmT0lmYlVpYndQZVNabys3b3VVNTY2OGVxUWJ2SEh0TUxENmVhREUxRVdPTm1jWnZjMDkwNWpvR1FVVGd6SEp1UFp1ZG5CbGRLdkJnRVpMb1ZRSmlmT3lvRDV2V256MHErYTE4cUNFSzJ2MjQ4dzNYaDlYZDF0VVJJUmF6WTZGeW96V2ZjWVZaV2NPQVB5cGZmTkxoVUJiNThrd3QvNXJ4K0hubFhmWms1a2ZZV0dIaVJWciswWGtwMGhLWGg5aEY3eU1KTTFFMWptelpaQisvRTFaK0ptUW53Vkw5bUluY3U2dmo3QXBEMXlmL3Nla1U3N1Z2S3I2RHRqZVBTSllEdTRiMGFNQ3ZGYUhQTGJEbUVpMmhZQmc4MUxZRmNLMXhNWDUxL3VEYUdVanpYdFNvM21EMjk2THhIeHI2R0gyVm5uaG5NaElGTE1xVE15R0g4eU9ZVFc4Mm5JdVJ3RTdka0s1QWtyRGNFU3RNMUdzR2dtRmUvOUliR04rSmgzZDFuVHMvRmVjMGtuZlpUZE1Wb0xzY3YyNjVtSktNWkNUWXF4SjdCbkpGWTg2WGZobURXd1lDUTg5TStnNDdJbVk0WUExZ2FJWUcybEtaOG15MVVNUy9DTTFOWnQ1bmMvK0FXVHpnVSswTFVLMnMxWHBZelZvdC9VVGIrdnpFSkdscVB0dU9WRE50dnN4Y0JHZWxFamFybXh1OW5iZ05NK3NETSt0b2pQOVhkdHZucGoweG1jZllVVWg0VUV2NWNLK1ZFRkpjcnpaMUVFNWxqUWR0SnNQb2psOGJrV3Z6MDQvRWRhbi94SmU0UUZpTTQ1SFJYdmFETDVxdUZDMEQzSnJBSW1NdjIramErK1duTm01ZW54VWtNZjlITkE9PSIsIm1hYyI6IjU5NjEzYjJlYTZhMTMwYWY2MjAwZjM1Nzg1OWNlMmFiMTlhODAyMDZjMDY1N2FjNGU4Y2VjMzYzNjllNzVhMGYiLCJ0YWciOiIifQ==', 1, '2026-02-03 06:45:04', '2025-06-16 16:04:01', '2026-02-03 22:39:53'),
(25, 'update', 'eyJpdiI6IlBvRWpUQ21EamhrTjcxSUd1N05QQWc9PSIsInZhbHVlIjoiSE1odFFnOFRJaXRoMDI4eUdaelpHOUhRSUlLTU1XZ3hxWW5nZ3ErUkp0Yz0iLCJtYWMiOiIxNDE0Yjg5YmI0ZjkxYWQ2Zjc3OWJhMjI2MzRkZDkwMmQxODk1ZDkyMWY1ZGVlYzU5ZmEwN2M4MTZiNmIxMTBiIiwidGFnIjoiIn0=', 'eyJpdiI6IjU1WHRWSHVZUU1SVG5rNFdGRkpoekE9PSIsInZhbHVlIjoiZU1aRmhLSGREQ1NFUFMyMWhxY0cxQVNXMFZpcTdnWmhrVjhnc2NmVUgzMGFXNVY4eTdiRTZQZ2hBVU5pM09FVEMzYTA1T2JCOG8zSW9LTFN3RzVReVE9PSIsIm1hYyI6IjVkZGI4NjNjNDlmMzM2ZmY3OGUyOTdhNDEzYTUzNzJhYjMxZGM0MjUyMGViOWZjN2MwMDE3ZjczMzA2YWEzMGEiLCJ0YWciOiIifQ==', 'eyJpdiI6ImtKQ1l1dmNWaG5qQ1Y3WHV6aXdTZlE9PSIsInZhbHVlIjoiN3cwYWVTbU02ajJBd3VFak01dmE3UT09IiwibWFjIjoiNjcyZWUzMTVkYzQ4NDM5ZGFlNGY5YTQ2ZGVkMmZkNDVjZDE3NzQ5YmVkOTEyZjJiMzg3YTY4YjQ5YzVlYTJiYiIsInRhZyI6IiJ9', 'eyJpdiI6ImpvTkF0aFJiVW4vKzJ6Z3pnWGlIZnc9PSIsInZhbHVlIjoiY2tOK3lOK3V5cFZKNjRBTHc3M2pFZz09IiwibWFjIjoiZGZkZGYwOWE1MjIxNGVlYWM1MzA4MTU1ZmZlMDlhNDUzZTk1Y2I2ZjUxOWI4MTk4M2RmODY1NTU2MTg4YmFmYiIsInRhZyI6IiJ9', 'eyJpdiI6IkpraW82cmZ6N1FjZWdBdDFDb0Y1Rmc9PSIsInZhbHVlIjoiZHE4S2hudmhFM1FzVmx4ZysxazFQZz09IiwibWFjIjoiY2U3OTE2NzZkYmI0MzA1N2VlMTk1YWIyMDM4ODM3ODMwMjQwMGQ5MzU2OGEyYTI5MGZhZjAzMjg1ZmU2MjY5OCIsInRhZyI6IiJ9', 4, 'eyJpdiI6ImlFcXd5anNrS3RkUllQbmNxbTlIdUE9PSIsInZhbHVlIjoiRmpva2YzcWFjZFplNjVMVEFJSlVxaW1kY0RYZVI3U012Y1BnODV0OEowYz0iLCJtYWMiOiIyNzc2M2FhYjdhNTczNWZkZWQ2MmRjYzY3NmRlNWUzM2YwMGRiZjg3ZTQwZGZjYjRlMWZmMWI4YTIyYmU3MDE4IiwidGFnIjoiIn0=', NULL, 'eyJpdiI6Im9wT1VQZ0ZnUVBGd1JXK1U3a2I4QkE9PSIsInZhbHVlIjoiLzYxWUtPV0FuUVRhWjY3R05RTTNudz09IiwibWFjIjoiNDdhNTcwMjAzMGJlZjFiY2FiOGNiM2ZjODk2ZGMxZDRmZjE4MGJiNjc4NzAwYzAxZWY5MWY0YjRiOWEyNmY2OSIsInRhZyI6IiJ9', 'eyJpdiI6InNLV2xKdUJldDdXK2dTbFl1b1M5QVE9PSIsInZhbHVlIjoiam12TWphanhKMENTMVZ5ZGJ6cEZkdz09IiwibWFjIjoiZGFhNjc5M2Y1YWI2MDY4NTMwODcyY2I3N2NhY2IwYmE5YjdhZjViMzY1MGJmYzcyNjUyMWNjNmUxYjUxNTliMCIsInRhZyI6IiJ9', NULL, 'eyJpdiI6IjBSRUMzVi9GNmtJbFV0ZE0xUVcyVnc9PSIsInZhbHVlIjoiKzM4dlhNYnRqTkpCb0pQUVF1MUJjU3RlLzdHVnpFL1d1MmxYVjk1dE1SaC9Xc0hVOUVJeEJkdDFmR0xDeVVUSFJyeEgwSWZ1Sis0MDZjcTh2OW9laStFcmliOFBBNWtOM3BzYTU3OTVreHJOQlovbU03bjkyclFMRkNsNTZ0S29rWEFxM3pzekovakNEOGU2ZDhpc2VJMDZTblJlRVRGWVpnZDZWUEwxYkNCSnJOR0hwTGZGcjJqU2lTRllYVUJSVVFzVWpibFBXdWFlM0J1RmduejFpa2hTNEtmVjdMS2lmeGxkNTZFajdlN3NrMEp2RVJZN25rNjU0c3JZSzhyVm04dU1XTUMyTXE1NGlWVC8zYkp5MDRtK1VIeDJkN0F1WUtTdjFZWFQzOFJLSGtGUUtnQVRzZTlLT3piMkdxQU9pTzBaMXF0ZFlWcmJkZ1dKVktvQTMzeis1dmF3YXZocVoxcTlyVC9EOFVNWklvU2VTT0tJZWMvMnhmOWI5RWV4UktYUElkQWhUamZXNFYwNHNWdVRDU2ZoaElYTXBaTmxER0VtOTM3S1ZyUEgyenRDdzM0UUNhdGtmNE0wSjlMN1VVRTd0Mks1YlBiUjludnp3bjEvQTJhdmZHWHNhbnJPYVQ1ZHhUOUZLcCtaNVA4TEhaZzV0UjAvTkpwaWJPNllreGM5blRwRUU4WGRkYWJBNnRwRzNZRTlRRmxUUXVpSTBPTUF6UWpUWFpSRUgzMUdBU094Q0VOQSt6dnY4bDlKSGlaMmhLVHIweDcvb3RsR1ZpakVWQXo0VmlSckRhRzJqL1dVd1g0T1l6MDlrUXUwbWErQzg4WVkrZUI2WVFSTjdVUkJ2Z2hoNXFid0VvRXlJdStrN1k1MjNrRkFCWUc3Wmp6WjhoRXEvZDBnWHJrVFBGU256NXNweVRhRXdhcnI2bkk2SjIyNXJITnBXM3RUdDBCQU5yQUc5cHdKTFdBMGJoNWlpdXo2OVBGZnRtbUY0K2VFYWs3VXp6a0VGQlgyQUhibHpyeDJ6U1dEMWczS0gxaFM1a1hMN0h4NFFUQmtnUk9RdmxqL2hIckY2QmlleGlLVFlpUURUZ2VQbHJzUUY0bGtrVDA1VFYyVk1YY21YckFGZ1E9PSIsIm1hYyI6ImM3OTdlZWM1YzI2MTNlN2IyZjhlYWQ3ZTcxYWYyYjIzZWJlZGM0MWVmMDM5MTI5ODAxNjFhNzU4YTIxYmZkZmUiLCJ0YWciOiIifQ==', 1, '2026-02-03 06:45:04', '2025-06-16 16:06:01', '2026-02-03 22:39:53'),
(26, 'update', 'eyJpdiI6IkhUU2ZUSTFTZG1yeEVQWE1RcHM0NkE9PSIsInZhbHVlIjoiQm93QzJkWFhEREVGM2I1cXJ6VkZxaDA3NFlXT0xZMHVSeUpndFZTcVFMST0iLCJtYWMiOiIzMTI3ZmIxZDk5MDMwNjRiMWU1ZjMwYzZhYmFhMjZiOTM5MDczNWMyZWNhYzlmNDlmMmU1NDRkNjI0MzlhMTc5IiwidGFnIjoiIn0=', 'eyJpdiI6IkRoSkczRisycTkzWEFRd3V4d0JRM2c9PSIsInZhbHVlIjoiNDNUWE81cldGRFpBQVBWVmlodllldXRNdDAvSUtyNGhsTjExMVNZMU1LbUFQS1ptRkpwUXFZcWpGL1BrRDd3bWZqRzBUT1dTT1RXbUVOb0JXcHFSVXc9PSIsIm1hYyI6ImI4OTdhZDA0MGY0Njk1MmFhYjgwZDNkZDkzMTczZTQ0NjgwNDg5ODMxOGFhMDk4NzFmMmZlYjk3MjM4MDYxM2QiLCJ0YWciOiIifQ==', 'eyJpdiI6Im95WnFhSndVbktrRGxFaXNpM3htc3c9PSIsInZhbHVlIjoiOVZxdktwYmNpOFBkZHREVHB0d2FYZz09IiwibWFjIjoiYmU1NjM5MDVhYzEyMjA3OWU2MzA4MDhmNzcyMmFlZDg3NDVlZjM5NWEyZWQ2ZTNmNTg4OGY5Y2ViOTgwNWE5MiIsInRhZyI6IiJ9', 'eyJpdiI6Im9yNHZ1VzlqL3BndTYzMWpBaW5vaWc9PSIsInZhbHVlIjoiU0pkRHdrcmNvc014MmY0VzRJSTV0QT09IiwibWFjIjoiYzNlZmQ5MWNkN2E5MTdmM2Y3MzBjODhjY2YwNzllMDQ1YTgwM2E4OTU0M2M2YmEzNTZmNDRiOTc2ZmJmZjlkYSIsInRhZyI6IiJ9', 'eyJpdiI6Ik1lN1lMTDFnVVhXSlNhdHg4ZGpBOVE9PSIsInZhbHVlIjoiZUdGejllNjVRYlRZQmpNb244bEV3QT09IiwibWFjIjoiZTdhNzUyZjgyZDExMjg3MDY1ZDU5MDRkMmVhOTc2YmQyZGU5ZjRhZjJmMmVkOWYxNmM2NDg5MDc4ZDRjNmM4NiIsInRhZyI6IiJ9', 4, 'eyJpdiI6InNWOEx1Z1cvU3c0K29ZNk5aeXRkZnc9PSIsInZhbHVlIjoibFNvUHlQZjVtaVlMeENxS0VrWXFTR2FPeGgwa3FGbi9RUHhOUTVJbkRHMD0iLCJtYWMiOiJmYmIwODI2MjliZTUyMmEyZGFhOTRiYzU2MWEzZGRjOTQ2M2Y3NzhiNDI5MmI0OWY0MTdhOGU0NGUxYTZhNjU1IiwidGFnIjoiIn0=', NULL, 'eyJpdiI6InJ0dDh1cUg2MjVWY3IvTDVPVWRhcWc9PSIsInZhbHVlIjoiblE0SlpIUkNIdy9BNTdwazBmcFlIZz09IiwibWFjIjoiMDk0MGRjODBmMmJmZTUyMTk5MGMzODJhZjk5NzAzYWY4YTA4ZWNhNzc2NzA1ZDJkYzZkMTEwZjg4MDQwMGRlNyIsInRhZyI6IiJ9', 'eyJpdiI6Im43SVpwa0JtVUw0YUlNRVBGTTNrTmc9PSIsInZhbHVlIjoiYk8rMkRkWlZTZjY1RU02dWtqUENWUT09IiwibWFjIjoiOTY3MzdhMzljZGMwYjQ3NThiYjA1MzZkNjkwOGNmZTI1N2RjNzY2NGUyOTQ1Mzk3Y2EzMTI4ZGE0NjRiODMzNCIsInRhZyI6IiJ9', NULL, 'eyJpdiI6IlBZVE5pRnVRMWowTHJONjA4U1VUR0E9PSIsInZhbHVlIjoiK2FQcXJaM3JxTzk2ZlJyYU1hRHA3R21leFZYY25VTGpBZnlwdWhORC9BUlB0SVFXUFhrUFNqTUkrSnVhU3Y2U0EvUXBaQXN1RDlKd3F0NDV2NHprVVQ2SDk5c3JFNTRPVDA3Tmg3aXE2RzBUdklKcWFnWVNVT1FmbXFaaGhmck10c1RENGxuUmNNSnkvZnppY3dGZTVrL0FTWU82VWVrZDBJSjZ6ZGpLbTd3NEdITDJzZ1dxb0xGSHBFb2w4U3NBOHQ5c0RjTEN5a1ltVHZHWnlTTkFPdm1ub1dhWi85eFhUbW81R3lua3hXTGlySFVPSGVFNnRhYXZpMjBGUTBCSXZpRXE2RUFjc3VLeEFVMXNLNmVaN1dkbzluRGNrSUlIMDBsQ1dxaG5STnNQb2ZLakhhUTNTSGFtOS9YaVVDYU1pbHFEVHBmR21qSElDTmw4akkrOVNtVk41cCs5TS9tVlVqbER2S1d0b1JrOWd0N2ZLaCt3b0paM0pqbFBoaWZ1VHgrV25hOWh3dlNSWE1YTDlOdXV5NDEvaGQrcllndnZlakVEZXdXN01yNEwreVJiODhGQWljZHZiRVk0TmMxc1lGbjEyWDdmamEwRm5MS2E4TEdvaURnMjB3YzFmcXNjOCtJbFl3R2ZzNHA2U3lvOG92MVFWdE9nYnFtZ000eWJVRDdpdUVkRmgzdzdVVkhqT0tnZWZ4NmcwUTVTNXNzUnMrQnE0dkhSZjdlOURJK3ZLREVycFQvbGFOeExGc1dUTkFxYStBWm1uMjdmVXUwaVZDVTZ4Qk1ROVNqbkxNSkZKeG1xNDdueXkyN0dsOUdMU3ZHNHBlQVBqUEx4K2xZRDd6ODJDMlRjQkZ6NStXQXBGUFZJSnhNNzVIa1U5azdhSTVBSXArNFFqMlpGS3VldzdKQVR0NHV5L2VEUk1ib0FzV045YVlXT3ZiRzNEQVJCcTdydXJQWWFZT0FQZ1dZWVhCTTdjdUNzSTcxeDZBUVJBZGdiNzBKU3owUVR5Ny9aVVBRclE3TjlGN2J6eGtYbEE3VnVoVHdyV2dOcEJ6b1pBaDd4aFp1SE1ObEFsblZWZTIreVhoSGhsMG5WSmFvbUhyVi9Fb3k3Y1RxQkFYYnhoaHNKL0E9PSIsIm1hYyI6IjdjOTIyZmEyYjRkYWRiMDdhMTgzYzk2MDFiNWY0OGFjM2JlMzBiYjEyODQzY2FkOGU0NDVkNThlMmQ0MDg5NTYiLCJ0YWciOiIifQ==', 1, '2026-02-03 06:45:04', '2025-06-16 16:08:02', '2026-02-03 22:39:53'),
(27, 'create', 'eyJpdiI6InFIUGNkWWZjanY3bzFXeGJrZWdJUWc9PSIsInZhbHVlIjoiMGdrYkJacjJtT201NnVRMGRkbnVXb0ZrSmpTRklmSlh1dlQ5LzMrZktCbz0iLCJtYWMiOiI3Mjc3YzBiY2YyMjFmZjZmOTAwNWM1YTMwNzJiODk4NjBmMzJmZDJmOTRlYzdhZWEzNmNjYmYzMjAyOTI3ZGUyIiwidGFnIjoiIn0=', 'eyJpdiI6Imp0NlIxYUovT1NJU09zQ2s0RGQ3SVE9PSIsInZhbHVlIjoiQVZycUpFelg4M1NVYWQ0RzcreEJEa3lsVC90MzZwNEZBcHVvemVqMnhLTzRwZzUvUVpWNHFFZm1xSDQ2UVQ4ZFpUektWY0lFZ2c3NGVQY1A0NFoyd3c9PSIsIm1hYyI6ImI5NTQ0M2M1NWJlNzFkNzk2NTk1ZWEwNmZkMmQxNzhkMTczM2Q4NzNiNTQ5YmM2ZjMyYmE4NjQ1OTZjODNkNzQiLCJ0YWciOiIifQ==', 'eyJpdiI6ImViSG1iZC9pTkJFdGdZd0RPT211SXc9PSIsInZhbHVlIjoiR0NGL2RTY1ozWU9DZms5RWNpcGYzcVVkMUhsUVUvdDVJZHlRUnpFV1UyRT0iLCJtYWMiOiI2YzliNjIzMDUyYzM4YjI0ZTY3N2JlZWY2NjM4ZTc1ZDVlNDE4NWIzNzFkNzc3OGVkZmFlOGM5YjA0Zjg5MGRmIiwidGFnIjoiIn0=', 'eyJpdiI6IlZ2QUcwQ0llQ3NYdWdTNlcxamNPOGc9PSIsInZhbHVlIjoib3BQUVhpZ0FhbXJ2dTVmZXA2Z0h0Zz09IiwibWFjIjoiOWY1MGVlOWE2YzdjMDNkOTVmOTAzODI0MjlmODY0OGQ1YTVkNTFjOTAyOGExMDE2MjJhOGYxYThmZTUyNDM5NCIsInRhZyI6IiJ9', 'eyJpdiI6IjlDcU9LSzd5RU1ObDdNNTYwS2lYSGc9PSIsInZhbHVlIjoiSkUvUFFYK2NZOEdGRHJNMGxBc3VxZz09IiwibWFjIjoiYzI5NDMxMzBmM2QxZWEwMjZhNGI3NzgzNDdjMzkyMzA5ODg4OWJjZDg0YzBjOWMwODMxNWQ2NmM0Y2UzYTg1ZCIsInRhZyI6IiJ9', 6, 'eyJpdiI6IjJQOG1LZE03dVRrM0ZyWEc3K1lmNGc9PSIsInZhbHVlIjoiVytRbTNnemhHbVdpVFlRWVRiVUQxWkdUdmpUTGJKcTlJNWZNcEdPNU1WVT0iLCJtYWMiOiIzODg4N2VjNTE3YWEzZWY2NTJkY2M4NzA2YTk5ZTlhYWIxNDdmNGZmZDM1NjQ3YjJlOTljYTRlNjdiZWZlMjY5IiwidGFnIjoiIn0=', NULL, 'eyJpdiI6InlJbVR1WWcvWUJXZG1TZmdrdUh1eXc9PSIsInZhbHVlIjoiMndGaEkrTy80aG5oSUhGWDdqMlozdz09IiwibWFjIjoiMWQzMzUzY2E4YTA5ZmMzODg0ZTZiOTI3YWNlNTg4ZjVkMDgzY2I1NDY5NTg2MjIwZjQ0NzI5MTk1MWEyZTQ5YSIsInRhZyI6IiJ9', 'eyJpdiI6IitBbnlxM3FIM2FZUGl4KzZBUG85TWc9PSIsInZhbHVlIjoiSU9Ielo1WktkUlNCQUMvNkJsRnluQT09IiwibWFjIjoiODYzNDg5Y2Q4N2JlOWUzMGEwODQ0NjZiNzgyNzFmNjk0YmRkNjRmYmUyNjlmM2JhZWIyMGE3MmRmNGU4M2M0YiIsInRhZyI6IiJ9', NULL, 'eyJpdiI6IjdRQi9CNzhtYzlsa2VMNjV6alBONkE9PSIsInZhbHVlIjoiYWJyeG9aNUV5SGNXU0RzRWZRTEV0eW1CMnBJNDVRaTBMdkhXeXZINGU5Z0NNaExGSzRPWEx0OGJzRktmV05QV1BBQ3I3cTY0TThRUjVrcm5POVBsSjNsZkVsM0hFOVVKUnlJZkFnWlU2c3E4Mkg4KzVvVjdZaFliYzQ4TGxrWlcvMmZndTdmbVVXU0Vydk5ianA4d2ZMaC91WWtZM1VQUlYxTEVFTzYycW1Gcy8wTG1WSWF1TVF4dW91L2cvbmlqYWZ5aE1zL1hDbUN0UUp5MFRTbGNSQT09IiwibWFjIjoiMjY2NmNkYzRkY2I5Y2U4ZTY0ZjUyZDMyOGU4NTIzYWNkN2MzMzQ4NDhkMGFhMDNlZTI2MzM1M2IzYTYyNjA4MCIsInRhZyI6IiJ9', 1, '2026-02-03 06:45:04', '2025-06-16 18:32:35', '2026-02-03 22:39:53'),
(28, 'create', 'eyJpdiI6IjJGazNySmxtYzU0Q0NjbFVuV1lTc0E9PSIsInZhbHVlIjoiMzQ1ZUJZNTlmZktiWDlHS09kUk5LNHRpRzNpZU9GajlsOFB6VHZIMHU2QT0iLCJtYWMiOiIxZmFmMTA3NjVlMmJjNDBhZWU5NmMxMzY3Y2RiYTQ3ZDgxNWQwYTRjN2I0MDdkMmFjMzY0MWYyZmUxZDVmNDEzIiwidGFnIjoiIn0=', 'eyJpdiI6IjlYL3VhQ1hOc1poV0dQUDljVitHZHc9PSIsInZhbHVlIjoiaC9OZzVmWTFONi9qWlJBbWRUQTJHVHd5NTQ4SElsdDh6TGF2eDd0K05pL1o0eUhva2ZEdjZPbHEzNGIxQ2xYenp6Zysxc0ZaN3JYZG50RzdzVWZSdnc9PSIsIm1hYyI6ImJhYzc4MmJhNGE0NTQ3ZjUyYzRkNDVmNTc4YjA4ZTNjNTFjZDFjOTFlMDVjMGQwOWNlZDQyYmQwNDhiMTZiYzgiLCJ0YWciOiIifQ==', 'eyJpdiI6Im5kbm82YzczY0tESDBzcTV5bCtYdWc9PSIsInZhbHVlIjoiOEhKcWVZSURoU0tpcE9hUGVIUUkvUSsxN2VmNEJ1MlZwaFh6cVZUdThoRT0iLCJtYWMiOiIxMmViYmY4YWI3ZGNkYjRhYTVlNWFlYzgwOTgwNjdmZGVmM2RmZDk5ZTdjYjFlMDBlOWU5OGQ3MWYwZGFkMWQ1IiwidGFnIjoiIn0=', 'eyJpdiI6Im0vRVFHQjR6dkpVUTlmcGFGZEkxRGc9PSIsInZhbHVlIjoic0N2UnFrZVY1NkNYbGNhaXBLdXd2Zz09IiwibWFjIjoiZTFiZGU5MTUwY2I1YTE5YWE5ODExMjUwMDlkMGQxODU5MDg1M2E3MGMyY2FiOTc0Yzc5OTMxZjcyNGY4ZTFiOCIsInRhZyI6IiJ9', 'eyJpdiI6Ik85Vm52MHdFUGFRS1I1R3dpSlhRaHc9PSIsInZhbHVlIjoiT2hKNHlvQmc0bWJwTU82R0FIbjQwdz09IiwibWFjIjoiODYxNzE5MmZmY2Q0OTg2YWI3OWU1YzI1MDRjYTFmODVlNzk5YzZlYzIxNjhiYjk3NzY2OWFjZWI3OTFiM2U4ZSIsInRhZyI6IiJ9', 6, 'eyJpdiI6IlNBNkpJY1NRallROWVBRnUva0h3TkE9PSIsInZhbHVlIjoiZEZ3dlJySW1ucjJvcU9FN3hhblZQa2lXbG9CKys1NXVhT1lzaUpNYktvZz0iLCJtYWMiOiI3NzFmOWQ0MDdjNDI5NmFjN2E5MWExY2U2ODUwMzIwM2ZkMGY0YzEwZDk2MGI0ODMxMjcyZGM4ZTVjODQ5MmUzIiwidGFnIjoiIn0=', NULL, 'eyJpdiI6IkdOWmNwTGtDeGRwbmJTRzIxWmtWdnc9PSIsInZhbHVlIjoiRDdnOTJWZDRmRzFSUmhKelRJdnRLUT09IiwibWFjIjoiOTRlYWYzMTA4NzVmYzE4MzU4NDc2OGNlYzYzOWY2YjkwOTdhNTVjOTMzYzEwMTNhYzRiZjkwODJlMTZhNjk3ZCIsInRhZyI6IiJ9', 'eyJpdiI6InJrNm9iT1g1c2dSU2FZSUtVcE9rcUE9PSIsInZhbHVlIjoiOE9IYXNlVFl1Y0xPbktxNlRoWCt6Zz09IiwibWFjIjoiNDY1Yjg5NmJhMWM1ZGE4MWFiODA0ZDRlZDBjMzc0OGQ4OWVjODgyZjM2NGRlMDRmMzI2OTRkZDA3NTIzODEzOSIsInRhZyI6IiJ9', NULL, 'eyJpdiI6ImZOL1VpOG1EZzJldnBWY0Q3ZkxMT3c9PSIsInZhbHVlIjoiVUpIaWdxU29jYWRtTlpLeStDOHZNVjBpN01LNlY3NGljVG84ODFBSEg0emVhdGE3Y2YrZXRkNnFkVE12Rnd1d1JqUWdkRktCQnlKSHFObHJPYURXUVZuaHFwM0lsbCtPWmdZL2ZxTmc5V1dOUVFDa1VvVFFMZEppU3dKTkZISUtIVUdHdGh1UnZEeUV4S2xaZ2RnWXhscVZpbkdRMk0wOG1ObnE3SHAxWWQ0OWp4L0phclZuOTBjRUdOakE1OXhBV3JSV0RLazlYNjlsZWFCWnhYZHQ5bTRlMWMzTUhEK2ZUeXBDYnFzdG9Cdz0iLCJtYWMiOiJiYTA0ZmNmZjgzNjY4MTI5MzE3NzdhZmVlNTkzZjU0ZjVlY2EzMzljMjkyYjkyMTA2OGIzNzMxOTRmMmE0MDkzIiwidGFnIjoiIn0=', 1, '2026-02-03 06:45:04', '2025-06-16 18:32:35', '2026-02-03 22:39:53'),
(29, 'update', 'eyJpdiI6ImZSUXdabm9vdnhlMGVBSk16cGRGeGc9PSIsInZhbHVlIjoiNVFjNmRTcCtWN2FTMzJSL2ZrT1lIM0o1QjBrR1R5OWcvd3VSVTAxd01Jbz0iLCJtYWMiOiI3YjJiZTEzM2UwY2FjMGEzNjU2MWExOTgyYjUxMzMyY2JhNjliNGQzN2EyNTEyYjA3MjgzZTcwZWQwZDA0OGU2IiwidGFnIjoiIn0=', 'eyJpdiI6IjhySlVnL3dWMi9mTWhCVE9hQnlqVWc9PSIsInZhbHVlIjoiV001TW5hTFJ4NHBsTlM3bTJSaXdNa2MzY3FRdkdXNytCWUwzeFgrSXcwYjFFVHNva0ZTaWNhRWV6Rk43cGJ6ZWYzZThnemt0UHlpYW1sNUNYcEo1UFE9PSIsIm1hYyI6IjA3YTdhNDcwMzdlMzg0NjJkMWZiNTY2MGZhYTc0ODE2YjEzZjkxYjY2YTM0NDVmYzhjZTQwODBmMzI1NmM2NjYiLCJ0YWciOiIifQ==', 'eyJpdiI6Im9GeS95V045WkNKUWN5VTB3clNjdlE9PSIsInZhbHVlIjoiK21LQnlHV3Vndi9ZRUtaMEVtUHhpUT09IiwibWFjIjoiMTBjNDBjMDRiMWQ1Nzg0OWNlOWFhZDQ5M2IzMzI0YjY5ZDllNzRmMjdmYjFhMWY4NTMxYzcwYjM2YzhiNzk4ZCIsInRhZyI6IiJ9', 'eyJpdiI6IloxazZ6eWdYbmh0R3FJdzRIbXZqd3c9PSIsInZhbHVlIjoiTVo1ZnBkOGp2ZjN1UGcvSGpzZVU3Zz09IiwibWFjIjoiNmVmYzA4OGY2YmFjYTU3NGI5YjE0MDZmZDRjMzAzZGU4MzFjYjRlYmI1NWMyM2FjYTlkZTU5YjRiZGEyMjRkYyIsInRhZyI6IiJ9', 'eyJpdiI6IlRjY25jeHc2SzNuVXVCaVI0bXdQV0E9PSIsInZhbHVlIjoiaHVDUFh0eTJ0MWYrS3N1aVkyZTU5dz09IiwibWFjIjoiNGRmMWE5YjY0NDQ0YjBiODBmMWJhMzYwY2QzN2RiMjM2ZDkzMjZiNzg4MjE5MDMwZjZlODJkYzk0M2JhZTBjNSIsInRhZyI6IiJ9', 6, 'eyJpdiI6IjZjUFl3VExQYnhVUkVEVFk3bGFLMmc9PSIsInZhbHVlIjoianRXTkppSzdLMmJSN0NzNE52L0dpWHZkUFRvK1BWMFcwcnVhdzZHQlAxST0iLCJtYWMiOiI5YzhkN2IzZjdiZTE3M2Q4YWRhZTkzM2RjNzA3MGVjMGJjZTkwMzUwZjA5MjMzMWVmMjI2ZDdmYzJlNjE5MzI5IiwidGFnIjoiIn0=', NULL, 'eyJpdiI6IksyVXBtQzhTa2hydWhIUFU5aTFlTVE9PSIsInZhbHVlIjoiWXB0VDFyaVBLNDRpdWZORWw1M1NnZz09IiwibWFjIjoiYzYxNjg1NmU5Yjg5OWE3MjlkYmFiZmNlNTczNDA2YWNjYWY5NTA4MGUzNTYwYmNjYjk5ZTZiYzI5OTI2Y2VkNyIsInRhZyI6IiJ9', 'eyJpdiI6IjNWbzU3cEFMem9sN3lSVDBwQWJIUVE9PSIsInZhbHVlIjoicnpxN1FmdDM4clBLc0tDZm9qNmtZdz09IiwibWFjIjoiZTQ4ZWZkYTI4NWNiMmNiNjg4YjVkNzhkOWVjMzUxNTYzODg3MjcwZWIxNzA1NTBmNWUwZGU0NjYzN2QxZWVhOSIsInRhZyI6IiJ9', NULL, 'eyJpdiI6InAzbUhLcW1BbW55SFQ2azh1WHN1blE9PSIsInZhbHVlIjoiY3c1WStNTCtFUGlkRXZkZUNzYmhkZFhROVdpSEltTmtxNlV3Y1NIKzhZWDhMR0ZHci83czlRdXEwa1ZSajQ1bFdSMVFRLzE3b0xIeWxFeU9GTGI1QnZXZXRad1VwWUZJMmpFV2RZbmMzbHVBUUNhSEt5QzltNkJYRUVCbDhvNG1SaDB4QlA5VmpWS0VFRjB5Mis4cVU2NGg3aktxOHlOeWc0NEpNVFVCRnRRUFNFQlo1WFFwaG5ia2l3NFNKU3NCNXNjaDlyNk5raTkwaGRTaHo1Ulc0cFVYN2dsb3RabjhJUkNHZ3pBRjVMNDNyamZFYm53Y2xoR0lwN3ZYWDEwbllramJZYk44OS9qU0J6Rjh3bXhRRkRtbjB6MjI4S2tTTExxM0h1ZUEyY0ZJbEpSclVkazAyVHo5MWJaUWJybmNqNm5YdEJUZUtDMG42QTR5Q1dVWVdmKzhqNk5TRWd4UkphSWN0MElhcEpLalM1eU1WcmhaOEpCRDlBLzZKdWNaTEpLSVdCLzJYeUJKRzRXelNkZDREWlh0QUVSWkNZN2Y2dm5HQUpHRHhGZ3hRTHF5MWFIbFd6TEV6dE5DR0N0UGhPV0VsV2lIV0MwbDl5amc2ekVHaFFmNUw3NzlIU0pGQURKeXdBbGZjaUYwZTh5NzVldlNneHJoT01NV1VVNGtEVlN3bWdWYnNHNnRJNkpza29SY1FTNTlTMDV6dGs4TWw4UDRybVZUcllaNW9kc2RDdWlYMGFLR1FBUTgxWkx5UXlkQ3V2MDNXS0Z1SjlZRVlYMFpYREZDWW1pSzJ2cENjb04vMnZDblJ5cXdMbUVTSWRlZm9Ga3d0N1lqZXlJZ1Z2NUw1OWI0ZlVCckpqa0RnUkF1Y0h4c2JxbllWTzNJa1RNMmJ3aDRnM2ZkUGovcC8zWGZwZnRMUmNzTHNFSjRnclNibHJ3S2x6NDI5VW9FWWkzWG82MlZQN3BHZTFISkR2VmorQ3VGVnVaYXhjOUMzZUYxZ0J1VDdQWm5wTHZlQzhubEdKYmRzRndacXpxNmZOM3hUQT09IiwibWFjIjoiNWI1ZmY4Yjg3NjU0MzExZGZiZThiOTAyNjZkZTYzNjRkNzAzOWU0NzMxMzlhOTc2NDBkZjM5NTM3NWM0ZjU3MiIsInRhZyI6IiJ9', 1, '2026-02-03 06:45:04', '2025-06-16 18:32:54', '2026-02-03 22:39:53'),
(30, 'update', 'eyJpdiI6ImdIbndUWDRxeW4vaUZrYUNjVjB1ZHc9PSIsInZhbHVlIjoiZFI3Q2lEUU9GKy9qQncwL2RtRS80anM5NWxkMkJRWDJtbW44amFtbFVmaz0iLCJtYWMiOiI0ZWZlOWQ2NzE1NmZjNDYzODBlZmE0OWE2YjEwYjc4ZmIyNzkwZDk0NDhiMTBiNTcwNmZmOWMxOTI1Y2Q2NmRiIiwidGFnIjoiIn0=', 'eyJpdiI6Im8welBWK1k2OHJ0aU9nVVZ2NHdqY0E9PSIsInZhbHVlIjoiQmlFRWdENU5QSnBsSTVyZitIaVIyMFF1WVZtZzhFcDd3aWpnSnRETHhVbXRlaTBUVWE3Qzdrd1ZBVnF0VDdQeEJqeWpGelJ1NTBSd3E3Rm93NGh0SEE9PSIsIm1hYyI6IjM4YWM2MDViNWQwYzM3ZWE1YmM3MTE5MTc0MzkxNWI0NWRlNjBiNzFmMjVjZDdkZmYxNzJhYjA1YzM5ZDNkNjEiLCJ0YWciOiIifQ==', 'eyJpdiI6InlEUXhsNnZSNUtxaGU0MGJKVHBUakE9PSIsInZhbHVlIjoiZGcwejI5OUFHRm1STGxIbVJUSWdTZz09IiwibWFjIjoiYmZlNjQ0MjgzZmM4Mzk4MmYyMDUxYTBlOTU1OWRiMjRhNWM5MTFmYzdlZTQ3MjE4MzQ0ZGM0MzgyYWRmOGMzMCIsInRhZyI6IiJ9', 'eyJpdiI6ImJpeitvNUxlVStIZE81OUZvQXFubHc9PSIsInZhbHVlIjoiMmorYWw2SXFJYzBXazB2NUZ5RVJzZz09IiwibWFjIjoiYzc5NDVkZWUyNjU1MThjOWFjOTVjNjk4N2IwOThlN2U0ZjFjYWRlYjZkNDMzYmUzMzQ2M2RjMjI3Njc5OTQ4YSIsInRhZyI6IiJ9', 'eyJpdiI6ImIxN1NTZFlSZXEwMzVMZ2trdEVVQWc9PSIsInZhbHVlIjoiT09LUjRkQU5pUUJrVHY5dHNxdkVCUT09IiwibWFjIjoiYzUzZDkwN2I1YmFiMjQyNTBkODAyYzhkMTJiOGVjNzExNjA3NjEyMWE5OTNmODQxMGNlM2E4MDE4NDEzOWI5YSIsInRhZyI6IiJ9', 6, 'eyJpdiI6IlJ5RXhjeFF2azFtaUFIdmZhZFNnd0E9PSIsInZhbHVlIjoidHRDMVFZUHFyS2FJVS9md3VNaS9uQ2pmK0xobW9pQTBsM2U2WlRMU1duWT0iLCJtYWMiOiJiZDE5OGQ2MjZmNzYxZjQ5YzlkZTYzMjBmNGJmMjcwYTI4MDhhYTZkYjQwM2NlYzIzMmM0YTc4ZTMwMzgzOWM4IiwidGFnIjoiIn0=', NULL, 'eyJpdiI6Ijd6bGkxQU9tajRPT0lEdzVtTUZ3VVE9PSIsInZhbHVlIjoibEVkN3d6UGJnYlBMYlIvUUhVcXNKdz09IiwibWFjIjoiZWMyYmQ2MTI0MGQxZDI3YmMxODFmNmQ4M2YyYTY3ZTlmZGNlYmVkM2U2OWU3NDdhNDNiMjUwMjI2NDk2OTQ0NSIsInRhZyI6IiJ9', 'eyJpdiI6ImFkdE9qZW1rcnpFczRWeHJYbzhqbWc9PSIsInZhbHVlIjoiZVRpOGtiNVV5aVZvRlRjTERkV01KUT09IiwibWFjIjoiMmFmNDY3OTc1YTNiYWJiOGUxNTk2OGJhZmNhMjlhOTliZjZjNGE1NzFjODk4ZGIwZGYzNGY5NTc2MmRmYzZhMCIsInRhZyI6IiJ9', NULL, 'eyJpdiI6IjdMc1p5UWJFdGhrck5yWlhmREpqYWc9PSIsInZhbHVlIjoiUFdWemI5a3RDVHozdTY4ZEc3emNGejVEMzZUQXRXWVNHMjkrYVBtQ29MQjAzamRkQ2Z4N2lHZVFpYWQwVytjeVhTeWFzVDRiS2IyK25rMmo1K3VBSEp1TGEwWUtVZU0xRDJrazd4cUVTd1NoeWg5SStDaDZnbmJzZEFnaHF0aCtRcW5sS0ltUzdZeFpYUmJqLzZUNHZkTUpENUlvTTJ5Q2ozeE43enExY05KZVNyNEFIM2RZT1lReTlvcUtzQlpESDdyUTZvL1dncTZkRzU2Z3hONkYzSXVLcXIrOFBUWHVaTUE5aUlTb3BZQTExTmN4T08wa3krY09CTmY0Vm5ITGNxa0xXNDk3dWN4NGpzVDgwbEtDeFR3NGsvdVJWZGZzUmtqOUpDMTBiM0IwUUdxSUdBM0N5dWFuM3ZLWU9uSUZyVmp1YytzRld5bTNlWWFBSWUzZ1N2YVZJSVRoSThPWkpYeWg1ZTgraFcrSTdtdnpXVjZIOExvVnZRb1VVZjMzZUZCenBvK3p3OEYrOHBvM1ZRMXhRb1o3b1l3QkcvdmhzOWo4aFRDa281WmpaanZGeTR3NTJ3bS8yTWl6bHJZekhXNmhZcDB2MHNmc21sQi9ZSUhIQUlSUm9FOXgwZXl4VnY3SGZQN2crQTlFNFJKWmMrQ0dxTmlVaWxmeCs5d0l1dFN0L2MyNlB6OHFYNG1xL2pqbXp2cktlSVZTVi9TNmxNMnZ1WXdKUnlYUlpGREtHMTVQYVhIc3hKbHZmaGdnTVZWVzY1ek5pQ2lncW50cW9SMERYMXo4WTVEZFRFYnV0Zjl1dUREZjRmOFpibTdVTU9IZTEwWjFTZlhXM2ZxdlZQdXpmaElPMFhSc0hhcGtyQ1R0WXRrQ3ZJOXZWRkJKeEw3amxJS2Z6emQyK1pZM1BkbTAyeU1zRHRpMTBZSlhwTWhuWElaUS9OWVhXcnBIUE5sQlQ2N05ZeEZMWDhHKzBQckg2VDBSSVlrcVBjNnJsQnVuODE0OVlnUTdsQVpCOXVUaDVHVUhSTTd6T2EwOVdJREM2Y005QW1HWVQ4WUY4cFJISXRNL0IrSm5vdUlCNWlwK1l3MVIwanVUQVExZGZjenlZbklCQy94SE5ZK0hMM1F5ZVV5MnBrNTZxSVgwL3J0UkVoS1JBaFU9IiwibWFjIjoiNTMyOTc4ZTcyZTNjMDQ5Njk2NWZmZTE2NDVhNzY1MmM1MWYyNDY2MWI3YWNmMjY0MzkxYWZhNDcxMDA1ZDFmNCIsInRhZyI6IiJ9', 1, '2026-02-03 06:45:04', '2025-06-16 18:33:15', '2026-02-03 22:39:53'),
(31, 'update', 'eyJpdiI6InZ0SnUydFBjOVRzUlBFU1Q2VFUxR0E9PSIsInZhbHVlIjoieTZCVXNrLzM2bVpUbjdPWDVndWpjS2tzRVpIelgxUlFlempSQUFocm9YYz0iLCJtYWMiOiIzMDk3ZWY5Nzc4ZWY3NDRlMTdiYzFhNGFhNTFjNWYzNmNlYWZmMjc2NDIyYjQyNzIxNTBjNzQ0NWRkYjBmYTZkIiwidGFnIjoiIn0=', 'eyJpdiI6IlE5SS90TDUvL0xObGpuZmRSUTdjN2c9PSIsInZhbHVlIjoiendRU24xTzVmdGdmSmhqSUVXcnlSdS95SU5uN0hmRDlWL244MUgweU94RVhLenlmSkM2QjFTbFdiTE43MjEzdlBWWlhwMTZGcC9pMEVlRjhBWEtvN3c9PSIsIm1hYyI6IjA1MDlmOGYxYTY4NjY4ODFjZmVjMzYyOTYxMGNmN2ExOWU4OTEyNTc4ZGJhYzc4YmVkNDYwMGNiNjE0ZWFkMWMiLCJ0YWciOiIifQ==', 'eyJpdiI6Ik1iV2FLbXl0MXFLSG84bk1GM3IvWVE9PSIsInZhbHVlIjoiQm1QN0pWS0tzdTd1VnNRUUFNUkowQT09IiwibWFjIjoiODUyMzVmOGI3ZDhmMWZhNDZkOGZiYTU2Zjc4NDg5Mjc3NGU5NzFiZTYxZTFlYzMzZjc2NWNmODAyYTgwOWZhOSIsInRhZyI6IiJ9', 'eyJpdiI6IkRjazk0YWxEN2NUL2QvRmNDSElwR0E9PSIsInZhbHVlIjoiWkxaVlV1a1BTaDFZY0FSL0h6QlYvdz09IiwibWFjIjoiMjFhMDJmZTA0ODQ5MjlhNDc3ZTdhOWZlMjRkNGM4NDU3M2RmNGY1NGZmYzE3YjNkMTg3YzJlNjQ5NGYyY2M2YiIsInRhZyI6IiJ9', 'eyJpdiI6Ik1FVU5QdVhlNUlGdVpZYU40RVo4YlE9PSIsInZhbHVlIjoiNmI0MDlwS0lXS29ZWVJDR1NPWGRJdz09IiwibWFjIjoiNGVlMjViMGUwODVhYjk1NjUyN2FjZDg3NDUyYzVlY2FjN2E4MTY4ZWUwNThhOWU5OWY2MjExYmJhYzY2ZDJjZiIsInRhZyI6IiJ9', 6, 'eyJpdiI6IksvV1VaWFUyUDA4Vzl6OXlweEJHN3c9PSIsInZhbHVlIjoiWGw0Q1RqQ1JiU1dDOFpESHFINW1VWjJtSGkyQm9jSVZyNmpXQmRWZGNkND0iLCJtYWMiOiI0YzM4ODNhNGYxNjgyZmYxNDZkODlmMDNjMmIyNGIyZTEyM2QyYzVmNjQ0YzdkZmM4MGY2MjRlZjMxYWJhNGEyIiwidGFnIjoiIn0=', NULL, 'eyJpdiI6IjRPY1E2eTBqK2F4R1hQMzJiQzBFRHc9PSIsInZhbHVlIjoiZlNKYjQ0aTVqcmprdTQrRjZ6VVVOdz09IiwibWFjIjoiOTg4ODdiODY2MTVmODRlYjkyZDQ4YThiYmY0YzY5MmQ1YmZiOGY3OWNhMDg3MjlmMWY3ZTgyNTFjNzdlYTJiYiIsInRhZyI6IiJ9', 'eyJpdiI6IitDVkwydjJ3MFdETVZYK3g4NWNzeFE9PSIsInZhbHVlIjoiL0MxTEhZZXl4TzNWMnJXUTN4aWlCZz09IiwibWFjIjoiN2IzNzI3YWVlNDUwYjlhNDBlZTQ0YTgwOTQ5NDM1ZTM0YTcxYTA1YzZmY2I1ZmJkNDMwMWY1YzBjYThhYTY2ZiIsInRhZyI6IiJ9', NULL, 'eyJpdiI6IjIvZERmcVdMajdUbUpiYUVSVXdUZGc9PSIsInZhbHVlIjoiTU5EQXpOUzZCbUg5NitIblF3MlJGdzNra3dBYWM4QlpodFRFK0R3WkVJMHczZHhjcVhIZHhIMStHZEY5MEZOeXdIL3J2MUlMajZUMHpycXhBNm1wU3J4SzRlWDczQVNqYTM2SEVqeUJsT3lKcDdFdzQyYWdsR002RHNFUElXY3UyR0xHTVNrOU4rNHpVZk1iSVlhbVhxeWUxVit3VUpBTTc3WURuWFdMM1Y4Mjk1cFloc2NNOXA1S2JUVVRwSXl4bGZPVUVPU3Rmc2VrYzhBNWdhc2tPMDJGTlE0YkpoeTllbnF5SG92ZjJMeUQ5dHZmL2Y0eTREV3IyODU3Q1RuNjZNeCtjZnovRGRYRzEyR2RmTEhybDVpNEJyak5wVlBzZXo0VjJNOVVqR2plQWYybkwvckdyNmNmSmI3V1dUNVZsdVluWFZiOVRYa2RmNlB4RWZGcTZKY2RRWjdEcWU1ZTFnNnBaanRqbzU1ekljcTlPQnl4YUt6MjNZVldoZ3daQWdCVEErSXNQblM0elZuUFFPZE94UWJrOGRBMHhSQVo4STdlNUkza01LZmxKMC9lWVBvNno3bjJJZVFWb08xUUQ4NTExWXRKbWhpeUJIb0FWaHBta0NwM2RJR1J5RWpiVDBrN2tEMWU1UHdReWd3T3VmT1l6Q1AxYlBNZ2F4ekdTUFFXL3JEOU5Sa2xsa2o4S2hTcVYwTUM4UlMySUx3YmpEQWY1Y2Y1a0ZtT3VCNGZreWIwbnh5WlVUdU13RDJJd2tud3BmZlRpeEVtYmlyVWJnQ3VxZVR2c3dab2lPeWZuU25YN2dhd0diTWN6eGdxTUFraEFNZzR6NjFUVEFvWEhIQXR5Y3FHeTBES2FGME55NlIzR29zYUxMREk2ZENxcVVvSXZHRnBUVHdiOE1lVERaQldscWs0VU9xRERYZTJpZ0tpdlRNNm5uRzZqQk53QWJjVXZYN2xRTllSSVBnRlc3QS9rdXYyTGRaZEJoUVdiNUpvb3NOcFFqRncvNWtNYXdoeEdLa0xNVU4xSEl2ckgyY0R1b1BUa04zdHo5UUFXZzBONDhWQmg2cUs5dEovOWxQai9MQXRWZW9rWEUxZyIsIm1hYyI6ImU0MzIxOWMxMTQ2NTNjYzM2MzY3MjcyNWMwNDRmODkyMzcxMTBjYmU2MGRiYTU3YjE0ZWQ3ODQyNTQ3N2ZmZjEiLCJ0YWciOiIifQ==', 1, '2026-02-03 06:45:04', '2025-06-16 18:34:06', '2026-02-03 22:39:53'),
(32, 'update', 'eyJpdiI6ImMvN2hWRjNidHpkUFhBOGF6V3ovcUE9PSIsInZhbHVlIjoiWUNmSUU2VlpIV1JwaHIyMTYvYW5lUT09IiwibWFjIjoiYTgyZTIwYTU5ZTU2ZTZhNjAyMWUzOTNjOWYwZDI1NmRmMGU3MjBkMzI3NDI2NzVjZTVlY2ZiNWIwMjU5MDk2OCIsInRhZyI6IiJ9', 'eyJpdiI6IktCdTNTQUppK1JDVXpVNFNQMWhOUEE9PSIsInZhbHVlIjoiS016dHpnTjNmSkQxZm1VaG1BTjc3VmlYZ3RibEhMLy82THFyZEJDME44QURTTkxxdnc3ZDdmYVhZWUNqdUdRUCIsIm1hYyI6ImVhMzgwYzQzMDg3NDMxNGYzMzRiOTI3NDc1MDJjNGE3MjU0NzEzMzgzNzI4MDVkMzhiMWE5MGZmYTU4MjNkZGUiLCJ0YWciOiIifQ==', 'eyJpdiI6ImlIYUV3UVF1ay93aWZFVVZqRmRtZ1E9PSIsInZhbHVlIjoia1RpMHB4RE1HT1BXUi9CenFuVXBFZz09IiwibWFjIjoiMjNiZjZhZDM3NWUwYWY0MjY4YmNiZWRmNzdlMjhkNmMxODlhMGJmM2Q3ZTIzYmNhNTUwYjQxYmM1MjhlYTdiNSIsInRhZyI6IiJ9', 'eyJpdiI6InJPQWhvZzB5cUhwT0VkV3JnaFNvc0E9PSIsInZhbHVlIjoid1RqcUd0U3VlZjFvaW5QTWFZVE90dz09IiwibWFjIjoiODUwMjljYmQ3YjRmZjg4Nzc2N2VhNjg1ZjEyZmFlM2FmYzVlNGU3NjIzN2M3OTljYWNiMGQ3NWM3Mjg5MjdhYiIsInRhZyI6IiJ9', 'eyJpdiI6ImpBbVhNQ2tuMTlHR0JiTVBNS0VUWVE9PSIsInZhbHVlIjoicVF3K2FVSTdKOVpxZTFQTzJ3RWF3Zz09IiwibWFjIjoiZjIxZDQxZTUxMGQ2YzVmMzdjNjk4Mzk1OWJlZGZjNDllZDQ1MjNlZGNlYzkxZTQzYzlkM2NmMTI2NjYzZmQ0YiIsInRhZyI6IiJ9', 1, 'eyJpdiI6InhNckdRczk5ZmNYcU1JYWU1bWpHZkE9PSIsInZhbHVlIjoiVFFVOEEyTmVjSTJtaTRPUVhhNktOOUJsa2g4aTQ0K2VybDRkd1RBcXVMTT0iLCJtYWMiOiJlM2NiNjRjYjFjZmQzYzczMTI1MGRiMTNkMzgyMDk2ZjEwNjA5NDFmZDdiNDdhYWZiMWNiM2VkZGI5NzE3ZDFlIiwidGFnIjoiIn0=', 1, 'eyJpdiI6Imd5T3ZKSG1idEwxcjhJZ1MvcUR6UWc9PSIsInZhbHVlIjoid1BEYk9DTG9GcjhLMGlTQ1dRUlE4QT09IiwibWFjIjoiN2I2YWE0NWI2ZWMzNDU0OTkwNTg2MGU4MjQwNzhmNTM2YjI4NGYxN2Q2MjY4N2YyZmNkMWUyZjAwOTA4NDczYiIsInRhZyI6IiJ9', 'eyJpdiI6ImRqdWszaVpqRXFEaFE0bHFBR3hhcHc9PSIsInZhbHVlIjoibm9neis4bFU1Rm5pTnB1Y2VoNWM1QT09IiwibWFjIjoiODg4YzUyOGY1ZjY4MDZjNjAxMzRmOWNmODBiZjM1YTAwNWM2YWU4YTNlYzNmZDQzMmQ0NmI3ZWI1MzVmMTkxYiIsInRhZyI6IiJ9', 'eyJpdiI6InJyT25JU2MvcHNyTWFSMmJiWnFXMFE9PSIsInZhbHVlIjoiN0tmQjhjWjJCalBJdVZPVmZ0aGVxanJYQjNId081VHp3b0RBYVhtd29WMD0iLCJtYWMiOiI3NjcxMzkxMmE1ZjQzMTM3ZTZhZjQwYzc2MzdiZWFkYjUyM2NiMTVhZTBjZjlmYjEzMjQyMDUyZjVhODRhZTE4IiwidGFnIjoiIn0=', 'eyJpdiI6IkxUZitxTkhrbisrTlB2SkxLNytiYWc9PSIsInZhbHVlIjoidHdkYVlQK3cvUyt2aXNVeVpqNnEraDlZL1ZubVdMZW94WXdaMlNZZlg3cENjWUlaU0RxTTFSanJMOUxQZVpBWjF4TEhFeWlWUk9aT0hFOXBYeUZyWDVObFozaWM0ZWhMUnFpYVNxUGpBQWNWNmZSM0JtQlFob085emNFVkNRRTJFc3NKamg4NWQwUW94TGlEZkVZbHZLQXZPZVd3OGVrYXc0aXhLV01iZnVYSkxlNWJkY2NMNzhuQS9JWThEY1dJUlQrOXlTczBzRjc2RFBralphb05MNFJxU1QveGtVTVBHVm9Nc1JRMjJBdis4aEpNYXRYL2Z6OWVscmNGcVc4QmZUL3lENUhrYWdOQmJIcDNqa3VuTVcwdzJIbnVPVUpmNTY4M3FMM1pQK1hQbldTWmsrNjhUSjlDcWloS3M2dFl6SU1heGNVZStpMHp6eU5pZm5qTDdGVjBjVDgrdGQybVFrUFJEOWJtTE96SkNoSUFSQU45dUF1d3NpVTE5ZEYxKzFEd2M0WHd6NnZrbnlqVm53a3QyeUFQOW03RWtiMVQ2K2JGczJjdXMrN1NFMktxdVoxWjRFZVMrbG9LMEZDWlFCOFVJT0NFNUt0SWpCZDRCakZkc2VkYjJrcTZOVVVuSkEvd0pqVlBzVnBrTmZOMWlBbG1nK2JqZWhvRnJFWll0TGZkeFp3RVplc0trVTNQZEpsU2hnVHFjMWtveUhaNG5BeTUwWGpTSEQ0U0M4V3A3YWhKY1ZBZkNRbVhhWjRuWjFYZExYOVhQaEsrbEN6anIreUtCVDRBcEFNRTIxYzBFY2NraE41Tjg3K1gvc2R3WkZhdU5GeU1RUkFwa2FqMEdiOGtNS1hnYXhwT01xc1lSdzlZaDdZNU5JbVE3TVB5QlZhRDdkbUdmMXE0cUxqUHdxTGRSczR6emN1NEF2SzFDRk00ZEEwRDNZR0IxVEwxbVFhRG5xaURDVktTZkhndWVoYlhKOXZyT1ZsWXBvQVRaLzgvZ3JTeGpxUW14cU4xTFdGKzVVWGRvNDloT3VPaEd1cEN6TDJWam14S04yQzRSQzF3QVYrRU9veHpxOURRV3A0N2x1QVc0M2NGZktIUWpYeWxhdjhNb0Y0c1hXRVhBZTFCcVVtb1ZkRXFhd0Z6cWx3N3BWMVdwSXpmL0pqNTR0TCtEMGJNQkxyRUZOK1lTSXZ3cm9IUmFsaHpqOGU2cXdEbmtrY2g1Z0ovVHpXWVhaOXhjMkk4YWhYczlSNXpoeVk4UENNZUhmT09sT0tYRHE1QVFEb2JUQ2xheUxXWkJ5TDZRS0szdEtIYmpPN0FMWUg1OWFTM3VlRE9wUGExQkQyL3hxTTBNRkZ4M1dYZkc4ckNnRGtsVVVQOEFtc1B3d3JjWFg1NEVjd2pKVWxzY2JRL1RoU09HWGI4R3pka2FuVGF2dlg3UWhHN3lBRE1NNlQ1RzZ6QlEzempnN05rWk0za0xnPT0iLCJtYWMiOiI1NTU2YjUzZjI2OTNkMmFhYWE0ZDY2NzU5MTY1NTIxN2Q4NmQ4YjkwY2FiNTFkY2Q2MzlmYmRjZjIwZjk4YWI0IiwidGFnIjoiIn0=', 1, '2026-02-03 06:45:04', '2025-06-16 18:37:32', '2026-02-03 22:39:53'),
(33, 'update', 'eyJpdiI6InFwY0xIRS9xVDUxcWErRUJNZXphTUE9PSIsInZhbHVlIjoiVCs1SVp4RCtuKzFqMnJwdUQ1bk9RdW4xdFV2MGFjWGIyMkgzOVlBeDVNUT0iLCJtYWMiOiIyZTYxNDI1MTQ0MWFkNTJlY2I0ZmNhZTEyNDJjNjE4NjQ5NGU0ZTQ2NmVhNmE5MDQ0MzQxZDE3Yjc0ZjYxMzViIiwidGFnIjoiIn0=', 'eyJpdiI6Ik9Jd2IwcFBHZXQ2SFFsMU5BemJsQ0E9PSIsInZhbHVlIjoiM2plSnRVSXZoYXAvbVRVK2lDWWI1R2xZdHBSSFF3N2hjMEl5aWpuNlc3SVh6N1l5ZGd1aXpSWTRyaDZDdC9KRkJETDFJY2FoVXFmMEtOaTN2eFFGQ1NEMUhCRVdkREw3cGRwellhWlpWRm5jeTg4cHFmcG9YVHdqeXNCdXAxcWNDbXdvWTAyYWY2VHkvdTc0eGpVU2NrZGlGT2NDUG11eUI1aXdlWEtYTUlscVpGLzBYbVNZc1UrM1JKRDhyYnlVOVJ1bDJ0aUZyV2VoL0dSS212eGxCb0ZxVHpUMU41a21uL1BwUWZacE5scFhaMDZTMnY1SnFGaDAyOC8yVkFKa094c05Vclc5STFlMjk1Uk82aHhMVXA2cEVMdFlEWmYyUmhLTllqWHNnNC9vSEFqTkUxTkpORHFqU2JmSm1WUnlvTGk0QUF6UUduWERYZEljNnp2b2ZDVHdhZDRQMVY5SlpRMXV4em1GQ3RNPSIsIm1hYyI6IjQ5OGU0YzgwODg0MDQ4Y2IwMDM3ZDFlNjMyZjAzNTJjMzAwOTk3NmFiOGM4ZWE2MmRhNTEzMjg3YzNjNzIzZGIiLCJ0YWciOiIifQ==', 'eyJpdiI6Ijh0bVMxTE9LUDNJcm9QQThHdmFPQWc9PSIsInZhbHVlIjoiVWw1cW1BeCtzclU2M3JZNHhxaU9UQT09IiwibWFjIjoiMThiZDdlZTVkYTU4NzFjZTcyYjEyMTlhOTM0OWZlOTVhM2U5ZTE5MjJkNGEzMWE4NmYxYWJlY2MyMDFmZDM5ZCIsInRhZyI6IiJ9', 'eyJpdiI6InI0VXRaUjdNNjRrTkR2MDZuMjErN3c9PSIsInZhbHVlIjoidGJnOFNJbC8yaXE3TjlOcUFhNkNsUT09IiwibWFjIjoiMTQwNGQ3NTdmZDlmZThkMTc2YjkzOTgyZjM5Y2IxNzM2OTFjYzc0YzQxNTk4MjcxMTdmNjU2NWYwZWI1MzdhNiIsInRhZyI6IiJ9', 'eyJpdiI6ImR0SDREckpyMFZtTlNrSEFTYitmNUE9PSIsInZhbHVlIjoiSHVmVXpoL0dNbUR6SXU4bityM0ZLdz09IiwibWFjIjoiYzZlODEwZGE4YTBjMjViNjFhNDljYzFlNjc1MGExYjhhMGE1Y2QyOTZjMzkwODA3NjA4N2Y3MGMzYWUyNDM0MiIsInRhZyI6IiJ9', 1, 'eyJpdiI6Im1JcFlWMUNmTEFNb1NIV0xOeXg3a3c9PSIsInZhbHVlIjoiWFZ0clNXOGViQnR1NU5weWRqVytkdE1NKzBIYmZWVXVtOGNIRnhoK1F3ND0iLCJtYWMiOiJjODFjYTk1ZjIzZTJjODJkMzljODZlNzFkMGQwY2Q2YmVkMzI2MDVjZmM3YzllYTFmMzdlMmQzMTgwNmU5MDdlIiwidGFnIjoiIn0=', NULL, 'eyJpdiI6Ilk2aHY4dThpTGF6UStpTlN0Y3hKVnc9PSIsInZhbHVlIjoiTHppSGJxMXpnNkhBRXpYeDlZSzIwUT09IiwibWFjIjoiYjMzMzZhZDM3M2ZkZDM5YjlhYzY2MzRjYjAzZjMxNGViNzM4OGU2MWRlMTVlZTE4NTJjNzA0MWVjNGJiYzljMSIsInRhZyI6IiJ9', 'eyJpdiI6Im1LdmRzbFVuaW1aZTRIRldidDdHMGc9PSIsInZhbHVlIjoiT1A0UVRqeExQcjlXU3dLek96dnNsZz09IiwibWFjIjoiMGJlOGI0MThiZWM3ZDM5ZjE1MmIzNzg1NTJjZjc0ZTYwYTUwNTQ0N2JiMTc4MjZjZTRkZTFmYTVmOGU2ZmVkOCIsInRhZyI6IiJ9', NULL, 'eyJpdiI6Im1sOEdiSDZCVnF2TTFjUVZCcGFjWkE9PSIsInZhbHVlIjoiUHN1T0FGRXpBcm9ER1dMbEZ5VkxmbHVLYVN3cThibFZVRGNBdEhsSWRKZkdjVldMd3FTMmRNREVabEVOTlZMMDliR0Y3QkRTTVBPdU8vT1ozUG1LeGF5WnJTZHZNY09QaTFXNzN6cWI2NVVFbzdYL2xjM2ZJeHk0UVJubUdJRUlBRWltVUJVSjRtMDdFc2I4UDVJREMwTGVUN2dZSEZvM3FyWGNqbzk2WmRZaEFCbmJ3Zm0xSHVxK29oSlIwMDFvSEJSU0RSNldJcnZQLytZdUwrUEMyYVhrYlVpYUR0Uzl2SWZvc1kzTkZhVFlWQnNGWVg2b1A4akJjUkszNFlVZkhXSU1GOU96bUJPa2RIaVlDZmNtcFVYelAwU0U3WitEQ1JqRjkxNlh2Q1hKeUV1ckM5amJEa29xVkozcERta3poOW11bGgzakhaclIzOWYwU2Z0MjhJYW0yOEtqaHhoV2xablFhTEZ3VFVBVHY5eEU5dktTU2taNjRpeitiQmJDS3dtUnlGY0RXcHVSOGhOUWFWVXN4bDlldTVsV0Jac0hxMFZZRU1hT1JqZXZLVHQycVdBQ25WcHU3L05ROW1mMldWNTk0MnlzL0ZpRzgwQ0RqdFlZVWdaNnpJdFplU0lvUm85VDhnOEU2THZ6N0dnVlQzM0NzaDNZbUtLVDVRSi9lb3NKL1JqQk1ReEYveVcwNUMvbGV5TEpNOWlMOUg1T0tVWHdHNTJYUzU0MjBOdEJyeWNyYVZ1V21MWThod0ViRkNOeE9DNCtScG9Fd2hjdjlnaGdNNUZLdEM4QmRCYWFoYk9nNnFYRExUWVpaS1lrSUlnajNrVkdZNExnS24vbXZhVzdremF1UTlpRVRTakNzeFYzTnI0cm9BQVdWR29yUUZCVmpydHdTcXo3a0s0Uy9Hb05LbjBFckpBVmpiRDJlQU5FenV6K2NOVmxKS3lBMHc1YXg4Mk82RzRQRkN0SW1oaGtxVEU2Z2MwcHpNL1BpOU9UckxlQ2JYQWZiQWxkdlY4Q0RQeDZRZEFtTElXMXhRblhQSnJLaWx3ajcwQ2FMNEdmM0htci9GZXc4WUx3T2FQZnVrS3FlU1doQnFtQ1l2bUtMRVhDR0NEdU5UWnN6V05SNUluY3pMMURBZ3R2SGJHZUU4Y2I3QlpTeW9HL3ZRYTNBQXFhRmluaGE2SGpEYW53NWdWVlRlcnRlRFAxbnNLWXJlMFVMdFJTaUZ0MGFCelU4K0tkTnZZbDhpSnhHMlIxYmlmK2s2c1N3cmhrNmF4blJSNitLcTgyQ05BYnhtbTloTkNBZFpqdzNQYTFUSFRpdENJYmZTSkZXeExSZ2NFWTR6R2tjc0VoR0JoSEc5QllRQnBVMnNJSFRUWmhMaURlMVpBMEpVYTZFSWU4UmdUaWpOZnluMXNOS1NnY2l3YWdlQWxVdzJYU01IdkRXRCtUa0g0Vlg3K0tKbjBEZjZFeTN0M00zYlFXQ3NScGFPV1B6aThORzJhbW44bWdYajI4UHJmamMvT2NDVWI4Rnp3RHdLcVF1L25KTmpnSHluaHRKUkZkUzc2b3ZLajVjR2lEMWx3WHZwTmpKSU5PQUh0T1E5Nmdacmx0TDVtY0RGM2lqazlkb054d0puR05Oc2p1V0xtMURBN0JRRWJVZHV6L2JpajhnNG5jQVNIVWVXME5jcTE5RXdLZmJ3aFhZdGhJclZaRmc3cDZabDdZeWtIWGNuaXZkKy92TEZYSXBSemYvVndZTGowdEJTeTR6UlUrYmhRU0xZWW9xaDRDd1NQZWJoNHY1WWc3WjVESHIycDUvd0NEcnM5bmtveSs3Znd4T29Oa2RSeE82bTBHeHVFSlpvbEZxdVlOakIzK3FwV2lkV0JsaFZVaUg5UUMxM09Fa3ZzQ2tsMW82SENhQlVrczM0cXorZVk9IiwibWFjIjoiODkyMmVjYzAwMWMzNjMwYjM1NDcwZTlhYzU1YWU5NmJiZTljNmMzNzA5YzI0NGZkOGI1YWYyZjY3OTY2Y2MwYSIsInRhZyI6IiJ9', 1, '2026-02-03 06:45:04', '2026-02-01 01:48:55', '2026-02-03 22:39:53'),
(34, 'update', 'eyJpdiI6IlR6aC9NeXFucExIMFdaWVZvdXhsNWc9PSIsInZhbHVlIjoiUTJlaVFmNWNZUnVrdWNrZ0dNZ0RFaVR2SEkzYlZxMncrTzZUaXVzU0cxaz0iLCJtYWMiOiJlMGExZTc2MmQxNmQxNjg5MGRhODBmODcxMTc5MTZjNTVmNjk5ZmI3ZTY0MGRlNTA5MDliNzdiYWJlNzNlNTFiIiwidGFnIjoiIn0=', 'eyJpdiI6Im5sT011ZlQxNXJoQmlrUjFNQnNZTGc9PSIsInZhbHVlIjoiRUJGNnE4aS9JKzV4Ri9VODBGeG1xWUpiMzk1c0xZNndCeXFwdmRFSkkwNUhKak5MVkp5Mlozb2UxMGZaRkxSWXo1YkJaSkNCdS9mZzFxR3QxVWk3T2FLRll2M2xKdkpFWnFlNU9zNzExR2FFN2UrNzdlM2VaelZLVHIwRDVxRnR1T2Y5MWk4OSsvYk55QjA5VThxTndoKzc0SmlXdEtraWhWSDdTenljL2FGcE5WRk9HaXR2a2lnZ2FXTFJtbVZxV25IUjFYREJPNFJQSTdDRmZkbE5qSVp5ZVA0VVFuM1U4RkRSOXlYY2pGMUxIeTVyZ0pxaSsyOXdmcDBhN3FFQTBtNTdlQWVzc0FQdHFzTTRFcjFObHRDblJsUEFqakhYeFgybzdlNFJpSWZYbkJvdHJEQlJSTWJLcnQ2aDZyWVRDVkI4S3laU0pidzRScUxMTXJUblFWRUxadzNhWXpUOVRYUDhkQlRFdGdBPSIsIm1hYyI6IjZiYmE4YjUwZmE5NjUzNWIzYWE2MDNiNzA2ZDViOTU1YzAwYTFjY2EyNWIzN2E3MWZkMjc5OWJiZmU0N2YzNDIiLCJ0YWciOiIifQ==', 'eyJpdiI6ImxGTjZLcThIK1NzREJjYTVzelJ4blE9PSIsInZhbHVlIjoiYWNqcmtITVNWd3R5NGtDNkk1OU9jQT09IiwibWFjIjoiOTNlOTlmMzA1YTBlZjE0NGUwOTc1OWU3MTkyZGNmODliZTc3MTNiMzUxNWI5NzQyZjkwNTU2MDQ5M2MzMGQ2NiIsInRhZyI6IiJ9', 'eyJpdiI6InZKZVQ2dm9Tb1hibEdOMm9JQlBFTVE9PSIsInZhbHVlIjoiSVNCdkF0djRuOWxOcy8wWCt3R1E2UT09IiwibWFjIjoiNDUzNzdlMjg3OTc1MWQ3NzQ1MjgyMjIzZTg0YjUyNzYzODhjMWYzNTYyMzJmOWQ2NTYyNGE2ODE4ZjgxMTMwYSIsInRhZyI6IiJ9', 'eyJpdiI6IitXUXA5QW9nR0JLVzlwRzE0Z2JiWWc9PSIsInZhbHVlIjoidHZ0akJNQ042OElTT1VkWXQya21sdz09IiwibWFjIjoiZmJhMjI5ODFjY2ZiYzk5NmU2NWQwYTZjM2QxNzQ0NDc4MGQ1ODQ5OWIyNWVmZjE0NDJlYjk0YjFhN2M1ZWIxMCIsInRhZyI6IiJ9', 1, 'eyJpdiI6IkFDODBGYkFGdlQ4Qm1aRG9yVkhwY2c9PSIsInZhbHVlIjoiRnRNejVTdzRLRVBiWUdZM21RY1ZQeE1ZWXpBRjBVVDAxN2Z1MjBoZGhNUT0iLCJtYWMiOiIxYmY5OWRhYWQxMDIxMWY3OTkwNDQ5ZDliZjhhNmM2NmFkOTk4ZGFiMTQxMWM3ZTE3NzI4ZjhiOGJhZjE4ODVkIiwidGFnIjoiIn0=', NULL, 'eyJpdiI6IlNteVkrcGRMak8rMGZ2SyswV1pvYVE9PSIsInZhbHVlIjoiYjZNaE9YcElGUVVlcno4RDkxNUVNZz09IiwibWFjIjoiMDlhOWIyZmI1MTVlMTdmMDkwMmQyMGFmZmIxYTZkMzZkMzM3ZTJjMjRkNzZjODFjYWE4Y2Q0Y2ZlZDJlMzIwZSIsInRhZyI6IiJ9', 'eyJpdiI6IkxHT3dpWFA3NHkxcEViaWh0S1ZtS3c9PSIsInZhbHVlIjoiQnNBeGlOMnd5K29xSTRwYkYvQ3NMUT09IiwibWFjIjoiM2I1NDhhNzQwMTQ2OTI4YjdiZTZjYjI2NWUwNjRmODlhZjE1YmNkODA5MzIxNTEyOTFmOGViNTdiN2ZjODhiZCIsInRhZyI6IiJ9', NULL, 'eyJpdiI6Ikw3MkRKTzJUVVBQZDlXai9JQmpTbEE9PSIsInZhbHVlIjoiM1ZFcVZDYW16RUZEaGFMMG5jWGdjK0pjTmwybHpZeWF2T1FjZFg4UFgzL3BxdDBrdEdEaTBVRFJOWUlWc21LYWpVUVhSUE1YOWc5NjJXRk5mdnE0WTVCZmpzMGRuOEZMS2ZPdzdyc0tzKzd5bTZqWVNpWHRXWmZYRE1PZ3N0b29JaGxSMnZIYkRac2N6Y2NQUXd2UnJMQTlndHZtUUVRSzg3eklLaFVXeFpNNjdJVkF4Y3VKaVBGc0x3WnlHeVIwYTJ0S3BYQ2JXekhqeGZPRnRkdjBTOFhDUHRwR20xcnl0TEhHQUsweDB6RHhOeE0wLzkwSVkxNE84Unk2c3VrMUlxRlgxbE12ZmhhTEZtamllbXVaNlFEWnc0VG1wT0tOUXdJQTlBL2dtRkFudnZSUnN6RExXSnZxSFFNK0JOYnFUTkJkUDltZDJLWHIvWXR3c0w1blkwMGZqcmFXNTBlRVRWSkJ4SXcreUdrOFlCTjhKbmZlNThtak5jdkxTR2prWnZJclZvcGl4czN1MkZJZmdOaktpRVVnTzNtLzFxeG11UTdNM1pINWhNbkN6MkVhQ0E0cGVPZzZpNTZIL0hkem1sQ3FxajFBR0pnTTlaMTlnSXVHVlVQdDA4SGVhS3V5SFc3b3JKNThHYjY3d0RDeThNc1l3bXoraFpLckxjdFVRYzBVWnd6a1Uzemwzdk5XU3d1dGV3NGtmOWdrQ1h0eUlvaWhmZGdOTG4yc3pLZDdJcVJWK1M1cnNYM3pBWkpBNzBGc0hYMGNwamlkZXI0NUg4SFFqVnlqUkNZRkMyVS9GVmpIYjZJYlJsYlZFMUhmNE5Ia1RVNm9NbE9WMEtqaUZsOWt1UzA0R29Fb3FxZ04rS3BiS0h0NEdyN1lpaE5EaW41KzNZM0VmUzFja0loUXVvbVVDczVDazJCV3FzQW8yMzN3RGFiYTBCUEl2M1UwR3UrRUMxSmJPS3cvZTA1RGdMalZUSWF2RjBUdWVBMUtDUnAzMjI1L3k1Y2g3N3RuS1EvNmRFN1JiWnNJQmNOR2padThKNHhVKzNRNklZeFJrdGtyRkU4ZUljdzdSZnpRNW5JUFY1OEFTMkxsMjJDRGVzWW5TZ1J5dCtuN1VXODZHV1d2cWMvcUptV2NDVDVQTjZoUFAyVGh3cndaVmxnazlURVd1YUlwQVd3VllUTDJ3Y21aWitybFRSb29Jek5QOWtKVHhQWGxjT29rbWxMTGwvU2NmQ1NDR0gxd1h4UW1sV1hrMTl6ZCtiekw2NzZlMDVLRmVwWTE4dE9MWWxzWGoxaE4xNWJSa3FxYXNyaGRKVldDTHlYNG5TbWJQeFcvKzFHN0pqV2dLTStFeE0vQVFNY25pazdWR1JXSEVDMlVRT0c4M01Hc0dtYWhZa04xMjFEU295Q0Z2SDBQVnhqTUpJY1NGMFFiZkswWDdJY0JLMG5IQ0lsRGw1a3kzUkdGQkp1eUhrU0x0OHgzVkVWc1lweStxQmt5OWtUWmpaUGZLa01rNEY1MDVockRRM0dqVG5JMTJ5QWFDR3c1eWxveHljejNrR1JkK21kT1YwSlJvUGFBbjBBanNVcERZc2FZdDhWOWxWN3RucVlXdkJwK1dqcFVtdlhpeUZJcHo1Q3EwdlAxOFBWT0o1ZEJGMWJFQ0NGV3BtcW9HVkw5TVFvQUxyNi80YnAxL3JyMU1oM21XY1FRYWYwTlZMemFEbFkweXVSREhBYzVkcVk5OVNHQVlxTEUwVGlsNE1uYnpMajJOUERSM3dCN2pUcENBWmx2TStqTHhsYU1WbFBaNkRsNVdCMEQ0NXo0clMwYkNRbUZZVVRmR09oNitpaVVxQzI5Z3FldTllOC9LNDE4aHljM1ZFODYvYzNiaTlBdUdZSjg2TE1rak16ci9JaWRsSjFNa2puaC9uVWZnSEU9IiwibWFjIjoiODQyMzU1MGE2Nzk1YjE4MWU3OGFhYzYxOGI0NmM5ZDljNjQxNDQ5ZDRhMmQ1MGI2Zjg2YTFkOTUzMjQ1ZjFjYSIsInRhZyI6IiJ9', 1, '2026-02-03 06:45:04', '2026-02-01 01:49:15', '2026-02-03 22:39:53'),
(35, 'create', 'eyJpdiI6Ik12ZnBFQ0dJWHArV2J1VDk5aEQvaVE9PSIsInZhbHVlIjoiZHgveDZpNmZSeTBkUHhOQ3dHbGNPODB5WnFuWS81TXVOdlRRcEZTSHcxYz0iLCJtYWMiOiI5MGEzNDQ4ZDk4MmU2ZTRjMTc4ZGUyMjI1Y2Q2NzRjNTI3MGQ2YzA5MmRkMGVkMzMzNTYxNzlmMWVlN2MyM2YwIiwidGFnIjoiIn0=', 'eyJpdiI6ImF0ZW5wZkZmbVFMVEJ5S3drZU1KRkE9PSIsInZhbHVlIjoiaCt2LzRTMG5BOXhlakJYY3lHMFVzME9ITW5MZ0MzNzNnSktwMFA2LzZvV3pNV2p6Wi9uN3ZIWWY5SVlyQm1WSSIsIm1hYyI6ImE4ZTY2YzEwYWUxMWMxYWEyZjQ3MzZhNjllODdkMGRlNjc5OTM1MWMzYTU5MmZkMzI5Njg3ZDk5ZDUzY2UzMTciLCJ0YWciOiIifQ==', 'eyJpdiI6InFZZHE1SUdQNWs5a2RNOXh1Mi9DdXc9PSIsInZhbHVlIjoic012K3VCWGtkenYyVm1NM29tWEJTaG9BUm1ORm1pamR5RjNGZ2JHelVOaz0iLCJtYWMiOiI4MDQ4MjhiZTVkNWU0Zjg3YTcwM2Q1ZmZkYjAzYTJlYTkzMDJmMzRkMTExZTkzYTE5NDIzMTNlOWIxMTk2ZGZhIiwidGFnIjoiIn0=', 'eyJpdiI6IlNYR1FIQmhnQ2Fzekk5czlhM240Mnc9PSIsInZhbHVlIjoid0xHbDdDVy94K2xJVVhLdmg3RVJ2UT09IiwibWFjIjoiNDAwMWU1MzU2NjE1OWQ5ZmMyOWM3ODViODI5NDNmMTUyY2VlNWYyNDhjMmEwM2UwNWMwNjBiYjQ3ZGI2NjI0MSIsInRhZyI6IiJ9', 'eyJpdiI6IjFjT0RDWEFza01aTTFYNit4UW1VWFE9PSIsInZhbHVlIjoiaGV6TjVPRUc3OWNQMkUyNWNYUWZoQT09IiwibWFjIjoiNzAzNjE1MmIwMDJmODgwZmEyMWFkY2Q4MWM0MzFmY2FiZjc2MDgzNjY3ZTU5Yzk1ZjNkZjliM2ExZDk5OTQ2YiIsInRhZyI6IiJ9', 6, 'eyJpdiI6ImNGdnhndEp1MEREY0JlNDFWN2VNeFE9PSIsInZhbHVlIjoiMG1ORm83UnVWQy9RQ05ic3A2TmI5bTV0bnhTNU5USnFOcTcvTnhCRDM2cz0iLCJtYWMiOiIyYmIzZTAzZjUxOTJlOTczNTI1YTAwNDg5ZGJiMGM4MDJjMjdlOWM1Yjg3OTIxM2FlMjlhODgxMDgwOGUzMzNlIiwidGFnIjoiIn0=', NULL, 'eyJpdiI6Ikk4K0ErMUxnSHhwaHp2RUNDaVJGeEE9PSIsInZhbHVlIjoiRE9CV3ZZOXk4NnM0UGovZ1VTRDdWZz09IiwibWFjIjoiMzU3ZjFkOGI0ZWJlYTQ1NWZmNGY0YzE4NWNkOGQ5YTJmYmU0ZGJkY2E5YzA5OTQzNGM3ZDUyOTNhMWVjMTM4NCIsInRhZyI6IiJ9', 'eyJpdiI6ImlIZzJ6ci9tR1BaVlpmYXNXZENWeWc9PSIsInZhbHVlIjoidUlsdC9Bc01la0pSTlRHVWRqZFIrQT09IiwibWFjIjoiZGQ3MmJlZDJlMGYzODVjMjQ4NWQyNzIyYmNiNjc0N2RhMWJjZWFhNzgwZTNmZGJkMDQxZTczYmY5NGJlMWNhNSIsInRhZyI6IiJ9', NULL, 'eyJpdiI6ImZtUE9IQjd1QkJDUS9lbHFHTTlFRVE9PSIsInZhbHVlIjoicDJYdTdCRHMyMHpLKzI2R1NCczFYSE9zbUV3UEF5OGhNbWk0ZnhLOXV4WmxKQXNUeDloNm9jK0VYSmpkdlZmeDFRTnVjRmN2aENUbHRTMmVBejYyWUN4KzZxNGpEN2lDOW5pbUNZSUF6UjRSTC84ZjJSNDMwdG51SDZOT1Y4SWMxdUtUNklMMWhHNFZMbDhiY1pXQjZrbDlpd2xhTXVLVjM1dFZEZEhFQ1BzTDM4dHVHbFR6REhkb3pXNGZaWS9BYm90NTRKNnFkellEZDg1YlhBMmdtQT09IiwibWFjIjoiNDgxNjBjYjdjOGI2NDkxZDVmMjZmNDU4ZDI2ZGNiYjc4OTFkNjQ3NzI2YWI2YWUxMWUxZDQ1NTNhNzJlN2M5NCIsInRhZyI6IiJ9', 1, '2026-02-03 06:45:04', '2026-02-01 02:33:36', '2026-02-03 22:39:53'),
(36, 'login', 'eyJpdiI6IjB1c0t6VlhCaEg2bXBxZ3JUV0VkQlE9PSIsInZhbHVlIjoiMkR1WTUvR2t1WW5rSk9BbnBtNkVGZz09IiwibWFjIjoiNzJhYjNjY2E4MzY5NzIzNTFlMmExY2Y2MTVmNTExM2RiNzRkMzBjNGZjYTYxOWRkY2FkZThkOTUyYzdmZGZiMiIsInRhZyI6IiJ9', 'eyJpdiI6ImFwdHlQS2dhSXJ4WHpVbWt2L3Vtd0E9PSIsInZhbHVlIjoicGtIcjNzWXZBUkZ3UEZIQVFpTndrNUkxRmtZcCsycnpWTWxlZDZZWnBLYz0iLCJtYWMiOiJmY2M3MWY2ZjJlMWJjNWQ5ZmI0NTg4MDRkZWJiODBmNDFhZDg1MThiMjQwM2RjYmFkOTJhZTgwYmUwNTMyMjFhIiwidGFnIjoiIn0=', 'eyJpdiI6IjlDalYvN1l0SThCSWVpZFFMQWNhVlE9PSIsInZhbHVlIjoic1V2dG9FTVo3dlJGcFQzSVdWUnBnQT09IiwibWFjIjoiYjhkZTE1NWVjMGRiZGU3NGY1MTBmNGFkMmM4NGJmMjdlYTY4ODBiMDBhODlkMTk5MjAzZWRkODAyZGRiMGY4ZiIsInRhZyI6IiJ9', 'eyJpdiI6Im9mVDNYTmFkTFJvYml6akRxUzNINGc9PSIsInZhbHVlIjoiUlhFbHl5TWRTM1BjdHJYNUxjalluUT09IiwibWFjIjoiYmUxYzdkZTgzMTY5YWQ0YWM0OWI0Njc1MGNkZmM3MjY0YjViYWRkNmM4OGRjNzU3ZDQ5YzdiYWI4NjdkNjQwMiIsInRhZyI6IiJ9', 'eyJpdiI6Iis1WHB5TlZ0WVdhTE9hSm54VGEyRUE9PSIsInZhbHVlIjoiTnB2TVVMNTFiNnRpOGJZUURzV1pWZz09IiwibWFjIjoiMDRmNDliZjNiM2M3ZDljYjZlZTE3YjRjODI2MTFkNTJlNzIxMjVkOGExMzA3ZmFlM2U4NWNlNWY3NGVmZWM4YyIsInRhZyI6IiJ9', NULL, NULL, 6, 'eyJpdiI6InlJYko3c3U5U09wTkJoMTN5RXBSbGc9PSIsInZhbHVlIjoiUHhDc3lCL1IvVG1pZkxyRG5BUlJXdz09IiwibWFjIjoiMzUxMzk1NDVmZWJmYWVlNmE3Mzc1NTY2NWExZGU5YzBjZjgzMzYyZTc5MDU0N2I5NTFmZjdjYzU2YThmMTQ4YSIsInRhZyI6IiJ9', 'eyJpdiI6Ik5zZ0NGSmZSdnZOaU5oQzB0THRRMXc9PSIsInZhbHVlIjoiVWoweU9KaTlXUmVwTjB3K2JpMDNrUT09IiwibWFjIjoiOTE0YmE3M2VjM2VjNGM0ZGEzYzA0ZWVlNTdkZDY5MjI5YWYyZDFhZWJhMmRiYzcxMGQzMTc1NTRlY2NkOWI5NyIsInRhZyI6IiJ9', 'eyJpdiI6IktsR0t1ditGWjVLaE5vdWV3Vk5JZ2c9PSIsInZhbHVlIjoiSDJiWmlOc0tuMkp3ZytpVEZBa3g2SFB5aTVvVm5LMkh2QlhvZXNQa0dDbz0iLCJtYWMiOiJkZTk5YmE4YWMyYTYzZjhkMDVhZmNiNTQzNzEwYzc0ZTkyNzQwYmE3ZWY1OTgzNzc3NDViMzNhYmE0MjBlMzE2IiwidGFnIjoiIn0=', 'eyJpdiI6IjZMQ3dGVEo3eXJrQkR6amVKRzNNOHc9PSIsInZhbHVlIjoiQ0V4ODVTV3pJcVNaSjRiY01Zc3lYbmJoQXpwdHc2eGlEcUR3MytOK1lTODdNRzc4QmhvZnljaVhHaDlDZ2ZlUVJhbyszdmYwSUpUY2lORHJiQzhpaEpmVTJIN3J4WmZHS0tpNFFGcHB4UHJWZlNETlAwS3JkeDBldHhFNTQ0cXp3R1puS3Y4Vjd6Y0xmVFBJaTkzL3hjSjFhS3ovQUZkQ1FWZjA0NE1lSFJQTUJFaHYwWUpnM1I0OHNYYlBUUGRCMEx2OEJNZm02Vjh2RVVDN1hnM2Fnb2ltaTFJMm5ESUkvbDlULzRpQzZNTU5kMmdiVzN4c2k3QXFsbmJHYzZvQTE3QjZoNjVUSS9FUnpDeHhEVXVzOG5mZ1p6UU1WNXF1STYwWXJZUjMxYVJRT0dBUEdkbUdRZW9HWm93SW1qcGgiLCJtYWMiOiIxNGQ2NWFmODIyMWRkYmJkODU3OTVmZTgzOGM0NzA4MjFmOWMwOTJiM2ZlYmZjMjI3M2NhZTFjYWEzMWE2OTJkIiwidGFnIjoiIn0=', 1, '2026-02-03 06:45:04', '2026-02-01 02:33:56', '2026-02-03 22:39:53'),
(37, 'logout', 'eyJpdiI6ImJ6ZytqeU9XcHZXSXhMWnRnSDU2dlE9PSIsInZhbHVlIjoiZ1NqK1ZnajFUb1d6Q1ZNT2dPVFlEZz09IiwibWFjIjoiNmRlMmM5Y2M1NjdkNzFmMGExZTRmZDhhYWU3ZDYwYjM1NjRiYzQ5MmUwMmMxMzdiMDJlMzgwOTAyZTliNzEwMSIsInRhZyI6IiJ9', 'eyJpdiI6InhteG5lbDR0c0ZHVFk4dXpzUmVuTUE9PSIsInZhbHVlIjoiVUU3YnhYYWVVTVJLc1pXRW5qNFlLOEkzQ0RSUG9UWG1jVndpSi9VYWV1Wmd6UmlUbG52Y1VSM3gzRS9jRDBiRSIsIm1hYyI6IjRjOTQ4NjYxYmJmYTgxODA2ZjhlMWM0OWQ5YWE5ZTdjZTk3YTliMDljNjBmNWU3OGM1ZmRkMzZmZWFlMTBkMjgiLCJ0YWciOiIifQ==', 'eyJpdiI6ImNnNFAzMFJ1Z2M4NjQxcTg1SElRUUE9PSIsInZhbHVlIjoieEhSRkZQNE5QTHYrbk9NZ0tmTE9GZz09IiwibWFjIjoiNzI5NTU4MDE3MTQzMTQ3MzIzNzM4OGQ0MzNmZDEzODE0YWRlNGFjYThhMDg1YTE2MGNiNDk2ZjNiNWQ0MWEyMiIsInRhZyI6IiJ9', 'eyJpdiI6IjkxUXJGSHh5bjR4RUJxSlBWdjFyM2c9PSIsInZhbHVlIjoiRHN3SkYrRk5BUTJjck5QeUZqdzFOUT09IiwibWFjIjoiMGUyYTZjNDczYzE5YTM3MmM1OTYwNmQ5MTQ2ZmJlNDZjMjMyMTAxYWQ1MGQ4OGIzOTRiNjA4ZjZkZWM2ZTcxOSIsInRhZyI6IiJ9', 'eyJpdiI6InorYUJ4NVlVQS9JQjdaVGtRRG1TNEE9PSIsInZhbHVlIjoicUd0dlJNbmFVdk5IWVphOThYOGlKUT09IiwibWFjIjoiMmUyYWI4ZDUyOTAyNDRlYzBjNGMzZTczZGZkOTBlMGRjYjcyYmMwMTEwMDIxMjRhOGE4MGIxZDUyZjVjODdkZiIsInRhZyI6IiJ9', NULL, NULL, 6, 'eyJpdiI6ImEyNGtRVHNMSHp4M3dBNjNiZis4Z0E9PSIsInZhbHVlIjoiUHY3Um5pcUdTUENLMTlXcU9QRjd5UT09IiwibWFjIjoiNjNlMmVlY2VhYjc3M2RhMmEwZDUxMGY3MDc1ZTBkMDAxNDJjYjdlZDlmMjZiYTQ1Yzg0ZGVjYmJmMmRmYzY4MSIsInRhZyI6IiJ9', 'eyJpdiI6Ik5TMGZZT3U4Um9BTlQzRUpMZ3VVNUE9PSIsInZhbHVlIjoiRXpZSmt6SEo0UnpxTFBiTDcyeHBOZz09IiwibWFjIjoiYWU4YTY3OWFjNzJmM2Q4MmIyMjBmNmE1NzQ5YzI3YzQ3ODNjNWU1NmJjMDk2M2ZmNzFjMTFjY2E1N2E0YmNkYyIsInRhZyI6IiJ9', 'eyJpdiI6Ilp0VHE0V0ZadTFMNGFpckJGczA5VlE9PSIsInZhbHVlIjoiOUN0dlhObWJVZVNnWisyN0R1Vng5QWRlZ3pNUkZvOGdtU0V4UVMrdzZ4dz0iLCJtYWMiOiJjYThjNjUzNjhlZjU0ODc5ZmM4Y2Y2NDAxZTc4NDIzNjgxMzhkZTUyN2I2NTViOWY2ZmRmMjYyMjFlMGFmMTdjIiwidGFnIjoiIn0=', 'eyJpdiI6ImkrYzc4WnJIR3RaTU03Z1drSDFCQ0E9PSIsInZhbHVlIjoidzdWNkFsZTFFNkIvUnFkb2xDVGIxSmcwSFl6Z05qV1FERFRocGVXRmg4TTl3ZnBmSGhzVlVQaWFGVVZhWkJUYUtwMFR4N3F6RHhWRFNXWTZ5OE1yOWk2eG5rdmNrZUVxQXp6TllrVEdOR1FVV055TnhLdVYxUmxxUU54VEd2RnhZRVNvL2VIN2YzMWlQUE9DTU9nVDNTVzRZMU5mMDY2a1Q0My9RSHNveW04UnBIeTRza1lZNkFhcWk5S2hkQWkzdmlwTU5DSWNZWklONXZDYzBCWXFwMlAwcTVkUU9rd1FSV2ZFWXpFbmV0eEpCT1JEYWwyL0dDLzhWT0lEcEcwSFBOVk11aHpGbFE5U1F0bDFXTStiWlBXcFJSNkRhNE5PTFZObHZLUW9xcU44dnpyTnlNZE96M1ZTZnNZYjJlTFIiLCJtYWMiOiIxN2U4NWFmMzYxNzMwMDdhNTI2NzE1YTZlZmUyODhlYTI3NDE2MTJmZjE5OWVhODFjMGZkMDgyZjEzY2I5MGFmIiwidGFnIjoiIn0=', 1, '2026-02-03 06:45:04', '2026-02-01 02:37:33', '2026-02-03 22:39:53');
INSERT INTO `pqr_8x3m` (`k5_id`, `tya_tp`, `uio_tt`, `asd_msg`, `fgh_ic`, `jkl_cl`, `zxc_at`, `vbn_aid`, `nmq_am`, `wer_uid`, `plm_ut`, `sdf_un`, `hjk_ue`, `lop_md`, `kiu_ir`, `yhn_ra`, `ujm_ca`, `bnm_ua`) VALUES
(38, 'create', 'eyJpdiI6InBHV2hucmV4eVcySDVBOHJybkFKVkE9PSIsInZhbHVlIjoiNU9GSUhveFVSbVV3NW01MEpLbEVFT2ZqMjVYcjdNaFFISVZSa216NW9ocz0iLCJtYWMiOiI5NDNmYTBmNDUyYzhiMjk2NjBjY2Q5YmE1ZDA4MjE0OWY3YWM1OTVkYWRmNWIyNDczNTkzMzZkYWIxMWNjOThhIiwidGFnIjoiIn0=', 'eyJpdiI6Ii9yRkg3djNpUWNIOGs1WjRkcFM0QlE9PSIsInZhbHVlIjoiTk5QVDhEK2dPK0VqN29Sa1oxQUlsY3g5TTNNVXVYMUFVZVduaFh5SUpjb1oraitYaUFBblo4aFhWT1YzTytEYyIsIm1hYyI6IjdkNWVhZmM4MzNkOWIyMDMwOGI0ZTE0YTI3NDcxZDNhMzhhYWI2ODE1MTc3NWQzYjBjZGZlNTI3ZGM3M2UxOTAiLCJ0YWciOiIifQ==', 'eyJpdiI6IlhydUx0OW9zVWF0R3lHS1A4VDMrMGc9PSIsInZhbHVlIjoiajJVOEtiWXppaHhFWXFpTzA1OE16U1VVcWMyM2VzNjljRlNoa0xEc25FRT0iLCJtYWMiOiI3MTg3MWY0ODNjYjhmY2NlODdiNWIxMGRiNzE0ZjVlOWFmZGMyODZjNWM3YTM5NzI5ZTIwM2NhY2Y5MjhhYjA5IiwidGFnIjoiIn0=', 'eyJpdiI6IjRVeFN3QlJrL09OYThmVkc0QzVlOXc9PSIsInZhbHVlIjoiWVZkeWVPLzZTa3dwMWFKUlFDR3ZzZz09IiwibWFjIjoiMmRiZGJkOGJlZjE2YWJkNWJiMTVlNjIxNzRkMWNlYmRhYmM5YjFiMDE1YjE2NTc0MjljOGRjY2NkMGUyMWQ2ZiIsInRhZyI6IiJ9', 'eyJpdiI6IkNMUlpLT1pMYXZFbCtqcW8zTTZ2QVE9PSIsInZhbHVlIjoiR3JsTDUyVWMvZjBNQXU0S25Vb0M5dz09IiwibWFjIjoiNGU4NmE0MmQwMjVmOTA2MzEzNzcwYzZiNWM4Y2UzMDJiZmZkNjI2NmY4Y2Y1MmNkYWI3NGE1MDdjYmMxOWI0MCIsInRhZyI6IiJ9', 7, 'eyJpdiI6IktRbTFpVm1YZGtBSkkzTWpFQU16dHc9PSIsInZhbHVlIjoiZGJIejNseWIyb3Mxa2w1NUhWd2JCbkloYWtFcDhZK3B6Z3RuejNXSVowOD0iLCJtYWMiOiI0NjNlN2RiNzA3MGVlYzE3ZGFhOTIzNDU0MjEwMTUyYzAzNGQ0YzkzNTFhM2RmOTRkYzc5MjEyM2QxMzc2YTNmIiwidGFnIjoiIn0=', NULL, 'eyJpdiI6Imkvb01Bblc2VEYrUkVNNVprVnJ1NEE9PSIsInZhbHVlIjoiUVhMdUlKRnRTSnlNTkhHTjc5TzBMUT09IiwibWFjIjoiOGY0NmVjMzRlY2I3OWVlNTEwZmYxNDMxOTI1OGI1YWEyM2M2ZTQzZTFmODliYjgzMDRjYTE4ZjA1OGUxNzkzZCIsInRhZyI6IiJ9', 'eyJpdiI6IklsUVJZbHNkWWl6b21MZTNManlYU2c9PSIsInZhbHVlIjoiM3ZUL3Bjd3JKRU9TZ0x4MWhlZWNTQT09IiwibWFjIjoiNTUyZDEyOWY1NmMxMjNkZjZmYjg1ZTcyMzViZmVkNmQzOTUwZWE4ZTU3MTBlYzc4MmExOTk4ZjQ3ODQxZTlmOSIsInRhZyI6IiJ9', NULL, 'eyJpdiI6ImFCZHNsaGV6S1VxNVpjV2lSNXJpYkE9PSIsInZhbHVlIjoiK0NwZlphd3lLV0hzenl2Y1pxcWFORU9WcHVNd0lpazRoSzR2S1llbFNobElaWUJ1L1FFTE1lYWRacDY5L0dPOTluQVlyWVh3Qm9peGw3L09PRGRrU1VvWHZEaDNGZHdiT05YUHg5WHNONnhIQXh6SkptK3hITmFxQ2tWZUhQY0tQbU5jcWNIUEszUGdCMmhRaUFsY1BHazhJd05hdEt4NGc1UGtYT1NQSTZ2U2VZcVVKYUhBclYyNGt4eks0Rkk4TEtYRFZnSmZuMWVTV0NHcit0Z0J1Zz09IiwibWFjIjoiOTNjOTNhMTZlZWMzNjQ0MjhhZjRkZDU0NjAwYzcyNmJjYWEzZjAxNGNhYzQxZTFhNWRiY2ZiMzk1ZjRkODFhNiIsInRhZyI6IiJ9', 1, '2026-02-03 06:45:04', '2026-02-01 02:40:34', '2026-02-03 22:39:53'),
(39, 'create', 'eyJpdiI6IjdFYjJWV1pPMG51ejFiZEJxU0lldHc9PSIsInZhbHVlIjoiNFJYeVpTcDNmUGc2ZTNZMlQ0amVUNWhhd1c1MTFIeG11TDFsYjdwMlg2TT0iLCJtYWMiOiI3NmFkNGU1MTdlMzE4ZTVjMmU2OTVjOWVkNDliODc3ZmU3M2Y2ZTFkMmZjNzk1OGM1Zjg5Y2M3ZjliZTQ5OWU1IiwidGFnIjoiIn0=', 'eyJpdiI6ImUvOW55cEpTRk5ocitKcFVWdXorTGc9PSIsInZhbHVlIjoicC9ldlhiMmRNRWJqMXRCazloRERHazdoNUJLNllQRjh5d0pBTk15ZlVlZEN4eXBFQzNKSE9POXlkRGU5a2N2byIsIm1hYyI6IjcwMjY2NjQ0NWJlZGU3ZDVkNTA3NmIyNjFhZWYyODIzYjZjYjBlNjY4NjAxNDY5YzhjNGExMjNhYzMzNzdiNTciLCJ0YWciOiIifQ==', 'eyJpdiI6InY2ZDB4akFwN082VE5ybGdBQWQyL0E9PSIsInZhbHVlIjoiMjdXNzZLVWtCYWpHUWNERnY3UkJYcWpYU1pNVUVBZEF1UU5pTERLU0x5ND0iLCJtYWMiOiI1YmJhM2RiMDNkMWRjNjU1OGQyMDdhNThmMTY0ZTlmM2I4ZWUzYjY2ZTQ5ODU3MzU2NTk3YzYyYWM3MGVmOGQ4IiwidGFnIjoiIn0=', 'eyJpdiI6IlV2dXhwMzJLSDhuTVUvQnhpWG5Oc1E9PSIsInZhbHVlIjoibUlBakMraDhETThOdTUvNkZ2Mkw1UT09IiwibWFjIjoiZTNkZTEwY2QzOTA2YTI4NTU0ZGUwYTY1NTI3MWQ3OWVkMzFkMjhmMzA0YTRkNDUwOWUxODdiODFjMjg5YjBmOCIsInRhZyI6IiJ9', 'eyJpdiI6IjlDZ3FqMnEvMjZhcC9ad0RaSlRzVXc9PSIsInZhbHVlIjoiYzVsTitTeW5tdWUrc0ZSOXlRNjcrQT09IiwibWFjIjoiZmVlODVhZTRhYzVhYzIwMDE5OTk0OTM4ZGU4MmU1OGZlMDdjMzNjMDFlZmNmY2YxMThlYjQ0ZmY4ZTk2YmFiYiIsInRhZyI6IiJ9', 1, 'eyJpdiI6IlcvTEdiV3YycVZ6S2NTTlNMMVJ0U1E9PSIsInZhbHVlIjoiU2grN3UzTmdnbzYyU29jNWFQdGJwb3lkampFdm5XSlNjaUVYaDRjdVpXdz0iLCJtYWMiOiI3MWI0MGU2YWE0ZjhiNmE5MzM3M2Q4MjJhYTBjNzI3OGZlZWVkOTU5ZjRmOGNhOGQ2ODQxY2ExM2VlNmUwYmQxIiwidGFnIjoiIn0=', NULL, 'eyJpdiI6ImNFVmJQa0RqWDhmNm11VHRhdS9STkE9PSIsInZhbHVlIjoielNXS2lOZkVRWXBvb2hucm8yYlRidz09IiwibWFjIjoiY2UyYWM2OTM0NjdlNjRjNGEzMGI4NDU1YjBhZjhkZmE2MmNmOTZmNTVjMjU2YjdiOGY1NjdkMzczZTU0YjMyNSIsInRhZyI6IiJ9', 'eyJpdiI6Ilg3T2x0VHBZMXAvSE5ENHBaWEFzdmc9PSIsInZhbHVlIjoiK1hobXNyU3dXQzFUVlBPWDVyclhQdz09IiwibWFjIjoiMjhhNDdkNDQ5YjlmZTNiMTU4YjdmZDFjN2YyNGRlYWQwMjkwNjI1YWZhYWYxNzY5YjUyMzBjZjJlZTE5OWM4ZSIsInRhZyI6IiJ9', NULL, 'eyJpdiI6IjQ4eTkzZ0lEdVpXb3cvWXErVktBbUE9PSIsInZhbHVlIjoiVzR0WXdsdE9WQW02QkdjZ3NRa3lKK3c4UHlPVXBScTdreDRlK0lsbU9TZjBRc09ZR1hmaEVoUHRYYTZoZ3VvT2NLMFIzeC8rejJJZHZCMGhQY1oxenhEVTNvTW9Za1BxQStEWkRDS0Jmak5yYW9JeDBxakh1elN5dEpCTCtDdDRhd1hFQnNyWWpWSDNXVkNpVGxjbWo3UnRZTmRaWjhkU2dBYUppaU00dnlaMDM2b2h2WXpGWUV1UEJCN1ByZTk1ZTlxazUxN0VybFFJOUJZYW9oYnN4QT09IiwibWFjIjoiOWUyYzdlZjhiNTBhYmZiOThiMWY1ODBmMDJkZjViMzZjNDc5ZjMzZTVmMWY5ZDY1NTQ3NTA3ZGRmY2MwYzZmNyIsInRhZyI6IiJ9', 1, '2026-02-03 06:45:04', '2026-02-01 02:41:13', '2026-02-03 22:39:53'),
(40, 'login', 'eyJpdiI6ImJSUXlqNEhqNjFDRTFOMTFXZVpwZ3c9PSIsInZhbHVlIjoiYmw4YnZWcm5LbDZRRWZuYnVSVVBsZz09IiwibWFjIjoiOTkxOWVhN2I2MjUzMDIyYTNiNDgwMTVmOWE4OGMwYTY1MTJmNmE1NWUxZjRiMWM2OTBmNmIxNThjZThmZDEwZCIsInRhZyI6IiJ9', 'eyJpdiI6ImkxNHBHYitrTTZlM253N2xqRGJjenc9PSIsInZhbHVlIjoicXFRUi83anBHZjM0T1FsSjlkVGN6OUZsVDN3V3hJTHVrQW5XR1FYdUk1WT0iLCJtYWMiOiI3NzUxNGRmOGE2MTEwMzg2ZTMwYzMyMGZjZTE4MTc4ZGUwZWU0YzYwN2E4N2FiMjQzZDg5NDcwNGExNmM1NDFkIiwidGFnIjoiIn0=', 'eyJpdiI6IjN1ZXVveWFnY1oxVndmZDljdVRIckE9PSIsInZhbHVlIjoiUFhMaXN3a05NOGZvM0lRSUkva2w1UT09IiwibWFjIjoiYTZjMmUyMzMwOWRjNWZhNmM5ZGY4ZGIyZTliOWYwNTBlNzQ4NGQ2MTlkZGJhZjczYTQwZDRiMTRlZGJjYWIzMiIsInRhZyI6IiJ9', 'eyJpdiI6IjVSU1QwbFJJUzJ3VWN1c1E1ZmhjUFE9PSIsInZhbHVlIjoiY1VlZmRsa3BKUlRpdG4zajJTN2VSQT09IiwibWFjIjoiOTdlOTZhOWMxNTZjZTk4YTQxMzZiMmFlZGQ5ZWEyOGE1ZTM2MjBkMjAzMGE1YTliZjRkOWMxMGFlMTVmNGJlNyIsInRhZyI6IiJ9', 'eyJpdiI6IjN6UHFZUzE5YWdUUzg1cHdGOXlCY1E9PSIsInZhbHVlIjoiVkVub0N0Tm9ub1diaDdtSlJlUFRsZz09IiwibWFjIjoiMGVjOWRjMDQyZWJhMWU5ZDM5YzNiZjI3ZjcxYjlkYWE0NDY0Yjc1ZGZlNGQ1NjE2NjU0Nzc0MmQ0MmJlYjc5OCIsInRhZyI6IiJ9', NULL, NULL, 1, 'eyJpdiI6IkFnMlpYUTJTZFcxenFrYnRGSUk3REE9PSIsInZhbHVlIjoiVFBaVFlva1BOREJqRnVONXE4OHQvUT09IiwibWFjIjoiYzhkZjhlZmM5NDQ3M2YwZWJjY2Y5YjMxYjdhODg4OGNjNDc5M2JmNWI4NWRlNDMwNzRlZmUyMTI5YjdmYTA0ZSIsInRhZyI6IiJ9', 'eyJpdiI6InhkRjEwT05sWGZPSzBBNUovRDlsVlE9PSIsInZhbHVlIjoiNEhpRi9aWTJZR01Cc1p6OVZsQ29lQT09IiwibWFjIjoiNTIwZTY3MjEwNTM1NTUxMGNkMTkzZmVlZDMyZGEyNzNiNGU4NmM1MzM3NDNjYzQ4MGNhYjYxNDM0N2JmMmI0YSIsInRhZyI6IiJ9', 'eyJpdiI6ImpwbFhJenhhRUVLMHFZR2h4Nk8rSnc9PSIsInZhbHVlIjoiRlVEWkdVUWpBeDVmMmtvNUt6MFJYK3o3dFFCdDhBdHpjM09LdUxvcENpZz0iLCJtYWMiOiJkMjI0MTA0ZTdjNWNjOGVmYTBiZGI0NmQyN2JiZDdhZWRjYzhjNjY1ZmVkYWFhOTJkMDE1ODczNmY0Nzk1YzNiIiwidGFnIjoiIn0=', 'eyJpdiI6Im5JeGFmZ3lFdndRcEN4dVpVOFEyQ3c9PSIsInZhbHVlIjoiTk9JclJVREFySktPUllBMi9aRzd5OFNWRGhJVEZrWVkra01odVo3cDBOTnIrOFNoSllNbTl3SnJ1Tkdxa2lBLy8rMjk4Z2VFL0lmbFA3ZjVpSUV3UUZLWXU3Z1pINDhxendJaHkyMWJnTnFLMkFLSnFYSVNxQVZpcDhmdG9tVzNpdjN1TndOdDZydWFXa0g5TlROeFh3eUVqTmRkVHRvb3hXa1ZQVVh5SVZZTEhpaEEwQlBONmRLY2VhcVNQK3l0VGJ2NE1jT0RWREthR0FtSEtiNFZQSnBZa0lOOElvc3hNa2g5bXlHcEtyZXh6TThmSHVxajE1MkVVTlhnUjI3WVZQaVFBcTVwSUlWRWxjMVlpZGQ4S04zbFNyR1IwUmk0YURBZ2t0TEE5VnFPL3JHR1J6b2NFTzVVbnJsRWhDTkoiLCJtYWMiOiJhMDQ1MzA5NzBhMjQ1OGZjYWM0ZWRlNTJjOTM0MDIyNDk2OWI5ZmI0NjQxN2I3ZWU0NThiMDA4MjkzYWRhOWE5IiwidGFnIjoiIn0=', 1, '2026-02-03 06:45:04', '2026-02-01 02:41:22', '2026-02-03 22:39:53'),
(41, 'create', 'eyJpdiI6IlF5cEJCNDZwOGVkM2hLekl1VDNQV3c9PSIsInZhbHVlIjoiNy9OaTIrZWszeTZrV2VhemFUZDFtZz09IiwibWFjIjoiMTc2NjVkMWU3YWY3NzIyNjkxZjNjMWZhNGQxZDlkMWJjMjQ4MjhhNjEyNThhOWUxMGFkOTlkNjJmZDBmYjgxNSIsInRhZyI6IiJ9', 'eyJpdiI6IlBrSVlYQWYxUG1GZFg2dklkZjlIYXc9PSIsInZhbHVlIjoiVUlJZ2JFNXQzLy8rVmJtSnUvaFpNTGlEOEtzWUxFMGpoY1JsQ29uZ0c4OD0iLCJtYWMiOiJjOTBlZmU2YzU5YzYyZDMwNDA5YmUxYTRkZTBjMjExMjY4YzQyZDNiMWQyYTM5ZTJhNzRhOTM4ODM2ZjZjNWU3IiwidGFnIjoiIn0=', 'eyJpdiI6InE0N0RZT2lyR2UyNjRERjdwejgxRnc9PSIsInZhbHVlIjoieVN4RWcwUjBETkp3RnJRTzA0NElMZzBtWGdPOEE2Qi9tM3NVU3NBbkpEdz0iLCJtYWMiOiI5ZjdlNzVlY2E2MDYxMjMzY2JmMGI1ZTlhMGRkZmQ2MzY0Y2Y0MzJmNTc5YWY3YTk2MGJkZWU3YzUyNjg4NDMwIiwidGFnIjoiIn0=', 'eyJpdiI6Ilc0TE9Eem0rd2pCbVdwZzdTbk00Qmc9PSIsInZhbHVlIjoiWDNDK3l3UHlzV0ZqODQ3N0N2bXROQT09IiwibWFjIjoiN2EzZTMxMzZmNDY4M2NkZDg1MWNlZDI5NzI4YmE1YTFkMTY4YmI5ZDBlNTM4ZDgyYWMzY2Y1OGM5NmMxNzdjMCIsInRhZyI6IiJ9', 'eyJpdiI6IndMTGFEeUlGM0YyMFY4NkF6WGt4Z3c9PSIsInZhbHVlIjoiM29GY3NNb1JZVWtCM1dXbHQzV0tFUT09IiwibWFjIjoiMDVkNGM5MzY4YWMzODdkM2QzMmJhNjE2OTUyZjY4YzI1ZmY1MmIwNGIyMjcwYjljOTk2YjI2NDhkMjRkNjU3YyIsInRhZyI6IiJ9', 2, 'eyJpdiI6IlR0L210Mmo2dHNjbThvTFkvRy95cmc9PSIsInZhbHVlIjoiVmQ5MDJiaUJ3Q0cvU294MHcvQjQrUkFXVGZYZml2WFFsRnV3bmsxM293dz0iLCJtYWMiOiJkNjUwOWVmMDVjOTBmMWY4Njg0NWNjYTE3YTU4ZDhhNjZiNDYyOTUxODExZTc5NjRlODcyNzIxYzMxMmNkNzE5IiwidGFnIjoiIn0=', 1, 'eyJpdiI6ImRlVmhOamlhdDdrUURTbHcxMXI3cnc9PSIsInZhbHVlIjoiOFZ6aG1wbUk0VXhZK3dHZGJvc3N4dz09IiwibWFjIjoiNzE4NWU3MzRjZDEwMWVhYTk0MzljZTgzYjc1YTRkMTYzN2NjMWI3NTBlNTQ5NGMwYzQzZTBhOTY2MTYyMWY4ZSIsInRhZyI6IiJ9', 'eyJpdiI6IlBlM0JURks5Z3ZQTjV3QmlYMVZ6Y0E9PSIsInZhbHVlIjoiZnkvVko1NzNHWnVXSGc4MFZXdjF5Zz09IiwibWFjIjoiNDU1NzFiNTdiZTZmMjQwYTk4ZDI4OGI1MDNlYzU1OTA0YzA3YTZhZjkxMTFhMmMzMThjNjExMGFmNzkyNzQ0NCIsInRhZyI6IiJ9', 'eyJpdiI6Im5nRHNITnFGM2ExM254cVNQUW95NVE9PSIsInZhbHVlIjoic1FVamNwUUNMc1RFVi9jbHF1SXZ5Qnd3TkIxTk9SdHEwb1FUOUJScy9Odz0iLCJtYWMiOiIyNzc1NTYxOGZiOWM0NDVmYTU4MjZiM2FkNjgxMGU0ZmUyOGIwYzUyZDdhMDUyYjA5M2E3ZGFmNGE0MGRhZTk2IiwidGFnIjoiIn0=', 'eyJpdiI6ImFmM1BvQytveDNyRnZHYzhXdk50MWc9PSIsInZhbHVlIjoiWTY1SlJ4REUrVHNEaHQxMVh5UHNHNjhoSWdFTWNvRVkvOGdsOVhkbTlqN0gzMFYwYm9oNXJUWFFYZjZJV0ZmY29EVXNLSUJ6K3k1QTNocnFicWYzMHoyTnhnRXdLYm5uaWRyTlJGNTFmYndiaE8zaUhKTnB4Zmk3aWszZGJ2ald6aDNtNk83YWZUOFQ4L0JtajU1Zms4RzhmTXViOWVtVk1ESnJIUHFFMHAyeXF3eUo5RlJmeTZVY0RoeU00Y2o2YXB4em1ZVW1OYUZYUm9GZzlvODZBM1U4RGd6ZVlHbmtGQkVCMjV3V1F1OG91d1BKVHREVFhEbmxqVUZzdTVvMzhvdUl4S0FiZDIxUWhvV1ExRWFqbmNvcVhUck9LcWJBRHdYY1hXWmZqMkNKMzBSRnFOUURaMmZBOVhOY042MFhSSXExc1NneXlVc3NtNUVMcG4xL2NNRUpySy91eHUwYlp0cmxUeHBvUm1rRk5uMVFhVkVkdmV3VE1OeWhnMmxNUVN5dys4QWdFOFVlT2ZxUGlzczNUU1c1MDA2aDZxWTlEREI5bjJ5d1o3M1ZNS0VTZ1JkcTgxS1FuVXNLRmpOeCIsIm1hYyI6ImMxYmQwZGJiNDNhZjQ5N2JhMmM2NWFmOTZkNzBkNzE2OTk2OTUxNjMyYjU4MjE3N2I3NmNlMzAxMGVjMDgyOTkiLCJ0YWciOiIifQ==', 1, '2026-02-03 06:45:04', '2026-02-01 02:42:32', '2026-02-03 22:39:53'),
(42, 'logout', 'eyJpdiI6ImVLQzViTG9CMkxmSlB3UXVNMWd0eGc9PSIsInZhbHVlIjoiVVB6UHd6TEJOeUs1NWF1ZEplSVdVUT09IiwibWFjIjoiNTA0ZDQ1OTMxMzc4YTljZTY1ODUyMjBmNzI5ZTkxOWRkOGM4YjNhZjc4Mjg3ODY1NzBjYTQ2N2QxYzA2Y2M1YyIsInRhZyI6IiJ9', 'eyJpdiI6IlZ6NG04WWFsOEtUSTlHNlB4QVNjc0E9PSIsInZhbHVlIjoiUVIxVDFjeVl6VTFnZ29IL0RoSHVZWTF5VDBSQVdDeG9CeFprU2toM2RJK0dJRkFRY1ZWMHhqVTgrYkltSmJsSiIsIm1hYyI6IjVkYWM0MjFmOWIxZTBkMmUxZTMxMzBlYzI0YjUwNzQ1MzZhOTg3MDg1MDIwMTQ2YTY3N2I2OGIxNjJmN2VjYTIiLCJ0YWciOiIifQ==', 'eyJpdiI6InlNVkVoTlovcWJVTzdCbERUWTB2cWc9PSIsInZhbHVlIjoiNmlJZVBYUDArcWwwZlNCcTU3RDZHUT09IiwibWFjIjoiMGYzZjUwM2M2Mjg1YzBiNmQ4YzNkZGVkNmUwOGU5MDllMTVjOTJjZmFkZWI5YTAzYzE0NWE5ZTI3MTgyYWRkMCIsInRhZyI6IiJ9', 'eyJpdiI6IjJKbEpqTFVsalZrdTh4WTd5YisyMkE9PSIsInZhbHVlIjoiRVByVVo5dVl1cjdWdEFSanUrdTZ5dz09IiwibWFjIjoiYmE1ZDkzODkxMzlmZGQ3YWM3YjQ4ZTNmYmZjZWVkZjljZDViNDcxMmQ4MWZhOTA5ZDAwMDVlMzQwYmM5NTBiMyIsInRhZyI6IiJ9', 'eyJpdiI6Ik1xWENWVDBoejRUME05Y2FyaDREalE9PSIsInZhbHVlIjoiMjZJSk41TnVhUTVwWUhLTklvazdSUT09IiwibWFjIjoiODc2ODZjY2U5YTY0OGY2ODExMjkyZmM5NzU0N2VkNTJmYTk1YTYwNTRhMTE0NTdiZWE4ZWY0YmExOTE0ZWYzYSIsInRhZyI6IiJ9', NULL, NULL, NULL, 'eyJpdiI6ImdMZlhqcXBWTXhaTk80alFWQUxoeWc9PSIsInZhbHVlIjoiWVVDMk1XNU01clVHNTlnMmNtMFlWQT09IiwibWFjIjoiZGJjNDVmZjZjYzE2NTE5ODZlNTExYzFkZTMwYjRiZTAwMWE1ZWJlZTY3ODM4OGJkYTY3NDBiNmMwZDFlODNjYSIsInRhZyI6IiJ9', 'eyJpdiI6IkkrN1dhVGdPM3NzdGtTenZVVHBueFE9PSIsInZhbHVlIjoiOE1raWk0Q0wrNTdvSHI5cm9BOEpxUT09IiwibWFjIjoiOGFhMmY2MzM4OTdkM2YwZGJiMmFmOGVlNDVhZWJlMGRlNmQ5ZTJkNzkyM2Y4ZTVkNjYwNjZmNjI1NWE5YzBjMCIsInRhZyI6IiJ9', 'eyJpdiI6Ik53Y29TQ29tdVAwejV2Y0cydTJhNWc9PSIsInZhbHVlIjoiQTY1VElnZEt3d3h6MVNuYklnZjBTWE94ZzdJbVdOYm0vOVVmUHkwNmwxdz0iLCJtYWMiOiI2ZjliYmI3NTYzYWE5YjQ4NjNiNTJmZGMyZjhkYjMyYzQ4ZjkwZmVmYTNlNWFhNDMyM2ZiNmE3MTFmYmZhMmMyIiwidGFnIjoiIn0=', 'eyJpdiI6InZQZDdoSHQ0SGZlTGtkQW9pam56WFE9PSIsInZhbHVlIjoiVkpkY25zb2hYWGdNM0x1Y21CVG1oK3ZDTXBZQ3k5Qm1aczJweW5Ua3psTWo1ZEd3UUxaaitkUGdxOTF0YWtURDRIV2V2d0ZEOXVHOTBNelFjalRDMmtDR3BybGEvTkFjaWZyQWhOSVlMd1RITGpZd285am83WTdnWG1BWndPY1dicXoxcUpmVUcxMHFKUWVITFUrQjFlNkJBaHlJRGZUWk9TaXk4QVNYdHozdmNqQzNneE5NMHgxQWZWUnhXQVNYRk10cnRPUVZvODVvVVdvN1pRZHhjaGFkUUpoeHFZeEN3UGpCdGxNWmRNUEdUd1BDVmoycDRtcTlVcHNaRzUrMk1mdlZ2MXZFR0VzcGo2ekFhRTlEUS9DUUV0TXFhRUkzdlVwRFFqQSt0b1NMaHZrcTI5Q0FoRWtzYmJCdk40NWciLCJtYWMiOiI5MTg2ZWQ3OTEwZTUwZjQ5ZGRkNzhkY2JlZGU3NTRjN2JlMTVlN2NjYzJkNzAzZTFkYTIzNTEyYzc5Yjg0NzBmIiwidGFnIjoiIn0=', 1, '2026-02-03 06:45:04', '2026-02-01 05:15:20', '2026-02-03 22:39:53'),
(43, 'login', 'eyJpdiI6IktaTnZVNGVKQ1o0T0NWTlg2VnlETkE9PSIsInZhbHVlIjoianl5dTNQeHdDSE1pYmY2Yk1DTHJhQT09IiwibWFjIjoiMmI0NDk3NGU0ZmEyYmI3ZDUxOGJmZTVmNjE5OThjZjcwOTlhYmVmZjFhZDk4NTJhZDQyM2ExOTNmNGYyYzVmNyIsInRhZyI6IiJ9', 'eyJpdiI6IjlLejc2cURYS2k5M3JiSEsxdTdmZWc9PSIsInZhbHVlIjoiQjJnUzl4eEpydXpnbGZwOXFYNStPV2I0Sm95bTcxTEhlVWtZckhCQ3g4Zz0iLCJtYWMiOiJhMDg2YzdjMWMxZWFhMDkxY2Q4MmVlZjI0Njk1NGIzMjU5OTYxMDdhNGRjYzNiMjJiNzE5ZjhmM2NjMTgzODIyIiwidGFnIjoiIn0=', 'eyJpdiI6Ik0weEt0anMwQWozN0VvYWtKVzdLRGc9PSIsInZhbHVlIjoibEttODgwUWVxTStoTGloenoza3lvdz09IiwibWFjIjoiMDUzMDUyODc5N2JiNWE2NzVhOTk5NzUyNDkxNDI4NzkxMWQ3NzQ0Yzc0OTYwMjMyNjZmNzlmMzFlMmZlZjgyNSIsInRhZyI6IiJ9', 'eyJpdiI6IjZvYTZ5Mk93OTVvUGJVbmJvbVRiMHc9PSIsInZhbHVlIjoiWUdTVGJ6cjZGa1VDWnpKWUxHNitadz09IiwibWFjIjoiODM2YzBjNzlhMzYzNjM4M2IxNzc2M2UyMDBmN2M2NDgzNjhhMGQzNTZjNDk3OTQwMDA1NGIwYjE1YTAwMDFhNCIsInRhZyI6IiJ9', 'eyJpdiI6IkZVUmVFQVdUSVhSc1JhQytDdDZjaXc9PSIsInZhbHVlIjoiRll3cjlBbk80R2szTUpMYXFVYm02Zz09IiwibWFjIjoiMTNlY2EwYWY4Nzg0ZGIyYjYxY2M5MTQ5ODRlZjA1ZDk4NzgzZDU4M2U2ZjJiOWJjZTFjOWVkNzhiOGNjMGE1ZSIsInRhZyI6IiJ9', NULL, NULL, NULL, 'eyJpdiI6Ii9XclNSYzFUdGtnVVllMU1mMUdMMlE9PSIsInZhbHVlIjoiUHpsVlptSkRjS1dKSWp4MzVWdkJrdz09IiwibWFjIjoiMzJiNjcwNDQ1MWVkYzcyNzFiYWU2MThhYTJkM2U0ZWMzZWYyM2JlZDg2MDY4Y2U2ZjFlOWFmNDFjMDYyZjQwMyIsInRhZyI6IiJ9', 'eyJpdiI6IjZyZUo5U21TWWlwczFGRjRlVGQzUkE9PSIsInZhbHVlIjoiOEd6YUVFbDM4NFNyR0ZWVm9xOENOZz09IiwibWFjIjoiZjlmYmQ4OTAzOWEzNjc4ZjVjYWQ1YTc4YWQ3YzExZDA3NWFjN2MxMGU2ZmZhNjBmMTdhNTJhYjhlMDJjZTI5OCIsInRhZyI6IiJ9', 'eyJpdiI6ImRSa3dZT2VEVjdJVWhlUlAwQWYzM3c9PSIsInZhbHVlIjoiNndjMHVoSFh1Y2JtaGlVMnlHd2g0K0VtazB5TUExbnA3RFJ1VER5djdZND0iLCJtYWMiOiJhMmI0NDEwMzI0ZmVjYzk5ZmExYzAyMjE1OTJlZjg4MzFjMjgwMTkzNmNkYmY2MGI2ODVkZmNmN2M4NmM0ZTRlIiwidGFnIjoiIn0=', 'eyJpdiI6Imo3cVQ2K2tzblg5Zk9oY3hsb1JyVXc9PSIsInZhbHVlIjoicmZLTVhIWmZYazQ4YXNuYlhRdE5qZnF4WVlUMVJxZmFoanAwMmY5VmNBcVFwUnhOeDByK25RWG5kK1ZNc3ZRZ0hYbXllVERhaGxIQXhacWRJSWdORHR0QS9kRmpMRGFVMEpRNENzYy9aNXAyWEpNb0R3N0RadWV1VnJLWnV5d0cwUzhpVkM1WWpCMWR1RkZzOWpQTmtRVlo0M0lwZks5MkxpZHd4Z0RoTXVXVlNZRzFsRUhQZWN0a0RnMnZGeDVZemNhQjVzSlNZQks4SENsVDZYb1lUUFJiVHJwMkQ3aVZjQVpXbkdzeFkvbWhUbUs0WVFaaHR6UHpHbjVrdlN0QURWVHc1bk5UZVNwUWJ0Ylo4Yk9ZamlxV1g2KzVhYTZSQlJMc2FNcXEzTlYrUmNJL2VJVVBiSEpTZ3FEUXBHeW0iLCJtYWMiOiIyNTgyNWI3ODE5NmVhNGNkY2Q5MzU4N2YwNmU4YWIwYzQ2NWJmZGU5M2JjODdhOWFmOTczNDM2ZWUzM2Q3ZDc1IiwidGFnIjoiIn0=', 1, '2026-02-03 06:45:04', '2026-02-01 05:40:38', '2026-02-03 22:39:53'),
(44, 'login', 'eyJpdiI6InYzWlY1K0NvL2NNVHFMU25RaDQwalE9PSIsInZhbHVlIjoiZm15MklJL0hpcUJBNnUvczM4MXpiQT09IiwibWFjIjoiNTNiYWFiMjAzNjljMDI4MjhkOTNhZWM5YzcwZTQzYWExZDM2YzdlZjVjODYzMmVjN2Q1OWU1N2U1OGM1ODg0MyIsInRhZyI6IiJ9', 'eyJpdiI6ImJHY2gwbWI1TFZBU3B0MWFlM2w1MlE9PSIsInZhbHVlIjoibW9lYTd3M3lRSDlVOG1rRGpVUks1N3B2Mkt5WVRxMjJIR2dCRzNsRzdxbz0iLCJtYWMiOiI2NDFmNzdlZGIwMTM0YmZjMDNhMjllYjE3ZTNlN2YwN2M5Yjk1MzdjN2Q3ZTFiMzBiMmI0MGYzZjMwNzUyYzU3IiwidGFnIjoiIn0=', 'eyJpdiI6IlpMUkk3eC80ajA3dUVwVzYvWS90YVE9PSIsInZhbHVlIjoiR3ZRUzA3RVdkZWJ6WGhMUHhlSGNxUT09IiwibWFjIjoiZTQ3NWIzMTM4YjdiNWI0ZDgxMTQyOGUwNzJhNDlhOGQ2OTM3ODZmZjQ5NDQwY2U0ODA4ZWVkNGZjNjNlMTBlMyIsInRhZyI6IiJ9', 'eyJpdiI6IlZmYXFBTlZ0cERaTnI5UGsxeVFlNVE9PSIsInZhbHVlIjoiSm5uLzlTZFZCbXNiandwbnB5V244QT09IiwibWFjIjoiODU0ZGViZjg0YmIwNjM3OGQyYmQwMmFjYjg3YzFmMDBkODg1NDY3NzcxYzM2ODc3ZTc2MDM2ODAzNjQyNjA4MSIsInRhZyI6IiJ9', 'eyJpdiI6InJ0R3RXd29kbVBvblhIQW5VaU1MTHc9PSIsInZhbHVlIjoiWlY4MzR0TjN2b0xTYXowY2FyaWZ3dz09IiwibWFjIjoiNjAyYmZmNmI0ZjFlMDAzZTNjNGUxMTExNjA2YjZlMWYyMmYzNThkMGNlMDllYTVjNzE4NzAxNTkxYmNlNDkwNSIsInRhZyI6IiJ9', NULL, NULL, NULL, 'eyJpdiI6IlZrQWpNUE00eUVna0dUenhTVldTR0E9PSIsInZhbHVlIjoiQkh3OHZBR2JuUHBZRFhJNDVab1NNZz09IiwibWFjIjoiMGQ1YzhhNDUxMmE0YzQzMGZjMzEyOTVhOTA1MDU1YWUxYjRlZTNkYzMxMDkyZDdlYTFlYjJhNzcyMzQ5ZDFlOSIsInRhZyI6IiJ9', 'eyJpdiI6ImIwTllNU3c5ZDR1dGp3NXZqTXN6QXc9PSIsInZhbHVlIjoiRERBd01vS0xuWVdlTjdZQWVrbGV4UT09IiwibWFjIjoiNWVjYjlmMmI2YTFmMWMyZjViYmQwYzNlYWVmMzY4NWRhNTU5M2MzODRjNzBmODA2MTBhNjZlYmU0MzNkMzM1NSIsInRhZyI6IiJ9', 'eyJpdiI6IkNWVHZnT1FzT2h3U04rV1NGY01pNFE9PSIsInZhbHVlIjoiK20rZG0vQi9BRXFLdGVwWWdEVXE3NStidXkyd0pjSnpCYnJjUE5tNndjVT0iLCJtYWMiOiJlYmY5MWJjNDE3YzExZWE0NjJiMjJhYTg2ZDc3ZjZjNTAxNjAxM2JlNDI5OWNmNGMwZGM1MThjNWY0NzdkNjg2IiwidGFnIjoiIn0=', 'eyJpdiI6IkpQV245ckxwMlJMaGxGR2x0NXBqMnc9PSIsInZhbHVlIjoiOWx6dDRtRllpbEdEZGRxby9vL2VNVXJYWDJHdWRab051M3I5d1AwbFlKSTZqZG1Fakpsay9UZW15QlF4Y3BtQnhhbXlOR1RSamd5QmdUMy9UbXRWL2ZnZnlMclVTRjZWUTBVandidlQxN3dOblordWcxSkZkQUJTV2hoSTR6dnZhYkZqRm5FalVyenNiM3lzTFMyMC9VOXpWdVhmbUo3QncrZE9RRU1jeHpIdnZOdE1iTjE0bmZITG1nRVVKS0dNWjd1cmhXT2NWUlJjYUlGM2dlaURxMXNmeWVSSEhUWWdaRm5EMjZlM1d2SUVrVDBIaC9sYnQ2SGV3R2JSNjF1ZklFNkYrdDh0RitQVVVVY0lJQmdWMmptNXZKRzhTdVhNMzYyYUQ3ckNpNzU5b2pxN0tBRERNL2dPV1ZkcHNGUUgiLCJtYWMiOiJmZDUxMTAwYTVmODg1MTY1YjAwNzQxMWMxMTQ1ZmJjZDcwMGY5MDc4ZTU1M2E2YzViNWY1MzUzNjhmOGY2ZDM5IiwidGFnIjoiIn0=', 1, '2026-02-03 06:45:04', '2026-02-02 22:13:36', '2026-02-03 22:39:53'),
(45, 'login', 'eyJpdiI6IjZoRUEvYmZaQXpZYUx3SVVLUlFkdFE9PSIsInZhbHVlIjoiNkY0N0drZVFaZkU2ZDcvTlVFT3M2Zz09IiwibWFjIjoiMmRjY2ExYmZiNDZhY2RlOWFiZTAwZGVjZDEyYTQwNzZlN2U0ZWEzNzExNDY4OTBiMTJjMzgxMzJkMjQ4ZmNjMyIsInRhZyI6IiJ9', 'eyJpdiI6IjBSQVN2aDNMZGxSN2ttaURNNlh1YkE9PSIsInZhbHVlIjoieGNyT1Z5ZzArTWxOSmoyZjd1akhrQjFlRXBCNVBqV3VyWm1wUFNldUR4ST0iLCJtYWMiOiJjMTA5ZjhhOTg0ZWJhZjQ5ZDc3M2UyZDkyYjc0YmMyYzY5NDkzMjJiMTBjNzNjYmYxZDlhZTIwMDRiYjkzZGUwIiwidGFnIjoiIn0=', 'eyJpdiI6IkRCRFhCM0R2bjd1dTU3WWQxQkVQa1E9PSIsInZhbHVlIjoiSDZDeDBobTc1dkg1RFhkZDIraHVqZz09IiwibWFjIjoiYjhkYWM4ZGFlMWIyNTBiZTczNWY3OGE4NTA3ZDk5M2JlNzE0YmQ0MWMwODBjNmY4NTAxNjRkZTk3MjkwNjRiNSIsInRhZyI6IiJ9', 'eyJpdiI6IkFrSjZRWGlLVGZtR3c0bWlONG5lRWc9PSIsInZhbHVlIjoiaVVidi9TRXhYOWxJbDdYazVtK092Zz09IiwibWFjIjoiMmQ0MjRlNzY1ZmJiMmU4OGQyMWYzMTgzOTcxNjRlNDI0YmU3YmNhYWU0NzJhMzMyMGMxZDBhMGY1ZjQ2NTU4MSIsInRhZyI6IiJ9', 'eyJpdiI6IkQvYTEzRDFkL0xMU3hhSDBsb1lvTXc9PSIsInZhbHVlIjoiTC84TWhXSG9oSEJ6bGFuSytYdmI2Zz09IiwibWFjIjoiOWVhMmQ0Y2IxYTk3MGU3OGRhM2JiMTJmMzA4YWU3MDk2YmIxM2RmZjkzMWQxZWNkYmZkMjY2YmVjY2Q0ZThiZiIsInRhZyI6IiJ9', NULL, NULL, NULL, 'eyJpdiI6InVGKzdkZ2hYdlRnQVVRR3dBQlJCZVE9PSIsInZhbHVlIjoiSUdncEMrTUxJR1VzUSs3QUpJa3hDUT09IiwibWFjIjoiNWM1MWY2NjJmMzNlNmI2NmE5YmRjNDRjNzIzNjYyMmMyZjM4M2U4YThjMjgwZDY0YWVkY2FiZjM5OTRjNzNkNSIsInRhZyI6IiJ9', 'eyJpdiI6IkVNc1JLTHlkZk91NlVLdkE2TUE1bnc9PSIsInZhbHVlIjoiWklQaGJzUjdkZFRDRmVEWlhXeGwvdz09IiwibWFjIjoiNTUzMzc1ZTUzOWQwNDY3MzZhMmMzNDgyNTZlYzdkOGQ1OTgxOTkyMmQ4NWI2ZjIyOTQ4MmM3NzEwOTE0YTU1ZiIsInRhZyI6IiJ9', 'eyJpdiI6IjNubnBXekp1d2VpZjlmV21ia1YwWVE9PSIsInZhbHVlIjoiQ0Nob1dtdHlVaWp5V0wrRXRVY3JodDI0WjZxL0Mxd0FBemxIamJCSDJQVT0iLCJtYWMiOiIzY2IyMGFiY2M5N2RhMzlkMzQ3ZmQwMjk3ZTA0MTUzYmVmODc2NGRiZTI2ZWU0ODA3YmFhZWYzNWRkMDllYjk0IiwidGFnIjoiIn0=', 'eyJpdiI6ImY4U1M0MnFUZHQyZ3phbmozWjNmdVE9PSIsInZhbHVlIjoiUXBSMmMwb1cyWWZoNHRSbnlwaEVpdTN6Z2E4akJnVlNsNWpQMGVETEJKZ0pDai9ETDNVam5uMjFYYnZ4Y2k4aHltamNqSzJaUW1ETnFpNnlJQmRjZ1I0N3dlbWU0MzJ1YzI1K3dnZWVTVVV2a2xSS2NtZU1nbHlveFJuTFVEcnBzUDVZUndUK2p4WWNqa0NKOUFMOFA1Q2M2VVB2dGZjdGFmeTNnZXlMeFNocDFkUXQ5U2EvQU1wVG5UUTIzUHdkTVpPeGxTaFIyNldIaGhJUUpDZWVmbVdCSklFZ29nSkNOMmNHREN2cTVZQU1CNjBJcU53UDQ3Lzc2cDZMaGVsWTEvN3h5ak5Lb1NYZEJCNElTUWdnNlhGRDEvUUhoRUNpMUpRMjl6K1dmRXlzdThSU0c1Tm5hRjA5WHYzVWZ2bEQiLCJtYWMiOiIxYTYzODQ0YzE0ZTY2ZDdjM2I3NjY5ZTcwMWVlMjQxOGVlZWJmMzAwOGJhZTAxMmQwYTFkZDEwYzlhNWMyNDgwIiwidGFnIjoiIn0=', 1, '2026-02-03 06:45:04', '2026-02-03 05:52:26', '2026-02-03 22:39:53'),
(46, 'logout', 'eyJpdiI6Im54US96TjVrbXpRay9OYUlReC9KNkE9PSIsInZhbHVlIjoia2RBek12eUVxUHB4NVA0RGF0YUwydz09IiwibWFjIjoiMWJlNzRlNWIzZWY1M2I4Njc4NGI0N2FkYjZjMTg4MjAzYjZkMjcxZjkwNDI5ZWMxMWE2NjU1YzM0MDY5YTllMCIsInRhZyI6IiJ9', 'eyJpdiI6IjJrbGp1YzgzUVdLcXZvbjhMdDJUakE9PSIsInZhbHVlIjoiQUpYUWdvQWJiOHVkUUk2WEIwa0VnVGtFYStIOHRZTytma3VqOGN2L0huU3pjL2NxMDhPQXQyWkJNbjZ3bjRFRyIsIm1hYyI6ImU4NTM4YzU3YjBjM2QxZDkwOWI3ZjVhZmY4MzhkZmUyZGI2ZjdmYTNiZGJmZmFmODg2MjY3ZGU4ZDY5N2EyZWIiLCJ0YWciOiIifQ==', 'eyJpdiI6Im0yYXNQVUQ3cWdMWUlRRktRTEhxM3c9PSIsInZhbHVlIjoiMldDNU11R0dhSE9MeDM1MlpXT3dadz09IiwibWFjIjoiODBiM2Q3MzE2MmNmMTU4ZjVkN2VlNTA1MWUzODdhMmIwOTgzMjY2M2I5N2YxNTNkNmFlOTUwYTQzMmU1N2Q2YiIsInRhZyI6IiJ9', 'eyJpdiI6IkdxYzR1d1YxMEptR0hDMGxxRU01a1E9PSIsInZhbHVlIjoiQjhjeDd0U2dyWmZxNzZaWFQ4WUZZQT09IiwibWFjIjoiNTU5ZDQzNzc3OTVmMmRhZjI3ZWY4ZmU4MmY2YWRlZjEwMmVlYzZkMWY3NDg2YzhiYzhjYTY3YzM0MDg5ZDQwYSIsInRhZyI6IiJ9', 'eyJpdiI6IkR4dEhtWmJNVnBia0J1empkdStZbUE9PSIsInZhbHVlIjoiekhYODN6M04yRkRkYS8vYkVhVjlvZz09IiwibWFjIjoiNzFiYmYyYzU3NGYwNjY5ODM5OTA4ZTY4MTdiYTQzMzEyY2M2ZTNmZWI4M2VlYWFjNzVmZjM2Y2JlZTYyNmI5MyIsInRhZyI6IiJ9', NULL, NULL, NULL, 'eyJpdiI6IlV5UUt0L2NmM1VieGpUOWJHMm8yVHc9PSIsInZhbHVlIjoiRHhKZ3pMVEx4MjVlNksxRWlrbkxYZz09IiwibWFjIjoiYzFkYjI1ZDZmZTRhMGY2NTVjZTE2Mzc3ZDE5YjE5Y2FhMWExZTk3NmZmY2E4NzM1NDgwODIwZTgyYTE0MDU5NiIsInRhZyI6IiJ9', 'eyJpdiI6IkY5eFcvbmxYRWFhbmxEdkZrN05rNGc9PSIsInZhbHVlIjoiR1Mwd09zck56R2lndVdZb3RHWUNHZz09IiwibWFjIjoiMmZmODc5MWNmNmE2MjNkNGNlODM4MzcwNWMzOGUxM2YxYmM5NTc2ZGE1MDg3NmUzYmMzZTM1ZjVjYTdmOTI0NSIsInRhZyI6IiJ9', 'eyJpdiI6IlM5R3hvOExOSmZWS21VNXdtVjNCRlE9PSIsInZhbHVlIjoic1dLbkpiV3BpNk9ETjU2RHZqTHRXWENSc1Z4NHNKb2t4blU2eDgyd2Zkdz0iLCJtYWMiOiJjY2IwNTM1YjYzYjc5MDhmN2ZjMDBhYWYxZDEwNjhjOThmYmM4MjUwODI2YjlkMTg3MTUzZTViOTNmNzY3NjEwIiwidGFnIjoiIn0=', 'eyJpdiI6IkVFbzVGQjh4NkhMbFJNUysrdm9pWUE9PSIsInZhbHVlIjoiWmpxWUJQUFpSZk9wN05tUFkrTDJGN3FMRGV1MWZxTm5vMUFGdkdmWDVRTWowdkpBSndGeEREWDN5Zk5XWTdiWDBZcGFSOGRPSTQ2Z3R5Z2ZDb2pKWlVCRkNnTWlVT3ByblpGYXozci94TU5oY0pROXlPWncxOHlwNkROZnJxdkpSUUJxMDlSZGNUSjdjL1RkWGl4dGd6NVExTU4xYzJqTjVrTzZ1R1F1bWtOMlRYdVJIZmQrZGVabjJud0ZWTDlxL0k3eXF0a080WUE0UHI0dzUwTGF1WC9RVHo5NllnRGhKZjZGcHdDT29zclJQOGx3Q3NsV2tlcVdWMDBnaXp2d2JNT0g5ajg3N2JUMW81VTBQLzdmNEZGV0gvYmlYMFk5T1ZnNUhMaWJBT3NlbUQyY2Z3cU94dzQreXU5S0xjUXIiLCJtYWMiOiJlMzk4MWYyYzcxMGM2ZmY0YzRmYTU5ODRmNzEyMThhMzgwMjc2ZmUwMzYzZDYzOTNjZjZhNDdiMzU0NzFlMjBmIiwidGFnIjoiIn0=', 0, NULL, '2026-02-03 08:37:48', '2026-02-03 22:39:53'),
(47, 'login', 'eyJpdiI6InZCK1U3WktuWTUyL3FlamlBZ0pBbXc9PSIsInZhbHVlIjoia3NTdHdGVXdVMzJJVHdCL0d3eXhWdz09IiwibWFjIjoiMjg3MDk0MTg3MDRmMzcyNWNlZjg1MjFmYTNkYjk3N2RlZTM3OTc1YTJkMmNjYzEzNWQyOGIzZjg5ZmM4NTdhMCIsInRhZyI6IiJ9', 'eyJpdiI6IlExYWM1d0RKTGNJa3RJbm9tdkIrcEE9PSIsInZhbHVlIjoiU3ZFSmRSNXR4UUtyTGllbHl3aXJwOHhNQ1o2UE12ZGxQd2FnemlOYVNLND0iLCJtYWMiOiJmNzI0YTVmZjJlMTVlMTFlZTA0MzQ1YTBiM2FiYzNhMTI5M2Q4MGJmNzg1MmNmYTM0YTI2YzgyNmZhMTdlZTJiIiwidGFnIjoiIn0=', 'eyJpdiI6IjlLbGRneE55eEtmTHhjaUxTTnMvSFE9PSIsInZhbHVlIjoicTJETGY3eXVBTUtYbGxmeWpzc0JLZz09IiwibWFjIjoiNGJhODg0MTIwMDJkNmMzMDBhYjRhY2IwMzkzMjMxMDAxOGIwN2JkZThhMTVlMWVkYjQ0MjE4MjUxYmI1NmNjZSIsInRhZyI6IiJ9', 'eyJpdiI6IjZNYTFHVnlmVXlxdkNZQkNSV1dNdFE9PSIsInZhbHVlIjoiK09jQm1IaXprbWF6OUdoT093eEtNdz09IiwibWFjIjoiMjFjZjk4MjU5NDIxZTUzNDIzMTQ2YTAxM2QwY2ViYTA4MWNhMTgyZTQ2MmYyOTA5ZjVkN2MyNmVkODkxOTkyNiIsInRhZyI6IiJ9', 'eyJpdiI6Imo1R2prNFB2Y2swOGpFd2tLaGlRVXc9PSIsInZhbHVlIjoiK1ozUGVPalNuTzVvYStQZlVmeEpLZz09IiwibWFjIjoiNWFhNGE0N2E3ZTkxY2I4OWE4NDM3ZDUwNzI0ZjNhODNmOWUzMTcyYmNmMzQ3NzllN2ZjYzU2NTY3NDQ1YWUzYSIsInRhZyI6IiJ9', NULL, NULL, NULL, 'eyJpdiI6InRlMTlDYXpKVmNWYmxqWXNuQTFma2c9PSIsInZhbHVlIjoiQkk1VXlIU1lNY2wxQk9wKzEvM09Xdz09IiwibWFjIjoiYWI4NDk3YTVmNjFmZTQyNmViYzNhMGEyMTE5ZDk3NGE2ZjE3YTViZTdjZDA4MzY0MDVlYjU5MzZjODFkYTZlOSIsInRhZyI6IiJ9', 'eyJpdiI6IjdOVHRRY1E0R053NEo0VjdKZlp5Tmc9PSIsInZhbHVlIjoiZnBjZWw3WC9vUFpTc29GT0FzVzFjQT09IiwibWFjIjoiN2E4YzJjZmU5NWQ4OWM1NjA4YjVjZTg0ZWQ1MjE1MDVkMTA1YTc1YjAwOGNhM2NhZDk1MzllYTdkZTc2YmJmMCIsInRhZyI6IiJ9', 'eyJpdiI6Im5ZK3JOMkxGcEJ5K2tkR2FNdERoU0E9PSIsInZhbHVlIjoiZlIvbis0OVYybGNXUWtQaWR5M3RWSmlFWlc1U1JDSG5jSFNzTCs3b2NBcz0iLCJtYWMiOiJkMzY4MDc1YzIzMTgzOTJjNWRlMGQwZGUwZTRmYjM2N2FhYjBkYTVlMTQ3ODc3NmViNTZkMGE4NTc2ZmU1ZmVkIiwidGFnIjoiIn0=', 'eyJpdiI6IjVZRW5CQk1XczNBSlZadlBDQjVKUGc9PSIsInZhbHVlIjoiaTFlQjZLR3JkWlhPVlB5R0VTWmhzb3NpSkxZQjF5c1lDd3Rmd2hBSXhDZFlUVDFkR2FQaDRQQ1F1TElXcU50SSt3aXdwbFRMQW9MRFlhanN3ekFQSDRhRjA3RFFEekpkRlZUbG51T0NiR25rT1JUS2dJZlM0M1RIaitDSDRsK2NybFBCWnpQeWVjSi9DYkU1cnhtaVVqb2c2NVFpRWFBYkM5TWpjemFiK3F6eUhIU3ErUUowSUl3QzlNSTRxN0JObERGSytjOTNTMWwwWUZvU0E3N08xUUFvZmdITmNhVG1ETGQvUjFsR0JRUXJUWGNaWmpFeVZPdlJtc2J3RXM2bithMVQzQzVjK0szcWp6N0JCY0kxRHJLNkwrSHVCb3Y3RG5FRmZESTRrckZEVlFZTjZJN1NvdWtTV3ppVmhSQ00iLCJtYWMiOiI1MTQ4Yzg0MzEzYTZhNDkxOTIwODk5YTA5NGI1ZTRhNWZjOGE4MDM5NjVjZmQ3NDVjOTFiOThlYTYxOTdjODA4IiwidGFnIjoiIn0=', 0, NULL, '2026-02-03 08:48:50', '2026-02-03 22:39:53'),
(48, 'create', 'eyJpdiI6ImNOSUkwenBid2RxcXA4cVdFRTZka3c9PSIsInZhbHVlIjoiYkExRE9TL0ovNS9RV0d4OW4rZDlsUGdDcVU5dUlJRjZCbkcrbGJPbzRrZz0iLCJtYWMiOiJiYzI4OTczYTBmOWUyMmI0ZDhiMTRkZWEyMGE5ZDkzZGEzZWJlZjI3OTZiODg4N2JlYzcwMTc2ZjhiODE0NmI0IiwidGFnIjoiIn0=', 'eyJpdiI6Ikw0dGM5M2NRNVQ5TWpxdmt4U1BGOUE9PSIsInZhbHVlIjoiWUpXSFBOUk0rYk15Rk1DM0FZRHhLZkErR3VZNW5ZWGVEZmIxZVRqemFUY3JLeWV0aHZaWkRmRWs1NnZ5dWJIOSIsIm1hYyI6ImFkYWY4NWFkNGJjMjRlNDc1MGIxMDlkYzkzNzdjOGJjMzBjMjA3ZDQzNzBiZjE5NGZmYTZlM2YzZDMyYjhhYTciLCJ0YWciOiIifQ==', 'eyJpdiI6ImxJaTZyRS9NR0ttSmdna3ZLR0Yya2c9PSIsInZhbHVlIjoiTkhUWUlpaTlsUTFFSHNodHdUMHBsdkw1bks3UDZVZTFyYkJ5dWRNa0hBaz0iLCJtYWMiOiIzMDc1M2RmNTRkMTQ4ZGE1ZmI0MGU2MjRlMWNmMGMxNzRjMDEyYTc4ZjI4MjYyNDdmNjlkN2FmNzY1ZTk1ZDIzIiwidGFnIjoiIn0=', 'eyJpdiI6Ikh2enUzVmRwMVhXZDBGSE9vZXZNOWc9PSIsInZhbHVlIjoiN2RJM1ZLOGwzRkJKWmdpZWtNY1FPZz09IiwibWFjIjoiYjQ2NGVlYmNhMGQ2ZjljNjhlNDlkMzFjNDMxZjYzOWY0NmFjMzczMzA2MjI1ZjMyNzBmNGZlMmEyMjQ5YTFjYSIsInRhZyI6IiJ9', 'eyJpdiI6Im91eVRybmNqdW4zakpUYm9uYjVmT0E9PSIsInZhbHVlIjoiaWcvMEdmYzFKNndhQ01zd1RhVmkrdz09IiwibWFjIjoiODk3MDE3YjlkZmQxZDFjYzc4ZTE2ZGY1YzZhOWVlNDk0ZmE0MWQyNzQzOGUyZGEwMDg1Njk3NGFjYzQ1YTMzZCIsInRhZyI6IiJ9', NULL, 'eyJpdiI6Ik9FRi81Z2gyRTdQRTZla0Z5MXVKWlE9PSIsInZhbHVlIjoiSkZIbkFMZ3NWL2M2OEJvd2g3andTRkRPazFJYkp6QjBhWndaVm5HNTIzZz0iLCJtYWMiOiI4OTNiNjI4YjhhZGFlMGJmNjU3NjRiMDlmZWZhOGIxMDhmOWIzYjA1YzJhOGVmZjk4Zjc0OThiZDAwOTliNTdjIiwidGFnIjoiIn0=', NULL, 'eyJpdiI6IlZYUnl0SkFIRmg0SE1MeC9Zd0V2Rnc9PSIsInZhbHVlIjoiQTR4UGJqVC9wS0tFWjUzRGhlYklLUT09IiwibWFjIjoiMGYxNzJlYzAzNTZlMDBmNWQ4MTU3NDdiMmE0MTMxMTUzZDVkMmZmMTVmMDc2YTBjYjQ2YjcxZjEzMzMyN2E3YyIsInRhZyI6IiJ9', 'eyJpdiI6IjNJajJuREF1d1lJZ2VVM2NUTklHQ3c9PSIsInZhbHVlIjoiK1R0OXFtODR6OFVVMjE5UTQxbklMQT09IiwibWFjIjoiMjI5NGQxYWZjZmJkM2I4ZmMxMDY3ZWRjYTViNzI0Y2E3MjRlMzJkOGViNWVlNzFlZGZhNzVhZDQxNTUzYTJjOCIsInRhZyI6IiJ9', NULL, 'eyJpdiI6IkZqYjJyOVh5NURXR1BSRVE2clExbWc9PSIsInZhbHVlIjoiVlcvTityK2xXcGptajdHZVJrL052ZTlDMEVJbGFEL21wOVhiU3d0VDF5NHRIUTQxcHQ4VzZPL3RuemtnbUhkNE9JT0d3SzFKNk4xQUU0VjQ1RWdJandQZzFKNzk3bjhHam9HSzgxYVJoS3JGQmJlbzRINjZVaDBqTWJyKzg0QjJhTFN4NnR1eG1tQXQ0UmM1NVFYQ1QrTlNyWVYyTjZWT2xuYXdYZFp6K2lrT245OU5rVktSZWs5aVJwaElKaCsyIiwibWFjIjoiMTc0NGU1NzY3ZWZiNzcxZjk5ZTQ4MjcwYzExN2ViNjJkNzJlOGNkYzBjMjA1M2JmOWE0NmY1ZjcxY2Q2MjA0OSIsInRhZyI6IiJ9', 0, NULL, '2026-02-03 09:42:15', '2026-02-03 22:39:53'),
(49, 'login', 'eyJpdiI6ImdOV3dpNmt1T2Zxa0hZREhZZ3AzNnc9PSIsInZhbHVlIjoiRHNFYlAvWmtHa3BVOHdQL3ZIazVoQT09IiwibWFjIjoiM2YwOThhYzUwMzY0MjFjNGIyMzM4ZTJiOGMxNzFkZTFlNDU0NDk5OWE1ODJiN2ZiNTVlMGU1NmQ3NzFkYTAyMyIsInRhZyI6IiJ9', 'eyJpdiI6ImtFVE9EUEpyVWVweDRjNVhESmFJUFE9PSIsInZhbHVlIjoiTFo2VHJndkZ3dGlGQllXMDF2NGcwOURDSzdVUGdaZnFQcmJXZXBWN0dzND0iLCJtYWMiOiI4N2M5OWQ1Mzc2ZTkxOTA2NzMzZWI0MDc1ODc5OGFhN2ZlYjRlMjRmNGFhNDllMGE1YjUyODVhZDM1OTliYTVhIiwidGFnIjoiIn0=', 'eyJpdiI6IlpwS2hnbEQzMzdCQ2tCa3pQOVNaS3c9PSIsInZhbHVlIjoiTDBaQmVLVVdlR241Y01BSER6UnNDZz09IiwibWFjIjoiOWFiZTE4NDFkNzQyZjZjMTcyNTAyMGU1YjdhYjQyOTliMjNiY2VlN2JiMTQ0NDRhYTVhMTJlNzBkNmJmMjljYiIsInRhZyI6IiJ9', 'eyJpdiI6Ild3UnV2Z3h5UThZbmxRTHFqOHlCbEE9PSIsInZhbHVlIjoiYmVFSmgrVkx4U1h0SFgrcVBjY2g5UT09IiwibWFjIjoiZTA1MzJiNjg1YmRiN2FhYTI5YTI0MzBkZjQ2NjVjMWE2NDc5NDZmNTYxYmU5YjE4ZjM5OGRmNjEyYTI0MDcwMCIsInRhZyI6IiJ9', 'eyJpdiI6ImtpSzhBWDcwbnJkeW9DeUN5Y3JYVVE9PSIsInZhbHVlIjoiTVUvVUtoNmdMTmlENlNMOTYzRSsvZz09IiwibWFjIjoiNGQ5ZTNlYTBmZmIwZTk4ZTY1NjZhNDAwOGVkZmQ2MDgwMDcxMmE1Njg5MGRhMDI5NmI5OWRmNzUzYTU0ZjM3YSIsInRhZyI6IiJ9', NULL, NULL, NULL, 'eyJpdiI6IjQ5d0pUdFZpMzc1aXpZdzZyR0sxNEE9PSIsInZhbHVlIjoiWnVOdlBVRWY2M2RYUXdFd0lvNHhpQT09IiwibWFjIjoiMWE0MTc0ODNlZjYwYzQ0MjA2MDc1ZWIwYmVmNDBiMDhhM2JjMTkzZDdmMDkzNWJjZmU2NjkyMmE3MjJhNjc2NiIsInRhZyI6IiJ9', 'eyJpdiI6InZIRkJqOHhQS2ovYlZNeG1nRjFqZkE9PSIsInZhbHVlIjoiRTBrU29QMmc2K09kL1Y3NlAzYndiUT09IiwibWFjIjoiZDZmNzBhNWY5OTQ3MmJjZWUxNjMwMDNlYjUwNGJmN2RlZDQ4NzFiMDE5YWUyMGIxYWJhYTlkMTlmOTMzYTg0MiIsInRhZyI6IiJ9', 'eyJpdiI6IlUrK3hWMkplMC9nQkgrZ0JwR0N2M1E9PSIsInZhbHVlIjoidDZtVytjTVdzcklVd0wyMVU0MDVLcTRaNUVTUWNlU1g2OUNNK1ZKNDRhdz0iLCJtYWMiOiI2ODg2NTJiY2RmNWU1YWZkYWYyZmFhM2I3MTU5NmIxMmI2NTc0YmM3NThhMDE3YWJmZWFmZTRmMWQwODNiMmZlIiwidGFnIjoiIn0=', 'eyJpdiI6IlNOVkplSm9rQjBtaUxzSTFrMTBoNHc9PSIsInZhbHVlIjoiMWJSWlIzbHU5Z21IT2NaNU41OHMwaGptekJ2YVMrZmJsR3FPUEZXbmdiL0RxSW1mNnB0QkswbGg4WTJPU3BodVB4b1BVeVRWZFdLaEpkd1dTSk85UVpnbnR5T2xZQVJSQ1pJeFlUYldCNm02NEVQbzRPUWxVYVlIbExPbHNaaTNsTnQyZEFYU3lmNThxY0JGaFJRQlN0bVpSbldjc3B0b3FqMXIwOHJkSmJ2L0ZLWFVQcDdOQTc5WUZaM3VXVFQyL29vUzh5SXNjakRYUTc5a2FMY0ZzYmlRQ09EdFFmNlY5Qk13Wk10bGN3TU14NDBWT25VV1ZkWHhoVE1XVWoyNkNzaUFUR29vZDMxZm01ZWxIaDZjZmhacTU3eFhYVmJiaEgrQ2d0WXdxaHFNRTlzOVoxcUd6clpSQ05KZ2M3V0giLCJtYWMiOiIyODk5ZjkyYzAxMjc2YmJlODU1NzgwNGUwMTc2ZDMwOTA2NzRkN2U5NGViNDY3ZjIwOWZmYzliYmJjY2RmYzVmIiwidGFnIjoiIn0=', 0, NULL, '2026-02-03 09:42:24', '2026-02-03 22:39:53'),
(50, 'logout', 'eyJpdiI6ImQvREdzQ3VJb0prMG5Hekt6dmZuSVE9PSIsInZhbHVlIjoiTTRUY0t1S3RXaWwzR2pQSis1MmxRdz09IiwibWFjIjoiODE2MWJhMDg1MDU2NGVkNDM2ZDIyMzEwNzgwMzg2OWNjYjM0YjNlYjU2YjBjY2E3MzMwZTQxMWVlMGU5YzUwMCIsInRhZyI6IiJ9', 'eyJpdiI6IkJMT2gwY0RTWVA1VDJlQUhuK0hVK1E9PSIsInZhbHVlIjoiNUJTeVNRdDlGdUNqWXpuKzgzMUUxam01N3pleE1uZVlKYVdWU2RmeGpNVi8vN3FKaE44VUpFNGFQcUVSejNOSCIsIm1hYyI6IjI0NjE3ZTU2N2YxNTU2NTY3ZmM4ZDA3MDVmYWQwMGNkNDM2OWEzNzk5ODA3NWMwZjUyNTNmNWE4Mjg1ZGY5ZGUiLCJ0YWciOiIifQ==', 'eyJpdiI6IlhYSmxSM2ExUFpxYnBXSTVuTzdIRkE9PSIsInZhbHVlIjoiZHBZVmdSS0Jjbk5QM2JBZHZsTkRtUT09IiwibWFjIjoiOTUzOTFhN2YxNjc1NTVjZTEwOGNlYmE3YWE1MzhkMzk5ZjBlZGMzZjVmYmY3ZGMxNjY2MjQ0MmY1YzcxZmFjNiIsInRhZyI6IiJ9', 'eyJpdiI6IlFMc3hlYXZSdERuellWWUhwbTZhdUE9PSIsInZhbHVlIjoic3U2TnJLR21ZNlIrQXQ5VTZYUWR5dz09IiwibWFjIjoiMjVkYzE4Y2JlM2M5NjcyYzNkZDgzYWE2ODM5ZjNhNmJhZTZiMjRkYzI1MWE0YTg5NjQ5MmZkNjBlNTc5ZmQzMCIsInRhZyI6IiJ9', 'eyJpdiI6IjVEYmdYcnZEcWloQzBZWkFLWk1GdXc9PSIsInZhbHVlIjoiRk9OWExsQ0dOb2NVMFY3enh3RjV0dz09IiwibWFjIjoiZDVlNmE0YzVjMzlkYjI5NDY5ODJiZmVlNzZlNDdhNjkxY2IwNTY2ZGZhNWU4NGNmOTc4N2EyMDIxOTc2ZGRlYSIsInRhZyI6IiJ9', NULL, NULL, NULL, 'eyJpdiI6IjlvSmFiNzd2VGFLcHdoakhsdHFyWHc9PSIsInZhbHVlIjoidkk0TGl1UDhTYTU1Yk5ObXdMZGJUUT09IiwibWFjIjoiNTljYTAxMzU1ZDFiNzQyMWYwNDRmNjljYTdlZWY5ZTdhZTU1MTNlNTZhY2ZiY2JkNzUwM2MyYWFmN2U2OTc1OSIsInRhZyI6IiJ9', 'eyJpdiI6ImhGeGtQOWE3RjdDemlOcmNQMmVmV3c9PSIsInZhbHVlIjoianF2WjNFMGo4a01QMjhibkNJR2VtUT09IiwibWFjIjoiYTAzY2U2MzYxOWQ1OWI2NzU4MDFmYTVlNjkyYjI0OGVjYjBjMTgzN2MzMDQ3NzA4MzEwMjgyN2FkN2Q0NzVjOCIsInRhZyI6IiJ9', 'eyJpdiI6InZERTdRK20weG85ZWZvTmUyR3ZJcXc9PSIsInZhbHVlIjoiTXcrZ0Y3RTRCV3FQZlFvTnc0ZE45d1JRU0lvNUtQOUlDUHNyTDVnYUdyVT0iLCJtYWMiOiJlMzY4ODRjYWVkMDA4NGU3OGIxOTIwYzdhZjdjZjQ4MWUwZDRjYTFhYTJjNGQyMTcyZDQ4ODFlZjc5OTdiYTkyIiwidGFnIjoiIn0=', '\"eyJpdiI6IllrNFJJMFpmSVNKQmhuMEJFVW5TOGc9PSIsInZhbHVlIjoicFZhckpPNGdQY2ZDNnJIb2JlWVRmOFRraXdoYWxhRjRzRXQ1SnJUbkl1MnYxdGMvUkU2MjFrZjNrOCt5QWxXMkkrNjN4cjFaZmp2dVJHbUsyQWNPOEFkd2hCV2tZSGxXdWhPcExOYzVCUWxwZWJmOWo4MDlGSXhZVkh1T3lVR1RJOWtKN3NDR05tRTdNaGVpREo1Q0RiNlRPWkYzclR3SEFNVTNISHAwSjZkT0xNMHY5ek9hTFV6WWhHWHNqdVhiTFZhU0loZjNMbUg3RDJ0Q2kzYmVrd3NtZXA0THZZUDArd3BtM1RrRmNBeEtBaklsZ0txU2NBV05CQURWS0p5ZmY3SUNpUUM5bzZMaTc1QWNjNWxxQTR5UVp5Q2dBSnZoZWFheVpXTVpnM2JIQTcwWnEvV1JYamx2ZnQxTVpHMm8iLCJtYWMiOiIxMTZjZTE2Yzg5NTc0ZGQyYmZjYmRjOTRkNDQyM2E4Zjk4NDZiZTQ1YzE3NTQ1YzZiODZjZWQyMzlkMzkzMjE5IiwidGFnIjoiIn0=\"', 0, NULL, '2026-02-03 22:33:22', '2026-02-03 22:39:53'),
(51, 'login', 'eyJpdiI6IjdRYUlHU0QwMjRKMVlUT2ZhSi9XMmc9PSIsInZhbHVlIjoiZ1U3NmlQVjg3UWlnQ1dLZFp2cFdMQT09IiwibWFjIjoiMDA1MzcyYWJlMmI0MjQ1NjM5NWI5MTQxYWVmOTMwNDIzYWMyMGYxNDFhMWY2ZjY1OTY5ZGE3NmNjMzYyZTJhZSIsInRhZyI6IiJ9', 'eyJpdiI6IjVndnpxZFhmR3Jaa3R0N2JUUkw3cEE9PSIsInZhbHVlIjoieU1XVTdCRG9ObWVlOU13b2g2MEVtdjlZVHgzbGVGUVBHeENTMnVCVkVxND0iLCJtYWMiOiJhMTM0YzkwYzIzYzM0M2VmYjFiMTUxNjUwNjYyMWY2Y2U4ZWNmNjc4NzY3YWM0NDM1NTIwNmQ3OTc2N2ZlZWY5IiwidGFnIjoiIn0=', 'eyJpdiI6IndQOWZsSUpwWlFKc2JRUjd4b04xdnc9PSIsInZhbHVlIjoiZlBIeUgzSVN1bmdXeERXNUR2TUtpUT09IiwibWFjIjoiZjVkMDAzZWQzNGVkMWQwOGJlY2ExOWY5OTc1NTNjN2M5NWRkOTg4MmQ2NzcyM2U5ODU3ZmE3NGZmNDMxYmUyYSIsInRhZyI6IiJ9', 'eyJpdiI6InVVVUM2MmpvUmhmNG1xMWR1UndjeVE9PSIsInZhbHVlIjoiUXY1dERudlNMYVBiRnBValRGSmZ4Zz09IiwibWFjIjoiNGM0YTUwZmVkNzUyNGRmYTQyYTJjYTlmNmYzMjQ3ZGU5ZTM4ZjViMDVhMWU1OTI0NWZhY2Q5NWYyYjYyZmI5MiIsInRhZyI6IiJ9', 'eyJpdiI6IkpXSWh3MVE4WCsrYlFzb1Z1cTQ0SWc9PSIsInZhbHVlIjoiR1R1MjllcWN0eUN1OE5GNWErSGF5dz09IiwibWFjIjoiMGE1Y2EyNTg4ZTA1ZmNjZTY1NzVhZDc0MTEzMTg4N2E0YTNmZTBkODlmOWE5YWJlODZkZmFmYTE5ZjI4OTJmNyIsInRhZyI6IiJ9', NULL, NULL, NULL, 'eyJpdiI6IjVSZk5WazVtcVBoNXpjeU9QcGx0V1E9PSIsInZhbHVlIjoiQzR4b1RnWEN2Y1BPNlFLYlQrSlVFUT09IiwibWFjIjoiYTllMjIyMWI0NTU4ZWJiMWQxM2Q5ZDA5OWNhNzMyZThiODE2OTcyMjYwYTZiZDkyNDI4ZjJjNGE3ZmVjNDE5NSIsInRhZyI6IiJ9', 'eyJpdiI6IjFITEZvbzBVSnYvOUVHbFA1M1ladHc9PSIsInZhbHVlIjoiZjQzMFFMRmtYZUEyVnR2NkYyemFGUT09IiwibWFjIjoiZThmMjk2MjQyMTVhYmY5MGI3NmFjN2RiOTEzNzkzZGY5ZjdlYzkwNjRiYWI5NmQ3MGE3NjQ5NGYwODhhOTExMCIsInRhZyI6IiJ9', 'eyJpdiI6ImlMUVAxK3BmRkdqSnNlU2J6bVJlM0E9PSIsInZhbHVlIjoiSFhCbERYektYWE1pNTBCZHBpenBmdzRWM2Y4Y3U1UHNveDh0TE40TGRIND0iLCJtYWMiOiI4ZjAyZWZhOGY5NjQxMDM4Njc1ZDQ4ZWNiMTdkMjk0YTA0NDFjNTg0YmIzZWE2NmFkZTllNjU0ZjI1NWEyNTNiIiwidGFnIjoiIn0=', '\"eyJpdiI6IjZkVGxNNngzVVdrN25pRGxWdWRHakE9PSIsInZhbHVlIjoieDRSRkhEMGxpZDdYVnR3SXhzRU8xb2FuYkJ2M3FxM1pWSGZYR3VoTmJWcFE4MU4yVWVFZlpoM202QlN4SEpaNnZSSnNuZGUwOVBSTFJYd1hIRXUra21Qc2lPZklGVUZvQVl0andhbFNiTUVValZYN2pKaG5reU9mNzJCMWU5Ulc3NjJXTHNYWlFqdE9uUjlzaENUQnljTHg5c0JJeVZGTnBrb2E0cnNxYlRUMC9EOXJrN2NTTjR3N1BBdkszcGZnNzh6NllzTGhlVWw0S2NyZXl4dk1uUzFvNVFvS0ptMUV4RE8yZUdNRnVVYjQrNlFsK1A5VkljU2w4ajdBNDdKNXZyQi9MNnp5eXg2cmt1OUJrcmtXeFkxTUlWM0Z5ZHVETDNoMUt0RHNJQ2lNc0hhQnVYVWVTSnZPbE5SZFR1WVIiLCJtYWMiOiJlM2NiNjMwZTk3MTEyNmJjNjJiOTYyNjFmNWViODljMGE0ZTBhZjA5MDJhYzcyZDJhYjliY2RmN2UwZTUyYjhmIiwidGFnIjoiIn0=\"', 0, NULL, '2026-02-03 22:33:46', '2026-02-03 22:39:53');

-- --------------------------------------------------------

--
-- Table structure for table `prd_4x7m`
--

CREATE TABLE `prd_4x7m` (
  `k7_id` bigint(20) UNSIGNED NOT NULL,
  `qwe_nm` longtext DEFAULT NULL,
  `rty_ct` longtext DEFAULT NULL,
  `uio_im` longtext DEFAULT NULL,
  `asd_ds` longtext DEFAULT NULL,
  `fgh_st` int(11) NOT NULL DEFAULT 0,
  `jkl_sd` int(11) NOT NULL DEFAULT 0,
  `zxc_rt` int(11) NOT NULL DEFAULT 0,
  `vbn_ar` decimal(2,1) NOT NULL DEFAULT 0.0,
  `nmq_ia` tinyint(1) NOT NULL DEFAULT 1,
  `wer_ca` timestamp NULL DEFAULT NULL,
  `sdf_ua` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `prd_4x7m`
--

INSERT INTO `prd_4x7m` (`k7_id`, `qwe_nm`, `rty_ct`, `uio_im`, `asd_ds`, `fgh_st`, `jkl_sd`, `zxc_rt`, `vbn_ar`, `nmq_ia`, `wer_ca`, `sdf_ua`) VALUES
(1, 'eyJpdiI6IlRITjkxOHlhcHV0SlgxcFJLMHViQWc9PSIsInZhbHVlIjoidjduTXhHcXdCYTdURXc5YTB5QkU5Z3psMjQxbE9OTnFuVGJxN2xpR2dnVT0iLCJtYWMiOiIwZDFjNjY2NmZmYWI0OTk4OTY5MGUyMjAwMjM3YTY1MmQ3YmY2ZDM4ZTJlODc3MTVhODI4ZjgyYWExNTY0M2Y5IiwidGFnIjoiIn0=', 'eyJpdiI6IkZFYUNSWnB1Z2RxVHBkaktYSWhaU0E9PSIsInZhbHVlIjoiYjViZVZqNVdlNTJXZG1jaFIyVGwwQT09IiwibWFjIjoiNDU5MTQyYzA4OWViMGU4NGNhMGY5MjBhNmEzODFhODYyOGRjMTY5MmFhYjY3NDVmZTI0M2Q4NzdlZDcwZGExNyIsInRhZyI6IiJ9', 'eyJpdiI6IkVSZjlER0NVbjN5Slpya1lsMUtCZ1E9PSIsInZhbHVlIjoiKzJrRGp2SGpDbG9TME1DYlNDZTZKR3dKUWo4RmdhV05idmJDZk9nd3JMR1FKaXBnSUloR2ZKdmhIRWN2L21uSCIsIm1hYyI6IjNmYmUxNzk0ZTlmOTZhNjUwNGU3YzI2NzhlZDBmY2JiMDUwMzVjNTc5ZWVlYWE5ZGY3MTVhOTY1NWRhMWQ2OTUiLCJ0YWciOiIifQ==', 'eyJpdiI6InNRL3ZlK2tsUVI5RzNTWlIyU2hqT2c9PSIsInZhbHVlIjoiNjJyNi83WVprTG5HRTg3VGQ0VzlxNHZSaE5oSmQxcW5VdHRqMktDMTg5ckVscUdjZnJiZ2FOdEppUGkxK1BtWlc5TFowTG44ZlhqbUsxbDZVWVgwTHc9PSIsIm1hYyI6ImMyYWExYzdkZDRhOGMzYTIzNjMxMzY3ZDcxY2I1MzJiZjJlN2FiOWEzYmI4ZGFiYjVkYTUwMzQ4MmQ4YjNjYWEiLCJ0YWciOiIifQ==', 3901, 377, 192, '4.6', 1, '2025-06-12 23:06:47', '2025-06-12 23:06:47'),
(2, 'eyJpdiI6ImxkTlk2c3ZHck1JbndVNjZWOFVLamc9PSIsInZhbHVlIjoiUVh6K21Nd3VucDVtRE1ORDB2QlE4UT09IiwibWFjIjoiOThjZjJjMzdlYjYwYTk1MDJkNWRiZTk2ODVlZWUxZDA3MGMxNTdlOGYxMTQxYTViMjZmOTA5ZmE4ODgzYmNlYyIsInRhZyI6IiJ9', 'eyJpdiI6Ildha0VqWFVvMUVuWnlSWnh1ZTRkMmc9PSIsInZhbHVlIjoiNUZPWmc4MW1wLzloZ2piNXhMLzVVZz09IiwibWFjIjoiZTUzMWU4MGVlODlmMTA5MmIyMjU4ODE3ZTc4YTE4OWU3MGFkYmE0MWE5MDI0Njc1Yzg3OTY1Y2NjODhlNmJkMCIsInRhZyI6IiJ9', 'eyJpdiI6ImZCS1VrSlJ3QmVKR2w1WVExdzdhZkE9PSIsInZhbHVlIjoiUWNvSzJhVEVRaHRqdmVqTmI3MVp0a202Z0t6NnAyWW53cjZrbzhZRnFITnBJK09MNFpiWitBUCtTM0MxWUhXdCIsIm1hYyI6ImQ5ZmVjNGU4MTc0YjkwMzA3MWFkMmM4MDllYjM5MDdhOWE0YjM5OGYxZjY0Y2VhOWQ3MjIxNDk5MWQyZTJjODYiLCJ0YWciOiIifQ==', 'eyJpdiI6InpwbFRvMmlQOVJtUW1Cb1FPSWtmU2c9PSIsInZhbHVlIjoiVTVtVzNkSjdMSDcwWXRiek85eFhWNWZQalVUc0MzSW9raTJLTGxwYkFHUzFxSkFrOEVIbVZad1RHMVZIWXhHRVcrdGVUaTFNWlh0bmN3U2JwTkR1S0E9PSIsIm1hYyI6IjY0ZTZkODdhOWU5OTgxN2FiNzVmYmZmNGIyYTBhYjUwMjViZDgyMzkyMTJmOWM4ZTM3ZTU2ZGYzMGJkZGMwOTYiLCJ0YWciOiIifQ==', 3006, 3100, 1600, '4.8', 1, '2025-06-12 23:06:47', '2025-06-12 23:06:47'),
(3, 'eyJpdiI6ImJ6ZmVxRnZEVmtDbGtSMy9PUGYzakE9PSIsInZhbHVlIjoiMDJGa1FjNXNNbzVNK3MvRTNGc0pCRzBlL0tsYUcrRUltL1B5MEtDd2RLST0iLCJtYWMiOiJmNzkzZWQ2NWJmYmYwZmFmZWFjMWYzZTA5NTcxMzY3YzIwOWJiZmIzOWU3NzM3MzU2YjViMzdhODcyNDNjY2NiIiwidGFnIjoiIn0=', 'eyJpdiI6InAyUmI5bUtNRlBFbTZJUjAwQVZxV2c9PSIsInZhbHVlIjoiTkFXQ3hqeTlWS1Rqc2VQeEpvdjFrZz09IiwibWFjIjoiMWQ3NDM4ZDM0YjU5ZDVmNTU1Nzg3ZTFhNGMwYTkwMWY0MjU4MDlhNTEyNjQzYzk0MDgxYjk0MGZmNzFiZjRkMSIsInRhZyI6IiJ9', 'eyJpdiI6Iit2MTNkR3dZMllLd09UMjdVQzh3UkE9PSIsInZhbHVlIjoiVFlFTlh2VExpVEdnTjVPRzRQYURlR2dkWlRlaFlyemhvUndMcXh3U3YzK05jVlZyVVRSRDM5OUF1NVhqU3ZTcCIsIm1hYyI6IjM4NmYxODhiOTMzNTQ1MTk3ZGQwMmVlZGE5ZTY0MTE3NWFlMDkzMWJiYWExMWUyODc5NDUxNmVhOWIzZTU5NDQiLCJ0YWciOiIifQ==', 'eyJpdiI6InUwdXhORDZPOHdncmJ0bHNsQjQyNFE9PSIsInZhbHVlIjoiazFxbjRLVm5nSEF2b2ZMNkN4RTIvZkxxdFgzOHR2VWRoWWdESDhKNis5NWc2THVQT2lJd1l5T0RicE5pdTViTm5FVzhzdUxmOVQwMitvWHVSd09GdkE9PSIsIm1hYyI6ImNhYzQxODJhNzVmZjAyNGRiMjk3NjVhMTJmNjJiOWFmZDZhNWE3ZGQzMjFmOWQ0NWFjMjdjM2I3NTRhZTNjMjUiLCJ0YWciOiIifQ==', 90, 0, 0, '0.0', 1, '2025-06-12 23:06:47', '2025-06-12 23:06:47');

-- --------------------------------------------------------

--
-- Table structure for table `predefined_messages`
--

CREATE TABLE `predefined_messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category` varchar(255) DEFAULT NULL,
  `question` varchar(255) NOT NULL,
  `answer` text NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `display_order` int(11) NOT NULL DEFAULT 0,
  `show_in_faq` tinyint(1) NOT NULL DEFAULT 0,
  `show_in_chat` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qwe_9k2p`
--

CREATE TABLE `qwe_9k2p` (
  `k6_id` varchar(255) NOT NULL,
  `tyu_uid` bigint(20) UNSIGNED DEFAULT NULL,
  `rty_ip` varchar(45) DEFAULT NULL,
  `wsx_ua` text DEFAULT NULL,
  `vbn_pl` longtext NOT NULL,
  `qwe_la` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `qwe_9k2p`
--

INSERT INTO `qwe_9k2p` (`k6_id`, `tyu_uid`, `rty_ip`, `wsx_ua`, `vbn_pl`, `qwe_la`) VALUES
('skZGAf5cQzs2vUgFzkBNW9eHVolSX4Sbl1luuKNH', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il9mbGFzaCI7YToyOntzOjM6Im5ldyI7YTowOnt9czozOiJvbGQiO2E6MDp7fX1zOjY6Il90b2tlbiI7czo0MDoidVZ4NWlVQjY3RHJ4RjRlbVMwRElMdHdZWUF3aVV2WEVQUzJtUUpKZiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hZG1pbi9kb2N1bWVudGF0aW9uL2NoYXQtc3lzdGVtIjt9czo1MjoibG9naW5fYWRtaW5fNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO3M6MjI6IlBIUERFQlVHQkFSX1NUQUNLX0RBVEEiO2E6MDp7fX0=', 1770188682);

-- --------------------------------------------------------

--
-- Table structure for table `rst_7x9m`
--

CREATE TABLE `rst_7x9m` (
  `qwe_em` varchar(255) NOT NULL,
  `asd_tk` varchar(255) NOT NULL,
  `zxc_ca` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE `sections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(25) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `content` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `button_text` varchar(255) DEFAULT NULL,
  `button_link` varchar(255) DEFAULT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT 1,
  `layout` int(11) NOT NULL DEFAULT 1,
  `show_order` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sections`
--

INSERT INTO `sections` (`id`, `name`, `title`, `description`, `content`, `image`, `button_text`, `button_link`, `is_active`, `layout`, `show_order`, `created_at`, `updated_at`) VALUES
(1, 'about', 'Redefining Performance', 'Lebih dari Sekadar Sparepart, Ini Tentang Pengalaman Berkendara', 'Di Boy Project, kami menghadirkan produk terbaik untuk meningkatkan performa dan estetika motor Anda. Setiap sparepart yang kami sediakan dipilih dengan cermat untuk memberikan kualitas, ketahanan, dan kenyamanan terbaik bagi para rider.', 'landing/images/startup-bg.jpg', NULL, NULL, 1, 2, 2, '2025-03-20 04:21:56', '2025-06-16 10:59:27'),
(2, 'contact', 'Contact Us', '- Stay in Touch -', NULL, NULL, NULL, NULL, 1, 1, 8, '2025-03-20 04:21:56', '2025-03-20 04:21:56'),
(3, 'counter', 'Our Achievements', 'We have achieved great milestones over the years.', NULL, NULL, NULL, NULL, 1, 1, 6, '2025-03-20 04:21:56', '2025-03-20 04:21:56'),
(4, 'portofolio', 'Our Work', 'Explore our best projects in various categories.', NULL, NULL, NULL, NULL, 1, 1, 7, '2025-03-20 04:21:56', '2025-03-20 04:21:56'),
(5, 'pricing', 'Our Pricing', '- Choose Your Plan -', NULL, NULL, NULL, NULL, 1, 1, 10, '2025-03-20 04:23:12', '2025-03-20 04:23:12'),
(6, 'services', 'Apa yang Kami Tawarkan', '- Enhancing Your Performance -', NULL, NULL, NULL, NULL, 1, 1, 4, '2025-03-20 04:24:18', '2025-03-20 04:24:18'),
(7, 'promotion', 'NEW PRODUCTS', 'get promotion info', NULL, NULL, NULL, NULL, 1, 2, 5, '2025-03-20 04:25:06', '2025-03-20 04:25:06'),
(8, 'testimonials', 'Testimonials', '- Happy Clients -', NULL, NULL, NULL, NULL, 1, 1, 9, '2025-03-20 04:25:39', '2025-03-20 04:25:39'),
(9, 'home', 'Welcome to Boys Project', 'Jual beli sparepart motor & pemasangan terpercaya', NULL, NULL, NULL, NULL, 1, 1, 1, '2025-03-20 04:37:27', '2025-06-02 23:15:56'),
(10, 'tiktok', 'Our TikTok Content', 'Latest updates from TikTok', NULL, NULL, NULL, NULL, 1, 1, 12, '2025-03-20 05:02:27', '2025-03-20 05:02:27'),
(11, 'instagram', 'Our Instagram Posts', 'Latest updates from Instagram', NULL, NULL, NULL, NULL, 1, 1, 13, '2025-03-20 05:03:17', '2025-03-20 05:03:17'),
(12, 'activities', 'Our Activities', 'Lebih dari Sekadar Produk, Ini Tentang Perjalanan Bersama', NULL, 'landing/images/onepage-bg-left.jpg', NULL, NULL, 1, 1, 3, '2025-03-20 21:40:43', '2025-03-20 21:40:43'),
(13, 'cta', 'Take Action Now!', 'Join us and upgrade your bike today!', 'Get the best spare parts and professional installation for your motorbike.', 'landing/images/background/parallax-bg-2.jpg', 'Chat Us!!', 'https://wa.me/08211990442', 1, 1, 11, '2025-03-20 21:52:50', '2025-03-20 21:52:50'),
(14, 'categories', 'WHAT WE OFFER', NULL, NULL, NULL, NULL, NULL, 1, 1, 3, '2025-04-20 16:47:43', '2025-04-20 16:47:43');

-- --------------------------------------------------------

--
-- Table structure for table `section_contents`
--

CREATE TABLE `section_contents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `section_id` bigint(20) UNSIGNED NOT NULL,
  `content_key` varchar(255) NOT NULL,
  `content_value` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `type` varchar(255) NOT NULL DEFAULT 'text',
  `extra_data` longtext DEFAULT NULL,
  `show_order` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `section_contents`
--

INSERT INTO `section_contents` (`id`, `section_id`, `content_key`, `content_value`, `description`, `type`, `extra_data`, `show_order`, `created_at`, `updated_at`) VALUES
(1, 1, 'Kualitas Terjamin!!', 'Produk unggulan untuk performa maksimal.', NULL, 'text', '[]', 0, '2025-03-19 21:22:22', '2025-06-16 11:18:55'),
(2, 1, ' Pemasangan Mudah', 'Dirancang untuk presisi tanpa ribet.', NULL, 'text', NULL, 0, '2025-03-19 21:22:22', '2025-03-19 21:22:22'),
(3, 1, 'Didesain untuk performa', 'Cocok untuk motor harian hingga modifikasi.', NULL, 'text', NULL, 0, '2025-03-19 21:22:22', '2025-03-19 21:22:22'),
(4, 2, 'email', 'info@example.com', NULL, 'text', NULL, 0, '2025-03-19 21:22:22', '2025-03-19 21:22:22'),
(5, 2, 'address', '123 Street Name, City, Country', NULL, 'text', NULL, 0, '2025-03-19 21:22:22', '2025-03-19 21:22:22'),
(6, 2, 'postal_address', 'Cimahi, Bandung', NULL, 'text', NULL, 0, '2025-03-21 09:22:53', '2025-03-21 09:22:53'),
(7, 2, 'phone', '08211990442', NULL, 'text', NULL, 0, '2025-03-21 09:22:53', '2025-03-21 09:22:53'),
(8, 2, 'work_time_weekdays', 'Senin - Jumat : 08:00 - 17:00', NULL, 'text', NULL, 0, '2025-03-21 09:22:53', '2025-03-21 09:22:53'),
(9, 2, 'work_time_weekend', 'Sabtu - Minggu : 10:00 - 16:00', NULL, 'text', NULL, 0, '2025-03-21 09:22:53', '2025-03-21 09:22:53'),
(10, 3, 'Working Hours', '5600', NULL, 'number', NULL, 0, '2025-03-19 21:22:22', '2025-03-19 21:22:22'),
(11, 3, 'Happy Clients', '220', NULL, 'number', NULL, 0, '2025-03-19 21:22:22', '2025-03-19 21:22:22'),
(12, 3, 'Awards', '108', NULL, 'number', NULL, 0, '2025-03-19 21:22:22', '2025-03-19 21:22:22'),
(13, 3, 'Projects a Year', '650', NULL, 'number', NULL, 0, '2025-03-19 21:22:22', '2025-03-19 21:22:22'),
(14, 4, 'Beach Club', 'Print Design', NULL, 'image', '{\"image\": \"landing/images/portfolio/grid/1.jpg\", \"categories\": \"pemasangan, kolaborasi, event\", \"link\": \"#\"}', 0, '2025-03-19 21:22:22', '2025-03-19 21:22:22'),
(15, 4, 'Be loved one', 'Branding', NULL, 'image', '{\"image\": \"landing/images/portfolio/grid/2.jpg\", \"categories\": \"modifikasi\", \"link\": \"#\"}', 0, '2025-03-19 21:22:22', '2025-03-19 21:22:22'),
(16, 4, 'Salute to twins', 'Branding', NULL, 'image', '{\"image\": \"landing/images/portfolio/grid/3.jpg\", \"categories\": \"kolaborasi\", \"link\": \"#\"}', 0, '2025-03-19 21:22:22', '2025-03-19 21:22:22'),
(17, 4, 'Tired eye', 'Web Design', NULL, 'image', '{\"image\": \"landing/images/portfolio/grid/4.jpg\", \"categories\": \"event, pemasangan\", \"link\": \"#\"}', 0, '2025-03-19 21:22:22', '2025-03-19 21:22:22'),
(18, 4, 'Welcome home', 'Web Design', NULL, 'image', '{\"image\": \"landing/images/portfolio/grid/5.jpg\", \"categories\": \"modifikasi, event\", \"link\": \"#\"}', 0, '2025-03-19 21:22:22', '2025-03-19 21:22:22'),
(19, 4, 'Repair and improve', 'Print Design', NULL, 'image', '{\"image\": \"landing/images/portfolio/grid/6.jpg\", \"categories\": \"modifikasi, perbaikan\", \"link\": \"#\"}', 0, '2025-03-19 21:22:22', '2025-03-19 21:22:22'),
(20, 4, 'My bed room', 'Branding', NULL, 'image', '{\"image\": \"landing/images/portfolio/grid/7.jpg\", \"categories\": \"kolaborasi, event\", \"link\": \"#\"}', 0, '2025-03-19 21:22:22', '2025-03-19 21:22:22'),
(21, 4, 'Saksi bisu', 'Web Design', NULL, 'image', '{\"image\": \"landing/images/portfolio/grid/8.jpg\", \"categories\": \"event, pemasangan\", \"link\": \"#\"}', 0, '2025-03-19 21:22:22', '2025-03-19 21:22:22'),
(22, 4, 'Sure, aku solo', 'Branding', NULL, 'image', '{\"image\": \"landing/images/portfolio/grid/9.jpg\", \"categories\": \"event\", \"link\": \"#\"}', 0, '2025-03-19 21:22:22', '2025-03-19 21:22:22'),
(23, 4, 'Make it RED', 'Web Design', NULL, 'image', '{\"image\": \"landing/images/portfolio/grid/10.jpg\", \"categories\": \"perbaikan, pemasangan\", \"link\": \"#\"}', 0, '2025-03-19 21:22:22', '2025-03-19 21:22:22'),
(24, 4, 'Upgrading', 'Web Design', NULL, 'image', '{\"image\": \"landing/images/portfolio/grid/11.jpg\", \"categories\": \"modifikasi, pemasangan\", \"link\": \"#\"}', 0, '2025-03-19 21:22:22', '2025-03-19 21:22:22'),
(25, 5, 'Started', '{\"price\": \"0.99\", \"icon\": \"icofont-paper-plane\", \"features\": [\"512 GB Ram\", \"50 GB Disk\", \"1 User\", \"4TB Bandwidth\"]}', NULL, 'json', NULL, 0, '2025-03-19 21:23:12', '2025-03-19 21:23:12'),
(26, 5, 'Basic', '{\"price\": \"19.99\", \"icon\": \"icofont-light-bulb\", \"features\": [\"512 GB Ram\", \"80 GB Disk\", \"2 User\", \"4TB Bandwidth\"]}', NULL, 'json', NULL, 0, '2025-03-19 21:23:12', '2025-03-19 21:23:12'),
(27, 5, 'Standard', '{\"price\": \"39.99\", \"icon\": \"icofont-pen-alt-3\", \"features\": [\"768 GB Ram\", \"80 GB Disk\", \"3 User\", \"Full Data Security\", \"Unlimited Questions\", \"6TB Bandwidth\"]}', NULL, 'json', NULL, 0, '2025-03-19 21:23:12', '2025-03-19 21:23:12'),
(28, 5, 'Pro', '{\"price\": \"49.99\", \"icon\": \"icofont-magic\", \"features\": [\"1 TB Ram\", \"1 TB Disk\", \"4 User\", \"4TB Bandwidth\"]}', NULL, 'json', NULL, 0, '2025-03-19 21:23:12', '2025-03-19 21:23:12'),
(29, 6, 'Installation Service', 'Professional and precise installation of motorbike parts by experienced technicians.', NULL, 'text', '{\"icon\": \"icofont-tools\"}', 0, '2025-03-19 21:24:18', '2025-03-19 21:24:18'),
(30, 6, 'Spare Parts Sales', 'Wide range of high-quality spare parts with guaranteed authenticity and competitive pricing.', NULL, 'text', '{\"icon\": \"icofont-motor-biker\"}', 0, '2025-03-19 21:24:18', '2025-03-19 21:24:18'),
(31, 6, 'Customization & Tuning', 'Upgrade your bike’s look and performance with our custom modification and tuning services.', NULL, 'text', '{\"icon\": \"icofont-gear-alt\"}', 0, '2025-03-19 21:24:18', '2025-03-19 21:24:18'),
(32, 6, 'Fast Delivery Service', 'Quick and reliable delivery for all your motorbike spare parts and accessories.', NULL, 'text', '{\"icon\": \"icofont-fast-delivery\"}', 0, '2025-03-19 21:24:18', '2025-03-19 21:24:18'),
(33, 7, 'Free Ongkir', 'selama bulan desember', NULL, 'image', '{\"image\": \"landing/images/team/team-1.png\", \"link\": \"#\"}', 0, '2025-03-19 21:25:06', '2025-03-19 21:25:06'),
(34, 7, 'Kusus Honda', 'diskon untuk mounting', NULL, 'image', '{\"image\": \"landing/images/team/team-2.png\", \"link\": \"#\"}', 0, '2025-03-19 21:25:06', '2025-03-19 21:25:06'),
(35, 7, 'Gratis Pasang', 's&k berlaku', NULL, 'image', '{\"image\": \"landing/images/team/team-3.png\", \"link\": \"#\"}', 0, '2025-03-19 21:25:06', '2025-03-19 21:25:06'),
(36, 7, 'Promo Bulan Ini', 'Perhatikan terus sosmed', NULL, 'image', '{\"image\": \"landing/images/team/team-4.png\", \"link\": \"#\"}', 0, '2025-03-19 21:25:06', '2025-03-19 21:25:06'),
(37, 8, 'krnawnaprl', 'KEREN BANGET MOUNTINGNYA KOK BISA SIH SE CENTER ITU MIN 😔☝🏻', NULL, 'text', '{\"image\": \"landing/images/team/team-1.jpg\", \"variation\": \"Aerox New, 7cm\"}', 0, '2025-03-19 21:25:39', '2025-03-19 21:25:39'),
(38, 8, 'syahrulrochman859', 'Thanks min, mountingnya bagus & center🔥', NULL, 'text', '{\"image\": \"landing/images/team/team-2.jpg\", \"variation\": \"Aerox New, 8cm\"}', 0, '2025-03-19 21:25:39', '2025-03-19 21:25:39'),
(39, 8, 'juned_alfied', 'mounting by boyprojects sangat pnp sekali ke kzr saya tanpa rubah apapun, benar-benar plug n play...', NULL, 'text', '{\"image\": \"landing/images/team/team-3.jpg\", \"variation\": \"5cm + bosh\"}', 0, '2025-03-19 21:25:39', '2025-03-19 21:25:39'),
(40, 8, 'nobodyjudgeme', 'Alhamdulillah barang terpasang dengan baik dan posisi center. Terimakasih omku', NULL, 'text', '{\"image\": \"landing/images/team/team-4.jpg\", \"variation\": \"4 cm\"}', 0, '2025-03-19 21:25:39', '2025-03-19 21:25:39'),
(41, 8, 'adidaengg', 'Mantapp, mounting nya aman 100% presisi, ga ada kendala sama sekali pas pemasangan.', NULL, 'text', '{\"image\": \"landing/images/team/team-5.jpg\", \"variation\": \"4 cm\"}', 0, '2025-03-19 21:25:39', '2025-03-19 21:25:39'),
(42, 8, 'harsanandarozzaqfirmansyah', 'mantab asli top lah boy! kaga miring samsek joss puas kali lah!', NULL, 'text', '{\"image\": \"landing/images/team/team-6.jpg\", \"variation\": \"3 cm\"}', 0, '2025-03-19 21:25:39', '2025-03-19 21:25:39'),
(43, 9, 'Ubah tampilan dan performa dengan berkualitas tinggi', 'Upgrade Your Ride, Elevate Your Style!', NULL, 'text', '{\"image\": \"landing/images/slides/home-bg-2.jpg\", \"description\": \"Kami menyediakan berbagai sparepart terbaik untuk motor matic dan sport.\", \"button_text\": \"Lihat Produk\", \"button_link\": \"http://shopee.co.id/boyprojectsasli\", \"contact_link\": \"https://wa.me/08211990442\"}', 0, '2025-03-19 21:37:27', '2025-03-19 21:37:27'),
(44, 9, 'Kami siap melayani!', 'Sparepart berkualitas, pemasangan presisi', NULL, 'text', '{\"image\": \"landing/images/slides/home-bg-1.jpg\", \"description\": \"Layanan pemasangan sparepart dengan teknisi berpengalaman.\", \"button_text\": \"Cek Layanan\", \"button_link\": \"http://shopee.co.id/boyprojectsasli\", \"contact_link\": \"https://wa.me/08211990442\"}', 0, '2025-03-19 21:37:27', '2025-03-19 21:37:27'),
(45, 10, 'TikTok Video 1', 'https://www.tiktok.com/@boyprojects/video/7482575523772779831', NULL, 'text', '{\"embed_url\":\"https:\\/\\/www.tiktok.com\\/@boyprojects\\/video\\/7482575523772779831\",\"video_id\":\"7482575523772779831\"}', 2, '2025-03-19 22:02:27', '2025-06-16 11:40:51'),
(46, 10, 'TikTok Video 2', NULL, NULL, 'text', '{\"embed_url\": \"https://www.tiktok.com/@boyprojects/photo/7483462663515753736\", \"video_id\": \"7483462663515753736\"}', 0, '2025-03-19 22:02:27', '2025-03-19 22:02:27'),
(47, 11, 'Instagram Post 1', 'https://www.instagram.com/p/DH3oGaVy9TO', NULL, 'text', '{\"embed_url\":\"https:\\/\\/www.instagram.com\\/p\\/DH3oGaVy9TO\"}', 0, '2025-03-19 22:03:17', '2025-06-16 10:40:16'),
(48, 11, 'Instagram Post 2', NULL, NULL, 'text', '{\"embed_url\": \"https://www.instagram.com/p/DId4T2hJVC\"}', 0, '2025-03-19 22:03:17', '2025-03-19 22:03:17'),
(49, 12, 'Workshop & Modifikasi', 'Mengikuti berbagai event otomotif dan modifikasi motor untuk menghadirkan inovasi terbaik.', NULL, 'text', '{\"icon\": \"icofont-trophy\"}', 0, '2025-03-20 14:41:07', '2025-03-20 14:45:41'),
(50, 12, 'Gathering & Riding Events', 'Berkolaborasi dengan komunitas riders dan penggemar otomotif dari seluruh Indonesia.', NULL, 'text', '{\"icon\": \"icofont-users\"}', 1, '2025-03-20 14:41:07', '2025-03-20 14:45:41'),
(51, 12, 'Online Webinars & Tips', 'Berbagi wawasan seputar perawatan, pemasangan, dan upgrade motor untuk performa maksimal.', NULL, 'text', '{\"icon\": \"icofont-tools\"}', 2, '2025-03-20 14:41:07', '2025-03-20 14:45:41'),
(52, 12, 'Networking & Partnership', 'Memperluas koneksi dengan sesama pecinta otomotif melalui berbagai acara eksklusif.', NULL, 'text', '{\"icon\": \"icofont-web\"}', 3, '2025-03-20 14:41:07', '2025-03-20 14:41:07'),
(53, 13, 'Upgrade Your Ride Today!', 'Get the best spare parts and professional installation for your motorbike.', NULL, 'text', NULL, 0, NULL, NULL),
(54, 14, 'LAMPU', '', NULL, 'image', '{\"image\": \"landing/images/categories/categories-1.png\", \"link\": \"https://shopee.co.id/boyprojectsasli?originalCategoryId=11043768#product_list\"}', 1, '2025-03-19 21:22:22', '2025-03-19 21:22:22'),
(55, 14, 'MOUNTING', '', NULL, 'image', '{\"image\": \"landing/images/categories/categories-2.png\", \"link\": \"https://shopee.co.id/boyprojectsasli?originalCategoryId=11043764#product_list\"}', 1, '2025-03-19 21:22:22', '2025-03-19 21:22:22'),
(56, 14, 'SERVICE', '', NULL, 'image', '{\"image\": \"landing/images/categories/default.png\", \"link\": \"\"}', 1, '2025-03-19 21:22:22', '2025-03-19 21:22:22'),
(57, 14, 'SOMETHING', '', NULL, 'image', '{\"image\": \"landing/images/categories/default.png\", \"link\": \"\"}', 1, '2025-03-19 21:22:22', '2025-03-19 21:22:22');

-- --------------------------------------------------------

--
-- Table structure for table `tgb_5y4v`
--

CREATE TABLE `tgb_5y4v` (
  `k3_id` bigint(20) UNSIGNED NOT NULL,
  `yhn_cid` bigint(20) UNSIGNED NOT NULL,
  `ujm_aid` bigint(20) UNSIGNED DEFAULT NULL,
  `ikm_ck` varchar(255) NOT NULL,
  `olp_ct` text NOT NULL,
  `pkm_st` varchar(255) NOT NULL DEFAULT 'new',
  `rty_ir` tinyint(1) NOT NULL DEFAULT 0,
  `uio_ii` tinyint(1) NOT NULL DEFAULT 0,
  `asd_id` tinyint(1) NOT NULL DEFAULT 0,
  `fgh_da` timestamp NULL DEFAULT NULL,
  `qwe_cat` varchar(255) NOT NULL DEFAULT 'general',
  `jkl_lut` timestamp NULL DEFAULT NULL,
  `zxc_ca` timestamp NULL DEFAULT NULL,
  `vbn_ua` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tgb_5y4v`
--

INSERT INTO `tgb_5y4v` (`k3_id`, `yhn_cid`, `ujm_aid`, `ikm_ck`, `olp_ct`, `pkm_st`, `rty_ir`, `uio_ii`, `asd_id`, `fgh_da`, `qwe_cat`, `jkl_lut`, `zxc_ca`, `vbn_ua`) VALUES
(3, 3, NULL, 'general', 'Work Timings\r\nSenin - Jumat : 08:00 - 17:00\r\nSabtu - Minggu : 10:00 - 16:00', 'new', 1, 0, 0, NULL, 'general', '2025-06-16 08:48:27', '2025-06-16 08:48:27', '2025-06-16 10:04:15');

-- --------------------------------------------------------

--
-- Table structure for table `val_9m3q`
--

CREATE TABLE `val_9m3q` (
  `k9_id` bigint(20) UNSIGNED NOT NULL,
  `opv_oid` bigint(20) UNSIGNED NOT NULL,
  `qwe_vl` longtext DEFAULT NULL,
  `rty_dv` longtext DEFAULT NULL,
  `uio_pa` decimal(10,2) NOT NULL DEFAULT 0.00,
  `asd_id` tinyint(1) NOT NULL DEFAULT 0,
  `fgh_ia` tinyint(1) NOT NULL DEFAULT 1,
  `jkl_so` int(11) NOT NULL DEFAULT 0,
  `zxc_ca` timestamp NULL DEFAULT NULL,
  `vbn_ua` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `val_9m3q`
--

INSERT INTO `val_9m3q` (`k9_id`, `opv_oid`, `qwe_vl`, `rty_dv`, `uio_pa`, `asd_id`, `fgh_ia`, `jkl_so`, `zxc_ca`, `vbn_ua`) VALUES
(1, 1, 'eyJpdiI6ImU3aW8vS2YwN3NPODRQeEU2YUhja2c9PSIsInZhbHVlIjoiR2R3ZnE3SmhYSnBrVnNwZHlvQkNqZz09IiwibWFjIjoiODJhNjUyZjRmMzMxZjMzMDY5NjVmNDEzMDg2ZTIwOWVkYzJkMTNhOTRkMGZjYWViMDY4MDE1YjE5MzExYTJjNCIsInRhZyI6IiJ9', 'eyJpdiI6IkpVN29IUWhkMVo2NjBLMm9Xa3Y2K3c9PSIsInZhbHVlIjoiWHh6bFBpM2FLMWpJUkZ4MkQ0RkJRZz09IiwibWFjIjoiODk0ZWE4OWIyZTVlNzY0ZjllODNhZmNjNGYzYWViNTk1MzA0YzNkMTQ0MzE4MWMxOWY3ZTkxZWVkMTk0YzhkMyIsInRhZyI6IiJ9', '0.00', 1, 1, 1, '2025-06-12 23:06:47', '2025-06-12 23:06:47'),
(2, 1, 'eyJpdiI6InZGd2xMOUFlMjBmLyt1Uk03ay9kVHc9PSIsInZhbHVlIjoiWm1lQ080Y1ErbE9GZnYyRDRqU3ZFUT09IiwibWFjIjoiMzMwZTU3YTU0YjY1MGE2MWI0YmY0ZmM5MWJiZTJjMmFjNmRmZWYwMTVjMDAwMGVkODM1ZDNkMjUzZGExMmQ3MyIsInRhZyI6IiJ9', 'eyJpdiI6Ik5iTkpQaE84emZUNFhOSkliS1FSalE9PSIsInZhbHVlIjoiQ3BnallEbUVnbGlwNjV6WDQwUWhXZz09IiwibWFjIjoiM2RkZjI0ZWNkOTM2YTljZjYwOWUxYTJiMzUyYjJjYTJiYjU0Y2UzYzBlZjA2Y2RlYzA3MGFkZDgzODE1NjE2NSIsInRhZyI6IiJ9', '0.00', 0, 1, 2, '2025-06-12 23:06:47', '2025-06-12 23:06:47'),
(3, 1, 'eyJpdiI6IlZMdm5JSm1RdWkwWjIrd0lEV2dTMmc9PSIsInZhbHVlIjoiMVVkVGhUWnZRcnRCdnBKTGtOejlLdz09IiwibWFjIjoiNzI1MTEwYzJhYzQxMGVkOGU5MGQzNGI3Y2JkMDdkMDAxZTFmYjM4NjUwYTYwZDFkNGFhMzE1ZGU2NThlZjRjOCIsInRhZyI6IiJ9', 'eyJpdiI6ImdGaEJKOTB4NERBUlNoMzQyQTFHVHc9PSIsInZhbHVlIjoiUUVBSE8rTUE4TzNnTTJjYmkvVEZjUT09IiwibWFjIjoiOTU4ODQ5YjU2NTRjNjQyNDg0OGIxNmRiZWE0ODQ0NzFjZDE3ZjU1MDhkN2I3ZDk0ODBmMGM1OTliZGY4ZjAxNiIsInRhZyI6IiJ9', '0.00', 0, 1, 3, '2025-06-12 23:06:47', '2025-06-12 23:06:47'),
(4, 1, 'eyJpdiI6IjJ2SjZPRURseVlsVDRORWxvUFYxU2c9PSIsInZhbHVlIjoicnNZallYc1B1SGtlcGxSUXNPUFh0QT09IiwibWFjIjoiZmZmMTI2MzIyMDU0YjI4NzUxZDM4N2NjMGViOTFjYjk4YWYxOTE1NTE0YTJjZDIyMzVlMGQzYjAxMjE4ZDM4MiIsInRhZyI6IiJ9', 'eyJpdiI6Ik9heDZVVXN3Z0RqZi9TR0tUSVRYcFE9PSIsInZhbHVlIjoiTjVzTlBYMmlyeDhYV2tTZlJBbUdJQT09IiwibWFjIjoiYjQyZTlmMmQxNzYwMWEzNjRkNDAzMDNlYjE0MzNlYWZlZmRiMzNhY2Y4ODc3MzAzMmY0ZWI4NjE4NTVkYmM4YiIsInRhZyI6IiJ9', '0.00', 0, 1, 4, '2025-06-12 23:06:47', '2025-06-12 23:06:47'),
(5, 1, 'eyJpdiI6InBIZGFCSEdSazF1S2Jxc3h0dEZWRkE9PSIsInZhbHVlIjoiTm1yL1RsWjVoV1dzUVpySmY3c3Aydz09IiwibWFjIjoiZjJhN2FkODQ0MDRjN2Q1ZjYzZTJkYWVmZGI0MmI5NmM0MGY1NzVlMGY5MGYwMjgwMjgzN2Y2ZDI1MDJmOWRkMSIsInRhZyI6IiJ9', 'eyJpdiI6Im1vMldFdWhqZlkzOU9CR3lFbGxIZXc9PSIsInZhbHVlIjoiTXR2dVlvQ0dJb3lRZFMyMXMrQUZjZz09IiwibWFjIjoiNWE1N2NjNmFjMDg3Y2JhMDZhYTljMGM2YWM4M2M1ZjQ4NWI5NDgzZDBmODNlOTI3ZGEwOWJjMjlmYTMyNDU5ZiIsInRhZyI6IiJ9', '0.00', 0, 1, 5, '2025-06-12 23:06:47', '2025-06-12 23:06:47'),
(6, 1, 'eyJpdiI6IkRGclZyblNxNDQ0NTRoc3RpeXc2TGc9PSIsInZhbHVlIjoiRDFZSTJLT2tpaHpxOFNVc1U5d2laZz09IiwibWFjIjoiNzkwYjg5ZDFlNDUxZTZlNWM5NDJmMmYzZDQ1NzU2ODU2N2NlZDNiNjMzZGU3OTRmMzEyYzY5ODliMDQ0NDBhZCIsInRhZyI6IiJ9', 'eyJpdiI6Ill0ZTlVS1lxYlk2ay9mUnFxZ0JSV3c9PSIsInZhbHVlIjoiQ1l4c0Z3SGFCQWdvbWNrcFZJK3pPdz09IiwibWFjIjoiMTZhZDE2YzIwMTdiYjY0OTdiMGJiNTJjM2ZiMTIyNzg5MmE5YzRiYjVmNDk1MDkzYjhmOTMwMDRkNGM0NTcyYyIsInRhZyI6IiJ9', '0.00', 0, 0, 6, '2025-06-12 23:06:47', '2025-06-12 23:06:47'),
(7, 2, 'eyJpdiI6Ijdtd2RDbUk3V1FaWGhEMXhQQktLS2c9PSIsInZhbHVlIjoiZTdqc010S1dOcXBQYWNBcGs5SENPUT09IiwibWFjIjoiM2VmZDRkMDMwNWU2MmZhYjRmYzY1ZjRjNWIwY2RkMzBmNDRmOGU0Y2JlN2U4MTViY2MzMzkzZjg0NDBmMzZmMCIsInRhZyI6IiJ9', 'eyJpdiI6Ikg4TG9kZXRyWS9sekFCZFh1YkFPTlE9PSIsInZhbHVlIjoiZjNmaTRTcnpkaUtPcDlKYU92bjdwUT09IiwibWFjIjoiOTE4YjZjMjE4ZDA1MDFjMzM3NTIwZTc2NWM3ZjUyNTljZTQzZWJjYjkxMTRiMDRkM2MyMzQ2NWFkNjU5ZTJkZSIsInRhZyI6IiJ9', '0.00', 1, 1, 1, '2025-06-12 23:06:47', '2025-06-12 23:06:47'),
(8, 2, 'eyJpdiI6IjNPZ3RPYkpDOXlQbnlIQWdIanRZVnc9PSIsInZhbHVlIjoic0VZU1o2ZUtEMXJCVXFUSWdTLzUrZz09IiwibWFjIjoiZTVkODU5NmIzMzQyOWVjMmZlYWM0YWVjNThlYmU0NTk4ZTQyMzYyZjRkNmZiYjg2NmM3MDRjOTVjMjExYWNhNCIsInRhZyI6IiJ9', 'eyJpdiI6IjArNlMwdFJaS2twSmRmQjlUWXU4QXc9PSIsInZhbHVlIjoibHg4RnY0UzRTdTlkRFE0SjRhT2dxdz09IiwibWFjIjoiZjZhMmY5YWNmN2RiODk2NjMzMzNhYTBmYmNiMzY5MThlNjI1OTU0NTA0MGEzNjI1NzRkMDliNmZkN2MyYzA0YyIsInRhZyI6IiJ9', '0.00', 0, 1, 2, '2025-06-12 23:06:47', '2025-06-12 23:06:47'),
(9, 2, 'eyJpdiI6IkFqVjkyTlBGUndWNmtoeVBPM2hIRHc9PSIsInZhbHVlIjoiVDlIclVUdzVqT3ZCNytPVGFUaC90Zz09IiwibWFjIjoiNTk0YjdhOGMwZTMwODk5YTRjNWRlY2JmZjJhOTU4YmUwZmRmODgzMTlmYjA2N2I2ZWM2N2MwZWYxYmYyNzA2YiIsInRhZyI6IiJ9', 'eyJpdiI6IkFBY2w1dlBuV0JZMVIxaXlrV050R3c9PSIsInZhbHVlIjoicUZYRE56TXZEbVQ3ZytlcG9OT1J1QT09IiwibWFjIjoiMzE2MDc1MTY5NDRhYWY3OTcxNGFkZjIyMzVmZjFiYTU2MTI2ZGNkMWJhMjZhNzM1YzViNjIxMDJhMmVjZTg1YiIsInRhZyI6IiJ9', '0.00', 0, 1, 3, '2025-06-12 23:06:47', '2025-06-12 23:06:47'),
(10, 2, 'eyJpdiI6Im1qZXhNbUE4WE81RWV0MGErdnQwOUE9PSIsInZhbHVlIjoiVGFsS1J2L3VjTGRwK2YzNFRIUGprdz09IiwibWFjIjoiMzQ2MmVkMmQ4ZWY0YzdjMDVkMDQzOWMzM2RkOTY4NTkwMWU5OTBjYzk1MGQyNWQ0MDYwMTJkN2VjYTE5YjQ5MiIsInRhZyI6IiJ9', 'eyJpdiI6IktNT3JHTGxjTGxTWUhFNjg3N1luR3c9PSIsInZhbHVlIjoiQkNKNm1JckNNT0R4WlluL0U2K0tZUT09IiwibWFjIjoiYTViMmY5YTU3N2Y1MjAzMTk0ZjJkNmI5ZmMzMTY1ODc0ZDkyODgxMzBkOWM2MWYzOTBjZjhlM2IxOGZjNmFhOSIsInRhZyI6IiJ9', '0.00', 0, 1, 4, '2025-06-12 23:06:47', '2025-06-12 23:06:47'),
(11, 2, 'eyJpdiI6IjMwQTZzMUc1YklXZW1rcWNxa1hJeHc9PSIsInZhbHVlIjoiWXhSdFRNMGZkdE9Oank1bkhPVzh4Zz09IiwibWFjIjoiYWQ5ODkzYjAxYjI2ODExMDk2ODQ0ZDY4YTg2MjViNmVhZWQyNzU5MGRkNzRlZmIwZDk4M2Y3YjVkMTc2MTY4MCIsInRhZyI6IiJ9', 'eyJpdiI6Ikw4WVZCcysyWVBNNHNmYjVQZUhXbGc9PSIsInZhbHVlIjoiV283b0tXQ29nRXd1RUdORTVEMFdXQT09IiwibWFjIjoiMzRjODVkZWEwMzAzY2IxNmJkMjNiZjA2MTNjN2U3MjgyNmExZjVlYTFkMDRmNDY3MjQwZWY2ZTEyYzg0NDUyMyIsInRhZyI6IiJ9', '0.00', 0, 1, 5, '2025-06-12 23:06:47', '2025-06-12 23:06:47'),
(12, 2, 'eyJpdiI6IldMZTRFNm1UZEo4anZsRVRlM3NzMnc9PSIsInZhbHVlIjoiMnJoWVlZRVcvZ2ZsNjRLVjBSNDBMUT09IiwibWFjIjoiYzIxODlkZGY3MDY4NzI0OTE2OTBiNTE2Nzg4ODhmNzg3ZDE1NjdhNmMzZWY2MGU0MzAyMjM4ZWFjNDdmOTE5ZCIsInRhZyI6IiJ9', 'eyJpdiI6IjhpazE1NG9KdDFxeEIrNXV3dXI0OVE9PSIsInZhbHVlIjoiRHZ5c2dRUVBsQzNzb0xicENpNmhOdz09IiwibWFjIjoiMTU2NTAwNjcyNzI2MWFjMDBmZTBmNjc5ZDU5ZDQ4MzdhODFmOTY5ZDhlMGVmZDVjOGI3Y2NmZTc1NjVmZTgzNSIsInRhZyI6IiJ9', '0.00', 0, 1, 6, '2025-06-12 23:06:47', '2025-06-12 23:06:47'),
(13, 2, 'eyJpdiI6InQxRkkyVkRTa0dKVjQ1UWpKUG5CVHc9PSIsInZhbHVlIjoiejYwY2ZZcmNMblJYVmtaNGtmSTJ0dz09IiwibWFjIjoiYjkzYTc3YzVmMmEwNzBlM2MyZTgwZTcxNWJkYjNiM2U0MWY2NjM1ZDM5ZDA3ZTZlMjVhNjFmZDM4YmQ0OTRkMCIsInRhZyI6IiJ9', 'eyJpdiI6ImhTN3NqeVg3cThMWUlrTThERWN5NHc9PSIsInZhbHVlIjoibTl0aDVFUWhmMzBFZnpVRG9wTnRFQT09IiwibWFjIjoiMWZiMWFmMTcwNDkyMDVlMmExM2QxOWJhZDg4OWQyYzkyYjFhMDM5NTZiYTc5OTY3OWUzNTI0ZjM0ZjUyMzZiZCIsInRhZyI6IiJ9', '0.00', 0, 1, 7, '2025-06-12 23:06:47', '2025-06-12 23:06:47'),
(14, 3, 'eyJpdiI6Ikl1V2l6eEc4Sjc0NU5UVHp6bVE1dXc9PSIsInZhbHVlIjoiMlBIKzFyNHg2ODZUNUQ0ajlsZFlhQT09IiwibWFjIjoiOTc4MGQ5ZTliNWY0ZDM5ODJjZDU2OGU2NzMzMWM3OGM3YTkwZTM3NmYxNzU4YmI5YzI3NTlhOTMwNWYxYzY3ZCIsInRhZyI6IiJ9', 'eyJpdiI6IkU5T294NjRkSkRiQjcydUZ6ZDY3V0E9PSIsInZhbHVlIjoiSkFlZnE0eVRtU3kwNXBzaGU1ZktmZz09IiwibWFjIjoiYWQ2ZmZiOWE3Yzc0Y2EzZTVjOGZkZGMyZjA3MDBjOWViOTA5M2Q5OTExMDk5ZWQwOTIyOGFlZTAzNjE5MGFjMCIsInRhZyI6IiJ9', '0.00', 1, 1, 1, '2025-06-12 23:06:47', '2025-06-12 23:06:47'),
(15, 3, 'eyJpdiI6ImNUUXFVVnEyMElaUzV6OHh3NjVSQUE9PSIsInZhbHVlIjoienVqQVRhZmFnNmkyUnIrVUJiSG5YZz09IiwibWFjIjoiNGU0ZmIyNWRlNGNhMmFkMTU0OTI3MWI3MDM0ZDE4ZjRkMTI2ZTVmM2Q3MDIxNzg0ZTgyODM1NmI5NmY0OTYyNiIsInRhZyI6IiJ9', 'eyJpdiI6IkVuL3lVbExpNDRFV05CdS94Yk11YWc9PSIsInZhbHVlIjoibnFwM2RGTTIyenlyQzJPeERNUUYzUT09IiwibWFjIjoiZjUwMzI1MTRhOGI0ZjQ3NWNhNjc4Y2RiZGI1MDhlMTNlMzI4OWQ4MTZiMWFhZjQ3MmIxOGU3YTJiMjBmZTY3MyIsInRhZyI6IiJ9', '0.00', 0, 1, 2, '2025-06-12 23:06:47', '2025-06-12 23:06:47'),
(16, 3, 'eyJpdiI6ImR4VDBpOFRVWUJsTGdickI2YTVDcVE9PSIsInZhbHVlIjoiWmVCTEdScWJjczEwSTJIbVhpZ2IrUT09IiwibWFjIjoiZThmZDQ0NWIyMjgwMDE5N2NkMTJkNjE1NjVlZjFlMjM2N2Y3ZmJmYjg1MzVjN2EzYmVkYzBjZmFhZjJlYzc1NyIsInRhZyI6IiJ9', 'eyJpdiI6InYveXZmc1U3dWdkZEovVFpoY1dOcGc9PSIsInZhbHVlIjoiUk9YK2JCZE5WWVk2bDdGRUdxR1J1Zz09IiwibWFjIjoiNmUyMjg5YTMxMDA1ZjgxMmI3OGYzYjBkNTY2YWRiNmY0OGE4ZjMyMDNkOTI1YjRiOGQyNjQwOGIwMWQ1ZWI3YyIsInRhZyI6IiJ9', '0.00', 0, 1, 3, '2025-06-12 23:06:47', '2025-06-12 23:06:47'),
(17, 3, 'eyJpdiI6Ii9mTFJiamVFUHBBVUdoOEdGSklWcHc9PSIsInZhbHVlIjoiWXBlUFhrV3hiNStwVGVCWmw5NVJlUT09IiwibWFjIjoiZWNlODlkZjYwOGYxMGYyMTUzMGRmNTNmMWU3YTRmNWVjNGRhZDYwZWMzMWIyZTA0YTE4YmFlNjM2Y2ZhNTlkMCIsInRhZyI6IiJ9', 'eyJpdiI6ImR4NWVLb3Zkcmh3UUM1Y2tLUC9SNXc9PSIsInZhbHVlIjoiUFAvRFc5WVI5WWJLNTVpN0xGRjRGdz09IiwibWFjIjoiNDY3OGZkMzhlOGJmMjNhMzU4OWU3ZTI3NGM2MTRlOWQ0MDUwOThjNDQxNGE0MzMyOTE5YTFmZjhmZjlkNzQ0YSIsInRhZyI6IiJ9', '0.00', 0, 1, 4, '2025-06-12 23:06:47', '2025-06-12 23:06:47'),
(18, 4, 'eyJpdiI6InRYUFRrQ3B5K0x6QjZlRC9zYTBPeUE9PSIsInZhbHVlIjoiZG53UGpZTVp1Zm44TXhYQ20xaXJ5UT09IiwibWFjIjoiMWU5NjEwODE5ZWUxMDg4NmZkYTYwMjkxNDQzZmVmNjRkYWYwNzAyNTRlMjAzYzczYzE4NGVhMzg1N2Y5MDA3YSIsInRhZyI6IiJ9', 'eyJpdiI6ImdoSXp6STV4YzhLWldqNXpvWjdQenc9PSIsInZhbHVlIjoic3p6V3BjUkpueURudkxhNUprUzhSUT09IiwibWFjIjoiNDU4NGY3ODAwM2FjN2I2ZDdhNWZjYzM4ZTFhY2EyMzA2NTNkNjZjNjU5ZjBjYTFjZGYxZTNhYjVlYTA5YWM1OSIsInRhZyI6IiJ9', '0.00', 1, 1, 1, '2025-06-12 23:06:47', '2025-06-12 23:06:47'),
(19, 4, 'eyJpdiI6Im95dmZ2TDVEQ0NUcW1TejRRS3ZaOGc9PSIsInZhbHVlIjoiNHFyRTN1d05yZUFMVTFobEJkUEk5dz09IiwibWFjIjoiZDMwOGZmNjhhYTlhYmQ5ZTYxNzYwMTQ5ZGZmZDk1ZGFkZTQwZDIxMGVmYjAxMTBjMWY1ZTU4OWNhNjZkYzJhOCIsInRhZyI6IiJ9', 'eyJpdiI6InY1NkMxc1VxaWZsUm1XMUFTNExNMWc9PSIsInZhbHVlIjoidGhUZWRyZGZVZ0NveHRpd0lNY29EUT09IiwibWFjIjoiZmZmMmYwY2Y0ZGFkYTE1M2ZhOTFjNDlmNWY1ZWE0MDQzZjM4ZmZkN2Y1MGM4NjA3MDEwNjY5NTQ4YzIyN2YzOSIsInRhZyI6IiJ9', '0.00', 0, 1, 2, '2025-06-12 23:06:47', '2025-06-12 23:06:47'),
(20, 4, 'eyJpdiI6IllpbWFzWTB5MzdVcVJVVUxsYngvaXc9PSIsInZhbHVlIjoiSWhMVUNPYUVYbGRKRTNzeEZYbHUrZz09IiwibWFjIjoiMDdhODUwNGVhZTA1MTRkOTE2N2YxOTM0MjdhMDIwYmQ2OWNlNTA0Zjg4MDlmYTMxZmNiOTQ3ODBlMDEyODg3OSIsInRhZyI6IiJ9', 'eyJpdiI6IjZxUHdXdUR4SkRBbDJoMzhQeVBzd2c9PSIsInZhbHVlIjoiYzlMd3FRc2Z5QmYrM1RlbXZQSGNIZz09IiwibWFjIjoiODc1MDE0YmUyMGQ4YjE2MzZkNTM1OWFiMDBjMzkwMjVjOGI0NDBjM2QzZjYzNGQ0ZjA0MjJhNGY3N2E0OWE1MSIsInRhZyI6IiJ9', '0.00', 0, 1, 3, '2025-06-12 23:06:47', '2025-06-12 23:06:47'),
(21, 4, 'eyJpdiI6ImNmMVd5UzFONDhaV1JZMzFobDdVU0E9PSIsInZhbHVlIjoiMGpVSWZ4YW5FODRjbDB4RTFhQ0h6QT09IiwibWFjIjoiY2JkZWZlZTZjNGYwNGY3Yzk4ZGUxOGFmY2MzYmZkMDM0MWJkZjQ0MjVhOGRhMzA0NGRlY2M5MzJiZjAxMWIxNSIsInRhZyI6IiJ9', 'eyJpdiI6IlMyais1QzJuUjdVRDlsVGZFa09hWFE9PSIsInZhbHVlIjoiOUNPTlVMK1BZZWNQR3NFeTNsK1VWZz09IiwibWFjIjoiOTUxMGJmODMzNDgxZGFlNGIxNzBhYzNmYWExMzBiOWNlM2EzY2QzMjY4NDU2M2I0ZjkxNDM4M2ZmMWM3MzNlMSIsInRhZyI6IiJ9', '0.00', 0, 1, 4, '2025-06-12 23:06:47', '2025-06-12 23:06:47'),
(22, 4, 'eyJpdiI6IjJ2M1RwQW5EVFdLSndtWEN5OGtUTEE9PSIsInZhbHVlIjoiSmhaRXpnVkhremYrZHhCdHhGVXlVQT09IiwibWFjIjoiN2Y3MmVhOGFiNTM5MzA3MzQyNjMzZTUwMGFmMjUyYzk4ODlhZTc2MDY2ODBlOWU4OTM3NjYxZTYyYzRmN2IwZCIsInRhZyI6IiJ9', 'eyJpdiI6ImpNUkYydmRmM254b2loS3BVUHNYbGc9PSIsInZhbHVlIjoib0I3UCtYRVkxNHB3UjdEbnArYkx2UT09IiwibWFjIjoiNmNmMjI2NWNlZDkzNjNlNjdkYzNkZWMwMzFhYWJmNWE5NmZkYTJkZDA1ZGJkY2FmN2Y3NjU5N2VjZWQ1ZGYwZiIsInRhZyI6IiJ9', '0.00', 0, 1, 5, '2025-06-12 23:06:47', '2025-06-12 23:06:47'),
(23, 4, 'eyJpdiI6InkwRXR1d05IaFlhODQ1ZlZ1UlAyb3c9PSIsInZhbHVlIjoiRUZFcnFTSEN2SkR3WUZNeUQxc3VxZz09IiwibWFjIjoiNjFiNGFiYmI4NGVlNjNiNWVlMGQyYzJjZTRhMDUxYTFmZDE5ODBmNzVjN2MwNTc3MmE2YjhjNTA4NzU1NTM0YSIsInRhZyI6IiJ9', 'eyJpdiI6ImxtdDQ5Y3g2K2JMazc2TzFxM0hCVkE9PSIsInZhbHVlIjoiekpoQ2pqM25jRWxyWVBoU2ZsRWZSQT09IiwibWFjIjoiY2UzNmZmYjYxZjJiM2Q3YmIyNmFmODc3ZjJhZTEyZGRmM2UyNTY1NDJkMWM5MzM4MTljNTgzZjg2NDY1OTRhYSIsInRhZyI6IiJ9', '0.00', 0, 1, 6, '2025-06-12 23:06:47', '2025-06-12 23:06:47'),
(24, 4, 'eyJpdiI6IjVqakZKUGNybzFhQWZBRS83YTVGa0E9PSIsInZhbHVlIjoiN3JLa3I1djBxY0QrL20vcnR1bmYyQT09IiwibWFjIjoiZDgxZjlmOWNmZDIxMTRkODFjYWYyYzllMWM0ZjJkMGUwOTZlMjVkZjU3NGFhYjY5MjFjZDgxOWU2MTUxNGNjZCIsInRhZyI6IiJ9', 'eyJpdiI6IjBpbFQ1Y0Z6bG5HeHRMQkUvUm9MbFE9PSIsInZhbHVlIjoiZEVXZ1hoQjNVYVEvSHJwK3YwWlpMZz09IiwibWFjIjoiNTgyNjI4YzY3MzFkYjk0MWFjMGU4Y2Y2NWZkNjU2ZDYxOTA5Nzk4YWNlYWMxNzU5ZmViZTgwZmRmN2E3MmJhYSIsInRhZyI6IiJ9', '0.00', 0, 1, 7, '2025-06-12 23:06:47', '2025-06-12 23:06:47'),
(25, 5, 'eyJpdiI6ImE1Y0hubytEaFBJbEw1OHF3cDJGa3c9PSIsInZhbHVlIjoiRzhtRnFJb09NZEFjdjFUbkY3QWs3QT09IiwibWFjIjoiY2RlZWU4NTQzZmI5YWJkZWY5MzA1ZDM2MWVlZjFjODZkMjcwNGUxNWUwNDk4YzQ3OWJiOTQzNDE2YjJjZmY4MyIsInRhZyI6IiJ9', 'eyJpdiI6IkFFWklEVWtoTEJ1Ylc1RG5pKzVNNVE9PSIsInZhbHVlIjoiaUFBa0I0ZFVQYTQwcUJmbGsvcmVodz09IiwibWFjIjoiNjA5N2NkNTk5ZGY4YzYwY2I3YmZjOGZmZmZlYWM4ODFiNjkxMWU2NTI2Yjk4ZmE3YTY4ZTM2YjAyM2MzMjk4YSIsInRhZyI6IiJ9', '0.00', 1, 1, 1, '2025-06-12 23:06:47', '2025-06-12 23:06:47'),
(26, 5, 'eyJpdiI6ImI4ZTBxNDFYSFh4R1RpRXpUNzRnbkE9PSIsInZhbHVlIjoid3BRTE9heExRSmNFVkZrMHBKZTd1UT09IiwibWFjIjoiMzczOTM1NWY4NmQ3MThmYjM1Yjc1NjMwZDJkZGJlZDdlODNlM2E5NDMzZDQzYmVkNTAyN2NkYzQ1MTdlYWYwMSIsInRhZyI6IiJ9', 'eyJpdiI6IktPbW1qeUJwK2FxWU1zQkppWXJ4Zmc9PSIsInZhbHVlIjoid0FGemZwamI4bGFINysxYzhvdEgxQT09IiwibWFjIjoiZGI0MjIwZTg2MmMwZTdlZjgyOTUzY2U5OTlkZTE0ZGIwMmVkYjE4YzFjNWI2NThmNjg2NGZhZTlkMzRkYTdmZCIsInRhZyI6IiJ9', '20.00', 0, 1, 2, '2025-06-12 23:06:47', '2025-06-12 23:06:47');

-- --------------------------------------------------------

--
-- Table structure for table `wer_72qp`
--

CREATE TABLE `wer_72qp` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tyu_kw` varchar(255) NOT NULL,
  `rty_rs` text NOT NULL,
  `wsx_ia` tinyint(1) NOT NULL DEFAULT 1,
  `vbn_pr` int(11) NOT NULL DEFAULT 0,
  `qwe_ak` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`qwe_ak`)),
  `sdf_mt` varchar(20) NOT NULL DEFAULT 'contains',
  `cde_cs` tinyint(1) NOT NULL DEFAULT 0,
  `nhy_ds` text DEFAULT NULL,
  `pol_cb` bigint(20) UNSIGNED DEFAULT NULL,
  `ijn_ub` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wer_72qp`
--

INSERT INTO `wer_72qp` (`id`, `tyu_kw`, `rty_rs`, `wsx_ia`, `vbn_pr`, `qwe_ak`, `sdf_mt`, `cde_cs`, `nhy_ds`, `pol_cb`, `ijn_ub`, `created_at`, `updated_at`) VALUES
(1, 'hai', 'Hai! 👋 Selamat datang di Boys Project! Kami siap membantu Anda dengan sparepart motor terbaik. Ada yang bisa kami bantu?', 1, 1, '[\"halo\",\"hello\",\"hi\",\"selamat\"]', 'contains', 0, 'Greeting response for customers', NULL, NULL, '2025-06-12 23:19:52', '2025-06-12 23:19:52'),
(2, 'saya butuh bantuan', 'Tentu! 😊 Saya siap membantu Anda. Silakan pilih topik yang ingin Anda tanyakan atau ketik pertanyaan langsung.', 1, 1, '[\"bantuan\",\"help\",\"tolong\",\"butuh\"]', 'contains', 0, 'Help request response', NULL, NULL, '2025-06-12 23:19:52', '2025-06-12 23:19:52'),
(3, 'harga', '💰 **INFORMASI HARGA** | Untuk info harga terbaru, silakan sebutkan produk yang Anda cari. Contoh: \"harga mounting aerox\" atau \"harga lampu LED\". Kami juga ada promo menarik lho! 🔥', 1, 1, '[\"price\",\"biaya\",\"cost\",\"berapa\"]', 'contains', 0, 'Price inquiry response', NULL, NULL, '2025-06-12 23:19:52', '2025-06-12 23:19:52'),
(4, 'info kontak', '📞 **KONTAK KAMI** | WhatsApp: 08211990442 | Jam operasional: Senin-Jumat 08:00-17:00, Sabtu-Minggu 10:00-16:00 | Lokasi: Cimahi, Bandung | Siap melayani Anda! 😊', 1, 1, '[\"kontak\",\"contact\",\"telepon\",\"whatsapp\",\"alamat\"]', 'contains', 0, 'Contact information response', NULL, NULL, '2025-06-12 23:19:52', '2025-06-12 23:19:52'),
(5, 'jam operasional', '⏰ **JAM OPERASIONAL** | Senin - Jumat: 08:00 - 17:00 WIB | Sabtu - Minggu: 10:00 - 16:00 WIB | Untuk respon cepat, hubungi WhatsApp kami di 08211990442! 📱', 1, 2, '[\"jam\",\"buka\",\"tutup\",\"operasional\",\"waktu\"]', 'contains', 0, 'Operating hours information', NULL, NULL, '2025-06-12 23:19:52', '2025-06-12 23:19:52'),
(6, 'stok', '📦 **CEK STOK** | Untuk mengecek ketersediaan stok, sebutkan produk yang Anda cari. Contoh: \"stok mounting vario\" atau \"ada lampu projector?\". Stok kami update real-time! ✅', 1, 1, '[\"stock\",\"tersedia\",\"ada\",\"ready\",\"available\"]', 'contains', 0, 'Stock availability inquiry', NULL, NULL, '2025-06-12 23:19:52', '2025-06-12 23:19:52'),
(7, 'produk apa saja', '🛍️ **PRODUK KAMI** | 💡 Lampu & LED | 🏍️ Mounting & Body Kit | ⚙️ Aksesoris Motor | 🔧 Jasa Pemasangan | Semua produk berkualitas tinggi dengan garansi! Mau lihat yang mana?', 1, 2, '[\"produk\",\"katalog\",\"jual\",\"kategori\"]', 'contains', 0, 'Product catalog information', NULL, NULL, '2025-06-12 23:19:52', '2025-06-12 23:19:52'),
(8, 'mounting', '🏍️ **MOUNTING & BODY KIT** | Tersedia mounting carbon untuk berbagai motor matic. Harga mulai Rp 450.000. Presisi tinggi, mudah pasang, garansi kualitas! Mau tanya untuk motor apa?', 1, 2, '[\"mounting\",\"body kit\",\"carbon\"]', 'contains', 0, 'Mounting and body kit information', NULL, NULL, '2025-06-12 23:19:52', '2025-06-12 23:19:52'),
(9, 'lampu', '💡 **LAMPU & LED** | LED headlamp, projector, lampu sein tersedia! Harga mulai Rp 350.000. Terang, hemat listrik, tahan lama. Cocok untuk motor matic dan sport!', 1, 2, '[\"led\",\"projector\",\"headlamp\",\"sein\"]', 'contains', 0, 'Lighting products information', NULL, NULL, '2025-06-12 23:19:52', '2025-06-12 23:19:52'),
(10, 'pemasangan', '🔧 **JASA PEMASANGAN** | Mounting: Rp 50.000 | Body kit: Rp 100.000 | Lampu: Rp 75.000 | Home service +Rp 30.000 | Teknisi berpengalaman, hasil rapi! 👨‍🔧', 1, 2, '[\"pasang\",\"install\",\"service\",\"teknisi\"]', 'contains', 0, 'Installation service information', NULL, NULL, '2025-06-12 23:19:52', '2025-06-12 23:19:52'),
(11, 'pengiriman', '🚚 **PENGIRIMAN** | Bandung-Cimahi: GRATIS ongkir! | Luar kota: Rp 15.000-25.000 | Same day delivery: +Rp 10.000 | COD tersedia area Bandung | Aman & cepat sampai! 📦', 1, 2, '[\"kirim\",\"ongkir\",\"cod\",\"delivery\",\"ekspedisi\"]', 'contains', 0, 'Shipping and delivery information', NULL, NULL, '2025-06-12 23:19:52', '2025-06-12 23:19:52'),
(12, 'promo', '🎉 **PROMO TERBARU** | Bundling mounting + lampu diskon 15%! | Flash sale Jumat 19:00 | Member discount 10% | Follow IG @boyprojects untuk update promo! Ada yang mau ditanya? 🔥', 1, 2, '[\"diskon\",\"sale\",\"discount\",\"murah\"]', 'contains', 0, 'Promotional offers information', NULL, NULL, '2025-06-12 23:19:52', '2025-06-12 23:19:52'),
(13, 'terima kasih', 'Sama-sama! 😊 Senang bisa membantu Anda. Jika ada pertanyaan lain, jangan ragu untuk bertanya ya! Boys Project siap melayani kebutuhan motor Anda! 🏍️✨', 1, 3, '[\"thanks\",\"makasih\",\"terimakasih\"]', 'contains', 0, 'Thank you response', NULL, NULL, '2025-06-12 23:19:52', '2025-06-12 23:19:52');

-- --------------------------------------------------------

--
-- Table structure for table `xxy_k7m2p`
--

CREATE TABLE `xxy_k7m2p` (
  `k1_id` bigint(20) UNSIGNED NOT NULL,
  `qwe_nm` text NOT NULL,
  `rty_em` text NOT NULL,
  `uio_vt` timestamp NULL DEFAULT NULL,
  `asd_ac` tinyint(1) NOT NULL DEFAULT 1,
  `fgh_vf` tinyint(1) NOT NULL DEFAULT 0,
  `jkl_pw` varchar(255) NOT NULL,
  `zxc_rt` varchar(100) DEFAULT NULL,
  `vbn_sc` varchar(8) DEFAULT NULL,
  `nmq_ea` timestamp NULL DEFAULT NULL,
  `wer_ca` timestamp NULL DEFAULT NULL,
  `sdf_ua` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `xxy_k7m2p`
--

INSERT INTO `xxy_k7m2p` (`k1_id`, `qwe_nm`, `rty_em`, `uio_vt`, `asd_ac`, `fgh_vf`, `jkl_pw`, `zxc_rt`, `vbn_sc`, `nmq_ea`, `wer_ca`, `sdf_ua`) VALUES
(1, 'eyJpdiI6ImtPSTNpYm4rZTRpaFNkbDFqL3pFWlE9PSIsInZhbHVlIjoiQ3doRUQya3k3K3JzWElpUEdGVUdzZz09IiwibWFjIjoiNzQ5ODhiMGI2NzU2NWMzOThhMGM3MzAyOGQ0YWJjMDE2NGZlNWE0MzdkNjU3NzlkNDgyNDEzMTEwOWM2ZWZkNCIsInRhZyI6IiJ9', 'eyJpdiI6InpJbWltcEN3cHQrOU1CNFhndmVCc2c9PSIsInZhbHVlIjoiMjAyN1MxdFF0YXJOeC84MDZFRHdZVEg3VFh6K3ZsOGdLUnpncjhMRkl6Z1B1NEhYTXY1K2dxKzVBd2YyN2hJRSIsIm1hYyI6ImFmMjY2ZTMyODQ5ZTQ1Nzg3OTI0Nzc4Zjc5YjM5ZjgyNTEzOTc3N2Q4MDZlZTQyNzU5OTMyZWQ1ZTUyOWRjYmUiLCJ0YWciOiIifQ==', NULL, 1, 1, '$2y$12$.zpIvKxqTc9C//qxLM8gS.1eTauBq9.RNmCTA21xrYmcDrFRfsAfu', NULL, NULL, NULL, '2026-02-03 09:42:15', '2026-02-03 09:42:15');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `fgh_82lm`
--
ALTER TABLE `fgh_82lm`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chat_conversations_customer_id_foreign` (`z1_cid`),
  ADD KEY `chat_conversations_status_created_at_index` (`sdw_st`,`created_at`),
  ADD KEY `chat_conversations_customer_email_index` (`xcv_em`),
  ADD KEY `chat_conversations_admin_id_status_index` (`z1_aid`,`sdw_st`),
  ADD KEY `chat_conversations_resolved_by_foreign` (`dfg_rb`);

--
-- Indexes for table `jkl_23qw`
--
ALTER TABLE `jkl_23qw`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chat_messages_conversation_id_created_at_index` (`mnb_cid`,`created_at`),
  ADD KEY `chat_messages_sender_type_is_read_index` (`vgt_st`,`wsx_ir`),
  ADD KEY `chat_messages_sender_id_foreign` (`vgt_sid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `landing_pages`
--
ALTER TABLE `landing_pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `landing_pages_slug_unique` (`slug`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ml_responses`
--
ALTER TABLE `ml_responses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ml_responses_intent_key_unique` (`intent_key`),
  ADD KEY `ml_responses_auto_response_id_foreign` (`auto_response_id`),
  ADD KEY `ml_responses_created_by_foreign` (`created_by`),
  ADD KEY `ml_responses_updated_by_foreign` (`updated_by`),
  ADD KEY `ml_responses_intent_key_category_is_active_index` (`intent_key`,`category`,`is_active`);

--
-- Indexes for table `mno_9x8w`
--
ALTER TABLE `mno_9x8w`
  ADD PRIMARY KEY (`k2_id`),
  ADD KEY `customers_email_index` (`klj_em`(768)),
  ADD KEY `customers_phone_index` (`qaz_ph`(768));

--
-- Indexes for table `nhy_3m2k`
--
ALTER TABLE `nhy_3m2k`
  ADD PRIMARY KEY (`k4_id`),
  ADD KEY `message_responses_contact_message_id_created_at_index` (`bgt_cmid`,`xsw_ca`),
  ADD KEY `nhy_3m2k_admin_id_foreign` (`vfr_aid`);

--
-- Indexes for table `opt_6k2p`
--
ALTER TABLE `opt_6k2p`
  ADD PRIMARY KEY (`k8_id`),
  ADD KEY `opt_6k2p_prf_pid_foreign` (`prf_pid`);

--
-- Indexes for table `pqr_8x3m`
--
ALTER TABLE `pqr_8x3m`
  ADD PRIMARY KEY (`k5_id`),
  ADD KEY `notifications_type_is_read_index` (`tya_tp`,`kiu_ir`),
  ADD KEY `notifications_user_type_user_id_index` (`plm_ut`,`wer_uid`),
  ADD KEY `notifications_action_type_action_id_index` (`zxc_at`,`vbn_aid`),
  ADD KEY `notifications_created_at_index` (`ujm_ca`);

--
-- Indexes for table `prd_4x7m`
--
ALTER TABLE `prd_4x7m`
  ADD PRIMARY KEY (`k7_id`);

--
-- Indexes for table `predefined_messages`
--
ALTER TABLE `predefined_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `qwe_9k2p`
--
ALTER TABLE `qwe_9k2p`
  ADD PRIMARY KEY (`k6_id`),
  ADD KEY `sessions_user_id_index` (`tyu_uid`),
  ADD KEY `sessions_last_activity_index` (`qwe_la`);

--
-- Indexes for table `rst_7x9m`
--
ALTER TABLE `rst_7x9m`
  ADD PRIMARY KEY (`qwe_em`);

--
-- Indexes for table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `section_contents`
--
ALTER TABLE `section_contents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `section_contents_section_id_foreign` (`section_id`);

--
-- Indexes for table `tgb_5y4v`
--
ALTER TABLE `tgb_5y4v`
  ADD PRIMARY KEY (`k3_id`),
  ADD KEY `contact_messages_customer_id_foreign` (`yhn_cid`),
  ADD KEY `contact_messages_admin_id_foreign` (`ujm_aid`);

--
-- Indexes for table `val_9m3q`
--
ALTER TABLE `val_9m3q`
  ADD PRIMARY KEY (`k9_id`),
  ADD KEY `val_9m3q_opv_oid_foreign` (`opv_oid`);

--
-- Indexes for table `wer_72qp`
--
ALTER TABLE `wer_72qp`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chatbot_auto_responses_created_by_foreign` (`pol_cb`),
  ADD KEY `chatbot_auto_responses_updated_by_foreign` (`ijn_ub`),
  ADD KEY `chatbot_auto_responses_is_active_priority_index` (`wsx_ia`,`vbn_pr`),
  ADD KEY `chatbot_auto_responses_match_type_index` (`sdf_mt`),
  ADD KEY `chatbot_auto_responses_keyword_index` (`tyu_kw`);

--
-- Indexes for table `xxy_k7m2p`
--
ALTER TABLE `xxy_k7m2p`
  ADD PRIMARY KEY (`k1_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fgh_82lm`
--
ALTER TABLE `fgh_82lm`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jkl_23qw`
--
ALTER TABLE `jkl_23qw`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `landing_pages`
--
ALTER TABLE `landing_pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `ml_responses`
--
ALTER TABLE `ml_responses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `mno_9x8w`
--
ALTER TABLE `mno_9x8w`
  MODIFY `k2_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `nhy_3m2k`
--
ALTER TABLE `nhy_3m2k`
  MODIFY `k4_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `opt_6k2p`
--
ALTER TABLE `opt_6k2p`
  MODIFY `k8_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pqr_8x3m`
--
ALTER TABLE `pqr_8x3m`
  MODIFY `k5_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `prd_4x7m`
--
ALTER TABLE `prd_4x7m`
  MODIFY `k7_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `predefined_messages`
--
ALTER TABLE `predefined_messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `section_contents`
--
ALTER TABLE `section_contents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `tgb_5y4v`
--
ALTER TABLE `tgb_5y4v`
  MODIFY `k3_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `val_9m3q`
--
ALTER TABLE `val_9m3q`
  MODIFY `k9_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `wer_72qp`
--
ALTER TABLE `wer_72qp`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `xxy_k7m2p`
--
ALTER TABLE `xxy_k7m2p`
  MODIFY `k1_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ml_responses`
--
ALTER TABLE `ml_responses`
  ADD CONSTRAINT `ml_responses_auto_response_id_foreign` FOREIGN KEY (`auto_response_id`) REFERENCES `wer_72qp` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `ml_responses_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `xxy_k7m2p` (`k1_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `ml_responses_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `xxy_k7m2p` (`k1_id`) ON DELETE SET NULL;

--
-- Constraints for table `opt_6k2p`
--
ALTER TABLE `opt_6k2p`
  ADD CONSTRAINT `opt_6k2p_prf_pid_foreign` FOREIGN KEY (`prf_pid`) REFERENCES `prd_4x7m` (`k7_id`) ON DELETE CASCADE;

--
-- Constraints for table `section_contents`
--
ALTER TABLE `section_contents`
  ADD CONSTRAINT `section_contents_section_id_foreign` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tgb_5y4v`
--
ALTER TABLE `tgb_5y4v`
  ADD CONSTRAINT `contact_messages_admin_id_foreign` FOREIGN KEY (`ujm_aid`) REFERENCES `xxy_k7m2p` (`k1_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `contact_messages_customer_id_foreign` FOREIGN KEY (`yhn_cid`) REFERENCES `mno_9x8w` (`k2_id`) ON DELETE CASCADE;

--
-- Constraints for table `val_9m3q`
--
ALTER TABLE `val_9m3q`
  ADD CONSTRAINT `val_9m3q_opv_oid_foreign` FOREIGN KEY (`opv_oid`) REFERENCES `opt_6k2p` (`k8_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
