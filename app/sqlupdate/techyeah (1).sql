-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 15, 2024 at 09:29 AM
-- Server version: 8.0.31
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `techyeah`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
CREATE TABLE IF NOT EXISTS `admins` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role_id` int NOT NULL DEFAULT '0' COMMENT '0: admin\r\n1: sales team\r\n',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`,`username`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `username`, `email_verified_at`, `image`, `role_id`, `password`, `remember_token`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', 'admin@site.com', 'admin', NULL, '6346ab2e6449f1665575726.png', 0, '$2y$10$DPcZdU5ncDNJqfcQyNRYuuvyj4QKYq1QLVcxJ/TNqELQN/JkyxAvO', NULL, 0, NULL, '2022-10-12 09:25:27'),
(3, 'Shajid', 'admin@example.com', 'shajid121', NULL, NULL, 1, '$2y$10$1vg7iBSXo6AlS.IiX/YG9ug8NWMtfsMCrnV/dFu763b9P5u8C66Zq', NULL, 0, '2023-08-14 11:39:50', '2023-08-14 11:39:50'),
(4, 'shakil', 'shakil@gmail.com', 'shakil01', NULL, NULL, 1, '$2y$10$OERESajipDH4gJiSSkowqOkuMkJn85H27U/hN0eHDbChgARyaTRIS', NULL, 5, '2023-09-08 13:37:30', '2023-09-08 13:37:30'),
(5, NULL, NULL, '1', NULL, NULL, 2, '$2y$10$g/IT6fVLD2W2E4XeNcBSW.doZwNJHEgV.K1WH9UoWpe8x/jXWvZIq', NULL, 0, '2023-10-18 00:32:26', '2023-10-18 00:32:26'),
(6, 'Alex', 'alex@gmail.com', 'alex01', NULL, NULL, 2, '$2y$10$oVVvFT6AuxJR3K.LAXaJ1uNWaN0KidfmUAQFn.iT4kEQrYDQFPnhq', NULL, 0, '2023-10-18 00:33:09', '2023-10-18 00:33:09'),
(7, 'jhon', 'jhon@gmail.com', 'jhon01', NULL, NULL, 1, '$2y$10$ID7BHjooLcBb1CN3aec7muDGE7yI5oKs9totaBbFDdAm0dg5hi3e.', NULL, 0, '2023-10-18 00:34:46', '2023-10-18 00:34:46');

-- --------------------------------------------------------

--
-- Table structure for table `admin_notifications`
--

DROP TABLE IF EXISTS `admin_notifications`;
CREATE TABLE IF NOT EXISTS `admin_notifications` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int UNSIGNED NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT '0',
  `click_url` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_notifications`
--

INSERT INTO `admin_notifications` (`id`, `user_id`, `title`, `is_read`, `click_url`, `created_at`, `updated_at`) VALUES
(1, 0, 'SMS Error: unexpected response from API', 0, '#', '2023-01-18 03:59:33', '2023-01-18 03:59:33'),
(2, 8, 'Deposit successful via Mollie - USD', 0, '/admin/deposit/successful', '2023-02-13 07:57:29', '2023-02-13 07:57:29'),
(3, 0, 'SMS Error: unexpected response from API', 0, '#', '2023-02-13 07:57:31', '2023-02-13 07:57:31'),
(4, 0, 'SMS Error: unexpected response from API', 0, '#', '2023-10-21 18:14:17', '2023-10-21 18:14:17'),
(5, 0, 'SMS Error: unexpected response from API', 0, '#', '2023-10-21 18:14:19', '2023-10-21 18:14:19'),
(6, 0, 'SMS Error: unexpected response from API', 0, '#', '2023-10-21 18:14:22', '2023-10-21 18:14:22'),
(7, 0, 'SMS Error: unexpected response from API', 0, '#', '2023-10-21 18:14:24', '2023-10-21 18:14:24'),
(8, 0, 'SMS Error: unexpected response from API', 0, '#', '2023-10-21 18:14:26', '2023-10-21 18:14:26'),
(9, 0, 'SMS Error: unexpected response from API', 1, '#', '2023-10-21 18:14:29', '2024-03-11 11:16:26'),
(10, 0, 'SMS Error: unexpected response from API', 0, '#', '2023-10-21 18:14:31', '2023-10-21 18:14:31'),
(11, 0, 'SMS Error: unexpected response from API', 0, '#', '2023-10-21 18:14:33', '2023-10-21 18:14:33'),
(12, 0, 'SMS Error: unexpected response from API', 1, '#', '2023-10-21 18:14:36', '2024-03-11 11:16:21'),
(13, 0, 'SMS Error: unexpected response from API', 0, '#', '2023-10-21 18:14:38', '2023-10-21 18:14:38'),
(14, 0, 'SMS Error: unexpected response from API', 0, '#', '2023-10-21 18:14:40', '2023-10-21 18:14:40'),
(15, 0, 'SMS Error: unexpected response from API', 1, '#', '2023-10-21 18:15:09', '2024-03-11 11:16:35'),
(16, 34, 'New member registered', 1, '/admin/users./detail/34', '2023-11-26 07:25:59', '2024-03-11 11:16:08'),
(17, 35, 'New member registered', 1, '/admin/users./detail/35', '2023-12-04 05:52:11', '2024-03-11 11:16:17'),
(18, 36, 'New member registered', 1, '/admin/users./detail/36', '2023-12-04 06:20:10', '2024-03-11 11:16:01'),
(19, 0, 'A new support ticket has opened ', 1, '/admin/ticket/view/1', '2024-03-11 11:04:50', '2024-03-11 11:15:55');

-- --------------------------------------------------------

--
-- Table structure for table `admin_password_resets`
--

DROP TABLE IF EXISTS `admin_password_resets`;
CREATE TABLE IF NOT EXISTS `admin_password_resets` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `email` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `check_in_outs`
--

DROP TABLE IF EXISTS `check_in_outs`;
CREATE TABLE IF NOT EXISTS `check_in_outs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `work_order_id` bigint UNSIGNED NOT NULL,
  `company_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `tech_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `check_in` varchar(40) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `check_out` varchar(40) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `total_hours` varchar(40) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `time_zone` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `check_in_outs`
--

INSERT INTO `check_in_outs` (`id`, `work_order_id`, `company_name`, `tech_name`, `check_in`, `check_out`, `date`, `total_hours`, `time_zone`, `created_at`, `updated_at`) VALUES
(53, 10, 'Richards Bonner Inc', 'gg', '17:46:17', '17:55:51', '19/02/24', '0:9', 'EST.', '2024-02-19 11:55:40', '2024-02-19 11:55:51'),
(54, 10, 'Richards Bonner Inc', 'kk', '17:56:03', '17:58:48', '19/02/24', '0:2', 'EST.', '2024-02-19 11:58:34', '2024-02-19 11:58:48'),
(55, 10, 'Richards Bonner Inc', 'tt', '18:08:48', '18:09:24', '19/02/24', '0:0', 'EST.', '2024-02-19 12:09:20', '2024-02-19 12:09:24'),
(56, 10, 'Richards Bonner Inc', 'n', '18:10:47', '18:11:04', '19/02/24', '0:0', 'EST.', '2024-02-19 12:11:01', '2024-02-19 12:11:04'),
(57, 10, 'Richards Bonner Inc', 'kk', '10:30:15', '10:30:58', '20/02/24', '0:0', 'EST.', '2024-02-20 04:30:52', '2024-02-20 04:30:58'),
(58, 10, 'Richards Bonner Inc', 'cc', '10:30:15', '10:31:46', '20/02/24', '0:1', 'EST.', '2024-02-20 04:31:43', '2024-02-20 04:31:46'),
(59, 11, 'Parks and Howell Inc', 'cc', '14:27:14', '14:28:08', '20/02/24', '0:0', NULL, '2024-02-20 08:27:58', '2024-02-20 08:28:08'),
(60, 108, 'Butler Williams Plc', 'ff', '15:45:42', '15:51:27', '21/02/24', '0:5', NULL, '2024-02-21 09:51:19', '2024-02-21 09:51:27'),
(61, 10, 'Richards Bonner Inc', 'cc', '12:32:02', '23:30:00', '24/02/24', '10:57', 'EST.', '2024-02-24 06:32:45', '2024-02-24 06:33:31'),
(65, 1, 'Landry Mcgowan Trading', 'John', '10:14:18', '22:16:13', '02/26/24', '12:1', NULL, '2024-02-26 16:15:19', '2024-02-26 16:16:13'),
(66, 6, 'Powers and Lester Trading', 'kk', '17:23:16', '19:00:00', '03/11/24', '1:36', NULL, '2024-03-11 11:23:50', '2024-03-11 11:35:55'),
(67, 34, 'Centex Data Services', 'Ralph', '00:57:12', '00:57:56', '04/24/24', '0:0', 'CST.', '2024-04-23 18:57:31', '2024-04-23 18:57:56'),
(68, 6, 'Powers and Lester Trading', 'alex', '23:38:23', '23:41:14', '04/25/24', '0:2', NULL, '2024-04-25 17:40:55', '2024-04-25 17:41:14'),
(69, 40, 'Flores Conway Plc', 'alex', '23:42:01', '23:42:33', '04/25/24', '0:0', 'CST.', '2024-04-25 17:42:19', '2024-04-25 17:42:33');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
CREATE TABLE IF NOT EXISTS `customers` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `customer_id` bigint DEFAULT NULL,
  `company_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_type` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `s_rate` decimal(28,8) DEFAULT NULL,
  `e_rate` decimal(28,8) DEFAULT NULL,
  `travel` decimal(28,8) DEFAULT NULL,
  `billing_term` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type_phone` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type_pos` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type_wireless` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type_cctv` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `team` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sales_person` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `project_manager` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id_index` (`customer_id`),
  KEY `company_name_index` (`company_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `customer_id`, `company_name`, `address`, `email`, `customer_type`, `phone`, `s_rate`, `e_rate`, `travel`, `billing_term`, `type_phone`, `type_pos`, `type_wireless`, `type_cctv`, `team`, `sales_person`, `project_manager`, `created_at`, `updated_at`) VALUES
(1, 60001, 'Richards Underwood Associates', '{\"address\":\"Love and Odonnell LLC\",\"country\":\"United States\",\"city\":\"New York\",\"state\":\"NY\",\"zip_code\":\"10001\"}', 'gonemen@mailinator.com', 'Customer', '36749', '43819.00000000', '34375.00000000', '61355.00000000', 'NET30', 'Pos', 'demo', 'Duran and Brady Associates', 'Cantu and Mcdonald Plc', 'Red Team', 'Mckinney and Kirkland Inc', 'Blair Gross Plc', '2024-02-26 04:03:53', '2024-02-26 04:03:53'),
(3, 60003, 'Carter and Rivera Plc', '{\"address\":\"Booth Mcclain Trading\",\"country\":\"Barnes and Vasquez Inc\",\"city\":\"Beck and Salazar Trading\",\"state\":\"Incididunt illo irur\",\"zip_code\":\"Franco Puckett Trading\"}', 'judaded@mailinator.com', 'Prospecting', '28601', '34619.00000000', '15107.00000000', '18578.00000000', 'NET30', 'Conrad and Farmer Inc', 'Lawson and Acevedo Traders', 'Wood Burgess Traders', 'Pate and Hewitt Associates', 'Red Team', 'Sharpe and Whitaker Trading', 'Figueroa and Gross LLC', '2024-03-10 08:51:12', '2024-03-10 08:51:12'),
(4, 60004, 'Golden and Ochoa Trading', '{\"address\":\"Kinney and Becker Associates\",\"country\":\"Avery Richmond Plc\",\"city\":\"Horne Hutchinson Inc\",\"state\":\"Pariatur Quam numqu\",\"zip_code\":\"Mullins Holland Co\"}', 'vode@mailinator.com', 'Customer', '69581', '21357.00000000', '66342.00000000', '87852.00000000', 'NET45', 'Boyle Burton Traders', 'Benjamin Vasquez Traders', 'Ramsey Gentry Co', 'Suarez and Franklin Traders', 'Blue Team', 'Meyers and Gould Traders', 'Jensen and Conner Plc', '2024-03-10 08:51:25', '2024-03-10 08:51:25'),
(5, 60005, 'Spot On Network', '{\"address\":\"55 Chruch St.\",\"country\":\"United States\",\"city\":\"New Haven\",\"state\":\"CT\",\"zip_code\":\"06510\"}', 'srog@spon.com', 'Customer', '7203087451', '95.00000000', '139.00000000', '95.00000000', 'NET30', NULL, NULL, 'Meraki', NULL, 'Blue Team', 'Tom', 'Tony', '2024-04-23 14:35:38', '2024-04-23 14:35:38');

-- --------------------------------------------------------

--
-- Table structure for table `customer_invoices`
--

DROP TABLE IF EXISTS `customer_invoices`;
CREATE TABLE IF NOT EXISTS `customer_invoices` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `invoice_number` int NOT NULL,
  `work_order_id` bigint NOT NULL DEFAULT '0',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '0: Unpaid 1: Paid',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer_sites`
--

DROP TABLE IF EXISTS `customer_sites`;
CREATE TABLE IF NOT EXISTS `customer_sites` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `site_id` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_id` bigint NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address_1` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address_2` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zipcode` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time_zone` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customer_sites`
--

INSERT INTO `customer_sites` (`id`, `site_id`, `customer_id`, `description`, `location`, `address_1`, `address_2`, `city`, `state`, `zipcode`, `time_zone`, `created_at`, `updated_at`) VALUES
(1, '12345', 1, NULL, 'New Road lane 2/A', 'New York', NULL, 'New York', 'NY', '10001', NULL, '2024-02-26 04:05:00', '2024-02-26 04:05:00'),
(2, '00001', 5, 'Dwell at Oviedo', 'EMF Chandler', '500 Sugar Millr Rd', NULL, 'Orlando', 'FL', '32765', 'EST.', '2024-04-23 14:39:01', '2024-04-23 14:39:01'),
(3, '00005', 5, 'Related Oaks on Lamar', 'Related Oaks on Lamar', '8071 North Lamar', NULL, 'Austin', 'TX', '78753', 'CST.', '2024-04-23 14:50:01', '2024-04-23 14:50:01');

-- --------------------------------------------------------

--
-- Table structure for table `deposits`
--

DROP TABLE IF EXISTS `deposits`;
CREATE TABLE IF NOT EXISTS `deposits` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int UNSIGNED NOT NULL DEFAULT '0',
  `method_code` int UNSIGNED NOT NULL DEFAULT '0',
  `amount` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `method_currency` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `charge` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `rate` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `final_amo` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `detail` text COLLATE utf8mb4_unicode_ci,
  `btc_amo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `btc_wallet` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trx` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_try` int NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1=>success, 2=>pending, 3=>cancel',
  `from_api` tinyint(1) NOT NULL DEFAULT '0',
  `admin_feedback` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `deposits`
--

INSERT INTO `deposits` (`id`, `user_id`, `method_code`, `amount`, `method_currency`, `charge`, `rate`, `final_amo`, `detail`, `btc_amo`, `btc_wallet`, `trx`, `payment_try`, `status`, `from_api`, `admin_feedback`, `created_at`, `updated_at`) VALUES
(1, 8, 115, '100.00000000', 'USD', '2.00000000', '1.00000000', '102.00000000', '{\"cardToken\":\"tkn_WjGvAGtest\",\"cardNumber\":\"3704\",\"cardHolder\":\"T. TEST\",\"cardAudience\":\"consumer\",\"cardLabel\":\"Mastercard\",\"cardCountryCode\":\"NL\",\"cardSecurity\":\"3dsecure\",\"feeRegion\":\"other\"}', '0', '', '7A27BS2YJXEW', 0, 1, 0, NULL, '2023-02-13 07:57:04', '2023-02-13 07:57:29'),
(2, 8, 122, '10.00000000', 'BTC', '1.10000000', '1.00000000', '11.10000000', NULL, '0', '', 'MEBJG9UJYRJD', 0, 0, 0, NULL, '2023-02-14 04:36:35', '2023-02-14 04:36:35'),
(3, 8, 122, '10.00000000', 'BTC', '1.10000000', '1.00000000', '11.10000000', NULL, '0', '', 'M8NH34N9T4NE', 0, 0, 0, NULL, '2023-02-14 04:41:49', '2023-02-14 04:41:49'),
(4, 8, 122, '10.00000000', 'BTC', '1.10000000', '1.00000000', '11.10000000', '\"{\\\"id\\\":\\\"2h66kPMBByCk8DxEjsSSyZ\\\",\\\"storeId\\\":\\\"HsqFVTXSeUFJu7caoYZc3CTnP8g5LErVdHhEXPVTheHf\\\",\\\"amount\\\":\\\"10.00\\\",\\\"checkoutLink\\\":\\\"https:\\\\\\/\\\\\\/testnet.demo.btcpayserver.org\\\\\\/i\\\\\\/2h66kPMBByCk8DxEjsSSyZ\\\",\\\"status\\\":\\\"New\\\",\\\"additionalStatus\\\":\\\"None\\\",\\\"monitoringExpiration\\\":1676446037,\\\"expirationTime\\\":1676359637,\\\"createdTime\\\":1676358737,\\\"availableStatusesForManualMarking\\\":[\\\"Settled\\\",\\\"Invalid\\\"],\\\"archived\\\":false,\\\"type\\\":\\\"Standard\\\",\\\"currency\\\":\\\"USD\\\",\\\"metadata\\\":{\\\"orderId\\\":\\\"8PFENVVEK8AE\\\"},\\\"checkout\\\":{\\\"speedPolicy\\\":\\\"MediumSpeed\\\",\\\"paymentMethods\\\":[\\\"BTC\\\"],\\\"defaultPaymentMethod\\\":null,\\\"expirationMinutes\\\":15,\\\"monitoringMinutes\\\":1440,\\\"paymentTolerance\\\":0,\\\"redirectURL\\\":null,\\\"redirectAutomatically\\\":false,\\\"requiresRefundEmail\\\":null,\\\"defaultLanguage\\\":null,\\\"checkoutType\\\":null},\\\"receipt\\\":{\\\"enabled\\\":null,\\\"showQR\\\":null,\\\"showPayments\\\":null}}\"', '0', '2h66kPMBByCk8DxEjsSSyZ', '8PFENVVEK8AE', 0, 0, 0, NULL, '2023-02-14 04:42:16', '2023-02-14 04:42:18'),
(5, 8, 508, '10.00000000', 'BTC', '1.10000000', '1.00000000', '11.10000000', NULL, '0.00050982', '3GnXmdC8PUuWUFzPHfFAbV3F7n1LAbuxfr', '9NEFC4SQYYFO', 0, 0, 0, NULL, '2023-02-14 04:58:24', '2023-02-14 04:59:50'),
(6, 8, 509, '10.00000000', 'BTC', '1.10000000', '1.00000000', '11.10000000', NULL, '0', '', '236HYPQY4PGR', 0, 0, 0, NULL, '2023-02-14 05:05:57', '2023-02-14 05:05:57');

-- --------------------------------------------------------

--
-- Table structure for table `extensions`
--

DROP TABLE IF EXISTS `extensions`;
CREATE TABLE IF NOT EXISTS `extensions` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `act` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `script` text COLLATE utf8mb4_unicode_ci,
  `shortcode` text COLLATE utf8mb4_unicode_ci COMMENT 'object',
  `support` text COLLATE utf8mb4_unicode_ci COMMENT 'help section',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=>enable, 2=>disable',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `extensions`
--

INSERT INTO `extensions` (`id`, `act`, `name`, `description`, `image`, `script`, `shortcode`, `support`, `status`, `created_at`, `updated_at`) VALUES
(1, 'tawk-chat', 'Tawk.to', 'Key location is shown bellow', 'tawky_big.png', '<script>\r\n                        var Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();\r\n                        (function(){\r\n                        var s1=document.createElement(\"script\"),s0=document.getElementsByTagName(\"script\")[0];\r\n                        s1.async=true;\r\n                        s1.src=\"https://embed.tawk.to/{{app_key}}\";\r\n                        s1.charset=\"UTF-8\";\r\n                        s1.setAttribute(\"crossorigin\",\"*\");\r\n                        s0.parentNode.insertBefore(s1,s0);\r\n                        })();\r\n                    </script>', '{\"app_key\":{\"title\":\"App Key\",\"value\":\"------\"}}', 'twak.png', 0, '2019-10-18 23:16:05', '2022-03-22 05:22:24'),
(2, 'google-recaptcha2', 'Google Recaptcha 2', 'Key location is shown bellow', 'recaptcha3.png', '\n<script src=\"https://www.google.com/recaptcha/api.js\"></script>\n<div class=\"g-recaptcha\" data-sitekey=\"{{site_key}}\" data-callback=\"verifyCaptcha\"></div>\n<div id=\"g-recaptcha-error\"></div>', '{\"site_key\":{\"title\":\"Site Key\",\"value\":\"6LdPC88fAAAAADQlUf_DV6Hrvgm-pZuLJFSLDOWV\"},\"secret_key\":{\"title\":\"Secret Key\",\"value\":\"6LdPC88fAAAAAG5SVaRYDnV2NpCrptLg2XLYKRKB\"}}', 'recaptcha.png', 0, '2019-10-18 23:16:05', '2023-08-06 07:16:27'),
(3, 'custom-captcha', 'Custom Captcha', 'Just put any random string', 'customcaptcha.png', NULL, '{\"random_key\":{\"title\":\"Random String\",\"value\":\"SecureString\"}}', 'na', 0, '2019-10-18 23:16:05', '2022-10-13 05:02:43'),
(4, 'google-analytics', 'Google Analytics', 'Key location is shown bellow', 'google_analytics.png', '<script async src=\"https://www.googletagmanager.com/gtag/js?id={{app_key}}\"></script>\r\n                <script>\r\n                  window.dataLayer = window.dataLayer || [];\r\n                  function gtag(){dataLayer.push(arguments);}\r\n                  gtag(\"js\", new Date());\r\n                \r\n                  gtag(\"config\", \"{{app_key}}\");\r\n                </script>', '{\"app_key\":{\"title\":\"App Key\",\"value\":\"------\"}}', 'ganalytics.png', 0, NULL, '2021-05-04 10:19:12'),
(5, 'fb-comment', 'Facebook Comment ', 'Key location is shown bellow', 'Facebook.png', '<div id=\"fb-root\"></div><script async defer crossorigin=\"anonymous\" src=\"https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v4.0&appId={{app_key}}&autoLogAppEvents=1\"></script>', '{\"app_key\":{\"title\":\"App Key\",\"value\":\"----\"}}', 'fb_com.PNG', 0, NULL, '2022-03-22 05:18:36');

-- --------------------------------------------------------

--
-- Table structure for table `forms`
--

DROP TABLE IF EXISTS `forms`;
CREATE TABLE IF NOT EXISTS `forms` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `act` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `form_data` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `forms`
--

INSERT INTO `forms` (`id`, `act`, `form_data`, `created_at`, `updated_at`) VALUES
(2, 'manual_deposit', '{\"nid_number\":{\"name\":\"NID Number\",\"label\":\"nid_number\",\"is_required\":\"required\",\"extensions\":null,\"options\":[],\"type\":\"text\"},\"nid_number_22\":{\"name\":\"NID Number 22\",\"label\":\"nid_number_22\",\"is_required\":\"required\",\"extensions\":null,\"options\":[],\"type\":\"textarea\"},\"sadfg\":{\"name\":\"sadfg\",\"label\":\"sadfg\",\"is_required\":\"optional\",\"extensions\":null,\"options\":[],\"type\":\"text\"},\"asdf\":{\"name\":\"asdf\",\"label\":\"asdf\",\"is_required\":\"required\",\"extensions\":null,\"options\":[\"Test\",\"Test2\",\"Test3\"],\"type\":\"select\"},\"nid_number_226985\":{\"name\":\"NID Number 226985\",\"label\":\"nid_number_226985\",\"is_required\":\"required\",\"extensions\":null,\"options\":[\"Test\",\"Test 2\",\"Test 3\"],\"type\":\"checkbox\"},\"nid_number_3333\":{\"name\":\"NID Number 3333\",\"label\":\"nid_number_3333\",\"is_required\":\"required\",\"extensions\":null,\"options\":[\"Test\",\"asdf\"],\"type\":\"radio\"},\"nid_number_3333587\":{\"name\":\"NID Number 3333587\",\"label\":\"nid_number_3333587\",\"is_required\":\"optional\",\"extensions\":\"jpg,bmp,png,pdf\",\"options\":[],\"type\":\"file\"}}', '2022-03-16 01:09:49', '2022-03-17 00:02:54'),
(3, 'manual_deposit', '{\"nid_number\":{\"name\":\"NID Number\",\"label\":\"nid_number\",\"is_required\":\"required\",\"extensions\":null,\"options\":[],\"type\":\"text\"},\"nid_number_226985\":{\"name\":\"NID Number 226985\",\"label\":\"nid_number_226985\",\"is_required\":\"required\",\"extensions\":\"\",\"options\":[],\"type\":\"textarea\"}}', '2022-03-16 04:32:29', '2022-03-16 04:35:32'),
(5, 'withdraw_method', '{\"nid_number_33\":{\"name\":\"NID Number 33\",\"label\":\"nid_number_33\",\"is_required\":\"required\",\"extensions\":\"\",\"options\":[],\"type\":\"textarea\"}}', '2022-03-17 00:45:35', '2022-03-17 00:53:17'),
(6, 'withdraw_method', '{\"nid_number\":{\"name\":\"NID Number\",\"label\":\"nid_number\",\"is_required\":\"required\",\"extensions\":\"\",\"options\":[],\"type\":\"textarea\"}}', '2022-03-17 00:47:04', '2022-03-17 00:47:04'),
(7, 'kyc', '{\"full.name\":{\"name\":\"Full.Name\",\"label\":\"full.name\",\"is_required\":\"required\",\"extensions\":\"\",\"options\":[],\"type\":\"text\"},\"nid_number\":{\"name\":\"NID Number\",\"label\":\"nid_number\",\"is_required\":\"required\",\"extensions\":null,\"options\":[],\"type\":\"text\"},\"gender\":{\"name\":\"Gender\",\"label\":\"gender\",\"is_required\":\"required\",\"extensions\":null,\"options\":[\"Male\",\"Female\",\"Others\"],\"type\":\"select\"},\"you_hobby\":{\"name\":\"You Hobby\",\"label\":\"you_hobby\",\"is_required\":\"required\",\"extensions\":null,\"options\":[\"Programming\",\"Gardening\",\"Traveling\",\"Others\"],\"type\":\"checkbox\"},\"nid_photo\":{\"name\":\"NID Photo\",\"label\":\"nid_photo\",\"is_required\":\"required\",\"extensions\":\"jpg,png\",\"options\":[],\"type\":\"file\"}}', '2022-03-17 02:56:14', '2022-12-17 11:14:11'),
(8, 'manual_deposit', '{\"nid_number\":{\"name\":\"NID Number\",\"label\":\"nid_number\",\"is_required\":\"required\",\"extensions\":\"\",\"options\":[],\"type\":\"text\"}}', '2022-03-21 07:53:25', '2022-03-21 07:53:25'),
(9, 'manual_deposit', '{\"nid_number\":{\"name\":\"NID Number\",\"label\":\"nid_number\",\"is_required\":\"required\",\"extensions\":\"\",\"options\":[],\"type\":\"text\"}}', '2022-03-21 07:54:15', '2022-03-21 07:54:15'),
(10, 'manual_deposit', '{\"nid_number\":{\"name\":\"NID Number\",\"label\":\"nid_number\",\"is_required\":\"required\",\"extensions\":\"\",\"options\":[],\"type\":\"textarea\"}}', '2022-03-21 07:55:15', '2022-03-21 07:55:22'),
(11, 'withdraw_method', '{\"nid_number_2658\":{\"name\":\"NID Number 2658\",\"label\":\"nid_number_2658\",\"is_required\":\"required\",\"extensions\":\"\",\"options\":[\"asdf\"],\"type\":\"checkbox\"}}', '2022-03-22 00:14:09', '2022-03-22 00:14:18'),
(12, 'withdraw_method', '[]', '2022-03-30 09:03:12', '2022-03-30 09:03:12'),
(13, 'withdraw_method', '{\"bank_name\":{\"name\":\"Bank Name\",\"label\":\"bank_name\",\"is_required\":\"required\",\"extensions\":null,\"options\":[],\"type\":\"text\"},\"account_name\":{\"name\":\"Account Name\",\"label\":\"account_name\",\"is_required\":\"required\",\"extensions\":null,\"options\":[],\"type\":\"text\"},\"account_number\":{\"name\":\"Account Number\",\"label\":\"account_number\",\"is_required\":\"required\",\"extensions\":\"\",\"options\":[],\"type\":\"text\"}}', '2022-03-30 09:09:11', '2022-04-03 06:38:57'),
(14, 'withdraw_method', '{\"mobile_number\":{\"name\":\"Mobile Number\",\"label\":\"mobile_number\",\"is_required\":\"required\",\"extensions\":\"\",\"options\":[],\"type\":\"text\"}}', '2022-03-30 09:10:12', '2022-03-30 09:10:12'),
(15, 'manual_deposit', '{\"send_from_number\":{\"name\":\"Send From Number\",\"label\":\"send_from_number\",\"is_required\":\"required\",\"extensions\":\"\",\"options\":[],\"type\":\"text\"},\"transaction_number\":{\"name\":\"Transaction Number\",\"label\":\"transaction_number\",\"is_required\":\"required\",\"extensions\":\"\",\"options\":[],\"type\":\"text\"},\"screenshot\":{\"name\":\"Screenshot\",\"label\":\"screenshot\",\"is_required\":\"required\",\"extensions\":\"jpg,jpeg,png\",\"options\":[],\"type\":\"file\"}}', '2022-03-30 09:15:27', '2022-03-30 09:15:27'),
(16, 'manual_deposit', '{\"transaction_number\":{\"name\":\"Transaction Number\",\"label\":\"transaction_number\",\"is_required\":\"required\",\"extensions\":null,\"options\":[],\"type\":\"text\"},\"screenshot\":{\"name\":\"Screenshot\",\"label\":\"screenshot\",\"is_required\":\"required\",\"extensions\":\"jpg,pdf,docx\",\"options\":[],\"type\":\"file\"}}', '2022-03-30 09:16:43', '2022-04-11 03:19:54'),
(17, 'manual_deposit', '[]', '2022-03-30 09:21:19', '2022-03-30 09:21:19'),
(18, 'manual_deposit', '[]', '2022-07-26 05:53:36', '2022-07-26 05:53:36');

-- --------------------------------------------------------

--
-- Table structure for table `frontends`
--

DROP TABLE IF EXISTS `frontends`;
CREATE TABLE IF NOT EXISTS `frontends` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `data_keys` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data_values` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `frontends`
--

INSERT INTO `frontends` (`id`, `data_keys`, `data_values`, `created_at`, `updated_at`) VALUES
(1, 'seo.data', '{\"seo_image\":\"1\",\"keywords\":[\"admin\",\"blog\",\"aaaa\",\"ddd\",\"aaa\"],\"description\":\"Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit\",\"social_title\":\"Viserlab Limited\",\"social_description\":\"Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit ff\",\"image\":\"5fa397a629bee1604556710.jpg\"}', '2020-07-04 23:42:52', '2021-01-03 07:43:02'),
(24, 'about.content', '{\"has_image\":\"1\",\"heading\":\"Latest News\",\"subheading\":\"nb\",\"description\":\"fdg sdfgsdf g ggg\",\"about_icon\":\"<i class=\\\"las la-address-card\\\"><\\/i>\",\"background_image\":\"60951a84abd141620384388.png\",\"about_image\":\"5f9914e907ace1603867881.jpg\"}', '2020-10-28 00:51:20', '2023-08-20 09:46:01'),
(25, 'blog.content', '{\"heading\":\"Latest News\",\"subheading\":\"------\"}', '2020-10-28 00:51:34', '2022-03-19 04:41:13'),
(26, 'blog.element', '{\"has_image\":[\"1\",\"1\"],\"title\":\"this is a test blog 2\",\"description\":\"aewf asdf\",\"description_nic\":\"asdf asdf\",\"blog_icon\":\"<i class=\\\"lab la-hornbill\\\"><\\/i>\",\"blog_image_1\":\"5f99164f1baec1603868239.jpg\",\"blog_image_2\":\"5ff2e146346d21609752902.jpg\"}', '2020-10-28 00:57:19', '2021-01-04 03:35:02'),
(27, 'contact_us.content', '{\"title\":\"Auctor gravida vestibulu\",\"short_details\":\"55f55\",\"email_address\":\"5555f\",\"contact_details\":\"5555h\",\"contact_number\":\"5555a\",\"latitude\":\"5555h\",\"longitude\":\"5555s\",\"website_footer\":\"5555qqq\"}', '2020-10-28 00:59:19', '2020-11-01 04:51:54'),
(28, 'counter.content', '{\"heading\":\"Latest News\",\"sub_heading\":\"Register New Account\"}', '2020-10-28 01:04:02', '2020-10-28 01:04:02'),
(31, 'social_icon.element', '{\"title\":\"Facebook\",\"social_icon\":\"<i class=\\\"las la-expand\\\"><\\/i>\",\"url\":\"https:\\/\\/www.google.com\\/\"}', '2020-11-12 04:07:30', '2021-05-12 05:56:59'),
(33, 'feature.content', '{\"heading\":\"asdf\",\"sub_heading\":\"asdf\"}', '2021-01-03 23:40:54', '2021-01-03 23:40:55'),
(34, 'feature.element', '{\"title\":\"asdf\",\"description\":\"asdf\",\"feature_icon\":\"asdf\"}', '2021-01-03 23:41:02', '2021-01-03 23:41:02'),
(35, 'service.element', '{\"trx_type\":\"withdraw\",\"service_icon\":\"<i class=\\\"las la-highlighter\\\"><\\/i>\",\"title\":\"asdfasdf\",\"description\":\"asdfasdfasdfasdf\"}', '2021-03-06 01:12:10', '2021-03-06 01:12:10'),
(36, 'service.content', '{\"trx_type\":\"deposit\",\"heading\":\"asdf fffff\",\"subheading\":\"555\"}', '2021-03-06 01:27:34', '2022-03-30 08:07:06'),
(39, 'banner.content', '{\"heading\":\"Latest News\",\"sub_heading\":\"Lorem ipsum dolor sit, amet consectetur adipisicing elit. Esse voluptatum eaque earum quos quia? Id aspernatur ratione, voluptas nulla rerum laudantium neque ipsam eaque\"}', '2021-05-02 06:09:30', '2021-05-02 06:09:30'),
(41, 'cookie.data', '{\"short_desc\":\"We may use cookies or any other tracking technologies when you visit our website, including any other media form, mobile website, or mobile application related or connected to help customize the Site and improve your experience.\",\"description\":\"<div class=\\\"mb-5\\\" style=\\\"color: rgb(111, 111, 111); font-family: Nunito, sans-serif; margin-bottom: 3rem !important;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight: 600; line-height: 1.3; font-size: 24px; font-family: Exo, sans-serif; color: rgb(54, 54, 54);\\\">What information do we collect?<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right: 0px; margin-left: 0px; font-size: 18px !important;\\\">We gather data from you when you register on our site, submit a request, buy any services, react to an overview, or round out a structure. At the point when requesting any assistance or enrolling on our site, as suitable, you might be approached to enter your: name, email address, or telephone number. You may, nonetheless, visit our site anonymously.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color: rgb(111, 111, 111); font-family: Nunito, sans-serif; margin-bottom: 3rem !important;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight: 600; line-height: 1.3; font-size: 24px; font-family: Exo, sans-serif; color: rgb(54, 54, 54);\\\">How do we protect your information?<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right: 0px; margin-left: 0px; font-size: 18px !important;\\\">All provided delicate\\/credit data is sent through Stripe.<br>After an exchange, your private data (credit cards, social security numbers, financials, and so on) won\'t be put away on our workers.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color: rgb(111, 111, 111); font-family: Nunito, sans-serif; margin-bottom: 3rem !important;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight: 600; line-height: 1.3; font-size: 24px; font-family: Exo, sans-serif; color: rgb(54, 54, 54);\\\">Do we disclose any information to outside parties?<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right: 0px; margin-left: 0px; font-size: 18px !important;\\\">We don\'t sell, exchange, or in any case move to outside gatherings by and by recognizable data. This does exclude confided in outsiders who help us in working our site, leading our business, or adjusting you, since those gatherings consent to keep this data private. We may likewise deliver your data when we accept discharge is suitable to follow the law, implement our site strategies, or ensure our own or others\' rights, property, or wellbeing.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color: rgb(111, 111, 111); font-family: Nunito, sans-serif; margin-bottom: 3rem !important;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight: 600; line-height: 1.3; font-size: 24px; font-family: Exo, sans-serif; color: rgb(54, 54, 54);\\\">Children\'s Online Privacy Protection Act Compliance<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right: 0px; margin-left: 0px; font-size: 18px !important;\\\">We are consistent with the prerequisites of COPPA (Children\'s Online Privacy Protection Act), we don\'t gather any data from anybody under 13 years old. Our site, items, and administrations are completely coordinated to individuals who are in any event 13 years of age or more established.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color: rgb(111, 111, 111); font-family: Nunito, sans-serif; margin-bottom: 3rem !important;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight: 600; line-height: 1.3; font-size: 24px; font-family: Exo, sans-serif; color: rgb(54, 54, 54);\\\">Changes to our Privacy Policy<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right: 0px; margin-left: 0px; font-size: 18px !important;\\\">If we decide to change our privacy policy, we will post those changes on this page.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color: rgb(111, 111, 111); font-family: Nunito, sans-serif; margin-bottom: 3rem !important;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight: 600; line-height: 1.3; font-size: 24px; font-family: Exo, sans-serif; color: rgb(54, 54, 54);\\\">How long we retain your information?<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right: 0px; margin-left: 0px; font-size: 18px !important;\\\">At the point when you register for our site, we cycle and keep your information we have about you however long you don\'t erase the record or withdraw yourself (subject to laws and guidelines).<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color: rgb(111, 111, 111); font-family: Nunito, sans-serif; margin-bottom: 3rem !important;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight: 600; line-height: 1.3; font-size: 24px; font-family: Exo, sans-serif; color: rgb(54, 54, 54);\\\">What we don\\u2019t do with your data<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right: 0px; margin-left: 0px; font-size: 18px !important;\\\">We don\'t and will never share, unveil, sell, or in any case give your information to different organizations for the promoting of their items or administrations.<\\/p><\\/div>\",\"status\":1}', '2020-07-04 23:42:52', '2022-09-22 07:29:55'),
(42, 'policy_pages.element', '{\"title\":\"Privacy Policy\",\"details\":\"<div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">What information do we collect?<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">We gather data from you when you register on our site, submit a request, buy any services, react to an overview, or round out a structure. At the point when requesting any assistance or enrolling on our site, as suitable, you might be approached to enter your: name, email address, or telephone number. You may, nonetheless, visit our site anonymously.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">How do we protect your information?<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">All provided delicate\\/credit data is sent through Stripe.<br \\/>After an exchange, your private data (credit cards, social security numbers, financials, and so on) won\'t be put away on our workers.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">Do we disclose any information to outside parties?<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">We don\'t sell, exchange, or in any case move to outside gatherings by and by recognizable data. This does exclude confided in outsiders who help us in working our site, leading our business, or adjusting you, since those gatherings consent to keep this data private. We may likewise deliver your data when we accept discharge is suitable to follow the law, implement our site strategies, or ensure our own or others\' rights, property, or wellbeing.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">Children\'s Online Privacy Protection Act Compliance<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">We are consistent with the prerequisites of COPPA (Children\'s Online Privacy Protection Act), we don\'t gather any data from anybody under 13 years old. Our site, items, and administrations are completely coordinated to individuals who are in any event 13 years of age or more established.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">Changes to our Privacy Policy<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">If we decide to change our privacy policy, we will post those changes on this page.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">How long we retain your information?<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">At the point when you register for our site, we cycle and keep your information we have about you however long you don\'t erase the record or withdraw yourself (subject to laws and guidelines).<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">What we don\\u2019t do with your data<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">We don\'t and will never share, unveil, sell, or in any case give your information to different organizations for the promoting of their items or administrations.<\\/p><\\/div>\"}', '2021-06-09 08:50:42', '2021-06-09 08:50:42'),
(43, 'policy_pages.element', '{\"title\":\"Terms of Service\",\"details\":\"<div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">We claim all authority to dismiss, end, or handicap any help with or without cause per administrator discretion. This is a Complete independent facilitating, on the off chance that you misuse our ticket or Livechat or emotionally supportive network by submitting solicitations or protests we will impair your record. The solitary time you should reach us about the seaward facilitating is if there is an issue with the worker. We have not many substance limitations and everything is as per laws and guidelines. Try not to join on the off chance that you intend to do anything contrary to the guidelines, we do check these things and we will know, don\'t burn through our own and your time by joining on the off chance that you figure you will have the option to sneak by us and break the terms.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><ul class=\\\"font-18\\\" style=\\\"padding-left:15px;list-style-type:disc;font-size:18px;\\\"><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">Configuration requests - If you have a fully managed dedicated server with us then we offer custom PHP\\/MySQL configurations, firewalls for dedicated IPs, DNS, and httpd configurations.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">Software requests - Cpanel Extension Installation will be granted as long as it does not interfere with the security, stability, and performance of other users on the server.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">Emergency Support - We do not provide emergency support \\/ Phone Support \\/ LiveChat Support. Support may take some hours sometimes.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">Webmaster help - We do not offer any support for webmaster related issues and difficulty including coding, &amp; installs, Error solving. if there is an issue where a library or configuration of the server then we can help you if it\'s possible from our end.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">Backups - We keep backups but we are not responsible for data loss, you are fully responsible for all backups.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">We Don\'t support any child porn or such material.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">No spam-related sites or material, such as email lists, mass mail programs, and scripts, etc.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">No harassing material that may cause people to retaliate against you.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">No phishing pages.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">You may not run any exploitation script from the server. reason can be terminated immediately.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">If Anyone attempting to hack or exploit the server by using your script or hosting, we will terminate your account to keep safe other users.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">Malicious Botnets are strictly forbidden.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">Spam, mass mailing, or email marketing in any way are strictly forbidden here.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">Malicious hacking materials, trojans, viruses, &amp; malicious bots running or for download are forbidden.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">Resource and cronjob abuse is forbidden and will result in suspension or termination.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">Php\\/CGI proxies are strictly forbidden.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">CGI-IRC is strictly forbidden.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">No fake or disposal mailers, mass mailing, mail bombers, SMS bombers, etc.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">NO CREDIT OR REFUND will be granted for interruptions of service, due to User Agreement violations.<\\/li><\\/ul><\\/div><div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">Terms &amp; Conditions for Users<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">Before getting to this site, you are consenting to be limited by these site Terms and Conditions of Use, every single appropriate law, and guidelines, and concur that you are answerable for consistency with any material neighborhood laws. If you disagree with any of these terms, you are restricted from utilizing or getting to this site.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">Support<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">Whenever you have downloaded our item, you may get in touch with us for help through email and we will give a valiant effort to determine your issue. We will attempt to answer using the Email for more modest bug fixes, after which we will refresh the center bundle. Content help is offered to confirmed clients by Tickets as it were. Backing demands made by email and Livechat.<\\/p><p class=\\\"my-3 font-18 font-weight-bold\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">On the off chance that your help requires extra adjustment of the System, at that point, you have two alternatives:<\\/p><ul class=\\\"font-18\\\" style=\\\"padding-left:15px;list-style-type:disc;font-size:18px;\\\"><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">Hang tight for additional update discharge.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">Or on the other hand, enlist a specialist (We offer customization for extra charges).<\\/li><\\/ul><\\/div><div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">Ownership<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">You may not guarantee scholarly or selective possession of any of our items, altered or unmodified. All items are property, we created them. Our items are given \\\"with no guarantees\\\" without guarantee of any sort, either communicated or suggested. On no occasion will our juridical individual be subject to any harms including, however not restricted to, immediate, roundabout, extraordinary, accidental, or significant harms or different misfortunes emerging out of the utilization of or powerlessness to utilize our items.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">Warranty<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">We don\'t offer any guarantee or assurance of these Services in any way. When our Services have been modified we can\'t ensure they will work with all outsider plugins, modules, or internet browsers. Program similarity ought to be tried against the show formats on the demo worker. If you don\'t mind guarantee that the programs you use will work with the component, as we can not ensure that our systems will work with all program mixes.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">Unauthorized\\/Illegal Usage<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">You may not utilize our things for any illicit or unapproved reason or may you, in the utilization of the stage, disregard any laws in your locale (counting yet not restricted to copyright laws) just as the laws of your nation and International law. Specifically, it is disallowed to utilize the things on our foundation for pages that advance: brutality, illegal intimidation, hard sexual entertainment, bigotry, obscenity content or warez programming joins.<br \\/><br \\/>You can\'t imitate, copy, duplicate, sell, exchange or adventure any of our segment, utilization of the offered on our things, or admittance to the administration without the express composed consent by us or item proprietor.<br \\/><br \\/>Our Members are liable for all substance posted on the discussion and demo and movement that happens under your record.<br \\/><br \\/>We hold the chance of hindering your participation account quickly if we will think about a particularly not allowed conduct.<br \\/><br \\/>If you make a record on our site, you are liable for keeping up the security of your record, and you are completely answerable for all exercises that happen under the record and some other activities taken regarding the record. You should quickly inform us, of any unapproved employments of your record or some other penetrates of security.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">Fiverr, Seoclerks Sellers Or Affiliates<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">We do NOT ensure full SEO campaign conveyance within 24 hours. We make no assurance for conveyance time by any means. We give our best assessment to orders during the putting in of requests, anyway, these are gauges. We won\'t be considered liable for loss of assets, negative surveys or you being prohibited for late conveyance. If you are selling on a site that requires time touchy outcomes, utilize Our SEO Services at your own risk.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">Payment\\/Refund Policy<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">No refund or cash back will be made. After a deposit has been finished, it is extremely unlikely to invert it. You should utilize your equilibrium on requests our administrations, Hosting, SEO campaign. You concur that once you complete a deposit, you won\'t document a debate or a chargeback against us in any way, shape, or form.<br \\/><br \\/>If you document a debate or chargeback against us after a deposit, we claim all authority to end every single future request, prohibit you from our site. False action, for example, utilizing unapproved or taken charge cards will prompt the end of your record. There are no special cases.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">Free Balance \\/ Coupon Policy<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">We offer numerous approaches to get FREE Balance, Coupons and Deposit offers yet we generally reserve the privilege to audit it and deduct it from your record offset with any explanation we may it is a sort of misuse. If we choose to deduct a few or all of free Balance from your record balance, and your record balance becomes negative, at that point the record will naturally be suspended. If your record is suspended because of a negative Balance you can request to make a custom payment to settle your equilibrium to actuate your record.<\\/p><\\/div>\"}', '2021-06-09 08:51:18', '2021-06-09 08:51:18'),
(44, 'maintenance.data', '{\"description\":\"<div class=\\\"mb-5\\\" style=\\\"color: rgb(111, 111, 111); font-family: Nunito, sans-serif; margin-bottom: 3rem !important;\\\"><h3 class=\\\"mb-3\\\" style=\\\"text-align: center; font-weight: 600; line-height: 1.3; font-size: 24px; font-family: Exo, sans-serif; color: rgb(54, 54, 54);\\\">What information do we collect?<\\/h3><p class=\\\"font-18\\\" style=\\\"text-align: center; margin-right: 0px; margin-left: 0px; font-size: 18px !important;\\\">We gather data from you when you register on our site, submit a request, buy any services, react to an overview, or round out a structure. At the point when requesting any assistance or enrolling on our site, as suitable, you might be approached to enter your: name, email address, or telephone number. You may, nonetheless, visit our site anonymously.<\\/p><\\/div>\"}', '2020-07-04 23:42:52', '2022-05-11 03:57:17');

-- --------------------------------------------------------

--
-- Table structure for table `gateways`
--

DROP TABLE IF EXISTS `gateways`;
CREATE TABLE IF NOT EXISTS `gateways` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `form_id` int UNSIGNED NOT NULL DEFAULT '0',
  `code` int DEFAULT NULL,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alias` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'NULL',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=>enable, 2=>disable',
  `gateway_parameters` text COLLATE utf8mb4_unicode_ci,
  `supported_currencies` text COLLATE utf8mb4_unicode_ci,
  `crypto` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0: fiat currency, 1: crypto currency',
  `extra` text COLLATE utf8mb4_unicode_ci,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gateways`
--

INSERT INTO `gateways` (`id`, `form_id`, `code`, `name`, `alias`, `status`, `gateway_parameters`, `supported_currencies`, `crypto`, `extra`, `description`, `created_at`, `updated_at`) VALUES
(1, 0, 101, 'Paypal', 'Paypal', 1, '{\"paypal_email\":{\"title\":\"PayPal Email\",\"global\":true,\"value\":\"sb-owud61543012@business.example.com\"}}', '{\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"HKD\":\"HKD\",\"HUF\":\"HUF\",\"INR\":\"INR\",\"ILS\":\"ILS\",\"JPY\":\"JPY\",\"MYR\":\"MYR\",\"MXN\":\"MXN\",\"TWD\":\"TWD\",\"NZD\":\"NZD\",\"NOK\":\"NOK\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"GBP\":\"GBP\",\"RUB\":\"RUB\",\"SGD\":\"SGD\",\"SEK\":\"SEK\",\"CHF\":\"CHF\",\"THB\":\"THB\",\"USD\":\"$\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 00:04:38'),
(2, 0, 102, 'Perfect Money', 'PerfectMoney', 1, '{\"passphrase\":{\"title\":\"ALTERNATE PASSPHRASE\",\"global\":true,\"value\":\"hR26aw02Q1eEeUPSIfuwNypXX\"},\"wallet_id\":{\"title\":\"PM Wallet\",\"global\":false,\"value\":\"\"}}', '{\"USD\":\"$\",\"EUR\":\"\\u20ac\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 01:35:33'),
(3, 0, 103, 'Stripe Hosted', 'Stripe', 1, '{\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"sk_test_51I6GGiCGv1sRiQlEi5v1or9eR0HVbuzdMd2rW4n3DxC8UKfz66R4X6n4yYkzvI2LeAIuRU9H99ZpY7XCNFC9xMs500vBjZGkKG\"},\"publishable_key\":{\"title\":\"PUBLISHABLE KEY\",\"global\":true,\"value\":\"pk_test_51I6GGiCGv1sRiQlEOisPKrjBqQqqcFsw8mXNaZ2H2baN6R01NulFS7dKFji1NRRxuchoUTEDdB7ujKcyKYSVc0z500eth7otOM\"}}', '{\"USD\":\"USD\",\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"INR\":\"INR\",\"JPY\":\"JPY\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"PLN\":\"PLN\",\"SEK\":\"SEK\",\"SGD\":\"SGD\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 00:48:36'),
(4, 0, 104, 'Skrill', 'Skrill', 1, '{\"pay_to_email\":{\"title\":\"Skrill Email\",\"global\":true,\"value\":\"merchant@skrill.com\"},\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"---\"}}', '{\"AED\":\"AED\",\"AUD\":\"AUD\",\"BGN\":\"BGN\",\"BHD\":\"BHD\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"HRK\":\"HRK\",\"HUF\":\"HUF\",\"ILS\":\"ILS\",\"INR\":\"INR\",\"ISK\":\"ISK\",\"JOD\":\"JOD\",\"JPY\":\"JPY\",\"KRW\":\"KRW\",\"KWD\":\"KWD\",\"MAD\":\"MAD\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"OMR\":\"OMR\",\"PLN\":\"PLN\",\"QAR\":\"QAR\",\"RON\":\"RON\",\"RSD\":\"RSD\",\"SAR\":\"SAR\",\"SEK\":\"SEK\",\"SGD\":\"SGD\",\"THB\":\"THB\",\"TND\":\"TND\",\"TRY\":\"TRY\",\"TWD\":\"TWD\",\"USD\":\"USD\",\"ZAR\":\"ZAR\",\"COP\":\"COP\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 01:30:16'),
(5, 0, 105, 'PayTM', 'Paytm', 1, '{\"MID\":{\"title\":\"Merchant ID\",\"global\":true,\"value\":\"DIY12386817555501617\"},\"merchant_key\":{\"title\":\"Merchant Key\",\"global\":true,\"value\":\"bKMfNxPPf_QdZppa\"},\"WEBSITE\":{\"title\":\"Paytm Website\",\"global\":true,\"value\":\"DIYtestingweb\"},\"INDUSTRY_TYPE_ID\":{\"title\":\"Industry Type\",\"global\":true,\"value\":\"Retail\"},\"CHANNEL_ID\":{\"title\":\"CHANNEL ID\",\"global\":true,\"value\":\"WEB\"},\"transaction_url\":{\"title\":\"Transaction URL\",\"global\":true,\"value\":\"https:\\/\\/pguat.paytm.com\\/oltp-web\\/processTransaction\"},\"transaction_status_url\":{\"title\":\"Transaction STATUS URL\",\"global\":true,\"value\":\"https:\\/\\/pguat.paytm.com\\/paytmchecksum\\/paytmCallback.jsp\"}}', '{\"AUD\":\"AUD\",\"ARS\":\"ARS\",\"BDT\":\"BDT\",\"BRL\":\"BRL\",\"BGN\":\"BGN\",\"CAD\":\"CAD\",\"CLP\":\"CLP\",\"CNY\":\"CNY\",\"COP\":\"COP\",\"HRK\":\"HRK\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EGP\":\"EGP\",\"EUR\":\"EUR\",\"GEL\":\"GEL\",\"GHS\":\"GHS\",\"HKD\":\"HKD\",\"HUF\":\"HUF\",\"INR\":\"INR\",\"IDR\":\"IDR\",\"ILS\":\"ILS\",\"JPY\":\"JPY\",\"KES\":\"KES\",\"MYR\":\"MYR\",\"MXN\":\"MXN\",\"MAD\":\"MAD\",\"NPR\":\"NPR\",\"NZD\":\"NZD\",\"NGN\":\"NGN\",\"NOK\":\"NOK\",\"PKR\":\"PKR\",\"PEN\":\"PEN\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"RON\":\"RON\",\"RUB\":\"RUB\",\"SGD\":\"SGD\",\"ZAR\":\"ZAR\",\"KRW\":\"KRW\",\"LKR\":\"LKR\",\"SEK\":\"SEK\",\"CHF\":\"CHF\",\"THB\":\"THB\",\"TRY\":\"TRY\",\"UGX\":\"UGX\",\"UAH\":\"UAH\",\"AED\":\"AED\",\"GBP\":\"GBP\",\"USD\":\"USD\",\"VND\":\"VND\",\"XOF\":\"XOF\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 03:00:44'),
(6, 0, 106, 'Payeer', 'Payeer', 1, '{\"merchant_id\":{\"title\":\"Merchant ID\",\"global\":true,\"value\":\"866989763\"},\"secret_key\":{\"title\":\"Secret key\",\"global\":true,\"value\":\"7575\"}}', '{\"USD\":\"USD\",\"EUR\":\"EUR\",\"RUB\":\"RUB\"}', 0, '{\"status\":{\"title\": \"Status URL\",\"value\":\"ipn.Payeer\"}}', NULL, '2019-09-14 13:14:22', '2022-08-28 10:11:14'),
(7, 0, 107, 'PayStack', 'Paystack', 1, '{\"public_key\":{\"title\":\"Public key\",\"global\":true,\"value\":\"pk_test_cd330608eb47970889bca397ced55c1dd5ad3783\"},\"secret_key\":{\"title\":\"Secret key\",\"global\":true,\"value\":\"sk_test_8a0b1f199362d7acc9c390bff72c4e81f74e2ac3\"}}', '{\"USD\":\"USD\",\"NGN\":\"NGN\"}', 0, '{\"callback\":{\"title\": \"Callback URL\",\"value\":\"ipn.Paystack\"},\"webhook\":{\"title\": \"Webhook URL\",\"value\":\"ipn.Paystack\"}}\r\n', NULL, '2019-09-14 13:14:22', '2021-05-21 01:49:51'),
(8, 0, 108, 'VoguePay', 'Voguepay', 1, '{\"merchant_id\":{\"title\":\"MERCHANT ID\",\"global\":true,\"value\":\"demo\"}}', '{\"USD\":\"USD\",\"GBP\":\"GBP\",\"EUR\":\"EUR\",\"GHS\":\"GHS\",\"NGN\":\"NGN\",\"ZAR\":\"ZAR\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 01:22:38'),
(9, 0, 109, 'Flutterwave', 'Flutterwave', 1, '{\"public_key\":{\"title\":\"Public Key\",\"global\":true,\"value\":\"----------------\"},\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"-----------------------\"},\"encryption_key\":{\"title\":\"Encryption Key\",\"global\":true,\"value\":\"------------------\"}}', '{\"BIF\":\"BIF\",\"CAD\":\"CAD\",\"CDF\":\"CDF\",\"CVE\":\"CVE\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"GHS\":\"GHS\",\"GMD\":\"GMD\",\"GNF\":\"GNF\",\"KES\":\"KES\",\"LRD\":\"LRD\",\"MWK\":\"MWK\",\"MZN\":\"MZN\",\"NGN\":\"NGN\",\"RWF\":\"RWF\",\"SLL\":\"SLL\",\"STD\":\"STD\",\"TZS\":\"TZS\",\"UGX\":\"UGX\",\"USD\":\"USD\",\"XAF\":\"XAF\",\"XOF\":\"XOF\",\"ZMK\":\"ZMK\",\"ZMW\":\"ZMW\",\"ZWD\":\"ZWD\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2021-06-05 11:37:45'),
(10, 0, 110, 'RazorPay', 'Razorpay', 1, '{\"key_id\":{\"title\":\"Key Id\",\"global\":true,\"value\":\"rzp_test_kiOtejPbRZU90E\"},\"key_secret\":{\"title\":\"Key Secret \",\"global\":true,\"value\":\"osRDebzEqbsE1kbyQJ4y0re7\"}}', '{\"INR\":\"INR\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 02:51:32'),
(11, 0, 111, 'Stripe Storefront', 'StripeJs', 1, '{\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"sk_test_51I6GGiCGv1sRiQlEi5v1or9eR0HVbuzdMd2rW4n3DxC8UKfz66R4X6n4yYkzvI2LeAIuRU9H99ZpY7XCNFC9xMs500vBjZGkKG\"},\"publishable_key\":{\"title\":\"PUBLISHABLE KEY\",\"global\":true,\"value\":\"pk_test_51I6GGiCGv1sRiQlEOisPKrjBqQqqcFsw8mXNaZ2H2baN6R01NulFS7dKFji1NRRxuchoUTEDdB7ujKcyKYSVc0z500eth7otOM\"}}', '{\"USD\":\"USD\",\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"INR\":\"INR\",\"JPY\":\"JPY\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"PLN\":\"PLN\",\"SEK\":\"SEK\",\"SGD\":\"SGD\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 00:53:10'),
(12, 0, 112, 'Instamojo', 'Instamojo', 1, '{\"api_key\":{\"title\":\"API KEY\",\"global\":true,\"value\":\"test_2241633c3bc44a3de84a3b33969\"},\"auth_token\":{\"title\":\"Auth Token\",\"global\":true,\"value\":\"test_279f083f7bebefd35217feef22d\"},\"salt\":{\"title\":\"Salt\",\"global\":true,\"value\":\"19d38908eeff4f58b2ddda2c6d86ca25\"}}', '{\"INR\":\"INR\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 02:56:20'),
(13, 0, 501, 'Blockchain', 'Blockchain', 1, '{\"api_key\":{\"title\":\"API Key\",\"global\":true,\"value\":\"55529946-05ca-48ff-8710-f279d86b1cc5\"},\"xpub_code\":{\"title\":\"XPUB CODE\",\"global\":true,\"value\":\"xpub6CKQ3xxWyBoFAF83izZCSFUorptEU9AF8TezhtWeMU5oefjX3sFSBw62Lr9iHXPkXmDQJJiHZeTRtD9Vzt8grAYRhvbz4nEvBu3QKELVzFK\"}}', '{\"BTC\":\"BTC\"}', 1, NULL, NULL, '2019-09-14 13:14:22', '2022-03-21 07:41:56'),
(15, 0, 503, 'CoinPayments', 'Coinpayments', 1, '{\"public_key\":{\"title\":\"Public Key\",\"global\":true,\"value\":\"---------------\"},\"private_key\":{\"title\":\"Private Key\",\"global\":true,\"value\":\"------------\"},\"merchant_id\":{\"title\":\"Merchant ID\",\"global\":true,\"value\":\"93a1e014c4ad60a7980b4a7239673cb4\"}}', '{\"BTC\":\"Bitcoin\",\"BTC.LN\":\"Bitcoin (Lightning Network)\",\"LTC\":\"Litecoin\",\"CPS\":\"CPS Coin\",\"VLX\":\"Velas\",\"APL\":\"Apollo\",\"AYA\":\"Aryacoin\",\"BAD\":\"Badcoin\",\"BCD\":\"Bitcoin Diamond\",\"BCH\":\"Bitcoin Cash\",\"BCN\":\"Bytecoin\",\"BEAM\":\"BEAM\",\"BITB\":\"Bean Cash\",\"BLK\":\"BlackCoin\",\"BSV\":\"Bitcoin SV\",\"BTAD\":\"Bitcoin Adult\",\"BTG\":\"Bitcoin Gold\",\"BTT\":\"BitTorrent\",\"CLOAK\":\"CloakCoin\",\"CLUB\":\"ClubCoin\",\"CRW\":\"Crown\",\"CRYP\":\"CrypticCoin\",\"CRYT\":\"CryTrExCoin\",\"CURE\":\"CureCoin\",\"DASH\":\"DASH\",\"DCR\":\"Decred\",\"DEV\":\"DeviantCoin\",\"DGB\":\"DigiByte\",\"DOGE\":\"Dogecoin\",\"EBST\":\"eBoost\",\"EOS\":\"EOS\",\"ETC\":\"Ether Classic\",\"ETH\":\"Ethereum\",\"ETN\":\"Electroneum\",\"EUNO\":\"EUNO\",\"EXP\":\"EXP\",\"Expanse\":\"Expanse\",\"FLASH\":\"FLASH\",\"GAME\":\"GameCredits\",\"GLC\":\"Goldcoin\",\"GRS\":\"Groestlcoin\",\"KMD\":\"Komodo\",\"LOKI\":\"LOKI\",\"LSK\":\"LSK\",\"MAID\":\"MaidSafeCoin\",\"MUE\":\"MonetaryUnit\",\"NAV\":\"NAV Coin\",\"NEO\":\"NEO\",\"NMC\":\"Namecoin\",\"NVST\":\"NVO Token\",\"NXT\":\"NXT\",\"OMNI\":\"OMNI\",\"PINK\":\"PinkCoin\",\"PIVX\":\"PIVX\",\"POT\":\"PotCoin\",\"PPC\":\"Peercoin\",\"PROC\":\"ProCurrency\",\"PURA\":\"PURA\",\"QTUM\":\"QTUM\",\"RES\":\"Resistance\",\"RVN\":\"Ravencoin\",\"RVR\":\"RevolutionVR\",\"SBD\":\"Steem Dollars\",\"SMART\":\"SmartCash\",\"SOXAX\":\"SOXAX\",\"STEEM\":\"STEEM\",\"STRAT\":\"STRAT\",\"SYS\":\"Syscoin\",\"TPAY\":\"TokenPay\",\"TRIGGERS\":\"Triggers\",\"TRX\":\" TRON\",\"UBQ\":\"Ubiq\",\"UNIT\":\"UniversalCurrency\",\"USDT\":\"Tether USD (Omni Layer)\",\"USDT.BEP20\":\"Tether USD (BSC Chain)\",\"USDT.ERC20\":\"Tether USD (ERC20)\",\"USDT.TRC20\":\"Tether USD (Tron/TRC20)\",\"VTC\":\"Vertcoin\",\"WAVES\":\"Waves\",\"XCP\":\"Counterparty\",\"XEM\":\"NEM\",\"XMR\":\"Monero\",\"XSN\":\"Stakenet\",\"XSR\":\"SucreCoin\",\"XVG\":\"VERGE\",\"XZC\":\"ZCoin\",\"ZEC\":\"ZCash\",\"ZEN\":\"Horizen\"}', 1, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 02:07:14'),
(16, 0, 504, 'CoinPayments Fiat', 'CoinpaymentsFiat', 1, '{\"merchant_id\":{\"title\":\"Merchant ID\",\"global\":true,\"value\":\"6515561\"}}', '{\"USD\":\"USD\",\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"CLP\":\"CLP\",\"CNY\":\"CNY\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"INR\":\"INR\",\"ISK\":\"ISK\",\"JPY\":\"JPY\",\"KRW\":\"KRW\",\"NZD\":\"NZD\",\"PLN\":\"PLN\",\"RUB\":\"RUB\",\"SEK\":\"SEK\",\"SGD\":\"SGD\",\"THB\":\"THB\",\"TWD\":\"TWD\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 02:07:44'),
(17, 0, 505, 'Coingate', 'Coingate', 1, '{\"api_key\":{\"title\":\"API Key\",\"global\":true,\"value\":\"6354mwVCEw5kHzRJ6thbGo-N\"}}', '{\"USD\":\"USD\",\"EUR\":\"EUR\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2022-03-30 09:24:57'),
(18, 0, 506, 'Coinbase Commerce', 'CoinbaseCommerce', 1, '{\"api_key\":{\"title\":\"API Key\",\"global\":true,\"value\":\"c47cd7df-d8e8-424b-a20a\"},\"secret\":{\"title\":\"Webhook Shared Secret\",\"global\":true,\"value\":\"55871878-2c32-4f64-ab66\"}}', '{\"USD\":\"USD\",\"EUR\":\"EUR\",\"JPY\":\"JPY\",\"GBP\":\"GBP\",\"AUD\":\"AUD\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"CNY\":\"CNY\",\"SEK\":\"SEK\",\"NZD\":\"NZD\",\"MXN\":\"MXN\",\"SGD\":\"SGD\",\"HKD\":\"HKD\",\"NOK\":\"NOK\",\"KRW\":\"KRW\",\"TRY\":\"TRY\",\"RUB\":\"RUB\",\"INR\":\"INR\",\"BRL\":\"BRL\",\"ZAR\":\"ZAR\",\"AED\":\"AED\",\"AFN\":\"AFN\",\"ALL\":\"ALL\",\"AMD\":\"AMD\",\"ANG\":\"ANG\",\"AOA\":\"AOA\",\"ARS\":\"ARS\",\"AWG\":\"AWG\",\"AZN\":\"AZN\",\"BAM\":\"BAM\",\"BBD\":\"BBD\",\"BDT\":\"BDT\",\"BGN\":\"BGN\",\"BHD\":\"BHD\",\"BIF\":\"BIF\",\"BMD\":\"BMD\",\"BND\":\"BND\",\"BOB\":\"BOB\",\"BSD\":\"BSD\",\"BTN\":\"BTN\",\"BWP\":\"BWP\",\"BYN\":\"BYN\",\"BZD\":\"BZD\",\"CDF\":\"CDF\",\"CLF\":\"CLF\",\"CLP\":\"CLP\",\"COP\":\"COP\",\"CRC\":\"CRC\",\"CUC\":\"CUC\",\"CUP\":\"CUP\",\"CVE\":\"CVE\",\"CZK\":\"CZK\",\"DJF\":\"DJF\",\"DKK\":\"DKK\",\"DOP\":\"DOP\",\"DZD\":\"DZD\",\"EGP\":\"EGP\",\"ERN\":\"ERN\",\"ETB\":\"ETB\",\"FJD\":\"FJD\",\"FKP\":\"FKP\",\"GEL\":\"GEL\",\"GGP\":\"GGP\",\"GHS\":\"GHS\",\"GIP\":\"GIP\",\"GMD\":\"GMD\",\"GNF\":\"GNF\",\"GTQ\":\"GTQ\",\"GYD\":\"GYD\",\"HNL\":\"HNL\",\"HRK\":\"HRK\",\"HTG\":\"HTG\",\"HUF\":\"HUF\",\"IDR\":\"IDR\",\"ILS\":\"ILS\",\"IMP\":\"IMP\",\"IQD\":\"IQD\",\"IRR\":\"IRR\",\"ISK\":\"ISK\",\"JEP\":\"JEP\",\"JMD\":\"JMD\",\"JOD\":\"JOD\",\"KES\":\"KES\",\"KGS\":\"KGS\",\"KHR\":\"KHR\",\"KMF\":\"KMF\",\"KPW\":\"KPW\",\"KWD\":\"KWD\",\"KYD\":\"KYD\",\"KZT\":\"KZT\",\"LAK\":\"LAK\",\"LBP\":\"LBP\",\"LKR\":\"LKR\",\"LRD\":\"LRD\",\"LSL\":\"LSL\",\"LYD\":\"LYD\",\"MAD\":\"MAD\",\"MDL\":\"MDL\",\"MGA\":\"MGA\",\"MKD\":\"MKD\",\"MMK\":\"MMK\",\"MNT\":\"MNT\",\"MOP\":\"MOP\",\"MRO\":\"MRO\",\"MUR\":\"MUR\",\"MVR\":\"MVR\",\"MWK\":\"MWK\",\"MYR\":\"MYR\",\"MZN\":\"MZN\",\"NAD\":\"NAD\",\"NGN\":\"NGN\",\"NIO\":\"NIO\",\"NPR\":\"NPR\",\"OMR\":\"OMR\",\"PAB\":\"PAB\",\"PEN\":\"PEN\",\"PGK\":\"PGK\",\"PHP\":\"PHP\",\"PKR\":\"PKR\",\"PLN\":\"PLN\",\"PYG\":\"PYG\",\"QAR\":\"QAR\",\"RON\":\"RON\",\"RSD\":\"RSD\",\"RWF\":\"RWF\",\"SAR\":\"SAR\",\"SBD\":\"SBD\",\"SCR\":\"SCR\",\"SDG\":\"SDG\",\"SHP\":\"SHP\",\"SLL\":\"SLL\",\"SOS\":\"SOS\",\"SRD\":\"SRD\",\"SSP\":\"SSP\",\"STD\":\"STD\",\"SVC\":\"SVC\",\"SYP\":\"SYP\",\"SZL\":\"SZL\",\"THB\":\"THB\",\"TJS\":\"TJS\",\"TMT\":\"TMT\",\"TND\":\"TND\",\"TOP\":\"TOP\",\"TTD\":\"TTD\",\"TWD\":\"TWD\",\"TZS\":\"TZS\",\"UAH\":\"UAH\",\"UGX\":\"UGX\",\"UYU\":\"UYU\",\"UZS\":\"UZS\",\"VEF\":\"VEF\",\"VND\":\"VND\",\"VUV\":\"VUV\",\"WST\":\"WST\",\"XAF\":\"XAF\",\"XAG\":\"XAG\",\"XAU\":\"XAU\",\"XCD\":\"XCD\",\"XDR\":\"XDR\",\"XOF\":\"XOF\",\"XPD\":\"XPD\",\"XPF\":\"XPF\",\"XPT\":\"XPT\",\"YER\":\"YER\",\"ZMW\":\"ZMW\",\"ZWL\":\"ZWL\"}\r\n\r\n', 0, '{\"endpoint\":{\"title\": \"Webhook Endpoint\",\"value\":\"ipn.CoinbaseCommerce\"}}', NULL, '2019-09-14 13:14:22', '2021-05-21 02:02:47'),
(24, 0, 113, 'Paypal Express', 'PaypalSdk', 1, '{\"clientId\":{\"title\":\"Paypal Client ID\",\"global\":true,\"value\":\"Ae0-tixtSV7DvLwIh3Bmu7JvHrjh5EfGdXr_cEklKAVjjezRZ747BxKILiBdzlKKyp-W8W_T7CKH1Ken\"},\"clientSecret\":{\"title\":\"Client Secret\",\"global\":true,\"value\":\"EOhbvHZgFNO21soQJT1L9Q00M3rK6PIEsdiTgXRBt2gtGtxwRer5JvKnVUGNU5oE63fFnjnYY7hq3HBA\"}}', '{\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"HKD\":\"HKD\",\"HUF\":\"HUF\",\"INR\":\"INR\",\"ILS\":\"ILS\",\"JPY\":\"JPY\",\"MYR\":\"MYR\",\"MXN\":\"MXN\",\"TWD\":\"TWD\",\"NZD\":\"NZD\",\"NOK\":\"NOK\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"GBP\":\"GBP\",\"RUB\":\"RUB\",\"SGD\":\"SGD\",\"SEK\":\"SEK\",\"CHF\":\"CHF\",\"THB\":\"THB\",\"USD\":\"$\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2021-05-20 23:01:08'),
(25, 0, 114, 'Stripe Checkout', 'StripeV3', 1, '{\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"sk_test_51I6GGiCGv1sRiQlEi5v1or9eR0HVbuzdMd2rW4n3DxC8UKfz66R4X6n4yYkzvI2LeAIuRU9H99ZpY7XCNFC9xMs500vBjZGkKG\"},\"publishable_key\":{\"title\":\"PUBLISHABLE KEY\",\"global\":true,\"value\":\"pk_test_51I6GGiCGv1sRiQlEOisPKrjBqQqqcFsw8mXNaZ2H2baN6R01NulFS7dKFji1NRRxuchoUTEDdB7ujKcyKYSVc0z500eth7otOM\"},\"end_point\":{\"title\":\"End Point Secret\",\"global\":true,\"value\":\"whsec_lUmit1gtxwKTveLnSe88xCSDdnPOt8g5\"}}', '{\"USD\":\"USD\",\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"INR\":\"INR\",\"JPY\":\"JPY\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"PLN\":\"PLN\",\"SEK\":\"SEK\",\"SGD\":\"SGD\"}', 0, '{\"webhook\":{\"title\": \"Webhook Endpoint\",\"value\":\"ipn.StripeV3\"}}', NULL, '2019-09-14 13:14:22', '2021-05-21 00:58:38'),
(27, 0, 115, 'Mollie', 'Mollie', 1, '{\"mollie_email\":{\"title\":\"Mollie Email \",\"global\":true,\"value\":\"vi@gmail.com\"},\"api_key\":{\"title\":\"API KEY\",\"global\":true,\"value\":\"test_cucfwKTWfft9s337qsVfn5CC4vNkrn\"}}', '{\"AED\":\"AED\",\"AUD\":\"AUD\",\"BGN\":\"BGN\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"HRK\":\"HRK\",\"HUF\":\"HUF\",\"ILS\":\"ILS\",\"ISK\":\"ISK\",\"JPY\":\"JPY\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"RON\":\"RON\",\"RUB\":\"RUB\",\"SEK\":\"SEK\",\"SGD\":\"SGD\",\"THB\":\"THB\",\"TWD\":\"TWD\",\"USD\":\"USD\",\"ZAR\":\"ZAR\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 02:44:45'),
(30, 0, 116, 'Cashmaal', 'Cashmaal', 1, '{\"web_id\":{\"title\":\"Web Id\",\"global\":true,\"value\":\"3748\"},\"ipn_key\":{\"title\":\"IPN Key\",\"global\":true,\"value\":\"546254628759524554647987\"}}', '{\"PKR\":\"PKR\",\"USD\":\"USD\"}', 0, '{\"webhook\":{\"title\": \"IPN URL\",\"value\":\"ipn.Cashmaal\"}}', NULL, NULL, '2021-06-22 08:05:04'),
(36, 0, 119, 'Mercado Pago', 'MercadoPago', 1, '{\"access_token\":{\"title\":\"Access Token\",\"global\":true,\"value\":\"APP_USR-7924565816849832-082312-21941521997fab717db925cf1ea2c190-1071840315\"}}', '{\"USD\":\"USD\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"NOK\":\"NOK\",\"PLN\":\"PLN\",\"SEK\":\"SEK\",\"AUD\":\"AUD\",\"NZD\":\"NZD\"}', 0, NULL, NULL, NULL, '2022-09-14 07:41:14'),
(37, 0, 120, 'Authorize.net', 'Authorize', 1, '{\"login_id\":{\"title\":\"Login ID\",\"global\":true,\"value\":\"59e4P9DBcZv\"},\"transaction_key\":{\"title\":\"Transaction Key\",\"global\":true,\"value\":\"47x47TJyLw2E7DbR\"}}', '{\"USD\":\"USD\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"NOK\":\"NOK\",\"PLN\":\"PLN\",\"SEK\":\"SEK\",\"AUD\":\"AUD\",\"NZD\":\"NZD\"}', 0, NULL, NULL, NULL, '2022-08-28 09:33:06'),
(46, 0, 121, 'NMI', 'NMI', 1, '{\"api_key\":{\"title\":\"API Key\",\"global\":true,\"value\":\"2F822Rw39fx762MaV7Yy86jXGTC7sCDy\"}}', '{\"AED\":\"AED\",\"ARS\":\"ARS\",\"AUD\":\"AUD\",\"BOB\":\"BOB\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"CLP\":\"CLP\",\"CNY\":\"CNY\",\"COP\":\"COP\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"IDR\":\"IDR\",\"ILS\":\"ILS\",\"INR\":\"INR\",\"JPY\":\"JPY\",\"KRW\":\"KRW\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"PEN\":\"PEN\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"PYG\":\"PYG\",\"RUB\":\"RUB\",\"SEC\":\"SEC\",\"SGD\":\"SGD\",\"THB\":\"THB\",\"TRY\":\"TRY\",\"TWD\":\"TWD\",\"USD\":\"USD\",\"ZAR\":\"ZAR\"}', 0, NULL, NULL, NULL, '2022-08-28 10:32:31'),
(50, 0, 507, 'BTCPay', 'BTCPay', 1, '{\"store_id\":{\"title\":\"Store Id\",\"global\":true,\"value\":\"HsqFVTXSeUFJu7caoYZc3CTnP8g5LErVdHhEXPVTheHf\"},\"api_key\":{\"title\":\"Api Key\",\"global\":true,\"value\":\"4436bd706f99efae69305e7c4eff4780de1335ce\"},\"server_name\":{\"title\":\"Server Name\",\"global\":true,\"value\":\"https:\\/\\/testnet.demo.btcpayserver.org\"},\"secret_code\":{\"title\":\"Secret Code\",\"global\":true,\"value\":\"SUCdqPn9CDkY7RmJHfpQVHP2Lf2\"}}', '{\"BTC\":\"Bitcoin\",\"LTC\":\"Litecoin\"}', 1, '{\"webhook\":{\"title\": \"IPN URL\",\"value\":\"ipn.BTCPay\"}}', NULL, NULL, '2023-02-14 04:42:09'),
(51, 0, 508, 'Now payments hosted', 'NowPaymentsHosted', 1, '{\"api_key\":{\"title\":\"API Key\",\"global\":true,\"value\":\"--------\"},\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"------------\"}}', '{\"BTG\":\"BTG\",\"ETH\":\"ETH\",\"XMR\":\"XMR\",\"ZEC\":\"ZEC\",\"XVG\":\"XVG\",\"ADA\":\"ADA\",\"LTC\":\"LTC\",\"BCH\":\"BCH\",\"QTUM\":\"QTUM\",\"DASH\":\"DASH\",\"XLM\":\"XLM\",\"XRP\":\"XRP\",\"XEM\":\"XEM\",\"DGB\":\"DGB\",\"LSK\":\"LSK\",\"DOGE\":\"DOGE\",\"TRX\":\"TRX\",\"KMD\":\"KMD\",\"REP\":\"REP\",\"BAT\":\"BAT\",\"ARK\":\"ARK\",\"WAVES\":\"WAVES\",\"BNB\":\"BNB\",\"XZC\":\"XZC\",\"NANO\":\"NANO\",\"TUSD\":\"TUSD\",\"VET\":\"VET\",\"ZEN\":\"ZEN\",\"GRS\":\"GRS\",\"FUN\":\"FUN\",\"NEO\":\"NEO\",\"GAS\":\"GAS\",\"PAX\":\"PAX\",\"USDC\":\"USDC\",\"ONT\":\"ONT\",\"XTZ\":\"XTZ\",\"LINK\":\"LINK\",\"RVN\":\"RVN\",\"BNBMAINNET\":\"BNBMAINNET\",\"ZIL\":\"ZIL\",\"BCD\":\"BCD\",\"USDT\":\"USDT\",\"USDTERC20\":\"USDTERC20\",\"CRO\":\"CRO\",\"DAI\":\"DAI\",\"HT\":\"HT\",\"WABI\":\"WABI\",\"BUSD\":\"BUSD\",\"ALGO\":\"ALGO\",\"USDTTRC20\":\"USDTTRC20\",\"GT\":\"GT\",\"STPT\":\"STPT\",\"AVA\":\"AVA\",\"SXP\":\"SXP\",\"UNI\":\"UNI\",\"OKB\":\"OKB\",\"BTC\":\"BTC\"}', 1, '', NULL, NULL, '2023-02-14 05:08:23'),
(52, 0, 509, 'Now payments checkout', 'NowPaymentsCheckout', 1, '{\"api_key\":{\"title\":\"API Key\",\"global\":true,\"value\":\"---------------\"},\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"-----------\"}}', '{\"BTG\":\"BTG\",\"ETH\":\"ETH\",\"XMR\":\"XMR\",\"ZEC\":\"ZEC\",\"XVG\":\"XVG\",\"ADA\":\"ADA\",\"LTC\":\"LTC\",\"BCH\":\"BCH\",\"QTUM\":\"QTUM\",\"DASH\":\"DASH\",\"XLM\":\"XLM\",\"XRP\":\"XRP\",\"XEM\":\"XEM\",\"DGB\":\"DGB\",\"LSK\":\"LSK\",\"DOGE\":\"DOGE\",\"TRX\":\"TRX\",\"KMD\":\"KMD\",\"REP\":\"REP\",\"BAT\":\"BAT\",\"ARK\":\"ARK\",\"WAVES\":\"WAVES\",\"BNB\":\"BNB\",\"XZC\":\"XZC\",\"NANO\":\"NANO\",\"TUSD\":\"TUSD\",\"VET\":\"VET\",\"ZEN\":\"ZEN\",\"GRS\":\"GRS\",\"FUN\":\"FUN\",\"NEO\":\"NEO\",\"GAS\":\"GAS\",\"PAX\":\"PAX\",\"USDC\":\"USDC\",\"ONT\":\"ONT\",\"XTZ\":\"XTZ\",\"LINK\":\"LINK\",\"RVN\":\"RVN\",\"BNBMAINNET\":\"BNBMAINNET\",\"ZIL\":\"ZIL\",\"BCD\":\"BCD\",\"USDT\":\"USDT\",\"USDTERC20\":\"USDTERC20\",\"CRO\":\"CRO\",\"DAI\":\"DAI\",\"HT\":\"HT\",\"WABI\":\"WABI\",\"BUSD\":\"BUSD\",\"ALGO\":\"ALGO\",\"USDTTRC20\":\"USDTTRC20\",\"GT\":\"GT\",\"STPT\":\"STPT\",\"AVA\":\"AVA\",\"SXP\":\"SXP\",\"UNI\":\"UNI\",\"OKB\":\"OKB\",\"BTC\":\"BTC\"}', 1, '', NULL, NULL, '2023-02-14 05:08:04');

-- --------------------------------------------------------

--
-- Table structure for table `gateway_currencies`
--

DROP TABLE IF EXISTS `gateway_currencies`;
CREATE TABLE IF NOT EXISTS `gateway_currencies` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `symbol` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `method_code` int DEFAULT NULL,
  `gateway_alias` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `min_amount` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `max_amount` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `percent_charge` decimal(5,2) NOT NULL DEFAULT '0.00',
  `fixed_charge` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `rate` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gateway_parameter` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=172 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gateway_currencies`
--

INSERT INTO `gateway_currencies` (`id`, `name`, `currency`, `symbol`, `method_code`, `gateway_alias`, `min_amount`, `max_amount`, `percent_charge`, `fixed_charge`, `rate`, `image`, `gateway_parameter`, `created_at`, `updated_at`) VALUES
(39, 'RazorPay - INR', 'INR', '$', 110, 'Razorpay', '1.00000000', '10000.00000000', '1.00', '1.00000000', '1.00000000', NULL, '{\"key_id\":\"rzp_test_kiOtejPbRZU90E\",\"key_secret\":\"osRDebzEqbsE1kbyQJ4y0re7\"}', '2020-09-26 04:51:34', '2020-09-26 04:51:34'),
(42, 'VoguePay - USD', 'USD', '$', 108, 'Voguepay', '1.00000000', '1000.00000000', '0.00', '1.00000000', '1.00000000', NULL, '{\"merchant_id\":\"demo\"}', '2020-09-26 04:52:09', '2020-09-26 04:52:09'),
(75, 'Skrill - AED', 'AED', '$', 104, 'Skrill', '1.00000000', '10000.00000000', '1.00', '1.00000000', '10.00000000', NULL, '{\"pay_to_email\":\"merchant@skrill.com\",\"secret_key\":\"---\"}', '2021-05-19 12:04:56', '2021-05-19 12:04:56'),
(76, 'Skrill - USD', 'USD', '$', 104, 'Skrill', '1.00000000', '10000.00000000', '1.00', '1.00000000', '2.00000000', NULL, '{\"pay_to_email\":\"merchant@skrill.com\",\"secret_key\":\"---\"}', '2021-05-19 12:04:56', '2021-05-19 12:04:56'),
(82, 'Paypal Express - USD', 'USD', '$', 113, 'PaypalSdk', '1.00000000', '1000000.00000000', '1.00', '1.00000000', '1.00000000', NULL, '{\"clientId\":\"Ae0-tixtSV7DvLwIh3Bmu7JvHrjh5EfGdXr_cEklKAVjjezRZ747BxKILiBdzlKKyp-W8W_T7CKH1Ken\",\"clientSecret\":\"EOhbvHZgFNO21soQJT1L9Q00M3rK6PIEsdiTgXRBt2gtGtxwRer5JvKnVUGNU5oE63fFnjnYY7hq3HBA\"}', '2021-05-21 00:00:14', '2021-05-21 00:00:14'),
(83, 'Paypal - USD', 'USD', '$', 101, 'Paypal', '1.00000000', '10000.00000000', '1.00', '1.00000000', '1.00000000', NULL, '{\"paypal_email\":\"sb-owud61543012@business.example.com\"}', '2021-05-21 00:04:38', '2021-05-21 00:04:38'),
(84, 'Stripe Hosted - USD', 'USD', '$', 103, 'Stripe', '1.00000000', '10000.00000000', '1.00', '1.00000000', '1.00000000', NULL, '{\"secret_key\":\"sk_test_51I6GGiCGv1sRiQlEi5v1or9eR0HVbuzdMd2rW4n3DxC8UKfz66R4X6n4yYkzvI2LeAIuRU9H99ZpY7XCNFC9xMs500vBjZGkKG\",\"publishable_key\":\"pk_test_51I6GGiCGv1sRiQlEOisPKrjBqQqqcFsw8mXNaZ2H2baN6R01NulFS7dKFji1NRRxuchoUTEDdB7ujKcyKYSVc0z500eth7otOM\"}', '2021-05-21 00:48:36', '2021-05-21 00:48:36'),
(86, 'Stripe Storefront - USD', 'USD', '$', 111, 'StripeJs', '1.00000000', '10000.00000000', '1.00', '1.00000000', '1.00000000', NULL, '{\"secret_key\":\"sk_test_51I6GGiCGv1sRiQlEi5v1or9eR0HVbuzdMd2rW4n3DxC8UKfz66R4X6n4yYkzvI2LeAIuRU9H99ZpY7XCNFC9xMs500vBjZGkKG\",\"publishable_key\":\"pk_test_51I6GGiCGv1sRiQlEOisPKrjBqQqqcFsw8mXNaZ2H2baN6R01NulFS7dKFji1NRRxuchoUTEDdB7ujKcyKYSVc0z500eth7otOM\"}', '2021-05-21 00:53:13', '2021-05-21 00:53:13'),
(91, 'Stripe Checkout - USD', 'USD', 'USD', 114, 'StripeV3', '10.00000000', '1000.00000000', '0.00', '1.00000000', '1.00000000', NULL, '{\"secret_key\":\"sk_test_51I6GGiCGv1sRiQlEi5v1or9eR0HVbuzdMd2rW4n3DxC8UKfz66R4X6n4yYkzvI2LeAIuRU9H99ZpY7XCNFC9xMs500vBjZGkKG\",\"publishable_key\":\"pk_test_51I6GGiCGv1sRiQlEOisPKrjBqQqqcFsw8mXNaZ2H2baN6R01NulFS7dKFji1NRRxuchoUTEDdB7ujKcyKYSVc0z500eth7otOM\",\"end_point\":\"whsec_lUmit1gtxwKTveLnSe88xCSDdnPOt8g5\"}', '2021-05-21 01:21:58', '2021-05-21 01:21:58'),
(94, 'Perfect Money - USD', 'USD', '$', 102, 'PerfectMoney', '1.00000000', '10000.00000000', '1.00', '1.00000000', '1.00000000', NULL, '{\"passphrase\":\"hR26aw02Q1eEeUPSIfuwNypXX\",\"wallet_id\":\"U30603391\"}', '2021-05-21 01:36:32', '2021-05-21 01:36:32'),
(96, 'PayStack - NGN', 'NGN', '₦', 107, 'Paystack', '1.00000000', '10000.00000000', '1.00', '1.00000000', '420.00000000', NULL, '{\"public_key\":\"pk_test_cd330608eb47970889bca397ced55c1dd5ad3783\",\"secret_key\":\"sk_test_8a0b1f199362d7acc9c390bff72c4e81f74e2ac3\"}', '2021-05-21 01:52:11', '2021-05-21 01:52:11'),
(97, 'CoinPayments - BTC', 'BTC', '$', 503, 'Coinpayments', '1.00000000', '10000.00000000', '10.00', '1.00000000', '10.00000000', NULL, '{\"public_key\":\"---------------\",\"private_key\":\"------------\",\"merchant_id\":\"93a1e014c4ad60a7980b4a7239673cb4\"}', '2021-05-21 02:07:14', '2021-05-21 02:07:14'),
(109, 'Mollie - USD', 'USD', '$', 115, 'Mollie', '1.00000000', '10000.00000000', '1.00', '1.00000000', '1.00000000', NULL, '{\"mollie_email\":\"vi@gmail.com\",\"api_key\":\"test_cucfwKTWfft9s337qsVfn5CC4vNkrn\"}', '2021-05-21 02:44:45', '2021-05-21 02:44:45'),
(113, 'Instamojo - INR', 'INR', '₹', 112, 'Instamojo', '1.00000000', '10000.00000000', '1.00', '1.00000000', '75.00000000', NULL, '{\"api_key\":\"test_2241633c3bc44a3de84a3b33969\",\"auth_token\":\"test_279f083f7bebefd35217feef22d\",\"salt\":\"19d38908eeff4f58b2ddda2c6d86ca25\"}', '2021-05-21 02:57:00', '2021-05-21 02:57:00'),
(115, 'Flutterwave - USD', 'USD', 'USD', 109, 'Flutterwave', '1.00000000', '2000.00000000', '0.00', '1.00000000', '1.00000000', NULL, '{\"public_key\":\"----------------\",\"secret_key\":\"-----------------------\",\"encryption_key\":\"------------------\"}', '2021-06-05 11:37:45', '2021-06-05 11:37:45'),
(116, 'PayTM - AUD', 'AUD', '$', 105, 'Paytm', '1.00000000', '10000.00000000', '1.00', '1.00000000', '1.00000000', NULL, '{\"MID\":\"DIY12386817555501617\",\"merchant_key\":\"bKMfNxPPf_QdZppa\",\"WEBSITE\":\"DIYtestingweb\",\"INDUSTRY_TYPE_ID\":\"Retail\",\"CHANNEL_ID\":\"WEB\",\"transaction_url\":\"https:\\/\\/pguat.paytm.com\\/oltp-web\\/processTransaction\",\"transaction_status_url\":\"https:\\/\\/pguat.paytm.com\\/paytmchecksum\\/paytmCallback.jsp\"}', '2021-06-14 12:16:39', '2021-06-14 12:16:39'),
(117, 'PayTM - USD', 'USD', '$', 105, 'Paytm', '1.00000000', '10000.00000000', '1.00', '1.00000000', '2.00000000', NULL, '{\"MID\":\"DIY12386817555501617\",\"merchant_key\":\"bKMfNxPPf_QdZppa\",\"WEBSITE\":\"DIYtestingweb\",\"INDUSTRY_TYPE_ID\":\"Retail\",\"CHANNEL_ID\":\"WEB\",\"transaction_url\":\"https:\\/\\/pguat.paytm.com\\/oltp-web\\/processTransaction\",\"transaction_status_url\":\"https:\\/\\/pguat.paytm.com\\/paytmchecksum\\/paytmCallback.jsp\"}', '2021-06-14 12:16:39', '2021-06-14 12:16:39'),
(121, 'Cashmaal - PKR', 'PKR', 'pkr', 116, 'Cashmaal', '1.00000000', '10000.00000000', '10.00', '1.00000000', '100.00000000', NULL, '{\"web_id\":\"3748\",\"ipn_key\":\"546254628759524554647987\"}', '2021-06-22 08:05:04', '2021-06-22 08:05:04'),
(136, 'CoinPayments Fiat - USD', 'USD', '$', 504, 'CoinpaymentsFiat', '1.00000000', '10000.00000000', '10.00', '1.00000000', '10.00000000', NULL, '{\"merchant_id\":\"6515561\"}', '2022-03-10 03:55:32', '2022-03-10 03:55:32'),
(137, 'CoinPayments Fiat - AUD', 'AUD', '$', 504, 'CoinpaymentsFiat', '1.00000000', '10000.00000000', '0.00', '1.00000000', '1.00000000', NULL, '{\"merchant_id\":\"6515561\"}', '2022-03-10 03:55:32', '2022-03-10 03:55:32'),
(140, 'Payeer - USD', 'USD', '$', 106, 'Payeer', '1.00000000', '10000.00000000', '1.00', '1.00000000', '1.00000000', NULL, '{\"merchant_id\":\"866989763\",\"secret_key\":\"7575\"}', '2022-03-21 02:54:29', '2022-03-21 02:54:29'),
(142, 'Blockchain - BTC', 'BTC', '$', 501, 'Blockchain', '1.00000000', '1.11000000', '1.00', '11.00000000', '1.00000000', NULL, '{\"api_key\":\"55529946-05ca-48ff-8710-f279d86b1cc5\",\"xpub_code\":\"xpub6CKQ3xxWyBoFAF83izZCSFUorptEU9AF8TezhtWeMU5oefjX3sFSBw62Lr9iHXPkXmDQJJiHZeTRtD9Vzt8grAYRhvbz4nEvBu3QKELVzFK\"}', '2022-03-21 03:53:18', '2022-03-21 03:53:18'),
(144, 'Coinbase Commerce - USD', 'USD', '$', 506, 'CoinbaseCommerce', '1.00000000', '10000.00000000', '10.00', '1.00000000', '10.00000000', NULL, '{\"api_key\":\"c47cd7df-d8e8-424b-a20a\",\"secret\":\"55871878-2c32-4f64-ab66\"}', '2022-03-30 07:48:19', '2022-03-30 07:48:19'),
(145, 'CoinPayments - ETH', 'JPY', '111', 506, 'CoinbaseCommerce', '1.00000000', '11.00000000', '1.00', '1.00000000', '1.00000000', NULL, '{\"api_key\":\"c47cd7df-d8e8-424b-a20a\",\"secret\":\"55871878-2c32-4f64-ab66\"}', '2022-03-30 07:48:19', '2022-03-30 07:48:19'),
(147, 'Bank Wire', 'USD', '', 1001, 'bank_wire', '10.00000000', '100000.00000000', '1.00', '5.00000000', '1.00000000', '', NULL, '2022-03-30 09:16:43', '2022-07-26 05:57:22'),
(154, 'Authorize.net - USD', 'USD', '$', 120, 'Authorize', '1.00000000', '10.00000000', '1.00', '1.00000000', '1.00000000', NULL, '{\"login_id\":\"59e4P9DBcZv\",\"transaction_key\":\"47x47TJyLw2E7DbR\"}', '2022-08-28 09:33:06', '2022-08-28 09:33:06'),
(156, 'NMI - USD', 'USD', '$', 121, 'NMI', '1.00000000', '10000.00000000', '1.00', '1.00000000', '1.00000000', NULL, '{\"api_key\":\"2F822Rw39fx762MaV7Yy86jXGTC7sCDy\"}', '2022-08-28 10:32:31', '2022-08-28 10:32:31'),
(163, 'Mercado Pago - USD', 'USD', '$', 119, 'MercadoPago', '1.00000000', '10.00000000', '1.00', '1.00000000', '1.00000000', NULL, '{\"access_token\":\"APP_USR-7924565816849832-082312-21941521997fab717db925cf1ea2c190-1071840315\"}', '2022-09-14 07:41:14', '2022-09-14 07:41:14'),
(170, 'Now payments checkout - BTC', 'BTC', '$', 509, 'NowPaymentsCheckout', '1.00000000', '1000.00000000', '1.00', '1.00000000', '1.00000000', NULL, '{\"api_key\":\"---------------\",\"secret_key\":\"-----------\"}', '2023-02-14 05:08:05', '2023-02-14 05:08:05'),
(171, 'Now payments hosted - BTC', 'BTC', '$', 508, 'NowPaymentsHosted', '1.00000000', '100.00000000', '1.00', '1.00000000', '1.00000000', NULL, '{\"api_key\":\"--------\",\"secret_key\":\"------------\"}', '2023-02-14 05:08:23', '2023-02-14 05:08:23');

-- --------------------------------------------------------

--
-- Table structure for table `general_settings`
--

DROP TABLE IF EXISTS `general_settings`;
CREATE TABLE IF NOT EXISTS `general_settings` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `site_name` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cur_text` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'currency text',
  `cur_sym` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'currency symbol',
  `email_from` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_template` text COLLATE utf8mb4_unicode_ci,
  `sms_body` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sms_from` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `base_color` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `secondary_color` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mail_config` text COLLATE utf8mb4_unicode_ci COMMENT 'email configuration',
  `sms_config` text COLLATE utf8mb4_unicode_ci,
  `global_shortcodes` text COLLATE utf8mb4_unicode_ci,
  `kv` tinyint(1) NOT NULL DEFAULT '0',
  `ev` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'email verification, 0 - dont check, 1 - check',
  `en` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'email notification, 0 - dont send, 1 - send',
  `sv` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'mobile verication, 0 - dont check, 1 - check',
  `sn` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'sms notification, 0 - dont send, 1 - send',
  `force_ssl` tinyint(1) NOT NULL DEFAULT '0',
  `maintenance_mode` tinyint(1) NOT NULL DEFAULT '0',
  `secure_password` tinyint(1) NOT NULL DEFAULT '0',
  `agree` tinyint(1) NOT NULL DEFAULT '0',
  `multi_language` tinyint(1) NOT NULL DEFAULT '1',
  `registration` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0: Off	, 1: On',
  `active_template` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_info` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `general_settings`
--

INSERT INTO `general_settings` (`id`, `site_name`, `cur_text`, `cur_sym`, `email_from`, `email_template`, `sms_body`, `sms_from`, `base_color`, `secondary_color`, `mail_config`, `sms_config`, `global_shortcodes`, `kv`, `ev`, `en`, `sv`, `sn`, `force_ssl`, `maintenance_mode`, `secure_password`, `agree`, `multi_language`, `registration`, `active_template`, `system_info`, `created_at`, `updated_at`) VALUES
(1, 'Techyeah', 'USD', '$', 'info@techyeah', '<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\r\n  <!--[if !mso]><!-->\r\n  <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n  <!--<![endif]-->\r\n  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n  <title></title>\r\n  <style type=\"text/css\">\r\n.ReadMsgBody { width: 100%; background-color: #ffffff; }\r\n.ExternalClass { width: 100%; background-color: #ffffff; }\r\n.ExternalClass, .ExternalClass p, .ExternalClass span, .ExternalClass font, .ExternalClass td, .ExternalClass div { line-height: 100%; }\r\nhtml { width: 100%; }\r\nbody { -webkit-text-size-adjust: none; -ms-text-size-adjust: none; margin: 0; padding: 0; }\r\ntable { border-spacing: 0; table-layout: fixed; margin: 0 auto;border-collapse: collapse; }\r\ntable table table { table-layout: auto; }\r\n.yshortcuts a { border-bottom: none !important; }\r\nimg:hover { opacity: 0.9 !important; }\r\na { color: #0087ff; text-decoration: none; }\r\n.textbutton a { font-family: \'open sans\', arial, sans-serif !important;}\r\n.btn-link a { color:#FFFFFF !important;}\r\n\r\n@media only screen and (max-width: 480px) {\r\nbody { width: auto !important; }\r\n*[class=\"table-inner\"] { width: 90% !important; text-align: center !important; }\r\n*[class=\"table-full\"] { width: 100% !important; text-align: center !important; }\r\n/* image */\r\nimg[class=\"img1\"] { width: 100% !important; height: auto !important; }\r\n}\r\n</style>\r\n\r\n\r\n\r\n  <table bgcolor=\"#414a51\" width=\"100%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n    <tbody><tr>\r\n      <td height=\"50\"></td>\r\n    </tr>\r\n    <tr>\r\n      <td align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n        <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n          <tbody><tr>\r\n            <td align=\"center\" width=\"600\">\r\n              <!--header-->\r\n              <table class=\"table-inner\" width=\"95%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                <tbody><tr>\r\n                  <td bgcolor=\"#0087ff\" style=\"border-top-left-radius:6px; border-top-right-radius:6px;text-align:center;vertical-align:top;font-size:0;\" align=\"center\">\r\n                    <table width=\"90%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td align=\"center\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#FFFFFF; font-size:16px; font-weight: bold;\">This is a System Generated Email</td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n              </tbody></table>\r\n              <!--end header-->\r\n              <table class=\"table-inner\" width=\"95%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                <tbody><tr>\r\n                  <td bgcolor=\"#FFFFFF\" align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n                    <table align=\"center\" width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"35\"></td>\r\n                      </tr>\r\n                      <!--logo-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"vertical-align:top;font-size:0;\">\r\n                          <a href=\"#\">\r\n                            <img style=\"display:block; line-height:0px; font-size:0px; border:0px;\" src=\"https://i.imgur.com/Z1qtvtV.png\" alt=\"img\">\r\n                          </a>\r\n                        </td>\r\n                      </tr>\r\n                      <!--end logo-->\r\n                      <tr>\r\n                        <td height=\"40\"></td>\r\n                      </tr>\r\n                      <!--headline-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"font-family: \'Open Sans\', Arial, sans-serif; font-size: 22px;color:#414a51;font-weight: bold;\">Hello {{fullname}} ({{username}})</td>\r\n                      </tr>\r\n                      <!--end headline-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n                          <table width=\"40\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                            <tbody><tr>\r\n                              <td height=\"20\" style=\" border-bottom:3px solid #0087ff;\"></td>\r\n                            </tr>\r\n                          </tbody></table>\r\n                        </td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                      <!--content-->\r\n                      <tr>\r\n                        <td align=\"left\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#7f8c8d; font-size:16px; line-height: 28px;\">{{message}}</td>\r\n                      </tr>\r\n                      <!--end content-->\r\n                      <tr>\r\n                        <td height=\"40\"></td>\r\n                      </tr>\r\n              \r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n                <tr>\r\n                  <td height=\"45\" align=\"center\" bgcolor=\"#f4f4f4\" style=\"border-bottom-left-radius:6px;border-bottom-right-radius:6px;\">\r\n                    <table align=\"center\" width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"10\"></td>\r\n                      </tr>\r\n                      <!--preference-->\r\n                      <tr>\r\n                        <td class=\"preference-link\" align=\"center\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#95a5a6; font-size:14px;\">\r\n                          © 2021 <a href=\"#\">{{site_name}}</a>&nbsp;. All Rights Reserved. \r\n                        </td>\r\n                      </tr>\r\n                      <!--end preference-->\r\n                      <tr>\r\n                        <td height=\"10\"></td>\r\n                      </tr>\r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n              </tbody></table>\r\n            </td>\r\n          </tr>\r\n        </tbody></table>\r\n      </td>\r\n    </tr>\r\n    <tr>\r\n      <td height=\"60\"></td>\r\n    </tr>\r\n  </tbody></table>', 'hi {{fullname}} ({{username}}), {{message}}', 'ViserAdmin', NULL, NULL, '{\"name\":\"php\"}', '{\"name\":\"nexmo\",\"clickatell\":{\"api_key\":\"----------------\"},\"infobip\":{\"username\":\"------------8888888\",\"password\":\"-----------------\"},\"message_bird\":{\"api_key\":\"-------------------\"},\"nexmo\":{\"api_key\":\"----------------------\",\"api_secret\":\"----------------------\"},\"sms_broadcast\":{\"username\":\"----------------------\",\"password\":\"-----------------------------\"},\"twilio\":{\"account_sid\":\"-----------------------\",\"auth_token\":\"---------------------------\",\"from\":\"----------------------\"},\"text_magic\":{\"username\":\"-----------------------\",\"apiv2_key\":\"-------------------------------\"},\"custom\":{\"method\":\"get\",\"url\":\"https:\\/\\/hostname\\/demo-api-v1\",\"headers\":{\"name\":[\"api_key\"],\"value\":[\"test_api 555\"]},\"body\":{\"name\":[\"from_number\"],\"value\":[\"5657545757\"]}}}', '{\n    \"site_name\":\"Name of your site\",\n    \"site_currency\":\"Currency of your site\",\n    \"currency_symbol\":\"Symbol of currency\"\n}', 0, 1, 1, 0, 1, 0, 0, 0, 1, 1, 1, 'basic', '[]', NULL, '2023-09-21 05:09:30');

-- --------------------------------------------------------

--
-- Table structure for table `inventories`
--

DROP TABLE IF EXISTS `inventories`;
CREATE TABLE IF NOT EXISTS `inventories` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `customer_id` bigint UNSIGNED DEFAULT NULL,
  `item_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `part_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ty_part_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `manufacturer` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unit_cost` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=164 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `inventories`
--

INSERT INTO `inventories` (`id`, `customer_id`, `item_name`, `description`, `quantity`, `part_number`, `ty_part_number`, `manufacturer`, `unit_cost`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Acton Wallace', 'Ab dolorum ea sapien1', '12', 'Xena Byrd', 'Xena Byrd-TY', 'Adam Marquez', 15, '2023-11-19 09:08:07', '2023-11-21 09:33:16'),
(2, NULL, 'Janna Gentry', 'Ea quis dolores aspe', '122', 'Lunea Donaldson', 'Lunea Donaldson-TY', 'Knox Fitzpatrick', 297, '2023-11-19 09:09:41', '2023-11-19 11:29:46'),
(3, NULL, 'Irma Evans', 'Excepteur quae sit', '775', 'Wynne Lowery', 'Wynne Lowery-TY', 'Shellie Dotson', 541, '2023-11-19 09:09:41', '2023-11-19 09:09:41'),
(4, NULL, 'Hilda Mccullough', 'Repellendus Vel com', '604', 'Gil Marshall', 'Gil Marshall-TY', 'Jana Rosario', 120, '2023-11-19 09:09:41', '2023-11-20 06:19:13'),
(5, NULL, 'Phyllis Hopper', 'Aut ex neque sed id', '343', 'Quintessa Chase', 'Quintessa Chase-TY', 'Herrod Solomon', 836, '2023-11-19 09:09:41', '2023-11-19 09:09:41'),
(6, NULL, 'Chastity Valenzuela', 'Libero exercitation', '30', 'Dalton Hawkins', 'Dalton Hawkins-TY', 'Nissim Pate', 260, '2023-11-19 09:09:42', '2023-11-19 09:09:42'),
(7, NULL, 'Bianca Boyd', 'Et in aliqua Et vol', '155', 'Jescie Nash', 'Jescie Nash-TY', 'Thane Morse', 217, '2023-11-19 09:09:42', '2023-11-19 09:09:42'),
(8, NULL, 'Dillon Grant', 'Quae consequuntur et', '980', 'Roth Duffy', 'Roth Duffy-TY', 'Amethyst Bishop', 512, '2023-11-19 09:09:42', '2023-11-19 09:09:42'),
(9, NULL, 'Gannon Nieves123', 'Architecto dignissim45', '1001', 'Jaime Horne123', 'Jaime Horne-TY', 'Basia May123', 42945, '2023-11-19 09:09:42', '2023-11-20 06:15:42'),
(14, 1, 'Omar Christian', 'Sunt voluptatem esse', '978', 'Fiona Roman', 'Fiona Roman-TY', 'Amela Whitaker', 741, '2023-11-19 09:11:17', '2023-11-19 09:11:17'),
(15, 1, 'Tamara Odom', 'Quia exercitation ha', '763', 'Cheryl Hubbard', 'Cheryl Hubbard-TY', 'Pascale Head', 237, '2023-11-19 09:11:17', '2023-11-19 09:11:17'),
(16, 1, 'Russell Palmer', 'Impedit occaecat mi', '45', 'Ginger Marquez', 'Ginger Marquez-TY', 'Grace Pickett', 948, '2023-11-19 09:11:17', '2023-11-19 09:11:17'),
(17, 1, 'Kuame Bauer', 'Rerum aut similique', '816', 'Christian Alvarado', 'Christian Alvarado-TY', 'Edward Charles', 362, '2023-11-19 09:11:17', '2023-11-19 09:11:17'),
(18, 1, 'Nadine Powers', 'Deserunt magni quod', '341', 'Jerome Stafford', 'Jerome Stafford-TY', 'Melyssa Strickland', 110, '2023-11-19 09:11:17', '2023-11-19 09:11:17'),
(19, 1, 'Elmo Guerrero', 'Consequatur Volupta', '496', 'Caldwell Morales', 'Caldwell Morales-TY', 'Neville Mayer', 624, '2023-11-19 09:11:17', '2023-11-19 09:11:17'),
(20, 1, 'Gage Lloyd', 'Dicta eum corporis l', '911', 'Addison Wagner', 'Addison Wagner-TY', 'Darrel Mayer', 934, '2023-11-19 09:11:17', '2023-11-19 09:11:17'),
(21, 1, 'Karina Torres', 'Quis est omnis fugia', '811', 'Giacomo Rosario', 'Giacomo Rosario-TY', 'Dakota Cardenas', 422, '2023-11-20 09:44:35', '2023-11-20 09:44:35'),
(22, 1, 'Castor Bruce', 'At sapiente excepteu', '260', 'Colin Davenport', 'Colin Davenport-TY', 'Marshall Bradshaw', 356, '2023-11-20 09:44:35', '2023-11-20 09:44:35'),
(24, 2, 'TaShya Weeks', 'Adipisicing aspernat', '618', 'Jada Morrow', 'Jada Morrow-TY', 'Odysseus Frye', 923, '2023-11-20 09:45:23', '2023-11-20 09:45:23'),
(25, 2, 'Tamara Osborne', 'Sint eaque nisi non', '696', 'Elizabeth Pugh', 'Elizabeth Pugh-TY', 'Keelie Nguyen', 329, '2023-11-20 09:45:23', '2023-11-20 09:45:23'),
(26, 2, 'Constance Gibbs', 'Labore laudantium s', '227', 'Wallace Dyer', 'Wallace Dyer-TY', 'Heidi Farrell', 223, '2023-11-20 09:45:23', '2023-11-20 09:45:23'),
(27, 2, 'Colton Pace', 'Aperiam voluptatem', '275', 'Ebony Jensen', 'Ebony Jensen-TY', 'Raja Keith', 52, '2023-11-20 09:45:23', '2023-11-20 09:45:23'),
(28, 2, 'Ulric Townsend', 'Minus aut non except', '293', 'Mona Finch', 'Mona Finch-TY', 'Gregory Holloway', 1, '2023-11-20 09:45:23', '2023-11-20 09:45:23'),
(29, 2, 'Kenneth Ochoa', 'Fugiat omnis perspic', '308', 'Sasha Pierce', 'Sasha Pierce-TY', 'Jemima Shields', 424, '2023-11-20 09:45:23', '2023-11-20 09:45:23'),
(30, 2, 'Jamal Harris', 'Assumenda incidunt', '376', 'Price Barry', 'Price Barry-TY', 'Amaya Langley', 726, '2023-11-20 09:45:23', '2023-11-20 09:45:23'),
(31, 2, 'Britanni Peterson', 'Non labore sit ea co', '343', 'Carter Boone', 'Carter Boone-TY', 'Martha Horne', 382, '2023-11-20 09:45:23', '2023-11-20 09:45:23'),
(32, 2, 'Tarik Mullen', 'Error dolore dolorum', '996', 'Amena Dennis', 'Amena Dennis-TY', 'Kermit Dyer', 874, '2023-11-20 09:45:23', '2023-11-20 09:45:23'),
(33, 2, 'Joy Hill', 'Aute lorem quia reru', '977', 'Sydney Mcdaniel', 'Sydney Mcdaniel-TY', 'Octavia Mcconnell', 375, '2023-11-20 09:45:23', '2023-11-20 09:45:23'),
(34, 2, 'Kerry Dillon', 'Dolores quisquam sed', '39', 'Kamal Lindsay', 'Kamal Lindsay-TY', 'Mona Morin', 886, '2023-11-20 09:45:23', '2023-11-20 09:45:23'),
(35, 2, 'Tasha Nunez', 'Et quia cupiditate v', '376', 'Kirby Mendez', 'Kirby Mendez-TY', 'Chantale Huff', 973, '2023-11-20 09:45:23', '2023-11-20 09:45:23'),
(36, 2, 'Orla Mcclure', 'Iste vel culpa sed m', '401', 'Willa Romero', 'Willa Romero-TY', 'Richard Meyer', 186, '2023-11-20 09:45:23', '2023-11-20 09:45:23'),
(37, 2, 'Driscoll Cox', 'Consectetur suscipi', '307', 'Victor Hutchinson', 'Victor Hutchinson-TY', 'Nyssa Evans', 51, '2023-11-20 09:45:23', '2023-11-20 09:45:23'),
(38, 6, 'Priscilla Pacheco', 'Proident corrupti', '705', 'Zane Wilcox', 'Zane Wilcox-TY', 'Olga Bryant', 687, '2023-11-20 11:31:45', '2023-11-20 11:31:45'),
(39, 6, 'Eric Perkins', 'Incidunt fuga Odio', '181', 'Lael Craft', 'Lael Craft-TY', 'Alden Stein', 750, '2023-11-20 11:31:45', '2023-11-20 11:31:45'),
(40, 6, 'Ryder Vaughn', 'Consequuntur aut dic', '309', 'Davis Nolan', 'Davis Nolan-TY', 'Alika Alvarez', 473, '2023-11-20 11:31:46', '2023-11-20 11:31:46'),
(41, 6, 'Salvador Mcdowell', 'Mollitia cupiditate', '683', 'Lillith Preston', 'Lillith Preston-TY', 'Hamilton Mann', 12, '2023-11-20 11:31:46', '2023-11-20 11:31:46'),
(42, 6, 'Nevada Parrish', 'Consequuntur aut cup', '127', 'Aretha Daniels', 'Aretha Daniels-TY', 'Desirae Rios', 979, '2023-11-20 11:31:46', '2023-11-20 11:31:46'),
(43, 7, 'Allen Lamb', 'Ullamco dolor cupida', '340', 'Simon Jordan', 'Simon Jordan-TY', 'Juliet Bender', 430, '2023-11-20 11:56:36', '2023-11-20 11:56:36'),
(44, 7, 'Colby Vang', 'Quis consequuntur do', '739', 'Deacon Morse', 'Deacon Morse-TY', 'Lawrence Mendez', 235, '2023-11-20 11:56:36', '2023-11-20 11:56:36'),
(45, 1, 'Angelica Saunders', 'Do doloremque aliqua', '739', 'Kerry Gamble', 'Kerry Gamble-TY', 'Lee Castaneda', 123, '2023-11-21 05:07:02', '2023-11-21 05:07:02'),
(46, 1, 'Stephen Schwartz', 'Est quo dolore sit', '279', 'Alana Coffey', 'Alana Coffey-TY', 'Alexa Harrington', 133, '2023-11-21 05:07:02', '2023-11-21 05:07:02'),
(47, 1, 'Neve Peck', 'Iure laboris autem q', '1000', 'Shelly Slater', 'Shelly Slater-TY', 'Hiram Beard', 861, '2023-11-21 05:07:02', '2023-11-21 05:07:02'),
(48, 1, 'Rosalyn Callahan', 'Eum eligendi id aper', '586', 'Alice Mendoza', 'Alice Mendoza-TY', 'Idola Mann', 87, '2023-11-21 05:07:02', '2023-11-21 05:07:02'),
(49, 1, 'Claire Hicks', 'Odit nemo non vel Na', '753', 'Cain Rodriquez', 'Cain Rodriquez-TY', 'Sierra Levy', 560, '2023-11-21 05:07:02', '2023-11-21 05:07:02'),
(50, 1, 'Zenia Chapman', 'Voluptas aut labore', '298', 'Kylee Lyons', 'Kylee Lyons-TY', 'Samson Kim', 438, '2023-11-21 05:07:02', '2023-11-21 05:07:02'),
(51, 1, 'Kevin Andrews', 'Saepe esse iusto lab', '651', 'Alexis Cain', 'Alexis Cain-TY', 'Lareina Cleveland', 23, '2023-11-21 05:07:02', '2023-11-21 05:07:02'),
(52, 1, 'Ivy Gallagher', 'Quod cupidatat volup', '375', 'Regan Albert', 'Regan Albert-TY', 'Justin Gay', 999, '2023-11-21 05:07:02', '2023-11-21 05:07:02'),
(53, 1, 'Jessamine Mercer', 'Quae aut minim vitae', '475', 'Lawrence Graves', 'Lawrence Graves-TY', 'Mechelle Perry', 273, '2023-11-21 05:07:02', '2023-11-21 05:07:02'),
(54, 1, 'Zephr Fletcher', 'Non hic aut quam sin', '888', 'Eric Hancock', 'Eric Hancock-TY', 'Dennis Huff', 276, '2023-11-21 05:07:02', '2023-11-21 05:07:02'),
(55, 1, 'TaShya Floyd', 'Et est nemo cum quia', '411', 'Alyssa Blackburn', 'Alyssa Blackburn-TY', 'Ezra Sexton', 575, '2023-11-21 05:07:02', '2023-11-21 05:07:02'),
(56, 1, 'Melvin Soto', 'Adipisicing recusand', '556', 'Nehru Lynn', 'Nehru Lynn-TY', 'Genevieve Puckett', 279, '2023-11-21 05:07:02', '2023-11-21 05:07:02'),
(57, 1, 'Ira Sweet', 'Beatae proident ea', '305', 'Carolyn Jarvis', 'Carolyn Jarvis-TY', 'Chase Miles', 559, '2023-11-21 05:07:02', '2023-11-21 05:07:02'),
(58, 1, 'Kamal Cruz', 'Sunt minima eveniet', '167', 'Maite Gillespie', 'Maite Gillespie-TY', 'Joy Kelley', 998, '2023-11-21 05:07:02', '2023-11-21 05:07:02'),
(59, 1, 'Zahir Pratt', 'Minus non voluptates', '219', 'Phelan Frye', 'Phelan Frye-TY', 'Hollee Spence', 826, '2023-11-21 05:07:02', '2023-11-21 05:07:02'),
(60, 1, 'Yardley Harvey', 'Debitis culpa quo qu', '592', 'Kasimir Melendez', 'Kasimir Melendez-TY', 'Phoebe Rojas', 707, '2023-11-21 05:07:03', '2023-11-21 05:07:03'),
(61, 1, 'Norman Mccoy', 'Magnam est eu ea no', '966', 'Geraldine Riggs', 'Geraldine Riggs-TY', 'Renee Riddle', 67, '2023-11-21 05:07:03', '2023-11-21 05:07:03'),
(62, 1, 'Yvonne Rogers', 'Enim id omnis ipsum', '56', 'Macaulay Ortiz', 'Macaulay Ortiz-TY', 'Kirby Stark', 550, '2023-11-21 05:07:03', '2023-11-21 05:07:03'),
(63, 1, 'Jennifer Robinson', 'Nisi mollit eaque si', '420', 'Isabella Rogers', 'Isabella Rogers-TY', 'Channing Soto', 380, '2023-11-21 05:07:03', '2023-11-21 05:07:03'),
(64, 1, 'Kylie Clayton', 'Quod quasi vero ab u', '80', 'Pamela Saunders', 'Pamela Saunders-TY', 'Barclay Conley', 385, '2023-11-21 05:07:03', '2023-11-21 05:07:03'),
(65, 1, 'Caesar Thomas', 'Eos qui quisquam ar', '967', 'Kevin Workman', 'Kevin Workman-TY', 'Shelby Bernard', 82, '2023-11-21 05:07:03', '2023-11-21 05:07:03'),
(66, 1, 'Uriel Hines', 'Et quia omnis volupt', '598', 'Clare Goff', 'Clare Goff-TY', 'Nerea Tran', 727, '2023-11-21 05:07:03', '2023-11-21 05:07:03'),
(67, 1, 'Paul Wilkins', 'Ea sunt sint repreh', '944', 'Leo Schultz', 'Leo Schultz-TY', 'Baxter Walls', 217, '2023-11-21 05:07:03', '2023-11-21 05:07:03'),
(68, 1, 'Axel Hayes', 'Excepturi rerum non', '999', 'Yeo Castillo', 'Yeo Castillo-TY', 'Harlan Franklin', 813, '2023-11-21 05:07:03', '2023-11-21 05:07:03'),
(69, 1, 'Dai Hall', 'Voluptatem laboris m', '433', 'Fuller Cash', 'Fuller Cash-TY', 'Branden Owen', 121, '2023-11-21 05:07:03', '2023-11-21 05:07:03'),
(70, 1, 'Ulric Galloway', 'Ad eos eligendi eos', '228', 'Ruby Santiago', 'Ruby Santiago-TY', 'Tatum Horne', 994, '2023-11-21 05:07:03', '2023-11-21 05:07:03'),
(71, 1, 'Yasir Lawrence', 'Ipsum non aut non qu', '668', 'Lara Parsons', 'Lara Parsons-TY', 'Noah Oneal', 899, '2023-11-21 05:07:03', '2023-11-21 05:07:03'),
(72, 1, 'Owen Alexander', 'Et eiusmod rerum com', '375', 'Tucker Sawyer', 'Tucker Sawyer-TY', 'Wyoming Richard', 444, '2023-11-21 05:07:03', '2023-11-21 05:07:03'),
(73, 1, 'Ray Woodard', 'Ex dolor perferendis', '598', 'Stuart Lane', 'Stuart Lane-TY', 'Rama Ferrell', 962, '2023-11-21 05:07:03', '2023-11-21 05:07:03'),
(74, 1, 'Brody Mullins', 'Aliquam accusamus do', '182', 'Oprah Mcclure', 'Oprah Mcclure-TY', 'Lester Hines', 580, '2023-11-21 05:07:03', '2023-11-21 05:07:03'),
(75, 1, 'Lara Donaldson', 'Quos placeat et cum', '760', 'Buckminster Carroll', 'Buckminster Carroll-TY', 'Vance Hatfield', 53, '2023-11-21 05:07:03', '2023-11-21 05:07:03'),
(76, 1, 'Akeem Levy', 'Eum nulla hic harum', '483', 'Lee Foreman', 'Lee Foreman-TY', 'Piper Davidson', 312, '2023-11-21 05:07:03', '2023-11-21 05:07:03'),
(77, 1, 'Florence Bass', 'Deserunt ex necessit', '408', 'Yoshio Carrillo', 'Yoshio Carrillo-TY', 'Kristen Pickett', 836, '2023-11-21 05:07:03', '2023-11-21 05:07:03'),
(78, 1, 'Keaton Sheppard', 'Perspiciatis unde n', '62', 'Cameron Winters', 'Cameron Winters-TY', 'Pamela Castaneda', 877, '2023-11-21 05:07:03', '2023-11-21 05:07:03'),
(79, 1, 'Phoebe Morrow', 'Nisi eius quasi quam', '526', 'Evangeline Stout', 'Evangeline Stout-TY', 'Xena Schneider', 680, '2023-11-21 05:07:03', '2023-11-21 05:07:03'),
(80, 1, 'Gil Alford', 'Architecto ut assume', '174', 'Sean Fleming', 'Sean Fleming-TY', 'Owen Davis', 451, '2023-11-21 05:07:03', '2023-11-21 05:07:03'),
(81, 1, 'Armand Beard', 'Maiores ea sit sed a', '743', 'Wing Ingram', 'Wing Ingram-TY', 'Xerxes Stephens', 223, '2023-11-21 05:07:03', '2023-11-21 05:07:03'),
(82, 1, 'Jorden Fry', 'Ipsa aliquam esse', '1', 'Burton Estes', 'Burton Estes-TY', 'Zenaida Garza', 173, '2023-11-21 05:07:03', '2023-11-21 05:07:03'),
(83, 1, 'Drew Nixon', 'Dignissimos cupidita', '610', 'Talon Douglas', 'Talon Douglas-TY', 'Medge Kent', 694, '2023-11-21 05:07:03', '2023-11-21 05:07:03'),
(84, 1, 'Orla Haney', 'Eum esse autem sit t', '655', 'Blossom Callahan', 'Blossom Callahan-TY', 'Xaviera Allison', 138, '2023-11-21 05:07:03', '2023-11-21 05:07:03'),
(85, 1, 'Todd Holmes', 'Mollit est neque do', '120', 'Dominic Galloway', 'Dominic Galloway-TY', 'Nevada Good', 708, '2023-11-21 05:07:03', '2023-11-21 05:07:03'),
(86, 1, 'Isadora Brooks', 'Nostrum sit volupta', '118', 'Hiroko Melton', 'Hiroko Melton-TY', 'Paki Vega', 153, '2023-11-21 05:07:03', '2023-11-21 05:07:03'),
(87, 1, 'Avye Dotson', 'Quisquam occaecat do', '157', 'Leigh Hogan', 'Leigh Hogan-TY', 'Lester Garner', 193, '2023-11-21 05:07:03', '2023-11-21 05:07:03'),
(88, 1, 'Mariam Snyder', 'Culpa et aut omnis', '435', 'Chanda Cruz', 'Chanda Cruz-TY', 'Harriet Washington', 190, '2023-11-21 05:07:03', '2023-11-21 05:07:03'),
(89, 1, 'Ezra Shepherd', 'Quia qui molestias n', '891', 'Imogene Frank', 'Imogene Frank-TY', 'Sharon Puckett', 839, '2023-11-21 05:07:04', '2023-11-21 05:07:04'),
(90, 1, 'Nell Williams', 'Dolore in illo nulla', '866', 'Rama Emerson', 'Rama Emerson-TY', 'Adena Spence', 567, '2023-11-21 05:07:04', '2023-11-21 05:07:04'),
(91, 1, 'Jermaine Shannon', 'Sunt nisi et aliquam', '228', 'Blake Keller', 'Blake Keller-TY', 'Kay Randall', 536, '2023-11-21 05:07:04', '2023-11-21 05:07:04'),
(92, 1, 'Ayanna Hood', 'Eligendi anim eu eu', '250', 'Nerea Raymond', 'Nerea Raymond-TY', 'Ivy Walton', 169, '2023-11-21 05:07:04', '2023-11-21 05:07:04'),
(93, 1, 'Xander Pate', 'Eos consectetur impe', '496', 'Justine Bowen', 'Justine Bowen-TY', 'Lev Sims', 50, '2023-11-21 05:07:04', '2023-11-21 05:07:04'),
(94, 1, 'Eric Peck', 'Eaque qui architecto', '474', 'Phillip Willis', 'Phillip Willis-TY', 'Elizabeth Holloway', 904, '2023-11-21 05:07:04', '2023-11-21 05:07:04'),
(95, 1, 'Upton Alexander', 'Veritatis aliquam as', '804', 'Harrison Tucker', 'Harrison Tucker-TY', 'Kaden Craig', 871, '2023-11-21 05:07:04', '2023-11-21 05:07:04'),
(96, 1, 'Lara Higgins', 'Aliqua Accusamus do', '244', 'Rina Mills', 'Rina Mills-TY', 'Peter Spencer', 475, '2023-11-21 05:07:04', '2023-11-21 05:07:04'),
(97, 1, 'Susan Church', 'Provident incididun', '792', 'Malachi Marshall', 'Malachi Marshall-TY', 'Amos Sharpe', 806, '2023-11-21 05:07:04', '2023-11-21 05:07:04'),
(98, 1, 'Blythe Delacruz', 'Est adipisicing lab', '143', 'Kane Stein', 'Kane Stein-TY', 'Ursa Santos', 50, '2023-11-21 05:07:04', '2023-11-21 05:07:04'),
(99, 1, 'Belle Knox', 'Ex quam similique co', '825', 'Chadwick Jackson', 'Chadwick Jackson-TY', 'Yolanda Holcomb', 534, '2023-11-21 05:07:04', '2023-11-21 05:07:04'),
(100, 1, 'Freya Chandler', 'Cupidatat aperiam co', '481', 'Harriet White', 'Harriet White-TY', 'Maile Henry', 718, '2023-11-21 05:07:04', '2023-11-21 05:07:04'),
(101, 1, 'Nasim Kirkland', 'Voluptas nulla aliqu', '26', 'Venus Moses', 'Venus Moses-TY', 'Karleigh Barker', 748, '2023-11-21 05:07:04', '2023-11-21 05:07:04'),
(102, 1, 'Natalie Navarro', 'Mollit consequat Ni', '557', 'Cara Nguyen', 'Cara Nguyen-TY', 'Ivory Travis', 608, '2023-11-21 05:07:04', '2023-11-21 05:07:04'),
(103, 1, 'Nina Yates', 'Delectus minim dict', '141', 'Quinn Williams', 'Quinn Williams-TY', 'Ina Le', 765, '2023-11-21 05:07:04', '2023-11-21 05:07:04'),
(104, 1, 'Yolanda Stephenson', 'In molestiae in sint', '890', 'Melanie Hughes', 'Melanie Hughes-TY', 'Finn Watson', 937, '2023-11-21 05:07:04', '2023-11-21 05:07:04'),
(105, 1, 'Kaye White', 'Maiores ea tenetur s', '150', 'Joan Burke', 'Joan Burke-TY', 'Justin Wood', 354, '2023-11-21 05:07:04', '2023-11-21 05:07:04'),
(106, 1, 'Kylynn Mercado', 'Ea natus assumenda m', '850', 'Aurelia Brock', 'Aurelia Brock-TY', 'Norman Carver', 907, '2023-11-21 05:07:04', '2023-11-21 05:07:04'),
(107, 1, 'Lucian Larsen', 'Est in hic dolor quo', '115', 'Alden Wilkinson', 'Alden Wilkinson-TY', 'Winter Martin', 78, '2023-11-21 05:07:04', '2023-11-21 05:07:04'),
(108, 1, 'Eliana Mcleod', 'Ex vel qui veritatis', '532', 'Kermit Stephens', 'Kermit Stephens-TY', 'Connor Brown', 55, '2023-11-21 05:07:04', '2023-11-21 05:07:04'),
(109, 1, 'Eleanor Gallagher', 'Nobis minus culpa as', '752', 'Brett Hendricks', 'Brett Hendricks-TY', 'Ashely Rivas', 698, '2023-11-21 05:07:04', '2023-11-21 05:07:04'),
(110, 1, 'Samson Russell', 'Cupidatat et non qua', '45', 'Tatiana Reeves', 'Tatiana Reeves-TY', 'Jenette Maddox', 261, '2023-11-21 05:07:04', '2023-11-21 05:07:04'),
(111, 1, 'Virginia Tyler', 'Dolore qui deleniti', '575', 'Scarlett Swanson', 'Scarlett Swanson-TY', 'Dominic Jensen', 121, '2023-11-21 05:07:04', '2023-11-21 05:07:04'),
(112, 1, 'Reagan Williams', 'Voluptates blanditii', '351', 'Fuller Bentley', 'Fuller Bentley-TY', 'Orla Marsh', 392, '2023-11-21 05:07:04', '2023-11-21 05:07:04'),
(113, 1, 'Mara Lee', 'Accusantium hic opti', '385', 'Clarke Marsh', 'Clarke Marsh-TY', 'Ria Downs', 352, '2023-11-21 05:07:05', '2023-11-21 05:07:05'),
(114, 1, 'Cody Richard', 'Rem doloribus duis n', '7', 'Dante Tillman', 'Dante Tillman-TY', 'Fatima Davidson', 223, '2023-11-21 05:07:05', '2023-11-21 05:07:05'),
(115, 1, 'Jenna Moody', 'Labore vel quis ea d', '675', 'Rogan Huff', 'Rogan Huff-TY', 'Stacy Becker', 45, '2023-11-21 05:07:05', '2023-11-21 05:07:05'),
(116, 1, 'Scott Murphy', 'Pariatur Ut labore', '313', 'Reece Barry', 'Reece Barry-TY', 'Reagan Webster', 976, '2023-11-21 05:07:05', '2023-11-21 05:07:05'),
(117, 1, 'Miriam Alvarado', 'Saepe suscipit cupid', '43', 'Carol Good', 'Carol Good-TY', 'Glenna Clements', 391, '2023-11-21 05:07:05', '2023-11-21 05:07:05'),
(118, 1, 'Aline Brock', 'Ut fugit itaque vel', '243', 'Vanna Jensen', 'Vanna Jensen-TY', 'Meghan Parks', 429, '2023-11-21 05:07:05', '2023-11-21 05:07:05'),
(119, 1, 'Carla Barrett', 'Laborum Praesentium', '306', 'Oren Hicks', 'Oren Hicks-TY', 'Brenna Monroe', 277, '2023-11-21 05:07:05', '2023-11-21 05:07:05'),
(120, 1, 'Julie Frye', 'Excepteur quas aliqu', '295', 'Axel Ferrell', 'Axel Ferrell-TY', 'Thaddeus Guerrero', 547, '2023-11-21 05:07:05', '2023-11-21 05:07:05'),
(121, 1, 'Kameko Martinez', 'Qui vitae nobis comm', '247', 'Hall Gross', 'Hall Gross-TY', 'Rhoda Bond', 668, '2023-11-21 05:07:05', '2023-11-21 05:07:05'),
(122, 1, 'Ashton Adams', 'Non officia perferen', '740', 'Ignatius Hayden', 'Ignatius Hayden-TY', 'Zane Hawkins', 54, '2023-11-21 05:07:05', '2023-11-21 05:07:05'),
(123, 1, 'Gray Anderson', 'Modi fugiat tempore', '246', 'Alfonso Lane', 'Alfonso Lane-TY', 'Olga Ryan', 904, '2023-11-21 05:07:05', '2023-11-21 05:07:05'),
(124, 1, 'Shaine Klein', 'Velit ratione minima', '523', 'Carol Payne', 'Carol Payne-TY', 'Ryan Holcomb', 195, '2023-11-21 05:07:05', '2023-11-21 05:07:05'),
(125, 1, 'Lisandra Boyer', 'Quis hic minus velit', '496', 'Alea Hale', 'Alea Hale-TY', 'Lynn Taylor', 544, '2023-11-21 05:07:05', '2023-11-21 05:07:05'),
(126, 1, 'Dolan Conrad', 'Neque omnis quaerat', '473', 'Colt Stevenson', 'Colt Stevenson-TY', 'Linda Best', 279, '2023-11-21 05:07:05', '2023-11-21 05:07:05'),
(127, 1, 'Cora Moss', 'Enim officia cupidat', '66', 'Kameko Patel', 'Kameko Patel-TY', 'Seth Becker', 203, '2023-11-21 05:07:05', '2023-11-21 05:07:05'),
(128, 1, 'Karyn Velazquez', 'Quo itaque expedita', '459', 'Yoshio Daugherty', 'Yoshio Daugherty-TY', 'Reuben Michael', 662, '2023-11-21 05:07:05', '2023-11-21 05:07:05'),
(129, 1, 'Chester Herring', 'Dolor sed accusamus', '238', 'Emerson Pennington', 'Emerson Pennington-TY', 'Kimberly Murphy', 184, '2023-11-21 05:07:05', '2023-11-21 05:07:05'),
(130, 1, 'Ryan Mcdaniel', 'Incidunt a voluptat', '361', 'Doris Fulton', 'Doris Fulton-TY', 'Liberty Little', 627, '2023-11-21 05:07:05', '2023-11-21 05:07:05'),
(131, 1, 'Uriel Mcknight', 'Tempore voluptatum', '724', 'Dora Hines', 'Dora Hines-TY', 'Zenia Solis', 326, '2023-11-21 05:07:05', '2023-11-21 05:07:05'),
(132, 1, 'Griffith Wood', 'Ut doloremque est vi', '397', 'Colleen Maddox', 'Colleen Maddox-TY', 'Seth Dodson', 138, '2023-11-21 05:07:05', '2023-11-21 05:07:05'),
(133, 1, 'Abdul Glover', 'Aperiam vel quam aut', '149', 'Rylee Durham', 'Rylee Durham-TY', 'Judah Moreno', 28, '2023-11-21 05:07:05', '2023-11-21 05:07:05'),
(134, 1, 'Colette Flores', 'Consequuntur quis et', '384', 'Noelani Rivas', 'Noelani Rivas-TY', 'Adrienne Fleming', 958, '2023-11-21 05:07:05', '2023-11-21 05:07:05'),
(135, 1, 'Hilary Anderson', 'Et accusantium asper', '529', 'Ryan Nunez', 'Ryan Nunez-TY', 'Macaulay Miller', 773, '2023-11-21 05:07:05', '2023-11-21 05:07:05'),
(136, 1, 'Neil Bryant', 'Quia nostrum animi', '179', 'Kyra Garner', 'Kyra Garner-TY', 'Dacey Lloyd', 320, '2023-11-21 05:07:05', '2023-11-21 05:07:05'),
(137, 1, 'Walker Stephenson', 'Libero quia quis dol', '447', 'Yael Ochoa', 'Yael Ochoa-TY', 'Travis Vargas', 505, '2023-11-21 05:07:05', '2023-11-21 05:07:05'),
(138, 1, 'Alyssa Best', 'Sunt delectus non d', '282', 'Quincy Winters', 'Quincy Winters-TY', 'Pearl Rosa', 975, '2023-11-21 05:07:05', '2023-11-21 05:07:05'),
(139, 1, 'Marny Cooper', 'Qui commodo magna di', '923', 'Indira Buckner', 'Indira Buckner-TY', 'Ima Ochoa', 557, '2023-11-21 05:07:05', '2023-11-21 05:07:05'),
(140, 1, 'Carl Zimmerman', 'Aspernatur ea nostru', '360', 'Ahmed Estrada', 'Ahmed Estrada-TY', 'Kim Sloan', 392, '2023-11-21 05:07:06', '2023-11-21 05:07:06'),
(141, 1, 'Vielka Hull', 'Quidem neque illo qu', '108', 'Deborah Cooper', 'Deborah Cooper-TY', 'Rogan Mejia', 909, '2023-11-21 05:07:06', '2023-11-21 05:07:06'),
(142, 1, 'Ferris Rose', 'Praesentium eaque si', '412', 'Kylee Greene', 'Kylee Greene-TY', 'Kaye Rose', 597, '2023-11-21 05:07:06', '2023-11-21 05:07:06'),
(143, 1, 'Edan Finch', 'Quia quia nostrud id', '859', 'Arden Rhodes', 'Arden Rhodes-TY', 'Yasir Graves', 968, '2023-11-21 05:07:06', '2023-11-21 05:07:06'),
(144, 1, 'Heather Cole', 'Dolore labore enim s', '767', 'Ralph Cantrell', 'Ralph Cantrell-TY', 'Griffin Bridges', 592, '2023-11-21 05:07:06', '2023-11-21 05:07:06'),
(145, 7, 'Rama Gibson', 'Exercitationem cum n', '200', 'Alma Carson', 'Alma Carson-TY', 'Kasper Glenn', 823, '2023-11-21 05:16:43', '2023-11-21 05:16:43'),
(146, 7, 'Hiram Grimes', 'Cumque ea excepturi', '893', 'Zia Blackburn', 'Zia Blackburn-TY', 'Rebekah Jacobs', 311, '2023-11-21 05:16:43', '2023-11-21 05:16:43'),
(147, 7, 'Breanna Johns', 'Voluptatibus minim r', '706', 'Amber Miles', 'Amber Miles-TY', 'Eleanor Baker', 283, '2023-11-21 05:16:43', '2023-11-21 05:16:43'),
(148, 7, 'Carolyn Padilla', 'Esse adipisicing fa', '617', 'Shannon Rosa', 'Shannon Rosa-TY', 'Jenna Mann', 649, '2023-11-21 05:16:43', '2023-11-21 05:16:43'),
(149, 8, 'Kaseem Rasmussen', 'Excepturi illum fug', '388', 'Hermione Green', 'Hermione Green-TY', 'Yasir Hines', 991, '2023-11-21 05:18:48', '2023-11-21 05:18:48'),
(150, 2, 'Irene Rush', 'Voluptatibus est neq', '287', 'Halee Gomez', 'Halee Gomez-TY', 'Adria Morris', 642, '2023-11-21 05:25:54', '2023-11-21 05:25:54'),
(151, 4, 'Kylynn Morin', 'Velit irure dolorem', '969', 'Beck Pennington', 'Beck Pennington-TY', 'Rosalyn Hogan', 322, '2023-11-21 05:28:40', '2023-11-21 05:28:40'),
(152, 2, 'Adrienne Morgan', 'Facere dolore dolori', '863', 'Callie Nash', 'Callie Nash-TY', 'Celeste Carney', 288, '2023-11-21 05:28:52', '2023-11-21 05:28:52'),
(153, 2, 'Gay Baxter', 'Commodo aliquam aut', '506', 'Keefe Huber', 'Keefe Huber-TY', 'Keith Woods', 785, '2023-11-21 05:28:52', '2023-11-21 05:28:52'),
(154, 2, 'Brent Harding', 'Ea eos deserunt a vo', '533', 'Ross Blackwell', 'Ross Blackwell-TY', 'Hedda Maynard', 608, '2023-12-12 05:17:58', '2023-12-12 05:17:58'),
(155, 2, 'Wendy Gilbert', 'Hic animi nisi quia', '527', 'Armand Hewitt', 'Armand Hewitt-TY', 'Abra Wheeler', 640, '2023-12-12 05:17:58', '2023-12-12 05:17:58'),
(156, 2, 'Ashton Rogers', 'Est quae expedita co', '311', 'Nita Buck', 'Nita Buck-TY', 'Ashton Whitney', 621, '2023-12-12 05:17:58', '2023-12-12 05:17:58'),
(157, 2, 'Nita Mullins', 'Molestiae veniam id', '433', 'September Langley', 'September Langley-TY', 'Sigourney Jenkins', 17, '2023-12-12 05:17:58', '2023-12-12 05:17:58'),
(158, 2, 'Cleo Lott', 'In do vitae ut et om', '195', 'Alexandra Hubbard', 'Alexandra Hubbard-TY', 'Gavin Anthony', 301, '2023-12-12 05:17:58', '2023-12-12 05:17:58'),
(159, 2, 'Lillian Hart', 'Ut ea eum irure qui', '682', 'Hoyt Bray', 'Hoyt Bray-TY', 'Velma Freeman', 534, '2023-12-12 05:17:58', '2023-12-12 05:17:58'),
(160, 2, 'Uma Bonner', 'Proident aliquid re', '939', 'Amelia Guerra', 'Amelia Guerra-TY', 'Randall David', 870, '2023-12-12 05:17:58', '2023-12-12 05:17:58'),
(161, 2, 'Joan Lang', 'Qui eiusmod iste lab', '516', 'Adrian Crawford', 'Adrian Crawford-TY', 'Yasir Dotson', 230, '2023-12-12 05:17:58', '2023-12-12 05:17:58'),
(162, 2, 'Aphrodite Cantrell', 'Architecto molestias', '441', 'Lynn Rose', 'Lynn Rose-TY', 'Giacomo Ayala', 62, '2023-12-12 05:17:58', '2023-12-12 05:17:58'),
(163, 2, 'Carl Jimenez', 'Enim qui necessitati', '190', 'Derek Adkins', 'Derek Adkins-TY', 'Lani Pittman', 74, '2023-12-12 05:17:58', '2023-12-12 05:17:58');

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
CREATE TABLE IF NOT EXISTS `languages` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0: not default language, 1: default language',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `name`, `code`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 'English', 'en', 1, '2020-07-06 03:47:55', '2022-04-09 03:47:04'),
(5, 'Hindi', 'hn', 0, '2020-12-29 02:20:07', '2022-04-09 03:47:04'),
(9, 'Bangla', 'bn', 0, '2021-03-14 04:37:41', '2022-03-30 12:31:55');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2020_06_14_061757_create_support_tickets_table', 3),
(5, '2020_06_14_061837_create_support_messages_table', 3),
(6, '2020_06_14_061904_create_support_attachments_table', 3),
(7, '2020_06_14_062359_create_admins_table', 3),
(8, '2020_06_14_064604_create_transactions_table', 4),
(9, '2020_06_14_065247_create_general_settings_table', 5),
(12, '2014_10_12_100000_create_password_resets_table', 6),
(13, '2020_06_14_060541_create_user_logins_table', 6),
(14, '2020_06_14_071708_create_admin_password_resets_table', 7),
(15, '2020_09_14_053026_create_countries_table', 8),
(16, '2021_03_15_084721_create_admin_notifications_table', 9),
(17, '2016_06_01_000001_create_oauth_auth_codes_table', 10),
(18, '2016_06_01_000002_create_oauth_access_tokens_table', 10),
(19, '2016_06_01_000003_create_oauth_refresh_tokens_table', 10),
(20, '2016_06_01_000004_create_oauth_clients_table', 10),
(21, '2016_06_01_000005_create_oauth_personal_access_clients_table', 10),
(22, '2021_05_08_103925_create_sms_gateways_table', 11),
(23, '2019_12_14_000001_create_personal_access_tokens_table', 12),
(24, '2021_05_23_111859_create_email_logs_table', 13),
(25, '2022_02_26_061836_create_forms_table', 14),
(26, '2014_10_12_100000_create_password_reset_tokens_table', 15),
(27, '2023_05_22_143523_create_general_sittings_table', 16),
(29, '2023_09_03_162806_create_reviews_table', 18),
(30, '2023_09_19_124628_create_customers_table', 19),
(31, '2023_09_19_175337_create_customer_sites_table', 20),
(33, '2023_09_29_081017_create_vendor_care_lists_table', 21),
(34, '2023_10_01_011423_create_technicians_table', 21),
(35, '2023_09_03_112047_create_technician_skills_table', 22),
(36, '2023_10_08_035335_create_work_orders_table', 23),
(37, '2023_10_23_005228_create_customer_invoices_table', 24),
(38, '2023_10_24_001628_create_work_order_performeds_table', 25),
(41, '2023_11_11_233223_create_inventories_table', 26),
(42, '0000_00_00_000000_create_websockets_statistics_entries_table', 27),
(43, '2023_12_17_123433_create_ticket_notes_table', 27),
(44, '2023_12_24_112318_create_sub_tickets_table', 28);

-- --------------------------------------------------------

--
-- Table structure for table `notification_logs`
--

DROP TABLE IF EXISTS `notification_logs`;
CREATE TABLE IF NOT EXISTS `notification_logs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int UNSIGNED NOT NULL DEFAULT '0',
  `sender` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sent_from` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sent_to` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci,
  `notification_type` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notification_logs`
--

INSERT INTO `notification_logs` (`id`, `user_id`, `sender`, `sent_from`, `sent_to`, `subject`, `message`, `notification_type`, `created_at`, `updated_at`) VALUES
(1, 30, 'php', 'info@viserlab.com', 'fevu@amimail.com', 'test', '<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\r\n  <!--[if !mso]><!-->\r\n  <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n  <!--<![endif]-->\r\n  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n  <title></title>\r\n  <style type=\"text/css\">\r\n.ReadMsgBody { width: 100%; background-color: #ffffff; }\r\n.ExternalClass { width: 100%; background-color: #ffffff; }\r\n.ExternalClass, .ExternalClass p, .ExternalClass span, .ExternalClass font, .ExternalClass td, .ExternalClass div { line-height: 100%; }\r\nhtml { width: 100%; }\r\nbody { -webkit-text-size-adjust: none; -ms-text-size-adjust: none; margin: 0; padding: 0; }\r\ntable { border-spacing: 0; table-layout: fixed; margin: 0 auto;border-collapse: collapse; }\r\ntable table table { table-layout: auto; }\r\n.yshortcuts a { border-bottom: none !important; }\r\nimg:hover { opacity: 0.9 !important; }\r\na { color: #0087ff; text-decoration: none; }\r\n.textbutton a { font-family: \'open sans\', arial, sans-serif !important;}\r\n.btn-link a { color:#FFFFFF !important;}\r\n\r\n@media only screen and (max-width: 480px) {\r\nbody { width: auto !important; }\r\n*[class=\"table-inner\"] { width: 90% !important; text-align: center !important; }\r\n*[class=\"table-full\"] { width: 100% !important; text-align: center !important; }\r\n/* image */\r\nimg[class=\"img1\"] { width: 100% !important; height: auto !important; }\r\n}\r\n</style>\r\n\r\n\r\n\r\n  <table bgcolor=\"#414a51\" width=\"100%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n    <tbody><tr>\r\n      <td height=\"50\"></td>\r\n    </tr>\r\n    <tr>\r\n      <td align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n        <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n          <tbody><tr>\r\n            <td align=\"center\" width=\"600\">\r\n              <!--header-->\r\n              <table class=\"table-inner\" width=\"95%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                <tbody><tr>\r\n                  <td bgcolor=\"#0087ff\" style=\"border-top-left-radius:6px; border-top-right-radius:6px;text-align:center;vertical-align:top;font-size:0;\" align=\"center\">\r\n                    <table width=\"90%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td align=\"center\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#FFFFFF; font-size:16px; font-weight: bold;\">This is a System Generated Email</td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n              </tbody></table>\r\n              <!--end header-->\r\n              <table class=\"table-inner\" width=\"95%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                <tbody><tr>\r\n                  <td bgcolor=\"#FFFFFF\" align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n                    <table align=\"center\" width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"35\"></td>\r\n                      </tr>\r\n                      <!--logo-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"vertical-align:top;font-size:0;\">\r\n                          <a href=\"#\">\r\n                            <img style=\"display:block; line-height:0px; font-size:0px; border:0px;\" src=\"https://i.imgur.com/Z1qtvtV.png\" alt=\"img\">\r\n                          </a>\r\n                        </td>\r\n                      </tr>\r\n                      <!--end logo-->\r\n                      <tr>\r\n                        <td height=\"40\"></td>\r\n                      </tr>\r\n                      <!--headline-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"font-family: \'Open Sans\', Arial, sans-serif; font-size: 22px;color:#414a51;font-weight: bold;\">Hello Herrod Parrish (kyvyqujyj)</td>\r\n                      </tr>\r\n                      <!--end headline-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n                          <table width=\"40\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                            <tbody><tr>\r\n                              <td height=\"20\" style=\" border-bottom:3px solid #0087ff;\"></td>\r\n                            </tr>\r\n                          </tbody></table>\r\n                        </td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                      <!--content-->\r\n                      <tr>\r\n                        <td align=\"left\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#7f8c8d; font-size:16px; line-height: 28px;\">test</td>\r\n                      </tr>\r\n                      <!--end content-->\r\n                      <tr>\r\n                        <td height=\"40\"></td>\r\n                      </tr>\r\n              \r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n                <tr>\r\n                  <td height=\"45\" align=\"center\" bgcolor=\"#f4f4f4\" style=\"border-bottom-left-radius:6px;border-bottom-right-radius:6px;\">\r\n                    <table align=\"center\" width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"10\"></td>\r\n                      </tr>\r\n                      <!--preference-->\r\n                      <tr>\r\n                        <td class=\"preference-link\" align=\"center\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#95a5a6; font-size:14px;\">\r\n                          © 2021 <a href=\"#\">Laramin</a>&nbsp;. All Rights Reserved. \r\n                        </td>\r\n                      </tr>\r\n                      <!--end preference-->\r\n                      <tr>\r\n                        <td height=\"10\"></td>\r\n                      </tr>\r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n              </tbody></table>\r\n            </td>\r\n          </tr>\r\n        </tbody></table>\r\n      </td>\r\n    </tr>\r\n    <tr>\r\n      <td height=\"60\"></td>\r\n    </tr>\r\n  </tbody></table>', 'email', '2023-01-18 03:59:32', '2023-01-18 03:59:32'),
(2, 8, 'php', 'info@viserlab.com', 'user@site.com', 'Deposit Completed Successfully', '<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\r\n  <!--[if !mso]><!-->\r\n  <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n  <!--<![endif]-->\r\n  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n  <title></title>\r\n  <style type=\"text/css\">\r\n.ReadMsgBody { width: 100%; background-color: #ffffff; }\r\n.ExternalClass { width: 100%; background-color: #ffffff; }\r\n.ExternalClass, .ExternalClass p, .ExternalClass span, .ExternalClass font, .ExternalClass td, .ExternalClass div { line-height: 100%; }\r\nhtml { width: 100%; }\r\nbody { -webkit-text-size-adjust: none; -ms-text-size-adjust: none; margin: 0; padding: 0; }\r\ntable { border-spacing: 0; table-layout: fixed; margin: 0 auto;border-collapse: collapse; }\r\ntable table table { table-layout: auto; }\r\n.yshortcuts a { border-bottom: none !important; }\r\nimg:hover { opacity: 0.9 !important; }\r\na { color: #0087ff; text-decoration: none; }\r\n.textbutton a { font-family: \'open sans\', arial, sans-serif !important;}\r\n.btn-link a { color:#FFFFFF !important;}\r\n\r\n@media only screen and (max-width: 480px) {\r\nbody { width: auto !important; }\r\n*[class=\"table-inner\"] { width: 90% !important; text-align: center !important; }\r\n*[class=\"table-full\"] { width: 100% !important; text-align: center !important; }\r\n/* image */\r\nimg[class=\"img1\"] { width: 100% !important; height: auto !important; }\r\n}\r\n</style>\r\n\r\n\r\n\r\n  <table bgcolor=\"#414a51\" width=\"100%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n    <tbody><tr>\r\n      <td height=\"50\"></td>\r\n    </tr>\r\n    <tr>\r\n      <td align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n        <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n          <tbody><tr>\r\n            <td align=\"center\" width=\"600\">\r\n              <!--header-->\r\n              <table class=\"table-inner\" width=\"95%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                <tbody><tr>\r\n                  <td bgcolor=\"#0087ff\" style=\"border-top-left-radius:6px; border-top-right-radius:6px;text-align:center;vertical-align:top;font-size:0;\" align=\"center\">\r\n                    <table width=\"90%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td align=\"center\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#FFFFFF; font-size:16px; font-weight: bold;\">This is a System Generated Email</td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n              </tbody></table>\r\n              <!--end header-->\r\n              <table class=\"table-inner\" width=\"95%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                <tbody><tr>\r\n                  <td bgcolor=\"#FFFFFF\" align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n                    <table align=\"center\" width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"35\"></td>\r\n                      </tr>\r\n                      <!--logo-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"vertical-align:top;font-size:0;\">\r\n                          <a href=\"#\">\r\n                            <img style=\"display:block; line-height:0px; font-size:0px; border:0px;\" src=\"https://i.imgur.com/Z1qtvtV.png\" alt=\"img\">\r\n                          </a>\r\n                        </td>\r\n                      </tr>\r\n                      <!--end logo-->\r\n                      <tr>\r\n                        <td height=\"40\"></td>\r\n                      </tr>\r\n                      <!--headline-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"font-family: \'Open Sans\', Arial, sans-serif; font-size: 22px;color:#414a51;font-weight: bold;\">Hello User Name (username)</td>\r\n                      </tr>\r\n                      <!--end headline-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n                          <table width=\"40\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                            <tbody><tr>\r\n                              <td height=\"20\" style=\" border-bottom:3px solid #0087ff;\"></td>\r\n                            </tr>\r\n                          </tbody></table>\r\n                        </td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                      <!--content-->\r\n                      <tr>\r\n                        <td align=\"left\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#7f8c8d; font-size:16px; line-height: 28px;\"><div>Your deposit of&nbsp;<span style=\"font-weight: bolder;\">100.00 USD</span>&nbsp;is via&nbsp;&nbsp;<span style=\"font-weight: bolder;\">Mollie - USD&nbsp;</span>has been completed Successfully.<span style=\"font-weight: bolder;\"><br></span></div><div><span style=\"font-weight: bolder;\"><br></span></div><div><span style=\"font-weight: bolder;\">Details of your Deposit :<br></span></div><div><br></div><div>Amount : 100.00 USD</div><div>Charge:&nbsp;<font color=\"#000000\">2.00 USD</font></div><div><br></div><div>Conversion Rate : 1 USD = 1.00 USD</div><div>Received : 102.00 USD<br></div><div>Paid via :&nbsp; Mollie - USD</div><div><br></div><div>Transaction Number : 7A27BS2YJXEW</div><div><font size=\"5\"><span style=\"font-weight: bolder;\"><br></span></font></div><div><font size=\"5\">Your current Balance is&nbsp;<span style=\"font-weight: bolder;\">15,277.56 USD</span></font></div><div><br style=\"font-family: Montserrat, sans-serif;\"></div></td>\r\n                      </tr>\r\n                      <!--end content-->\r\n                      <tr>\r\n                        <td height=\"40\"></td>\r\n                      </tr>\r\n              \r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n                <tr>\r\n                  <td height=\"45\" align=\"center\" bgcolor=\"#f4f4f4\" style=\"border-bottom-left-radius:6px;border-bottom-right-radius:6px;\">\r\n                    <table align=\"center\" width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"10\"></td>\r\n                      </tr>\r\n                      <!--preference-->\r\n                      <tr>\r\n                        <td class=\"preference-link\" align=\"center\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#95a5a6; font-size:14px;\">\r\n                          © 2021 <a href=\"#\">Laramin</a>&nbsp;. All Rights Reserved. \r\n                        </td>\r\n                      </tr>\r\n                      <!--end preference-->\r\n                      <tr>\r\n                        <td height=\"10\"></td>\r\n                      </tr>\r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n              </tbody></table>\r\n            </td>\r\n          </tr>\r\n        </tbody></table>\r\n      </td>\r\n    </tr>\r\n    <tr>\r\n      <td height=\"60\"></td>\r\n    </tr>\r\n  </tbody></table>', 'email', '2023-02-13 07:57:30', '2023-02-13 07:57:30'),
(3, 8, 'php', 'info@techyeah', 'user@site.com', 'fgh', '<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\r\n  <!--[if !mso]><!-->\r\n  <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n  <!--<![endif]-->\r\n  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n  <title></title>\r\n  <style type=\"text/css\">\r\n.ReadMsgBody { width: 100%; background-color: #ffffff; }\r\n.ExternalClass { width: 100%; background-color: #ffffff; }\r\n.ExternalClass, .ExternalClass p, .ExternalClass span, .ExternalClass font, .ExternalClass td, .ExternalClass div { line-height: 100%; }\r\nhtml { width: 100%; }\r\nbody { -webkit-text-size-adjust: none; -ms-text-size-adjust: none; margin: 0; padding: 0; }\r\ntable { border-spacing: 0; table-layout: fixed; margin: 0 auto;border-collapse: collapse; }\r\ntable table table { table-layout: auto; }\r\n.yshortcuts a { border-bottom: none !important; }\r\nimg:hover { opacity: 0.9 !important; }\r\na { color: #0087ff; text-decoration: none; }\r\n.textbutton a { font-family: \'open sans\', arial, sans-serif !important;}\r\n.btn-link a { color:#FFFFFF !important;}\r\n\r\n@media only screen and (max-width: 480px) {\r\nbody { width: auto !important; }\r\n*[class=\"table-inner\"] { width: 90% !important; text-align: center !important; }\r\n*[class=\"table-full\"] { width: 100% !important; text-align: center !important; }\r\n/* image */\r\nimg[class=\"img1\"] { width: 100% !important; height: auto !important; }\r\n}\r\n</style>\r\n\r\n\r\n\r\n  <table bgcolor=\"#414a51\" width=\"100%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n    <tbody><tr>\r\n      <td height=\"50\"></td>\r\n    </tr>\r\n    <tr>\r\n      <td align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n        <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n          <tbody><tr>\r\n            <td align=\"center\" width=\"600\">\r\n              <!--header-->\r\n              <table class=\"table-inner\" width=\"95%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                <tbody><tr>\r\n                  <td bgcolor=\"#0087ff\" style=\"border-top-left-radius:6px; border-top-right-radius:6px;text-align:center;vertical-align:top;font-size:0;\" align=\"center\">\r\n                    <table width=\"90%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td align=\"center\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#FFFFFF; font-size:16px; font-weight: bold;\">This is a System Generated Email</td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n              </tbody></table>\r\n              <!--end header-->\r\n              <table class=\"table-inner\" width=\"95%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                <tbody><tr>\r\n                  <td bgcolor=\"#FFFFFF\" align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n                    <table align=\"center\" width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"35\"></td>\r\n                      </tr>\r\n                      <!--logo-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"vertical-align:top;font-size:0;\">\r\n                          <a href=\"#\">\r\n                            <img style=\"display:block; line-height:0px; font-size:0px; border:0px;\" src=\"https://i.imgur.com/Z1qtvtV.png\" alt=\"img\">\r\n                          </a>\r\n                        </td>\r\n                      </tr>\r\n                      <!--end logo-->\r\n                      <tr>\r\n                        <td height=\"40\"></td>\r\n                      </tr>\r\n                      <!--headline-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"font-family: \'Open Sans\', Arial, sans-serif; font-size: 22px;color:#414a51;font-weight: bold;\">Hello User Name (username)</td>\r\n                      </tr>\r\n                      <!--end headline-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n                          <table width=\"40\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                            <tbody><tr>\r\n                              <td height=\"20\" style=\" border-bottom:3px solid #0087ff;\"></td>\r\n                            </tr>\r\n                          </tbody></table>\r\n                        </td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                      <!--content-->\r\n                      <tr>\r\n                        <td align=\"left\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#7f8c8d; font-size:16px; line-height: 28px;\">ffghf</td>\r\n                      </tr>\r\n                      <!--end content-->\r\n                      <tr>\r\n                        <td height=\"40\"></td>\r\n                      </tr>\r\n              \r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n                <tr>\r\n                  <td height=\"45\" align=\"center\" bgcolor=\"#f4f4f4\" style=\"border-bottom-left-radius:6px;border-bottom-right-radius:6px;\">\r\n                    <table align=\"center\" width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"10\"></td>\r\n                      </tr>\r\n                      <!--preference-->\r\n                      <tr>\r\n                        <td class=\"preference-link\" align=\"center\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#95a5a6; font-size:14px;\">\r\n                          © 2021 <a href=\"#\">Techyeah</a>&nbsp;. All Rights Reserved. \r\n                        </td>\r\n                      </tr>\r\n                      <!--end preference-->\r\n                      <tr>\r\n                        <td height=\"10\"></td>\r\n                      </tr>\r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n              </tbody></table>\r\n            </td>\r\n          </tr>\r\n        </tbody></table>\r\n      </td>\r\n    </tr>\r\n    <tr>\r\n      <td height=\"60\"></td>\r\n    </tr>\r\n  </tbody></table>', 'email', '2023-10-21 18:14:14', '2023-10-21 18:14:14'),
(4, 9, 'php', 'info@techyeah', 'user2@site.com', 'fgh', '<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\r\n  <!--[if !mso]><!-->\r\n  <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n  <!--<![endif]-->\r\n  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n  <title></title>\r\n  <style type=\"text/css\">\r\n.ReadMsgBody { width: 100%; background-color: #ffffff; }\r\n.ExternalClass { width: 100%; background-color: #ffffff; }\r\n.ExternalClass, .ExternalClass p, .ExternalClass span, .ExternalClass font, .ExternalClass td, .ExternalClass div { line-height: 100%; }\r\nhtml { width: 100%; }\r\nbody { -webkit-text-size-adjust: none; -ms-text-size-adjust: none; margin: 0; padding: 0; }\r\ntable { border-spacing: 0; table-layout: fixed; margin: 0 auto;border-collapse: collapse; }\r\ntable table table { table-layout: auto; }\r\n.yshortcuts a { border-bottom: none !important; }\r\nimg:hover { opacity: 0.9 !important; }\r\na { color: #0087ff; text-decoration: none; }\r\n.textbutton a { font-family: \'open sans\', arial, sans-serif !important;}\r\n.btn-link a { color:#FFFFFF !important;}\r\n\r\n@media only screen and (max-width: 480px) {\r\nbody { width: auto !important; }\r\n*[class=\"table-inner\"] { width: 90% !important; text-align: center !important; }\r\n*[class=\"table-full\"] { width: 100% !important; text-align: center !important; }\r\n/* image */\r\nimg[class=\"img1\"] { width: 100% !important; height: auto !important; }\r\n}\r\n</style>\r\n\r\n\r\n\r\n  <table bgcolor=\"#414a51\" width=\"100%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n    <tbody><tr>\r\n      <td height=\"50\"></td>\r\n    </tr>\r\n    <tr>\r\n      <td align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n        <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n          <tbody><tr>\r\n            <td align=\"center\" width=\"600\">\r\n              <!--header-->\r\n              <table class=\"table-inner\" width=\"95%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                <tbody><tr>\r\n                  <td bgcolor=\"#0087ff\" style=\"border-top-left-radius:6px; border-top-right-radius:6px;text-align:center;vertical-align:top;font-size:0;\" align=\"center\">\r\n                    <table width=\"90%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td align=\"center\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#FFFFFF; font-size:16px; font-weight: bold;\">This is a System Generated Email</td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n              </tbody></table>\r\n              <!--end header-->\r\n              <table class=\"table-inner\" width=\"95%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                <tbody><tr>\r\n                  <td bgcolor=\"#FFFFFF\" align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n                    <table align=\"center\" width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"35\"></td>\r\n                      </tr>\r\n                      <!--logo-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"vertical-align:top;font-size:0;\">\r\n                          <a href=\"#\">\r\n                            <img style=\"display:block; line-height:0px; font-size:0px; border:0px;\" src=\"https://i.imgur.com/Z1qtvtV.png\" alt=\"img\">\r\n                          </a>\r\n                        </td>\r\n                      </tr>\r\n                      <!--end logo-->\r\n                      <tr>\r\n                        <td height=\"40\"></td>\r\n                      </tr>\r\n                      <!--headline-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"font-family: \'Open Sans\', Arial, sans-serif; font-size: 22px;color:#414a51;font-weight: bold;\">Hello User Name (username2)</td>\r\n                      </tr>\r\n                      <!--end headline-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n                          <table width=\"40\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                            <tbody><tr>\r\n                              <td height=\"20\" style=\" border-bottom:3px solid #0087ff;\"></td>\r\n                            </tr>\r\n                          </tbody></table>\r\n                        </td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                      <!--content-->\r\n                      <tr>\r\n                        <td align=\"left\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#7f8c8d; font-size:16px; line-height: 28px;\">ffghf</td>\r\n                      </tr>\r\n                      <!--end content-->\r\n                      <tr>\r\n                        <td height=\"40\"></td>\r\n                      </tr>\r\n              \r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n                <tr>\r\n                  <td height=\"45\" align=\"center\" bgcolor=\"#f4f4f4\" style=\"border-bottom-left-radius:6px;border-bottom-right-radius:6px;\">\r\n                    <table align=\"center\" width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"10\"></td>\r\n                      </tr>\r\n                      <!--preference-->\r\n                      <tr>\r\n                        <td class=\"preference-link\" align=\"center\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#95a5a6; font-size:14px;\">\r\n                          © 2021 <a href=\"#\">Techyeah</a>&nbsp;. All Rights Reserved. \r\n                        </td>\r\n                      </tr>\r\n                      <!--end preference-->\r\n                      <tr>\r\n                        <td height=\"10\"></td>\r\n                      </tr>\r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n              </tbody></table>\r\n            </td>\r\n          </tr>\r\n        </tbody></table>\r\n      </td>\r\n    </tr>\r\n    <tr>\r\n      <td height=\"60\"></td>\r\n    </tr>\r\n  </tbody></table>', 'email', '2023-10-21 18:14:18', '2023-10-21 18:14:18'),
(5, 11, 'php', 'info@techyeah', 'user457@site.com', 'fgh', '<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\r\n  <!--[if !mso]><!-->\r\n  <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n  <!--<![endif]-->\r\n  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n  <title></title>\r\n  <style type=\"text/css\">\r\n.ReadMsgBody { width: 100%; background-color: #ffffff; }\r\n.ExternalClass { width: 100%; background-color: #ffffff; }\r\n.ExternalClass, .ExternalClass p, .ExternalClass span, .ExternalClass font, .ExternalClass td, .ExternalClass div { line-height: 100%; }\r\nhtml { width: 100%; }\r\nbody { -webkit-text-size-adjust: none; -ms-text-size-adjust: none; margin: 0; padding: 0; }\r\ntable { border-spacing: 0; table-layout: fixed; margin: 0 auto;border-collapse: collapse; }\r\ntable table table { table-layout: auto; }\r\n.yshortcuts a { border-bottom: none !important; }\r\nimg:hover { opacity: 0.9 !important; }\r\na { color: #0087ff; text-decoration: none; }\r\n.textbutton a { font-family: \'open sans\', arial, sans-serif !important;}\r\n.btn-link a { color:#FFFFFF !important;}\r\n\r\n@media only screen and (max-width: 480px) {\r\nbody { width: auto !important; }\r\n*[class=\"table-inner\"] { width: 90% !important; text-align: center !important; }\r\n*[class=\"table-full\"] { width: 100% !important; text-align: center !important; }\r\n/* image */\r\nimg[class=\"img1\"] { width: 100% !important; height: auto !important; }\r\n}\r\n</style>\r\n\r\n\r\n\r\n  <table bgcolor=\"#414a51\" width=\"100%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n    <tbody><tr>\r\n      <td height=\"50\"></td>\r\n    </tr>\r\n    <tr>\r\n      <td align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n        <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n          <tbody><tr>\r\n            <td align=\"center\" width=\"600\">\r\n              <!--header-->\r\n              <table class=\"table-inner\" width=\"95%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                <tbody><tr>\r\n                  <td bgcolor=\"#0087ff\" style=\"border-top-left-radius:6px; border-top-right-radius:6px;text-align:center;vertical-align:top;font-size:0;\" align=\"center\">\r\n                    <table width=\"90%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td align=\"center\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#FFFFFF; font-size:16px; font-weight: bold;\">This is a System Generated Email</td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n              </tbody></table>\r\n              <!--end header-->\r\n              <table class=\"table-inner\" width=\"95%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                <tbody><tr>\r\n                  <td bgcolor=\"#FFFFFF\" align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n                    <table align=\"center\" width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"35\"></td>\r\n                      </tr>\r\n                      <!--logo-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"vertical-align:top;font-size:0;\">\r\n                          <a href=\"#\">\r\n                            <img style=\"display:block; line-height:0px; font-size:0px; border:0px;\" src=\"https://i.imgur.com/Z1qtvtV.png\" alt=\"img\">\r\n                          </a>\r\n                        </td>\r\n                      </tr>\r\n                      <!--end logo-->\r\n                      <tr>\r\n                        <td height=\"40\"></td>\r\n                      </tr>\r\n                      <!--headline-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"font-family: \'Open Sans\', Arial, sans-serif; font-size: 22px;color:#414a51;font-weight: bold;\">Hello user44 name44 (username3)</td>\r\n                      </tr>\r\n                      <!--end headline-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n                          <table width=\"40\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                            <tbody><tr>\r\n                              <td height=\"20\" style=\" border-bottom:3px solid #0087ff;\"></td>\r\n                            </tr>\r\n                          </tbody></table>\r\n                        </td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                      <!--content-->\r\n                      <tr>\r\n                        <td align=\"left\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#7f8c8d; font-size:16px; line-height: 28px;\">ffghf</td>\r\n                      </tr>\r\n                      <!--end content-->\r\n                      <tr>\r\n                        <td height=\"40\"></td>\r\n                      </tr>\r\n              \r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n                <tr>\r\n                  <td height=\"45\" align=\"center\" bgcolor=\"#f4f4f4\" style=\"border-bottom-left-radius:6px;border-bottom-right-radius:6px;\">\r\n                    <table align=\"center\" width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"10\"></td>\r\n                      </tr>\r\n                      <!--preference-->\r\n                      <tr>\r\n                        <td class=\"preference-link\" align=\"center\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#95a5a6; font-size:14px;\">\r\n                          © 2021 <a href=\"#\">Techyeah</a>&nbsp;. All Rights Reserved. \r\n                        </td>\r\n                      </tr>\r\n                      <!--end preference-->\r\n                      <tr>\r\n                        <td height=\"10\"></td>\r\n                      </tr>\r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n              </tbody></table>\r\n            </td>\r\n          </tr>\r\n        </tbody></table>\r\n      </td>\r\n    </tr>\r\n    <tr>\r\n      <td height=\"60\"></td>\r\n    </tr>\r\n  </tbody></table>', 'email', '2023-10-21 18:14:21', '2023-10-21 18:14:21'),
(6, 13, 'php', 'info@techyeah', 'testuser123@gmail.com', 'fgh', '<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\r\n  <!--[if !mso]><!-->\r\n  <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n  <!--<![endif]-->\r\n  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n  <title></title>\r\n  <style type=\"text/css\">\r\n.ReadMsgBody { width: 100%; background-color: #ffffff; }\r\n.ExternalClass { width: 100%; background-color: #ffffff; }\r\n.ExternalClass, .ExternalClass p, .ExternalClass span, .ExternalClass font, .ExternalClass td, .ExternalClass div { line-height: 100%; }\r\nhtml { width: 100%; }\r\nbody { -webkit-text-size-adjust: none; -ms-text-size-adjust: none; margin: 0; padding: 0; }\r\ntable { border-spacing: 0; table-layout: fixed; margin: 0 auto;border-collapse: collapse; }\r\ntable table table { table-layout: auto; }\r\n.yshortcuts a { border-bottom: none !important; }\r\nimg:hover { opacity: 0.9 !important; }\r\na { color: #0087ff; text-decoration: none; }\r\n.textbutton a { font-family: \'open sans\', arial, sans-serif !important;}\r\n.btn-link a { color:#FFFFFF !important;}\r\n\r\n@media only screen and (max-width: 480px) {\r\nbody { width: auto !important; }\r\n*[class=\"table-inner\"] { width: 90% !important; text-align: center !important; }\r\n*[class=\"table-full\"] { width: 100% !important; text-align: center !important; }\r\n/* image */\r\nimg[class=\"img1\"] { width: 100% !important; height: auto !important; }\r\n}\r\n</style>\r\n\r\n\r\n\r\n  <table bgcolor=\"#414a51\" width=\"100%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n    <tbody><tr>\r\n      <td height=\"50\"></td>\r\n    </tr>\r\n    <tr>\r\n      <td align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n        <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n          <tbody><tr>\r\n            <td align=\"center\" width=\"600\">\r\n              <!--header-->\r\n              <table class=\"table-inner\" width=\"95%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                <tbody><tr>\r\n                  <td bgcolor=\"#0087ff\" style=\"border-top-left-radius:6px; border-top-right-radius:6px;text-align:center;vertical-align:top;font-size:0;\" align=\"center\">\r\n                    <table width=\"90%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td align=\"center\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#FFFFFF; font-size:16px; font-weight: bold;\">This is a System Generated Email</td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n              </tbody></table>\r\n              <!--end header-->\r\n              <table class=\"table-inner\" width=\"95%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                <tbody><tr>\r\n                  <td bgcolor=\"#FFFFFF\" align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n                    <table align=\"center\" width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"35\"></td>\r\n                      </tr>\r\n                      <!--logo-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"vertical-align:top;font-size:0;\">\r\n                          <a href=\"#\">\r\n                            <img style=\"display:block; line-height:0px; font-size:0px; border:0px;\" src=\"https://i.imgur.com/Z1qtvtV.png\" alt=\"img\">\r\n                          </a>\r\n                        </td>\r\n                      </tr>\r\n                      <!--end logo-->\r\n                      <tr>\r\n                        <td height=\"40\"></td>\r\n                      </tr>\r\n                      <!--headline-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"font-family: \'Open Sans\', Arial, sans-serif; font-size: 22px;color:#414a51;font-weight: bold;\">Hello KB Zaman (testuser123)</td>\r\n                      </tr>\r\n                      <!--end headline-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n                          <table width=\"40\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                            <tbody><tr>\r\n                              <td height=\"20\" style=\" border-bottom:3px solid #0087ff;\"></td>\r\n                            </tr>\r\n                          </tbody></table>\r\n                        </td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                      <!--content-->\r\n                      <tr>\r\n                        <td align=\"left\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#7f8c8d; font-size:16px; line-height: 28px;\">ffghf</td>\r\n                      </tr>\r\n                      <!--end content-->\r\n                      <tr>\r\n                        <td height=\"40\"></td>\r\n                      </tr>\r\n              \r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n                <tr>\r\n                  <td height=\"45\" align=\"center\" bgcolor=\"#f4f4f4\" style=\"border-bottom-left-radius:6px;border-bottom-right-radius:6px;\">\r\n                    <table align=\"center\" width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"10\"></td>\r\n                      </tr>\r\n                      <!--preference-->\r\n                      <tr>\r\n                        <td class=\"preference-link\" align=\"center\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#95a5a6; font-size:14px;\">\r\n                          © 2021 <a href=\"#\">Techyeah</a>&nbsp;. All Rights Reserved. \r\n                        </td>\r\n                      </tr>\r\n                      <!--end preference-->\r\n                      <tr>\r\n                        <td height=\"10\"></td>\r\n                      </tr>\r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n              </tbody></table>\r\n            </td>\r\n          </tr>\r\n        </tbody></table>\r\n      </td>\r\n    </tr>\r\n    <tr>\r\n      <td height=\"60\"></td>\r\n    </tr>\r\n  </tbody></table>', 'email', '2023-10-21 18:14:23', '2023-10-21 18:14:23');
INSERT INTO `notification_logs` (`id`, `user_id`, `sender`, `sent_from`, `sent_to`, `subject`, `message`, `notification_type`, `created_at`, `updated_at`) VALUES
(7, 19, 'php', 'info@techyeah', 'user5@site.com', 'fgh', '<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\r\n  <!--[if !mso]><!-->\r\n  <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n  <!--<![endif]-->\r\n  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n  <title></title>\r\n  <style type=\"text/css\">\r\n.ReadMsgBody { width: 100%; background-color: #ffffff; }\r\n.ExternalClass { width: 100%; background-color: #ffffff; }\r\n.ExternalClass, .ExternalClass p, .ExternalClass span, .ExternalClass font, .ExternalClass td, .ExternalClass div { line-height: 100%; }\r\nhtml { width: 100%; }\r\nbody { -webkit-text-size-adjust: none; -ms-text-size-adjust: none; margin: 0; padding: 0; }\r\ntable { border-spacing: 0; table-layout: fixed; margin: 0 auto;border-collapse: collapse; }\r\ntable table table { table-layout: auto; }\r\n.yshortcuts a { border-bottom: none !important; }\r\nimg:hover { opacity: 0.9 !important; }\r\na { color: #0087ff; text-decoration: none; }\r\n.textbutton a { font-family: \'open sans\', arial, sans-serif !important;}\r\n.btn-link a { color:#FFFFFF !important;}\r\n\r\n@media only screen and (max-width: 480px) {\r\nbody { width: auto !important; }\r\n*[class=\"table-inner\"] { width: 90% !important; text-align: center !important; }\r\n*[class=\"table-full\"] { width: 100% !important; text-align: center !important; }\r\n/* image */\r\nimg[class=\"img1\"] { width: 100% !important; height: auto !important; }\r\n}\r\n</style>\r\n\r\n\r\n\r\n  <table bgcolor=\"#414a51\" width=\"100%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n    <tbody><tr>\r\n      <td height=\"50\"></td>\r\n    </tr>\r\n    <tr>\r\n      <td align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n        <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n          <tbody><tr>\r\n            <td align=\"center\" width=\"600\">\r\n              <!--header-->\r\n              <table class=\"table-inner\" width=\"95%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                <tbody><tr>\r\n                  <td bgcolor=\"#0087ff\" style=\"border-top-left-radius:6px; border-top-right-radius:6px;text-align:center;vertical-align:top;font-size:0;\" align=\"center\">\r\n                    <table width=\"90%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td align=\"center\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#FFFFFF; font-size:16px; font-weight: bold;\">This is a System Generated Email</td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n              </tbody></table>\r\n              <!--end header-->\r\n              <table class=\"table-inner\" width=\"95%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                <tbody><tr>\r\n                  <td bgcolor=\"#FFFFFF\" align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n                    <table align=\"center\" width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"35\"></td>\r\n                      </tr>\r\n                      <!--logo-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"vertical-align:top;font-size:0;\">\r\n                          <a href=\"#\">\r\n                            <img style=\"display:block; line-height:0px; font-size:0px; border:0px;\" src=\"https://i.imgur.com/Z1qtvtV.png\" alt=\"img\">\r\n                          </a>\r\n                        </td>\r\n                      </tr>\r\n                      <!--end logo-->\r\n                      <tr>\r\n                        <td height=\"40\"></td>\r\n                      </tr>\r\n                      <!--headline-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"font-family: \'Open Sans\', Arial, sans-serif; font-size: 22px;color:#414a51;font-weight: bold;\">Hello My Name (username5)</td>\r\n                      </tr>\r\n                      <!--end headline-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n                          <table width=\"40\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                            <tbody><tr>\r\n                              <td height=\"20\" style=\" border-bottom:3px solid #0087ff;\"></td>\r\n                            </tr>\r\n                          </tbody></table>\r\n                        </td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                      <!--content-->\r\n                      <tr>\r\n                        <td align=\"left\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#7f8c8d; font-size:16px; line-height: 28px;\">ffghf</td>\r\n                      </tr>\r\n                      <!--end content-->\r\n                      <tr>\r\n                        <td height=\"40\"></td>\r\n                      </tr>\r\n              \r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n                <tr>\r\n                  <td height=\"45\" align=\"center\" bgcolor=\"#f4f4f4\" style=\"border-bottom-left-radius:6px;border-bottom-right-radius:6px;\">\r\n                    <table align=\"center\" width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"10\"></td>\r\n                      </tr>\r\n                      <!--preference-->\r\n                      <tr>\r\n                        <td class=\"preference-link\" align=\"center\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#95a5a6; font-size:14px;\">\r\n                          © 2021 <a href=\"#\">Techyeah</a>&nbsp;. All Rights Reserved. \r\n                        </td>\r\n                      </tr>\r\n                      <!--end preference-->\r\n                      <tr>\r\n                        <td height=\"10\"></td>\r\n                      </tr>\r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n              </tbody></table>\r\n            </td>\r\n          </tr>\r\n        </tbody></table>\r\n      </td>\r\n    </tr>\r\n    <tr>\r\n      <td height=\"60\"></td>\r\n    </tr>\r\n  </tbody></table>', 'email', '2023-10-21 18:14:26', '2023-10-21 18:14:26'),
(8, 20, 'php', 'info@techyeah', 'user6@site.com', 'fgh', '<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\r\n  <!--[if !mso]><!-->\r\n  <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n  <!--<![endif]-->\r\n  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n  <title></title>\r\n  <style type=\"text/css\">\r\n.ReadMsgBody { width: 100%; background-color: #ffffff; }\r\n.ExternalClass { width: 100%; background-color: #ffffff; }\r\n.ExternalClass, .ExternalClass p, .ExternalClass span, .ExternalClass font, .ExternalClass td, .ExternalClass div { line-height: 100%; }\r\nhtml { width: 100%; }\r\nbody { -webkit-text-size-adjust: none; -ms-text-size-adjust: none; margin: 0; padding: 0; }\r\ntable { border-spacing: 0; table-layout: fixed; margin: 0 auto;border-collapse: collapse; }\r\ntable table table { table-layout: auto; }\r\n.yshortcuts a { border-bottom: none !important; }\r\nimg:hover { opacity: 0.9 !important; }\r\na { color: #0087ff; text-decoration: none; }\r\n.textbutton a { font-family: \'open sans\', arial, sans-serif !important;}\r\n.btn-link a { color:#FFFFFF !important;}\r\n\r\n@media only screen and (max-width: 480px) {\r\nbody { width: auto !important; }\r\n*[class=\"table-inner\"] { width: 90% !important; text-align: center !important; }\r\n*[class=\"table-full\"] { width: 100% !important; text-align: center !important; }\r\n/* image */\r\nimg[class=\"img1\"] { width: 100% !important; height: auto !important; }\r\n}\r\n</style>\r\n\r\n\r\n\r\n  <table bgcolor=\"#414a51\" width=\"100%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n    <tbody><tr>\r\n      <td height=\"50\"></td>\r\n    </tr>\r\n    <tr>\r\n      <td align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n        <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n          <tbody><tr>\r\n            <td align=\"center\" width=\"600\">\r\n              <!--header-->\r\n              <table class=\"table-inner\" width=\"95%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                <tbody><tr>\r\n                  <td bgcolor=\"#0087ff\" style=\"border-top-left-radius:6px; border-top-right-radius:6px;text-align:center;vertical-align:top;font-size:0;\" align=\"center\">\r\n                    <table width=\"90%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td align=\"center\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#FFFFFF; font-size:16px; font-weight: bold;\">This is a System Generated Email</td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n              </tbody></table>\r\n              <!--end header-->\r\n              <table class=\"table-inner\" width=\"95%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                <tbody><tr>\r\n                  <td bgcolor=\"#FFFFFF\" align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n                    <table align=\"center\" width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"35\"></td>\r\n                      </tr>\r\n                      <!--logo-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"vertical-align:top;font-size:0;\">\r\n                          <a href=\"#\">\r\n                            <img style=\"display:block; line-height:0px; font-size:0px; border:0px;\" src=\"https://i.imgur.com/Z1qtvtV.png\" alt=\"img\">\r\n                          </a>\r\n                        </td>\r\n                      </tr>\r\n                      <!--end logo-->\r\n                      <tr>\r\n                        <td height=\"40\"></td>\r\n                      </tr>\r\n                      <!--headline-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"font-family: \'Open Sans\', Arial, sans-serif; font-size: 22px;color:#414a51;font-weight: bold;\">Hello My Name (username6)</td>\r\n                      </tr>\r\n                      <!--end headline-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n                          <table width=\"40\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                            <tbody><tr>\r\n                              <td height=\"20\" style=\" border-bottom:3px solid #0087ff;\"></td>\r\n                            </tr>\r\n                          </tbody></table>\r\n                        </td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                      <!--content-->\r\n                      <tr>\r\n                        <td align=\"left\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#7f8c8d; font-size:16px; line-height: 28px;\">ffghf</td>\r\n                      </tr>\r\n                      <!--end content-->\r\n                      <tr>\r\n                        <td height=\"40\"></td>\r\n                      </tr>\r\n              \r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n                <tr>\r\n                  <td height=\"45\" align=\"center\" bgcolor=\"#f4f4f4\" style=\"border-bottom-left-radius:6px;border-bottom-right-radius:6px;\">\r\n                    <table align=\"center\" width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"10\"></td>\r\n                      </tr>\r\n                      <!--preference-->\r\n                      <tr>\r\n                        <td class=\"preference-link\" align=\"center\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#95a5a6; font-size:14px;\">\r\n                          © 2021 <a href=\"#\">Techyeah</a>&nbsp;. All Rights Reserved. \r\n                        </td>\r\n                      </tr>\r\n                      <!--end preference-->\r\n                      <tr>\r\n                        <td height=\"10\"></td>\r\n                      </tr>\r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n              </tbody></table>\r\n            </td>\r\n          </tr>\r\n        </tbody></table>\r\n      </td>\r\n    </tr>\r\n    <tr>\r\n      <td height=\"60\"></td>\r\n    </tr>\r\n  </tbody></table>', 'email', '2023-10-21 18:14:28', '2023-10-21 18:14:28'),
(9, 24, 'php', 'info@techyeah', 'mosta@gmail.com', 'fgh', '<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\r\n  <!--[if !mso]><!-->\r\n  <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n  <!--<![endif]-->\r\n  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n  <title></title>\r\n  <style type=\"text/css\">\r\n.ReadMsgBody { width: 100%; background-color: #ffffff; }\r\n.ExternalClass { width: 100%; background-color: #ffffff; }\r\n.ExternalClass, .ExternalClass p, .ExternalClass span, .ExternalClass font, .ExternalClass td, .ExternalClass div { line-height: 100%; }\r\nhtml { width: 100%; }\r\nbody { -webkit-text-size-adjust: none; -ms-text-size-adjust: none; margin: 0; padding: 0; }\r\ntable { border-spacing: 0; table-layout: fixed; margin: 0 auto;border-collapse: collapse; }\r\ntable table table { table-layout: auto; }\r\n.yshortcuts a { border-bottom: none !important; }\r\nimg:hover { opacity: 0.9 !important; }\r\na { color: #0087ff; text-decoration: none; }\r\n.textbutton a { font-family: \'open sans\', arial, sans-serif !important;}\r\n.btn-link a { color:#FFFFFF !important;}\r\n\r\n@media only screen and (max-width: 480px) {\r\nbody { width: auto !important; }\r\n*[class=\"table-inner\"] { width: 90% !important; text-align: center !important; }\r\n*[class=\"table-full\"] { width: 100% !important; text-align: center !important; }\r\n/* image */\r\nimg[class=\"img1\"] { width: 100% !important; height: auto !important; }\r\n}\r\n</style>\r\n\r\n\r\n\r\n  <table bgcolor=\"#414a51\" width=\"100%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n    <tbody><tr>\r\n      <td height=\"50\"></td>\r\n    </tr>\r\n    <tr>\r\n      <td align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n        <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n          <tbody><tr>\r\n            <td align=\"center\" width=\"600\">\r\n              <!--header-->\r\n              <table class=\"table-inner\" width=\"95%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                <tbody><tr>\r\n                  <td bgcolor=\"#0087ff\" style=\"border-top-left-radius:6px; border-top-right-radius:6px;text-align:center;vertical-align:top;font-size:0;\" align=\"center\">\r\n                    <table width=\"90%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td align=\"center\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#FFFFFF; font-size:16px; font-weight: bold;\">This is a System Generated Email</td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n              </tbody></table>\r\n              <!--end header-->\r\n              <table class=\"table-inner\" width=\"95%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                <tbody><tr>\r\n                  <td bgcolor=\"#FFFFFF\" align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n                    <table align=\"center\" width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"35\"></td>\r\n                      </tr>\r\n                      <!--logo-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"vertical-align:top;font-size:0;\">\r\n                          <a href=\"#\">\r\n                            <img style=\"display:block; line-height:0px; font-size:0px; border:0px;\" src=\"https://i.imgur.com/Z1qtvtV.png\" alt=\"img\">\r\n                          </a>\r\n                        </td>\r\n                      </tr>\r\n                      <!--end logo-->\r\n                      <tr>\r\n                        <td height=\"40\"></td>\r\n                      </tr>\r\n                      <!--headline-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"font-family: \'Open Sans\', Arial, sans-serif; font-size: 22px;color:#414a51;font-weight: bold;\">Hello Mosta fizz (mostasproject)</td>\r\n                      </tr>\r\n                      <!--end headline-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n                          <table width=\"40\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                            <tbody><tr>\r\n                              <td height=\"20\" style=\" border-bottom:3px solid #0087ff;\"></td>\r\n                            </tr>\r\n                          </tbody></table>\r\n                        </td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                      <!--content-->\r\n                      <tr>\r\n                        <td align=\"left\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#7f8c8d; font-size:16px; line-height: 28px;\">ffghf</td>\r\n                      </tr>\r\n                      <!--end content-->\r\n                      <tr>\r\n                        <td height=\"40\"></td>\r\n                      </tr>\r\n              \r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n                <tr>\r\n                  <td height=\"45\" align=\"center\" bgcolor=\"#f4f4f4\" style=\"border-bottom-left-radius:6px;border-bottom-right-radius:6px;\">\r\n                    <table align=\"center\" width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"10\"></td>\r\n                      </tr>\r\n                      <!--preference-->\r\n                      <tr>\r\n                        <td class=\"preference-link\" align=\"center\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#95a5a6; font-size:14px;\">\r\n                          © 2021 <a href=\"#\">Techyeah</a>&nbsp;. All Rights Reserved. \r\n                        </td>\r\n                      </tr>\r\n                      <!--end preference-->\r\n                      <tr>\r\n                        <td height=\"10\"></td>\r\n                      </tr>\r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n              </tbody></table>\r\n            </td>\r\n          </tr>\r\n        </tbody></table>\r\n      </td>\r\n    </tr>\r\n    <tr>\r\n      <td height=\"60\"></td>\r\n    </tr>\r\n  </tbody></table>', 'email', '2023-10-21 18:14:30', '2023-10-21 18:14:30'),
(10, 27, 'php', 'info@techyeah', 'testuser5588@gmail.com', 'fgh', '<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\r\n  <!--[if !mso]><!-->\r\n  <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n  <!--<![endif]-->\r\n  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n  <title></title>\r\n  <style type=\"text/css\">\r\n.ReadMsgBody { width: 100%; background-color: #ffffff; }\r\n.ExternalClass { width: 100%; background-color: #ffffff; }\r\n.ExternalClass, .ExternalClass p, .ExternalClass span, .ExternalClass font, .ExternalClass td, .ExternalClass div { line-height: 100%; }\r\nhtml { width: 100%; }\r\nbody { -webkit-text-size-adjust: none; -ms-text-size-adjust: none; margin: 0; padding: 0; }\r\ntable { border-spacing: 0; table-layout: fixed; margin: 0 auto;border-collapse: collapse; }\r\ntable table table { table-layout: auto; }\r\n.yshortcuts a { border-bottom: none !important; }\r\nimg:hover { opacity: 0.9 !important; }\r\na { color: #0087ff; text-decoration: none; }\r\n.textbutton a { font-family: \'open sans\', arial, sans-serif !important;}\r\n.btn-link a { color:#FFFFFF !important;}\r\n\r\n@media only screen and (max-width: 480px) {\r\nbody { width: auto !important; }\r\n*[class=\"table-inner\"] { width: 90% !important; text-align: center !important; }\r\n*[class=\"table-full\"] { width: 100% !important; text-align: center !important; }\r\n/* image */\r\nimg[class=\"img1\"] { width: 100% !important; height: auto !important; }\r\n}\r\n</style>\r\n\r\n\r\n\r\n  <table bgcolor=\"#414a51\" width=\"100%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n    <tbody><tr>\r\n      <td height=\"50\"></td>\r\n    </tr>\r\n    <tr>\r\n      <td align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n        <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n          <tbody><tr>\r\n            <td align=\"center\" width=\"600\">\r\n              <!--header-->\r\n              <table class=\"table-inner\" width=\"95%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                <tbody><tr>\r\n                  <td bgcolor=\"#0087ff\" style=\"border-top-left-radius:6px; border-top-right-radius:6px;text-align:center;vertical-align:top;font-size:0;\" align=\"center\">\r\n                    <table width=\"90%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td align=\"center\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#FFFFFF; font-size:16px; font-weight: bold;\">This is a System Generated Email</td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n              </tbody></table>\r\n              <!--end header-->\r\n              <table class=\"table-inner\" width=\"95%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                <tbody><tr>\r\n                  <td bgcolor=\"#FFFFFF\" align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n                    <table align=\"center\" width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"35\"></td>\r\n                      </tr>\r\n                      <!--logo-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"vertical-align:top;font-size:0;\">\r\n                          <a href=\"#\">\r\n                            <img style=\"display:block; line-height:0px; font-size:0px; border:0px;\" src=\"https://i.imgur.com/Z1qtvtV.png\" alt=\"img\">\r\n                          </a>\r\n                        </td>\r\n                      </tr>\r\n                      <!--end logo-->\r\n                      <tr>\r\n                        <td height=\"40\"></td>\r\n                      </tr>\r\n                      <!--headline-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"font-family: \'Open Sans\', Arial, sans-serif; font-size: 22px;color:#414a51;font-weight: bold;\">Hello Test User (testuser5588)</td>\r\n                      </tr>\r\n                      <!--end headline-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n                          <table width=\"40\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                            <tbody><tr>\r\n                              <td height=\"20\" style=\" border-bottom:3px solid #0087ff;\"></td>\r\n                            </tr>\r\n                          </tbody></table>\r\n                        </td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                      <!--content-->\r\n                      <tr>\r\n                        <td align=\"left\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#7f8c8d; font-size:16px; line-height: 28px;\">ffghf</td>\r\n                      </tr>\r\n                      <!--end content-->\r\n                      <tr>\r\n                        <td height=\"40\"></td>\r\n                      </tr>\r\n              \r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n                <tr>\r\n                  <td height=\"45\" align=\"center\" bgcolor=\"#f4f4f4\" style=\"border-bottom-left-radius:6px;border-bottom-right-radius:6px;\">\r\n                    <table align=\"center\" width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"10\"></td>\r\n                      </tr>\r\n                      <!--preference-->\r\n                      <tr>\r\n                        <td class=\"preference-link\" align=\"center\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#95a5a6; font-size:14px;\">\r\n                          © 2021 <a href=\"#\">Techyeah</a>&nbsp;. All Rights Reserved. \r\n                        </td>\r\n                      </tr>\r\n                      <!--end preference-->\r\n                      <tr>\r\n                        <td height=\"10\"></td>\r\n                      </tr>\r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n              </tbody></table>\r\n            </td>\r\n          </tr>\r\n        </tbody></table>\r\n      </td>\r\n    </tr>\r\n    <tr>\r\n      <td height=\"60\"></td>\r\n    </tr>\r\n  </tbody></table>', 'email', '2023-10-21 18:14:33', '2023-10-21 18:14:33'),
(11, 28, 'php', 'info@techyeah', 'gasaf@amimail.com', 'fgh', '<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\r\n  <!--[if !mso]><!-->\r\n  <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n  <!--<![endif]-->\r\n  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n  <title></title>\r\n  <style type=\"text/css\">\r\n.ReadMsgBody { width: 100%; background-color: #ffffff; }\r\n.ExternalClass { width: 100%; background-color: #ffffff; }\r\n.ExternalClass, .ExternalClass p, .ExternalClass span, .ExternalClass font, .ExternalClass td, .ExternalClass div { line-height: 100%; }\r\nhtml { width: 100%; }\r\nbody { -webkit-text-size-adjust: none; -ms-text-size-adjust: none; margin: 0; padding: 0; }\r\ntable { border-spacing: 0; table-layout: fixed; margin: 0 auto;border-collapse: collapse; }\r\ntable table table { table-layout: auto; }\r\n.yshortcuts a { border-bottom: none !important; }\r\nimg:hover { opacity: 0.9 !important; }\r\na { color: #0087ff; text-decoration: none; }\r\n.textbutton a { font-family: \'open sans\', arial, sans-serif !important;}\r\n.btn-link a { color:#FFFFFF !important;}\r\n\r\n@media only screen and (max-width: 480px) {\r\nbody { width: auto !important; }\r\n*[class=\"table-inner\"] { width: 90% !important; text-align: center !important; }\r\n*[class=\"table-full\"] { width: 100% !important; text-align: center !important; }\r\n/* image */\r\nimg[class=\"img1\"] { width: 100% !important; height: auto !important; }\r\n}\r\n</style>\r\n\r\n\r\n\r\n  <table bgcolor=\"#414a51\" width=\"100%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n    <tbody><tr>\r\n      <td height=\"50\"></td>\r\n    </tr>\r\n    <tr>\r\n      <td align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n        <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n          <tbody><tr>\r\n            <td align=\"center\" width=\"600\">\r\n              <!--header-->\r\n              <table class=\"table-inner\" width=\"95%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                <tbody><tr>\r\n                  <td bgcolor=\"#0087ff\" style=\"border-top-left-radius:6px; border-top-right-radius:6px;text-align:center;vertical-align:top;font-size:0;\" align=\"center\">\r\n                    <table width=\"90%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td align=\"center\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#FFFFFF; font-size:16px; font-weight: bold;\">This is a System Generated Email</td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n              </tbody></table>\r\n              <!--end header-->\r\n              <table class=\"table-inner\" width=\"95%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                <tbody><tr>\r\n                  <td bgcolor=\"#FFFFFF\" align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n                    <table align=\"center\" width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"35\"></td>\r\n                      </tr>\r\n                      <!--logo-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"vertical-align:top;font-size:0;\">\r\n                          <a href=\"#\">\r\n                            <img style=\"display:block; line-height:0px; font-size:0px; border:0px;\" src=\"https://i.imgur.com/Z1qtvtV.png\" alt=\"img\">\r\n                          </a>\r\n                        </td>\r\n                      </tr>\r\n                      <!--end logo-->\r\n                      <tr>\r\n                        <td height=\"40\"></td>\r\n                      </tr>\r\n                      <!--headline-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"font-family: \'Open Sans\', Arial, sans-serif; font-size: 22px;color:#414a51;font-weight: bold;\">Hello Shelly Morales (fajavidi)</td>\r\n                      </tr>\r\n                      <!--end headline-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n                          <table width=\"40\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                            <tbody><tr>\r\n                              <td height=\"20\" style=\" border-bottom:3px solid #0087ff;\"></td>\r\n                            </tr>\r\n                          </tbody></table>\r\n                        </td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                      <!--content-->\r\n                      <tr>\r\n                        <td align=\"left\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#7f8c8d; font-size:16px; line-height: 28px;\">ffghf</td>\r\n                      </tr>\r\n                      <!--end content-->\r\n                      <tr>\r\n                        <td height=\"40\"></td>\r\n                      </tr>\r\n              \r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n                <tr>\r\n                  <td height=\"45\" align=\"center\" bgcolor=\"#f4f4f4\" style=\"border-bottom-left-radius:6px;border-bottom-right-radius:6px;\">\r\n                    <table align=\"center\" width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"10\"></td>\r\n                      </tr>\r\n                      <!--preference-->\r\n                      <tr>\r\n                        <td class=\"preference-link\" align=\"center\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#95a5a6; font-size:14px;\">\r\n                          © 2021 <a href=\"#\">Techyeah</a>&nbsp;. All Rights Reserved. \r\n                        </td>\r\n                      </tr>\r\n                      <!--end preference-->\r\n                      <tr>\r\n                        <td height=\"10\"></td>\r\n                      </tr>\r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n              </tbody></table>\r\n            </td>\r\n          </tr>\r\n        </tbody></table>\r\n      </td>\r\n    </tr>\r\n    <tr>\r\n      <td height=\"60\"></td>\r\n    </tr>\r\n  </tbody></table>', 'email', '2023-10-21 18:14:35', '2023-10-21 18:14:35'),
(12, 29, 'php', 'info@techyeah', 'fyjify@amimail.com', 'fgh', '<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\r\n  <!--[if !mso]><!-->\r\n  <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n  <!--<![endif]-->\r\n  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n  <title></title>\r\n  <style type=\"text/css\">\r\n.ReadMsgBody { width: 100%; background-color: #ffffff; }\r\n.ExternalClass { width: 100%; background-color: #ffffff; }\r\n.ExternalClass, .ExternalClass p, .ExternalClass span, .ExternalClass font, .ExternalClass td, .ExternalClass div { line-height: 100%; }\r\nhtml { width: 100%; }\r\nbody { -webkit-text-size-adjust: none; -ms-text-size-adjust: none; margin: 0; padding: 0; }\r\ntable { border-spacing: 0; table-layout: fixed; margin: 0 auto;border-collapse: collapse; }\r\ntable table table { table-layout: auto; }\r\n.yshortcuts a { border-bottom: none !important; }\r\nimg:hover { opacity: 0.9 !important; }\r\na { color: #0087ff; text-decoration: none; }\r\n.textbutton a { font-family: \'open sans\', arial, sans-serif !important;}\r\n.btn-link a { color:#FFFFFF !important;}\r\n\r\n@media only screen and (max-width: 480px) {\r\nbody { width: auto !important; }\r\n*[class=\"table-inner\"] { width: 90% !important; text-align: center !important; }\r\n*[class=\"table-full\"] { width: 100% !important; text-align: center !important; }\r\n/* image */\r\nimg[class=\"img1\"] { width: 100% !important; height: auto !important; }\r\n}\r\n</style>\r\n\r\n\r\n\r\n  <table bgcolor=\"#414a51\" width=\"100%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n    <tbody><tr>\r\n      <td height=\"50\"></td>\r\n    </tr>\r\n    <tr>\r\n      <td align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n        <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n          <tbody><tr>\r\n            <td align=\"center\" width=\"600\">\r\n              <!--header-->\r\n              <table class=\"table-inner\" width=\"95%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                <tbody><tr>\r\n                  <td bgcolor=\"#0087ff\" style=\"border-top-left-radius:6px; border-top-right-radius:6px;text-align:center;vertical-align:top;font-size:0;\" align=\"center\">\r\n                    <table width=\"90%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td align=\"center\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#FFFFFF; font-size:16px; font-weight: bold;\">This is a System Generated Email</td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n              </tbody></table>\r\n              <!--end header-->\r\n              <table class=\"table-inner\" width=\"95%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                <tbody><tr>\r\n                  <td bgcolor=\"#FFFFFF\" align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n                    <table align=\"center\" width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"35\"></td>\r\n                      </tr>\r\n                      <!--logo-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"vertical-align:top;font-size:0;\">\r\n                          <a href=\"#\">\r\n                            <img style=\"display:block; line-height:0px; font-size:0px; border:0px;\" src=\"https://i.imgur.com/Z1qtvtV.png\" alt=\"img\">\r\n                          </a>\r\n                        </td>\r\n                      </tr>\r\n                      <!--end logo-->\r\n                      <tr>\r\n                        <td height=\"40\"></td>\r\n                      </tr>\r\n                      <!--headline-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"font-family: \'Open Sans\', Arial, sans-serif; font-size: 22px;color:#414a51;font-weight: bold;\">Hello Hermione Walter (wykyfucywe)</td>\r\n                      </tr>\r\n                      <!--end headline-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n                          <table width=\"40\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                            <tbody><tr>\r\n                              <td height=\"20\" style=\" border-bottom:3px solid #0087ff;\"></td>\r\n                            </tr>\r\n                          </tbody></table>\r\n                        </td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                      <!--content-->\r\n                      <tr>\r\n                        <td align=\"left\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#7f8c8d; font-size:16px; line-height: 28px;\">ffghf</td>\r\n                      </tr>\r\n                      <!--end content-->\r\n                      <tr>\r\n                        <td height=\"40\"></td>\r\n                      </tr>\r\n              \r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n                <tr>\r\n                  <td height=\"45\" align=\"center\" bgcolor=\"#f4f4f4\" style=\"border-bottom-left-radius:6px;border-bottom-right-radius:6px;\">\r\n                    <table align=\"center\" width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"10\"></td>\r\n                      </tr>\r\n                      <!--preference-->\r\n                      <tr>\r\n                        <td class=\"preference-link\" align=\"center\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#95a5a6; font-size:14px;\">\r\n                          © 2021 <a href=\"#\">Techyeah</a>&nbsp;. All Rights Reserved. \r\n                        </td>\r\n                      </tr>\r\n                      <!--end preference-->\r\n                      <tr>\r\n                        <td height=\"10\"></td>\r\n                      </tr>\r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n              </tbody></table>\r\n            </td>\r\n          </tr>\r\n        </tbody></table>\r\n      </td>\r\n    </tr>\r\n    <tr>\r\n      <td height=\"60\"></td>\r\n    </tr>\r\n  </tbody></table>', 'email', '2023-10-21 18:14:37', '2023-10-21 18:14:37'),
(13, 30, 'php', 'info@techyeah', 'fevu@amimail.com', 'fgh', '<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\r\n  <!--[if !mso]><!-->\r\n  <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n  <!--<![endif]-->\r\n  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n  <title></title>\r\n  <style type=\"text/css\">\r\n.ReadMsgBody { width: 100%; background-color: #ffffff; }\r\n.ExternalClass { width: 100%; background-color: #ffffff; }\r\n.ExternalClass, .ExternalClass p, .ExternalClass span, .ExternalClass font, .ExternalClass td, .ExternalClass div { line-height: 100%; }\r\nhtml { width: 100%; }\r\nbody { -webkit-text-size-adjust: none; -ms-text-size-adjust: none; margin: 0; padding: 0; }\r\ntable { border-spacing: 0; table-layout: fixed; margin: 0 auto;border-collapse: collapse; }\r\ntable table table { table-layout: auto; }\r\n.yshortcuts a { border-bottom: none !important; }\r\nimg:hover { opacity: 0.9 !important; }\r\na { color: #0087ff; text-decoration: none; }\r\n.textbutton a { font-family: \'open sans\', arial, sans-serif !important;}\r\n.btn-link a { color:#FFFFFF !important;}\r\n\r\n@media only screen and (max-width: 480px) {\r\nbody { width: auto !important; }\r\n*[class=\"table-inner\"] { width: 90% !important; text-align: center !important; }\r\n*[class=\"table-full\"] { width: 100% !important; text-align: center !important; }\r\n/* image */\r\nimg[class=\"img1\"] { width: 100% !important; height: auto !important; }\r\n}\r\n</style>\r\n\r\n\r\n\r\n  <table bgcolor=\"#414a51\" width=\"100%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n    <tbody><tr>\r\n      <td height=\"50\"></td>\r\n    </tr>\r\n    <tr>\r\n      <td align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n        <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n          <tbody><tr>\r\n            <td align=\"center\" width=\"600\">\r\n              <!--header-->\r\n              <table class=\"table-inner\" width=\"95%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                <tbody><tr>\r\n                  <td bgcolor=\"#0087ff\" style=\"border-top-left-radius:6px; border-top-right-radius:6px;text-align:center;vertical-align:top;font-size:0;\" align=\"center\">\r\n                    <table width=\"90%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td align=\"center\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#FFFFFF; font-size:16px; font-weight: bold;\">This is a System Generated Email</td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n              </tbody></table>\r\n              <!--end header-->\r\n              <table class=\"table-inner\" width=\"95%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                <tbody><tr>\r\n                  <td bgcolor=\"#FFFFFF\" align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n                    <table align=\"center\" width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"35\"></td>\r\n                      </tr>\r\n                      <!--logo-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"vertical-align:top;font-size:0;\">\r\n                          <a href=\"#\">\r\n                            <img style=\"display:block; line-height:0px; font-size:0px; border:0px;\" src=\"https://i.imgur.com/Z1qtvtV.png\" alt=\"img\">\r\n                          </a>\r\n                        </td>\r\n                      </tr>\r\n                      <!--end logo-->\r\n                      <tr>\r\n                        <td height=\"40\"></td>\r\n                      </tr>\r\n                      <!--headline-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"font-family: \'Open Sans\', Arial, sans-serif; font-size: 22px;color:#414a51;font-weight: bold;\">Hello Herrod Parrish (kyvyqujyj)</td>\r\n                      </tr>\r\n                      <!--end headline-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n                          <table width=\"40\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                            <tbody><tr>\r\n                              <td height=\"20\" style=\" border-bottom:3px solid #0087ff;\"></td>\r\n                            </tr>\r\n                          </tbody></table>\r\n                        </td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                      <!--content-->\r\n                      <tr>\r\n                        <td align=\"left\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#7f8c8d; font-size:16px; line-height: 28px;\">ffghf</td>\r\n                      </tr>\r\n                      <!--end content-->\r\n                      <tr>\r\n                        <td height=\"40\"></td>\r\n                      </tr>\r\n              \r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n                <tr>\r\n                  <td height=\"45\" align=\"center\" bgcolor=\"#f4f4f4\" style=\"border-bottom-left-radius:6px;border-bottom-right-radius:6px;\">\r\n                    <table align=\"center\" width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"10\"></td>\r\n                      </tr>\r\n                      <!--preference-->\r\n                      <tr>\r\n                        <td class=\"preference-link\" align=\"center\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#95a5a6; font-size:14px;\">\r\n                          © 2021 <a href=\"#\">Techyeah</a>&nbsp;. All Rights Reserved. \r\n                        </td>\r\n                      </tr>\r\n                      <!--end preference-->\r\n                      <tr>\r\n                        <td height=\"10\"></td>\r\n                      </tr>\r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n              </tbody></table>\r\n            </td>\r\n          </tr>\r\n        </tbody></table>\r\n      </td>\r\n    </tr>\r\n    <tr>\r\n      <td height=\"60\"></td>\r\n    </tr>\r\n  </tbody></table>', 'email', '2023-10-21 18:14:40', '2023-10-21 18:14:40');
INSERT INTO `notification_logs` (`id`, `user_id`, `sender`, `sent_from`, `sent_to`, `subject`, `message`, `notification_type`, `created_at`, `updated_at`) VALUES
(14, 33, 'php', 'info@techyeah', 'user8790@gmail.com', 'fdg', '<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\r\n  <!--[if !mso]><!-->\r\n  <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n  <!--<![endif]-->\r\n  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n  <title></title>\r\n  <style type=\"text/css\">\r\n.ReadMsgBody { width: 100%; background-color: #ffffff; }\r\n.ExternalClass { width: 100%; background-color: #ffffff; }\r\n.ExternalClass, .ExternalClass p, .ExternalClass span, .ExternalClass font, .ExternalClass td, .ExternalClass div { line-height: 100%; }\r\nhtml { width: 100%; }\r\nbody { -webkit-text-size-adjust: none; -ms-text-size-adjust: none; margin: 0; padding: 0; }\r\ntable { border-spacing: 0; table-layout: fixed; margin: 0 auto;border-collapse: collapse; }\r\ntable table table { table-layout: auto; }\r\n.yshortcuts a { border-bottom: none !important; }\r\nimg:hover { opacity: 0.9 !important; }\r\na { color: #0087ff; text-decoration: none; }\r\n.textbutton a { font-family: \'open sans\', arial, sans-serif !important;}\r\n.btn-link a { color:#FFFFFF !important;}\r\n\r\n@media only screen and (max-width: 480px) {\r\nbody { width: auto !important; }\r\n*[class=\"table-inner\"] { width: 90% !important; text-align: center !important; }\r\n*[class=\"table-full\"] { width: 100% !important; text-align: center !important; }\r\n/* image */\r\nimg[class=\"img1\"] { width: 100% !important; height: auto !important; }\r\n}\r\n</style>\r\n\r\n\r\n\r\n  <table bgcolor=\"#414a51\" width=\"100%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n    <tbody><tr>\r\n      <td height=\"50\"></td>\r\n    </tr>\r\n    <tr>\r\n      <td align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n        <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n          <tbody><tr>\r\n            <td align=\"center\" width=\"600\">\r\n              <!--header-->\r\n              <table class=\"table-inner\" width=\"95%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                <tbody><tr>\r\n                  <td bgcolor=\"#0087ff\" style=\"border-top-left-radius:6px; border-top-right-radius:6px;text-align:center;vertical-align:top;font-size:0;\" align=\"center\">\r\n                    <table width=\"90%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td align=\"center\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#FFFFFF; font-size:16px; font-weight: bold;\">This is a System Generated Email</td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n              </tbody></table>\r\n              <!--end header-->\r\n              <table class=\"table-inner\" width=\"95%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                <tbody><tr>\r\n                  <td bgcolor=\"#FFFFFF\" align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n                    <table align=\"center\" width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"35\"></td>\r\n                      </tr>\r\n                      <!--logo-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"vertical-align:top;font-size:0;\">\r\n                          <a href=\"#\">\r\n                            <img style=\"display:block; line-height:0px; font-size:0px; border:0px;\" src=\"https://i.imgur.com/Z1qtvtV.png\" alt=\"img\">\r\n                          </a>\r\n                        </td>\r\n                      </tr>\r\n                      <!--end logo-->\r\n                      <tr>\r\n                        <td height=\"40\"></td>\r\n                      </tr>\r\n                      <!--headline-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"font-family: \'Open Sans\', Arial, sans-serif; font-size: 22px;color:#414a51;font-weight: bold;\">Hello   (username2360)</td>\r\n                      </tr>\r\n                      <!--end headline-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n                          <table width=\"40\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                            <tbody><tr>\r\n                              <td height=\"20\" style=\" border-bottom:3px solid #0087ff;\"></td>\r\n                            </tr>\r\n                          </tbody></table>\r\n                        </td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                      <!--content-->\r\n                      <tr>\r\n                        <td align=\"left\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#7f8c8d; font-size:16px; line-height: 28px;\">fdgdf</td>\r\n                      </tr>\r\n                      <!--end content-->\r\n                      <tr>\r\n                        <td height=\"40\"></td>\r\n                      </tr>\r\n              \r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n                <tr>\r\n                  <td height=\"45\" align=\"center\" bgcolor=\"#f4f4f4\" style=\"border-bottom-left-radius:6px;border-bottom-right-radius:6px;\">\r\n                    <table align=\"center\" width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"10\"></td>\r\n                      </tr>\r\n                      <!--preference-->\r\n                      <tr>\r\n                        <td class=\"preference-link\" align=\"center\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#95a5a6; font-size:14px;\">\r\n                          © 2021 <a href=\"#\">Techyeah</a>&nbsp;. All Rights Reserved. \r\n                        </td>\r\n                      </tr>\r\n                      <!--end preference-->\r\n                      <tr>\r\n                        <td height=\"10\"></td>\r\n                      </tr>\r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n              </tbody></table>\r\n            </td>\r\n          </tr>\r\n        </tbody></table>\r\n      </td>\r\n    </tr>\r\n    <tr>\r\n      <td height=\"60\"></td>\r\n    </tr>\r\n  </tbody></table>', 'email', '2023-10-21 18:15:08', '2023-10-21 18:15:08'),
(15, 34, 'php', 'info@techyeah', 'shakil@gmail.com', 'Please verify your email address', '<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\r\n  <!--[if !mso]><!-->\r\n  <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n  <!--<![endif]-->\r\n  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n  <title></title>\r\n  <style type=\"text/css\">\r\n.ReadMsgBody { width: 100%; background-color: #ffffff; }\r\n.ExternalClass { width: 100%; background-color: #ffffff; }\r\n.ExternalClass, .ExternalClass p, .ExternalClass span, .ExternalClass font, .ExternalClass td, .ExternalClass div { line-height: 100%; }\r\nhtml { width: 100%; }\r\nbody { -webkit-text-size-adjust: none; -ms-text-size-adjust: none; margin: 0; padding: 0; }\r\ntable { border-spacing: 0; table-layout: fixed; margin: 0 auto;border-collapse: collapse; }\r\ntable table table { table-layout: auto; }\r\n.yshortcuts a { border-bottom: none !important; }\r\nimg:hover { opacity: 0.9 !important; }\r\na { color: #0087ff; text-decoration: none; }\r\n.textbutton a { font-family: \'open sans\', arial, sans-serif !important;}\r\n.btn-link a { color:#FFFFFF !important;}\r\n\r\n@media only screen and (max-width: 480px) {\r\nbody { width: auto !important; }\r\n*[class=\"table-inner\"] { width: 90% !important; text-align: center !important; }\r\n*[class=\"table-full\"] { width: 100% !important; text-align: center !important; }\r\n/* image */\r\nimg[class=\"img1\"] { width: 100% !important; height: auto !important; }\r\n}\r\n</style>\r\n\r\n\r\n\r\n  <table bgcolor=\"#414a51\" width=\"100%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n    <tbody><tr>\r\n      <td height=\"50\"></td>\r\n    </tr>\r\n    <tr>\r\n      <td align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n        <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n          <tbody><tr>\r\n            <td align=\"center\" width=\"600\">\r\n              <!--header-->\r\n              <table class=\"table-inner\" width=\"95%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                <tbody><tr>\r\n                  <td bgcolor=\"#0087ff\" style=\"border-top-left-radius:6px; border-top-right-radius:6px;text-align:center;vertical-align:top;font-size:0;\" align=\"center\">\r\n                    <table width=\"90%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td align=\"center\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#FFFFFF; font-size:16px; font-weight: bold;\">This is a System Generated Email</td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n              </tbody></table>\r\n              <!--end header-->\r\n              <table class=\"table-inner\" width=\"95%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                <tbody><tr>\r\n                  <td bgcolor=\"#FFFFFF\" align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n                    <table align=\"center\" width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"35\"></td>\r\n                      </tr>\r\n                      <!--logo-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"vertical-align:top;font-size:0;\">\r\n                          <a href=\"#\">\r\n                            <img style=\"display:block; line-height:0px; font-size:0px; border:0px;\" src=\"https://i.imgur.com/Z1qtvtV.png\" alt=\"img\">\r\n                          </a>\r\n                        </td>\r\n                      </tr>\r\n                      <!--end logo-->\r\n                      <tr>\r\n                        <td height=\"40\"></td>\r\n                      </tr>\r\n                      <!--headline-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"font-family: \'Open Sans\', Arial, sans-serif; font-size: 22px;color:#414a51;font-weight: bold;\">Hello   (shakil01)</td>\r\n                      </tr>\r\n                      <!--end headline-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n                          <table width=\"40\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                            <tbody><tr>\r\n                              <td height=\"20\" style=\" border-bottom:3px solid #0087ff;\"></td>\r\n                            </tr>\r\n                          </tbody></table>\r\n                        </td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                      <!--content-->\r\n                      <tr>\r\n                        <td align=\"left\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#7f8c8d; font-size:16px; line-height: 28px;\"><br><div><div style=\"font-family: Montserrat, sans-serif;\">Thanks For joining us.<br></div><div style=\"font-family: Montserrat, sans-serif;\">Please use the below code to verify your email address.<br></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Your email verification code is:<font size=\"6\"><span style=\"font-weight: bolder;\">&nbsp;931604</span></font></div></div></td>\r\n                      </tr>\r\n                      <!--end content-->\r\n                      <tr>\r\n                        <td height=\"40\"></td>\r\n                      </tr>\r\n              \r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n                <tr>\r\n                  <td height=\"45\" align=\"center\" bgcolor=\"#f4f4f4\" style=\"border-bottom-left-radius:6px;border-bottom-right-radius:6px;\">\r\n                    <table align=\"center\" width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"10\"></td>\r\n                      </tr>\r\n                      <!--preference-->\r\n                      <tr>\r\n                        <td class=\"preference-link\" align=\"center\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#95a5a6; font-size:14px;\">\r\n                          © 2021 <a href=\"#\">Techyeah</a>&nbsp;. All Rights Reserved. \r\n                        </td>\r\n                      </tr>\r\n                      <!--end preference-->\r\n                      <tr>\r\n                        <td height=\"10\"></td>\r\n                      </tr>\r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n              </tbody></table>\r\n            </td>\r\n          </tr>\r\n        </tbody></table>\r\n      </td>\r\n    </tr>\r\n    <tr>\r\n      <td height=\"60\"></td>\r\n    </tr>\r\n  </tbody></table>', 'email', '2023-11-26 07:26:02', '2023-11-26 07:26:02'),
(16, 35, 'php', 'info@techyeah', 'shajid.hasibur1996@gmail.com', 'Please verify your email address', '<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\r\n  <!--[if !mso]><!-->\r\n  <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n  <!--<![endif]-->\r\n  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n  <title></title>\r\n  <style type=\"text/css\">\r\n.ReadMsgBody { width: 100%; background-color: #ffffff; }\r\n.ExternalClass { width: 100%; background-color: #ffffff; }\r\n.ExternalClass, .ExternalClass p, .ExternalClass span, .ExternalClass font, .ExternalClass td, .ExternalClass div { line-height: 100%; }\r\nhtml { width: 100%; }\r\nbody { -webkit-text-size-adjust: none; -ms-text-size-adjust: none; margin: 0; padding: 0; }\r\ntable { border-spacing: 0; table-layout: fixed; margin: 0 auto;border-collapse: collapse; }\r\ntable table table { table-layout: auto; }\r\n.yshortcuts a { border-bottom: none !important; }\r\nimg:hover { opacity: 0.9 !important; }\r\na { color: #0087ff; text-decoration: none; }\r\n.textbutton a { font-family: \'open sans\', arial, sans-serif !important;}\r\n.btn-link a { color:#FFFFFF !important;}\r\n\r\n@media only screen and (max-width: 480px) {\r\nbody { width: auto !important; }\r\n*[class=\"table-inner\"] { width: 90% !important; text-align: center !important; }\r\n*[class=\"table-full\"] { width: 100% !important; text-align: center !important; }\r\n/* image */\r\nimg[class=\"img1\"] { width: 100% !important; height: auto !important; }\r\n}\r\n</style>\r\n\r\n\r\n\r\n  <table bgcolor=\"#414a51\" width=\"100%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n    <tbody><tr>\r\n      <td height=\"50\"></td>\r\n    </tr>\r\n    <tr>\r\n      <td align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n        <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n          <tbody><tr>\r\n            <td align=\"center\" width=\"600\">\r\n              <!--header-->\r\n              <table class=\"table-inner\" width=\"95%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                <tbody><tr>\r\n                  <td bgcolor=\"#0087ff\" style=\"border-top-left-radius:6px; border-top-right-radius:6px;text-align:center;vertical-align:top;font-size:0;\" align=\"center\">\r\n                    <table width=\"90%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td align=\"center\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#FFFFFF; font-size:16px; font-weight: bold;\">This is a System Generated Email</td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n              </tbody></table>\r\n              <!--end header-->\r\n              <table class=\"table-inner\" width=\"95%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                <tbody><tr>\r\n                  <td bgcolor=\"#FFFFFF\" align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n                    <table align=\"center\" width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"35\"></td>\r\n                      </tr>\r\n                      <!--logo-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"vertical-align:top;font-size:0;\">\r\n                          <a href=\"#\">\r\n                            <img style=\"display:block; line-height:0px; font-size:0px; border:0px;\" src=\"https://i.imgur.com/Z1qtvtV.png\" alt=\"img\">\r\n                          </a>\r\n                        </td>\r\n                      </tr>\r\n                      <!--end logo-->\r\n                      <tr>\r\n                        <td height=\"40\"></td>\r\n                      </tr>\r\n                      <!--headline-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"font-family: \'Open Sans\', Arial, sans-serif; font-size: 22px;color:#414a51;font-weight: bold;\">Hello   (shajid121)</td>\r\n                      </tr>\r\n                      <!--end headline-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n                          <table width=\"40\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                            <tbody><tr>\r\n                              <td height=\"20\" style=\" border-bottom:3px solid #0087ff;\"></td>\r\n                            </tr>\r\n                          </tbody></table>\r\n                        </td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                      <!--content-->\r\n                      <tr>\r\n                        <td align=\"left\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#7f8c8d; font-size:16px; line-height: 28px;\"><br><div><div style=\"font-family: Montserrat, sans-serif;\">Thanks For joining us.<br></div><div style=\"font-family: Montserrat, sans-serif;\">Please use the below code to verify your email address.<br></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Your email verification code is:<font size=\"6\"><span style=\"font-weight: bolder;\">&nbsp;954122</span></font></div></div></td>\r\n                      </tr>\r\n                      <!--end content-->\r\n                      <tr>\r\n                        <td height=\"40\"></td>\r\n                      </tr>\r\n              \r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n                <tr>\r\n                  <td height=\"45\" align=\"center\" bgcolor=\"#f4f4f4\" style=\"border-bottom-left-radius:6px;border-bottom-right-radius:6px;\">\r\n                    <table align=\"center\" width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"10\"></td>\r\n                      </tr>\r\n                      <!--preference-->\r\n                      <tr>\r\n                        <td class=\"preference-link\" align=\"center\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#95a5a6; font-size:14px;\">\r\n                          © 2021 <a href=\"#\">Techyeah</a>&nbsp;. All Rights Reserved. \r\n                        </td>\r\n                      </tr>\r\n                      <!--end preference-->\r\n                      <tr>\r\n                        <td height=\"10\"></td>\r\n                      </tr>\r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n              </tbody></table>\r\n            </td>\r\n          </tr>\r\n        </tbody></table>\r\n      </td>\r\n    </tr>\r\n    <tr>\r\n      <td height=\"60\"></td>\r\n    </tr>\r\n  </tbody></table>', 'email', '2023-12-04 05:52:14', '2023-12-04 05:52:14'),
(17, 36, 'php', 'info@techyeah', 'suda@mailinator.com', 'Please verify your email address', '<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\r\n  <!--[if !mso]><!-->\r\n  <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n  <!--<![endif]-->\r\n  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n  <title></title>\r\n  <style type=\"text/css\">\r\n.ReadMsgBody { width: 100%; background-color: #ffffff; }\r\n.ExternalClass { width: 100%; background-color: #ffffff; }\r\n.ExternalClass, .ExternalClass p, .ExternalClass span, .ExternalClass font, .ExternalClass td, .ExternalClass div { line-height: 100%; }\r\nhtml { width: 100%; }\r\nbody { -webkit-text-size-adjust: none; -ms-text-size-adjust: none; margin: 0; padding: 0; }\r\ntable { border-spacing: 0; table-layout: fixed; margin: 0 auto;border-collapse: collapse; }\r\ntable table table { table-layout: auto; }\r\n.yshortcuts a { border-bottom: none !important; }\r\nimg:hover { opacity: 0.9 !important; }\r\na { color: #0087ff; text-decoration: none; }\r\n.textbutton a { font-family: \'open sans\', arial, sans-serif !important;}\r\n.btn-link a { color:#FFFFFF !important;}\r\n\r\n@media only screen and (max-width: 480px) {\r\nbody { width: auto !important; }\r\n*[class=\"table-inner\"] { width: 90% !important; text-align: center !important; }\r\n*[class=\"table-full\"] { width: 100% !important; text-align: center !important; }\r\n/* image */\r\nimg[class=\"img1\"] { width: 100% !important; height: auto !important; }\r\n}\r\n</style>\r\n\r\n\r\n\r\n  <table bgcolor=\"#414a51\" width=\"100%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n    <tbody><tr>\r\n      <td height=\"50\"></td>\r\n    </tr>\r\n    <tr>\r\n      <td align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n        <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n          <tbody><tr>\r\n            <td align=\"center\" width=\"600\">\r\n              <!--header-->\r\n              <table class=\"table-inner\" width=\"95%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                <tbody><tr>\r\n                  <td bgcolor=\"#0087ff\" style=\"border-top-left-radius:6px; border-top-right-radius:6px;text-align:center;vertical-align:top;font-size:0;\" align=\"center\">\r\n                    <table width=\"90%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td align=\"center\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#FFFFFF; font-size:16px; font-weight: bold;\">This is a System Generated Email</td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n              </tbody></table>\r\n              <!--end header-->\r\n              <table class=\"table-inner\" width=\"95%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                <tbody><tr>\r\n                  <td bgcolor=\"#FFFFFF\" align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n                    <table align=\"center\" width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"35\"></td>\r\n                      </tr>\r\n                      <!--logo-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"vertical-align:top;font-size:0;\">\r\n                          <a href=\"#\">\r\n                            <img style=\"display:block; line-height:0px; font-size:0px; border:0px;\" src=\"https://i.imgur.com/Z1qtvtV.png\" alt=\"img\">\r\n                          </a>\r\n                        </td>\r\n                      </tr>\r\n                      <!--end logo-->\r\n                      <tr>\r\n                        <td height=\"40\"></td>\r\n                      </tr>\r\n                      <!--headline-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"font-family: \'Open Sans\', Arial, sans-serif; font-size: 22px;color:#414a51;font-weight: bold;\">Hello   (xacaqysem)</td>\r\n                      </tr>\r\n                      <!--end headline-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n                          <table width=\"40\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                            <tbody><tr>\r\n                              <td height=\"20\" style=\" border-bottom:3px solid #0087ff;\"></td>\r\n                            </tr>\r\n                          </tbody></table>\r\n                        </td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                      <!--content-->\r\n                      <tr>\r\n                        <td align=\"left\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#7f8c8d; font-size:16px; line-height: 28px;\"><br><div><div style=\"font-family: Montserrat, sans-serif;\">Thanks For joining us.<br></div><div style=\"font-family: Montserrat, sans-serif;\">Please use the below code to verify your email address.<br></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Your email verification code is:<font size=\"6\"><span style=\"font-weight: bolder;\">&nbsp;482689</span></font></div></div></td>\r\n                      </tr>\r\n                      <!--end content-->\r\n                      <tr>\r\n                        <td height=\"40\"></td>\r\n                      </tr>\r\n              \r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n                <tr>\r\n                  <td height=\"45\" align=\"center\" bgcolor=\"#f4f4f4\" style=\"border-bottom-left-radius:6px;border-bottom-right-radius:6px;\">\r\n                    <table align=\"center\" width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"10\"></td>\r\n                      </tr>\r\n                      <!--preference-->\r\n                      <tr>\r\n                        <td class=\"preference-link\" align=\"center\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#95a5a6; font-size:14px;\">\r\n                          © 2021 <a href=\"#\">Techyeah</a>&nbsp;. All Rights Reserved. \r\n                        </td>\r\n                      </tr>\r\n                      <!--end preference-->\r\n                      <tr>\r\n                        <td height=\"10\"></td>\r\n                      </tr>\r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n              </tbody></table>\r\n            </td>\r\n          </tr>\r\n        </tbody></table>\r\n      </td>\r\n    </tr>\r\n    <tr>\r\n      <td height=\"60\"></td>\r\n    </tr>\r\n  </tbody></table>', 'email', '2023-12-04 06:20:13', '2023-12-04 06:20:13');

-- --------------------------------------------------------

--
-- Table structure for table `notification_templates`
--

DROP TABLE IF EXISTS `notification_templates`;
CREATE TABLE IF NOT EXISTS `notification_templates` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `act` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subj` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_body` text COLLATE utf8mb4_unicode_ci,
  `sms_body` text COLLATE utf8mb4_unicode_ci,
  `shortcodes` text COLLATE utf8mb4_unicode_ci,
  `email_status` tinyint(1) NOT NULL DEFAULT '1',
  `sms_status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notification_templates`
--

INSERT INTO `notification_templates` (`id`, `act`, `name`, `subj`, `email_body`, `sms_body`, `shortcodes`, `email_status`, `sms_status`, `created_at`, `updated_at`) VALUES
(1, 'BAL_ADD', 'Balance - Added', 'Your Account has been Credited', '<div><div style=\"font-family: Montserrat, sans-serif;\">{{amount}} {{site_currency}} has been added to your account .</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number : {{trx}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><span style=\"color: rgb(33, 37, 41); font-family: Montserrat, sans-serif;\">Your Current Balance is :&nbsp;</span><font style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\">{{post_balance}}&nbsp; {{site_currency}}&nbsp;</span></font><br></div><div><font style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></font></div><div>Admin note:&nbsp;<span style=\"color: rgb(33, 37, 41); font-size: 12px; font-weight: 600; white-space: nowrap; text-align: var(--bs-body-text-align);\">{{remark}}</span></div>', '{{amount}} {{site_currency}} credited in your account. Your Current Balance {{post_balance}} {{site_currency}} . Transaction: #{{trx}}. Admin note is \"{{remark}}\"', '{\"trx\":\"Transaction number for the action\",\"amount\":\"Amount inserted by the admin\",\"remark\":\"Remark inserted by the admin\",\"post_balance\":\"Balance of the user after this transaction\"}', 1, 0, '2021-11-03 12:00:00', '2022-04-03 02:18:28'),
(2, 'BAL_SUB', 'Balance - Subtracted', 'Your Account has been Debited', '<div style=\"font-family: Montserrat, sans-serif;\">{{amount}} {{site_currency}} has been subtracted from your account .</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number : {{trx}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><span style=\"color: rgb(33, 37, 41); font-family: Montserrat, sans-serif;\">Your Current Balance is :&nbsp;</span><font style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\">{{post_balance}}&nbsp; {{site_currency}}</span></font><br><div><font style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></font></div><div>Admin Note: {{remark}}</div>', '{{amount}} {{site_currency}} debited from your account. Your Current Balance {{post_balance}} {{site_currency}} . Transaction: #{{trx}}. Admin Note is {{remark}}', '{\"trx\":\"Transaction number for the action\",\"amount\":\"Amount inserted by the admin\",\"remark\":\"Remark inserted by the admin\",\"post_balance\":\"Balance of the user after this transaction\"}', 1, 1, '2021-11-03 12:00:00', '2022-04-03 02:24:11'),
(3, 'DEPOSIT_COMPLETE', 'Deposit - Automated - Successful', 'Deposit Completed Successfully', '<div>Your deposit of&nbsp;<span style=\"font-weight: bolder;\">{{amount}} {{site_currency}}</span>&nbsp;is via&nbsp;&nbsp;<span style=\"font-weight: bolder;\">{{method_name}}&nbsp;</span>has been completed Successfully.<span style=\"font-weight: bolder;\"><br></span></div><div><span style=\"font-weight: bolder;\"><br></span></div><div><span style=\"font-weight: bolder;\">Details of your Deposit :<br></span></div><div><br></div><div>Amount : {{amount}} {{site_currency}}</div><div>Charge:&nbsp;<font color=\"#000000\">{{charge}} {{site_currency}}</font></div><div><br></div><div>Conversion Rate : 1 {{site_currency}} = {{rate}} {{method_currency}}</div><div>Received : {{method_amount}} {{method_currency}}<br></div><div>Paid via :&nbsp; {{method_name}}</div><div><br></div><div>Transaction Number : {{trx}}</div><div><font size=\"5\"><span style=\"font-weight: bolder;\"><br></span></font></div><div><font size=\"5\">Your current Balance is&nbsp;<span style=\"font-weight: bolder;\">{{post_balance}} {{site_currency}}</span></font></div><div><br style=\"font-family: Montserrat, sans-serif;\"></div>', '{{amount}} {{site_currency}} Deposit successfully by {{method_name}}', '{\"trx\":\"Transaction number for the deposit\",\"amount\":\"Amount inserted by the user\",\"charge\":\"Gateway charge set by the admin\",\"rate\":\"Conversion rate between base currency and method currency\",\"method_name\":\"Name of the deposit method\",\"method_currency\":\"Currency of the deposit method\",\"method_amount\":\"Amount after conversion between base currency and method currency\",\"post_balance\":\"Balance of the user after this transaction\"}', 1, 1, '2021-11-03 12:00:00', '2022-04-03 02:25:43'),
(4, 'DEPOSIT_APPROVE', 'Deposit - Manual - Approved', 'Your Deposit is Approved', '<div style=\"font-family: Montserrat, sans-serif;\">Your deposit request of&nbsp;<span style=\"font-weight: bolder;\">{{amount}} {{site_currency}}</span>&nbsp;is via&nbsp;&nbsp;<span style=\"font-weight: bolder;\">{{method_name}}&nbsp;</span>is Approved .<span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\">Details of your Deposit :<br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Amount : {{amount}} {{site_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">Charge:&nbsp;<font color=\"#FF0000\">{{charge}} {{site_currency}}</font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Conversion Rate : 1 {{site_currency}} = {{rate}} {{method_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">Received : {{method_amount}} {{method_currency}}<br></div><div style=\"font-family: Montserrat, sans-serif;\">Paid via :&nbsp; {{method_name}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number : {{trx}}</div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"5\"><span style=\"font-weight: bolder;\"><br></span></font></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"5\">Your current Balance is&nbsp;<span style=\"font-weight: bolder;\">{{post_balance}} {{site_currency}}</span></font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div>', 'Admin Approve Your {{amount}} {{site_currency}} payment request by {{method_name}} transaction : {{trx}}', '{\"trx\":\"Transaction number for the deposit\",\"amount\":\"Amount inserted by the user\",\"charge\":\"Gateway charge set by the admin\",\"rate\":\"Conversion rate between base currency and method currency\",\"method_name\":\"Name of the deposit method\",\"method_currency\":\"Currency of the deposit method\",\"method_amount\":\"Amount after conversion between base currency and method currency\",\"post_balance\":\"Balance of the user after this transaction\"}', 1, 1, '2021-11-03 12:00:00', '2022-04-03 02:26:07'),
(5, 'DEPOSIT_REJECT', 'Deposit - Manual - Rejected', 'Your Deposit Request is Rejected', '<div style=\"font-family: Montserrat, sans-serif;\">Your deposit request of&nbsp;<span style=\"font-weight: bolder;\">{{amount}} {{site_currency}}</span>&nbsp;is via&nbsp;&nbsp;<span style=\"font-weight: bolder;\">{{method_name}} has been rejected</span>.<span style=\"font-weight: bolder;\"><br></span></div><div><br></div><div><br></div><div style=\"font-family: Montserrat, sans-serif;\">Conversion Rate : 1 {{site_currency}} = {{rate}} {{method_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">Received : {{method_amount}} {{method_currency}}<br></div><div style=\"font-family: Montserrat, sans-serif;\">Paid via :&nbsp; {{method_name}}</div><div style=\"font-family: Montserrat, sans-serif;\">Charge: {{charge}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number was : {{trx}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">if you have any queries, feel free to contact us.<br></div><br style=\"font-family: Montserrat, sans-serif;\"><div style=\"font-family: Montserrat, sans-serif;\"><br><br></div><span style=\"color: rgb(33, 37, 41); font-family: Montserrat, sans-serif;\">{{rejection_message}}</span><br>', 'Admin Rejected Your {{amount}} {{site_currency}} payment request by {{method_name}}\r\n\r\n{{rejection_message}}', '{\"trx\":\"Transaction number for the deposit\",\"amount\":\"Amount inserted by the user\",\"charge\":\"Gateway charge set by the admin\",\"rate\":\"Conversion rate between base currency and method currency\",\"method_name\":\"Name of the deposit method\",\"method_currency\":\"Currency of the deposit method\",\"method_amount\":\"Amount after conversion between base currency and method currency\",\"rejection_message\":\"Rejection message by the admin\"}', 1, 1, '2021-11-03 12:00:00', '2022-04-05 03:45:27'),
(6, 'DEPOSIT_REQUEST', 'Deposit - Manual - Requested', 'Deposit Request Submitted Successfully', '<div>Your deposit request of&nbsp;<span style=\"font-weight: bolder;\">{{amount}} {{site_currency}}</span>&nbsp;is via&nbsp;&nbsp;<span style=\"font-weight: bolder;\">{{method_name}}&nbsp;</span>submitted successfully<span style=\"font-weight: bolder;\">&nbsp;.<br></span></div><div><span style=\"font-weight: bolder;\"><br></span></div><div><span style=\"font-weight: bolder;\">Details of your Deposit :<br></span></div><div><br></div><div>Amount : {{amount}} {{site_currency}}</div><div>Charge:&nbsp;<font color=\"#FF0000\">{{charge}} {{site_currency}}</font></div><div><br></div><div>Conversion Rate : 1 {{site_currency}} = {{rate}} {{method_currency}}</div><div>Payable : {{method_amount}} {{method_currency}}<br></div><div>Pay via :&nbsp; {{method_name}}</div><div><br></div><div>Transaction Number : {{trx}}</div><div><br></div><div><br style=\"font-family: Montserrat, sans-serif;\"></div>', '{{amount}} {{site_currency}} Deposit requested by {{method_name}}. Charge: {{charge}} . Trx: {{trx}}', '{\"trx\":\"Transaction number for the deposit\",\"amount\":\"Amount inserted by the user\",\"charge\":\"Gateway charge set by the admin\",\"rate\":\"Conversion rate between base currency and method currency\",\"method_name\":\"Name of the deposit method\",\"method_currency\":\"Currency of the deposit method\",\"method_amount\":\"Amount after conversion between base currency and method currency\"}', 1, 1, '2021-11-03 12:00:00', '2022-04-03 02:29:19'),
(7, 'PASS_RESET_CODE', 'Password - Reset - Code', 'Password Reset', '<div style=\"font-family: Montserrat, sans-serif;\">We have received a request to reset the password for your account on&nbsp;<span style=\"font-weight: bolder;\">{{time}} .<br></span></div><div style=\"font-family: Montserrat, sans-serif;\">Requested From IP:&nbsp;<span style=\"font-weight: bolder;\">{{ip}}</span>&nbsp;using&nbsp;<span style=\"font-weight: bolder;\">{{browser}}</span>&nbsp;on&nbsp;<span style=\"font-weight: bolder;\">{{operating_system}}&nbsp;</span>.</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><br style=\"font-family: Montserrat, sans-serif;\"><div style=\"font-family: Montserrat, sans-serif;\"><div>Your account recovery code is:&nbsp;&nbsp;&nbsp;<font size=\"6\"><span style=\"font-weight: bolder;\">{{code}}</span></font></div><div><br></div></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"4\" color=\"#CC0000\">If you do not wish to reset your password, please disregard this message.&nbsp;</font><br></div><div><font size=\"4\" color=\"#CC0000\"><br></font></div>', 'Your account recovery code is: {{code}}', '{\"code\":\"Verification code for password reset\",\"ip\":\"IP address of the user\",\"browser\":\"Browser of the user\",\"operating_system\":\"Operating system of the user\",\"time\":\"Time of the request\"}', 1, 0, '2021-11-03 12:00:00', '2022-03-20 20:47:05'),
(8, 'PASS_RESET_DONE', 'Password - Reset - Confirmation', 'You have reset your password', '<p style=\"font-family: Montserrat, sans-serif;\">You have successfully reset your password.</p><p style=\"font-family: Montserrat, sans-serif;\">You changed from&nbsp; IP:&nbsp;<span style=\"font-weight: bolder;\">{{ip}}</span>&nbsp;using&nbsp;<span style=\"font-weight: bolder;\">{{browser}}</span>&nbsp;on&nbsp;<span style=\"font-weight: bolder;\">{{operating_system}}&nbsp;</span>&nbsp;on&nbsp;<span style=\"font-weight: bolder;\">{{time}}</span></p><p style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></p><p style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><font color=\"#ff0000\">If you did not change that, please contact us as soon as possible.</font></span></p>', 'Your password has been changed successfully', '{\"ip\":\"IP address of the user\",\"browser\":\"Browser of the user\",\"operating_system\":\"Operating system of the user\",\"time\":\"Time of the request\"}', 1, 1, '2021-11-03 12:00:00', '2022-04-05 03:46:35'),
(9, 'ADMIN_SUPPORT_REPLY', 'Support - Reply', 'Reply Support Ticket', '<div><p><span data-mce-style=\"font-size: 11pt;\" style=\"font-size: 11pt;\"><span style=\"font-weight: bolder;\">A member from our support team has replied to the following ticket:</span></span></p><p><span style=\"font-weight: bolder;\"><span data-mce-style=\"font-size: 11pt;\" style=\"font-size: 11pt;\"><span style=\"font-weight: bolder;\"><br></span></span></span></p><p><span style=\"font-weight: bolder;\">[Ticket#{{ticket_id}}] {{ticket_subject}}<br><br>Click here to reply:&nbsp; {{link}}</span></p><p>----------------------------------------------</p><p>Here is the reply :<br></p><p>{{reply}}<br></p></div><div><br style=\"font-family: Montserrat, sans-serif;\"></div>', 'Your Ticket#{{ticket_id}} :  {{ticket_subject}} has been replied.', '{\"ticket_id\":\"ID of the support ticket\",\"ticket_subject\":\"Subject  of the support ticket\",\"reply\":\"Reply made by the admin\",\"link\":\"URL to view the support ticket\"}', 1, 1, '2021-11-03 12:00:00', '2022-03-20 20:47:51'),
(10, 'EVER_CODE', 'Verification - Email', 'Please verify your email address', '<br><div><div style=\"font-family: Montserrat, sans-serif;\">Thanks For joining us.<br></div><div style=\"font-family: Montserrat, sans-serif;\">Please use the below code to verify your email address.<br></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Your email verification code is:<font size=\"6\"><span style=\"font-weight: bolder;\">&nbsp;{{code}}</span></font></div></div>', '---', '{\"code\":\"Email verification code\"}', 1, 0, '2021-11-03 12:00:00', '2022-04-03 02:32:07'),
(11, 'SVER_CODE', 'Verification - SMS', 'Verify Your Mobile Number', '---', 'Your phone verification code is: {{code}}', '{\"code\":\"SMS Verification Code\"}', 0, 1, '2021-11-03 12:00:00', '2022-03-20 19:24:37'),
(12, 'WITHDRAW_APPROVE', 'Withdraw - Approved', 'Withdraw Request has been Processed and your money is sent', '<div style=\"font-family: Montserrat, sans-serif;\">Your withdraw request of&nbsp;<span style=\"font-weight: bolder;\">{{amount}} {{site_currency}}</span>&nbsp; via&nbsp;&nbsp;<span style=\"font-weight: bolder;\">{{method_name}}&nbsp;</span>has been Processed Successfully.<span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\">Details of your withdraw:<br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Amount : {{amount}} {{site_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">Charge:&nbsp;<font color=\"#FF0000\">{{charge}} {{site_currency}}</font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Conversion Rate : 1 {{site_currency}} = {{rate}} {{method_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">You will get: {{method_amount}} {{method_currency}}<br></div><div style=\"font-family: Montserrat, sans-serif;\">Via :&nbsp; {{method_name}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number : {{trx}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">-----</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"4\">Details of Processed Payment :</font></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"4\"><span style=\"font-weight: bolder;\">{{admin_details}}</span></font></div>', 'Admin Approve Your {{amount}} {{site_currency}} withdraw request by {{method_name}}. Transaction {{trx}}', '{\"trx\":\"Transaction number for the withdraw\",\"amount\":\"Amount requested by the user\",\"charge\":\"Gateway charge set by the admin\",\"rate\":\"Conversion rate between base currency and method currency\",\"method_name\":\"Name of the withdraw method\",\"method_currency\":\"Currency of the withdraw method\",\"method_amount\":\"Amount after conversion between base currency and method currency\",\"admin_details\":\"Details provided by the admin\"}', 1, 1, '2021-11-03 12:00:00', '2022-03-20 20:50:16'),
(13, 'WITHDRAW_REJECT', 'Withdraw - Rejected', 'Withdraw Request has been Rejected and your money is refunded to your account', '<div style=\"font-family: Montserrat, sans-serif;\">Your withdraw request of&nbsp;<span style=\"font-weight: bolder;\">{{amount}} {{site_currency}}</span>&nbsp; via&nbsp;&nbsp;<span style=\"font-weight: bolder;\">{{method_name}}&nbsp;</span>has been Rejected.<span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\">Details of your withdraw:<br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Amount : {{amount}} {{site_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">Charge:&nbsp;<font color=\"#FF0000\">{{charge}} {{site_currency}}</font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Conversion Rate : 1 {{site_currency}} = {{rate}} {{method_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">You should get: {{method_amount}} {{method_currency}}<br></div><div style=\"font-family: Montserrat, sans-serif;\">Via :&nbsp; {{method_name}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number : {{trx}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">----</div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"3\"><br></font></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"3\">{{amount}} {{currency}} has been&nbsp;<span style=\"font-weight: bolder;\">refunded&nbsp;</span>to your account and your current Balance is&nbsp;<span style=\"font-weight: bolder;\">{{post_balance}}</span><span style=\"font-weight: bolder;\">&nbsp;{{site_currency}}</span></font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">-----</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"4\">Details of Rejection :</font></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"4\"><span style=\"font-weight: bolder;\">{{admin_details}}</span></font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><br><br><br><br><br></div><div></div><div></div>', 'Admin Rejected Your {{amount}} {{site_currency}} withdraw request. Your Main Balance {{post_balance}}  {{method_name}} , Transaction {{trx}}', '{\"trx\":\"Transaction number for the withdraw\",\"amount\":\"Amount requested by the user\",\"charge\":\"Gateway charge set by the admin\",\"rate\":\"Conversion rate between base currency and method currency\",\"method_name\":\"Name of the withdraw method\",\"method_currency\":\"Currency of the withdraw method\",\"method_amount\":\"Amount after conversion between base currency and method currency\",\"post_balance\":\"Balance of the user after fter this action\",\"admin_details\":\"Rejection message by the admin\"}', 1, 1, '2021-11-03 12:00:00', '2022-03-20 20:57:46'),
(14, 'WITHDRAW_REQUEST', 'Withdraw - Requested', 'Withdraw Request Submitted Successfully', '<div style=\"font-family: Montserrat, sans-serif;\">Your withdraw request of&nbsp;<span style=\"font-weight: bolder;\">{{amount}} {{site_currency}}</span>&nbsp; via&nbsp;&nbsp;<span style=\"font-weight: bolder;\">{{method_name}}&nbsp;</span>has been submitted Successfully.<span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\">Details of your withdraw:<br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Amount : {{amount}} {{site_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">Charge:&nbsp;<font color=\"#FF0000\">{{charge}} {{site_currency}}</font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Conversion Rate : 1 {{site_currency}} = {{rate}} {{method_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">You will get: {{method_amount}} {{method_currency}}<br></div><div style=\"font-family: Montserrat, sans-serif;\">Via :&nbsp; {{method_name}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number : {{trx}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"5\">Your current Balance is&nbsp;<span style=\"font-weight: bolder;\">{{post_balance}} {{site_currency}}</span></font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><br><br><br></div>', '{{amount}} {{site_currency}} withdraw requested by {{method_name}}. You will get {{method_amount}} {{method_currency}} Trx: {{trx}}', '{\"trx\":\"Transaction number for the withdraw\",\"amount\":\"Amount requested by the user\",\"charge\":\"Gateway charge set by the admin\",\"rate\":\"Conversion rate between base currency and method currency\",\"method_name\":\"Name of the withdraw method\",\"method_currency\":\"Currency of the withdraw method\",\"method_amount\":\"Amount after conversion between base currency and method currency\",\"post_balance\":\"Balance of the user after fter this transaction\"}', 1, 1, '2021-11-03 12:00:00', '2022-03-21 04:39:03'),
(15, 'DEFAULT', 'Default Template', '{{subject}}', '{{message}}', '{{message}}', '{\"subject\":\"Subject\",\"message\":\"Message\"}', 1, 1, '2019-09-14 13:14:22', '2021-11-04 09:38:55'),
(16, 'KYC_APPROVE', 'KYC Approved', 'KYC has been approved', NULL, NULL, '[]', 1, 1, NULL, NULL),
(17, 'KYC_REJECT', 'KYC Rejected Successfully', 'KYC has been rejected', NULL, NULL, '[]', 1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
CREATE TABLE IF NOT EXISTS `pages` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tempname` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'template name',
  `secs` text COLLATE utf8mb4_unicode_ci,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `name`, `slug`, `tempname`, `secs`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 'HOME', '/', 'templates.basic.', '[\"about\",\"blog\",\"counter\",\"faq\",\"feature\",\"service\",\"subscribe\"]', 1, '2020-07-11 06:23:58', '2022-03-15 06:56:00'),
(4, 'Blog', 'blog', 'templates.basic.', NULL, 1, '2020-10-22 01:14:43', '2020-10-22 01:14:43'),
(5, 'Contact', 'contact', 'templates.basic.', NULL, 1, '2020-10-22 01:14:53', '2020-10-22 01:14:53');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('ronnie@gmail.com', '100375', '2020-07-07 05:44:47'),
('user@site.comfff', '988862', '2021-05-07 07:31:28'),
('mosta@gmail.com', '865544', '2021-06-10 09:21:05'),
('user@site.com', '727340', '2022-09-20 05:22:46'),
('ronnie@gmail.com', '100375', '2020-07-07 05:44:47'),
('user@site.comfff', '988862', '2021-05-07 07:31:28'),
('mosta@gmail.com', '865544', '2021-06-10 09:21:05'),
('user@site.com', '727340', '2022-09-20 05:22:46'),
('ronnie@gmail.com', '100375', '2020-07-07 05:44:47'),
('user@site.comfff', '988862', '2021-05-07 07:31:28'),
('mosta@gmail.com', '865544', '2021-06-10 09:21:05'),
('user@site.com', '727340', '2022-09-20 05:22:46'),
('ronnie@gmail.com', '100375', '2020-07-07 05:44:47'),
('user@site.comfff', '988862', '2021-05-07 07:31:28'),
('mosta@gmail.com', '865544', '2021-06-10 09:21:05'),
('user@site.com', '727340', '2022-09-20 05:22:46');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(29, 'App\\Models\\User', 22, 'MyApp', '5da1bfd64a5d95722d5c085185f0787323270c5cf12d09c5a69e4f950f4d8420', '[\"*\"]', NULL, '2021-05-19 05:47:02', '2021-05-19 05:47:02'),
(46, 'App\\Models\\User', 25, 'auth_token', 'bc7288b4e2082a0475639d6e2f29483a35abd11f55110df12244d9142f7ca54a', '[\"*\"]', NULL, '2021-06-10 05:35:17', '2021-06-10 05:35:17'),
(47, 'App\\Models\\User', 25, 'auth_token', '2bcdbee9ab110af212b02516a602ba52cf27a6aa844901acbb2fbfc09c95bb34', '[\"*\"]', NULL, '2021-06-10 06:31:50', '2021-06-10 06:31:50'),
(51, 'App\\Models\\User', 26, 'auth_token', 'c792344d1730dde4e418f6380309b24767062dc5e9c6757fce88675f7bbff9f3', '[\"*\"]', NULL, '2021-06-10 08:38:29', '2021-06-10 08:38:29'),
(53, 'App\\Models\\User', 24, 'auth_token', '36c0eb2f6065deb315bd996e158aed1d6c06f4a04879317bcf1961ea786a675c', '[\"*\"]', '2021-06-10 13:04:13', '2021-06-10 09:36:52', '2021-06-10 13:04:13'),
(54, 'App\\Models\\User', 24, 'auth_token', 'ddcfe3a5d501093c86a0a376a125099517199ea17ee9d4d78be12e476e413b40', '[\"*\"]', '2021-06-10 10:05:35', '2021-06-10 10:05:22', '2021-06-10 10:05:35'),
(55, 'App\\Models\\User', 24, 'auth_token', 'ecf248b74ee8bff942c22b299ccb3afe840a589b7dbd62b9897cbe46ea6c8941', '[\"*\"]', NULL, '2021-06-10 11:56:06', '2021-06-10 11:56:06'),
(60, 'App\\Models\\User', 31, 'auth_token', '29647be4a8b5510c717c50b8279d168717ebcc25b3d0155fcc840cd315527112', '[\"*\"]', NULL, '2022-03-22 11:22:57', '2022-03-22 11:22:57'),
(64, 'App\\Models\\User', 8, 'auth_token', '710ea03f99855951e40875d7bfc2ffbabf4a8316d2b527de20ceac02029af6b9', '[\"*\"]', '2022-09-25 04:50:11', '2022-08-03 06:04:12', '2022-09-25 04:50:11'),
(65, 'App\\Models\\User', 33, 'auth_token', '2ff064418c422255032f6530e80f18a8b552aabd8a95018a163452af086d0014', '[\"*\"]', NULL, '2022-09-29 06:59:30', '2022-09-29 06:59:30'),
(66, 'App\\Models\\User', 8, 'auth_token', 'b11af6742cfc224a5fe6d1faeac5ac10b3fe22eb960c2a7dd21ac20866952c47', '[\"*\"]', '2022-10-24 06:29:07', '2022-10-24 06:27:52', '2022-10-24 06:29:07');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
CREATE TABLE IF NOT EXISTS `reviews` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `technician_id` bigint UNSIGNED NOT NULL,
  `star_value` int NOT NULL DEFAULT '0',
  `comments` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=192 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `technician_id`, `star_value`, `comments`, `created_at`, `updated_at`) VALUES
(1, 1, 5, 'jj', '2023-09-30 21:05:45', '2024-03-09 08:12:29'),
(2, 2, 3, '4566', '2023-09-30 21:09:00', '2024-02-07 10:02:33'),
(3, 3, 5, 'cddc', '2023-09-30 21:10:21', '2024-02-07 10:03:45'),
(4, 4, 1, NULL, '2023-09-30 21:11:07', '2024-04-05 16:17:00'),
(5, 5, 0, NULL, '2023-09-30 21:12:46', '2023-09-30 21:12:46'),
(6, 6, 0, NULL, '2023-09-30 21:14:17', '2023-09-30 21:14:17'),
(7, 7, 5, NULL, '2023-09-30 21:15:32', '2023-10-02 18:28:04'),
(8, 8, 0, NULL, '2023-09-30 21:16:25', '2023-09-30 21:16:25'),
(9, 9, 0, NULL, '2023-09-30 21:17:32', '2023-09-30 21:17:32'),
(10, 10, 0, NULL, '2023-09-30 21:18:20', '2023-09-30 21:18:20'),
(11, 11, 0, NULL, '2023-10-01 18:48:08', '2023-10-01 18:48:08'),
(12, 12, 5, NULL, '2023-10-01 19:06:32', '2023-11-21 05:44:57'),
(13, 13, 0, NULL, '2023-10-01 23:49:12', '2023-10-01 23:49:12'),
(14, 14, 0, NULL, '2023-10-02 18:54:01', '2023-10-02 18:54:01'),
(15, 15, 0, NULL, '2023-10-29 16:43:08', '2023-10-29 16:43:08'),
(16, 16, 0, NULL, '2023-10-29 16:43:09', '2023-10-29 16:43:09'),
(17, 17, 0, NULL, '2023-10-29 16:43:09', '2023-10-29 16:43:09'),
(18, 18, 0, NULL, '2023-10-29 16:43:09', '2023-10-29 16:43:09'),
(19, 19, 0, NULL, '2023-10-29 16:43:09', '2023-10-29 16:43:09'),
(20, 20, 0, NULL, '2023-10-29 16:43:09', '2023-10-29 16:43:09'),
(21, 21, 0, NULL, '2023-10-29 16:43:09', '2023-10-29 16:43:09'),
(22, 22, 0, NULL, '2023-10-29 16:43:09', '2023-10-29 16:43:09'),
(23, 23, 3, NULL, '2023-10-29 16:43:09', '2023-11-21 05:43:19'),
(24, 24, 0, NULL, '2023-10-29 16:43:09', '2023-10-29 16:43:09'),
(25, 25, 0, NULL, '2023-10-29 22:05:12', '2023-10-29 22:05:12'),
(26, 26, 0, NULL, '2023-10-29 22:05:12', '2023-10-29 22:05:12'),
(27, 27, 0, NULL, '2023-10-29 22:05:12', '2023-10-29 22:05:12'),
(28, 28, 0, NULL, '2023-10-29 22:05:12', '2023-10-29 22:05:12'),
(29, 29, 0, NULL, '2023-10-29 22:05:12', '2023-10-29 22:05:12'),
(30, 30, 0, NULL, '2023-10-29 22:05:12', '2023-10-29 22:05:12'),
(31, 31, 0, NULL, '2023-10-29 22:05:12', '2023-10-29 22:05:12'),
(32, 32, 0, NULL, '2023-10-29 22:05:12', '2023-10-29 22:05:12'),
(33, 33, 0, NULL, '2023-10-29 22:05:12', '2023-10-29 22:05:12'),
(34, 34, 0, NULL, '2023-10-29 22:05:12', '2023-10-29 22:05:12'),
(35, 35, 0, NULL, '2024-01-03 11:36:55', '2024-01-03 11:36:55'),
(36, 36, 0, NULL, '2024-01-03 11:37:08', '2024-01-03 11:37:08'),
(37, 37, 0, NULL, '2024-01-03 11:45:03', '2024-01-03 11:45:03'),
(38, 38, 5, NULL, '2024-01-04 06:11:08', '2024-01-04 06:33:54'),
(39, 39, 0, NULL, '2024-01-10 07:18:49', '2024-01-10 07:18:49'),
(40, 40, 0, NULL, '2024-01-10 07:18:49', '2024-01-10 07:18:49'),
(41, 41, 0, NULL, '2024-01-10 07:18:49', '2024-01-10 07:18:49'),
(42, 42, 0, NULL, '2024-01-10 07:18:49', '2024-01-10 07:18:49'),
(43, 43, 0, NULL, '2024-01-10 07:18:49', '2024-01-10 07:18:49'),
(44, 44, 0, NULL, '2024-01-10 07:18:49', '2024-01-10 07:18:49'),
(45, 45, 0, NULL, '2024-01-10 07:18:49', '2024-01-10 07:18:49'),
(46, 46, 0, NULL, '2024-01-10 07:18:49', '2024-01-10 07:18:49'),
(47, 47, 0, NULL, '2024-01-10 07:18:49', '2024-01-10 07:18:49'),
(48, 48, 0, NULL, '2024-01-10 07:18:49', '2024-01-10 07:18:49'),
(49, 49, 0, NULL, '2024-01-10 07:59:31', '2024-01-10 07:59:31'),
(50, 50, 0, NULL, '2024-01-10 07:59:31', '2024-01-10 07:59:31'),
(51, 51, 0, NULL, '2024-01-10 07:59:31', '2024-01-10 07:59:31'),
(52, 52, 0, NULL, '2024-01-10 07:59:31', '2024-01-10 07:59:31'),
(53, 53, 0, NULL, '2024-01-10 07:59:31', '2024-01-10 07:59:31'),
(54, 54, 0, NULL, '2024-01-10 07:59:31', '2024-01-10 07:59:31'),
(55, 55, 0, NULL, '2024-01-10 07:59:31', '2024-01-10 07:59:31'),
(56, 56, 0, NULL, '2024-01-10 07:59:31', '2024-01-10 07:59:31'),
(57, 57, 0, NULL, '2024-01-10 07:59:31', '2024-01-10 07:59:31'),
(58, 58, 0, NULL, '2024-01-10 07:59:31', '2024-01-10 07:59:31'),
(59, 59, 0, NULL, '2024-01-10 08:00:55', '2024-01-10 08:00:55'),
(60, 60, 0, NULL, '2024-01-10 08:00:55', '2024-01-10 08:00:55'),
(61, 61, 0, NULL, '2024-01-10 08:00:55', '2024-01-10 08:00:55'),
(62, 62, 0, NULL, '2024-01-10 08:00:55', '2024-01-10 08:00:55'),
(63, 63, 0, NULL, '2024-01-10 08:00:55', '2024-01-10 08:00:55'),
(64, 64, 0, NULL, '2024-01-10 08:00:55', '2024-01-10 08:00:55'),
(65, 65, 0, NULL, '2024-01-10 08:00:55', '2024-01-10 08:00:55'),
(66, 66, 0, NULL, '2024-01-10 08:00:55', '2024-01-10 08:00:55'),
(67, 67, 0, NULL, '2024-01-10 08:00:55', '2024-01-10 08:00:55'),
(68, 68, 0, NULL, '2024-01-10 08:00:55', '2024-01-10 08:00:55'),
(69, 69, 0, NULL, '2024-01-10 08:01:48', '2024-01-10 08:01:48'),
(70, 70, 0, NULL, '2024-01-10 08:01:48', '2024-01-10 08:01:48'),
(71, 71, 0, NULL, '2024-01-10 08:01:48', '2024-01-10 08:01:48'),
(72, 72, 0, NULL, '2024-01-10 08:01:48', '2024-01-10 08:01:48'),
(73, 73, 0, NULL, '2024-01-10 08:01:48', '2024-01-10 08:01:48'),
(74, 74, 0, NULL, '2024-01-10 08:01:48', '2024-01-10 08:01:48'),
(75, 75, 0, NULL, '2024-01-10 08:01:48', '2024-01-10 08:01:48'),
(76, 76, 0, NULL, '2024-01-10 08:01:48', '2024-01-10 08:01:48'),
(77, 77, 0, NULL, '2024-01-10 08:01:48', '2024-01-10 08:01:48'),
(78, 78, 0, NULL, '2024-01-10 08:01:48', '2024-01-10 08:01:48'),
(79, 79, 0, NULL, '2024-01-10 08:02:29', '2024-01-10 08:02:29'),
(80, 80, 0, NULL, '2024-01-10 08:02:29', '2024-01-10 08:02:29'),
(81, 81, 0, NULL, '2024-01-10 08:02:29', '2024-01-10 08:02:29'),
(82, 82, 0, NULL, '2024-01-10 08:02:29', '2024-01-10 08:02:29'),
(83, 83, 0, NULL, '2024-01-10 08:02:29', '2024-01-10 08:02:29'),
(84, 84, 0, NULL, '2024-01-10 08:02:29', '2024-01-10 08:02:29'),
(85, 85, 0, NULL, '2024-01-10 08:02:29', '2024-01-10 08:02:29'),
(86, 86, 0, NULL, '2024-01-10 08:02:29', '2024-01-10 08:02:29'),
(87, 87, 0, NULL, '2024-01-10 08:02:29', '2024-01-10 08:02:29'),
(88, 88, 0, NULL, '2024-01-10 08:02:29', '2024-01-10 08:02:29'),
(89, 89, 0, NULL, '2024-01-10 08:03:12', '2024-01-10 08:03:12'),
(90, 90, 0, NULL, '2024-01-10 08:03:12', '2024-01-10 08:03:12'),
(91, 91, 0, NULL, '2024-01-10 08:03:12', '2024-01-10 08:03:12'),
(92, 92, 0, NULL, '2024-01-10 08:03:12', '2024-01-10 08:03:12'),
(93, 93, 0, NULL, '2024-01-10 08:03:12', '2024-01-10 08:03:12'),
(94, 94, 0, NULL, '2024-01-10 08:03:12', '2024-01-10 08:03:12'),
(95, 95, 0, NULL, '2024-01-10 08:03:12', '2024-01-10 08:03:12'),
(96, 96, 0, NULL, '2024-01-10 08:03:12', '2024-01-10 08:03:12'),
(97, 97, 0, NULL, '2024-01-10 08:03:12', '2024-01-10 08:03:12'),
(98, 98, 0, NULL, '2024-01-10 08:03:12', '2024-01-10 08:03:12'),
(99, 99, 0, NULL, '2024-01-10 08:05:43', '2024-01-10 08:05:43'),
(100, 100, 0, NULL, '2024-01-10 08:05:43', '2024-01-10 08:05:43'),
(101, 101, 0, NULL, '2024-01-10 08:05:43', '2024-01-10 08:05:43'),
(102, 102, 0, NULL, '2024-01-10 08:05:43', '2024-01-10 08:05:43'),
(103, 103, 0, NULL, '2024-01-10 08:05:43', '2024-01-10 08:05:43'),
(104, 104, 0, NULL, '2024-01-10 08:05:43', '2024-01-10 08:05:43'),
(105, 105, 0, NULL, '2024-01-10 08:05:43', '2024-01-10 08:05:43'),
(106, 106, 0, NULL, '2024-01-10 08:05:43', '2024-01-10 08:05:43'),
(107, 107, 0, NULL, '2024-01-10 08:05:43', '2024-01-10 08:05:43'),
(108, 108, 0, NULL, '2024-01-10 08:05:43', '2024-01-10 08:05:43'),
(109, 109, 0, NULL, '2024-01-10 08:10:52', '2024-01-10 08:10:52'),
(110, 110, 0, NULL, '2024-01-10 08:10:52', '2024-01-10 08:10:52'),
(111, 111, 0, NULL, '2024-01-10 08:10:52', '2024-01-10 08:10:52'),
(112, 112, 0, NULL, '2024-01-10 08:10:52', '2024-01-10 08:10:52'),
(113, 113, 0, NULL, '2024-01-10 08:10:52', '2024-01-10 08:10:52'),
(114, 114, 0, NULL, '2024-01-10 08:10:52', '2024-01-10 08:10:52'),
(115, 115, 0, NULL, '2024-01-10 08:10:52', '2024-01-10 08:10:52'),
(116, 116, 0, NULL, '2024-01-10 08:10:52', '2024-01-10 08:10:52'),
(117, 117, 0, NULL, '2024-01-10 08:10:52', '2024-01-10 08:10:52'),
(118, 118, 0, NULL, '2024-01-10 08:10:52', '2024-01-10 08:10:52'),
(119, 119, 0, NULL, '2024-01-10 08:14:29', '2024-01-10 08:14:29'),
(120, 120, 0, NULL, '2024-01-10 08:14:30', '2024-01-10 08:14:30'),
(121, 121, 0, NULL, '2024-01-10 08:14:30', '2024-01-10 08:14:30'),
(122, 122, 0, NULL, '2024-01-10 08:14:30', '2024-01-10 08:14:30'),
(123, 123, 0, NULL, '2024-01-10 08:14:30', '2024-01-10 08:14:30'),
(124, 124, 0, NULL, '2024-01-10 08:14:30', '2024-01-10 08:14:30'),
(125, 125, 0, NULL, '2024-01-10 08:14:30', '2024-01-10 08:14:30'),
(126, 126, 0, NULL, '2024-01-10 08:14:30', '2024-01-10 08:14:30'),
(127, 127, 0, NULL, '2024-01-10 08:14:30', '2024-01-10 08:14:30'),
(128, 128, 0, NULL, '2024-01-10 08:14:30', '2024-01-10 08:14:30'),
(129, 129, 0, NULL, '2024-01-10 08:14:41', '2024-01-10 08:14:41'),
(130, 130, 0, NULL, '2024-01-10 08:14:41', '2024-01-10 08:14:41'),
(131, 131, 0, NULL, '2024-01-10 08:14:41', '2024-01-10 08:14:41'),
(132, 132, 0, NULL, '2024-01-10 08:14:41', '2024-01-10 08:14:41'),
(133, 133, 0, NULL, '2024-01-10 08:14:41', '2024-01-10 08:14:41'),
(134, 134, 0, NULL, '2024-01-10 08:14:41', '2024-01-10 08:14:41'),
(135, 135, 0, NULL, '2024-01-10 08:14:41', '2024-01-10 08:14:41'),
(136, 136, 0, NULL, '2024-01-10 08:14:41', '2024-01-10 08:14:41'),
(137, 137, 0, NULL, '2024-01-10 08:14:41', '2024-01-10 08:14:41'),
(138, 138, 0, NULL, '2024-01-10 08:14:41', '2024-01-10 08:14:41'),
(139, 139, 0, NULL, '2024-01-10 08:14:49', '2024-01-10 08:14:49'),
(140, 140, 0, NULL, '2024-01-10 08:14:49', '2024-01-10 08:14:49'),
(141, 141, 0, NULL, '2024-01-10 08:14:49', '2024-01-10 08:14:49'),
(142, 142, 0, NULL, '2024-01-10 08:14:49', '2024-01-10 08:14:49'),
(143, 143, 0, NULL, '2024-01-10 08:14:49', '2024-01-10 08:14:49'),
(144, 144, 0, NULL, '2024-01-10 08:14:49', '2024-01-10 08:14:49'),
(145, 145, 0, NULL, '2024-01-10 08:14:49', '2024-01-10 08:14:49'),
(146, 146, 0, NULL, '2024-01-10 08:14:49', '2024-01-10 08:14:49'),
(147, 147, 0, NULL, '2024-01-10 08:14:49', '2024-01-10 08:14:49'),
(148, 148, 0, NULL, '2024-01-10 08:14:49', '2024-01-10 08:14:49'),
(149, 149, 0, NULL, '2024-01-10 08:16:14', '2024-01-10 08:16:14'),
(150, 150, 0, NULL, '2024-01-10 08:16:14', '2024-01-10 08:16:14'),
(151, 151, 0, NULL, '2024-01-10 08:16:14', '2024-01-10 08:16:14'),
(152, 152, 0, NULL, '2024-01-10 08:16:14', '2024-01-10 08:16:14'),
(153, 153, 0, NULL, '2024-01-10 08:16:14', '2024-01-10 08:16:14'),
(154, 154, 0, NULL, '2024-01-10 08:16:14', '2024-01-10 08:16:14'),
(155, 155, 0, NULL, '2024-01-10 08:16:14', '2024-01-10 08:16:14'),
(156, 156, 0, NULL, '2024-01-10 08:16:14', '2024-01-10 08:16:14'),
(157, 157, 0, NULL, '2024-01-10 08:16:14', '2024-01-10 08:16:14'),
(158, 158, 0, NULL, '2024-01-10 08:16:14', '2024-01-10 08:16:14'),
(159, 159, 5, '123', '2024-01-15 09:38:27', '2024-02-07 09:53:50'),
(160, 160, 0, NULL, '2024-01-15 09:39:23', '2024-01-15 09:39:23'),
(161, 161, 0, NULL, '2024-01-15 09:39:23', '2024-01-15 09:39:23'),
(162, 162, 0, NULL, '2024-01-15 09:39:23', '2024-01-15 09:39:23'),
(163, 163, 0, NULL, '2024-01-15 09:39:23', '2024-01-15 09:39:23'),
(164, 164, 0, NULL, '2024-01-15 09:39:23', '2024-01-15 09:39:23'),
(165, 165, 0, NULL, '2024-01-15 09:39:23', '2024-01-15 09:39:23'),
(166, 166, 0, NULL, '2024-01-15 09:39:23', '2024-01-15 09:39:23'),
(167, 167, 0, NULL, '2024-01-15 09:39:23', '2024-01-15 09:39:23'),
(168, 168, 0, NULL, '2024-01-15 09:39:23', '2024-01-15 09:39:23'),
(169, 169, 0, NULL, '2024-01-15 09:39:23', '2024-01-15 09:39:23'),
(170, 170, 0, NULL, '2024-02-12 07:14:26', '2024-02-12 07:14:26'),
(171, 171, 0, NULL, '2024-02-12 08:07:07', '2024-02-12 08:07:07'),
(172, 172, 0, NULL, '2024-02-12 08:14:00', '2024-02-12 08:14:00'),
(173, 173, 5, '123', '2024-02-12 08:16:40', '2024-02-13 05:12:14'),
(174, 174, 0, NULL, '2024-02-21 09:42:27', '2024-02-21 09:42:27'),
(175, 1, 0, NULL, '2024-02-26 04:09:41', '2024-02-26 04:09:41'),
(176, 2, 0, NULL, '2024-03-11 11:22:07', '2024-03-11 11:22:07'),
(177, 3, 0, NULL, '2024-04-05 16:08:55', '2024-04-05 16:08:55'),
(178, 4, 0, NULL, '2024-04-05 16:08:56', '2024-04-05 16:08:56'),
(179, 5, 0, NULL, '2024-04-23 14:44:52', '2024-04-23 14:44:52'),
(180, 6, 0, NULL, '2024-04-23 14:47:51', '2024-04-23 14:47:51'),
(182, 8, 0, NULL, '2024-05-15 09:10:32', '2024-05-15 09:10:32'),
(183, 9, 0, NULL, '2024-05-15 09:10:32', '2024-05-15 09:10:32'),
(184, 10, 0, NULL, '2024-05-15 09:17:40', '2024-05-15 09:17:40'),
(185, 11, 0, NULL, '2024-05-15 09:17:40', '2024-05-15 09:17:40'),
(186, 12, 0, NULL, '2024-05-15 09:22:09', '2024-05-15 09:22:09'),
(187, 13, 0, NULL, '2024-05-15 09:22:09', '2024-05-15 09:22:09'),
(188, 14, 0, NULL, '2024-05-15 09:23:39', '2024-05-15 09:23:39'),
(189, 15, 0, NULL, '2024-05-15 09:23:39', '2024-05-15 09:23:39'),
(190, 16, 0, NULL, '2024-05-15 09:26:27', '2024-05-15 09:26:27'),
(191, 17, 0, NULL, '2024-05-15 09:26:27', '2024-05-15 09:26:27');

-- --------------------------------------------------------

--
-- Table structure for table `skill_categories`
--

DROP TABLE IF EXISTS `skill_categories`;
CREATE TABLE IF NOT EXISTS `skill_categories` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `skill_name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `skill_name` (`skill_name`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `skill_categories`
--

INSERT INTO `skill_categories` (`id`, `skill_name`, `created_at`, `updated_at`) VALUES
(1, 'Cable Certifier', '2023-09-03 07:51:25', '2023-09-03 07:51:25'),
(2, 'Fiber', '2023-09-03 07:51:35', '2023-09-03 07:51:35'),
(3, 'Fiber Tester', '2023-09-03 07:51:45', '2023-09-03 07:51:45'),
(4, 'Laptop & Console Cable', '2023-09-03 07:51:54', '2023-09-03 07:51:54'),
(5, 'Wi-Fi', '2023-09-03 07:52:03', '2023-09-03 07:52:03'),
(6, 'Heat Mapping', '2023-09-03 07:52:13', '2023-09-03 07:52:13'),
(7, 'A/V', '2023-09-03 07:52:21', '2023-09-03 07:52:21'),
(8, 'Speakers/ Paging', '2023-09-03 07:52:29', '2023-09-03 07:52:29'),
(9, 'VoIP Phones', '2023-09-03 07:52:37', '2023-09-03 07:52:37'),
(10, 'Legacy Phones – PBX', '2023-09-03 07:52:50', '2023-09-03 07:52:50'),
(11, 'Electrical', '2023-09-03 07:53:07', '2023-09-03 07:53:07'),
(12, 'Eckahau', '2023-09-03 07:53:19', '2023-09-03 07:53:19'),
(13, 'Air Magnet', '2023-09-03 07:53:27', '2023-09-03 07:53:27'),
(22, 'A', '2023-10-29 16:43:08', '2023-10-29 16:43:08'),
(23, 'B', '2023-10-29 16:43:09', '2023-10-29 16:43:09'),
(24, 'C', '2023-10-29 16:43:09', '2023-10-29 16:43:09'),
(25, 'D', '2023-10-29 16:43:09', '2023-10-29 16:43:09'),
(26, 'X', '2023-10-29 16:43:09', '2023-10-29 16:43:09'),
(27, 'Y', '2023-10-29 16:43:09', '2023-10-29 16:43:09'),
(28, 'Z', '2023-10-29 16:43:09', '2023-10-29 16:43:09'),
(29, 'Cybersecurity', '2023-10-29 16:43:09', '2023-10-29 16:43:09'),
(30, 'Hardware repair', '2023-10-29 16:43:09', '2023-10-29 16:43:09'),
(31, 'K', '2023-10-29 16:43:09', '2023-10-29 16:43:09'),
(32, 'P', '2023-10-29 16:43:09', '2023-10-29 16:43:09'),
(33, 'IT project management', '2023-10-29 16:43:09', '2023-10-29 16:43:09'),
(34, 'F', '2023-10-29 16:43:09', '2023-10-29 16:43:09'),
(35, 'Virtualization (VMware', '2023-10-29 16:43:09', '2023-10-29 16:43:09'),
(36, 'Hyper-V)', '2023-10-29 16:43:09', '2023-10-29 16:43:09'),
(37, 'Geographical Information Systems (GIS)', '2023-10-29 16:43:09', '2023-10-29 16:43:09'),
(38, 'G', '2023-10-29 16:43:09', '2023-10-29 16:43:09'),
(39, 'System administration.', '2023-10-29 16:43:09', '2023-10-29 16:43:09'),
(40, 'T', '2023-10-29 16:43:09', '2023-10-29 16:43:09'),
(41, 'Cloud computing (AWS', '2023-10-29 16:43:09', '2023-10-29 16:43:09'),
(42, 'Azure', '2023-10-29 16:43:09', '2023-10-29 16:43:09'),
(43, 'Google Cloud)', '2023-10-29 16:43:09', '2023-10-29 16:43:09'),
(44, 'H', '2023-10-29 16:43:09', '2023-10-29 16:43:09'),
(45, 'Python', '2023-10-29 16:43:09', '2023-10-29 16:43:09'),
(46, 'Java', '2023-10-29 16:43:09', '2023-10-29 16:43:09'),
(47, 'or C++', '2023-10-29 16:43:09', '2023-10-29 16:43:09'),
(48, 'O', '2023-10-29 16:43:09', '2023-10-29 16:43:09'),
(49, 'R', '2023-10-29 16:43:09', '2023-10-29 16:43:09'),
(50, 'S', '2023-10-29 16:43:09', '2023-10-29 16:43:09'),
(51, 'DevOps practices and tools', '2023-10-29 16:43:09', '2023-10-29 16:43:09'),
(69, 'll', '2024-01-03 07:14:39', '2024-01-03 07:14:39'),
(70, 'kk', '2024-01-03 07:15:36', '2024-01-03 07:15:36'),
(71, 'jk', '2024-01-04 06:10:19', '2024-01-04 06:10:19'),
(72, '123', '2024-01-10 11:09:53', '2024-01-10 11:09:53'),
(73, 'test', '2024-02-26 15:20:06', '2024-02-26 15:20:06'),
(74, 'MERN', '2024-04-05 16:08:25', '2024-04-05 16:08:25'),
(75, 'Next js', '2024-04-05 16:16:12', '2024-04-05 16:16:12'),
(76, 'JS', '2024-04-05 16:22:04', '2024-04-05 16:22:04'),
(77, '.net', '2024-04-05 16:22:13', '2024-04-05 16:22:13'),
(81, 'tel', '2024-05-15 09:10:32', '2024-05-15 09:10:32'),
(82, 'cabling', '2024-05-15 09:10:32', '2024-05-15 09:10:32'),
(83, 'POS', '2024-05-15 09:10:32', '2024-05-15 09:10:32');

-- --------------------------------------------------------

--
-- Table structure for table `skill_sub_categories`
--

DROP TABLE IF EXISTS `skill_sub_categories`;
CREATE TABLE IF NOT EXISTS `skill_sub_categories` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `skill_id` bigint NOT NULL DEFAULT '0',
  `skill_sub_name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `skill_sub_name` (`skill_sub_name`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `skill_sub_categories`
--

INSERT INTO `skill_sub_categories` (`id`, `skill_id`, `skill_sub_name`, `created_at`, `updated_at`) VALUES
(1, 1, 'Sub Skill 1', '2023-08-22 11:40:52', '2023-08-22 11:40:52'),
(2, 2, 'Sub Skill 2', '2023-08-22 11:41:25', '2023-08-22 11:41:25'),
(3, 5, 'Sub Skill 5', '2023-08-23 11:59:39', '2023-08-27 07:28:16'),
(5, 3, 'Sub Skill 3', '2023-08-27 07:33:11', '2023-08-27 07:33:11');

-- --------------------------------------------------------

--
-- Table structure for table `skill_sub_sub_categories`
--

DROP TABLE IF EXISTS `skill_sub_sub_categories`;
CREATE TABLE IF NOT EXISTS `skill_sub_sub_categories` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `skill_sub_sub_name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `skill_sub_id` bigint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `skill_sub_sub_name_unique` (`skill_sub_sub_name`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `skill_sub_sub_categories`
--

INSERT INTO `skill_sub_sub_categories` (`id`, `skill_sub_sub_name`, `skill_sub_id`, `created_at`, `updated_at`) VALUES
(1, 'Sub Sub Skill 1', 1, '2023-08-22 11:41:04', '2023-08-22 11:41:04'),
(2, 'Sub Sub Skill 2', 2, '2023-08-22 11:41:36', '2023-08-22 11:41:36'),
(3, 'Sub Sub Skill 5', 3, '2023-08-23 11:59:46', '2023-08-27 07:29:00'),
(5, 'Sub Sub Skill 3', 5, '2023-08-27 07:34:49', '2023-08-27 07:34:49');

-- --------------------------------------------------------

--
-- Table structure for table `subscribers`
--

DROP TABLE IF EXISTS `subscribers`;
CREATE TABLE IF NOT EXISTS `subscribers` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `email` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sub_tickets`
--

DROP TABLE IF EXISTS `sub_tickets`;
CREATE TABLE IF NOT EXISTS `sub_tickets` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `auth_id` bigint NOT NULL DEFAULT '0',
  `work_order_id` bigint NOT NULL DEFAULT '0',
  `tech_support_note` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sub_tickets`
--

INSERT INTO `sub_tickets` (`id`, `auth_id`, `work_order_id`, `tech_support_note`, `created_at`, `updated_at`) VALUES
(1, 34, 10, 'dfgd', '2023-12-24 06:12:22', '2023-12-24 06:12:22'),
(2, 34, 10, 'dsfds', '2023-12-24 06:33:21', '2023-12-24 06:33:21'),
(3, 34, 10, 'cisco router is not install', '2023-12-25 05:05:47', '2023-12-25 05:05:47'),
(4, 34, 10, 'dd', '2023-12-25 05:12:13', '2023-12-25 05:12:13'),
(5, 34, 11, 'kkk', '2023-12-25 07:11:00', '2023-12-25 07:11:00'),
(6, 35, 10, 'gfdtdyfghj', '2023-12-26 06:08:38', '2023-12-26 06:08:38'),
(7, 35, 10, 'fgfgfgh', '2023-12-26 07:45:42', '2023-12-26 07:45:42'),
(8, 35, 61, 'sss', '2023-12-27 05:41:46', '2023-12-27 05:41:46'),
(9, 35, 61, 'tttt', '2023-12-27 05:59:13', '2023-12-27 05:59:13'),
(10, 35, 61, 'fff', '2023-12-27 05:59:30', '2023-12-27 05:59:30'),
(11, 35, 61, 'rrrrrrrrrr', '2023-12-27 11:15:10', '2023-12-27 11:15:10'),
(12, 35, 61, 'yyyyy', '2023-12-27 11:15:35', '2023-12-27 11:15:35'),
(13, 34, 4, NULL, '2024-03-10 10:19:13', '2024-03-10 10:19:13'),
(14, 34, 4, NULL, '2024-03-10 10:19:16', '2024-03-10 10:19:16'),
(15, 34, 4, NULL, '2024-03-10 10:19:17', '2024-03-10 10:19:17'),
(16, 34, 4, NULL, '2024-03-10 10:19:19', '2024-03-10 10:19:19'),
(17, 34, 4, NULL, '2024-03-10 10:19:27', '2024-03-10 10:19:27'),
(18, 35, 4, 'r', '2024-03-10 10:34:08', '2024-03-10 10:34:08'),
(19, 36, 6, NULL, '2024-03-11 11:36:46', '2024-03-11 11:36:46'),
(20, 34, 4, 'gg', '2024-04-24 06:43:08', '2024-04-24 06:43:08'),
(21, 34, 4, NULL, '2024-04-24 06:43:35', '2024-04-24 06:43:35');

-- --------------------------------------------------------

--
-- Table structure for table `support_attachments`
--

DROP TABLE IF EXISTS `support_attachments`;
CREATE TABLE IF NOT EXISTS `support_attachments` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `support_message_id` int UNSIGNED DEFAULT NULL,
  `attachment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_messages`
--

DROP TABLE IF EXISTS `support_messages`;
CREATE TABLE IF NOT EXISTS `support_messages` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `support_ticket_id` int UNSIGNED NOT NULL DEFAULT '0',
  `admin_id` int UNSIGNED NOT NULL DEFAULT '0',
  `message` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `support_messages`
--

INSERT INTO `support_messages` (`id`, `support_ticket_id`, `admin_id`, `message`, `created_at`, `updated_at`) VALUES
(1, 1, 0, 'ABCD', '2024-03-11 11:04:52', '2024-03-11 11:04:52'),
(2, 1, 4, 'ok', '2024-03-11 11:15:06', '2024-03-11 11:15:06');

-- --------------------------------------------------------

--
-- Table structure for table `support_tickets`
--

DROP TABLE IF EXISTS `support_tickets`;
CREATE TABLE IF NOT EXISTS `support_tickets` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT '0',
  `name` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ticket` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0: Open, 1: Answered, 2: Replied, 3: Closed',
  `priority` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1 = Low, 2 = medium, 3 = heigh',
  `last_reply` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `support_tickets`
--

INSERT INTO `support_tickets` (`id`, `user_id`, `name`, `email`, `ticket`, `subject`, `status`, `priority`, `last_reply`, `created_at`, `updated_at`) VALUES
(1, 0, 'Shakil', 'shakil@gmail.com', '73926612', 'We need Software', 1, 2, '2024-03-11 17:15:06', '2024-03-11 11:04:50', '2024-03-11 11:15:06');

-- --------------------------------------------------------

--
-- Table structure for table `technicians`
--

DROP TABLE IF EXISTS `technicians`;
CREATE TABLE IF NOT EXISTS `technicians` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `technician_id` bigint UNSIGNED DEFAULT NULL,
  `review_id` bigint UNSIGNED DEFAULT NULL,
  `company_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'contains full address',
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `primary_contact_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `primary_contact` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cell_phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rate` json NOT NULL,
  `radius` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `travel_fee` decimal(10,3) NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `preference` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coi_file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `msa_file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nda_file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coi_expire_date` date DEFAULT NULL,
  `msa_expire_date` date DEFAULT NULL,
  `nda` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `terms` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `available` tinyint NOT NULL DEFAULT '1',
  `co_ordinates` point DEFAULT NULL,
  PRIMARY KEY (`id`)
) ;

--
-- Dumping data for table `technicians`
--

INSERT INTO `technicians` (`id`, `technician_id`, `review_id`, `company_name`, `address_data`, `email`, `primary_contact_email`, `phone`, `primary_contact`, `title`, `cell_phone`, `rate`, `radius`, `travel_fee`, `status`, `preference`, `coi_file`, `msa_file`, `nda_file`, `coi_expire_date`, `msa_expire_date`, `nda`, `terms`, `created_at`, `updated_at`, `available`, `co_ordinates`) VALUES
(1, 50001, NULL, 'Landry Mcgowan Trading', '{\"address\":\"Peck Travis LLC\",\"country\":\"United States\",\"city\":\"New York\",\"state\":\"NY\",\"zip_code\":\"10001\"}', 'sa27289@gmail.com', 'mojozuho@mailinator.com', '12345678', '123456', 'Allison Whitley Associates', '12345678', '24932', '90652', '24452.000', 'Inactive', 'No', NULL, NULL, NULL, '1990-06-02', '1974-02-27', 'No', '90', '2024-02-26 04:09:40', '2024-04-25 05:25:17', 1, NULL),
(2, 50002, NULL, 'Powers and Lester Trading', '{\"address\":\"Gallegos Hayden Traders\",\"country\":\"USA\",\"city\":\"New York\",\"state\":\"NY\",\"zip_code\":\"10001\"}', 'sa27289@gmail.com', 'farasaqit@mailinator.com', '234234', 'Glover and Fry Inc', 'Gentry Watts Plc', '32423423', '81417.0', '46020', '95755.000', 'Pending', 'No', NULL, NULL, NULL, '1979-04-03', '1980-10-23', 'No', '30', '2024-03-11 11:22:07', '2024-03-11 11:22:29', 1, NULL),
(3, 50003, NULL, 'Flores Conway Plc', '{\"address\":\"1627 Bayland St.\",\"country\":\"United States\",\"city\":\"Round Rock\",\"state\":\"TX\",\"zip_code\":\"78664\"}', 'wyzox@mailinator.com', 'naxaritu@mailinator.com', 'Ignacia Payne', 'Sylvester Strickland', 'Driscoll Davidson', 'Henry Cabrera', '32.0', '12', '39.000', 'Pending', 'No', NULL, NULL, NULL, '1977-12-06', '1991-04-13', 'No', '90', '2024-04-05 16:08:50', '2024-04-23 19:00:53', 1, NULL),
(4, 50004, 4, 'Flores Conway Plc', '{\"address\":\"1627 Bayland St.\",\"country\":\"United States\",\"city\":\"Round Rock\",\"state\":\"TX\",\"zip_code\":\"78664\"}', 'wyzox@mailinator.com', 'naxaritu@mailinator.com', 'Ignacia Payne', 'Sylvester Strickland', 'Driscoll Davidson', 'Henry Cabrera', '32.0', '12', '39.000', 'Pending', 'No', NULL, NULL, NULL, '1977-12-06', '1991-04-13', 'No', '90', '2024-04-05 16:08:55', '2024-04-05 16:16:58', 1, NULL),
(5, 50005, NULL, 'Allsystems Communication Group, Inc.', '{\"address\":\"1627 Bayland St.\",\"country\":\"United States\",\"city\":\"Round Rock\",\"state\":\"TX\",\"zip_code\":\"78664\"}', 'mike6103@aol.com', 'mike6103@aol.com', '9135993444', '4076940375', NULL, NULL, '58.0', '10', '58.000', 'Active', 'No', NULL, NULL, NULL, '2024-12-31', '2024-12-31', 'Yes', '30', '2024-04-23 14:44:51', '2024-04-23 14:44:51', 1, NULL),
(6, 50006, NULL, 'Centex Data Services', '{\"address\":\"1627 Bayland St.\",\"country\":\"United States\",\"city\":\"Round Rock\",\"state\":\"TX\",\"zip_code\":\"78664\"}', 'tchowdhury@techyeahinc.com', 'ralp@centex.com', '5124700871', 'Ralp', 'Owner', '5124700871', '60.0', '20', '60.000', 'Active', 'No', NULL, NULL, NULL, '2024-12-31', '2024-12-31', 'Yes', '30', '2024-04-23 14:47:51', '2024-04-23 16:34:36', 1, NULL),
(8, 50008, NULL, 'John Galt Communications, Inc.', '{\"address\":\"21734 Main St\",\"country\":\"USA\",\"city\":\"Hayward\",\"state\":\"CA\",\"zip_code\":94541}', 'andrew@JohnGaltCommunications.com', NULL, '(510) 914-6650', NULL, NULL, NULL, '[\"Std: 60.0 / 60.0\", \"OT: 90.0 / 90.0\", \"EM: 90.0 / 90.0\"]', '100', '50.000', 'Active', 'yes', NULL, NULL, NULL, '2021-10-23', '2021-10-23', 'yes', '45', '2024-05-15 09:10:32', '2024-05-15 09:10:32', 1, NULL),
(9, 50009, NULL, 'Everett Coil (Connect Technologies)', '{\"address\":\"8442 La Bounty Ct.\",\"country\":\"USA\",\"city\":\"Citrus Heights\",\"state\":\"CA\",\"zip_code\":95610}', 'connectech35@gmail.com', NULL, '(916) 290-3069', NULL, NULL, NULL, '[\"Std: 50.0 / 50.0\", \"EM: 60.0 / 60.0\", \"OT: 65.0 / 65.0\", \"S/H: 65.0 / 65.0\"]', '30', '100.000', 'Active', 'yes', NULL, NULL, NULL, '2020-10-30', '2023-10-24', 'yes', '70', '2024-05-15 09:10:32', '2024-05-15 09:10:32', 1, NULL),
(10, 50010, NULL, 'John Galt Communications, Inc.', '{\"address\":\"21734 Main St\",\"country\":\"USA\",\"city\":\"Hayward\",\"state\":\"CA\",\"zip_code\":94541}', 'andrew@JohnGaltCommunications.com', NULL, '(510) 914-6650', NULL, NULL, NULL, '[\"Std: 60.0 / 60.0\", \"OT: 90.0 / 90.0\", \"EM: 90.0 / 90.0\"]', '100', '50.000', 'Active', 'yes', NULL, NULL, NULL, '2021-10-23', '2021-10-23', 'yes', '45', '2024-05-15 09:17:40', '2024-05-15 09:17:40', 1, NULL),
(11, 50011, NULL, 'Everett Coil (Connect Technologies)', '{\"address\":\"8442 La Bounty Ct.\",\"country\":\"USA\",\"city\":\"Citrus Heights\",\"state\":\"CA\",\"zip_code\":95610}', 'connectech35@gmail.com', NULL, '(916) 290-3069', NULL, NULL, NULL, '[\"Std: 50.0 / 50.0\", \"EM: 60.0 / 60.0\", \"OT: 65.0 / 65.0\", \"S/H: 65.0 / 65.0\"]', '30', '100.000', 'Active', 'yes', NULL, NULL, NULL, '2020-10-30', '2023-10-24', 'yes', '70', '2024-05-15 09:17:40', '2024-05-15 09:17:40', 1, NULL),
(12, 50012, NULL, 'John Galt Communications, Inc.', '{\"address\":\"21734 Main St\",\"country\":\"USA\",\"city\":\"Hayward\",\"state\":\"CA\",\"zip_code\":94541}', 'andrew@JohnGaltCommunications.com', NULL, '(510) 914-6650', NULL, NULL, NULL, '{\"EM\": \"90.0\", \"OT\": \"90.0\", \"Std\": \"60.0\"}', '100', '50.000', 'Active', 'yes', NULL, NULL, NULL, '2021-10-23', '2021-10-23', 'yes', '45', '2024-05-15 09:22:09', '2024-05-15 09:22:09', 1, NULL),
(13, 50013, NULL, 'Everett Coil (Connect Technologies)', '{\"address\":\"8442 La Bounty Ct.\",\"country\":\"USA\",\"city\":\"Citrus Heights\",\"state\":\"CA\",\"zip_code\":95610}', 'connectech35@gmail.com', NULL, '(916) 290-3069', NULL, NULL, NULL, '{\"EM\": \"60.0\", \"OT\": \"65.0\", \"Std\": \"50.0\"}', '30', '100.000', 'Active', 'yes', NULL, NULL, NULL, '2020-10-30', '2023-10-24', 'yes', '70', '2024-05-15 09:22:09', '2024-05-15 09:22:09', 1, NULL),
(14, 50014, NULL, 'John Galt Communications, Inc.', '{\"address\":\"21734 Main St\",\"country\":\"USA\",\"city\":\"Hayward\",\"state\":\"CA\",\"zip_code\":94541}', 'andrew@JohnGaltCommunications.com', NULL, '(510) 914-6650', NULL, NULL, NULL, '{\"EM\": \"90.0\", \"OT\": \"90.0\", \"Std\": \"60.0\"}', '100', '50.000', 'Active', 'yes', NULL, NULL, NULL, '2021-10-23', '2021-10-23', 'yes', '45', '2024-05-15 09:23:39', '2024-05-15 09:23:39', 1, NULL),
(15, 50015, NULL, 'Everett Coil (Connect Technologies)', '{\"address\":\"8442 La Bounty Ct.\",\"country\":\"USA\",\"city\":\"Citrus Heights\",\"state\":\"CA\",\"zip_code\":95610}', 'connectech35@gmail.com', NULL, '(916) 290-3069', NULL, NULL, NULL, '{\"EM\": \"60.0\", \"OT\": \"65.0\", \"S/H\": \"65.0\", \"Std\": \"50.0\"}', '30', '100.000', 'Active', 'yes', NULL, NULL, NULL, '2020-10-30', '2023-10-24', 'yes', '70', '2024-05-15 09:23:39', '2024-05-15 09:23:39', 1, NULL),
(16, 50016, NULL, 'John Galt Communications, Inc.', '{\"address\":\"21734 Main St\",\"country\":\"USA\",\"city\":\"Hayward\",\"state\":\"CA\",\"zip_code\":94541}', 'andrew@JohnGaltCommunications.com', NULL, '(510) 914-6650', NULL, NULL, NULL, '{\"EM\": 90, \"OT\": 90, \"Std\": 60}', '100', '50.000', 'Active', 'yes', NULL, NULL, NULL, '2021-10-23', '2021-10-23', 'yes', '45', '2024-05-15 09:26:27', '2024-05-15 09:26:27', 1, NULL),
(17, 50017, NULL, 'Everett Coil (Connect Technologies)', '{\"address\":\"8442 La Bounty Ct.\",\"country\":\"USA\",\"city\":\"Citrus Heights\",\"state\":\"CA\",\"zip_code\":95610}', 'connectech35@gmail.com', NULL, '(916) 290-3069', NULL, NULL, NULL, '{\"EM\": 60, \"OT\": 65, \"S/H\": 65, \"Std\": 50}', '30', '100.000', 'Active', 'yes', NULL, NULL, NULL, '2020-10-30', '2023-10-24', 'yes', '70', '2024-05-15 09:26:27', '2024-05-15 09:26:27', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `technician_skills`
--

DROP TABLE IF EXISTS `technician_skills`;
CREATE TABLE IF NOT EXISTS `technician_skills` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `skill_id` bigint UNSIGNED NOT NULL,
  `technician_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `technician_skills_skill_id_foreign` (`skill_id`),
  KEY `technician_skills_technician_id_foreign` (`technician_id`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `technician_skills`
--

INSERT INTO `technician_skills` (`id`, `skill_id`, `technician_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL),
(2, 7, 1, NULL, NULL),
(3, 9, 1, NULL, NULL),
(4, 11, 1, NULL, NULL),
(5, 12, 1, NULL, NULL),
(6, 13, 1, NULL, NULL),
(7, 23, 1, NULL, NULL),
(8, 24, 1, NULL, NULL),
(9, 25, 1, NULL, NULL),
(10, 28, 1, NULL, NULL),
(11, 29, 1, NULL, NULL),
(12, 30, 1, NULL, NULL),
(13, 31, 1, NULL, NULL),
(14, 32, 1, NULL, NULL),
(15, 33, 1, NULL, NULL),
(16, 34, 1, NULL, NULL),
(17, 35, 1, NULL, NULL),
(18, 39, 1, NULL, NULL),
(19, 41, 1, NULL, NULL),
(20, 42, 1, NULL, NULL),
(21, 44, 1, NULL, NULL),
(22, 46, 1, NULL, NULL),
(23, 47, 1, NULL, NULL),
(24, 48, 1, NULL, NULL),
(25, 51, 1, NULL, NULL),
(26, 69, 1, NULL, NULL),
(27, 70, 1, NULL, NULL),
(28, 71, 1, NULL, NULL),
(29, 72, 1, NULL, NULL),
(30, 1, 2, NULL, NULL),
(31, 2, 2, NULL, NULL),
(32, 4, 2, NULL, NULL),
(33, 5, 3, NULL, NULL),
(34, 13, 3, NULL, NULL),
(35, 28, 3, NULL, NULL),
(36, 34, 3, NULL, NULL),
(37, 49, 3, NULL, NULL),
(38, 5, 4, NULL, NULL),
(39, 13, 4, NULL, NULL),
(40, 28, 4, NULL, NULL),
(41, 34, 4, NULL, NULL),
(42, 49, 4, NULL, NULL),
(43, 2, 5, NULL, NULL),
(44, 3, 5, NULL, NULL),
(45, 4, 5, NULL, NULL),
(46, 5, 6, NULL, NULL),
(50, 81, 8, NULL, NULL),
(51, 82, 8, NULL, NULL),
(52, 83, 8, NULL, NULL),
(53, 81, 9, NULL, NULL),
(54, 82, 9, NULL, NULL),
(55, 83, 9, NULL, NULL),
(56, 81, 10, NULL, NULL),
(57, 82, 10, NULL, NULL),
(58, 83, 10, NULL, NULL),
(59, 81, 11, NULL, NULL),
(60, 82, 11, NULL, NULL),
(61, 83, 11, NULL, NULL),
(62, 81, 12, NULL, NULL),
(63, 82, 12, NULL, NULL),
(64, 83, 12, NULL, NULL),
(65, 81, 13, NULL, NULL),
(66, 82, 13, NULL, NULL),
(67, 83, 13, NULL, NULL),
(68, 81, 14, NULL, NULL),
(69, 82, 14, NULL, NULL),
(70, 83, 14, NULL, NULL),
(71, 81, 15, NULL, NULL),
(72, 82, 15, NULL, NULL),
(73, 83, 15, NULL, NULL),
(74, 81, 16, NULL, NULL),
(75, 82, 16, NULL, NULL),
(76, 83, 16, NULL, NULL),
(77, 81, 17, NULL, NULL),
(78, 82, 17, NULL, NULL),
(79, 83, 17, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tech_distances`
--

DROP TABLE IF EXISTS `tech_distances`;
CREATE TABLE IF NOT EXISTS `tech_distances` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `tech_id` bigint NOT NULL,
  `destination_coordinates` point NOT NULL,
  `distance` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `duration` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `destination_address` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  SPATIAL KEY `destination_coordinates` (`destination_coordinates`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tech_distances`
--

INSERT INTO `tech_distances` (`id`, `tech_id`, `destination_coordinates`, `distance`, `duration`, `destination_address`, `created_at`, `updated_at`) VALUES
(1, 1, 0xe610000001010000007c992842eabc56c03cc32f50ad684440, '997.92 mi', '15 hours 8 mins', '1250E, Gladstone, Henderson County, Illinois, 61437, USA', '2024-04-05 15:57:42', '2024-04-05 15:57:42'),
(2, 2, 0xe610000001010000007c992842eabc56c03cc32f50ad684440, '997.92 mi', '15 hours 8 mins', '1250E, Gladstone, Henderson County, Illinois, 61437, USA', '2024-04-05 15:57:42', '2024-04-05 15:57:42'),
(3, 1, 0xe610000001010000007c992842eabc56c03cc32f50ad684440, '997.92 mi', '15 hours 8 mins', '1250E, Gladstone, Henderson County, Illinois, 61437, USA', '2024-04-05 15:57:53', '2024-04-05 15:57:53'),
(4, 2, 0xe610000001010000007c992842eabc56c03cc32f50ad684440, '997.92 mi', '15 hours 8 mins', '1250E, Gladstone, Henderson County, Illinois, 61437, USA', '2024-04-05 15:57:53', '2024-04-05 15:57:53'),
(5, 1, 0xe610000001010000000000000000405bc02a7fad0100804940, '2,149.32 mi', '1 day 9 hours', 'North America', '2024-04-05 15:58:10', '2024-04-05 15:58:10'),
(6, 2, 0xe610000001010000000000000000405bc02a7fad0100804940, '2,149.32 mi', '1 day 9 hours', 'North America', '2024-04-05 15:58:10', '2024-04-05 15:58:10'),
(7, 3, 0xe61000000101000000da5f2cc283c253c0bef15aae23d64140, '393.33 mi', '5 hours 55 mins', 'North Carolina, USA', '2024-04-05 16:09:44', '2024-04-05 16:09:44'),
(8, 1, 0xe61000000101000000da5f2cc283c253c0bef15aae23d64140, '515.74 mi', '7 hours 56 mins', 'North Carolina, USA', '2024-04-05 16:09:44', '2024-04-05 16:09:44'),
(9, 2, 0xe61000000101000000da5f2cc283c253c0bef15aae23d64140, '515.74 mi', '7 hours 56 mins', 'North Carolina, USA', '2024-04-05 16:09:44', '2024-04-05 16:09:44'),
(10, 3, 0xe610000001010000000000000000405bc02a7fad0100804940, '2,081.59 mi', '1 day 7 hours', 'North America', '2024-04-05 16:17:46', '2024-04-05 16:17:46'),
(11, 1, 0xe610000001010000000000000000405bc02a7fad0100804940, '2,149.32 mi', '1 day 9 hours', 'North America', '2024-04-05 16:17:46', '2024-04-05 16:17:46'),
(12, 2, 0xe610000001010000000000000000405bc02a7fad0100804940, '2,149.32 mi', '1 day 9 hours', 'North America', '2024-04-05 16:17:46', '2024-04-05 16:17:46');

-- --------------------------------------------------------

--
-- Table structure for table `ticket_notes`
--

DROP TABLE IF EXISTS `ticket_notes`;
CREATE TABLE IF NOT EXISTS `ticket_notes` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `work_order_id` bigint NOT NULL DEFAULT '0',
  `auth_id` bigint NOT NULL DEFAULT '0',
  `general_notes` text COLLATE utf8mb4_unicode_ci,
  `dispatch_notes` text COLLATE utf8mb4_unicode_ci,
  `billing_notes` text COLLATE utf8mb4_unicode_ci,
  `tech_support_notes` text COLLATE utf8mb4_unicode_ci,
  `close_out_notes` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ticket_notes`
--

INSERT INTO `ticket_notes` (`id`, `work_order_id`, `auth_id`, `general_notes`, `dispatch_notes`, `billing_notes`, `tech_support_notes`, `close_out_notes`, `created_at`, `updated_at`) VALUES
(1, 1, 34, NULL, '<p>zdas</p>', NULL, NULL, NULL, '2024-02-27 04:51:02', '2024-02-27 04:51:02'),
(2, 4, 35, '<p>nghjghjfgng</p>', NULL, NULL, NULL, NULL, '2024-03-10 10:37:52', '2024-03-10 10:37:52'),
(3, 4, 35, '<p>nghjghjfgng</p>', NULL, NULL, NULL, NULL, '2024-03-10 10:39:37', '2024-03-10 10:39:37'),
(4, 4, 35, '<p>nghjghjfgng</p>', NULL, NULL, NULL, NULL, '2024-03-10 10:40:08', '2024-03-10 10:40:08'),
(5, 4, 35, '<p>nghjghjfgng</p>', NULL, NULL, NULL, NULL, '2024-03-10 10:41:13', '2024-03-10 10:41:13'),
(6, 4, 35, '<p>nghjghjfgng</p>', NULL, NULL, NULL, NULL, '2024-03-10 10:41:44', '2024-03-10 10:41:44'),
(7, 4, 35, 'cccccccccccccc', NULL, NULL, NULL, NULL, '2024-03-10 11:14:04', '2024-03-10 11:14:04'),
(8, 4, 35, NULL, 'aaaaaaaa', NULL, NULL, NULL, '2024-03-10 11:14:28', '2024-03-10 11:14:28'),
(9, 4, 35, NULL, NULL, 'sssssssssssss', NULL, NULL, '2024-03-10 11:14:52', '2024-03-10 11:14:52'),
(10, 34, 34, 'Test....test ....test', NULL, NULL, NULL, NULL, '2024-04-23 16:19:29', '2024-04-23 16:19:29'),
(11, 34, 34, NULL, 'Check to see if Ralp is available, if not send someone else.', NULL, NULL, NULL, '2024-04-23 16:20:00', '2024-04-23 16:20:00'),
(12, 40, 34, 'test', NULL, NULL, NULL, NULL, '2024-04-24 06:46:11', '2024-04-24 06:46:11'),
(13, 6, 34, NULL, NULL, NULL, NULL, 'Tech worked with Sean to complete the scope.', '2024-04-25 17:27:35', '2024-04-25 17:27:35');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
CREATE TABLE IF NOT EXISTS `transactions` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int UNSIGNED NOT NULL DEFAULT '0',
  `amount` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `charge` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `post_balance` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `trx_type` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trx` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remark` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `user_id`, `amount`, `charge`, `post_balance`, `trx_type`, `trx`, `details`, `remark`, `created_at`, `updated_at`) VALUES
(1, 8, '100.00000000', '2.00000000', '15277.55755565', '+', '7A27BS2YJXEW', 'Deposit Via Mollie - USD', 'deposit', '2023-02-13 07:57:29', '2023-02-13 07:57:29');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `firstname` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_code` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ref_by` int UNSIGNED NOT NULL DEFAULT '0',
  `balance` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci COMMENT 'contains full address',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0: banned, 1: active',
  `kyc_data` text COLLATE utf8mb4_unicode_ci,
  `kv` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0: KYC Unverified, 2: KYC pending, 1: KYC verified',
  `ev` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0: email unverified, 1: email verified',
  `sv` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0: mobile unverified, 1: mobile verified',
  `profile_complete` tinyint(1) NOT NULL DEFAULT '0',
  `ver_code` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'stores verification code',
  `ver_code_send_at` datetime DEFAULT NULL COMMENT 'verification send time',
  `ts` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0: 2fa off, 1: 2fa on',
  `tv` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0: 2fa unverified, 1: 2fa verified',
  `tsc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ban_reason` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role_id` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0: customers\r\n1: field technician\r\n',
  `remember_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`,`email`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `username`, `email`, `country_code`, `mobile`, `ref_by`, `balance`, `password`, `address`, `status`, `kyc_data`, `kv`, `ev`, `sv`, `profile_complete`, `ver_code`, `ver_code_send_at`, `ts`, `tv`, `tsc`, `ban_reason`, `role_id`, `remember_token`, `created_at`, `updated_at`) VALUES
(8, 'User', 'Name', 'username', 'user@site.com', 'BD', '88000000000', 0, '15277.55755565', '$2y$10$ypEy3pTovxha0XZk297x6eEUD3RQUer/rpwnz8PA9TfuOpJkuoTFS', '{\"address\":\"London\",\"city\":\"London\",\"state\":\"London\",\"zip\":\"5874\",\"country\":\"Bangladesh\"}', 1, NULL, 1, 1, 1, 1, '627119', '2022-11-05 12:13:08', 0, 1, 'YNVYOV26WPXRG47L', NULL, 0, '7DMbeXmUqvA2Ub940DBBgKNNNJQNkkBLeTGKED8qVs2kXHu4SzGpeo4lEyWC', '2020-07-25 00:40:06', '2023-02-13 07:57:29'),
(9, 'User', 'Name', 'username2', 'user2@site.com', 'PK', '8805646546987', 0, '0.00000000', '$2y$10$kvu.xRlHv32YheJWV3NWneQR0vPIA5Eev01jUjQeieHQDJSE1XXs.', '{\"address\":\"\",\"state\":\"\",\"zip\":\"\",\"country\":\"Antigua and Barbuda\",\"city\":\"\"}', 1, NULL, 0, 1, 1, 0, '217802', '2020-11-19 10:18:39', 0, 1, NULL, NULL, 0, NULL, '2020-11-19 04:18:38', '2020-11-19 04:19:44'),
(11, 'user44', 'name44', 'username3', 'user457@site.com', 'US', '65659854857', 0, '0.00000000', '$2y$10$UD7lj91bK2SK0CEqtIi/s.XZKh8Wm.ajz1DimEuoDBLiNAE29zY7a', '{\"address\":\"Address\",\"city\":\"FFF\",\"state\":\"7878\",\"zip\":\"5874\",\"country\":\"Algeria\"}', 1, NULL, 0, 1, 1, 0, '112922', '2020-11-23 12:45:44', 0, 1, NULL, NULL, 0, NULL, '2020-11-23 06:45:43', '2021-01-04 00:03:31'),
(13, 'KB', 'Zaman', 'testuser123', 'testuser123@gmail.com', 'LT', '1268654254541', 0, '1180.00000000', '$2y$10$0TizysQNL9Yw6DYOji5Eh.mrstho4NhuVam7ssaCYS0Y9JegnopZG', '{\"address\":\"Dhaka\",\"city\":\"Dhaka\",\"state\":\"Dhaka\",\"zip\":\"1230\",\"country\":\"Lithuania\"}', 1, NULL, 0, 1, 1, 0, '950194', '2021-03-15 09:35:45', 0, 1, NULL, NULL, 0, NULL, '2021-03-15 03:35:45', '2021-05-05 09:33:22'),
(17, 'Test', 'User', 'testuser55', 'user990@site.com', 'BD', '93654545453', 0, '0.00000000', '$2y$10$bV6Mi/8uv/MirSHWtn8qz.txLfzvSaovndD.GPCoCaHD8UK/bdJOi', '{\"address\":\"\",\"state\":\"\",\"zip\":\"\",\"country\":\"Afghanistan\",\"city\":\"\"}', 1, NULL, 0, 0, 1, 0, '439780', '2021-04-17 07:17:26', 0, 1, NULL, NULL, 0, NULL, '2021-04-17 01:17:26', '2021-05-02 05:37:53'),
(18, 'User', 'Name', 'username99', 'user99@site.com', 'AZ', '99496565654', 0, '0.00000000', '$2y$10$jbMEuGQ/U.gTPihO4jfBD.wnnWgZNyhj3n2VUkp0V2LOaGau6HbF6', '{\"address\":null,\"city\":null,\"state\":null,\"zip\":null,\"country\":\"Bangladesh\"}', 1, NULL, 0, 0, 1, 0, '404482', '2021-04-28 06:41:42', 0, 1, NULL, NULL, 0, NULL, '2021-04-28 00:41:42', '2021-05-04 13:53:22'),
(19, 'My', 'Name', 'username5', 'user5@site.com', 'AF', '9365465456454', 0, '0.00000000', '$2y$10$.tD1XpK.E4ubM4Pg3yEuYO3tzMasHqd2pzsRjm8nGYKhIwxTmNI/2', '{\"address\":\"\",\"state\":\"\",\"zip\":\"\",\"country\":\"Afghanistan\",\"city\":\"\"}', 1, NULL, 0, 1, 1, 0, NULL, NULL, 0, 1, NULL, NULL, 0, NULL, '2021-05-10 06:24:07', '2021-05-10 06:24:14'),
(20, 'My', 'Name', 'username6', 'user6@site.com', 'AD', '936546334', 8, '10010.00000000', '$2y$10$0BuEBEfe82oTukY9BFrODeFP9d4sS7KJdoHBPk1oziRkKAC/D8VOi', '{\"address\":\"Bangladesh\",\"city\":\"Dhaka\",\"state\":\"Dhaka\",\"zip\":\"1230\",\"country\":\"Andorra\"}', 1, NULL, 0, 1, 1, 0, NULL, NULL, 1, 1, 'FSLM3BZVLNPY7JYI', NULL, 0, NULL, '2021-05-10 06:27:04', '2021-05-18 05:23:15'),
(22, 'Test', 'Name', 'testuser', 'test@mail.com', 'AU', '6165463548554', 0, '0.00000000', '$2y$10$OhSvy7ncR6dBuhTnUvmiXuJRjpLfjWtZdE2uYKx/P46lJoZ00omfC', '{\"address\":null,\"city\":null,\"state\":null,\"zip\":null,\"country\":\"Australia\"}', 1, NULL, 0, 0, 1, 0, NULL, NULL, 0, 1, NULL, NULL, 0, NULL, '2021-05-19 05:47:02', '2022-04-04 05:16:38'),
(23, 'My', 'Name', 'myname5587', 'myname5587@myname5587.myname5587', 'AI', '1264123456789', 0, '0.00000000', '$2y$10$19byGz10jEXEQDxsoLTrMug4qYnuzT9O3S4.o0w8YN72mruuGh.8m', '{\"address\":\"\",\"state\":\"\",\"zip\":\"\",\"country\":\"Anguilla\",\"city\":\"\"}', 1, NULL, 0, 0, 1, 0, '467842', '2021-06-09 12:15:34', 0, 1, NULL, NULL, 0, NULL, '2021-06-09 06:15:33', '2021-06-09 06:15:34'),
(24, 'Mosta', 'fizz', 'mostasproject', 'mosta@gmail.com', 'BD', '88001628071671', 0, '0.00000000', '$2y$10$hv5l/n1.Y2WcQGPM13NR5uuditJgwr89jHnZabxyz738pf5MFxc5i', '{\"address\":\"\",\"state\":\"\",\"zip\":\"\",\"country\":\"Bangladesh\",\"city\":\"\"}', 1, NULL, 0, 1, 1, 0, NULL, NULL, 0, 1, NULL, NULL, 0, NULL, '2021-06-10 05:31:54', '2021-06-10 12:39:55'),
(25, NULL, NULL, 'mostasproject2', 'mostas@gmail.com', 'BD', '88001628071672', 0, '0.00000000', '$2y$10$6VyFIftVzo9o4Mx.pHRCQOTUgOdWMMbLUHYhNfjRdVHHmTHrjHn9a', '{\"address\":\"\",\"state\":\"\",\"zip\":\"\",\"country\":\"Bangladesh\",\"city\":\"\"}', 1, NULL, 0, 0, 1, 0, NULL, NULL, 0, 1, NULL, NULL, 0, NULL, '2021-06-10 05:35:17', '2021-06-10 05:35:17'),
(26, NULL, NULL, 'mostasproject3', 'mosta3@gmail.com', 'BD', '88001628071673', 0, '0.00000000', '$2y$10$zP92objty3B6R/k9A4FIs.vT4SUXQGDgFIIwCK//3dpnp0s6Xr/aW', '{\"address\":\"\",\"state\":\"\",\"zip\":\"\",\"country\":\"Bangladesh\",\"city\":\"\"}', 1, NULL, 0, 0, 1, 0, NULL, NULL, 0, 1, NULL, NULL, 0, NULL, '2021-06-10 08:38:28', '2021-06-10 08:38:28'),
(27, 'Test', 'User', 'testuser5588', 'testuser5588@gmail.com', 'AF', '59154685458', 0, '0.00000000', '$2y$10$bnERS5Za.TVGNxb89ttI2eIc10.kDEXK8hTkUS5Ob7sKpN7N8vRHa', '{\"address\":null,\"city\":null,\"state\":null,\"zip\":null,\"country\":\"Afghanistan\"}', 1, NULL, 0, 1, 1, 0, '994511', '2022-03-06 11:53:38', 1, 0, NULL, NULL, 0, NULL, '2021-06-12 05:27:14', '2022-03-10 07:25:03'),
(28, 'Shelly', 'Morales', 'fajavidi', 'gasaf@amimail.com', 'DZ', '213Accusamus at et rati', 0, '0.00000000', '$2y$10$LYPdpUJDnCfG7MXUF0ydaOX5ESI6dLrjlrnh9QJ0YgaJdRSPMs9HS', '{\"address\":\"\",\"state\":\"\",\"zip\":\"\",\"country\":\"Algeria\",\"city\":\"\"}', 1, NULL, 0, 1, 1, 0, '210333', '2022-03-17 09:09:59', 0, 1, NULL, NULL, 0, NULL, '2022-03-17 03:09:58', '2022-03-21 01:07:58'),
(29, 'Hermione', 'Walter', 'wykyfucywe', 'fyjify@amimail.com', 'KN', '18695946542145', 0, '200.00000000', '$2y$10$5iSye35hvir6jdd1nMx5/elcysmkvfrTFCfK0MLV5nb9QsA2Q7ury', '{\"country\":\"Saint Kitts and Nevis\",\"address\":\"Neque magni qui eu i\",\"state\":\"Cum sit hic molesti\",\"zip\":\"79770\",\"city\":\"Dolorem doloremque p\"}', 1, '[{\"name\":\"Full Name\",\"type\":\"text\",\"value\":\"Amethyst Alston\"},{\"name\":\"NID Number\",\"type\":\"text\",\"value\":\"446\"},{\"name\":\"Gender\",\"type\":\"select\",\"value\":\"Others\"},{\"name\":\"You Hobby\",\"type\":\"checkbox\",\"value\":[\"Programming\",\"Traveling\"]},{\"name\":\"NID Photo\",\"type\":\"file\",\"value\":\"2022\\/12\\/13\\/63988181737f81670939009.png\"}]', 2, 1, 1, 1, NULL, NULL, 0, 1, NULL, NULL, 0, NULL, '2022-03-21 02:41:54', '2022-12-13 11:13:31'),
(30, 'Herrod', 'Parrish', 'kyvyqujyj', 'fevu@amimail.com', 'CO', '5736564684', 0, '0.00000000', '$2y$10$tw6Ppdztjt6WbFA61GYHAuvnUl4zI3j2jMcMGp8UVMzHF32ACWCjG', '{\"country\":\"Colombia\",\"address\":\"Vitae labore iure es\",\"state\":\"Sunt nisi et enim vo\",\"zip\":\"82702\",\"city\":\"In vel aspernatur si\"}', 1, NULL, 1, 1, 1, 1, NULL, NULL, 0, 1, NULL, NULL, 0, NULL, '2022-03-22 07:53:20', '2022-03-22 08:09:45'),
(31, NULL, NULL, 'username236', 'user879@gmail.com', 'BD', '88058745455754', 0, '0.00000000', '$2y$10$M.ZMRFlWUCWXh3cb2htccuNxAG48bU6Q9PAqeHgXG4esiS82rWvM2', '{\"address\":\"\",\"state\":\"\",\"zip\":\"\",\"country\":\"Bangladesh\",\"city\":\"\"}', 1, NULL, 1, 0, 1, 0, NULL, NULL, 0, 1, NULL, NULL, 0, NULL, '2022-03-22 11:22:57', '2022-03-22 11:22:57'),
(32, NULL, NULL, 'tagoqaz_name', 'hajehefa@amimail.com', 'AF', '938000000', 0, '0.00000000', '$2y$10$8JVTIVkKfuPs/W4ghFZSqOdr0vpDAr/9aAs.Mz5ZwR/eh4.h2qE0m', '{\"address\":\"\",\"state\":\"\",\"zip\":\"\",\"country\":\"Afghanistan\",\"city\":\"\"}', 1, NULL, 1, 0, 1, 0, '207488', '2022-05-25 19:03:03', 0, 1, NULL, NULL, 0, NULL, '2022-05-25 13:03:03', '2022-05-25 13:03:03'),
(33, NULL, NULL, 'username2360', 'user8790@gmail.com', 'BD', '880587454557540', 0, '0.00000000', '$2y$10$zz5jvSYHb7R0gAPwJOk.COwydOpgma01.iFGuGxSAiUjq8UGWV4Rm', '{\"address\":\"\",\"state\":\"\",\"zip\":\"\",\"country\":\"Bangladesh\",\"city\":\"\"}', 1, NULL, 1, 0, 1, 0, NULL, NULL, 0, 1, NULL, NULL, 0, NULL, '2022-09-29 06:59:30', '2022-09-29 06:59:30'),
(34, 'Shakil', 'Ahmed', 'shakil01', 'shakil@gmail.com', 'BD', '8801720972180', 0, '0.00000000', '$2y$10$DcHqATSHomEs6oeZTN4Bi./tc3nBBFI99lo9PiSzN7zcIXNs4HKqq', '{\"country\":\"Bangladesh\",\"address\":\"Uttara\",\"state\":\"Uttara\",\"zip\":\"1230\",\"city\":\"Dhaka\"}', 1, NULL, 1, 1, 1, 1, NULL, NULL, 0, 1, NULL, NULL, 0, 'eWnVjN1bib7TDJiCiVIQoH1WvN3bbL9HamEOhLRsABOqimaZS1BMCzf9Bhj0', '2023-11-26 07:25:59', '2023-11-26 07:27:05'),
(35, 'Md. Hasibur', 'Rahman', 'shajid121', 'shajid.hasibur1996@gmail.com', 'BD', '88021548484784', 0, '0.00000000', '$2y$10$uHlcA7/ITLzNXv1jIb1TWeqw21fRpweeV7GJDSYw8fZIga2qqUNMe', '{\"country\":\"Bangladesh\",\"address\":\"uttara\",\"state\":\"Dhaka\",\"zip\":\"1230\",\"city\":\"uttara\"}', 1, NULL, 1, 1, 1, 1, NULL, NULL, 0, 1, NULL, NULL, 0, NULL, '2023-12-04 05:52:11', '2023-12-04 05:53:17'),
(36, 'Aimee', 'Garrison', 'xacaqysem', 'suda@mailinator.com', 'KW', '96549590', 0, '0.00000000', '$2y$10$2gZK9pJXr6X1dZ1rVh8RpOXHUF2SGJBNudhw4kckjEWMzWUt4JacO', '{\"country\":\"Kuwait\",\"address\":\"Mejia and French Co\",\"state\":\"Beard and Church LLC\",\"zip\":\"Alford Giles Associates\",\"city\":\"Shepherd and Shaffer Plc\"}', 1, NULL, 1, 1, 1, 1, NULL, NULL, 0, 1, NULL, NULL, 0, NULL, '2023-12-04 06:20:10', '2023-12-04 06:21:48');

-- --------------------------------------------------------

--
-- Table structure for table `user_logins`
--

DROP TABLE IF EXISTS `user_logins`;
CREATE TABLE IF NOT EXISTS `user_logins` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int UNSIGNED NOT NULL DEFAULT '0',
  `user_ip` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_code` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `browser` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `os` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=389 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_logins`
--

INSERT INTO `user_logins` (`id`, `user_id`, `user_ip`, `city`, `country`, `country_code`, `longitude`, `latitude`, `browser`, `os`, `created_at`, `updated_at`) VALUES
(14, 8, '::1', 'Dhaka', 'Bangladesh', 'BD', '17.057', '56.56', 'Chrome', 'Windows 10', '2020-11-22 00:52:36', '2020-11-22 00:52:36'),
(15, 8, '::1', NULL, NULL, '', '', '', NULL, NULL, '2020-11-22 00:52:50', '2020-11-22 00:52:50'),
(16, 8, '::1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2020-11-22 00:58:16', '2020-11-22 00:58:16'),
(17, 8, '::1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2020-11-22 00:58:41', '2020-11-22 00:58:41'),
(18, 8, '::1', NULL, '', '', '', '', 'Firefox', 'Windows 10', '2020-11-22 00:59:30', '2020-11-22 00:59:30'),
(19, 11, '::1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2020-11-23 06:45:43', '2020-11-23 06:45:43'),
(20, 8, '::1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2020-12-24 05:10:34', '2020-12-24 05:10:34'),
(21, 8, '127.0.0.1', NULL, '', '', '', '', 'Firefox', 'Windows 10', '2020-12-24 05:12:16', '2020-12-24 05:12:16'),
(22, 8, '127.0.0.1', NULL, '', '', '', '', 'Firefox', 'Windows 10', '2020-12-24 05:13:40', '2020-12-24 05:13:40'),
(23, 8, '::1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2020-12-28 02:46:17', '2020-12-28 02:46:17'),
(24, 8, '::1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2020-12-29 02:31:30', '2020-12-29 02:31:30'),
(25, 8, '::1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2021-01-02 23:32:38', '2021-01-02 23:32:38'),
(26, 8, '::1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2021-01-03 04:39:14', '2021-01-03 04:39:14'),
(27, 8, '::1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2021-01-03 23:32:07', '2021-01-03 23:32:07'),
(28, 8, '::1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2021-01-17 03:02:58', '2021-01-17 03:02:58'),
(29, 8, '::1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2021-01-31 06:56:02', '2021-01-31 06:56:02'),
(30, 8, '::1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2021-02-13 06:23:32', '2021-02-13 06:23:32'),
(31, 8, '::1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2021-03-04 01:46:06', '2021-03-04 01:46:06'),
(32, 8, '::1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2021-03-04 02:40:51', '2021-03-04 02:40:51'),
(33, 8, '::1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2021-03-04 02:52:25', '2021-03-04 02:52:25'),
(34, 8, '::1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2021-03-06 00:38:14', '2021-03-06 00:38:14'),
(36, 8, '::1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2021-03-06 23:51:07', '2021-03-06 23:51:07'),
(37, 8, '::1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2021-03-07 00:11:05', '2021-03-07 00:11:05'),
(38, 8, '::1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2021-03-07 00:13:36', '2021-03-07 00:13:36'),
(39, 8, '::1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2021-03-07 00:13:59', '2021-03-07 00:13:59'),
(40, 8, '::1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2021-03-07 00:14:12', '2021-03-07 00:14:12'),
(41, 8, '::1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2021-03-07 00:14:24', '2021-03-07 00:14:24'),
(42, 8, '::1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2021-03-07 00:17:31', '2021-03-07 00:17:31'),
(43, 8, '::1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2021-03-07 00:17:56', '2021-03-07 00:17:56'),
(44, 8, '127.0.0.1', NULL, '', '', '', '', 'Firefox', 'Windows 10', '2021-03-08 01:04:19', '2021-03-08 01:04:19'),
(45, 8, '::1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2021-03-08 01:05:03', '2021-03-08 01:05:03'),
(46, 8, '127.0.0.1', NULL, '', '', '', '', 'Firefox', 'Windows 10', '2021-03-08 01:05:45', '2021-03-08 01:05:45'),
(47, 8, '::1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2021-03-09 06:31:16', '2021-03-09 06:31:16'),
(48, 8, '::1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2021-03-14 05:29:21', '2021-03-14 05:29:21'),
(49, 8, '::1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2021-03-14 07:47:37', '2021-03-14 07:47:37'),
(50, 8, '::1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2021-03-15 01:04:33', '2021-03-15 01:04:33'),
(51, 8, '::1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2021-03-15 03:29:51', '2021-03-15 03:29:51'),
(52, 8, '::1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2021-03-15 03:32:22', '2021-03-15 03:32:22'),
(53, 13, '::1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2021-03-15 03:35:45', '2021-03-15 03:35:45'),
(54, 8, '::1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2021-03-15 23:37:22', '2021-03-15 23:37:22'),
(55, 8, '::1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2021-03-16 04:35:36', '2021-03-16 04:35:36'),
(59, 8, '::1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2021-03-18 00:13:32', '2021-03-18 00:13:32'),
(60, 8, '::1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2021-03-18 06:03:56', '2021-03-18 06:03:56'),
(61, 8, '::1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2021-03-22 09:28:04', '2021-03-22 09:28:04'),
(62, 8, '::1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2021-03-30 00:16:44', '2021-03-30 00:16:44'),
(63, 17, '::1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2021-04-17 01:17:26', '2021-04-17 01:17:26'),
(64, 8, '::1', NULL, '', '', '', '', 'Unknown Browser', 'Unknown OS Platform', '2021-04-19 02:41:01', '2021-04-19 02:41:01'),
(65, 18, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2021-04-28 00:41:42', '2021-04-28 00:41:42'),
(66, 8, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2021-04-28 23:03:35', '2021-04-28 23:03:35'),
(67, 8, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2021-05-01 22:24:42', '2021-05-01 22:24:42'),
(68, 8, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2021-05-02 08:07:35', '2021-05-02 08:07:35'),
(69, 8, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2021-05-02 09:02:14', '2021-05-02 09:02:14'),
(70, 8, '::1', 'Dhaka', 'Bangladesh', 'BD', '17.057', '56.56', 'Unknown Browser', 'Unknown OS Platform', '2021-05-03 08:56:35', '2021-05-03 08:56:35'),
(71, 8, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2021-05-03 10:01:43', '2021-05-03 10:01:43'),
(72, 8, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2021-05-03 10:38:50', '2021-05-03 10:38:50'),
(73, 8, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2021-05-04 04:04:50', '2021-05-04 04:04:50'),
(74, 8, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2021-05-04 06:51:42', '2021-05-04 06:51:42'),
(75, 8, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2021-05-04 10:15:58', '2021-05-04 10:15:58'),
(76, 8, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2021-05-04 10:26:29', '2021-05-04 10:26:29'),
(77, 8, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2021-05-04 14:42:41', '2021-05-04 14:42:41'),
(78, 8, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2021-05-05 00:21:23', '2021-05-05 00:21:23'),
(79, 8, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2021-05-05 07:36:31', '2021-05-05 07:36:31'),
(80, 8, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2021-05-05 09:50:53', '2021-05-05 09:50:53'),
(81, 8, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2021-05-05 10:11:18', '2021-05-05 10:11:18'),
(82, 8, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2021-05-07 03:49:58', '2021-05-07 03:49:58'),
(83, 8, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2021-05-07 05:55:44', '2021-05-07 05:55:44'),
(84, 8, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2021-05-07 07:31:48', '2021-05-07 07:31:48'),
(85, 8, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2021-05-07 08:06:54', '2021-05-07 08:06:54'),
(86, 8, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2021-05-08 04:09:24', '2021-05-08 04:09:24'),
(87, 8, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2021-05-08 04:25:42', '2021-05-08 04:25:42'),
(88, 8, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2021-05-08 04:27:02', '2021-05-08 04:27:02'),
(89, 8, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2021-05-08 09:45:25', '2021-05-08 09:45:25'),
(90, 8, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2021-05-10 04:54:10', '2021-05-10 04:54:10'),
(91, 8, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2021-05-10 06:02:08', '2021-05-10 06:02:08'),
(92, 8, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2021-05-10 06:11:16', '2021-05-10 06:11:16'),
(93, 8, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2021-05-10 06:11:30', '2021-05-10 06:11:30'),
(94, 19, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2021-05-10 06:24:07', '2021-05-10 06:24:07'),
(95, 20, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2021-05-10 06:27:04', '2021-05-10 06:27:04'),
(96, 8, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2021-05-10 06:58:32', '2021-05-10 06:58:32'),
(97, 8, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2021-05-11 07:34:32', '2021-05-11 07:34:32'),
(98, 8, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2021-05-18 06:30:15', '2021-05-18 06:30:15'),
(99, 8, '127.0.0.1', NULL, '', '', '', '', 'Unknown Browser', 'Unknown OS Platform', '2021-05-18 07:10:00', '2021-05-18 07:10:00'),
(100, 8, '127.0.0.1', NULL, '', '', '', '', 'Unknown Browser', 'Unknown OS Platform', '2021-05-18 07:11:42', '2021-05-18 07:11:42'),
(101, 8, '127.0.0.1', NULL, '', '', '', '', 'Unknown Browser', 'Unknown OS Platform', '2021-05-18 08:24:25', '2021-05-18 08:24:25'),
(102, 8, '127.0.0.1', NULL, '', '', '', '', 'Unknown Browser', 'Unknown OS Platform', '2021-05-18 09:00:03', '2021-05-18 09:00:03'),
(103, 8, '127.0.0.1', NULL, '', '', '', '', 'Unknown Browser', 'Unknown OS Platform', '2021-05-18 09:10:28', '2021-05-18 09:10:28'),
(104, 8, '127.0.0.1', NULL, '', '', '', '', 'Unknown Browser', 'Unknown OS Platform', '2021-05-18 09:11:20', '2021-05-18 09:11:20'),
(105, 8, '127.0.0.1', NULL, '', '', '', '', 'Unknown Browser', 'Unknown OS Platform', '2021-05-18 09:22:20', '2021-05-18 09:22:20'),
(106, 8, '127.0.0.1', NULL, '', '', '', '', 'Unknown Browser', 'Unknown OS Platform', '2021-05-18 09:48:40', '2021-05-18 09:48:40'),
(107, 8, '127.0.0.1', NULL, '', '', '', '', 'Unknown Browser', 'Unknown OS Platform', '2021-05-18 09:56:02', '2021-05-18 09:56:02'),
(108, 8, '127.0.0.1', NULL, '', '', '', '', 'Unknown Browser', 'Unknown OS Platform', '2021-05-18 10:02:24', '2021-05-18 10:02:24'),
(109, 8, '127.0.0.1', NULL, '', '', '', '', 'Unknown Browser', 'Unknown OS Platform', '2021-05-18 11:02:35', '2021-05-18 11:02:35'),
(110, 8, '127.0.0.1', NULL, '', '', '', '', 'Unknown Browser', 'Unknown OS Platform', '2021-05-18 11:16:00', '2021-05-18 11:16:00'),
(111, 8, '127.0.0.1', NULL, '', '', '', '', 'Unknown Browser', 'Unknown OS Platform', '2021-05-18 11:26:43', '2021-05-18 11:26:43'),
(112, 8, '192.168.30.113', '', '', '', '', '', 'Unknown Browser', 'Unknown OS Platform', '2021-05-18 11:46:21', '2021-05-18 11:46:21'),
(113, 8, '192.168.30.108', '', '', '', '', '', 'Unknown Browser', 'Unknown OS Platform', '2021-05-18 11:48:56', '2021-05-18 11:48:56'),
(114, 8, '127.0.0.1', NULL, '', '', '', '', 'Unknown Browser', 'Unknown OS Platform', '2021-05-18 11:50:45', '2021-05-18 11:50:45'),
(115, 8, '127.0.0.1', NULL, '', '', '', '', 'Unknown Browser', 'Unknown OS Platform', '2021-05-18 11:58:17', '2021-05-18 11:58:17'),
(116, 8, '127.0.0.1', NULL, '', '', '', '', 'Unknown Browser', 'Unknown OS Platform', '2021-05-18 12:01:46', '2021-05-18 12:01:46'),
(117, 8, '127.0.0.1', NULL, '', '', '', '', 'Unknown Browser', 'Unknown OS Platform', '2021-05-18 13:04:11', '2021-05-18 13:04:11'),
(118, 8, '127.0.0.1', NULL, '', '', '', '', 'Unknown Browser', 'Unknown OS Platform', '2021-05-18 13:04:42', '2021-05-18 13:04:42'),
(119, 8, '127.0.0.1', NULL, '', '', '', '', 'Unknown Browser', 'Unknown OS Platform', '2021-05-18 13:26:53', '2021-05-18 13:26:53'),
(120, 8, '127.0.0.1', NULL, '', '', '', '', 'Unknown Browser', 'Unknown OS Platform', '2021-05-19 04:43:07', '2021-05-19 04:43:07'),
(121, 8, '127.0.0.1', NULL, '', '', '', '', 'Unknown Browser', 'Unknown OS Platform', '2021-05-19 05:00:42', '2021-05-19 05:00:42'),
(122, 8, '127.0.0.1', NULL, '', '', '', '', 'Unknown Browser', 'Unknown OS Platform', '2021-05-19 05:18:47', '2021-05-19 05:18:47'),
(123, 22, '127.0.0.1', NULL, '', '', '', '', 'Unknown Browser', 'Unknown OS Platform', '2021-05-19 05:47:02', '2021-05-19 05:47:02'),
(124, 8, '127.0.0.1', NULL, '', '', '', '', 'Unknown Browser', 'Unknown OS Platform', '2021-05-19 05:48:12', '2021-05-19 05:48:12'),
(125, 8, '127.0.0.1', NULL, '', '', '', '', 'Unknown Browser', 'Unknown OS Platform', '2021-05-19 06:02:29', '2021-05-19 06:02:29'),
(126, 8, '127.0.0.1', NULL, '', '', '', '', 'Unknown Browser', 'Unknown OS Platform', '2021-05-19 06:02:37', '2021-05-19 06:02:37'),
(127, 8, '127.0.0.1', NULL, '', '', '', '', 'Unknown Browser', 'Unknown OS Platform', '2021-05-19 06:46:41', '2021-05-19 06:46:41'),
(128, 8, '127.0.0.1', NULL, '', '', '', '', 'Unknown Browser', 'Unknown OS Platform', '2021-05-19 08:06:17', '2021-05-19 08:06:17'),
(129, 8, '192.168.30.101', '', '', '', '', '', 'Unknown Browser', 'Unknown OS Platform', '2021-05-19 09:04:52', '2021-05-19 09:04:52'),
(130, 8, '192.168.30.101', '', '', '', '', '', 'Unknown Browser', 'Unknown OS Platform', '2021-05-19 09:07:03', '2021-05-19 09:07:03'),
(131, 8, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2021-05-19 09:37:12', '2021-05-19 09:37:12'),
(132, 8, '127.0.0.1', NULL, '', '', '', '', 'Unknown Browser', 'Unknown OS Platform', '2021-05-20 05:15:36', '2021-05-20 05:15:36'),
(133, 8, '192.168.30.101', '', '', '', '', '', 'Unknown Browser', 'Unknown OS Platform', '2021-05-20 05:42:29', '2021-05-20 05:42:29'),
(134, 8, '127.0.0.1', NULL, '', '', '', '', 'Unknown Browser', 'Unknown OS Platform', '2021-05-20 06:21:56', '2021-05-20 06:21:56'),
(135, 8, '127.0.0.1', NULL, '', '', '', '', 'Unknown Browser', 'Unknown OS Platform', '2021-05-20 06:38:33', '2021-05-20 06:38:33'),
(136, 8, '127.0.0.1', NULL, '', '', '', '', 'Unknown Browser', 'Unknown OS Platform', '2021-05-20 06:51:08', '2021-05-20 06:51:08'),
(137, 8, '127.0.0.1', NULL, '', '', '', '', 'Unknown Browser', 'Unknown OS Platform', '2021-05-20 08:25:26', '2021-05-20 08:25:26'),
(138, 8, '192.168.30.101', '', '', '', '', '', 'Unknown Browser', 'Unknown OS Platform', '2021-05-20 08:40:34', '2021-05-20 08:40:34'),
(139, 8, '192.168.30.101', '', '', '', '', '', 'Unknown Browser', 'Unknown OS Platform', '2021-05-22 08:27:18', '2021-05-22 08:27:18'),
(140, 8, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2021-05-24 05:48:16', '2021-05-24 05:48:16'),
(141, 8, '127.0.0.1', NULL, '', '', '', '', 'Firefox', 'Windows 10', '2021-05-30 11:37:41', '2021-05-30 11:37:41'),
(142, 8, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2021-06-05 10:24:30', '2021-06-05 10:24:30'),
(143, 8, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2021-06-05 13:16:57', '2021-06-05 13:16:57'),
(144, 8, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2021-06-07 06:48:16', '2021-06-07 06:48:16'),
(145, 8, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2021-06-08 09:50:07', '2021-06-08 09:50:07'),
(146, 23, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2021-06-09 06:15:34', '2021-06-09 06:15:34'),
(147, 8, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2021-06-09 06:20:13', '2021-06-09 06:20:13'),
(148, 24, '192.168.30.101', '', '', '', '', '', 'Unknown Browser', 'Unknown OS Platform', '2021-06-10 05:31:54', '2021-06-10 05:31:54'),
(149, 25, '192.168.30.101', '', '', '', '', '', 'Unknown Browser', 'Unknown OS Platform', '2021-06-10 05:35:17', '2021-06-10 05:35:17'),
(150, 25, '192.168.30.101', '', '', '', '', '', 'Unknown Browser', 'Unknown OS Platform', '2021-06-10 06:31:50', '2021-06-10 06:31:50'),
(151, 24, '192.168.30.101', '', '', '', '', '', 'Unknown Browser', 'Unknown OS Platform', '2021-06-10 06:32:47', '2021-06-10 06:32:47'),
(152, 24, '192.168.30.101', '', '', '', '', '', 'Unknown Browser', 'Unknown OS Platform', '2021-06-10 06:36:30', '2021-06-10 06:36:30'),
(153, 24, '192.168.30.101', '', '', '', '', '', 'Unknown Browser', 'Unknown OS Platform', '2021-06-10 06:36:42', '2021-06-10 06:36:42'),
(154, 26, '192.168.30.101', '', '', '', '', '', 'Unknown Browser', 'Unknown OS Platform', '2021-06-10 08:38:29', '2021-06-10 08:38:29'),
(155, 24, '192.168.30.101', '', '', '', '', '', 'Unknown Browser', 'Unknown OS Platform', '2021-06-10 09:33:53', '2021-06-10 09:33:53'),
(156, 24, '192.168.30.101', '', '', '', '', '', 'Unknown Browser', 'Unknown OS Platform', '2021-06-10 09:36:53', '2021-06-10 09:36:53'),
(157, 24, '192.168.30.101', '', '', '', '', '', 'Unknown Browser', 'Unknown OS Platform', '2021-06-10 10:05:22', '2021-06-10 10:05:22'),
(158, 24, '192.168.30.101', '', '', '', '', '', 'Unknown Browser', 'Unknown OS Platform', '2021-06-10 11:56:06', '2021-06-10 11:56:06'),
(159, 27, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2021-06-12 05:27:14', '2021-06-12 05:27:14'),
(160, 8, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2021-06-12 05:49:27', '2021-06-12 05:49:27'),
(161, 8, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2021-06-17 12:20:17', '2021-06-17 12:20:17'),
(162, 8, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2021-06-20 10:09:14', '2021-06-20 10:09:14'),
(163, 8, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2021-06-22 06:39:43', '2021-06-22 06:39:43'),
(164, 8, '127.0.0.1', NULL, '', '', '', '', 'Firefox', 'Windows 10', '2021-07-04 11:19:27', '2021-07-04 11:19:27'),
(165, 8, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2021-07-17 09:35:26', '2021-07-17 09:35:26'),
(166, 8, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2022-02-23 00:59:39', '2022-02-23 00:59:39'),
(167, 8, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2022-02-23 01:00:48', '2022-02-23 01:00:48'),
(168, 8, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2022-02-23 01:01:34', '2022-02-23 01:01:34'),
(169, 8, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2022-02-23 01:16:57', '2022-02-23 01:16:57'),
(170, 8, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2022-02-23 01:58:50', '2022-02-23 01:58:50'),
(171, 8, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2022-02-23 05:10:49', '2022-02-23 05:10:49'),
(172, 8, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2022-02-24 01:54:21', '2022-02-24 01:54:21'),
(173, 8, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2022-02-24 02:45:18', '2022-02-24 02:45:18'),
(174, 8, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2022-02-24 06:02:52', '2022-02-24 06:02:52'),
(175, 8, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2022-03-07 04:00:28', '2022-03-07 04:00:28'),
(176, 8, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2022-03-08 04:32:14', '2022-03-08 04:32:14'),
(177, 8, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2022-03-10 03:27:26', '2022-03-10 03:27:26'),
(178, 8, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2022-03-12 07:02:34', '2022-03-12 07:02:34'),
(179, 8, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2022-03-16 05:23:33', '2022-03-16 05:23:33'),
(180, 8, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2022-03-16 23:29:15', '2022-03-16 23:29:15'),
(181, 28, '127.0.0.1', NULL, '', '', '', '', 'Firefox', 'Windows 10', '2022-03-17 03:09:58', '2022-03-17 03:09:58'),
(182, 8, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2022-03-19 05:54:50', '2022-03-19 05:54:50'),
(183, 8, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2022-03-21 00:10:58', '2022-03-21 00:10:58'),
(184, 29, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2022-03-21 02:41:54', '2022-03-21 02:41:54'),
(185, 8, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2022-03-21 02:47:16', '2022-03-21 02:47:16'),
(186, 8, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2022-03-21 03:15:55', '2022-03-21 03:15:55'),
(187, 8, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2022-03-21 05:42:49', '2022-03-21 05:42:49'),
(188, 8, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2022-03-22 05:36:59', '2022-03-22 05:36:59'),
(189, 30, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2022-03-22 07:53:20', '2022-03-22 07:53:20'),
(190, 8, '127.0.0.1', NULL, '', '', '', '', 'Unknown Browser', 'Unknown OS Platform', '2022-03-22 09:59:16', '2022-03-22 09:59:16'),
(191, 8, '127.0.0.1', NULL, '', '', '', '', 'Unknown Browser', 'Unknown OS Platform', '2022-03-22 10:24:43', '2022-03-22 10:24:43'),
(192, 8, '127.0.0.1', NULL, '', '', '', '', 'Unknown Browser', 'Unknown OS Platform', '2022-03-22 10:47:56', '2022-03-22 10:47:56'),
(193, 8, '127.0.0.1', NULL, '', '', '', '', 'Unknown Browser', 'Unknown OS Platform', '2022-03-22 10:48:33', '2022-03-22 10:48:33'),
(194, 31, '127.0.0.1', NULL, '', '', '', '', 'Unknown Browser', 'Unknown OS Platform', '2022-03-22 11:22:57', '2022-03-22 11:22:57'),
(195, 8, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2022-03-23 04:52:19', '2022-03-23 04:52:19'),
(196, 8, '127.0.0.1', NULL, '', '', '', '', 'Unknown Browser', 'Unknown OS Platform', '2022-03-29 08:05:49', '2022-03-29 08:05:49'),
(197, 8, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2022-03-30 07:23:47', '2022-03-30 07:23:47'),
(198, 8, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2022-03-30 11:49:52', '2022-03-30 11:49:52'),
(199, 8, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2022-03-30 13:03:17', '2022-03-30 13:03:17'),
(200, 8, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2022-04-02 04:35:15', '2022-04-02 04:35:15'),
(201, 8, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2022-04-03 06:33:59', '2022-04-03 06:33:59'),
(202, 8, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2022-04-03 07:49:36', '2022-04-03 07:49:36'),
(203, 8, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2022-04-04 03:53:39', '2022-04-04 03:53:39'),
(204, 8, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2022-04-04 05:37:22', '2022-04-04 05:37:22'),
(205, 8, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2022-04-04 08:33:11', '2022-04-04 08:33:11'),
(206, 8, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2022-04-11 03:16:38', '2022-04-11 03:16:38'),
(207, 8, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2022-05-08 10:25:23', '2022-05-08 10:25:23'),
(208, 8, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2022-05-25 10:38:37', '2022-05-25 10:38:37'),
(209, 32, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2022-05-25 13:03:03', '2022-05-25 13:03:03'),
(210, 8, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2022-05-29 09:28:37', '2022-05-29 09:28:37'),
(211, 8, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2022-05-30 11:57:53', '2022-05-30 11:57:53'),
(212, 8, '127.0.0.1', NULL, '', '', '', '', 'Unknown Browser', 'Unknown OS Platform', '2022-07-04 05:44:23', '2022-07-04 05:44:23'),
(213, 8, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2022-07-18 12:22:51', '2022-07-18 12:22:51'),
(214, 8, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2022-07-20 13:06:51', '2022-07-20 13:06:51'),
(215, 8, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2022-07-25 11:13:59', '2022-07-25 11:13:59'),
(216, 8, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2022-07-25 11:14:52', '2022-07-25 11:14:52'),
(217, 8, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2022-07-26 07:34:37', '2022-07-26 07:34:37'),
(218, 8, '127.0.0.1', NULL, '', '', '', '', 'Unknown Browser', 'Unknown OS Platform', '2022-08-03 05:04:05', '2022-08-03 05:04:05'),
(219, 8, '127.0.0.1', NULL, '', '', '', '', 'Unknown Browser', 'Unknown OS Platform', '2022-08-03 06:04:12', '2022-08-03 06:04:12'),
(220, 8, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2022-08-07 04:17:49', '2022-08-07 04:17:49'),
(221, 8, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2022-08-18 11:50:56', '2022-08-18 11:50:56'),
(222, 8, '127.0.0.1', NULL, '', '', '', '', 'Firefox', 'Windows 10', '2022-08-24 07:58:42', '2022-08-24 07:58:42'),
(223, 8, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2022-08-28 08:24:12', '2022-08-28 08:24:12'),
(224, 8, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2022-08-31 04:25:57', '2022-08-31 04:25:57'),
(225, 8, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2022-09-14 07:35:05', '2022-09-14 07:35:05'),
(226, 8, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2022-09-20 05:15:53', '2022-09-20 05:15:53'),
(227, 8, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2022-09-20 05:23:20', '2022-09-20 05:23:20'),
(228, 8, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2022-09-22 07:37:42', '2022-09-22 07:37:42'),
(229, 33, '127.0.0.1', NULL, '', '', '', '', 'Unknown Browser', 'Unknown OS Platform', '2022-09-29 06:59:30', '2022-09-29 06:59:30'),
(230, 8, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2022-10-19 03:03:43', '2022-10-19 03:03:43'),
(231, 8, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2022-10-20 08:36:02', '2022-10-20 08:36:02'),
(232, 8, '127.0.0.1', NULL, '', '', '', '', 'Unknown Browser', 'Unknown OS Platform', '2022-10-24 06:27:52', '2022-10-24 06:27:52'),
(233, 8, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2022-11-05 05:08:32', '2022-11-05 05:08:32'),
(234, 8, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2022-11-13 06:35:49', '2022-11-13 06:35:49'),
(235, 8, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2022-12-27 08:28:19', '2022-12-27 08:28:19'),
(236, 8, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2023-02-13 07:56:55', '2023-02-13 07:56:55'),
(237, 34, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2023-11-26 07:25:59', '2023-11-26 07:25:59'),
(238, 34, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2023-11-26 07:39:09', '2023-11-26 07:39:09'),
(239, 34, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2023-11-26 07:42:37', '2023-11-26 07:42:37'),
(240, 34, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2023-11-26 07:48:25', '2023-11-26 07:48:25'),
(241, 34, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2023-11-26 09:33:24', '2023-11-26 09:33:24'),
(242, 34, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2023-11-26 11:50:01', '2023-11-26 11:50:01'),
(243, 34, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2023-11-27 05:03:42', '2023-11-27 05:03:42'),
(244, 34, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2023-11-28 06:26:40', '2023-11-28 06:26:40'),
(245, 34, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2023-11-29 06:38:36', '2023-11-29 06:38:36'),
(246, 34, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2023-11-29 10:37:34', '2023-11-29 10:37:34'),
(247, 34, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2023-11-30 04:23:04', '2023-11-30 04:23:04'),
(248, 35, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2023-12-04 05:52:11', '2023-12-04 05:52:11'),
(249, 36, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2023-12-04 06:20:10', '2023-12-04 06:20:10'),
(250, 35, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2023-12-04 06:21:58', '2023-12-04 06:21:58'),
(251, 35, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2023-12-05 05:19:16', '2023-12-05 05:19:16'),
(252, 35, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2023-12-06 05:11:14', '2023-12-06 05:11:14'),
(253, 35, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2023-12-06 05:50:48', '2023-12-06 05:50:48'),
(254, 35, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2023-12-07 05:05:36', '2023-12-07 05:05:36'),
(255, 35, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2023-12-10 05:24:36', '2023-12-10 05:24:36'),
(256, 35, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2023-12-11 05:21:22', '2023-12-11 05:21:22'),
(257, 35, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2023-12-11 07:30:15', '2023-12-11 07:30:15'),
(258, 35, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2023-12-12 05:19:32', '2023-12-12 05:19:32'),
(259, 34, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2023-12-13 04:45:44', '2023-12-13 04:45:44'),
(260, 34, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2023-12-13 11:52:54', '2023-12-13 11:52:54'),
(261, 34, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2023-12-17 06:07:26', '2023-12-17 06:07:26'),
(262, 34, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2023-12-18 05:50:49', '2023-12-18 05:50:49'),
(263, 34, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2023-12-18 09:50:04', '2023-12-18 09:50:04'),
(264, 34, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2023-12-19 04:38:29', '2023-12-19 04:38:29'),
(265, 34, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2023-12-19 07:01:36', '2023-12-19 07:01:36'),
(266, 34, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2023-12-19 09:31:12', '2023-12-19 09:31:12'),
(267, 34, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2023-12-20 05:29:04', '2023-12-20 05:29:04'),
(268, 34, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2023-12-20 11:10:19', '2023-12-20 11:10:19'),
(269, 34, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2023-12-21 05:15:15', '2023-12-21 05:15:15'),
(270, 34, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2023-12-22 03:26:33', '2023-12-22 03:26:33'),
(271, 34, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2023-12-22 08:30:20', '2023-12-22 08:30:20'),
(272, 34, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2023-12-22 13:55:55', '2023-12-22 13:55:55'),
(273, 34, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2023-12-23 08:48:12', '2023-12-23 08:48:12'),
(274, 34, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2023-12-24 05:02:23', '2023-12-24 05:02:23'),
(275, 34, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2023-12-24 10:59:27', '2023-12-24 10:59:27'),
(276, 34, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2023-12-25 05:05:06', '2023-12-25 05:05:06'),
(277, 35, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2023-12-27 05:32:23', '2023-12-27 05:32:23'),
(278, 35, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2023-12-28 05:28:36', '2023-12-28 05:28:36'),
(279, 35, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2024-01-02 05:14:35', '2024-01-02 05:14:35'),
(280, 35, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2024-01-02 10:05:51', '2024-01-02 10:05:51'),
(281, 35, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2024-01-03 05:00:12', '2024-01-03 05:00:12'),
(282, 35, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2024-01-04 05:04:09', '2024-01-04 05:04:09'),
(283, 35, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2024-01-09 07:50:00', '2024-01-09 07:50:00'),
(284, 35, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2024-01-10 05:25:27', '2024-01-10 05:25:27'),
(285, 35, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2024-01-11 05:11:29', '2024-01-11 05:11:29'),
(286, 35, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2024-01-11 09:49:12', '2024-01-11 09:49:12'),
(287, 35, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2024-01-11 09:50:42', '2024-01-11 09:50:42'),
(288, 35, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2024-01-11 10:01:35', '2024-01-11 10:01:35'),
(289, 35, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2024-01-14 05:35:30', '2024-01-14 05:35:30'),
(290, 35, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2024-01-15 07:17:02', '2024-01-15 07:17:02'),
(291, 35, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2024-01-17 05:26:10', '2024-01-17 05:26:10'),
(292, 35, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2024-01-17 10:42:24', '2024-01-17 10:42:24'),
(293, 35, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2024-01-18 09:31:40', '2024-01-18 09:31:40'),
(294, 35, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2024-01-21 05:26:52', '2024-01-21 05:26:52'),
(295, 35, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2024-01-21 06:16:47', '2024-01-21 06:16:47'),
(296, 35, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2024-01-21 06:28:26', '2024-01-21 06:28:26'),
(297, 35, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2024-01-21 12:03:16', '2024-01-21 12:03:16'),
(298, 35, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2024-01-22 05:25:12', '2024-01-22 05:25:12'),
(299, 35, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2024-01-22 06:35:12', '2024-01-22 06:35:12'),
(300, 35, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2024-01-22 07:55:12', '2024-01-22 07:55:12'),
(301, 35, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2024-01-22 11:07:11', '2024-01-22 11:07:11'),
(302, 35, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2024-01-22 11:57:30', '2024-01-22 11:57:30'),
(303, 35, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2024-01-23 05:34:23', '2024-01-23 05:34:23'),
(304, 35, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2024-01-24 05:22:25', '2024-01-24 05:22:25'),
(305, 35, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2024-01-24 07:09:51', '2024-01-24 07:09:51'),
(306, 35, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2024-01-24 07:19:04', '2024-01-24 07:19:04'),
(307, 35, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2024-01-24 07:37:00', '2024-01-24 07:37:00'),
(308, 35, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2024-01-24 07:37:30', '2024-01-24 07:37:30'),
(309, 35, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2024-02-06 10:33:58', '2024-02-06 10:33:58'),
(310, 35, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2024-02-12 07:05:24', '2024-02-12 07:05:24'),
(311, 35, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2024-02-13 04:52:36', '2024-02-13 04:52:36'),
(312, 35, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2024-02-14 05:13:09', '2024-02-14 05:13:09'),
(313, 34, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2024-02-15 04:54:15', '2024-02-15 04:54:15'),
(314, 34, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2024-02-15 11:32:51', '2024-02-15 11:32:51'),
(315, 34, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2024-02-17 02:40:19', '2024-02-17 02:40:19'),
(316, 34, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2024-02-18 04:42:48', '2024-02-18 04:42:48'),
(317, 34, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2024-02-19 05:14:48', '2024-02-19 05:14:48'),
(318, 34, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2024-02-20 04:30:14', '2024-02-20 04:30:14'),
(319, 34, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2024-02-21 09:36:10', '2024-02-21 09:36:10'),
(320, 34, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2024-02-22 05:27:24', '2024-02-22 05:27:24'),
(321, 34, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2024-02-24 06:09:22', '2024-02-24 06:09:22'),
(322, 34, '127.0.0.1', NULL, '', '', '', '', 'Chrome', 'Windows 10', '2024-02-25 06:19:49', '2024-02-25 06:19:49'),
(323, 34, '103.230.61.44', '', '', '', '', '', 'Chrome', 'Windows 10', '2024-02-26 14:56:26', '2024-02-26 14:56:26'),
(324, 35, '103.152.213.62', '', '', '', '', '', 'Handheld Browser', 'Android', '2024-02-26 15:44:48', '2024-02-26 15:44:48'),
(325, 34, '69.174.144.96', '', '', '', '', '', 'Chrome', 'Windows 10', '2024-02-26 15:53:47', '2024-02-26 15:53:47'),
(326, 34, '103.197.205.141', '', '', '', '', '', 'Handheld Browser', 'iPhone', '2024-02-26 17:19:41', '2024-02-26 17:19:41'),
(327, 34, '103.91.229.204', '', '', '', '', '', 'Chrome', 'Windows 10', '2024-02-27 04:45:48', '2024-02-27 04:45:48'),
(328, 34, '103.91.229.204', '', '', '', '', '', 'Chrome', 'Windows 10', '2024-02-27 06:41:39', '2024-02-27 06:41:39'),
(329, 35, '103.91.229.204', '', '', '', '', '', 'Chrome', 'Windows 10', '2024-02-27 07:02:29', '2024-02-27 07:02:29'),
(330, 34, '103.91.229.204', '', '', '', '', '', 'Chrome', 'Windows 10', '2024-02-27 08:48:26', '2024-02-27 08:48:26'),
(331, 34, '103.91.229.204', '', '', '', '', '', 'Chrome', 'Windows 10', '2024-02-27 11:38:16', '2024-02-27 11:38:16'),
(332, 34, '103.230.61.44', '', '', '', '', '', 'Handheld Browser', 'Android', '2024-02-27 12:50:35', '2024-02-27 12:50:35'),
(333, 34, '103.91.229.204', '', '', '', '', '', 'Chrome', 'Windows 10', '2024-02-28 05:04:20', '2024-02-28 05:04:20'),
(334, 34, '103.91.229.204', '', '', '', '', '', 'Chrome', 'Windows 10', '2024-02-28 11:42:18', '2024-02-28 11:42:18'),
(335, 34, '69.174.144.96', '', '', '', '', '', 'Chrome', 'Windows 10', '2024-02-28 21:37:39', '2024-02-28 21:37:39'),
(336, 34, '103.91.229.204', '', '', '', '', '', 'Chrome', 'Windows 10', '2024-02-29 05:44:21', '2024-02-29 05:44:21'),
(337, 35, '103.91.229.204', '', '', '', '', '', 'Chrome', 'Windows 10', '2024-02-29 05:45:50', '2024-02-29 05:45:50'),
(338, 34, '103.91.229.204', '', '', '', '', '', 'Chrome', 'Windows 10', '2024-02-29 10:38:37', '2024-02-29 10:38:37'),
(339, 34, '37.111.206.12', '', '', '', '', '', 'Handheld Browser', 'Android', '2024-03-01 12:13:22', '2024-03-01 12:13:22'),
(340, 34, '103.91.229.204', '', '', '', '', '', 'Chrome', 'Windows 10', '2024-03-04 05:41:19', '2024-03-04 05:41:19'),
(341, 35, '37.111.206.241', '', '', '', '', '', 'Handheld Browser', 'Android', '2024-03-04 06:07:42', '2024-03-04 06:07:42'),
(342, 34, '103.91.229.204', '', '', '', '', '', 'Chrome', 'Windows 10', '2024-03-07 10:36:34', '2024-03-07 10:36:34'),
(343, 34, '103.108.63.176', '', '', '', '', '', 'Chrome', 'Windows 10', '2024-03-09 08:08:54', '2024-03-09 08:08:54'),
(344, 34, '103.108.63.176', '', '', '', '', '', 'Chrome', 'Windows 10', '2024-03-09 08:15:32', '2024-03-09 08:15:32'),
(345, 34, '103.108.63.176', '', '', '', '', '', 'Chrome', 'Windows 10', '2024-03-09 08:52:30', '2024-03-09 08:52:30'),
(346, 34, '103.108.63.176', '', '', '', '', '', 'Chrome', 'Windows 10', '2024-03-09 13:41:52', '2024-03-09 13:41:52'),
(347, 34, '103.108.63.176', '', '', '', '', '', 'Chrome', 'Windows 10', '2024-03-09 14:51:12', '2024-03-09 14:51:12'),
(348, 34, '103.91.229.204', '', '', '', '', '', 'Chrome', 'Windows 10', '2024-03-10 08:46:55', '2024-03-10 08:46:55'),
(349, 34, '103.91.229.204', '', '', '', '', '', 'Chrome', 'Windows 10', '2024-03-10 08:47:04', '2024-03-10 08:47:04'),
(350, 35, '103.91.229.204', '', '', '', '', '', 'Chrome', 'Windows 10', '2024-03-10 08:47:06', '2024-03-10 08:47:06'),
(351, 34, '103.91.229.204', '', '', '', '', '', 'Handheld Browser', 'Android', '2024-03-10 10:32:01', '2024-03-10 10:32:01'),
(352, 34, '103.91.229.204', '', '', '', '', '', 'Chrome', 'Windows 10', '2024-03-11 06:43:01', '2024-03-11 06:43:01'),
(353, 34, '103.91.229.204', '', '', '', '', '', 'Chrome', 'Windows 10', '2024-03-13 06:35:55', '2024-03-13 06:35:55'),
(354, 34, '103.91.229.204', '', '', '', '', '', 'Chrome', 'Windows 10', '2024-03-14 08:53:07', '2024-03-14 08:53:07'),
(355, 34, '103.91.229.204', '', '', '', '', '', 'Chrome', 'Windows 10', '2024-03-17 08:01:45', '2024-03-17 08:01:45'),
(356, 34, '103.230.61.44', '', '', '', '', '', 'Chrome', 'Windows 10', '2024-03-23 04:02:58', '2024-03-23 04:02:58'),
(357, 35, '37.111.206.73', '', '', '', '', '', 'Handheld Browser', 'Android', '2024-03-23 06:29:26', '2024-03-23 06:29:26'),
(358, 34, '103.91.229.204', '', '', '', '', '', 'Chrome', 'Windows 10', '2024-03-28 10:01:26', '2024-03-28 10:01:26'),
(359, 34, '103.108.63.176', '', '', '', '', '', 'Chrome', 'Windows 10', '2024-03-28 18:28:48', '2024-03-28 18:28:48'),
(360, 34, '103.152.213.62', '', '', '', '', '', 'Handheld Browser', 'Android', '2024-03-29 16:36:13', '2024-03-29 16:36:13'),
(361, 35, '103.152.213.62', '', '', '', '', '', 'Chrome', 'Linux', '2024-03-29 16:38:12', '2024-03-29 16:38:12'),
(362, 34, '103.230.61.44', '', '', '', '', '', 'Chrome', 'Windows 10', '2024-04-05 14:22:38', '2024-04-05 14:22:38'),
(363, 34, '103.108.63.176', '', '', '', '', '', 'Chrome', 'Windows 10', '2024-04-05 16:11:24', '2024-04-05 16:11:24'),
(364, 34, '103.230.61.44', '', '', '', '', '', 'Chrome', 'Windows 10', '2024-04-17 05:30:07', '2024-04-17 05:30:07'),
(365, 34, '103.230.61.44', '', '', '', '', '', 'Chrome', 'Windows 10', '2024-04-19 15:17:40', '2024-04-19 15:17:40'),
(366, 34, '69.174.144.96', '', '', '', '', '', 'Chrome', 'Windows 10', '2024-04-19 17:32:48', '2024-04-19 17:32:48'),
(367, 34, '103.230.61.44', '', '', '', '', '', 'Chrome', 'Windows 10', '2024-04-22 16:05:21', '2024-04-22 16:05:21'),
(368, 34, '69.174.144.96', '', '', '', '', '', 'Chrome', 'Windows 10', '2024-04-23 14:20:12', '2024-04-23 14:20:12'),
(369, 34, '103.230.61.44', '', '', '', '', '', 'Chrome', 'Windows 10', '2024-04-23 15:33:57', '2024-04-23 15:33:57'),
(370, 34, '103.108.63.179', '', '', '', '', '', 'Chrome', 'Windows 10', '2024-04-23 19:35:36', '2024-04-23 19:35:36'),
(371, 34, '103.230.61.44', '', '', '', '', '', 'Chrome', 'Windows 10', '2024-04-24 05:05:15', '2024-04-24 05:05:15'),
(372, 34, '103.108.63.179', '', '', '', '', '', 'Chrome', 'Windows 10', '2024-04-24 13:44:36', '2024-04-24 13:44:36'),
(373, 34, '69.174.144.96', '', '', '', '', '', 'Chrome', 'Windows 10', '2024-04-24 15:16:05', '2024-04-24 15:16:05'),
(374, 34, '103.108.63.179', '', '', '', '', '', 'Chrome', 'Windows 10', '2024-04-25 03:36:47', '2024-04-25 03:36:47'),
(375, 34, '103.230.61.44', '', '', '', '', '', 'Chrome', 'Windows 10', '2024-04-25 04:08:31', '2024-04-25 04:08:31'),
(376, 34, '69.174.144.96', '', '', '', '', '', 'Chrome', 'Windows 10', '2024-04-25 15:57:43', '2024-04-25 15:57:43'),
(377, 34, '103.230.61.44', '', '', '', '', '', 'Chrome', 'Windows 10', '2024-04-25 16:20:43', '2024-04-25 16:20:43'),
(378, 34, '103.230.61.44', '', '', '', '', '', 'Chrome', 'Windows 10', '2024-04-26 04:06:02', '2024-04-26 04:06:02'),
(379, 34, '103.108.63.179', '', '', '', '', '', 'Chrome', 'Windows 10', '2024-04-27 05:22:00', '2024-04-27 05:22:00'),
(380, 34, '103.108.63.179', '', '', '', '', '', 'Chrome', 'Windows 10', '2024-04-27 06:02:53', '2024-04-27 06:02:53'),
(381, 34, '103.108.63.179', '', '', '', '', '', 'Chrome', 'Windows 10', '2024-04-28 10:11:33', '2024-04-28 10:11:33'),
(382, 34, '103.230.61.44', '', '', '', '', '', 'Handheld Browser', 'Android', '2024-04-29 02:21:48', '2024-04-29 02:21:48'),
(383, 34, '103.230.61.44', '', '', '', '', '', 'Chrome', 'Windows 10', '2024-04-29 04:41:42', '2024-04-29 04:41:42'),
(384, 34, '103.108.63.179', '', '', '', '', '', 'Chrome', 'Windows 10', '2024-04-29 06:06:46', '2024-04-29 06:06:46'),
(385, 34, '202.134.8.195', '', '', '', '', '', 'Handheld Browser', 'Android', '2024-04-29 13:39:33', '2024-04-29 13:39:33'),
(386, 34, '103.230.61.44', '', '', '', '', '', 'Chrome', 'Windows 10', '2024-04-29 17:30:30', '2024-04-29 17:30:30'),
(387, 34, '103.230.61.44', '', '', '', '', '', 'Chrome', 'Linux', '2024-04-29 17:36:34', '2024-04-29 17:36:34'),
(388, 34, '103.230.61.44', '', '', '', '', '', 'Chrome', 'Windows 10', '2024-04-30 05:32:58', '2024-04-30 05:32:58');

-- --------------------------------------------------------

--
-- Table structure for table `vendor_care_lists`
--

DROP TABLE IF EXISTS `vendor_care_lists`;
CREATE TABLE IF NOT EXISTS `vendor_care_lists` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_id` bigint NOT NULL,
  `site_id` bigint NOT NULL,
  `technician_id` bigint NOT NULL,
  `priority` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fha_rate` decimal(28,3) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vendor_care_lists`
--

INSERT INTO `vendor_care_lists` (`id`, `order_id`, `site_id`, `technician_id`, `priority`, `fha_rate`, `created_at`, `updated_at`) VALUES
(1, 80001, 9, 13, 'Emergency', '18.000', '2023-10-02 18:24:17', '2023-10-02 18:24:17');

-- --------------------------------------------------------

--
-- Table structure for table `websockets_statistics_entries`
--

DROP TABLE IF EXISTS `websockets_statistics_entries`;
CREATE TABLE IF NOT EXISTS `websockets_statistics_entries` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `app_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `peak_connection_count` int NOT NULL,
  `websocket_message_count` int NOT NULL,
  `api_message_count` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `withdrawals`
--

DROP TABLE IF EXISTS `withdrawals`;
CREATE TABLE IF NOT EXISTS `withdrawals` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `method_id` int UNSIGNED NOT NULL DEFAULT '0',
  `user_id` int UNSIGNED NOT NULL DEFAULT '0',
  `amount` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `currency` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rate` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `charge` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `trx` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `final_amount` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `after_charge` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `withdraw_information` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1=>success, 2=>pending, 3=>cancel,  ',
  `admin_feedback` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `withdrawals`
--

INSERT INTO `withdrawals` (`id`, `method_id`, `user_id`, `amount`, `currency`, `rate`, `charge`, `trx`, `final_amount`, `after_charge`, `withdraw_information`, `status`, `admin_feedback`, `created_at`, `updated_at`) VALUES
(1, 1, 8, '10.00000000', 'USD', '1.00000000', '1.20000000', 'CFKTEECKPXTG', '8.80000000', '8.80000000', NULL, 0, NULL, '2023-02-13 07:58:14', '2023-02-13 07:58:14');

-- --------------------------------------------------------

--
-- Table structure for table `withdraw_methods`
--

DROP TABLE IF EXISTS `withdraw_methods`;
CREATE TABLE IF NOT EXISTS `withdraw_methods` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `form_id` int UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `min_limit` decimal(28,8) DEFAULT '0.00000000',
  `max_limit` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `fixed_charge` decimal(28,8) DEFAULT '0.00000000',
  `rate` decimal(28,8) DEFAULT '0.00000000',
  `percent_charge` decimal(5,2) DEFAULT NULL,
  `currency` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `withdraw_methods`
--

INSERT INTO `withdraw_methods` (`id`, `form_id`, `name`, `min_limit`, `max_limit`, `fixed_charge`, `rate`, `percent_charge`, `currency`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 13, 'Bank Transfer', '1.00000000', '1000.00000000', '1.00000000', '1.00000000', '2.00', 'USD', '<span style=\"color: rgb(33, 37, 41); font-family: Montserrat, sans-serif;\">Please Provide The information Below:</span><br>', 1, '2022-03-30 09:09:11', '2022-10-13 05:12:28'),
(2, 14, 'Mobile Money', '1.00000000', '1000.00000000', '0.00000000', '1.00000000', '0.01', 'USD', '<span style=\"color: rgb(33, 37, 41); font-family: Montserrat, sans-serif;\">Please Provide The Information Below:</span><br>', 1, '2022-03-30 09:10:12', '2022-10-12 11:36:59');

-- --------------------------------------------------------

--
-- Table structure for table `work_orders`
--

DROP TABLE IF EXISTS `work_orders`;
CREATE TABLE IF NOT EXISTS `work_orders` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `auth_id` bigint UNSIGNED NOT NULL DEFAULT '0',
  `order_type` tinyint NOT NULL DEFAULT '0' COMMENT 'service=1,project=2,install=3',
  `priority` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ftech_id` bigint UNSIGNED DEFAULT NULL,
  `site_id` bigint DEFAULT NULL,
  `open_date` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `h_operation` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `main_tel` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `site_contact_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `site_contact_phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_schedule` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `e_checkin` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `l_checkin` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instruction` longtext COLLATE utf8mb4_unicode_ci,
  `a_instruction` longtext COLLATE utf8mb4_unicode_ci,
  `r_tools` longtext COLLATE utf8mb4_unicode_ci,
  `scope_work` longtext COLLATE utf8mb4_unicode_ci,
  `arrival` longtext COLLATE utf8mb4_unicode_ci,
  `leaving` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pictures` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `slug` bigint UNSIGNED DEFAULT NULL COMMENT 'slug=customer_id',
  `status` tinyint NOT NULL DEFAULT '0',
  `requested_date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `requested_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `request_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `complete_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `on_site_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `num_tech_required` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deliverables` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  PRIMARY KEY (`id`),
  KEY `customer delation` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `work_orders`
--

INSERT INTO `work_orders` (`id`, `auth_id`, `order_type`, `priority`, `ftech_id`, `site_id`, `open_date`, `order_id`, `h_operation`, `main_tel`, `site_contact_name`, `site_contact_phone`, `date_schedule`, `e_checkin`, `l_checkin`, `instruction`, `a_instruction`, `r_tools`, `scope_work`, `arrival`, `leaving`, `pictures`, `created_at`, `updated_at`, `slug`, `status`, `requested_date`, `requested_by`, `request_type`, `complete_by`, `on_site_by`, `num_tech_required`, `deliverables`) VALUES
(4, 0, 1, '1', NULL, 1, '02/27/24', 'S4022724-884', '8', NULL, 'Md. Hasibur Rahman', '01254765441', NULL, NULL, NULL, 'scasca', NULL, 'dsajudhcasjhcv', '<div><span style=\"font-size: 13.92pt; font-family: Symbol;\">• </span><span style=\"font-size: 13.92pt; font-family: Cambria;\">Install 9U Cabinet in MDF (St. James bldg., level 1, electrical closet, 107)\r\n</span></div><div><span style=\"font-size: 13.92pt; font-family: Symbol;\">• </span><span style=\"font-size: 13.92pt; font-family: Cambria;\">Install Switch in MDF\r\n</span></div><div><span style=\"font-size: 13.92pt; font-family: Symbol;\">• </span><span style=\"font-size: 13.92pt; font-family: Cambria;\">Install Peplink Controller\r\n</span></div><div><span style=\"font-size: 13.92pt; font-family: Symbol;\">• </span><span style=\"font-size: 13.92pt; font-family: Cambria;\">Install Web Power Switch (WPS)\r\n</span></div><div><span style=\"font-size: 13.92pt; font-family: Symbol;\">• </span><span style=\"font-size: 13.92pt; font-family: Cambria;\">Install (8) Switches in 8 IDFs\r\n</span></div><div><span style=\"font-size: 13.92pt; font-family: &quot;Courier New&quot;;\">o </span><span style=\"font-size: 13.92pt; font-family: Cambria;\">St. James:\r\n</span></div><div><span style=\"font-size: 13.92pt; font-family: Wingdings;\">▪ </span><span style=\"font-size: 13.92pt; font-family: Cambria;\">Level 3, 7, 11 &amp; 15\r\n</span></div><div><span style=\"font-size: 13.92pt; font-family: &quot;Courier New&quot;;\">o </span><span style=\"font-size: 13.92pt; font-family: Cambria;\">St. Andrews:\r\n</span></div><div><span style=\"font-size: 13.92pt; font-family: Wingdings;\">▪ </span><span style=\"font-size: 13.92pt; font-family: Cambria;\">Level 2, 6, 10, 14\r\n</span></div><div><span style=\"font-size: 13.92pt; font-family: Symbol;\">• </span><span style=\"font-size: 13.92pt; font-family: Cambria;\">Install (1) Base Station Point to Point on </span><span style=\"font-size: 13.92pt; font-family: Cambria-Bold; font-weight: bold;\">St. James </span><span style=\"font-size: 13.92pt; font-family: Cambria;\">Rooftop\r\n</span></div><div><span style=\"font-size: 13.92pt; font-family: Symbol;\">• </span><span style=\"font-size: 13.92pt; font-family: Cambria;\">Install (1) Terminal Station Point to Point on </span><span style=\"font-size: 13.92pt; font-family: Cambria-Bold; font-weight: bold;\">St. Andrews </span><span style=\"font-size: 13.92pt; font-family: Cambria;\">14</span><span style=\"font-size: 9.12pt; font-family: Cambria;\">th </span><span style=\"font-size: 13.92pt; font-family: Cambria;\">Floor\r\n</span></div><div><span style=\"font-size: 13.92pt; font-family: Symbol;\">• </span><span style=\"font-size: 13.92pt; font-family: Cambria;\">Install (158) Wireless Access Points according to the provided floor plans\r\n</span></div><div><span style=\"font-size: 13.92pt; font-family: Symbol;\">• </span><span style=\"font-size: 13.92pt; font-family: Cambria;\">Test and record -db levels (Wi-Fi Analyzer)\r\n</span></div><div><span style=\"font-size: 13.92pt; font-family: Symbol;\">• </span><span style=\"font-size: 13.92pt; font-family: Cambria;\">Test and record speed tests (speedtest.net)\r\n</span></div><div><span style=\"font-size: 13.92pt; font-family: Symbol;\">• </span><span style=\"font-size: 13.92pt; font-family: Cambria;\">Call Spot On Networks to test and ensure new AP’s are online and pinging</span></div>', NULL, NULL, NULL, '2024-02-27 04:53:46', '2024-03-10 10:39:36', 1, 7, NULL, NULL, 'Email', NULL, '10AM', '1', 'ahcbvajhcvajh'),
(5, 0, 1, NULL, NULL, NULL, '02/27/24', 'S5022724-785', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-02-27 06:44:54', '2024-02-27 06:44:54', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 0, 2, '1', 2, 1, '02/27/24', 'P6022724-694', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '<div><span style=\"font-size: 13.92pt; font-family: Symbol;\">• </span><span style=\"font-size: 13.92pt; font-family: Cambria;\">Install 9U Cabinet in MDF (St. James bldg., level 1, electrical closet, 107)\r\n</span></div><div><span style=\"font-size: 13.92pt; font-family: Symbol;\">• </span><span style=\"font-size: 13.92pt; font-family: Cambria;\">Install Switch in MDF\r\n</span></div><div><span style=\"font-size: 13.92pt; font-family: Symbol;\">• </span><span style=\"font-size: 13.92pt; font-family: Cambria;\">Install Peplink Controller\r\n</span></div><div><span style=\"font-size: 13.92pt; font-family: Symbol;\">• </span><span style=\"font-size: 13.92pt; font-family: Cambria;\">Install Web Power Switch (WPS)\r\n</span></div><div><span style=\"font-size: 13.92pt; font-family: Symbol;\">• </span><span style=\"font-size: 13.92pt; font-family: Cambria;\">Install (8) Switches in 8 IDFs\r\n</span></div><div><span style=\"font-size: 13.92pt; font-family: &quot;Courier New&quot;;\">o </span><span style=\"font-size: 13.92pt; font-family: Cambria;\">St. James:\r\n</span></div><div><span style=\"font-size: 13.92pt; font-family: Wingdings;\">▪ </span><span style=\"font-size: 13.92pt; font-family: Cambria;\">Level 3, 7, 11 &amp; 15\r\n</span></div><div><span style=\"font-size: 13.92pt; font-family: &quot;Courier New&quot;;\">o </span><span style=\"font-size: 13.92pt; font-family: Cambria;\">St. Andrews:\r\n</span></div><div><span style=\"font-size: 13.92pt; font-family: Wingdings;\">▪ </span><span style=\"font-size: 13.92pt; font-family: Cambria;\">Level 2, 6, 10, 14\r\n</span></div><div><span style=\"font-size: 13.92pt; font-family: Symbol;\">• </span><span style=\"font-size: 13.92pt; font-family: Cambria;\">Install (1) Base Station Point to Point on </span><span style=\"font-size: 13.92pt; font-family: Cambria-Bold; font-weight: bold;\">St. James </span><span style=\"font-size: 13.92pt; font-family: Cambria;\">Rooftop\r\n</span></div><div><span style=\"font-size: 13.92pt; font-family: Symbol;\">• </span><span style=\"font-size: 13.92pt; font-family: Cambria;\">Install (1) Terminal Station Point to Point on </span><span style=\"font-size: 13.92pt; font-family: Cambria-Bold; font-weight: bold;\">St. Andrews </span><span style=\"font-size: 13.92pt; font-family: Cambria;\">14</span><span style=\"font-size: 9.12pt; font-family: Cambria;\">th </span><span style=\"font-size: 13.92pt; font-family: Cambria;\">Floor\r\n</span></div><div><span style=\"font-size: 13.92pt; font-family: Symbol;\">• </span><span style=\"font-size: 13.92pt; font-family: Cambria;\">Install (158) Wireless Access Points according to the provided floor plans\r\n</span></div><div><span style=\"font-size: 13.92pt; font-family: Symbol;\">• </span><span style=\"font-size: 13.92pt; font-family: Cambria;\">Test and record -db levels (Wi-Fi Analyzer)\r\n</span></div><div><span style=\"font-size: 13.92pt; font-family: Symbol;\">• </span><span style=\"font-size: 13.92pt; font-family: Cambria;\">Test and record speed tests (speedtest.net)\r\n</span></div><div><span style=\"font-size: 13.92pt; font-family: Symbol;\">• </span><span style=\"font-size: 13.92pt; font-family: Cambria;\">Call Spot On Networks to test and ensure new AP’s are online and pinging&nbsp;</span></div>', NULL, NULL, NULL, '2024-02-27 07:04:15', '2024-04-25 17:41:14', 1, 8, NULL, NULL, 'Email', NULL, NULL, NULL, NULL),
(12, 0, 1, NULL, NULL, NULL, '03/07/24', 'S7030724-966', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-07 10:36:39', '2024-03-07 10:36:39', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(13, 0, 1, NULL, NULL, NULL, '03/07/24', 'S13030724-578', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-07 10:36:49', '2024-03-07 10:36:49', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(14, 0, 2, NULL, NULL, NULL, '03/07/24', 'P14030724-325', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-07 10:37:18', '2024-03-07 10:37:18', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(15, 0, 1, NULL, NULL, NULL, '03/07/24', 'S15030724-971', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-07 10:37:22', '2024-03-07 10:37:22', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(16, 0, 1, NULL, NULL, NULL, '03/07/24', 'S16030724-478', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-07 10:37:30', '2024-03-07 10:37:30', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(17, 0, 2, NULL, NULL, NULL, '03/07/24', 'P16030724-714', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-07 10:37:32', '2024-03-07 10:37:32', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(18, 0, 3, NULL, NULL, NULL, '03/07/24', 'I16030724-291', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-07 10:37:34', '2024-03-07 10:37:34', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(19, 0, 1, NULL, NULL, NULL, '03/07/24', 'S19030724-597', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-07 10:37:44', '2024-03-07 10:37:44', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(20, 0, 2, NULL, NULL, NULL, '03/07/24', 'P20030724-806', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-07 10:37:46', '2024-03-07 10:37:46', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(21, 0, 3, NULL, NULL, NULL, '03/07/24', 'I21030724-644', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-07 10:37:49', '2024-03-07 10:37:49', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(22, 0, 1, NULL, NULL, NULL, '03/09/24', 'S22030924-498', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-09 08:50:04', '2024-03-09 08:50:04', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(23, 0, 1, NULL, NULL, NULL, '03/09/24', 'S23030924-521', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-09 08:52:41', '2024-03-09 08:52:41', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(24, 0, 1, NULL, NULL, NULL, '03/10/24', 'S24031024-433', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-10 10:37:31', '2024-03-10 10:37:31', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(25, 0, 1, NULL, NULL, NULL, '03/28/24', 'S25032824-614', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-28 10:02:12', '2024-03-28 10:02:12', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(26, 0, 1, NULL, NULL, NULL, '03/29/24', 'S26032924-520', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-28 19:07:31', '2024-03-28 19:07:31', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(27, 0, 1, NULL, NULL, NULL, '04/05/24', 'S27040524-516', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-05 16:12:23', '2024-04-05 16:12:23', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(28, 0, 1, NULL, NULL, NULL, '04/19/24', 'S28041924-206', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-19 15:17:56', '2024-04-19 15:17:56', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(29, 0, 2, NULL, NULL, NULL, '04/19/24', 'P29041924-700', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-19 15:25:08', '2024-04-19 15:25:08', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(30, 0, 1, '1', NULL, 1, NULL, 'S30041924-299', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-19 15:27:33', '2024-04-22 16:26:47', 1, 7, NULL, NULL, 'Email', NULL, NULL, NULL, NULL),
(31, 0, 1, '1', NULL, 1, '04/19/24', 'S31041924-563', '98545', NULL, 'lorem ipsum doller sit', '012345678', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-19 15:28:31', '2024-04-19 15:31:49', 1, 7, NULL, NULL, 'Email', NULL, '885', '11', NULL),
(33, 0, 1, NULL, NULL, NULL, '04/23/24', 'S32042324-359', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-23 14:20:32', '2024-04-23 14:20:32', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(34, 0, 1, '3', 6, 3, '04/23/24', 'S34042324-375', '8:00am - 5:00pm', NULL, NULL, NULL, NULL, NULL, NULL, '<p>Check if Ralp Bell is available for this project.&nbsp;</p>', NULL, '<p class=\"MsoNormal\"><b><u><span style=\"font-size:8.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:\r\nCalibri;mso-fareast-theme-font:minor-latin\">Laptop REQUIRED<o:p></o:p></span></u></b></p><p class=\"MsoNormal\"><span style=\"font-size:8.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:\r\nCalibri;mso-fareast-theme-font:minor-latin\">P-Touch Label Maker<o:p></o:p></span></p><p class=\"MsoNormal\"><span style=\"font-size:8.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:\r\nCalibri;mso-fareast-theme-font:minor-latin\">Butt set REQUIRED<o:p></o:p></span></p><p class=\"MsoNormal\"><span style=\"font-size:8.0pt;font-family:&quot;Arial&quot;,sans-serif;\r\nmso-fareast-font-family:Calibri;mso-fareast-theme-font:minor-latin\">Camera to\r\ntake pictures: REQUIRED<o:p></o:p></span></p><p class=\"MsoNormal\"><span style=\"font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:\r\nCalibri;mso-fareast-theme-font:minor-latin;background:yellow;mso-highlight:\r\nyellow\">Laptop w/Windows 10 or later WiFi Analyzer Installed</span><span style=\"font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:Calibri;\r\nmso-fareast-theme-font:minor-latin\"><o:p></o:p></span></p><p>\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n</p><p class=\"MsoNormal\"><span style=\"font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:\r\nCalibri;mso-fareast-theme-font:minor-latin\">12’ Ladder&nbsp;<o:p></o:p></span></p>', '<p class=\"MsoNormal\" style=\"margin-bottom:8.0pt;line-height:150%\"><span style=\"font-family: Arial, sans-serif; letter-spacing: 0.15pt;\">**\r\nPictures and documentation of work performed are required **<o:p></o:p></span></p><p class=\"MsoNormal\" style=\"margin-bottom:8.0pt;line-height:150%\"><b><span style=\"font-family: Arial, sans-serif; letter-spacing: 0.15pt;\">. **\r\nField tech will need a laptop and mobile device to troubleshoot with and to\r\nprovide WiFi speed and signal test results **<o:p></o:p></span></b></p><p class=\"MsoNormal\" style=\"margin-bottom:8.0pt;line-height:150%\"><span style=\"font-family: Arial, sans-serif; letter-spacing: 0.15pt;\">Request\r\naccess to the IDF in buildings 3, 12, and 16. And the NEMA boxes for buildings\r\n8 and 11. Work with PM to troubleshoot offline PTPs and switches.<o:p></o:p></span></p><p class=\"MsoListParagraphCxSpFirst\" style=\"margin-bottom:8.0pt;mso-add-space:\r\nauto;text-indent:-.25in;line-height:150%;mso-list:l0 level1 lfo1\"><!--[if !supportLists]--><span style=\"font-family: Symbol; letter-spacing: 0.15pt;\">·<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-kerning: auto; font-optical-sizing: auto; font-feature-settings: normal; font-variation-settings: normal; font-variant-position: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times New Roman&quot;;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n</span></span><!--[endif]--><span style=\"font-family: Arial, sans-serif; letter-spacing: 0.15pt;\">Building\r\n3 IDF PtP 4.199 switch 4.27 signals buildings 1 and 2<o:p></o:p></span></p><p class=\"MsoListParagraphCxSpMiddle\" style=\"margin-bottom:8.0pt;mso-add-space:\r\nauto;text-indent:-.25in;line-height:150%;mso-list:l0 level1 lfo1\"><!--[if !supportLists]--><span style=\"font-family: Symbol; letter-spacing: 0.15pt;\">·<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-kerning: auto; font-optical-sizing: auto; font-feature-settings: normal; font-variation-settings: normal; font-variant-position: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times New Roman&quot;;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n</span></span><!--[endif]--><span style=\"font-family: Arial, sans-serif; letter-spacing: 0.15pt;\">Building\r\n8 NEMA box PtP 4.240 switch 4.21 signals buildings 5, 6, and 7<o:p></o:p></span></p><p class=\"MsoListParagraphCxSpMiddle\" style=\"margin-bottom:8.0pt;mso-add-space:\r\nauto;text-indent:-.25in;line-height:150%;mso-list:l0 level1 lfo1\"><!--[if !supportLists]--><span style=\"font-family: Symbol; letter-spacing: 0.15pt;\">·<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-kerning: auto; font-optical-sizing: auto; font-feature-settings: normal; font-variation-settings: normal; font-variant-position: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times New Roman&quot;;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n</span></span><!--[endif]--><span style=\"font-family: Arial, sans-serif; letter-spacing: 0.15pt;\">Building\r\n11 NEMA box PtP 4.212 switch 4.24 is standalone<o:p></o:p></span></p><p class=\"MsoListParagraphCxSpMiddle\" style=\"margin-bottom:8.0pt;mso-add-space:\r\nauto;text-indent:-.25in;line-height:150%;mso-list:l0 level1 lfo1\"><!--[if !supportLists]--><span style=\"font-family: Symbol; letter-spacing: 0.15pt;\">·<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-kerning: auto; font-optical-sizing: auto; font-feature-settings: normal; font-variation-settings: normal; font-variant-position: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times New Roman&quot;;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n</span></span><!--[endif]--><span style=\"font-family: Arial, sans-serif; letter-spacing: 0.15pt;\">Building\r\n12 IDF PtP 4.214 switch 4.36 signals buildings 21, 22, 23, 24, and 25<o:p></o:p></span></p><p class=\"MsoListParagraphCxSpLast\" style=\"margin-bottom:8.0pt;mso-add-space:\r\nauto;text-indent:-.25in;line-height:150%;mso-list:l0 level1 lfo1\"><!--[if !supportLists]--><span style=\"font-family: Symbol; letter-spacing: 0.15pt;\">·<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-kerning: auto; font-optical-sizing: auto; font-feature-settings: normal; font-variation-settings: normal; font-variant-position: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times New Roman&quot;;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n</span></span><!--[endif]--><span style=\"font-family: Arial, sans-serif; letter-spacing: 0.15pt;\">Building\r\n16 IDF PtP 4.193 switch 4.40 signals buildings 17, 18, 19, and 20<o:p></o:p></span></p><p>\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n</p><p class=\"MsoNormal\" style=\"margin-bottom:8.0pt;line-height:150%\"><span style=\"font-family: Arial, sans-serif; letter-spacing: 0.15pt;\">The\r\ngoal of this tech dispatch is to troubleshoot the offline switches and ensure\r\nthe proper functioning and connectivity of the equipment. Especially addressing\r\nthe WiFi signal and stability.<o:p></o:p></span></p>', NULL, NULL, '[\"34_Quad.jpg\"]', '2024-04-23 14:52:38', '2024-04-25 17:36:56', 5, 8, NULL, NULL, 'Email', NULL, '04/25/24', '2', '<p>1. Photos of each IDF</p><p>2. email all deliverables to xxx@xxx.com</p>'),
(35, 0, 1, NULL, NULL, NULL, '04/23/24', 'S35042324-473', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-23 17:06:52', '2024-04-23 17:06:52', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(36, 0, 1, NULL, NULL, NULL, '04/23/24', 'S36042324-599', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-23 17:07:26', '2024-04-23 17:07:26', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(37, 0, 1, NULL, NULL, NULL, '04/24/24', 'S37042424-948', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-23 18:50:49', '2024-04-23 18:50:49', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(38, 0, 2, NULL, NULL, NULL, '04/24/24', 'P38042424-403', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-23 18:51:50', '2024-04-23 18:51:50', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(39, 0, 1, NULL, NULL, NULL, '04/24/24', 'S39042424-404', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-23 18:52:37', '2024-04-23 18:52:37', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(40, 0, 1, '1', 3, 3, '04/24/24', 'S40042424-529', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '<p>test</p>', NULL, '<p>test</p>', '<p>test</p><p><br></p>', NULL, NULL, NULL, '2024-04-23 18:54:16', '2024-04-25 17:42:21', 5, 3, NULL, NULL, 'Email', NULL, NULL, NULL, '<p>test</p>'),
(41, 0, 1, NULL, NULL, NULL, '04/24/24', 'S41042424-104', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-23 19:36:25', '2024-04-23 19:36:25', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(42, 0, 1, NULL, NULL, 1, NULL, 'S420424249402', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-24 05:05:20', '2024-04-25 05:25:16', 1, 2, NULL, NULL, 'Email', NULL, NULL, NULL, NULL),
(43, 0, 1, NULL, NULL, NULL, '04/24/24', 'S430424246899', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-24 15:16:31', '2024-04-24 15:16:31', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(44, 0, 1, NULL, NULL, NULL, '04/25/24', 'S440425245509', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-25 16:27:19', '2024-04-25 16:27:19', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(45, 0, 1, NULL, NULL, NULL, '04/25/24', 'S450425241633', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-25 16:27:24', '2024-04-25 16:27:24', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(46, 0, 1, '1', NULL, 3, '04/25/24', 'S460425246976', '9am - 6pm', NULL, NULL, NULL, NULL, NULL, NULL, '<p>Send Ralph</p>', NULL, '<p class=\"MsoNormal\"><b><u><span style=\"font-size:8.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:\r\nCalibri;mso-fareast-theme-font:minor-latin\">Laptop REQUIRED<o:p></o:p></span></u></b></p><p class=\"MsoNormal\"><span style=\"font-size:8.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:\r\nCalibri;mso-fareast-theme-font:minor-latin\">P-Touch Label Maker<o:p></o:p></span></p><p class=\"MsoNormal\"><span style=\"font-size:8.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:\r\nCalibri;mso-fareast-theme-font:minor-latin\">Butt set REQUIRED<o:p></o:p></span></p><p class=\"MsoNormal\"><span style=\"font-size:8.0pt;font-family:&quot;Arial&quot;,sans-serif;\r\nmso-fareast-font-family:Calibri;mso-fareast-theme-font:minor-latin\">Camera to\r\ntake pictures: REQUIRED<o:p></o:p></span></p><p class=\"MsoNormal\"><span style=\"font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:\r\nCalibri;mso-fareast-theme-font:minor-latin;background:yellow;mso-highlight:\r\nyellow\">Laptop w/Windows 10 or later; please download Wi-Fi Analyzer before\r\ngoing to site.</span><span style=\"font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:\r\nCalibri;mso-fareast-theme-font:minor-latin\"> <o:p></o:p></span></p><p class=\"MsoNormal\"><span style=\"font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:\r\nCalibri;mso-fareast-theme-font:minor-latin;background:yellow;mso-highlight:\r\nyellow\">18’ Ladder <o:p></o:p></span></p><p>\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n</p><p class=\"MsoNormal\"><span style=\"font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:\r\nCalibri;mso-fareast-theme-font:minor-latin;background:yellow;mso-highlight:\r\nyellow\">Laser Alignment Tool</span><span style=\"font-family:&quot;Arial&quot;,sans-serif;\r\nmso-fareast-font-family:Calibri;mso-fareast-theme-font:minor-latin\"><o:p></o:p></span></p>', '<p class=\"MsoNormal\" style=\"margin-bottom:8.0pt;line-height:107%\"><b><span style=\"font-size: 12pt; line-height: 107%; font-family: Arial, sans-serif;\">Scope Of Work: <o:p></o:p></span></b></p>\r\n\r\n<p class=\"MsoNormal\"><b><u><span style=\"font-size:12.0pt;font-family:&quot;Cambria&quot;,serif\">&nbsp;</span></u></b></p>\r\n\r\n<p class=\"MsoListParagraphCxSpFirst\" style=\"text-indent:-.25in;mso-list:l0 level1 lfo1\"><!--[if !supportLists]--><span style=\"font-size:12.0pt;font-family:Symbol;mso-fareast-font-family:Symbol;\r\nmso-bidi-font-family:Symbol\">·<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-kerning: auto; font-optical-sizing: auto; font-feature-settings: normal; font-variation-settings: normal; font-variant-position: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times New Roman&quot;;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n</span></span><!--[endif]--><span style=\"font-size:12.0pt;font-family:&quot;Cambria&quot;,serif\">MDF:&nbsp; <o:p></o:p></span></p>\r\n\r\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"margin-left:1.0in;mso-add-space:\r\nauto;text-indent:-.25in;mso-list:l0 level2 lfo1\"><!--[if !supportLists]--><span style=\"font-size:12.0pt;font-family:&quot;Courier New&quot;;mso-fareast-font-family:&quot;Courier New&quot;\">o<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-kerning: auto; font-optical-sizing: auto; font-feature-settings: normal; font-variation-settings: normal; font-variant-position: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times New Roman&quot;;\">&nbsp;&nbsp;\r\n</span></span><!--[endif]--><span style=\"font-size:12.0pt;font-family:&quot;Cambria&quot;,serif\">Install\r\n(1) 10 port Cisco Switch<o:p></o:p></span></p>\r\n\r\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"margin-left:1.0in;mso-add-space:\r\nauto;text-indent:-.25in;mso-list:l0 level2 lfo1\"><!--[if !supportLists]--><span style=\"font-size:12.0pt;font-family:&quot;Courier New&quot;;mso-fareast-font-family:&quot;Courier New&quot;\">o<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-kerning: auto; font-optical-sizing: auto; font-feature-settings: normal; font-variation-settings: normal; font-variant-position: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times New Roman&quot;;\">&nbsp;&nbsp;\r\n</span></span><!--[endif]--><span style=\"font-size:12.0pt;font-family:&quot;Cambria&quot;,serif\">Install\r\n(1) Peplink Controller in MDF <o:p></o:p></span></p>\r\n\r\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"margin-left:1.0in;mso-add-space:\r\nauto;text-indent:-.25in;mso-list:l0 level2 lfo1\"><!--[if !supportLists]--><span style=\"font-size:12.0pt;font-family:&quot;Courier New&quot;;mso-fareast-font-family:&quot;Courier New&quot;\">o<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-kerning: auto; font-optical-sizing: auto; font-feature-settings: normal; font-variation-settings: normal; font-variant-position: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times New Roman&quot;;\">&nbsp;&nbsp;\r\n</span></span><!--[endif]--><span style=\"font-size:12.0pt;font-family:&quot;Cambria&quot;,serif\">Patch\r\nin all AP and tie cables<o:p></o:p></span></p>\r\n\r\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"text-indent:-.25in;mso-list:l0 level1 lfo1\"><!--[if !supportLists]--><span style=\"font-size:12.0pt;font-family:Symbol;mso-fareast-font-family:Symbol;\r\nmso-bidi-font-family:Symbol\">·<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-kerning: auto; font-optical-sizing: auto; font-feature-settings: normal; font-variation-settings: normal; font-variant-position: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times New Roman&quot;;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n</span></span><!--[endif]--><span style=\"font-size:12.0pt;font-family:&quot;Cambria&quot;,serif\">IDFs\r\n(11)<o:p></o:p></span></p>\r\n\r\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"margin-left:1.0in;mso-add-space:\r\nauto;text-indent:-.25in;mso-list:l0 level2 lfo1\"><!--[if !supportLists]--><span style=\"font-size:12.0pt;font-family:&quot;Courier New&quot;;mso-fareast-font-family:&quot;Courier New&quot;\">o<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-kerning: auto; font-optical-sizing: auto; font-feature-settings: normal; font-variation-settings: normal; font-variant-position: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times New Roman&quot;;\">&nbsp;&nbsp;\r\n</span></span><!--[endif]--><span style=\"font-size:12.0pt;font-family:&quot;Cambria&quot;,serif\">Install\r\n(11) 10 port Cisco Switches in 12 IDFs<o:p></o:p></span></p>\r\n\r\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"margin-left:1.0in;mso-add-space:\r\nauto;text-indent:-.25in;mso-list:l0 level2 lfo1\"><!--[if !supportLists]--><span style=\"font-size:12.0pt;font-family:&quot;Courier New&quot;;mso-fareast-font-family:&quot;Courier New&quot;\">o<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-kerning: auto; font-optical-sizing: auto; font-feature-settings: normal; font-variation-settings: normal; font-variant-position: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times New Roman&quot;;\">&nbsp;&nbsp;\r\n</span></span><!--[endif]--><span style=\"font-size:12.0pt;font-family:&quot;Cambria&quot;,serif\">Patch\r\nin all AP and tie cables<o:p></o:p></span></p>\r\n\r\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"text-indent:-.25in;mso-list:l0 level1 lfo1\"><!--[if !supportLists]--><span style=\"font-size:12.0pt;font-family:Symbol;mso-fareast-font-family:Symbol;\r\nmso-bidi-font-family:Symbol\">·<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-kerning: auto; font-optical-sizing: auto; font-feature-settings: normal; font-variation-settings: normal; font-variant-position: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times New Roman&quot;;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n</span></span><!--[endif]--><span style=\"font-size:12.0pt;font-family:&quot;Cambria&quot;,serif\">AP’s<o:p></o:p></span></p>\r\n\r\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"margin-left:1.0in;mso-add-space:\r\nauto;text-indent:-.25in;mso-list:l0 level2 lfo1\"><!--[if !supportLists]--><span style=\"font-size:12.0pt;font-family:&quot;Courier New&quot;;mso-fareast-font-family:&quot;Courier New&quot;\">o<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-kerning: auto; font-optical-sizing: auto; font-feature-settings: normal; font-variation-settings: normal; font-variant-position: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times New Roman&quot;;\">&nbsp;&nbsp;\r\n</span></span><!--[endif]--><span style=\"font-size:12.0pt;font-family:&quot;Cambria&quot;,serif\">Install\r\n(76) Indoor Ruckus R320 Access Points according to the provided floor plans<o:p></o:p></span></p>\r\n\r\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"margin-left:1.0in;mso-add-space:\r\nauto;text-indent:-.25in;mso-list:l0 level2 lfo1\"><!--[if !supportLists]--><span style=\"font-size:12.0pt;font-family:&quot;Courier New&quot;;mso-fareast-font-family:&quot;Courier New&quot;\">o<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-kerning: auto; font-optical-sizing: auto; font-feature-settings: normal; font-variation-settings: normal; font-variant-position: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times New Roman&quot;;\">&nbsp;&nbsp;\r\n</span></span><!--[endif]--><span style=\"font-size:12.0pt;font-family:&quot;Cambria&quot;,serif\">Install\r\n(3) Indoor Ruckus R550 Access Points according to the provided floor plans<o:p></o:p></span></p>\r\n\r\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"margin-left:1.0in;mso-add-space:\r\nauto;text-indent:-.25in;mso-list:l0 level2 lfo1\"><!--[if !supportLists]--><span style=\"font-size:12.0pt;font-family:&quot;Courier New&quot;;mso-fareast-font-family:&quot;Courier New&quot;\">o<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-kerning: auto; font-optical-sizing: auto; font-feature-settings: normal; font-variation-settings: normal; font-variant-position: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times New Roman&quot;;\">&nbsp;&nbsp;\r\n</span></span><!--[endif]--><span style=\"font-size:12.0pt;font-family:&quot;Cambria&quot;,serif\">Install\r\n(3) Outdoor Ruckus T310 Access Points according to the provided floor plans<o:p></o:p></span></p>\r\n\r\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"margin-left:1.0in;mso-add-space:\r\nauto;text-indent:-.25in;mso-list:l0 level2 lfo1\"><!--[if !supportLists]--><span style=\"font-size:12.0pt;font-family:&quot;Courier New&quot;;mso-fareast-font-family:&quot;Courier New&quot;\">o<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-kerning: auto; font-optical-sizing: auto; font-feature-settings: normal; font-variation-settings: normal; font-variant-position: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times New Roman&quot;;\">&nbsp;&nbsp;\r\n</span></span><!--[endif]--><span style=\"font-size:12.0pt;font-family:&quot;Cambria&quot;,serif\">Provide\r\npictures of each installed AP, MDF &amp; IDFs<o:p></o:p></span></p>\r\n\r\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"margin-left:1.5in;mso-add-space:\r\nauto;text-indent:-.25in;mso-list:l0 level3 lfo1\"><!--[if !supportLists]--><span style=\"font-size:12.0pt;font-family:Wingdings;mso-fareast-font-family:Wingdings;\r\nmso-bidi-font-family:Wingdings\">§<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-kerning: auto; font-optical-sizing: auto; font-feature-settings: normal; font-variation-settings: normal; font-variant-position: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times New Roman&quot;;\">&nbsp; </span></span><!--[endif]--><span style=\"font-size:12.0pt;font-family:&quot;Cambria&quot;,serif\">Document the location of\r\neach installed AP<o:p></o:p></span></p>\r\n\r\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"text-indent:-.25in;mso-list:l0 level1 lfo1\"><!--[if !supportLists]--><span style=\"font-size:12.0pt;font-family:Symbol;mso-fareast-font-family:Symbol;\r\nmso-bidi-font-family:Symbol\">·<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-kerning: auto; font-optical-sizing: auto; font-feature-settings: normal; font-variation-settings: normal; font-variant-position: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times New Roman&quot;;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n</span></span><!--[endif]--><span style=\"font-size:12.0pt;font-family:&quot;Cambria&quot;,serif\">PTMP<o:p></o:p></span></p>\r\n\r\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"margin-left:1.0in;mso-add-space:\r\nauto;text-indent:-.25in;mso-list:l0 level2 lfo1\"><!--[if !supportLists]--><span style=\"font-size:12.0pt;font-family:&quot;Courier New&quot;;mso-fareast-font-family:&quot;Courier New&quot;\">o<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-kerning: auto; font-optical-sizing: auto; font-feature-settings: normal; font-variation-settings: normal; font-variant-position: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times New Roman&quot;;\">&nbsp;&nbsp;\r\n</span></span><!--[endif]--><span style=\"font-size:12.0pt;font-family:&quot;Cambria&quot;,serif\">Install\r\n(17) Antenna Mounts<o:p></o:p></span></p>\r\n\r\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"margin-left:1.0in;mso-add-space:\r\nauto;text-indent:-.25in;mso-list:l0 level2 lfo1\"><!--[if !supportLists]--><span style=\"font-size:12.0pt;font-family:&quot;Courier New&quot;;mso-fareast-font-family:&quot;Courier New&quot;\">o<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-kerning: auto; font-optical-sizing: auto; font-feature-settings: normal; font-variation-settings: normal; font-variant-position: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times New Roman&quot;;\">&nbsp;&nbsp;\r\n</span></span><!--[endif]--><span style=\"font-size:12.0pt;font-family:&quot;Cambria&quot;,serif\">Install\r\n(4) Siklu Base Stations according to the provided floor plans<o:p></o:p></span></p>\r\n\r\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"margin-left:1.0in;mso-add-space:\r\nauto;text-indent:-.25in;mso-list:l0 level2 lfo1\"><!--[if !supportLists]--><span style=\"font-size:12.0pt;font-family:&quot;Courier New&quot;;mso-fareast-font-family:&quot;Courier New&quot;\">o<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-kerning: auto; font-optical-sizing: auto; font-feature-settings: normal; font-variation-settings: normal; font-variant-position: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times New Roman&quot;;\">&nbsp;&nbsp;\r\n</span></span><!--[endif]--><span style=\"font-size:12.0pt;font-family:&quot;Cambria&quot;,serif\">Install\r\n(13) Siklu Terminals according to the provided floor plans<o:p></o:p></span></p>\r\n\r\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"text-indent:-.25in;mso-list:l0 level1 lfo1\"><!--[if !supportLists]--><span style=\"font-size:12.0pt;font-family:Symbol;mso-fareast-font-family:Symbol;\r\nmso-bidi-font-family:Symbol\">·<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-kerning: auto; font-optical-sizing: auto; font-feature-settings: normal; font-variation-settings: normal; font-variant-position: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times New Roman&quot;;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n</span></span><!--[endif]--><span style=\"font-size:12.0pt;font-family:&quot;Cambria&quot;,serif\">Capture\r\n-db levels using Wi-Fi analyzer and test speed (speedtest.net)<o:p></o:p></span></p>\r\n\r\n<p class=\"MsoListParagraphCxSpMiddle\" style=\"text-indent:-.25in;mso-list:l0 level1 lfo1\"><!--[if !supportLists]--><span style=\"font-size:12.0pt;font-family:Symbol;mso-fareast-font-family:Symbol;\r\nmso-bidi-font-family:Symbol\">·<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-kerning: auto; font-optical-sizing: auto; font-feature-settings: normal; font-variation-settings: normal; font-variant-position: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times New Roman&quot;;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n</span></span><!--[endif]--><span style=\"font-size:12.0pt;font-family:&quot;Cambria&quot;,serif\">Test\r\nwith Spot On to ensure AP’s are online and operational<o:p></o:p></span></p>\r\n\r\n<p class=\"MsoListParagraphCxSpLast\" style=\"text-indent:-.25in;mso-list:l0 level1 lfo1\"><!--[if !supportLists]--><span style=\"font-size:12.0pt;font-family:Symbol;mso-fareast-font-family:Symbol;\r\nmso-bidi-font-family:Symbol\">·<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-kerning: auto; font-optical-sizing: auto; font-feature-settings: normal; font-variation-settings: normal; font-variant-position: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times New Roman&quot;;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n</span></span><!--[endif]--><span style=\"font-size:12.0pt;font-family:&quot;Cambria&quot;,serif\">Clean\r\nUp and Close Out <o:p></o:p></span></p>\r\n\r\n<p class=\"MsoNormal\"><span style=\"font-size:13.0pt;font-family:&quot;Cambria&quot;,serif\">&nbsp;</span></p>\r\n\r\n<p class=\"xxmsonormal\" align=\"center\" style=\"margin: 0in; text-align: center; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><span style=\"font-size:14.0pt;font-family:&quot;Cambria&quot;,serif;\r\nmso-bidi-font-family:Calibri;color:#242424\">SOW and pricing assume all cabling\r\ninfrastructure has been done by others, including: backboard installation,\r\ncable installation, terminations, testing and labeling<o:p></o:p></span></p>', NULL, NULL, '[\"46_apikey.PNG\"]', '2024-04-25 16:33:48', '2024-04-30 05:50:16', 5, 2, NULL, NULL, 'Email', NULL, '30.04.2024', NULL, '<p>Pictures of all completed work</p>'),
(47, 0, 1, NULL, NULL, NULL, '04/25/24', 'S470425242790', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-25 17:23:14', '2024-04-25 17:23:14', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(48, 0, 1, NULL, NULL, NULL, '04/26/24', 'S10426241548', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-26 04:06:09', '2024-04-26 04:06:09', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(49, 0, 2, NULL, NULL, NULL, '04/26/24', 'P10426244349', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-26 04:06:49', '2024-04-26 04:06:49', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(50, 0, 3, NULL, NULL, NULL, '04/26/24', 'I10426242850', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-26 04:06:58', '2024-04-26 04:06:58', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `work_order_performeds`
--

DROP TABLE IF EXISTS `work_order_performeds`;
CREATE TABLE IF NOT EXISTS `work_order_performeds` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `work_order_id` bigint NOT NULL,
  `quantity` int NOT NULL,
  `price` decimal(28,8) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `work_request` text COLLATE utf8mb4_unicode_ci,
  `work_perform` text COLLATE utf8mb4_unicode_ci,
  `date` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `work_order_performeds`
--

INSERT INTO `work_order_performeds` (`id`, `work_order_id`, `quantity`, `price`, `description`, `work_request`, `work_perform`, `date`, `created_at`, `updated_at`) VALUES
(1, 1, 10, '52.00000000', 'Deserunt totam incid', 'Dignissimos dolorem', 'Nam veniam distinct', '24/10/23', '2023-10-24 21:34:54', '2023-10-24 21:34:54'),
(2, 1, 712, '418.00000000', 'Dolor modi dolore ea', 'Ea vel rerum illo qu', 'Suscipit voluptatem', '25/10/23', '2023-10-24 22:14:26', '2023-10-24 22:14:26'),
(4, 2, 854, '172.00000000', 'Velit nobis amet su', 'Sit ad expedita ulla', 'Culpa quisquam volup', '25/10/23', '2023-10-24 23:01:27', '2023-10-24 23:01:27'),
(5, 4, 557, '29.00000000', 'Cumque expedita proi', 'Praesentium autem co', 'Et aliquip non et re', '26/10/23', '2023-10-25 19:02:05', '2023-10-25 23:53:25'),
(6, 1, 62, '688.00000000', 'Eius aut suscipit ip', 'Tenetur a nemo liber', 'Et ut molestiae volu', '26/10/23', '2023-10-26 04:15:34', '2023-10-26 04:39:01'),
(7, 1, 920, '657.00000000', 'Occaecat aute except', 'Sunt minus porro ven', 'Provident a ipsum', '27/10/23', '2023-10-27 03:26:05', '2023-10-27 03:26:05'),
(8, 5, 934, '558.00000000', 'Consequatur magna d', 'Sed dolor nostrud re', 'Ullam adipisci ullam', '29/10/23', '2023-10-28 23:25:07', '2023-10-28 23:25:07'),
(9, 6, 167, '105.00000000', 'Aut sapiente labore', 'Quam ad quis maiores', 'Proident quaerat la', '29/10/23', '2023-10-28 23:44:24', '2023-10-28 23:44:24'),
(10, 7, 849, '647.00000000', 'Ullam qui sit in cul', 'Quo sint tenetur et', 'Facere aliqua Volup', '31/10/23', '2023-10-31 03:15:45', '2023-10-31 03:15:45'),
(11, 11, 928, '892.00000000', 'Velit numquam cum i', 'Quisquam sed sit et', 'Velit nostrud et sin', '01/11/23', '2023-10-31 19:15:19', '2023-10-31 19:15:19'),
(12, 9, 18, '520.00000000', 'Natus nostrud beatae', 'Incidunt fuga Cupi', 'Irure est quibusdam', '01/11/23', '2023-10-31 21:10:46', '2023-10-31 22:04:43'),
(13, 10, 329, '722.00000000', 'Illo ut at consectet', 'Quis ipsam temporibu', 'Laborum et veniam v', '22/11/23', '2023-11-22 14:38:18', '2023-11-22 14:38:18'),
(14, 11, 860, '715.00000000', 'Qui iste sint quas s', 'Commodo dolores dolo', 'Cum iure non volupta', '29/11/23', '2023-11-29 11:36:44', '2023-11-29 11:36:44'),
(15, 6, 175, '111.00000000', 'Fuga Excepturi aliq', 'Quis nesciunt cum a', 'Est sequi sit expli', '04/05/24', '2024-04-05 16:00:34', '2024-04-05 16:00:34');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `technician_skills`
--
ALTER TABLE `technician_skills`
  ADD CONSTRAINT `technician_skills_skill_id_foreign` FOREIGN KEY (`skill_id`) REFERENCES `skill_categories` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `technician_skills_technician_id_foreign` FOREIGN KEY (`technician_id`) REFERENCES `technicians` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `work_orders`
--
ALTER TABLE `work_orders`
  ADD CONSTRAINT `customer delation` FOREIGN KEY (`slug`) REFERENCES `customers` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
