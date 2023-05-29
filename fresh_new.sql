-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 27, 2023 at 04:52 PM
-- Server version: 8.0.32-0ubuntu0.20.04.2
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fresh_new`
--

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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_05_27_055431_create_posts_table', 2),
(6, '2023_05_27_061835_alter_created_by_to_posts', 3),
(7, '2023_05_27_062648_alter_approved_by_to_posts', 3);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
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
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('Approved','Rejected') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint UNSIGNED DEFAULT NULL,
  `approved_by` bigint UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `description`, `status`, `created_at`, `updated_at`, `created_by`, `approved_by`) VALUES
(1, 'Vapor: Farewell to Debug Logs', 'When Vapor handles incoming HTTP requests or queued jobs, it writes debug information to your CloudWatch logs. This includes logging when your application\'s configuration is cached, environment variables are decrypted, FPM status, and more. Rarely, these logs can assist in debugging problems with your application, but most of the time they are simply added noise.', 'Approved', '2023-05-27 02:45:38', '2023-05-27 07:18:15', 2, 3),
(2, 'Forge: Deployment Webhook Improvements', 'Laravel Forge\'s \"quick deploy\" feature gives your team a seamless push-to-deploy experience. Whenever new code is pushed to your deployed branch, Forge will kick off a new deployment. This ensures that your site is always running your project\'s latest code. Forge will also display the commit information in the \"Deployments\" table, so you can keep track of what was deployed, and when.\n\nUnfortunately, projects triggering deployments via the \"Deployment Trigger\" URL or using a custom source control provider could not take full advantage of this feature - until now.', 'Approved', '2023-05-27 02:49:04', '2023-05-27 07:17:53', 1, 3),
(3, 'Vapor: Queue Management', 'To get started, head over to any environment in your Vapor account and navigate to the \"Queues\" tab. Here, you see a snapshot of your queue performance including the number of jobs processed, in flight jobs, and failed jobs over time. Of course, you may refine the results by selecting a specific queue and period.', 'Approved', '2023-05-27 02:52:58', '2023-05-27 07:20:16', 3, 3),
(4, 'Forge: Dark Mode', 'Dark mode is a must-have feature for many developers and anyone who uses it often knows just how jarring it is when you\'re thrown into an application or website that doesn\'t support it.', 'Approved', '2023-05-27 08:37:39', '2023-05-27 08:39:02', 4, 1),
(5, 'Vapor: Introducing Custom Asset Domains', 'Vapor serves assets from CloudFront, the AWS content delivery network (CDN), which results in asset URLs in the format https://d37avf8eihbcxt.cloudfront.net/....', 'Approved', '2023-05-27 08:40:47', '2023-05-27 08:46:11', 2, 3),
(6, 'Vapor: Managing DNS', 'Vapor is a serverless deployment platform for Laravel that strives to making deploying and scaling your Laravel project easier than ever. In this post, we\'ll discuss the different approaches to managing DNS when attaching a custom domain to your Vapor project.', 'Approved', '2023-05-27 08:48:30', '2023-05-27 08:49:27', 5, 3);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `role`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Akhil', 'akhil@gmail.com', 'admin', NULL, '$2y$10$8Wn5ZWqJovydG9ksn8wTZOOc2MQvsG7J.7lkYGkxw9z3ekDA8RoOi', NULL, '2023-05-27 01:25:28', '2023-05-27 01:25:28'),
(2, 'Athira', 'athira@gmail.com', 'student', NULL, '$2y$10$OAG8W/tTorgNb3ktCBBoI.x0IgpjtueOdVBsxdIZvuzlZPKQt/Fuy', NULL, '2023-05-27 01:41:37', '2023-05-27 06:23:00'),
(3, 'Anvi', 'anvi@gmail.com', 'teacher', NULL, '$2y$10$/.T5k6pc05fPq6BLxfg7u..Ta6n0k7PxJNcfipoWtNm/IIv5l7yMK', NULL, '2023-05-27 01:42:23', '2023-05-27 01:42:23'),
(4, 'Aswathy', 'aswathy@gmail.com', 'student', NULL, '$2y$10$OmQVHDMqO5d2YEPBECOmDuRU4hX2Bw6GlR6pL6TcDXTmefCWks33S', NULL, '2023-05-27 07:52:52', '2023-05-27 07:52:52'),
(5, 'Rincy', 'rincy@gmail.com', 'student', NULL, '$2y$10$pk3Rn5UOI7wpCP7YanmgHe2fEsMfMlrO1WY.00zmQmryvT3Jn6aly', NULL, '2023-05-27 08:47:42', '2023-05-27 08:47:42');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `posts_created_by_foreign` (`created_by`),
  ADD KEY `posts_approved_by_foreign` (`approved_by`);

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
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_approved_by_foreign` FOREIGN KEY (`approved_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `posts_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
