-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 06, 2024 at 09:13 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `boarding_house`
--

-- --------------------------------------------------------

--
-- Table structure for table `outstanding_balance`
--

CREATE TABLE `outstanding_balance` (
  `id` int(11) NOT NULL,
  `rental_balance` decimal(10,2) NOT NULL,
  `appliance_balance` decimal(10,2) NOT NULL,
  `total_balance` decimal(10,2) NOT NULL,
  `tenant_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `outstanding_balance`
--

INSERT INTO `outstanding_balance` (`id`, `rental_balance`, `appliance_balance`, `total_balance`, `tenant_id`) VALUES
(889, 3600.00, 150.00, 3750.00, 67),
(890, 3600.00, 150.00, 3750.00, 67),
(891, 3600.00, 150.00, 3750.00, 67),
(892, 3600.00, 150.00, 3750.00, 67),
(893, 3600.00, 150.00, 3750.00, 67),
(894, 3600.00, 150.00, 3750.00, 67),
(895, 3600.00, 150.00, 3750.00, 67),
(896, 3600.00, 150.00, 3750.00, 67),
(897, 3600.00, 150.00, 3750.00, 67),
(898, 3600.00, 150.00, 3750.00, 67),
(899, 3600.00, 150.00, 3750.00, 67),
(900, 3600.00, 150.00, 3750.00, 67),
(901, 3600.00, 150.00, 3750.00, 67),
(902, 3600.00, 150.00, 3750.00, 67),
(903, 3600.00, 150.00, 3750.00, 67),
(904, 3600.00, 150.00, 3750.00, 67),
(905, 3600.00, 150.00, 3750.00, 67),
(906, 3600.00, 150.00, 3750.00, 67),
(907, 3600.00, 150.00, 3750.00, 67),
(908, 3600.00, 150.00, 3750.00, 67),
(909, 3600.00, 150.00, 3750.00, 67),
(910, 3600.00, 150.00, 3750.00, 67),
(911, 3600.00, 150.00, 3750.00, 67),
(912, 3600.00, 150.00, 3750.00, 67),
(913, 3600.00, 150.00, 3750.00, 67),
(914, 3600.00, 150.00, 3750.00, 67),
(915, 3600.00, 150.00, 3750.00, 67),
(916, 3600.00, 150.00, 3750.00, 67),
(917, 3600.00, 150.00, 3750.00, 67),
(918, 3600.00, 150.00, 3750.00, 67),
(919, 3600.00, 150.00, 3750.00, 67),
(920, 3600.00, 150.00, 3750.00, 67),
(921, 3600.00, 150.00, 3750.00, 67),
(922, 3600.00, 150.00, 3750.00, 67),
(923, 3600.00, 150.00, 3750.00, 67);

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `room_no` int(11) NOT NULL,
  `tenant_id` int(11) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `due_date` datetime NOT NULL,
  `appliance_fee` double NOT NULL,
  `rent_payment` double NOT NULL,
  `total_amount` double NOT NULL,
  `price` double NOT NULL,
  `appliance_payment` double NOT NULL,
  `appliance_paid` double NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `id` int(11) NOT NULL,
  `room_no` int(11) NOT NULL,
  `price` double NOT NULL,
  `occupancy` int(11) NOT NULL,
  `availability` int(11) NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `room`
--

INSERT INTO `room` (`id`, `room_no`, `price`, `occupancy`, `availability`, `status`) VALUES
(1, 1, 1200, 0, 0, ''),
(2, 2, 1200, 0, 0, ''),
(3, 3, 1200, 0, 0, ''),
(4, 4, 1200, 0, 0, ''),
(5, 5, 1200, 0, 0, ''),
(6, 6, 1200, 0, 0, ''),
(7, 7, 1200, 0, 0, ''),
(8, 8, 1200, 0, 0, ''),
(9, 9, 1200, 0, 0, ''),
(10, 10, 1200, 0, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `system_settings`
--

CREATE TABLE `system_settings` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `contact` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `system_settings`
--

INSERT INTO `system_settings` (`id`, `name`, `email`, `contact`) VALUES
(1, 'Susan\'s Boarding House Rental Management System', 'susansboardinghouse@gmail.com', '+6948 8542 623');

-- --------------------------------------------------------

--
-- Table structure for table `tenants`
--

CREATE TABLE `tenants` (
  `id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `firstname` varchar(100) NOT NULL,
  `middlename` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `address` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 = active, 0= inactive',
  `appliances` varchar(100) NOT NULL,
  `total_items` int(11) NOT NULL,
  `date_in` date NOT NULL,
  `due_day` int(2) NOT NULL,
  `email_sent` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tenants`
--

INSERT INTO `tenants` (`id`, `room_id`, `firstname`, `middlename`, `lastname`, `gender`, `address`, `email`, `status`, `appliances`, `total_items`, `date_in`, `due_day`, `email_sent`) VALUES
(67, 5, 'kia', 'kia', 'kia', 'Female', 'kia', 'sagarinosheprilheart@gmail.com', 1, 'rice cooker', 1, '2024-06-17', 17, '');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `username` varchar(200) NOT NULL,
  `password` text NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 2 COMMENT '1=Admin,2=Staff'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `password`, `type`) VALUES
(1, 'Administrator', 'admin', '0192023a7bbd73250516f069df18b500', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `outstanding_balance`
--
ALTER TABLE `outstanding_balance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_settings`
--
ALTER TABLE `system_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tenants`
--
ALTER TABLE `tenants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `outstanding_balance`
--
ALTER TABLE `outstanding_balance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=924;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `room`
--
ALTER TABLE `room`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `system_settings`
--
ALTER TABLE `system_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tenants`
--
ALTER TABLE `tenants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
