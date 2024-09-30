

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_Name` varchar(255) NOT NULL,
  `middle_Name` varchar(255) DEFAULT NULL,
  `last_Name` varchar(255) NOT NULL,
  `NI_number` varchar(255) DEFAULT NULL,
  `pension_eligible` tinyint(1) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `emergency_contact_details` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`emergency_contact_details`)),
  `color_theme_name` varchar(255) NOT NULL DEFAULT 'default',
  `user_id` varchar(255) DEFAULT NULL,
  `gender` enum('male','female','other') DEFAULT NULL,
  `is_in_employee` tinyint(1) DEFAULT 0,
  `designation_id` bigint(20) UNSIGNED DEFAULT NULL,
  `employment_status_id` bigint(20) UNSIGNED DEFAULT NULL,
  `joining_date` date DEFAULT '2024-08-03',
  `date_of_birth` date DEFAULT NULL,
  `salary_per_annum` double DEFAULT 0,
  `weekly_contractual_hours` double DEFAULT 0,
  `minimum_working_days_per_week` int(11) DEFAULT 0,
  `overtime_rate` double DEFAULT 0,
  `is_active_visa_details` double DEFAULT 0,
  `is_active_right_to_works` double DEFAULT 0,
  `phone` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `address_line_1` varchar(255) DEFAULT NULL,
  `address_line_2` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `postcode` varchar(255) DEFAULT NULL,
  `lat` varchar(255) DEFAULT NULL,
  `long` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `email_verify_token` varchar(255) DEFAULT NULL,
  `email_verify_token_expires` varchar(255) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `resetPasswordToken` varchar(255) DEFAULT NULL,
  `resetPasswordExpires` varchar(255) DEFAULT NULL,
  `site_redirect_token` varchar(255) DEFAULT NULL,
  `login_attempts` int(11) NOT NULL DEFAULT 0,
  `last_failed_login_attempt_at` datetime DEFAULT NULL,
  `background_image` varchar(255) DEFAULT NULL,
  `immigration_status` enum('british_citizen','ilr','immigrant','sponsored') DEFAULT NULL,
  `is_sponsorship_offered` tinyint(1) DEFAULT 0,
  `recruitment_process_id` bigint(20) UNSIGNED DEFAULT NULL,
  `bank_id` bigint(20) UNSIGNED DEFAULT NULL,
  `sort_code` varchar(255) DEFAULT NULL,
  `account_number` varchar(255) DEFAULT NULL,
  `account_name` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `business_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `stripe_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE `work_locations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `is_location_enabled` tinyint(1) NOT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `is_geo_location_enabled` tinyint(1) NOT NULL,
  `is_ip_enabled` tinyint(1) NOT NULL,
  `max_radius` double DEFAULT NULL,
  `ip_address` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `business_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



CREATE TABLE `attendances` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `note` text DEFAULT NULL,
  `in_geolocation` varchar(255) DEFAULT NULL,
  `out_geolocation` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `work_location_id` bigint(20) UNSIGNED NOT NULL,
  `in_date` date NOT NULL,
  `does_break_taken` tinyint(1) NOT NULL,
  `is_present` tinyint(1) NOT NULL,
  `capacity_hours` double NOT NULL,
  `behavior` enum('absent','late','regular','early') NOT NULL,
  `work_hours_delta` double NOT NULL,
  `regular_work_hours` double NOT NULL,
  `total_paid_hours` double NOT NULL,
  `break_type` enum('paid','unpaid') NOT NULL,
  `break_hours` double NOT NULL,
  `is_weekend` tinyint(1) NOT NULL,
  `holiday_id` bigint(20) UNSIGNED DEFAULT NULL,
  `leave_record_id` bigint(20) UNSIGNED DEFAULT NULL,
  `overtime_hours` double NOT NULL,
  `work_shift_start_at` time DEFAULT NULL,
  `work_shift_end_at` time DEFAULT NULL,
  `work_shift_history_id` bigint(20) UNSIGNED NOT NULL,
  `punch_in_time_tolerance` double DEFAULT NULL,
  `status` enum('pending_approval','approved','rejected') NOT NULL DEFAULT 'pending_approval',
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `business_id` bigint(20) UNSIGNED NOT NULL,
  `regular_hours_salary` double NOT NULL,
  `overtime_hours_salary` double NOT NULL,
  `attendance_records` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`attendance_records`)),
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `contractual_hours` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `attendance_projects` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `attendance_id` bigint(20) UNSIGNED NOT NULL,
  `project_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



-- --------------------------------------------------------

--
-- Table structure for table `attendance_histories`
--

CREATE TABLE `attendance_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `attendance_id` bigint(20) UNSIGNED DEFAULT NULL,
  `actor_id` bigint(20) UNSIGNED DEFAULT NULL,
  `action` varchar(255) NOT NULL,
  `attendance_created_at` date NOT NULL,
  `attendance_updated_at` date NOT NULL,
  `note` text DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `ip_address` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `work_location_id` bigint(20) UNSIGNED NOT NULL,
  `project_ids` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`project_ids`)),
  `in_date` date NOT NULL,
  `does_break_taken` tinyint(1) NOT NULL,
  `is_present` tinyint(1) NOT NULL,
  `capacity_hours` double NOT NULL,
  `behavior` enum('absent','late','regular','early') NOT NULL,
  `work_hours_delta` double NOT NULL,
  `regular_work_hours` double NOT NULL,
  `total_paid_hours` double NOT NULL,
  `break_type` enum('paid','unpaid') NOT NULL,
  `break_hours` double NOT NULL,
  `is_weekend` tinyint(1) NOT NULL,
  `holiday_id` bigint(20) UNSIGNED DEFAULT NULL,
  `leave_record_id` bigint(20) UNSIGNED DEFAULT NULL,
  `overtime_hours` double NOT NULL,
  `work_shift_start_at` time DEFAULT NULL,
  `work_shift_end_at` time DEFAULT NULL,
  `work_shift_history_id` bigint(20) UNSIGNED NOT NULL,
  `punch_in_time_tolerance` double DEFAULT NULL,
  `status` enum('pending_approval','approved','rejected') NOT NULL DEFAULT 'pending_approval',
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `business_id` bigint(20) UNSIGNED NOT NULL,
  `regular_hours_salary` double NOT NULL,
  `overtime_hours_salary` double NOT NULL,
  `attendance_records` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`attendance_records`)),
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `in_geolocation` varchar(255) DEFAULT NULL,
  `out_geolocation` varchar(255) DEFAULT NULL,
  `contractual_hours` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `attendance_history_projects` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `attendance_id` bigint(20) UNSIGNED NOT NULL,
  `project_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `attendance_arrears` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `attendance_id` bigint(20) UNSIGNED NOT NULL,
  `status` enum('pending_approval','approved','rejected','completed') NOT NULL DEFAULT 'pending_approval',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `setting_attendances` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `punch_in_time_tolerance` double DEFAULT NULL,
  `work_availability_definition` int(11) DEFAULT NULL,
  `punch_in_out_alert` tinyint(1) DEFAULT NULL,
  `punch_in_out_interval` int(11) DEFAULT NULL,
  `alert_area` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`alert_area`)),
  `service_name` varchar(255) DEFAULT NULL,
  `api_key` text DEFAULT NULL,
  `auto_approval` tinyint(1) DEFAULT NULL,
  `is_geolocation_enabled` tinyint(1) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `business_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `setting_attendance_special_roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `setting_attendance_id` bigint(20) UNSIGNED DEFAULT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `setting_attendance_special_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `setting_attendance_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `setting_leaves`
--