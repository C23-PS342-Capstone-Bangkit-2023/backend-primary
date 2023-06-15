-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 07, 2023 at 01:03 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cp_2023`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `user_id` varchar(25) NOT NULL,
  `name` varchar(35) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` text NOT NULL,
  `age` int(11) UNSIGNED NOT NULL,
  `body_height` int(11) UNSIGNED NOT NULL,
  `body_weight` int(11) UNSIGNED NOT NULL,
  `gender` enum('male','female') DEFAULT NULL,
  `is_pregnant` int(11) UNSIGNED NOT NULL,
  `created_at` bigint(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `history`
--

CREATE TABLE `history` (
  `history_id` varchar(20) NOT NULL,
  `user_id` varchar(25) NOT NULL,
  `title` varchar(30) NOT NULL,
  `history_date` datetime DEFAULT current_timestamp(),
  `total_calories` double(8,4) NOT NULL,
  `total_carb` double(8,4) NOT NULL,
  `total_protein` double(8,4) NOT NULL,
  `total_fat` double(8,4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `history_detail`
--

CREATE TABLE `history_detail` (
  `history_id` varchar(20) NOT NULL,
  `meal_id` varchar(20) NOT NULL,
  `serve` double(8,4) NOT NULL,
  `calories` double(8,4) NOT NULL,
  `carb` double(8,4) NOT NULL,
  `protein` double(8,4) NOT NULL,
  `fat` double(8,4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `meals_data`
--

CREATE TABLE `meals_data` (
  `meal_id` varchar(20) NOT NULL,
  `meal_name` varchar(20) NOT NULL,
  `meal_image` text NOT NULL,
  `calories` double(8,4) NOT NULL,
  `carb` double(8,4) NOT NULL,
  `protein` double(8,4) NOT NULL,
  `fat` double(8,4) NOT NULL,
  `tag` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `meals_data`
--



-- --------------------------------------------------------

--
-- Table structure for table `session`
--

CREATE TABLE `session` (
  `user_id` varchar(25) NOT NULL,
  `token` text NOT NULL,
  `token_exp` datetime NOT NULL,
  `device_id` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `suggestion_tag`
--

CREATE TABLE `suggestion_tag` (
  `user_id` varchar(25) NOT NULL,
  `accumalte_tag` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`accumalte_tag`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `history`
--
ALTER TABLE `history`
  ADD PRIMARY KEY (`history_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `history_detail`
--
ALTER TABLE `history_detail`
  ADD KEY `history_id` (`history_id`),
  ADD KEY `meal_id` (`meal_id`);

--
-- Indexes for table `meals_data`
--
ALTER TABLE `meals_data`
  ADD PRIMARY KEY (`meal_id`);

--
-- Indexes for table `session`
--
ALTER TABLE `session`
  ADD PRIMARY KEY (`device_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `suggestion_tag`
--
ALTER TABLE `suggestion_tag`
  ADD KEY `user_id` (`user_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `history`
--
ALTER TABLE `history`
  ADD CONSTRAINT `history_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `account` (`user_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `history_detail`
--
ALTER TABLE `history_detail`
  ADD CONSTRAINT `history_detail_ibfk_1` FOREIGN KEY (`history_id`) REFERENCES `history` (`history_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `history_detail_ibfk_2` FOREIGN KEY (`meal_id`) REFERENCES `meals_data` (`meal_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `session`
--
ALTER TABLE `session`
  ADD CONSTRAINT `session_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `account` (`user_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `suggestion_tag`
--
ALTER TABLE `suggestion_tag`
  ADD CONSTRAINT `suggestion_tag_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `account` (`user_id`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
