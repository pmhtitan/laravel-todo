-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 01-12-2021 a las 22:18:29
-- Versión del servidor: 5.7.26
-- Versión de PHP: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `laravel_todo`
--
CREATE DATABASE IF NOT EXISTS `laravel_todo` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `laravel_todo`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2021_07_07_164301_create_sessions_table', 1),
(7, '2021_07_07_164634_create_tasks_table', 1),
(8, '2021_07_27_142152_add_googleid_users', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('pmhtitan@gmail.com', '$2y$10$EtsxDQiFkkZIBOc0s..e2uooYkXf288RaXB7rCtBcGepX1twqEzKW', '2021-07-12 15:08:25');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sessions`
--

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('vYDYCNo7Lxz7l5iWcbActfX4Tt8PQDJoGrR6c4tx', NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiZHA0TDIyWUpnaVZ1eHBXNU53Wll0elJmS2gySnlVYnVSb2FlU2wyTyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly90b2RvLWxhcmF2ZWwuZGV2ZWxvcDo4MDgzL3JlZGlyZWN0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czozNzoiaHR0cDovL3RvZG8tbGFyYXZlbC5kZXZlbG9wOjgwODMvaG9tZSI7fXM6NToic3RhdGUiO3M6NDA6InZyRFB5STNkWElja2pES1FRNDdyVm1lTmwzdU5kcjJIVjVVT0YyTFAiO30=', 1635098826),
('54NnIBBYzL146b1CKIrOBNkHCTFspQQm4s8ue8Ta', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTFZicjJRYWdzRzhENHZqYTg4ZG5RVHlseVJwOVlZRnhJdWpCQXdITyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fX0=', 1635099469),
('GT1pmHqGheVugBJ9gWJOjEH2W5Tk4HWDQ48TbVoC', NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiVTlUdlZWeGtUQUVvOGZwTDJPTWlZUWxaMWRhbFoydXMyYlVzOGNXUiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly90b2RvLWxhcmF2ZWwuZGV2ZWxvcDo4MDgzL2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czozNzoiaHR0cDovL3RvZG8tbGFyYXZlbC5kZXZlbG9wOjgwODMvaG9tZSI7fX0=', 1638396975);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tasks`
--

DROP TABLE IF EXISTS `tasks`;
CREATE TABLE IF NOT EXISTS `tasks` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tasks_user_id_index` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tasks`
--

INSERT INTO `tasks` (`id`, `description`, `user_id`, `created_at`, `updated_at`) VALUES
(4, 'Tarea numero 2', 13, '2021-07-16 14:44:58', '2021-07-19 15:11:23'),
(3, 'Tarea numero 1', 13, '2021-07-16 14:44:51', '2021-07-16 14:44:51');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `profile_photo_path` varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `google_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `remember_token`, `current_team_id`, `profile_photo_path`, `created_at`, `updated_at`, `google_id`) VALUES
(1, 'Bolto Ademonium', 'adam@hotler.com', NULL, '$2y$10$LpefUvdukxYz1KY6UJSVjeJOwCBKMtBDpe/BYnkk8Wvo5acGEq.Vy', NULL, NULL, NULL, NULL, NULL, '2021-07-07 14:51:49', '2021-07-07 14:51:49', NULL),
(13, 'PMH', 'pmhtitan@gmail.com', '2021-07-12 13:30:06', '$2y$10$Q27BpqsTsIDt2vu9izngrunzI/H7BbeKn9cutR8o9NbfaqxO3mleO', 'eyJpdiI6InY5eFpMblJvdDhsQi83ZGtZZDRqMnc9PSIsInZhbHVlIjoiNDRTbjVsMWZOMnlwejZLdFFLMU1kcFQ5Tld4Y3IzZk1lUTcya21kVUZMYz0iLCJtYWMiOiIyNGQ3NWMyNGIxODQzYTE5NWRlNTNjYmIwOWRlN2ZhN2QwNzMyNmMxOTAwODZjNjU2OGQyMTk4OTMxNGI4MjljIn0=', 'eyJpdiI6Im96U1lnQ3ZuT0dNY2FadHdVNzRwYVE9PSIsInZhbHVlIjoiVnd3eCtqZkFNMUdUaGNyWW9nbWZSYWcrZGpPOW5jQ0o5dVRPUVJuMVhXT2lQS2xkTGpmYnBWZHc1cUx6ZFhVMzJKbUZJbGR4eGk4T2YvWEJweE00d3FDbEV6WXhZMzUwa3RvUTNmZzhmNkdnOTYvNzlBamp4aERsUHJSUkxkQTJKUHlMMTlBV1FnNmdsRzd3TmFHNUM3bi83RUJrTDZ2WFRtWlNYT1YvL0N6TlhNbnhvOGQ4YmNvU1AwQWovVVlkUjRaYXdFTkJCVTM5Ukc3NlpJK0JRcU1ka21xTExTUkNsdDNFOERDODAyaWRMc1A0TjZlTzRRNHkyR3kwcmQxaEl0aGQ0Y1lyVEhuVHZqTUJzdk04S3c9PSIsIm1hYyI6IjljMDNiN2VkNWJhZDhkM2UxNDc0N2EzMzAyNzJhZjdmM2ViYzBhNjYzNDc3Y2EyNjFiOTVkYWZhNTJkNGFkMWUifQ==', '80zySidbOk58dMswxxIQxAAJKWVeclnHzb6BG1WwjJgiDGqsQ3CYs9hlLJWY', NULL, NULL, '2021-07-12 13:28:04', '2021-07-28 15:02:25', '116990831223657939152'),
(19, 'Testerus', 'testerus64@gmail.com', '2021-07-28 15:07:09', '$2y$10$6fVYLe5jBHe3Nv6ZLoyO1.y4u.oFUAUZaT9WiOFb/PYMyUhFwnKUm', NULL, NULL, NULL, NULL, NULL, '2021-07-28 15:06:13', '2021-07-28 15:07:09', NULL),
(20, 'Pablo Moras', 'pablomprogram@gmail.com', '2021-07-28 15:09:13', 'eyJpdiI6IkNUQVUvYXcxbVBEd0I3NWJFQVhMdmc9PSIsInZhbHVlIjoic1djYnRNb0VOVE1GWWdvaEcyTEU1bEZjUTN1VTU1NFFjeXRWZGxUYzF2WT0iLCJtYWMiOiIyYjM5MjJhNDYzNmVhZmRiMDU1OTM5ZjhlODU3NmJlMjI0YjE1MjM1YmY3NDNmN2MyMGE4OTEyODM5MTE1ZjQ4In0=', NULL, NULL, NULL, NULL, NULL, '2021-07-28 15:09:13', '2021-07-28 15:09:13', '108623780168949346523');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
