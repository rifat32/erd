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




CREATE TABLE `banks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `business_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
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


CREATE TABLE `payment_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



CREATE TABLE `payrolls` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `payroll_name` varchar(255) NOT NULL,
  `payrun_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `total_holiday_hours` double DEFAULT NULL,
  `total_paid_leave_hours` double DEFAULT NULL,
  `total_regular_attendance_hours` double DEFAULT NULL,
  `total_overtime_attendance_hours` double DEFAULT NULL,
  `regular_hours` double DEFAULT NULL,
  `overtime_hours` double DEFAULT NULL,
  `total_holiday_hours_salary` double DEFAULT NULL,
  `leave_hours_salary` double DEFAULT NULL,
  `regular_attendance_hours_salary` double DEFAULT NULL,
  `overtime_attendance_hours_salary` double DEFAULT NULL,
  `regular_hours_salary` double DEFAULT NULL,
  `overtime_hours_salary` double DEFAULT NULL,
  `status` enum('pending_approval','approved','rejected') NOT NULL DEFAULT 'pending_approval',
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `business_id` bigint(20) UNSIGNED NOT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



CREATE TABLE `payroll_attendances` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `payroll_id` bigint(20) UNSIGNED NOT NULL,
  `attendance_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payroll_holidays`
--

CREATE TABLE `payroll_holidays` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `payroll_id` bigint(20) UNSIGNED NOT NULL,
  `holiday_id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `hours` double NOT NULL,
  `hourly_salary` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payroll_leave_records`
--

CREATE TABLE `payroll_leave_records` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `payroll_id` bigint(20) UNSIGNED NOT NULL,
  `leave_record_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payruns`
--

CREATE TABLE `payruns` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `period_type` enum('weekly','monthly','customized') NOT NULL DEFAULT 'weekly',
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `consider_type` enum('hour','daily_log','none') NOT NULL,
  `consider_overtime` tinyint(1) NOT NULL,
  `notes` text DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `business_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `generating_type` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



CREATE TABLE `payslips` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `payroll_id` bigint(20) UNSIGNED DEFAULT NULL,
  `payment_method` enum('bank_transfer','cash','cheque','other') NOT NULL,
  `month` int(11) NOT NULL,
  `year` int(11) NOT NULL,
  `payment_amount` double NOT NULL,
  `payment_notes` text DEFAULT NULL,
  `payment_date` date NOT NULL,
  `payslip_file` varchar(255) DEFAULT NULL,
  `payment_record_file` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`payment_record_file`)),
  `gross_pay` double NOT NULL DEFAULT 0,
  `tax` double NOT NULL DEFAULT 0,
  `employee_ni_deduction` double NOT NULL DEFAULT 0,
  `employer_ni` double NOT NULL DEFAULT 0,
  `bank_id` bigint(20) UNSIGNED DEFAULT NULL,
  `sort_code` varchar(255) DEFAULT NULL,
  `account_number` varchar(255) DEFAULT NULL,
  `account_name` varchar(255) DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



CREATE TABLE `setting_payruns` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `payrun_period` enum('monthly','weekly') NOT NULL,
  `consider_type` enum('hour','daily_log','none') NOT NULL,
  `consider_overtime` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `business_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `setting_payslips` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `logo` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `business_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `social_sites`
--


CREATE TABLE `holidays` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` enum('pending_approval','in_progress','approved','rejected') NOT NULL DEFAULT 'pending_approval',
  `description` text DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `repeats_annually` tinyint(1) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `business_id` bigint(20) UNSIGNED NOT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE `leaves` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `leave_duration` enum('single_day','multiple_day','half_day','hours') NOT NULL,
  `day_type` enum('first_half','last_half') DEFAULT NULL,
  `leave_type_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `date` date DEFAULT NULL,
  `note` varchar(255) NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `status` enum('pending_approval','in_progress','approved','rejected') NOT NULL DEFAULT 'pending_approval',
  `hourly_rate` double NOT NULL,
  `attachments` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`attachments`)),
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `business_id` bigint(20) UNSIGNED NOT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `leave_records` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `leave_id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `capacity_hours` double NOT NULL,
  `leave_hours` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

