
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";





CREATE TABLE `departments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `manager_id` bigint(20) UNSIGNED DEFAULT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `business_id` bigint(20) UNSIGNED NOT NULL,
  `work_location_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;








CREATE TABLE `system_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `self_registration_enabled` tinyint(1) NOT NULL DEFAULT 1,
  `STRIPE_KEY` text DEFAULT NULL,
  `STRIPE_SECRET` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_frontend_setup` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;









ALTER TABLE `access_revocations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `access_revocations_user_id_foreign` (`user_id`);

--
-- Indexes for table `announcements`
--
ALTER TABLE `announcements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `announcements_business_id_foreign` (`business_id`),
  ADD KEY `announcements_created_by_foreign` (`created_by`);

--
-- Indexes for table `asset_types`
--
ALTER TABLE `asset_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `asset_types_business_id_foreign` (`business_id`),
  ADD KEY `asset_types_created_by_foreign` (`created_by`),
  ADD KEY `asset_types_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `attendances`
--
ALTER TABLE `attendances`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attendances_user_id_foreign` (`user_id`),
  ADD KEY `attendances_work_location_id_foreign` (`work_location_id`),
  ADD KEY `attendances_business_id_foreign` (`business_id`),
  ADD KEY `attendances_created_by_foreign` (`created_by`);

--
-- Indexes for table `attendance_arrears`
--
ALTER TABLE `attendance_arrears`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attendance_arrears_attendance_id_foreign` (`attendance_id`);

--
-- Indexes for table `attendance_histories`
--
ALTER TABLE `attendance_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attendance_histories_actor_id_foreign` (`actor_id`),
  ADD KEY `attendance_histories_user_id_foreign` (`user_id`),
  ADD KEY `attendance_histories_work_location_id_foreign` (`work_location_id`),
  ADD KEY `attendance_histories_business_id_foreign` (`business_id`),
  ADD KEY `attendance_histories_created_by_foreign` (`created_by`);

--
-- Indexes for table `attendance_history_projects`
--
ALTER TABLE `attendance_history_projects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attendance_history_projects_attendance_id_foreign` (`attendance_id`),
  ADD KEY `attendance_history_projects_project_id_foreign` (`project_id`);

--
-- Indexes for table `attendance_history_records`
--
ALTER TABLE `attendance_history_records`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attendance_history_records_attendance_id_foreign` (`attendance_id`);

--
-- Indexes for table `attendance_projects`
--
ALTER TABLE `attendance_projects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attendance_projects_attendance_id_foreign` (`attendance_id`),
  ADD KEY `attendance_projects_project_id_foreign` (`project_id`);

--
-- Indexes for table `attendance_records`
--
ALTER TABLE `attendance_records`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attendance_records_attendance_id_foreign` (`attendance_id`);

--
-- Indexes for table `banks`
--
ALTER TABLE `banks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `banks_business_id_foreign` (`business_id`),
  ADD KEY `banks_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `businesses`
--
ALTER TABLE `businesses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `businesses_email_unique` (`email`),
  ADD KEY `businesses_service_plan_id_foreign` (`service_plan_id`),
  ADD KEY `businesses_reseller_id_foreign` (`reseller_id`);

--
-- Indexes for table `business_email_settings`
--
ALTER TABLE `business_email_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `business_email_settings_business_id_foreign` (`business_id`);

--
-- Indexes for table `business_modules`
--
ALTER TABLE `business_modules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `business_modules_business_id_foreign` (`business_id`),
  ADD KEY `business_modules_module_id_foreign` (`module_id`);

--
-- Indexes for table `business_pension_histories`
--
ALTER TABLE `business_pension_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `business_pension_histories_business_id_foreign` (`business_id`),
  ADD KEY `business_pension_histories_created_by_foreign` (`created_by`);

--
-- Indexes for table `business_subscriptions`
--
ALTER TABLE `business_subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `business_subscriptions_business_id_foreign` (`business_id`),
  ADD KEY `business_subscriptions_service_plan_id_foreign` (`service_plan_id`);

--
-- Indexes for table `business_tiers`
--
ALTER TABLE `business_tiers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `business_tier_modules`
--
ALTER TABLE `business_tier_modules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `business_tier_modules_business_tier_id_foreign` (`business_tier_id`),
  ADD KEY `business_tier_modules_module_id_foreign` (`module_id`);

--
-- Indexes for table `business_times`
--
ALTER TABLE `business_times`
  ADD PRIMARY KEY (`id`),
  ADD KEY `business_times_business_id_foreign` (`business_id`);

--
-- Indexes for table `candidates`
--
ALTER TABLE `candidates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `candidates_job_listing_id_foreign` (`job_listing_id`),
  ADD KEY `candidates_business_id_foreign` (`business_id`),
  ADD KEY `candidates_created_by_foreign` (`created_by`);

