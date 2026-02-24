-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 09, 2026 at 04:41 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `firesense_hotel`
--

-- --------------------------------------------------------

--
-- Table structure for table `alert`
--

CREATE TABLE `alert` (
  `id` int(11) NOT NULL,
  `equipment_id` int(11) NOT NULL,
  `alert_type` varchar(100) DEFAULT NULL,
  `severity` varchar(50) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `timestamp` datetime DEFAULT current_timestamp(),
  `is_resolved` tinyint(1) DEFAULT 0,
  `resolved_by` int(11) DEFAULT NULL,
  `resolved_at` datetime DEFAULT NULL,
  `is_read` tinyint(1) DEFAULT 0,
  `read_at` datetime DEFAULT NULL,
  `read_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `alert`
--

INSERT INTO `alert` (`id`, `equipment_id`, `alert_type`, `severity`, `message`, `timestamp`, `is_resolved`, `resolved_by`, `resolved_at`, `is_read`, `read_at`, `read_by`, `created_at`) VALUES
(1, 1, 'Service Overdue', 'Critical', 'Fire Extinguisher at lobby is 1083 days overdue for service!', '2026-02-07 18:50:43', 1, 2, '2026-02-07 14:25:04', 1, '2026-02-07 14:23:40', 3, '2026-02-07 07:50:43'),
(44, 1, 'Service Overdue', 'Critical', 'Fire Extinguisher at lobby is 1085 days overdue for service!', '2026-02-09 15:01:08', 0, NULL, NULL, 0, NULL, NULL, '2026-02-09 04:01:08'),
(45, 3, 'Service Overdue', 'Medium', 'Fire Alarm at Resturant is 1 days overdue for service!', '2026-02-09 15:01:08', 0, NULL, NULL, 1, '2026-02-09 09:37:52', 3, '2026-02-09 04:01:08'),
(46, 4, 'High Risk Equipment', 'High', 'Emergency Light at kitchen has HIGH RISK (Score: 85%). Immediate attention required!', '2026-02-09 15:01:08', 0, NULL, NULL, 0, NULL, NULL, '2026-02-09 04:01:08'),
(47, 4, 'Service Overdue', 'Critical', 'Emergency Light at kitchen is 1163 days overdue for service!', '2026-02-09 15:01:08', 0, NULL, NULL, 0, NULL, NULL, '2026-02-09 04:01:08'),
(48, 5, 'Service Overdue', 'Critical', 'Smoke Detector at lobby is 364 days overdue for service!', '2026-02-09 15:01:08', 0, NULL, NULL, 0, NULL, NULL, '2026-02-09 04:01:08'),
(49, 6, 'High Risk Equipment', 'High', 'Sprinkler System at Resturant has HIGH RISK (Score: 75%). Immediate attention required!', '2026-02-09 15:01:08', 0, NULL, NULL, 0, NULL, NULL, '2026-02-09 04:01:08'),
(50, 6, 'Service Overdue', 'Critical', 'Sprinkler System at Resturant is 1335 days overdue for service!', '2026-02-09 15:01:08', 0, NULL, NULL, 0, NULL, NULL, '2026-02-09 04:01:08');

-- --------------------------------------------------------

--
-- Table structure for table `chat_messages`
--

CREATE TABLE `chat_messages` (
  `id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `attachment_url` varchar(500) DEFAULT NULL,
  `attachment_name` varchar(200) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `is_edited` tinyint(1) DEFAULT NULL,
  `edited_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `chat_messages`
--

INSERT INTO `chat_messages` (`id`, `room_id`, `user_id`, `message`, `attachment_url`, `attachment_name`, `created_at`, `is_edited`, `edited_at`) VALUES
(1, 1, 1, 'hello', NULL, NULL, '2026-02-09 11:12:04', 0, NULL),
(2, 2, 1, 'hello 1', NULL, NULL, '2026-02-09 11:12:22', 0, NULL),
(3, 3, 1, 'hello 123', NULL, NULL, '2026-02-09 11:12:31', 0, NULL),
(4, 1, 3, 'issu in kitchen', NULL, NULL, '2026-02-09 11:17:02', 0, NULL),
(5, 2, 2, 'hello', NULL, NULL, '2026-02-09 14:35:20', 0, NULL),
(6, 1, 2, 'ok', NULL, NULL, '2026-02-09 14:35:39', 0, NULL),
(7, 4, 3, 'hello', NULL, NULL, '2026-02-09 15:26:08', 0, NULL),
(8, 4, 3, 'how are uou', NULL, NULL, '2026-02-09 15:26:16', 0, NULL),
(9, 4, 2, 'hello', NULL, NULL, '2026-02-09 15:26:42', 0, NULL),
(10, 4, 2, 'what i do', NULL, NULL, '2026-02-09 15:26:58', 0, NULL),
(11, 1, 2, '123', NULL, NULL, '2026-02-09 15:27:05', 0, NULL),
(12, 2, 2, '789', NULL, NULL, '2026-02-09 15:27:11', 0, NULL),
(13, 3, 2, '587', NULL, NULL, '2026-02-09 15:27:17', 0, NULL),
(14, 2, 1, 'dddg', NULL, NULL, '2026-02-09 15:36:35', 0, NULL),
(15, 1, 1, 'dfsfs', NULL, NULL, '2026-02-09 15:36:41', 0, NULL),
(16, 4, 1, 'ddf', NULL, NULL, '2026-02-09 15:36:47', 0, NULL),
(17, 3, 1, '244', NULL, NULL, '2026-02-09 15:36:55', 0, NULL),
(18, 4, 2, 'dddg', NULL, NULL, '2026-02-09 15:37:25', 0, NULL),
(19, 1, 3, 'ok', NULL, NULL, '2026-02-09 15:38:11', 0, NULL),
(20, 2, 3, 'ok', NULL, NULL, '2026-02-09 15:38:17', 0, NULL),
(21, 3, 3, 'ok', NULL, NULL, '2026-02-09 15:38:22', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `chat_read_receipts`
--

CREATE TABLE `chat_read_receipts` (
  `id` int(11) NOT NULL,
  `message_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `read_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `chat_read_receipts`
--

INSERT INTO `chat_read_receipts` (`id`, `message_id`, `user_id`, `read_at`) VALUES
(1, 1, 2, '2026-02-09 11:12:54'),
(2, 3, 2, '2026-02-09 11:13:05'),
(3, 3, 3, '2026-02-09 11:13:41'),
(4, 2, 3, '2026-02-09 11:13:46'),
(5, 1, 3, '2026-02-09 11:13:49'),
(6, 4, 1, '2026-02-09 11:17:23'),
(7, 4, 2, '2026-02-09 14:34:37'),
(8, 2, 2, '2026-02-09 14:35:08'),
(9, 6, 3, '2026-02-09 15:25:49'),
(10, 5, 3, '2026-02-09 15:25:52'),
(11, 7, 2, '2026-02-09 15:26:33'),
(12, 8, 2, '2026-02-09 15:26:33'),
(13, 7, 1, '2026-02-09 15:27:45'),
(14, 8, 1, '2026-02-09 15:27:45'),
(15, 9, 1, '2026-02-09 15:27:45'),
(16, 10, 1, '2026-02-09 15:27:46'),
(17, 6, 1, '2026-02-09 15:31:14'),
(18, 11, 1, '2026-02-09 15:31:14'),
(19, 5, 1, '2026-02-09 15:31:21'),
(20, 12, 1, '2026-02-09 15:31:21'),
(21, 13, 1, '2026-02-09 15:31:23'),
(22, 16, 2, '2026-02-09 15:37:13'),
(23, 15, 2, '2026-02-09 15:37:27'),
(24, 14, 2, '2026-02-09 15:37:29'),
(25, 17, 2, '2026-02-09 15:37:32'),
(26, 10, 3, '2026-02-09 15:38:01'),
(27, 18, 3, '2026-02-09 15:38:01'),
(28, 9, 3, '2026-02-09 15:38:01'),
(29, 16, 3, '2026-02-09 15:38:01'),
(30, 11, 3, '2026-02-09 15:38:05'),
(31, 15, 3, '2026-02-09 15:38:05'),
(32, 12, 3, '2026-02-09 15:38:13'),
(33, 14, 3, '2026-02-09 15:38:13'),
(34, 17, 3, '2026-02-09 15:38:18'),
(35, 13, 3, '2026-02-09 15:38:18'),
(36, 19, 2, '2026-02-09 15:38:35'),
(37, 20, 2, '2026-02-09 15:38:36'),
(38, 21, 2, '2026-02-09 15:38:37'),
(39, 18, 1, '2026-02-09 15:38:52'),
(40, 19, 1, '2026-02-09 15:38:53'),
(41, 20, 1, '2026-02-09 15:38:58'),
(42, 21, 1, '2026-02-09 15:38:59');

-- --------------------------------------------------------

--
-- Table structure for table `chat_rooms`
--

CREATE TABLE `chat_rooms` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `room_type` varchar(50) DEFAULT NULL,
  `equipment_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `chat_rooms`
--

INSERT INTO `chat_rooms` (`id`, `name`, `room_type`, `equipment_id`, `created_at`, `created_by`, `is_active`) VALUES
(1, 'General Discussion', 'general', NULL, '2026-02-09 10:39:39', 1, 1),
(2, 'Maintenance Team', 'general', NULL, '2026-02-09 10:39:39', 1, 1),
(3, 'Urgent Issues', 'general', NULL, '2026-02-09 10:39:39', 1, 1),
(4, 'tech', 'maintenance', NULL, '2026-02-09 14:37:03', 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `equipment`
--

CREATE TABLE `equipment` (
  `id` int(11) NOT NULL,
  `equipment_id` varchar(50) NOT NULL,
  `equipment_type` varchar(100) NOT NULL,
  `serial_number` varchar(100) DEFAULT NULL,
  `manufacturer` varchar(100) DEFAULT NULL,
  `model` varchar(100) DEFAULT NULL,
  `install_year` int(11) NOT NULL,
  `install_date` date DEFAULT NULL,
  `last_service_date` date NOT NULL,
  `next_service_date` date DEFAULT NULL,
  `service_interval_months` int(11) DEFAULT 6,
  `location` varchar(200) NOT NULL,
  `floor` varchar(50) DEFAULT NULL,
  `zone` varchar(100) DEFAULT NULL,
  `near_emergency_exit` tinyint(1) DEFAULT 0,
  `condition` varchar(50) DEFAULT 'Good',
  `usage_level` varchar(50) DEFAULT NULL,
  `daily_exposure_hours` int(11) DEFAULT NULL,
  `humidity_level` varchar(50) DEFAULT NULL,
  `temperature_avg` int(11) DEFAULT NULL,
  `coastal_exposure` tinyint(1) DEFAULT 0,
  `certification_status` varchar(50) DEFAULT 'Valid',
  `last_audit_score` int(11) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `status` varchar(50) DEFAULT 'ACTIVE',
  `created_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `equipment`
--

INSERT INTO `equipment` (`id`, `equipment_id`, `equipment_type`, `serial_number`, `manufacturer`, `model`, `install_year`, `install_date`, `last_service_date`, `next_service_date`, `service_interval_months`, `location`, `floor`, `zone`, `near_emergency_exit`, `condition`, `usage_level`, `daily_exposure_hours`, `humidity_level`, `temperature_avg`, `coastal_exposure`, `certification_status`, `last_audit_score`, `notes`, `created_at`, `status`, `created_by`) VALUES
(1, 'FE000001', 'Fire Extinguisher', '12345', 'sony', 'xcv', 2021, '2022-10-18', '2022-08-24', '2023-02-20', 6, 'lobby', '1st Floor', 'zone A', 1, 'Poor', 'Medium', 12, 'Medium', 25, 0, 'Pending', 25, '', '2026-02-06 16:19:00', 'ACTIVE', 1),
(2, 'FE000002', 'Fire Hose', '123456', 'Samsung', 'kjh', 2025, '2026-02-12', '2026-02-07', '2026-08-06', 6, 'kitchen', '1st Floor', 'zone c', 1, 'Good', 'Medium', NULL, '', 20, 0, 'Valid', NULL, '', '2026-02-07 14:34:38', 'ACTIVE', 2),
(3, 'FE000003', 'Fire Alarm', '25268', 'Honeywell', 'asd', 2024, '2024-06-04', '2025-08-12', '2026-02-08', 6, 'Resturant', '1st Floor', 'zone A', 0, 'Good', 'Medium', NULL, 'Medium', NULL, 0, 'Valid', NULL, '', '2026-02-08 12:34:20', 'ACTIVE', 1),
(4, 'FE000004', 'Emergency Light', '587896', 'xinomi', 'gtr', 2020, '2020-02-08', '2022-06-07', '2022-12-04', 6, 'kitchen', '2nd Floor', 'zone B', 1, 'Poor', 'High', 12, 'High', NULL, 0, 'Expired', NULL, '', '2026-02-08 12:38:00', 'ACTIVE', 1),
(5, 'FE000005', 'Smoke Detector', '782546', 'swan', 'sdz', 2023, '2023-11-22', '2024-08-14', '2025-02-10', 6, 'lobby', 'Ground Floor', '', 1, 'Fair', 'Medium', 15, 'Medium', NULL, 0, 'Pending', 45, '', '2026-02-08 12:40:25', 'ACTIVE', 1),
(6, 'FE000006', 'Sprinkler System', '25876', 'firebee', 'nmk', 2021, '2021-06-08', '2021-12-17', '2022-06-15', 6, 'Resturant', '1st Floor', 'zone c', 1, 'Poor', 'High', 20, 'High', 25, 1, 'Expired', 20, '', '2026-02-08 12:43:03', 'ACTIVE', 1);

-- --------------------------------------------------------

--
-- Table structure for table `hotel_settings`
--

CREATE TABLE `hotel_settings` (
  `id` int(11) NOT NULL,
  `hotel_name` varchar(200) DEFAULT NULL,
  `star_rating` int(11) DEFAULT 5,
  `city` varchar(100) DEFAULT NULL,
  `province` varchar(100) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(120) DEFAULT NULL,
  `website` varchar(200) DEFAULT NULL,
  `hotel_type` varchar(100) DEFAULT NULL,
  `logo_url` varchar(500) DEFAULT NULL,
  `total_rooms` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `hotel_settings`
--

INSERT INTO `hotel_settings` (`id`, `hotel_name`, `star_rating`, `city`, `province`, `address`, `phone`, `email`, `website`, `hotel_type`, `logo_url`, `total_rooms`, `updated_at`, `updated_by`) VALUES
(1, 'Amaya Hills ', 5, 'kandy', 'Central', 'Heerassagala, Kandy 20000', '+94 81 247 8000', 'info@amayahills.lk', 'https://www.amayaresorts.com/amayahills/', 'Hill Country', NULL, 200, '2026-02-09 14:42:39', 1),
(2, 'Your Hotel Name - Please Update in Settings', 5, 'Colombo', 'Western', NULL, NULL, NULL, NULL, 'City Hotel', NULL, 100, '2026-02-05 15:04:23', NULL),
(3, 'Your Hotel Name - Please Update in Settings', 5, 'Colombo', 'Western', NULL, NULL, NULL, NULL, 'City Hotel', NULL, 100, '2026-02-06 21:04:27', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `maintenance_record`
--

CREATE TABLE `maintenance_record` (
  `id` int(11) NOT NULL,
  `record_id` varchar(50) NOT NULL,
  `equipment_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `maintenance_date` date NOT NULL,
  `maintenance_type` varchar(100) DEFAULT NULL,
  `technician_name` varchar(200) DEFAULT NULL,
  `technician_company` varchar(200) DEFAULT NULL,
  `issues_found` text DEFAULT NULL,
  `actions_taken` text DEFAULT NULL,
  `parts_replaced` text DEFAULT NULL,
  `cost_lkr` decimal(10,2) DEFAULT NULL,
  `duration_hours` decimal(5,2) DEFAULT NULL,
  `next_service_date` date DEFAULT NULL,
  `status` varchar(50) DEFAULT 'Completed',
  `notes` text DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `prediction`
--

CREATE TABLE `prediction` (
  `id` int(11) NOT NULL,
  `equipment_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `prediction_date` datetime DEFAULT current_timestamp(),
  `risk_level` varchar(50) NOT NULL,
  `risk_score` int(11) NOT NULL,
  `summary` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `predictions`
--

CREATE TABLE `predictions` (
  `id` int(11) NOT NULL,
  `equipment_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `risk_level` varchar(20) NOT NULL,
  `risk_score` int(11) DEFAULT NULL,
  `prediction_date` datetime DEFAULT NULL,
  `summary` text DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `predictions`
--

INSERT INTO `predictions` (`id`, `equipment_id`, `user_id`, `risk_level`, `risk_score`, `prediction_date`, `summary`, `status`) VALUES
(1, 1, 2, 'Medium', 58, '2026-02-07 14:46:05', 'Risk Score: 58% | Age: 5 years | Condition: Poor', 'ACTIVE'),
(2, 1, 2, 'Medium', 58, '2026-02-07 14:46:15', 'Risk Score: 58% | Age: 5 years | Condition: Poor', 'ACTIVE'),
(3, 2, 2, 'Low', 8, '2026-02-07 14:46:23', 'Risk Score: 8% | Age: 1 years | Condition: Good', 'ACTIVE'),
(4, 1, 3, 'Medium', 58, '2026-02-07 18:41:56', 'Risk Score: 58% | Age: 5 years | Condition: Poor', 'ACTIVE'),
(5, 2, 3, 'Low', 8, '2026-02-07 18:42:20', 'Risk Score: 8% | Age: 1 years | Condition: Good', 'ACTIVE'),
(6, 2, 3, 'Low', 8, '2026-02-07 18:42:26', 'Risk Score: 8% | Age: 1 years | Condition: Good', 'ACTIVE'),
(7, 1, 3, 'Medium', 58, '2026-02-07 18:42:40', 'Risk Score: 58% | Age: 5 years | Condition: Poor', 'ACTIVE'),
(8, 6, 1, 'High', 75, '2026-02-08 12:43:52', 'Risk Score: 75% | Age: 5 years | Condition: Poor', 'ACTIVE'),
(9, 4, 1, 'High', 85, '2026-02-08 12:44:22', 'Risk Score: 85% | Age: 6 years | Condition: Poor', 'ACTIVE'),
(10, 5, 1, 'Medium', 53, '2026-02-08 12:44:31', 'Risk Score: 53% | Age: 3 years | Condition: Fair', 'ACTIVE'),
(11, 3, 1, 'Low', 8, '2026-02-08 12:44:37', 'Risk Score: 8% | Age: 2 years | Condition: Good', 'ACTIVE'),
(12, 2, 1, 'Low', 8, '2026-02-08 12:44:45', 'Risk Score: 8% | Age: 1 years | Condition: Good', 'ACTIVE'),
(13, 1, 1, 'Medium', 58, '2026-02-08 12:44:51', 'Risk Score: 58% | Age: 5 years | Condition: Poor', 'ACTIVE'),
(14, 6, 1, 'High', 75, '2026-02-08 12:44:59', 'Risk Score: 75% | Age: 5 years | Condition: Poor', 'ACTIVE'),
(15, 4, 1, 'High', 85, '2026-02-09 09:10:38', 'Risk Score: 85% | Age: 6 years | Condition: Poor', 'ACTIVE'),
(16, 6, 3, 'High', 75, '2026-02-09 09:33:19', 'Risk Score: 75% | Age: 5 years | Condition: Poor', 'ACTIVE');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(80) NOT NULL,
  `password` varchar(200) NOT NULL,
  `email` varchar(120) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `role` varchar(50) DEFAULT 'Technician',
  `status` varchar(20) DEFAULT 'ACTIVE',
  `date_joined` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `email`, `phone`, `role`, `status`, `date_joined`) VALUES
(1, 'admin', '$2b$12$gNPc6YK8.1wgfOV2JEhbTOXLwJrKUJUcAsLozo9Zcm.csC1gcTKbi', 'admin@yourhotel.lk', '+94 77 123 4567', 'Admin', 'ACTIVE', '2026-02-05 15:03:04'),
(2, 'manager', '$2b$12$UxES3zysJ8JEgqrKhmcIRu1hHHSvJN3.emXPNYRSsBFfa05joL8r2', 'manager@yourhotel.lk', '+94 77 123 4568', 'Manager', 'ACTIVE', '2026-02-05 15:03:04'),
(3, 'tech1', '$2b$12$/OXtIXvXe620wEvkdydZL.Y6SEVf6a1m5smo/QHRO0TpcpKb6E0UK', 'tech1@yourhotel.lk', '+94 77 123 4569', 'Technician', 'ACTIVE', '2026-02-05 15:03:04');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alert`
--
ALTER TABLE `alert`
  ADD PRIMARY KEY (`id`),
  ADD KEY `equipment_id` (`equipment_id`),
  ADD KEY `resolved_by` (`resolved_by`),
  ADD KEY `read_by` (`read_by`);

--
-- Indexes for table `chat_messages`
--
ALTER TABLE `chat_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `room_id` (`room_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `chat_read_receipts`
--
ALTER TABLE `chat_read_receipts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `message_id` (`message_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `chat_rooms`
--
ALTER TABLE `chat_rooms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `equipment_id` (`equipment_id`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `equipment`
--
ALTER TABLE `equipment`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `equipment_id` (`equipment_id`),
  ADD KEY `fk_equipment_created_by` (`created_by`);

--
-- Indexes for table `hotel_settings`
--
ALTER TABLE `hotel_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_hotel_settings_updated_by` (`updated_by`);

--
-- Indexes for table `maintenance_record`
--
ALTER TABLE `maintenance_record`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `record_id` (`record_id`),
  ADD KEY `equipment_id` (`equipment_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `prediction`
--
ALTER TABLE `prediction`
  ADD PRIMARY KEY (`id`),
  ADD KEY `equipment_id` (`equipment_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `predictions`
--
ALTER TABLE `predictions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `equipment_id` (`equipment_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `alert`
--
ALTER TABLE `alert`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `chat_messages`
--
ALTER TABLE `chat_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `chat_read_receipts`
--
ALTER TABLE `chat_read_receipts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `chat_rooms`
--
ALTER TABLE `chat_rooms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `equipment`
--
ALTER TABLE `equipment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `hotel_settings`
--
ALTER TABLE `hotel_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `maintenance_record`
--
ALTER TABLE `maintenance_record`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `prediction`
--
ALTER TABLE `prediction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `predictions`
--
ALTER TABLE `predictions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `alert`
--
ALTER TABLE `alert`
  ADD CONSTRAINT `fk_alert_equipment` FOREIGN KEY (`equipment_id`) REFERENCES `equipment` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_alert_read_by` FOREIGN KEY (`read_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_alert_resolved_by` FOREIGN KEY (`resolved_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `chat_messages`
--
ALTER TABLE `chat_messages`
  ADD CONSTRAINT `chat_messages_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `chat_rooms` (`id`),
  ADD CONSTRAINT `chat_messages_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `chat_read_receipts`
--
ALTER TABLE `chat_read_receipts`
  ADD CONSTRAINT `chat_read_receipts_ibfk_1` FOREIGN KEY (`message_id`) REFERENCES `chat_messages` (`id`),
  ADD CONSTRAINT `chat_read_receipts_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `chat_rooms`
--
ALTER TABLE `chat_rooms`
  ADD CONSTRAINT `chat_rooms_ibfk_1` FOREIGN KEY (`equipment_id`) REFERENCES `equipment` (`id`),
  ADD CONSTRAINT `chat_rooms_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `equipment`
--
ALTER TABLE `equipment`
  ADD CONSTRAINT `fk_equipment_created_by` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `hotel_settings`
--
ALTER TABLE `hotel_settings`
  ADD CONSTRAINT `fk_hotel_settings_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `maintenance_record`
--
ALTER TABLE `maintenance_record`
  ADD CONSTRAINT `fk_maintenance_equipment` FOREIGN KEY (`equipment_id`) REFERENCES `equipment` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_maintenance_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `prediction`
--
ALTER TABLE `prediction`
  ADD CONSTRAINT `fk_prediction_equipment` FOREIGN KEY (`equipment_id`) REFERENCES `equipment` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_prediction_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `predictions`
--
ALTER TABLE `predictions`
  ADD CONSTRAINT `predictions_ibfk_1` FOREIGN KEY (`equipment_id`) REFERENCES `equipment` (`id`),
  ADD CONSTRAINT `predictions_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
