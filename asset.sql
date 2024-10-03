



CREATE TABLE `businesses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_Name` varchar(255) NOT NULL,
  `middle_Name` varchar(255) DEFAULT NULL,
  `last_Name` varchar(255) NOT NULL,
    `business_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `asset_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `business_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



CREATE TABLE `user_assets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `business_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `serial_number` varchar(255) NOT NULL,
  `is_working` tinyint(1) NOT NULL,
  `status` enum('available','assigned','returned','damaged','lost','reserved','repair_waiting') NOT NULL DEFAULT 'available',
  `type` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `date` date NOT NULL,
  `note` text NOT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



CREATE TABLE `user_asset_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_asset_id` bigint(20) UNSIGNED DEFAULT NULL,
  `business_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `serial_number` varchar(255) NOT NULL,
  `is_working` tinyint(1) NOT NULL,
  `status` enum('available','assigned','returned','damaged','lost','reserved','repair_waiting') NOT NULL DEFAULT 'available',
  `type` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `date` date NOT NULL,
  `note` text NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