--
-- Indexes for table `candidate_job_platforms`
--
ALTER TABLE `candidate_job_platforms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `candidate_job_platforms_job_platform_id_foreign` (`job_platform_id`),
  ADD KEY `candidate_job_platforms_candidate_id_foreign` (`candidate_id`);

--
-- Indexes for table `candidate_recruitment_processes`
--
ALTER TABLE `candidate_recruitment_processes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `candidate_recruitment_processes_recruitment_process_id_foreign` (`recruitment_process_id`),
  ADD KEY `candidate_recruitment_processes_candidate_id_foreign` (`candidate_id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_project_id_foreign` (`project_id`),
  ADD KEY `comments_related_task_id_foreign` (`related_task_id`),
  ADD KEY `comments_task_id_foreign` (`task_id`),
  ADD KEY `comments_created_by_foreign` (`created_by`),
  ADD KEY `comments_parent_comment_id_foreign` (`parent_comment_id`);

--
-- Indexes for table `dashboard_widgets`
--
ALTER TABLE `dashboard_widgets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dashboard_widgets_user_id_foreign` (`user_id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `departments_manager_id_foreign` (`manager_id`),
  ADD KEY `departments_parent_id_foreign` (`parent_id`),
  ADD KEY `departments_business_id_foreign` (`business_id`),
  ADD KEY `departments_work_location_id_foreign` (`work_location_id`),
  ADD KEY `departments_created_by_foreign` (`created_by`);

--
-- Indexes for table `department_announcements`
--
ALTER TABLE `department_announcements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `department_announcements_department_id_foreign` (`department_id`),
  ADD KEY `department_announcements_announcement_id_foreign` (`announcement_id`);

--
-- Indexes for table `department_holidays`
--
ALTER TABLE `department_holidays`
  ADD PRIMARY KEY (`id`),
  ADD KEY `department_holidays_department_id_foreign` (`department_id`),
  ADD KEY `department_holidays_holiday_id_foreign` (`holiday_id`);

--
-- Indexes for table `department_projects`
--
ALTER TABLE `department_projects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `department_projects_department_id_foreign` (`department_id`),
  ADD KEY `department_projects_project_id_foreign` (`project_id`);

--
-- Indexes for table `department_users`
--
ALTER TABLE `department_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `department_users_department_id_foreign` (`department_id`),
  ADD KEY `department_users_user_id_foreign` (`user_id`);

--
-- Indexes for table `department_work_shifts`
--
ALTER TABLE `department_work_shifts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `department_work_shifts_department_id_foreign` (`department_id`),
  ADD KEY `department_work_shifts_work_shift_id_foreign` (`work_shift_id`);

--
-- Indexes for table `designations`
--
ALTER TABLE `designations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `designations_business_id_foreign` (`business_id`),
  ADD KEY `designations_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `disabled_asset_types`
--
ALTER TABLE `disabled_asset_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `disabled_asset_types_asset_type_id_foreign` (`asset_type_id`),
  ADD KEY `disabled_asset_types_created_by_foreign` (`created_by`),
  ADD KEY `disabled_asset_types_business_id_foreign` (`business_id`);

--
-- Indexes for table `disabled_banks`
--
ALTER TABLE `disabled_banks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `disabled_banks_bank_id_foreign` (`bank_id`),
  ADD KEY `disabled_banks_created_by_foreign` (`created_by`),
  ADD KEY `disabled_banks_business_id_foreign` (`business_id`);

--
-- Indexes for table `disabled_designations`
--
ALTER TABLE `disabled_designations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `disabled_designations_designation_id_foreign` (`designation_id`),
  ADD KEY `disabled_designations_created_by_foreign` (`created_by`),
  ADD KEY `disabled_designations_business_id_foreign` (`business_id`);

--
-- Indexes for table `disabled_employment_statuses`
--
ALTER TABLE `disabled_employment_statuses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `disabled_employment_statuses_employment_status_id_foreign` (`employment_status_id`),
  ADD KEY `disabled_employment_statuses_created_by_foreign` (`created_by`),
  ADD KEY `disabled_employment_statuses_business_id_foreign` (`business_id`);

--
-- Indexes for table `disabled_job_platforms`
--
ALTER TABLE `disabled_job_platforms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `disabled_job_platforms_job_platform_id_foreign` (`job_platform_id`),
  ADD KEY `disabled_job_platforms_created_by_foreign` (`created_by`),
  ADD KEY `disabled_job_platforms_business_id_foreign` (`business_id`);

--
-- Indexes for table `disabled_job_types`
--
ALTER TABLE `disabled_job_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `disabled_job_types_job_type_id_foreign` (`job_type_id`),
  ADD KEY `disabled_job_types_created_by_foreign` (`created_by`),
  ADD KEY `disabled_job_types_business_id_foreign` (`business_id`);

--
-- Indexes for table `disabled_letter_templates`
--
ALTER TABLE `disabled_letter_templates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `disabled_letter_templates_letter_template_id_foreign` (`letter_template_id`),
  ADD KEY `disabled_letter_templates_created_by_foreign` (`created_by`),
  ADD KEY `disabled_letter_templates_business_id_foreign` (`business_id`);

--
-- Indexes for table `disabled_recruitment_processes`
--
ALTER TABLE `disabled_recruitment_processes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `disabled_recruitment_processes_recruitment_process_id_foreign` (`recruitment_process_id`),
  ADD KEY `disabled_recruitment_processes_created_by_foreign` (`created_by`),
  ADD KEY `disabled_recruitment_processes_business_id_foreign` (`business_id`);

--
-- Indexes for table `disabled_setting_leave_types`
--
ALTER TABLE `disabled_setting_leave_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `disabled_setting_leave_types_setting_leave_type_id_foreign` (`setting_leave_type_id`),
  ADD KEY `disabled_setting_leave_types_created_by_foreign` (`created_by`),
  ADD KEY `disabled_setting_leave_types_business_id_foreign` (`business_id`);

--
-- Indexes for table `disabled_task_categories`
--
ALTER TABLE `disabled_task_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `disabled_task_categories_task_category_id_foreign` (`task_category_id`),
  ADD KEY `disabled_task_categories_created_by_foreign` (`created_by`),
  ADD KEY `disabled_task_categories_business_id_foreign` (`business_id`);

--
-- Indexes for table `disabled_termination_reasons`
--
ALTER TABLE `disabled_termination_reasons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `disabled_termination_reasons_termination_reason_id_foreign` (`termination_reason_id`),
  ADD KEY `disabled_termination_reasons_created_by_foreign` (`created_by`),
  ADD KEY `disabled_termination_reasons_business_id_foreign` (`business_id`);

--
-- Indexes for table `disabled_termination_types`
--
ALTER TABLE `disabled_termination_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `disabled_termination_types_termination_type_id_foreign` (`termination_type_id`),
  ADD KEY `disabled_termination_types_created_by_foreign` (`created_by`),
  ADD KEY `disabled_termination_types_business_id_foreign` (`business_id`);

--
-- Indexes for table `disabled_work_locations`
--
ALTER TABLE `disabled_work_locations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `disabled_work_locations_work_location_id_foreign` (`work_location_id`),
  ADD KEY `disabled_work_locations_created_by_foreign` (`created_by`),
  ADD KEY `disabled_work_locations_business_id_foreign` (`business_id`);

--
-- Indexes for table `emailer_logs`
--
ALTER TABLE `emailer_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `emailer_logs_user_id_foreign` (`user_id`);

--
-- Indexes for table `email_templates`
--
ALTER TABLE `email_templates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `email_templates_wrapper_id_foreign` (`wrapper_id`),
  ADD KEY `email_templates_business_id_foreign` (`business_id`);

--
-- Indexes for table `email_template_wrappers`
--
ALTER TABLE `email_template_wrappers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee_address_histories`
--
ALTER TABLE `employee_address_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_address_histories_user_id_foreign` (`user_id`),
  ADD KEY `employee_address_histories_created_by_foreign` (`created_by`);

--
-- Indexes for table `employee_department_work_shift_histories`
--
ALTER TABLE `employee_department_work_shift_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee_passport_detail_histories`
--
ALTER TABLE `employee_passport_detail_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_passport_detail_histories_user_id_foreign` (`user_id`),
  ADD KEY `employee_passport_detail_histories_business_id_foreign` (`business_id`),
  ADD KEY `employee_passport_detail_histories_created_by_foreign` (`created_by`);

--
-- Indexes for table `employee_pension_histories`
--
ALTER TABLE `employee_pension_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_pension_histories_user_id_foreign` (`user_id`),
  ADD KEY `employee_pension_histories_business_id_foreign` (`business_id`),
  ADD KEY `employee_pension_histories_created_by_foreign` (`created_by`);

--
-- Indexes for table `employee_project_histories`
--
ALTER TABLE `employee_project_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_project_histories_business_id_foreign` (`business_id`),
  ADD KEY `employee_project_histories_created_by_foreign` (`created_by`);

--
-- Indexes for table `employee_right_to_works`
--
ALTER TABLE `employee_right_to_works`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_right_to_works_user_id_foreign` (`user_id`),
  ADD KEY `employee_right_to_works_business_id_foreign` (`business_id`),
  ADD KEY `employee_right_to_works_created_by_foreign` (`created_by`);

--
-- Indexes for table `employee_right_to_work_histories`
--
ALTER TABLE `employee_right_to_work_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_right_to_work_histories_user_id_foreign` (`user_id`),
  ADD KEY `employee_right_to_work_histories_business_id_foreign` (`business_id`),
  ADD KEY `employee_right_to_work_histories_created_by_foreign` (`created_by`);

--
-- Indexes for table `employee_rotas`
--
ALTER TABLE `employee_rotas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_rotas_department_id_foreign` (`department_id`),
  ADD KEY `employee_rotas_user_id_foreign` (`user_id`),
  ADD KEY `employee_rotas_business_id_foreign` (`business_id`),
  ADD KEY `employee_rotas_created_by_foreign` (`created_by`);

--
-- Indexes for table `employee_rota_details`
--
ALTER TABLE `employee_rota_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_rota_details_employee_rota_id_foreign` (`employee_rota_id`);

--
-- Indexes for table `employee_sponsorship_histories`
--
ALTER TABLE `employee_sponsorship_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_sponsorship_histories_user_id_foreign` (`user_id`),
  ADD KEY `employee_sponsorship_histories_business_id_foreign` (`business_id`),
  ADD KEY `employee_sponsorship_histories_created_by_foreign` (`created_by`);

--
-- Indexes for table `employee_user_work_shift_histories`
--
ALTER TABLE `employee_user_work_shift_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee_visa_detail_histories`
--
ALTER TABLE `employee_visa_detail_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_visa_detail_histories_user_id_foreign` (`user_id`),
  ADD KEY `employee_visa_detail_histories_business_id_foreign` (`business_id`),
  ADD KEY `employee_visa_detail_histories_created_by_foreign` (`created_by`);

--
-- Indexes for table `employment_statuses`
--
ALTER TABLE `employment_statuses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employment_statuses_business_id_foreign` (`business_id`),
  ADD KEY `employment_statuses_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `exit_interviews`
--
ALTER TABLE `exit_interviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exit_interviews_user_id_foreign` (`user_id`),
  ADD KEY `exit_interviews_termination_id_foreign` (`termination_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `holidays`
--
ALTER TABLE `holidays`
  ADD PRIMARY KEY (`id`),
  ADD KEY `holidays_business_id_foreign` (`business_id`),
  ADD KEY `holidays_created_by_foreign` (`created_by`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_listings`
--
ALTER TABLE `job_listings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `job_listings_job_type_id_foreign` (`job_type_id`),
  ADD KEY `job_listings_work_location_id_foreign` (`work_location_id`),
  ADD KEY `job_listings_department_id_foreign` (`department_id`),
  ADD KEY `job_listings_business_id_foreign` (`business_id`),
  ADD KEY `job_listings_created_by_foreign` (`created_by`);

--
-- Indexes for table `job_listing_job_platforms`
--
ALTER TABLE `job_listing_job_platforms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `job_listing_job_platforms_job_platform_id_foreign` (`job_platform_id`),
  ADD KEY `job_listing_job_platforms_job_listing_id_foreign` (`job_listing_id`);

--
-- Indexes for table `job_platforms`
--
ALTER TABLE `job_platforms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `job_platforms_business_id_foreign` (`business_id`),
  ADD KEY `job_platforms_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `job_types`
--
ALTER TABLE `job_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `job_types_business_id_foreign` (`business_id`),
  ADD KEY `job_types_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `labels`
--
ALTER TABLE `labels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `labels_project_id_foreign` (`project_id`),
  ADD KEY `labels_business_id_foreign` (`business_id`),
  ADD KEY `labels_created_by_foreign` (`created_by`);

--
-- Indexes for table `leaves`
--
ALTER TABLE `leaves`
  ADD PRIMARY KEY (`id`),
  ADD KEY `leaves_leave_type_id_foreign` (`leave_type_id`),
  ADD KEY `leaves_user_id_foreign` (`user_id`),
  ADD KEY `leaves_business_id_foreign` (`business_id`),
  ADD KEY `leaves_created_by_foreign` (`created_by`);

--
-- Indexes for table `leave_approvals`
--
ALTER TABLE `leave_approvals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `leave_approvals_leave_id_foreign` (`leave_id`),
  ADD KEY `leave_approvals_created_by_foreign` (`created_by`);

--
-- Indexes for table `leave_histories`
--
ALTER TABLE `leave_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `leave_histories_actor_id_foreign` (`actor_id`),
  ADD KEY `leave_histories_leave_type_id_foreign` (`leave_type_id`),
  ADD KEY `leave_histories_user_id_foreign` (`user_id`),
  ADD KEY `leave_histories_business_id_foreign` (`business_id`),
  ADD KEY `leave_histories_created_by_foreign` (`created_by`);

--
-- Indexes for table `leave_records`
--
ALTER TABLE `leave_records`
  ADD PRIMARY KEY (`id`),
  ADD KEY `leave_records_leave_id_foreign` (`leave_id`);

--
-- Indexes for table `leave_record_arrears`
--
ALTER TABLE `leave_record_arrears`
  ADD PRIMARY KEY (`id`),
  ADD KEY `leave_record_arrears_leave_record_id_foreign` (`leave_record_id`);

--
-- Indexes for table `leave_record_histories`
--
ALTER TABLE `leave_record_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `leave_record_histories_leave_id_foreign` (`leave_id`);

--
-- Indexes for table `leave_type_employment_statuses`
--
ALTER TABLE `leave_type_employment_statuses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `leave_type_employment_statuses_setting_leave_type_id_foreign` (`setting_leave_type_id`),
  ADD KEY `leave_type_employment_statuses_employment_status_id_foreign` (`employment_status_id`);

--
-- Indexes for table `letter_templates`
--
ALTER TABLE `letter_templates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `letter_templates_parent_id_foreign` (`parent_id`),
  ADD KEY `letter_templates_business_id_foreign` (`business_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_sender_id_foreign` (`sender_id`),
  ADD KEY `notifications_receiver_id_foreign` (`receiver_id`),
  ADD KEY `notifications_business_id_foreign` (`business_id`),
  ADD KEY `notifications_notification_template_id_foreign` (`notification_template_id`);

--
-- Indexes for table `notification_templates`
--
ALTER TABLE `notification_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `paid_leave_employment_statuses`
--
ALTER TABLE `paid_leave_employment_statuses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `paid_leave_employment_statuses_setting_leave_id_foreign` (`setting_leave_id`),
  ADD KEY `paid_leave_employment_statuses_employment_status_id_foreign` (`employment_status_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payment_types`
--
ALTER TABLE `payment_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payrolls`
--
ALTER TABLE `payrolls`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payrolls_payrun_id_foreign` (`payrun_id`),
  ADD KEY `payrolls_user_id_foreign` (`user_id`),
  ADD KEY `payrolls_business_id_foreign` (`business_id`),
  ADD KEY `payrolls_created_by_foreign` (`created_by`);

--
-- Indexes for table `payroll_attendances`
--
ALTER TABLE `payroll_attendances`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payroll_attendances_payroll_id_foreign` (`payroll_id`),
  ADD KEY `payroll_attendances_attendance_id_foreign` (`attendance_id`);

--
-- Indexes for table `payroll_holidays`
--
ALTER TABLE `payroll_holidays`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payroll_holidays_payroll_id_foreign` (`payroll_id`),
  ADD KEY `payroll_holidays_holiday_id_foreign` (`holiday_id`);

--
-- Indexes for table `payroll_leave_records`
--
ALTER TABLE `payroll_leave_records`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payroll_leave_records_payroll_id_foreign` (`payroll_id`),
  ADD KEY `payroll_leave_records_leave_record_id_foreign` (`leave_record_id`);

--
-- Indexes for table `payruns`
--
ALTER TABLE `payruns`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payruns_created_by_foreign` (`created_by`),
  ADD KEY `payruns_business_id_foreign` (`business_id`);

--
-- Indexes for table `payrun_departments`
--
ALTER TABLE `payrun_departments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payrun_departments_payrun_id_foreign` (`payrun_id`),
  ADD KEY `payrun_departments_department_id_foreign` (`department_id`);

--
-- Indexes for table `payrun_users`
--
ALTER TABLE `payrun_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payrun_users_payrun_id_foreign` (`payrun_id`),
  ADD KEY `payrun_users_user_id_foreign` (`user_id`);

--
-- Indexes for table `payslips`
--
ALTER TABLE `payslips`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payslips_user_id_foreign` (`user_id`),
  ADD KEY `payslips_payroll_id_foreign` (`payroll_id`),
  ADD KEY `payslips_bank_id_foreign` (`bank_id`),
  ADD KEY `payslips_created_by_foreign` (`created_by`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_product_category_id_foreign` (`product_category_id`);

--
-- Indexes for table `product_categories`
--
ALTER TABLE `product_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_categories_name_unique` (`name`);

--
-- Indexes for table `product_galleries`
--
ALTER TABLE `product_galleries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_galleries_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_variations`
--
ALTER TABLE `product_variations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_variations_product_id_foreign` (`product_id`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `projects_business_id_foreign` (`business_id`),
  ADD KEY `projects_created_by_foreign` (`created_by`);

--
-- Indexes for table `recruitment_processes`
--
ALTER TABLE `recruitment_processes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `recruitment_processes_business_id_foreign` (`business_id`),
  ADD KEY `recruitment_processes_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `recruitment_process_orders`
--
ALTER TABLE `recruitment_process_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `recruitment_process_orders_recruitment_process_id_foreign` (`recruitment_process_id`),
  ADD KEY `recruitment_process_orders_business_id_foreign` (`business_id`);

--
-- Indexes for table `reminders`
--
ALTER TABLE `reminders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reminders_business_id_foreign` (`business_id`),
  ADD KEY `reminders_created_by_foreign` (`created_by`);

--
-- Indexes for table `reseller_modules`
--
ALTER TABLE `reseller_modules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reseller_modules_reseller_id_foreign` (`reseller_id`),
  ADD KEY `reseller_modules_module_id_foreign` (`module_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `salary_histories`
--
ALTER TABLE `salary_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `salary_histories_user_id_foreign` (`user_id`);

--
-- Indexes for table `service_plans`
--
ALTER TABLE `service_plans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `service_plans_business_tier_id_foreign` (`business_tier_id`);

--
-- Indexes for table `service_plan_discount_codes`
--
ALTER TABLE `service_plan_discount_codes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `service_plan_discount_codes_code_unique` (`code`),
  ADD KEY `service_plan_discount_codes_service_plan_id_foreign` (`service_plan_id`);

--
-- Indexes for table `service_plan_modules`
--
ALTER TABLE `service_plan_modules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `service_plan_modules_service_plan_id_foreign` (`service_plan_id`),
  ADD KEY `service_plan_modules_module_id_foreign` (`module_id`);

--
-- Indexes for table `setting_attendances`
--
ALTER TABLE `setting_attendances`
  ADD PRIMARY KEY (`id`),
  ADD KEY `setting_attendances_business_id_foreign` (`business_id`),
  ADD KEY `setting_attendances_created_by_foreign` (`created_by`);

--
-- Indexes for table `setting_attendance_special_roles`
--
ALTER TABLE `setting_attendance_special_roles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `setting_attendance_special_roles_setting_attendance_id_foreign` (`setting_attendance_id`),
  ADD KEY `setting_attendance_special_roles_role_id_foreign` (`role_id`);

--
-- Indexes for table `setting_attendance_special_users`
--
ALTER TABLE `setting_attendance_special_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `setting_attendance_special_users_setting_attendance_id_foreign` (`setting_attendance_id`),
  ADD KEY `setting_attendance_special_users_user_id_foreign` (`user_id`);

--
-- Indexes for table `setting_leaves`
--
ALTER TABLE `setting_leaves`
  ADD PRIMARY KEY (`id`),
  ADD KEY `setting_leaves_business_id_foreign` (`business_id`),
  ADD KEY `setting_leaves_created_by_foreign` (`created_by`);

--
-- Indexes for table `setting_leave_special_roles`
--
ALTER TABLE `setting_leave_special_roles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `setting_leave_special_roles_setting_leave_id_foreign` (`setting_leave_id`),
  ADD KEY `setting_leave_special_roles_role_id_foreign` (`role_id`);

--
-- Indexes for table `setting_leave_special_users`
--
ALTER TABLE `setting_leave_special_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `setting_leave_special_users_setting_leave_id_foreign` (`setting_leave_id`),
  ADD KEY `setting_leave_special_users_user_id_foreign` (`user_id`);

--
-- Indexes for table `setting_leave_types`
--
ALTER TABLE `setting_leave_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `setting_leave_types_business_id_foreign` (`business_id`),
  ADD KEY `setting_leave_types_created_by_foreign` (`created_by`),
  ADD KEY `setting_leave_types_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `setting_payment_dates`
--
ALTER TABLE `setting_payment_dates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `setting_payment_dates_business_id_foreign` (`business_id`),
  ADD KEY `setting_payment_dates_created_by_foreign` (`created_by`);

--
-- Indexes for table `setting_payruns`
--
ALTER TABLE `setting_payruns`
  ADD PRIMARY KEY (`id`),
  ADD KEY `setting_payruns_business_id_foreign` (`business_id`),
  ADD KEY `setting_payruns_created_by_foreign` (`created_by`);

--
-- Indexes for table `setting_payrun_restricted_departments`
--
ALTER TABLE `setting_payrun_restricted_departments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `setting_payrun_restricted_departments_setting_payrun_id_foreign` (`setting_payrun_id`),
  ADD KEY `setting_payrun_restricted_departments_department_id_foreign` (`department_id`);

--
-- Indexes for table `setting_payrun_restricted_users`
--
ALTER TABLE `setting_payrun_restricted_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `setting_payrun_restricted_users_setting_payrun_id_foreign` (`setting_payrun_id`),
  ADD KEY `setting_payrun_restricted_users_user_id_foreign` (`user_id`);

--
-- Indexes for table `setting_payslips`
--
ALTER TABLE `setting_payslips`
  ADD PRIMARY KEY (`id`),
  ADD KEY `setting_payslips_business_id_foreign` (`business_id`),
  ADD KEY `setting_payslips_created_by_foreign` (`created_by`);

--
-- Indexes for table `social_sites`
--
ALTER TABLE `social_sites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `social_sites_business_id_foreign` (`business_id`),
  ADD KEY `social_sites_created_by_foreign` (`created_by`);

--
-- Indexes for table `statuses`
--
ALTER TABLE `statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_settings`
--
ALTER TABLE `system_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tasks_assigned_to_foreign` (`assigned_to`),
  ADD KEY `tasks_project_id_foreign` (`project_id`),
  ADD KEY `tasks_parent_task_id_foreign` (`parent_task_id`),
  ADD KEY `tasks_task_category_id_foreign` (`task_category_id`),
  ADD KEY `tasks_assigned_by_foreign` (`assigned_by`),
  ADD KEY `tasks_business_id_foreign` (`business_id`),
  ADD KEY `tasks_created_by_foreign` (`created_by`);

--
-- Indexes for table `task_assignees`
--
ALTER TABLE `task_assignees`
  ADD PRIMARY KEY (`id`),
  ADD KEY `task_assignees_assignee_id_foreign` (`assignee_id`),
  ADD KEY `task_assignees_task_id_foreign` (`task_id`);

--
-- Indexes for table `task_categories`
--
ALTER TABLE `task_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `task_categories_project_id_foreign` (`project_id`),
  ADD KEY `task_categories_business_id_foreign` (`business_id`),
  ADD KEY `task_categories_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `task_category_orders`
--
ALTER TABLE `task_category_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `task_category_orders_task_category_id_foreign` (`task_category_id`),
  ADD KEY `task_category_orders_project_id_foreign` (`project_id`),
  ADD KEY `task_category_orders_business_id_foreign` (`business_id`);

--
-- Indexes for table `task_comment_mentions`
--
ALTER TABLE `task_comment_mentions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `task_comment_mentions_comment_id_foreign` (`comment_id`),
  ADD KEY `task_comment_mentions_user_id_foreign` (`user_id`);

--
-- Indexes for table `task_labels`
--
ALTER TABLE `task_labels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `task_labels_task_id_foreign` (`task_id`),
  ADD KEY `task_labels_label_id_foreign` (`label_id`);

--
-- Indexes for table `terminations`
--
ALTER TABLE `terminations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `terminations_user_id_foreign` (`user_id`),
  ADD KEY `terminations_termination_type_id_foreign` (`termination_type_id`),
  ADD KEY `terminations_termination_reason_id_foreign` (`termination_reason_id`);

--
-- Indexes for table `termination_reasons`
--
ALTER TABLE `termination_reasons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `termination_reasons_business_id_foreign` (`business_id`),
  ADD KEY `termination_reasons_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `termination_types`
--
ALTER TABLE `termination_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `termination_types_business_id_foreign` (`business_id`),
  ADD KEY `termination_types_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `unpaid_leave_employment_statuses`
--
ALTER TABLE `unpaid_leave_employment_statuses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `unpaid_leave_employment_statuses_setting_leave_id_foreign` (`setting_leave_id`),
  ADD KEY `unpaid_leave_employment_statuses_employment_status_id_foreign` (`employment_status_id`);

--
-- Indexes for table `uploaded_files`
--
ALTER TABLE `uploaded_files`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_designation_id_foreign` (`designation_id`),
  ADD KEY `users_employment_status_id_foreign` (`employment_status_id`),
  ADD KEY `users_recruitment_process_id_foreign` (`recruitment_process_id`),
  ADD KEY `users_bank_id_foreign` (`bank_id`),
  ADD KEY `users_business_id_foreign` (`business_id`),
  ADD KEY `users_created_by_foreign` (`created_by`);

--
-- Indexes for table `user_announcements`
--
ALTER TABLE `user_announcements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_announcements_user_id_foreign` (`user_id`),
  ADD KEY `user_announcements_announcement_id_foreign` (`announcement_id`);

--
-- Indexes for table `user_assets`
--
ALTER TABLE `user_assets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_assets_user_id_foreign` (`user_id`),
  ADD KEY `user_assets_business_id_foreign` (`business_id`),
  ADD KEY `user_assets_created_by_foreign` (`created_by`);

--
-- Indexes for table `user_asset_histories`
--
ALTER TABLE `user_asset_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_asset_histories_user_asset_id_foreign` (`user_asset_id`),
  ADD KEY `user_asset_histories_business_id_foreign` (`business_id`),
  ADD KEY `user_asset_histories_created_by_foreign` (`created_by`);

--
-- Indexes for table `user_documents`
--
ALTER TABLE `user_documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_documents_user_id_foreign` (`user_id`),
  ADD KEY `user_documents_created_by_foreign` (`created_by`);

--
-- Indexes for table `user_education_histories`
--
ALTER TABLE `user_education_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_education_histories_user_id_foreign` (`user_id`),
  ADD KEY `user_education_histories_created_by_foreign` (`created_by`);

--
-- Indexes for table `user_holidays`
--
ALTER TABLE `user_holidays`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_holidays_user_id_foreign` (`user_id`),
  ADD KEY `user_holidays_holiday_id_foreign` (`holiday_id`);

--
-- Indexes for table `user_job_histories`
--
ALTER TABLE `user_job_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_job_histories_user_id_foreign` (`user_id`),
  ADD KEY `user_job_histories_created_by_foreign` (`created_by`);

--
-- Indexes for table `user_letters`
--
ALTER TABLE `user_letters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_letters_user_id_foreign` (`user_id`),
  ADD KEY `user_letters_business_id_foreign` (`business_id`);

--
-- Indexes for table `user_letter_email_histories`
--
ALTER TABLE `user_letter_email_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_letter_email_histories_user_letter_id_foreign` (`user_letter_id`);

--
-- Indexes for table `user_notes`
--
ALTER TABLE `user_notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_notes_user_id_foreign` (`user_id`),
  ADD KEY `user_notes_created_by_foreign` (`created_by`),
  ADD KEY `user_notes_updated_by_foreign` (`updated_by`);

--
-- Indexes for table `user_note_mentions`
--
ALTER TABLE `user_note_mentions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_note_mentions_user_note_id_foreign` (`user_note_id`),
  ADD KEY `user_note_mentions_user_id_foreign` (`user_id`);

--
-- Indexes for table `user_projects`
--
ALTER TABLE `user_projects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_projects_user_id_foreign` (`user_id`),
  ADD KEY `user_projects_project_id_foreign` (`project_id`);

--
-- Indexes for table `user_recruitment_processes`
--
ALTER TABLE `user_recruitment_processes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_recruitment_processes_recruitment_process_id_foreign` (`recruitment_process_id`),
  ADD KEY `user_recruitment_processes_user_id_foreign` (`user_id`);

--
-- Indexes for table `user_social_sites`
--
ALTER TABLE `user_social_sites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_social_sites_social_site_id_foreign` (`social_site_id`),
  ADD KEY `user_social_sites_user_id_foreign` (`user_id`),
  ADD KEY `user_social_sites_created_by_foreign` (`created_by`);

--
-- Indexes for table `user_work_locations`
--
ALTER TABLE `user_work_locations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_work_locations_work_location_id_foreign` (`work_location_id`),
  ADD KEY `user_work_locations_user_id_foreign` (`user_id`);

--
-- Indexes for table `user_work_shifts`
--
ALTER TABLE `user_work_shifts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_work_shifts_user_id_foreign` (`user_id`),
  ADD KEY `user_work_shifts_work_shift_id_foreign` (`work_shift_id`);

--
-- Indexes for table `work_locations`
--
ALTER TABLE `work_locations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `work_locations_business_id_foreign` (`business_id`),
  ADD KEY `work_locations_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `work_shifts`
--
ALTER TABLE `work_shifts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `work_shifts_business_id_foreign` (`business_id`),
  ADD KEY `work_shifts_created_by_foreign` (`created_by`);

--
-- Indexes for table `work_shift_details`
--
ALTER TABLE `work_shift_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `work_shift_details_work_shift_id_foreign` (`work_shift_id`);

--
-- Indexes for table `work_shift_detail_histories`
--
ALTER TABLE `work_shift_detail_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `work_shift_detail_histories_work_shift_id_foreign` (`work_shift_id`);

--
-- Indexes for table `work_shift_histories`
--
ALTER TABLE `work_shift_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `work_shift_histories_business_id_foreign` (`business_id`),
  ADD KEY `work_shift_histories_created_by_foreign` (`created_by`);

--
-- Indexes for table `work_shift_locations`
--
ALTER TABLE `work_shift_locations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `work_shift_locations_work_shift_id_foreign` (`work_shift_id`),
  ADD KEY `work_shift_locations_work_location_id_foreign` (`work_location_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `access_revocations`
--
ALTER TABLE `access_revocations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `announcements`
--
ALTER TABLE `announcements`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `asset_types`
--
ALTER TABLE `asset_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `attendances`
--
ALTER TABLE `attendances`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `attendance_arrears`
--
ALTER TABLE `attendance_arrears`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attendance_histories`
--
ALTER TABLE `attendance_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `attendance_history_projects`
--
ALTER TABLE `attendance_history_projects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `attendance_history_records`
--
ALTER TABLE `attendance_history_records`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attendance_projects`
--
ALTER TABLE `attendance_projects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `attendance_records`
--
ALTER TABLE `attendance_records`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `banks`
--
ALTER TABLE `banks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `businesses`
--
ALTER TABLE `businesses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `business_email_settings`
--
ALTER TABLE `business_email_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `business_modules`
--
ALTER TABLE `business_modules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `business_pension_histories`
--
ALTER TABLE `business_pension_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `business_subscriptions`
--
ALTER TABLE `business_subscriptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `business_tiers`
--
ALTER TABLE `business_tiers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `business_tier_modules`
--
ALTER TABLE `business_tier_modules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `business_times`
--
ALTER TABLE `business_times`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=204;

--
-- AUTO_INCREMENT for table `candidates`
--
ALTER TABLE `candidates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `candidate_job_platforms`
--
ALTER TABLE `candidate_job_platforms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `candidate_recruitment_processes`
--
ALTER TABLE `candidate_recruitment_processes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `dashboard_widgets`
--
ALTER TABLE `dashboard_widgets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `department_announcements`
--
ALTER TABLE `department_announcements`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `department_holidays`
--
ALTER TABLE `department_holidays`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `department_projects`
--
ALTER TABLE `department_projects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `department_users`
--
ALTER TABLE `department_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `department_work_shifts`
--
ALTER TABLE `department_work_shifts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `designations`
--
ALTER TABLE `designations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `disabled_asset_types`
--
ALTER TABLE `disabled_asset_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `disabled_banks`
--
ALTER TABLE `disabled_banks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `disabled_designations`
--
ALTER TABLE `disabled_designations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `disabled_employment_statuses`
--
ALTER TABLE `disabled_employment_statuses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `disabled_job_platforms`
--
ALTER TABLE `disabled_job_platforms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `disabled_job_types`
--
ALTER TABLE `disabled_job_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `disabled_letter_templates`
--
ALTER TABLE `disabled_letter_templates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `disabled_recruitment_processes`
--
ALTER TABLE `disabled_recruitment_processes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `disabled_setting_leave_types`
--
ALTER TABLE `disabled_setting_leave_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `disabled_task_categories`
--
ALTER TABLE `disabled_task_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `disabled_termination_reasons`
--
ALTER TABLE `disabled_termination_reasons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `disabled_termination_types`
--
ALTER TABLE `disabled_termination_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `disabled_work_locations`
--
ALTER TABLE `disabled_work_locations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `emailer_logs`
--
ALTER TABLE `emailer_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `email_templates`
--
ALTER TABLE `email_templates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=158;

--
-- AUTO_INCREMENT for table `email_template_wrappers`
--
ALTER TABLE `email_template_wrappers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `employee_address_histories`
--
ALTER TABLE `employee_address_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `employee_department_work_shift_histories`
--
ALTER TABLE `employee_department_work_shift_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `employee_passport_detail_histories`
--
ALTER TABLE `employee_passport_detail_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `employee_pension_histories`
--
ALTER TABLE `employee_pension_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `employee_project_histories`
--
ALTER TABLE `employee_project_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `employee_right_to_works`
--
ALTER TABLE `employee_right_to_works`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee_right_to_work_histories`
--
ALTER TABLE `employee_right_to_work_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `employee_rotas`
--
ALTER TABLE `employee_rotas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `employee_rota_details`
--
ALTER TABLE `employee_rota_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `employee_sponsorship_histories`
--
ALTER TABLE `employee_sponsorship_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `employee_user_work_shift_histories`
--
ALTER TABLE `employee_user_work_shift_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `employee_visa_detail_histories`
--
ALTER TABLE `employee_visa_detail_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `employment_statuses`
--
ALTER TABLE `employment_statuses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `exit_interviews`
--
ALTER TABLE `exit_interviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `holidays`
--
ALTER TABLE `holidays`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `job_listings`
--
ALTER TABLE `job_listings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `job_listing_job_platforms`
--
ALTER TABLE `job_listing_job_platforms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `job_platforms`
--
ALTER TABLE `job_platforms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `job_types`
--
ALTER TABLE `job_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `labels`
--
ALTER TABLE `labels`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `leaves`
--
ALTER TABLE `leaves`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `leave_approvals`
--
ALTER TABLE `leave_approvals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `leave_histories`
--
ALTER TABLE `leave_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `leave_records`
--
ALTER TABLE `leave_records`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `leave_record_arrears`
--
ALTER TABLE `leave_record_arrears`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `leave_record_histories`
--
ALTER TABLE `leave_record_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `leave_type_employment_statuses`
--
ALTER TABLE `leave_type_employment_statuses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `letter_templates`
--
ALTER TABLE `letter_templates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=190;

--
-- AUTO_INCREMENT for table `modules`
--
ALTER TABLE `modules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `notification_templates`
--
ALTER TABLE `notification_templates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `paid_leave_employment_statuses`
--
ALTER TABLE `paid_leave_employment_statuses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_types`
--
ALTER TABLE `payment_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `payrolls`
--
ALTER TABLE `payrolls`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `payroll_attendances`
--
ALTER TABLE `payroll_attendances`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payroll_holidays`
--
ALTER TABLE `payroll_holidays`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payroll_leave_records`
--
ALTER TABLE `payroll_leave_records`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payruns`
--
ALTER TABLE `payruns`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `payrun_departments`
--
ALTER TABLE `payrun_departments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `payrun_users`
--
ALTER TABLE `payrun_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payslips`
--
ALTER TABLE `payslips`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=245;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_categories`
--
ALTER TABLE `product_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_galleries`
--
ALTER TABLE `product_galleries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_variations`
--
ALTER TABLE `product_variations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `recruitment_processes`
--
ALTER TABLE `recruitment_processes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `recruitment_process_orders`
--
ALTER TABLE `recruitment_process_orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `reminders`
--
ALTER TABLE `reminders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `reseller_modules`
--
ALTER TABLE `reseller_modules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- AUTO_INCREMENT for table `salary_histories`
--
ALTER TABLE `salary_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `service_plans`
--
ALTER TABLE `service_plans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `service_plan_discount_codes`
--
ALTER TABLE `service_plan_discount_codes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `service_plan_modules`
--
ALTER TABLE `service_plan_modules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;

--
-- AUTO_INCREMENT for table `setting_attendances`
--
ALTER TABLE `setting_attendances`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `setting_attendance_special_roles`
--
ALTER TABLE `setting_attendance_special_roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `setting_attendance_special_users`
--
ALTER TABLE `setting_attendance_special_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `setting_leaves`
--
ALTER TABLE `setting_leaves`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `setting_leave_special_roles`
--
ALTER TABLE `setting_leave_special_roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `setting_leave_special_users`
--
ALTER TABLE `setting_leave_special_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `setting_leave_types`
--
ALTER TABLE `setting_leave_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=140;

--
-- AUTO_INCREMENT for table `setting_payment_dates`
--
ALTER TABLE `setting_payment_dates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `setting_payruns`
--
ALTER TABLE `setting_payruns`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `setting_payrun_restricted_departments`
--
ALTER TABLE `setting_payrun_restricted_departments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `setting_payrun_restricted_users`
--
ALTER TABLE `setting_payrun_restricted_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `setting_payslips`
--
ALTER TABLE `setting_payslips`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `social_sites`
--
ALTER TABLE `social_sites`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `statuses`
--
ALTER TABLE `statuses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `system_settings`
--
ALTER TABLE `system_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `task_assignees`
--
ALTER TABLE `task_assignees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `task_categories`
--
ALTER TABLE `task_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `task_category_orders`
--
ALTER TABLE `task_category_orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `task_comment_mentions`
--
ALTER TABLE `task_comment_mentions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `task_labels`
--
ALTER TABLE `task_labels`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `terminations`
--
ALTER TABLE `terminations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `termination_reasons`
--
ALTER TABLE `termination_reasons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `termination_types`
--
ALTER TABLE `termination_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `unpaid_leave_employment_statuses`
--
ALTER TABLE `unpaid_leave_employment_statuses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `uploaded_files`
--
ALTER TABLE `uploaded_files`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `user_announcements`
--
ALTER TABLE `user_announcements`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `user_assets`
--
ALTER TABLE `user_assets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `user_asset_histories`
--
ALTER TABLE `user_asset_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `user_documents`
--
ALTER TABLE `user_documents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user_education_histories`
--
ALTER TABLE `user_education_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_holidays`
--
ALTER TABLE `user_holidays`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_job_histories`
--
ALTER TABLE `user_job_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_letters`
--
ALTER TABLE `user_letters`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `user_letter_email_histories`
--
ALTER TABLE `user_letter_email_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_notes`
--
ALTER TABLE `user_notes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_note_mentions`
--
ALTER TABLE `user_note_mentions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_projects`
--
ALTER TABLE `user_projects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `user_recruitment_processes`
--
ALTER TABLE `user_recruitment_processes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `user_social_sites`
--
ALTER TABLE `user_social_sites`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_work_locations`
--
ALTER TABLE `user_work_locations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `user_work_shifts`
--
ALTER TABLE `user_work_shifts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `work_locations`
--
ALTER TABLE `work_locations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT for table `work_shifts`
--
ALTER TABLE `work_shifts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `work_shift_details`
--
ALTER TABLE `work_shift_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=204;

--
-- AUTO_INCREMENT for table `work_shift_detail_histories`
--
ALTER TABLE `work_shift_detail_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=204;

--
-- AUTO_INCREMENT for table `work_shift_histories`
--
ALTER TABLE `work_shift_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `work_shift_locations`
--
ALTER TABLE `work_shift_locations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `access_revocations`
--
ALTER TABLE `access_revocations`
  ADD CONSTRAINT `access_revocations_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `announcements`
--
ALTER TABLE `announcements`
  ADD CONSTRAINT `announcements_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `businesses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `announcements_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `asset_types`
--
ALTER TABLE `asset_types`
  ADD CONSTRAINT `asset_types_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `businesses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `asset_types_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `asset_types_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `asset_types` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `attendances`
--
ALTER TABLE `attendances`
  ADD CONSTRAINT `attendances_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `businesses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `attendances_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `attendances_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `attendances_work_location_id_foreign` FOREIGN KEY (`work_location_id`) REFERENCES `work_locations` (`id`);

--
-- Constraints for table `attendance_arrears`
--
ALTER TABLE `attendance_arrears`
  ADD CONSTRAINT `attendance_arrears_attendance_id_foreign` FOREIGN KEY (`attendance_id`) REFERENCES `attendances` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `attendance_histories`
--
ALTER TABLE `attendance_histories`
  ADD CONSTRAINT `attendance_histories_actor_id_foreign` FOREIGN KEY (`actor_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `attendance_histories_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `businesses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `attendance_histories_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `attendance_histories_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `attendance_histories_work_location_id_foreign` FOREIGN KEY (`work_location_id`) REFERENCES `work_locations` (`id`);

--
-- Constraints for table `attendance_history_projects`
--
ALTER TABLE `attendance_history_projects`
  ADD CONSTRAINT `attendance_history_projects_attendance_id_foreign` FOREIGN KEY (`attendance_id`) REFERENCES `attendance_histories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `attendance_history_projects_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `attendance_history_records`
--
ALTER TABLE `attendance_history_records`
  ADD CONSTRAINT `attendance_history_records_attendance_id_foreign` FOREIGN KEY (`attendance_id`) REFERENCES `attendance_histories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `attendance_projects`
--
ALTER TABLE `attendance_projects`
  ADD CONSTRAINT `attendance_projects_attendance_id_foreign` FOREIGN KEY (`attendance_id`) REFERENCES `attendances` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `attendance_projects_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `attendance_records`
--
ALTER TABLE `attendance_records`
  ADD CONSTRAINT `attendance_records_attendance_id_foreign` FOREIGN KEY (`attendance_id`) REFERENCES `attendances` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `banks`
--
ALTER TABLE `banks`
  ADD CONSTRAINT `banks_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `businesses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `banks_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `banks` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `businesses`
--
ALTER TABLE `businesses`
  ADD CONSTRAINT `businesses_reseller_id_foreign` FOREIGN KEY (`reseller_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `businesses_service_plan_id_foreign` FOREIGN KEY (`service_plan_id`) REFERENCES `service_plans` (`id`);

--
-- Constraints for table `business_email_settings`
--
ALTER TABLE `business_email_settings`
  ADD CONSTRAINT `business_email_settings_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `businesses` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `business_modules`
--
ALTER TABLE `business_modules`
  ADD CONSTRAINT `business_modules_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `businesses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `business_modules_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `business_pension_histories`
--
ALTER TABLE `business_pension_histories`
  ADD CONSTRAINT `business_pension_histories_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `businesses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `business_pension_histories_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `business_subscriptions`
--
ALTER TABLE `business_subscriptions`
  ADD CONSTRAINT `business_subscriptions_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `businesses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `business_subscriptions_service_plan_id_foreign` FOREIGN KEY (`service_plan_id`) REFERENCES `service_plans` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `business_tier_modules`
--
ALTER TABLE `business_tier_modules`
  ADD CONSTRAINT `business_tier_modules_business_tier_id_foreign` FOREIGN KEY (`business_tier_id`) REFERENCES `business_tiers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `business_tier_modules_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `business_times`
--
ALTER TABLE `business_times`
  ADD CONSTRAINT `business_times_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `businesses` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `candidates`
--
ALTER TABLE `candidates`
  ADD CONSTRAINT `candidates_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `businesses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `candidates_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `candidates_job_listing_id_foreign` FOREIGN KEY (`job_listing_id`) REFERENCES `job_listings` (`id`);

--
-- Constraints for table `candidate_job_platforms`
--
ALTER TABLE `candidate_job_platforms`
  ADD CONSTRAINT `candidate_job_platforms_candidate_id_foreign` FOREIGN KEY (`candidate_id`) REFERENCES `candidates` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `candidate_job_platforms_job_platform_id_foreign` FOREIGN KEY (`job_platform_id`) REFERENCES `job_platforms` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `candidate_recruitment_processes`
--
ALTER TABLE `candidate_recruitment_processes`
  ADD CONSTRAINT `candidate_recruitment_processes_candidate_id_foreign` FOREIGN KEY (`candidate_id`) REFERENCES `candidates` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `candidate_recruitment_processes_recruitment_process_id_foreign` FOREIGN KEY (`recruitment_process_id`) REFERENCES `recruitment_processes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `comments_parent_comment_id_foreign` FOREIGN KEY (`parent_comment_id`) REFERENCES `comments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comments_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comments_related_task_id_foreign` FOREIGN KEY (`related_task_id`) REFERENCES `tasks` (`id`),
  ADD CONSTRAINT `comments_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `dashboard_widgets`
--
ALTER TABLE `dashboard_widgets`
  ADD CONSTRAINT `dashboard_widgets_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `departments`
--
ALTER TABLE `departments`
  ADD CONSTRAINT `departments_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `businesses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `departments_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `departments_manager_id_foreign` FOREIGN KEY (`manager_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `departments_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `departments_work_location_id_foreign` FOREIGN KEY (`work_location_id`) REFERENCES `work_locations` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `department_announcements`
--
ALTER TABLE `department_announcements`
  ADD CONSTRAINT `department_announcements_announcement_id_foreign` FOREIGN KEY (`announcement_id`) REFERENCES `announcements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `department_announcements_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `department_holidays`
--
ALTER TABLE `department_holidays`
  ADD CONSTRAINT `department_holidays_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `department_holidays_holiday_id_foreign` FOREIGN KEY (`holiday_id`) REFERENCES `holidays` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `department_projects`
--
ALTER TABLE `department_projects`
  ADD CONSTRAINT `department_projects_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `department_projects_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `department_users`
--
ALTER TABLE `department_users`
  ADD CONSTRAINT `department_users_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `department_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `department_work_shifts`
--
ALTER TABLE `department_work_shifts`
  ADD CONSTRAINT `department_work_shifts_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `department_work_shifts_work_shift_id_foreign` FOREIGN KEY (`work_shift_id`) REFERENCES `work_shifts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `designations`
--
ALTER TABLE `designations`
  ADD CONSTRAINT `designations_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `businesses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `designations_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `designations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `disabled_asset_types`
--
ALTER TABLE `disabled_asset_types`
  ADD CONSTRAINT `disabled_asset_types_asset_type_id_foreign` FOREIGN KEY (`asset_type_id`) REFERENCES `asset_types` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `disabled_asset_types_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `businesses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `disabled_asset_types_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `disabled_banks`
--
ALTER TABLE `disabled_banks`
  ADD CONSTRAINT `disabled_banks_bank_id_foreign` FOREIGN KEY (`bank_id`) REFERENCES `banks` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `disabled_banks_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `businesses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `disabled_banks_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `disabled_designations`
--
ALTER TABLE `disabled_designations`
  ADD CONSTRAINT `disabled_designations_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `businesses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `disabled_designations_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `disabled_designations_designation_id_foreign` FOREIGN KEY (`designation_id`) REFERENCES `designations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `disabled_employment_statuses`
--
ALTER TABLE `disabled_employment_statuses`
  ADD CONSTRAINT `disabled_employment_statuses_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `businesses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `disabled_employment_statuses_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `disabled_employment_statuses_employment_status_id_foreign` FOREIGN KEY (`employment_status_id`) REFERENCES `employment_statuses` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `disabled_job_platforms`
--
ALTER TABLE `disabled_job_platforms`
  ADD CONSTRAINT `disabled_job_platforms_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `businesses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `disabled_job_platforms_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `disabled_job_platforms_job_platform_id_foreign` FOREIGN KEY (`job_platform_id`) REFERENCES `job_platforms` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `disabled_job_types`
--
ALTER TABLE `disabled_job_types`
  ADD CONSTRAINT `disabled_job_types_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `businesses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `disabled_job_types_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `disabled_job_types_job_type_id_foreign` FOREIGN KEY (`job_type_id`) REFERENCES `job_types` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `disabled_letter_templates`
--
ALTER TABLE `disabled_letter_templates`
  ADD CONSTRAINT `disabled_letter_templates_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `businesses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `disabled_letter_templates_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `disabled_letter_templates_letter_template_id_foreign` FOREIGN KEY (`letter_template_id`) REFERENCES `letter_templates` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `disabled_recruitment_processes`
--
ALTER TABLE `disabled_recruitment_processes`
  ADD CONSTRAINT `disabled_recruitment_processes_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `businesses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `disabled_recruitment_processes_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `disabled_recruitment_processes_recruitment_process_id_foreign` FOREIGN KEY (`recruitment_process_id`) REFERENCES `recruitment_processes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `disabled_setting_leave_types`
--
ALTER TABLE `disabled_setting_leave_types`
  ADD CONSTRAINT `disabled_setting_leave_types_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `businesses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `disabled_setting_leave_types_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `disabled_setting_leave_types_setting_leave_type_id_foreign` FOREIGN KEY (`setting_leave_type_id`) REFERENCES `setting_leave_types` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `disabled_task_categories`
--
ALTER TABLE `disabled_task_categories`
  ADD CONSTRAINT `disabled_task_categories_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `businesses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `disabled_task_categories_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `disabled_task_categories_task_category_id_foreign` FOREIGN KEY (`task_category_id`) REFERENCES `task_categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `disabled_termination_reasons`
--
ALTER TABLE `disabled_termination_reasons`
  ADD CONSTRAINT `disabled_termination_reasons_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `businesses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `disabled_termination_reasons_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `disabled_termination_reasons_termination_reason_id_foreign` FOREIGN KEY (`termination_reason_id`) REFERENCES `termination_reasons` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `disabled_termination_types`
--
ALTER TABLE `disabled_termination_types`
  ADD CONSTRAINT `disabled_termination_types_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `businesses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `disabled_termination_types_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `disabled_termination_types_termination_type_id_foreign` FOREIGN KEY (`termination_type_id`) REFERENCES `termination_types` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `disabled_work_locations`
--
ALTER TABLE `disabled_work_locations`
  ADD CONSTRAINT `disabled_work_locations_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `businesses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `disabled_work_locations_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `disabled_work_locations_work_location_id_foreign` FOREIGN KEY (`work_location_id`) REFERENCES `work_locations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `emailer_logs`
--
ALTER TABLE `emailer_logs`
  ADD CONSTRAINT `emailer_logs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `email_templates`
--
ALTER TABLE `email_templates`
  ADD CONSTRAINT `email_templates_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `businesses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `email_templates_wrapper_id_foreign` FOREIGN KEY (`wrapper_id`) REFERENCES `email_template_wrappers` (`id`);

--
-- Constraints for table `employee_address_histories`
--
ALTER TABLE `employee_address_histories`
  ADD CONSTRAINT `employee_address_histories_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `employee_address_histories_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `employee_passport_detail_histories`
--
ALTER TABLE `employee_passport_detail_histories`
  ADD CONSTRAINT `employee_passport_detail_histories_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `businesses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `employee_passport_detail_histories_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `employee_passport_detail_histories_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `employee_pension_histories`
--
ALTER TABLE `employee_pension_histories`
  ADD CONSTRAINT `employee_pension_histories_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `businesses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `employee_pension_histories_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `employee_pension_histories_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `employee_project_histories`
--
ALTER TABLE `employee_project_histories`
  ADD CONSTRAINT `employee_project_histories_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `businesses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `employee_project_histories_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `employee_right_to_works`
--
ALTER TABLE `employee_right_to_works`
  ADD CONSTRAINT `employee_right_to_works_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `businesses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `employee_right_to_works_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `employee_right_to_works_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `employee_right_to_work_histories`
--
ALTER TABLE `employee_right_to_work_histories`
  ADD CONSTRAINT `employee_right_to_work_histories_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `businesses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `employee_right_to_work_histories_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `employee_right_to_work_histories_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `employee_rotas`
--
ALTER TABLE `employee_rotas`
  ADD CONSTRAINT `employee_rotas_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `businesses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `employee_rotas_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `employee_rotas_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `employee_rotas_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `employee_rota_details`
--
ALTER TABLE `employee_rota_details`
  ADD CONSTRAINT `employee_rota_details_employee_rota_id_foreign` FOREIGN KEY (`employee_rota_id`) REFERENCES `employee_rotas` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `employee_sponsorship_histories`
--
ALTER TABLE `employee_sponsorship_histories`
  ADD CONSTRAINT `employee_sponsorship_histories_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `businesses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `employee_sponsorship_histories_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `employee_sponsorship_histories_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `employee_visa_detail_histories`
--
ALTER TABLE `employee_visa_detail_histories`
  ADD CONSTRAINT `employee_visa_detail_histories_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `businesses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `employee_visa_detail_histories_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `employee_visa_detail_histories_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `employment_statuses`
--
ALTER TABLE `employment_statuses`
  ADD CONSTRAINT `employment_statuses_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `businesses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `employment_statuses_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `employment_statuses` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `exit_interviews`
--
ALTER TABLE `exit_interviews`
  ADD CONSTRAINT `exit_interviews_termination_id_foreign` FOREIGN KEY (`termination_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `exit_interviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `holidays`
--
ALTER TABLE `holidays`
  ADD CONSTRAINT `holidays_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `businesses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `holidays_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `job_listings`
--
ALTER TABLE `job_listings`
  ADD CONSTRAINT `job_listings_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `businesses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `job_listings_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `job_listings_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `job_listings_job_type_id_foreign` FOREIGN KEY (`job_type_id`) REFERENCES `job_types` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `job_listings_work_location_id_foreign` FOREIGN KEY (`work_location_id`) REFERENCES `work_locations` (`id`);

--
-- Constraints for table `job_listing_job_platforms`
--
ALTER TABLE `job_listing_job_platforms`
  ADD CONSTRAINT `job_listing_job_platforms_job_listing_id_foreign` FOREIGN KEY (`job_listing_id`) REFERENCES `job_listings` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `job_listing_job_platforms_job_platform_id_foreign` FOREIGN KEY (`job_platform_id`) REFERENCES `job_platforms` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `job_platforms`
--
ALTER TABLE `job_platforms`
  ADD CONSTRAINT `job_platforms_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `businesses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `job_platforms_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `job_platforms` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `job_types`
--
ALTER TABLE `job_types`
  ADD CONSTRAINT `job_types_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `businesses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `job_types_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `job_types` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `labels`
--
ALTER TABLE `labels`
  ADD CONSTRAINT `labels_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `businesses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `labels_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `labels_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `leaves`
--
ALTER TABLE `leaves`
  ADD CONSTRAINT `leaves_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `businesses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `leaves_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `leaves_leave_type_id_foreign` FOREIGN KEY (`leave_type_id`) REFERENCES `setting_leave_types` (`id`),
  ADD CONSTRAINT `leaves_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `leave_approvals`
--
ALTER TABLE `leave_approvals`
  ADD CONSTRAINT `leave_approvals_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `leave_approvals_leave_id_foreign` FOREIGN KEY (`leave_id`) REFERENCES `leaves` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `leave_histories`
--
ALTER TABLE `leave_histories`
  ADD CONSTRAINT `leave_histories_actor_id_foreign` FOREIGN KEY (`actor_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `leave_histories_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `businesses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `leave_histories_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `leave_histories_leave_type_id_foreign` FOREIGN KEY (`leave_type_id`) REFERENCES `setting_leave_types` (`id`),
  ADD CONSTRAINT `leave_histories_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `leave_records`
--
ALTER TABLE `leave_records`
  ADD CONSTRAINT `leave_records_leave_id_foreign` FOREIGN KEY (`leave_id`) REFERENCES `leaves` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `leave_record_arrears`
--
ALTER TABLE `leave_record_arrears`
  ADD CONSTRAINT `leave_record_arrears_leave_record_id_foreign` FOREIGN KEY (`leave_record_id`) REFERENCES `leave_records` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `leave_record_histories`
--
ALTER TABLE `leave_record_histories`
  ADD CONSTRAINT `leave_record_histories_leave_id_foreign` FOREIGN KEY (`leave_id`) REFERENCES `leave_histories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `leave_type_employment_statuses`
--
ALTER TABLE `leave_type_employment_statuses`
  ADD CONSTRAINT `leave_type_employment_statuses_employment_status_id_foreign` FOREIGN KEY (`employment_status_id`) REFERENCES `employment_statuses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `leave_type_employment_statuses_setting_leave_type_id_foreign` FOREIGN KEY (`setting_leave_type_id`) REFERENCES `setting_leave_types` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `letter_templates`
--
ALTER TABLE `letter_templates`
  ADD CONSTRAINT `letter_templates_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `businesses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `letter_templates_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `letter_templates` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `businesses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `notifications_notification_template_id_foreign` FOREIGN KEY (`notification_template_id`) REFERENCES `notification_templates` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `notifications_receiver_id_foreign` FOREIGN KEY (`receiver_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `notifications_sender_id_foreign` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `paid_leave_employment_statuses`
--
ALTER TABLE `paid_leave_employment_statuses`
  ADD CONSTRAINT `paid_leave_employment_statuses_employment_status_id_foreign` FOREIGN KEY (`employment_status_id`) REFERENCES `employment_statuses` (`id`),
  ADD CONSTRAINT `paid_leave_employment_statuses_setting_leave_id_foreign` FOREIGN KEY (`setting_leave_id`) REFERENCES `setting_leaves` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `payrolls`
--
ALTER TABLE `payrolls`
  ADD CONSTRAINT `payrolls_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `businesses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `payrolls_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `payrolls_payrun_id_foreign` FOREIGN KEY (`payrun_id`) REFERENCES `payruns` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `payrolls_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `payroll_attendances`
--
ALTER TABLE `payroll_attendances`
  ADD CONSTRAINT `payroll_attendances_attendance_id_foreign` FOREIGN KEY (`attendance_id`) REFERENCES `attendances` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `payroll_attendances_payroll_id_foreign` FOREIGN KEY (`payroll_id`) REFERENCES `payrolls` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `payroll_holidays`
--
ALTER TABLE `payroll_holidays`
  ADD CONSTRAINT `payroll_holidays_holiday_id_foreign` FOREIGN KEY (`holiday_id`) REFERENCES `holidays` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `payroll_holidays_payroll_id_foreign` FOREIGN KEY (`payroll_id`) REFERENCES `payrolls` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `payroll_leave_records`
--
ALTER TABLE `payroll_leave_records`
  ADD CONSTRAINT `payroll_leave_records_leave_record_id_foreign` FOREIGN KEY (`leave_record_id`) REFERENCES `leave_records` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `payroll_leave_records_payroll_id_foreign` FOREIGN KEY (`payroll_id`) REFERENCES `payrolls` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `payruns`
--
ALTER TABLE `payruns`
  ADD CONSTRAINT `payruns_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `businesses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `payruns_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `payrun_departments`
--
ALTER TABLE `payrun_departments`
  ADD CONSTRAINT `payrun_departments_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `payrun_departments_payrun_id_foreign` FOREIGN KEY (`payrun_id`) REFERENCES `payruns` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `payrun_users`
--
ALTER TABLE `payrun_users`
  ADD CONSTRAINT `payrun_users_payrun_id_foreign` FOREIGN KEY (`payrun_id`) REFERENCES `payruns` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `payrun_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `payslips`
--
ALTER TABLE `payslips`
  ADD CONSTRAINT `payslips_bank_id_foreign` FOREIGN KEY (`bank_id`) REFERENCES `banks` (`id`),
  ADD CONSTRAINT `payslips_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `payslips_payroll_id_foreign` FOREIGN KEY (`payroll_id`) REFERENCES `payrolls` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `payslips_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_product_category_id_foreign` FOREIGN KEY (`product_category_id`) REFERENCES `product_categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_galleries`
--
ALTER TABLE `product_galleries`
  ADD CONSTRAINT `product_galleries_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_variations`
--
ALTER TABLE `product_variations`
  ADD CONSTRAINT `product_variations_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `projects`
--
ALTER TABLE `projects`
  ADD CONSTRAINT `projects_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `businesses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `projects_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `recruitment_processes`
--
ALTER TABLE `recruitment_processes`
  ADD CONSTRAINT `recruitment_processes_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `businesses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `recruitment_processes_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `recruitment_processes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `recruitment_process_orders`
--
ALTER TABLE `recruitment_process_orders`
  ADD CONSTRAINT `recruitment_process_orders_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `businesses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `recruitment_process_orders_recruitment_process_id_foreign` FOREIGN KEY (`recruitment_process_id`) REFERENCES `recruitment_processes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `reminders`
--
ALTER TABLE `reminders`
  ADD CONSTRAINT `reminders_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `businesses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reminders_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `reseller_modules`
--
ALTER TABLE `reseller_modules`
  ADD CONSTRAINT `reseller_modules_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reseller_modules_reseller_id_foreign` FOREIGN KEY (`reseller_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `salary_histories`
--
ALTER TABLE `salary_histories`
  ADD CONSTRAINT `salary_histories_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `service_plans`
--
ALTER TABLE `service_plans`
  ADD CONSTRAINT `service_plans_business_tier_id_foreign` FOREIGN KEY (`business_tier_id`) REFERENCES `business_tiers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `service_plan_discount_codes`
--
ALTER TABLE `service_plan_discount_codes`
  ADD CONSTRAINT `service_plan_discount_codes_service_plan_id_foreign` FOREIGN KEY (`service_plan_id`) REFERENCES `service_plans` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `service_plan_modules`
--
ALTER TABLE `service_plan_modules`
  ADD CONSTRAINT `service_plan_modules_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `service_plan_modules_service_plan_id_foreign` FOREIGN KEY (`service_plan_id`) REFERENCES `service_plans` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `setting_attendances`
--
ALTER TABLE `setting_attendances`
  ADD CONSTRAINT `setting_attendances_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `businesses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `setting_attendances_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `setting_attendance_special_roles`
--
ALTER TABLE `setting_attendance_special_roles`
  ADD CONSTRAINT `setting_attendance_special_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `setting_attendance_special_roles_setting_attendance_id_foreign` FOREIGN KEY (`setting_attendance_id`) REFERENCES `setting_attendances` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `setting_attendance_special_users`
--
ALTER TABLE `setting_attendance_special_users`
  ADD CONSTRAINT `setting_attendance_special_users_setting_attendance_id_foreign` FOREIGN KEY (`setting_attendance_id`) REFERENCES `setting_attendances` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `setting_attendance_special_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `setting_leaves`
--
ALTER TABLE `setting_leaves`
  ADD CONSTRAINT `setting_leaves_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `businesses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `setting_leaves_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `setting_leave_special_roles`
--
ALTER TABLE `setting_leave_special_roles`
  ADD CONSTRAINT `setting_leave_special_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `setting_leave_special_roles_setting_leave_id_foreign` FOREIGN KEY (`setting_leave_id`) REFERENCES `setting_leaves` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `setting_leave_special_users`
--
ALTER TABLE `setting_leave_special_users`
  ADD CONSTRAINT `setting_leave_special_users_setting_leave_id_foreign` FOREIGN KEY (`setting_leave_id`) REFERENCES `setting_leaves` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `setting_leave_special_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `setting_leave_types`
--
ALTER TABLE `setting_leave_types`
  ADD CONSTRAINT `setting_leave_types_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `businesses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `setting_leave_types_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `setting_leave_types_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `setting_leave_types` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `setting_payment_dates`
--
ALTER TABLE `setting_payment_dates`
  ADD CONSTRAINT `setting_payment_dates_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `businesses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `setting_payment_dates_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `setting_payruns`
--
ALTER TABLE `setting_payruns`
  ADD CONSTRAINT `setting_payruns_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `businesses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `setting_payruns_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `setting_payrun_restricted_departments`
--
ALTER TABLE `setting_payrun_restricted_departments`
  ADD CONSTRAINT `setting_payrun_restricted_departments_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `setting_payrun_restricted_departments_setting_payrun_id_foreign` FOREIGN KEY (`setting_payrun_id`) REFERENCES `setting_payruns` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `setting_payrun_restricted_users`
--
ALTER TABLE `setting_payrun_restricted_users`
  ADD CONSTRAINT `setting_payrun_restricted_users_setting_payrun_id_foreign` FOREIGN KEY (`setting_payrun_id`) REFERENCES `setting_payruns` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `setting_payrun_restricted_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `setting_payslips`
--
ALTER TABLE `setting_payslips`
  ADD CONSTRAINT `setting_payslips_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `businesses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `setting_payslips_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `social_sites`
--
ALTER TABLE `social_sites`
  ADD CONSTRAINT `social_sites_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `businesses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `social_sites_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `tasks`
--
ALTER TABLE `tasks`
  ADD CONSTRAINT `tasks_assigned_by_foreign` FOREIGN KEY (`assigned_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `tasks_assigned_to_foreign` FOREIGN KEY (`assigned_to`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tasks_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `businesses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tasks_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `tasks_parent_task_id_foreign` FOREIGN KEY (`parent_task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tasks_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tasks_task_category_id_foreign` FOREIGN KEY (`task_category_id`) REFERENCES `task_categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `task_assignees`
--
ALTER TABLE `task_assignees`
  ADD CONSTRAINT `task_assignees_assignee_id_foreign` FOREIGN KEY (`assignee_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `task_assignees_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `task_categories`
--
ALTER TABLE `task_categories`
  ADD CONSTRAINT `task_categories_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `businesses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `task_categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `task_categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `task_categories_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `task_category_orders`
--
ALTER TABLE `task_category_orders`
  ADD CONSTRAINT `task_category_orders_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `businesses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `task_category_orders_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `task_category_orders_task_category_id_foreign` FOREIGN KEY (`task_category_id`) REFERENCES `task_categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `task_comment_mentions`
--
ALTER TABLE `task_comment_mentions`
  ADD CONSTRAINT `task_comment_mentions_comment_id_foreign` FOREIGN KEY (`comment_id`) REFERENCES `comments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `task_comment_mentions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `task_labels`
--
ALTER TABLE `task_labels`
  ADD CONSTRAINT `task_labels_label_id_foreign` FOREIGN KEY (`label_id`) REFERENCES `labels` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `task_labels_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `terminations`
--
ALTER TABLE `terminations`
  ADD CONSTRAINT `terminations_termination_reason_id_foreign` FOREIGN KEY (`termination_reason_id`) REFERENCES `termination_reasons` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `terminations_termination_type_id_foreign` FOREIGN KEY (`termination_type_id`) REFERENCES `termination_types` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `terminations_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `termination_reasons`
--
ALTER TABLE `termination_reasons`
  ADD CONSTRAINT `termination_reasons_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `businesses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `termination_reasons_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `termination_reasons` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `termination_types`
--
ALTER TABLE `termination_types`
  ADD CONSTRAINT `termination_types_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `businesses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `termination_types_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `termination_types` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `unpaid_leave_employment_statuses`
--
ALTER TABLE `unpaid_leave_employment_statuses`
  ADD CONSTRAINT `unpaid_leave_employment_statuses_employment_status_id_foreign` FOREIGN KEY (`employment_status_id`) REFERENCES `employment_statuses` (`id`),
  ADD CONSTRAINT `unpaid_leave_employment_statuses_setting_leave_id_foreign` FOREIGN KEY (`setting_leave_id`) REFERENCES `setting_leaves` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_bank_id_foreign` FOREIGN KEY (`bank_id`) REFERENCES `banks` (`id`),
  ADD CONSTRAINT `users_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `businesses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `users_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `users_designation_id_foreign` FOREIGN KEY (`designation_id`) REFERENCES `designations` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `users_employment_status_id_foreign` FOREIGN KEY (`employment_status_id`) REFERENCES `employment_statuses` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `users_recruitment_process_id_foreign` FOREIGN KEY (`recruitment_process_id`) REFERENCES `recruitment_processes` (`id`);

--
-- Constraints for table `user_announcements`
--
ALTER TABLE `user_announcements`
  ADD CONSTRAINT `user_announcements_announcement_id_foreign` FOREIGN KEY (`announcement_id`) REFERENCES `announcements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_announcements_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_assets`
--
ALTER TABLE `user_assets`
  ADD CONSTRAINT `user_assets_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `businesses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_assets_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `user_assets_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `user_asset_histories`
--
ALTER TABLE `user_asset_histories`
  ADD CONSTRAINT `user_asset_histories_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `businesses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_asset_histories_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `user_asset_histories_user_asset_id_foreign` FOREIGN KEY (`user_asset_id`) REFERENCES `user_assets` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `user_documents`
--
ALTER TABLE `user_documents`
  ADD CONSTRAINT `user_documents_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `user_documents_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_education_histories`
--
ALTER TABLE `user_education_histories`
  ADD CONSTRAINT `user_education_histories_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `user_education_histories_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_holidays`
--
ALTER TABLE `user_holidays`
  ADD CONSTRAINT `user_holidays_holiday_id_foreign` FOREIGN KEY (`holiday_id`) REFERENCES `holidays` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_holidays_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `user_job_histories`
--
ALTER TABLE `user_job_histories`
  ADD CONSTRAINT `user_job_histories_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `user_job_histories_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_letters`
--
ALTER TABLE `user_letters`
  ADD CONSTRAINT `user_letters_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `businesses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_letters_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_letter_email_histories`
--
ALTER TABLE `user_letter_email_histories`
  ADD CONSTRAINT `user_letter_email_histories_user_letter_id_foreign` FOREIGN KEY (`user_letter_id`) REFERENCES `user_letters` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_notes`
--
ALTER TABLE `user_notes`
  ADD CONSTRAINT `user_notes_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `user_notes_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `user_notes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_note_mentions`
--
ALTER TABLE `user_note_mentions`
  ADD CONSTRAINT `user_note_mentions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_note_mentions_user_note_id_foreign` FOREIGN KEY (`user_note_id`) REFERENCES `user_notes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_projects`
--
ALTER TABLE `user_projects`
  ADD CONSTRAINT `user_projects_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_projects_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_recruitment_processes`
--
ALTER TABLE `user_recruitment_processes`
  ADD CONSTRAINT `user_recruitment_processes_recruitment_process_id_foreign` FOREIGN KEY (`recruitment_process_id`) REFERENCES `recruitment_processes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_recruitment_processes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_social_sites`
--
ALTER TABLE `user_social_sites`
  ADD CONSTRAINT `user_social_sites_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `user_social_sites_social_site_id_foreign` FOREIGN KEY (`social_site_id`) REFERENCES `social_sites` (`id`),
  ADD CONSTRAINT `user_social_sites_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_work_locations`
--
ALTER TABLE `user_work_locations`
  ADD CONSTRAINT `user_work_locations_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_work_locations_work_location_id_foreign` FOREIGN KEY (`work_location_id`) REFERENCES `work_locations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_work_shifts`
--
ALTER TABLE `user_work_shifts`
  ADD CONSTRAINT `user_work_shifts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_work_shifts_work_shift_id_foreign` FOREIGN KEY (`work_shift_id`) REFERENCES `work_shifts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `work_locations`
--
ALTER TABLE `work_locations`
  ADD CONSTRAINT `work_locations_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `businesses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `work_locations_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `work_locations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `work_shifts`
--
ALTER TABLE `work_shifts`
  ADD CONSTRAINT `work_shifts_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `businesses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `work_shifts_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `work_shift_details`
--
ALTER TABLE `work_shift_details`
  ADD CONSTRAINT `work_shift_details_work_shift_id_foreign` FOREIGN KEY (`work_shift_id`) REFERENCES `work_shifts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `work_shift_detail_histories`
--
ALTER TABLE `work_shift_detail_histories`
  ADD CONSTRAINT `work_shift_detail_histories_work_shift_id_foreign` FOREIGN KEY (`work_shift_id`) REFERENCES `work_shift_histories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `work_shift_histories`
--
ALTER TABLE `work_shift_histories`
  ADD CONSTRAINT `work_shift_histories_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `businesses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `work_shift_histories_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `work_shift_locations`
--
ALTER TABLE `work_shift_locations`
  ADD CONSTRAINT `work_shift_locations_work_location_id_foreign` FOREIGN KEY (`work_location_id`) REFERENCES `work_locations` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `work_shift_locations_work_shift_id_foreign` FOREIGN KEY (`work_shift_id`) REFERENCES `work_shifts` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
