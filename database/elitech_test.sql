-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 16, 2025 at 03:51 AM
-- Server version: 8.0.30
-- PHP Version: 8.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `elitech_test`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id` bigint UNSIGNED NOT NULL,
  `kode_barang` char(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_barang` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `satuan` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stok_awal` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id`, `kode_barang`, `nama_barang`, `satuan`, `stok_awal`, `created_at`, `updated_at`) VALUES
(1, 'BRG-001', 'UPS', 'unit', 60, '2025-10-30 20:10:32', '2025-11-14 20:34:24'),
(2, 'BRG-002', 'Apron', 'lembar', 60, '2025-10-30 20:51:41', '2025-11-14 20:51:41'),
(3, 'BRG-003', 'Timbangan', 'unit', 40, '2025-10-30 20:54:33', '2025-11-14 20:54:33'),
(4, 'BRG-004', 'Masker', 'box', 45, '2025-10-30 20:58:31', '2025-11-14 20:58:31'),
(5, 'BRG-005', 'Gunting', 'pcs', 20, '2025-10-30 21:00:07', '2025-11-14 21:00:07'),
(6, 'BRG-006', 'Klorin', 'kg', 15, '2025-10-30 21:02:12', '2025-11-14 21:02:12'),
(7, 'BRG-007', 'handuk', 'buah', 35, '2025-10-31 06:45:01', '2025-11-15 06:45:01'),
(8, 'BRG-008', 'Tensi Meter', 'unit', 25, '2025-10-31 06:45:42', '2025-11-15 06:45:42'),
(9, 'BRG-009', 'Stetoskop', 'unit', 15, '2025-10-31 06:46:40', '2025-11-15 06:46:40'),
(11, 'BRG-010', 'Botol', 'pcs', 20, '2025-10-31 12:46:56', '2025-11-15 12:46:56'),
(12, 'BRG-011', 'Lampu Bohlam', 'buah', 30, '2025-10-31 12:55:02', '2025-11-15 12:55:02');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_11_14_140834_create_barang_table', 1),
(5, '2025_11_14_140900_create_transaksi_table', 1),
(6, '2025_11_14_151112_create_personal_access_tokens_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'ApiToken', 'b614505b084a3ce437d4507a04abf9864a9af78c733a46ff6b78a9ee59051368', '[\"*\"]', '2025-11-14 10:29:53', NULL, '2025-11-14 10:27:32', '2025-11-14 10:29:53'),
(2, 'App\\Models\\User', 1, 'ApiToken', '88fb1388d68aa16efb603c16014b20ece50680835591a987b369e21e61cb3938', '[\"*\"]', '2025-11-15 00:15:44', NULL, '2025-11-14 12:40:16', '2025-11-15 00:15:44'),
(3, 'App\\Models\\User', 1, 'ApiToken', 'ce8c40fc35c2ca1627a4eaa1c6311008305b4b91372d98448934b62dd581cdf9', '[\"*\"]', '2025-11-14 13:25:34', NULL, '2025-11-14 13:06:05', '2025-11-14 13:25:34'),
(4, 'App\\Models\\User', 1, 'ApiToken', '4cc3e2dbef55628b054980006bf5ea6c5ae05087077b91ca1351725850a7e6dc', '[\"*\"]', '2025-11-14 13:59:56', NULL, '2025-11-14 13:59:55', '2025-11-14 13:59:56'),
(5, 'App\\Models\\User', 1, 'ApiToken', '8d0fd2f9dec8b0c72f9bfc5c1d64f36c6a448a8edb6badeaa6a970a8cd25d848', '[\"*\"]', '2025-11-15 06:46:40', NULL, '2025-11-14 16:29:34', '2025-11-15 06:46:40'),
(6, 'App\\Models\\User', 1, 'ApiToken', '4dbdabe88da1c1409b5e0f3c9242d5b824108bbe5b7ab4deef791a23429c9e6d', '[\"*\"]', '2025-11-15 00:17:57', NULL, '2025-11-15 00:17:55', '2025-11-15 00:17:57'),
(7, 'App\\Models\\User', 1, 'ApiToken', 'dea0badb65d95b969c4afed5d16bc8128af92c1cb59b7995170c5b5078b4f179', '[\"*\"]', '2025-11-15 10:58:24', NULL, '2025-11-15 00:18:37', '2025-11-15 10:58:24'),
(8, 'App\\Models\\User', 1, 'ApiToken', '8c276451ff13937d47d694e94fa39f4e8e568fe0abf109f312857c891e145320', '[\"*\"]', '2025-11-15 00:19:23', NULL, '2025-11-15 00:19:22', '2025-11-15 00:19:23'),
(9, 'App\\Models\\User', 1, 'ApiToken', 'c4a5207e491b8641b33c01055f3b91a64b341cb41d076e5d6259fa6028d6e211', '[\"*\"]', '2025-11-15 05:54:57', NULL, '2025-11-15 00:21:06', '2025-11-15 05:54:57'),
(10, 'App\\Models\\User', 1, 'ApiToken', '5ad90e598f1c74bb7e565c11820c44928edbcc7c4816b5b46e7e912f6562f62c', '[\"*\"]', '2025-11-15 06:21:19', NULL, '2025-11-15 05:55:13', '2025-11-15 06:21:19'),
(11, 'App\\Models\\User', 1, 'ApiToken', 'f56979c49457288f231f42256b1c0af8316ec86073bcc085c89a24760a73f240', '[\"*\"]', '2025-11-15 08:30:49', NULL, '2025-11-15 06:48:02', '2025-11-15 08:30:49'),
(12, 'App\\Models\\User', 1, 'ApiToken', 'a12d4ad73344a59b7766d106ccd731ef50cce2cb3b67c1604c4a76191e23e6df', '[\"*\"]', '2025-11-15 08:46:38', NULL, '2025-11-15 08:36:56', '2025-11-15 08:46:38'),
(13, 'App\\Models\\User', 1, 'ApiToken', 'b6daef79f285eed47411912cc9528f89ebb66883e648ce2f73f0c6051b262a28', '[\"*\"]', '2025-11-15 12:33:15', NULL, '2025-11-15 10:58:46', '2025-11-15 12:33:15'),
(14, 'App\\Models\\User', 1, 'ApiToken', '134299944b024eebc98f42ad48510b6368633dfc11afdcb8f23588de7ad467f0', '[\"*\"]', '2025-11-15 20:21:20', NULL, '2025-11-15 12:33:29', '2025-11-15 20:21:20'),
(15, 'App\\Models\\User', 1, 'ApiToken', '97de1afd90aa159121e94a988db0b485c29b4bd1de101f9294b7a4081a689d66', '[\"*\"]', '2025-11-15 20:21:40', NULL, '2025-11-15 20:21:39', '2025-11-15 20:21:40'),
(16, 'App\\Models\\User', 1, 'ApiToken', 'ff575d6262b8974628ac95adb1dbf910286df06ab6ca491192e6af38407e00fd', '[\"*\"]', '2025-11-15 20:23:10', NULL, '2025-11-15 20:23:01', '2025-11-15 20:23:10');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id` bigint UNSIGNED NOT NULL,
  `id_barang` bigint UNSIGNED NOT NULL,
  `tanggal` date NOT NULL,
  `jumlah` int NOT NULL,
  `tipe_transaksi` enum('masuk','keluar') COLLATE utf8mb4_unicode_ci NOT NULL,
  `keterangan` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id`, `id_barang`, `tanggal`, `jumlah`, `tipe_transaksi`, `keterangan`, `created_at`, `updated_at`) VALUES
(1, 1, '2025-11-15', 5, 'masuk', 'Barang masuk dari supplier', '2025-11-14 21:17:00', '2025-11-14 21:17:00'),
(2, 1, '2025-11-06', 3, 'keluar', 'Barang keluar ke toko', '2025-11-14 21:20:14', '2025-11-14 21:20:14'),
(3, 1, '2025-11-09', 10, 'keluar', 'rusak', '2025-11-14 21:40:45', '2025-11-14 21:40:45'),
(10, 2, '2025-11-01', 15, 'masuk', 'Suplier Masuk', '2025-11-15 13:00:57', '2025-11-15 13:00:57'),
(11, 2, '2025-11-11', 5, 'keluar', 'Terjual', '2025-11-15 13:03:22', '2025-11-15 13:03:22'),
(12, 3, '2025-11-01', 13, 'masuk', 'Pembelian', '2025-11-15 13:04:03', '2025-11-15 13:04:03'),
(13, 3, '2025-11-12', 4, 'keluar', 'Terjual', '2025-11-15 13:04:27', '2025-11-15 13:04:27'),
(14, 4, '2025-11-01', 36, 'keluar', 'Terjual', '2025-11-15 13:05:36', '2025-11-15 13:05:36'),
(17, 2, '2025-11-07', 3, 'keluar', NULL, '2025-11-15 19:32:04', '2025-11-15 19:32:04'),
(18, 4, '2025-11-10', 6, 'masuk', NULL, '2025-11-15 19:34:30', '2025-11-15 19:34:30'),
(19, 8, '2025-11-12', 7, 'masuk', NULL, '2025-11-15 20:15:19', '2025-11-15 20:15:19'),
(20, 1, '2025-11-01', 2, 'masuk', NULL, '2025-11-15 20:16:27', '2025-11-15 20:16:27'),
(21, 5, '2025-11-08', 3, 'keluar', NULL, '2025-11-15 20:17:27', '2025-11-15 20:17:27');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Pangestu Siagian', 'admin@gmail.com', NULL, '$2y$12$Hh/2ydL7.tO9T0FXbZERl.a3K24UrV7Ptzfm9m79cnBwLCENNkI7m', NULL, '2025-11-14 09:20:12', '2025-11-14 09:20:12');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `barang_kode_barang_unique` (`kode_barang`);

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
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  ADD KEY `personal_access_tokens_expires_at_index` (`expires_at`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaksi_id_barang_foreign` (`id_barang`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `barang`
--
ALTER TABLE `barang`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_id_barang_foreign` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
