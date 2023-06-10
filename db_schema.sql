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

INSERT INTO `meals_data` (`meal_id`, `meal_name`, `meal_image`, `calories`, `carb`, `protein`, `fat`, `tag`) VALUES
('M-20230607001', 'Abon haruwan', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 513.0000, 23.7000, 21.3000, 37.0000, 'non-vegan,abon,haruwan,olahan'),
('M-20230607002', 'Abon ikan', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 435.0000, 27.2000, 36.1000, 20.2000, 'non-vegan,abon,ikan,olahan'),
('M-20230607003', 'Alpukat, segar', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 85.0000, 0.9000, 7.7000, 6.5000, 'vegan,buah'),
('M-20230607004', 'Amparan tatak', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 191.0000, 1.3000, 34.0000, 5.5000, 'vegan,kue,olahan'),
('M-20230607005', 'Ampas kacang hijau', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 96.0000, 3.7000, 19.1000, 0.6000, 'vegan,ampas,kacang,olahan'),
('M-20230607006', 'Ampas tahu kukus', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 75.0000, 4.1000, 10.7000, 2.1000, 'vegan,ampas,tahu,olahan'),
('M-20230607007', 'Ampas tahu, kering', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 414.0000, 26.6000, 41.3000, 18.3000, 'vegan,ampas,tahu,olahan,kukus'),
('M-20230607008', 'Anggur hutan, segar', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 30.0000, 0.5000, 6.8000, 0.2000, 'vegan,buah'),
('M-20230607009', 'Anyang, sayur', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 126.0000, 3.4000, 10.3000, 7.9000, 'vegan,olahan'),
('M-20230607010', 'Apang kukus, kue', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 202.0000, 3.0000, 46.7000, 0.3000, 'vegan,kue,olahan'),
('M-20230607011', 'Apel malang, segar', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 57.0000, 0.5000, 12.8000, 0.4000, 'vegan,buah'),
('M-20230607012', 'Apel, segar', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 58.0000, 0.3000, 14.9000, 0.4000, 'vegan,buah'),
('M-20230607013', 'Apem, kue', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 148.0000, 2.0000, 33.9000, 0.5000, 'vegan,kue,olahan'),
('M-20230607014', 'Arbai, segar', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 37.0000, 0.8000, 8.3000, 0.5000, 'vegan,olahan'),
('M-20230607015', 'Ares, sayur', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 113.0000, 0.9000, 11.2000, 7.2000, 'vegan,olahan'),
('M-20230607016', 'Arwan sirsir', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 277.0000, 2.4000, 10.7000, 25.0000, 'vegan,olahan'),
('M-20230607017', 'Asinan Bogor, sayura', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 98.0000, 3.9000, 14.8000, 2.6000, 'vegan,asinan,buah,sayur,olahan'),
('M-20230607018', 'Ayam goreng church t', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 338.0000, 35.2000, 0.4000, 20.6000, 'non-vegan,mentah,ayam,daging,olahan'),
('M-20230607019', 'Ayam goreng church t', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 295.0000, 34.0000, 1.5000, 16.0000, 'non-vegan,mentah,ayam,daging,olahan'),
('M-20230607020', 'Ayam goreng church,t', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 287.0000, 31.0000, 1.7000, 15.7000, 'non-vegan,goreng,ayam,daging,olahan'),
('M-20230607021', 'Ayam goreng kalasan,', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 275.0000, 37.4000, 1.3000, 12.2000, 'non-vegan,goreng,ayam,daging,olahan'),
('M-20230607022', 'Ayam goreng kentucky', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 298.0000, 34.2000, 0.1000, 16.8000, 'non-vegan,goreng,ayam,daging,olahan'),
('M-20230607023', 'Ayam goreng Kentucky', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 286.0000, 32.1000, 1.1000, 16.1000, 'non-vegan,goreng,ayam,daging,olahan'),
('M-20230607024', 'Ayam goreng Kentucky', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 297.0000, 35.9000, 1.6000, 15.2000, 'non-vegan,goreng,ayam,daging,olahan'),
('M-20230607025', 'Ayam goreng mbok ber', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 295.0000, 39.2000, 1.0000, 13.6000, 'non-vegan,goreng,ayam,daging,olahan'),
('M-20230607026', 'Ayam goreng pasundan', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 246.0000, 37.9000, 0.7000, 9.0000, 'non-vegan,goreng,ayam,daging,olahan'),
('M-20230607027', 'Ayam goreng pasundan', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 245.0000, 33.1000, 0.3000, 11.4000, 'non-vegan,goreng,ayam,daging,olahan'),
('M-20230607028', 'Ayam goreng pioneer,', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 295.0000, 37.4000, 0.6000, 14.7000, 'non-vegan,goreng,ayam,daging,olahan'),
('M-20230607029', 'Ayam goreng sukabumi', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 244.0000, 36.7000, 1.0000, 9.2000, 'non-vegan,goreng,ayam,daging,olahan'),
('M-20230607030', 'Ayam goreng sukabumi', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 283.0000, 35.7000, 0.5000, 14.3000, 'non-vegan,goreng,ayam,daging,olahan'),
('M-20230607031', 'Ayam taliwang, masak', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 264.0000, 18.2000, 2.7000, 20.1000, 'non-vegan,goreng,ayam,daging,olahan'),
('M-20230607032', 'Ayam, ampela, goreng', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 270.0000, 32.3000, 9.9000, 11.2000, 'non-vegan,goreng,ayam,daging,olahan'),
('M-20230607033', 'Ayam, usus, goreng', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 473.0000, 45.2000, 13.9000, 26.3000, 'non-vegan,goreng,ayam,daging,olahan'),
('M-20230607034', 'Babi hutan masak ric', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 491.0000, 24.6000, 0.2000, 16.3000, 'non-vegan,olahan'),
('M-20230607035', 'Bagea kelapa asin', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 450.0000, 3.2000, 78.1000, 13.9000, 'vegan,kue,olahan'),
('M-20230607036', 'Bagea kelapa manis', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 452.0000, 1.3000, 80.6000, 13.8000, 'vegan,kue,olahan'),
('M-20230607037', 'Bagea kenari asin', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 529.0000, 3.2000, 63.6000, 29.1000, 'vegan,kue,olahan'),
('M-20230607038', 'Bagea kenari manis', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 523.0000, 3.2000, 64.2000, 28.2000, 'vegan,kue,olahan'),
('M-20230607039', 'Bagea kw 1', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 416.0000, 6.5000, 76.3000, 9.4000, 'vegan,kue,olahan'),
('M-20230607040', 'Bagea kw 2', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 382.0000, 0.3000, 87.2000, 3.5000, 'vegan,kue,olahan'),
('M-20230607041', 'Bakpia, kue', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 272.0000, 8.7000, 44.1000, 6.7000, 'vegan,kue,olahan'),
('M-20230607042', 'Bakwan', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 280.0000, 8.2000, 39.0000, 10.2000, 'vegan,goreng,sayur,olahan'),
('M-20230607043', 'Bantal', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 190.0000, 3.3000, 43.5000, 0.3000, 'vegan,kue,olahan'),
('M-20230607044', 'Baruasa', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 417.0000, 6.5000, 79.3000, 8.2000, 'vegan,kue,olahan'),
('M-20230607045', 'Batar daan', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 107.0000, 2.2000, 19.6000, 2.2000, 'vegan,kue,olahan'),
('M-20230607046', 'Batatas kelapa, ubi,', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 110.0000, 1.4000, 23.4000, 1.1000, 'vegan,kelapa,olahan'),
('M-20230607047', 'Batatas kelapa, ubi,', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 92.0000, 1.2000, 21.0000, 0.3000, 'vegan,kelapan,olahan'),
('M-20230607048', 'Batatas tali, ubi, r', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 182.0000, 2.4000, 42.2000, 0.4000, 'vegan,ubi,olahan'),
('M-20230607049', 'Bayam, kukus', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 30.0000, 1.3000, 5.8000, 0.7000, 'vegan,sayur,mentah'),
('M-20230607050', 'Bayam, rebus', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 23.0000, 1.2000, 3.7000, 0.6000, 'vegan,sayur,mentah'),
('M-20230607051', 'Bayau mi balu, masak', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 313.0000, 6.0000, 44.8000, 12.2000, 'non-vegan,sayur,olahan'),
('M-20230607052', 'Bebek, daging, goren', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 300.0000, 24.0000, 4.5000, 20.7000, 'non-vegan,mentah,bebek,daging'),
('M-20230607053', 'Beberuk', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 65.0000, 1.1000, 3.5000, 5.2000, 'vegan,olahan'),
('M-20230607054', 'Beef burger', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 258.0000, 10.6000, 32.5000, 9.5000, 'non-vegan,burger,daging,olahan'),
('M-20230607055', 'Beef teriyaki, masak', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 151.0000, 8.6000, 22.3000, 3.1000, 'non-vegan,goreng,tumis,daging,olahan'),
('M-20230607056', 'Beef yakiniku, masak', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 132.0000, 9.8000, 20.7000, 1.1000, 'non-vegan,goreng,tumis,daging,olahan'),
('M-20230607057', 'Belimbing, segar', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 36.0000, 0.4000, 8.8000, 0.4000, 'vegan,buah'),
('M-20230607058', 'Belitung, talas, kuk', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 145.0000, 1.2000, 34.2000, 0.4000, 'vegan,olahan'),
('M-20230607059', 'Belut, goreng', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 417.0000, 25.9000, 32.0000, 19.4000, 'non-vegan,mentah,belut,daging'),
('M-20230607060', 'Bentul, talas, kukus', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 71.0000, 2.3000, 15.4000, 0.3000, 'vegan,olahan'),
('M-20230607061', 'Beras Cerdas', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 350.0000, 2.7000, 82.3000, 1.1000, 'vegan,beras'),
('M-20230607062', 'Beras ganyong', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 364.0000, 3.4000, 86.3000, 0.7000, 'vegan,beras'),
('M-20230607063', 'Beras Siger', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 344.0000, 1.1000, 28.3000, 0.2000, 'vegan,beras'),
('M-20230607064', 'Betok wadi, masakan', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 145.0000, 16.3000, 4.1000, 7.0000, 'non-vegan,beras'),
('M-20230607065', 'Bihun goreng instan', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 381.0000, 6.1000, 80.3000, 3.9000, 'vegan,goreng,bihun,olahan'),
('M-20230607066', 'Biji nangka/Biji sal', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 262.0000, 2.3000, 51.1000, 5.4000, 'vegan,olahan'),
('M-20230607067', 'Bika ambon', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 199.0000, 2.1000, 44.4000, 1.5000, 'vegan,kue,olahan'),
('M-20230607068', 'Bingka', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 273.0000, 5.3000, 39.1000, 10.6000, 'vegan,kue,olahan'),
('M-20230607069', 'Biskuit', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 458.0000, 6.9000, 75.1000, 14.4000, 'vegan,kue,olahan'),
('M-20230607070', 'Biwah, segar', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 51.0000, 0.3000, 12.1000, 0.1000, 'vegan,buah'),
('M-20230607071', 'Blewah, segar', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 34.0000, 0.8000, 8.2000, 0.2000, 'vegan,buah'),
('M-20230607072', 'Bobengka', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 225.0000, 5.3000, 45.2000, 2.6000, 'vegan,kue,olahan'),
('M-20230607073', 'Bolu peca', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 197.0000, 3.3000, 35.6000, 4.6000, 'vegan,kue,olahan'),
('M-20230607074', 'Botok lamtoro', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 186.0000, 11.7000, 13.0000, 9.7000, 'vegan,kukus,olahan'),
('M-20230607075', 'Bou ninahu ndamate, ', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 79.0000, 6.3000, 1.1000, 1.0000, 'non-vegan,olahan'),
('M-20230607076', 'Bouiki ninahu nggalu', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 94.0000, 7.8000, 10.8000, 2.2000, 'non-vegan,olahan'),
('M-20230607077', 'Brem', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 249.0000, 3.4000, 58.0000, 0.4000, 'vegan,kue,olahan'),
('M-20230607078', 'Brongkos', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 141.0000, 15.3000, 12.6000, 3.3000, 'non-vegan,olahan'),
('M-20230607079', 'Buah atung, segar', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 23.0000, 0.8000, 5.2000, 0.2000, 'vegan,buah'),
('M-20230607080', 'Buah kelenting, sega', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 110.0000, 1.4000, 21.4000, 2.1000, 'vegan,buah'),
('M-20230607081', 'Buah kom, segar', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 264.0000, 4.0000, 59.6000, 1.1000, 'vegan,buah'),
('M-20230607082', 'Buah mentega (Bisbul', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 39.0000, 0.7000, 9.7000, 0.2000, 'vegan,buah'),
('M-20230607083', 'Buah Naga Merah, seg', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 71.0000, 1.7000, 9.1000, 3.1000, 'vegan,buah'),
('M-20230607084', 'Buah Naga Putih, seg', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 56.0000, 0.8000, 10.9000, 1.0000, 'vegan,buah'),
('M-20230607085', 'Buah negri, segar', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 55.0000, 1.2000, 12.2000, 0.1000, 'vegan,buah'),
('M-20230607086', 'Buah nona, segar', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 101.0000, 1.7000, 25.2000, 0.6000, 'vegan,buah'),
('M-20230607087', 'Buah rotan, segar', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 78.0000, 0.6000, 18.2000, 0.3000, 'vegan,buah'),
('M-20230607088', 'Buah rukam, segar', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 113.0000, 0.8000, 26.8000, 0.3000, 'vegan,buah'),
('M-20230607089', 'Buah ruruhi, segar', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 29.0000, 2.1000, 3.6000, 0.7000, 'vegan,buah'),
('M-20230607090', 'Buah tuppa, segar', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 67.0000, 0.4000, 15.9000, 0.2000, 'vegan,buah'),
('M-20230607091', 'Bubur sagu', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 167.0000, 0.2000, 33.0000, 4.0000, 'vegan,bubur,nasi,olahan'),
('M-20230607092', 'Bubur tinotuan (Mana', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 156.0000, 2.3000, 15.6000, 0.2000, 'vegan,bubur,nasi,olahan'),
('M-20230607093', 'Bulgogi, masakan', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 72.0000, 11.4000, 1.4000, 4.9000, 'non-vegan,panggang,daging,olahan'),
('M-20230607094', 'Buncis, rebus', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 30.0000, 2.2000, 6.4000, 0.2000, 'vegan,sayur'),
('M-20230607095', 'Bungkil biji karet', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 333.0000, 29.3000, 50.0000, 3.3000, 'vegan,bubuk'),
('M-20230607096', 'Bungkil kacang tanah', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 336.0000, 37.4000, 30.5000, 13.0000, 'vegan,bubuk'),
('M-20230607097', 'Bungkil kelapa', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 368.0000, 23.0000, 40.0000, 15.0000, 'vegan,bubuk'),
('M-20230607098', 'Buntil daun talas', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 141.0000, 4.4000, 8.0000, 10.2000, 'vegan,rebus,olahan'),
('M-20230607099', 'Cakalang asar (asap ', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 155.0000, 20.1000, 10.2000, 3.8000, 'non-vegan,bakar,ikan,olahan'),
('M-20230607100', 'Cake tape', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 323.0000, 4.9000, 50.1000, 11.5000, 'vegan,kue,olahan');

INSERT INTO `meals_data` (`meal_id`, `meal_name`, `meal_image`, `calories`, `carb`, `protein`, `fat`, `tag`) VALUES
('M-20230607101', 'Cammetutu', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 102.0000, 3.2000, 8.7000, 6.0000, 'vegan,olahan'),
('M-20230607102', 'Cangkuning', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 204.0000, 2.8000, 31.4000, 7.5000, 'vegan,kue,olahan'),
('M-20230607103', 'Cap cai, sayur', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 97.0000, 5.8000, 4.2000, 6.3000, 'vegan,tumis,sayur,olahan'),
('M-20230607104', 'Carica papaya, segar', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 24.0000, 1.9000, 3.7000, 0.2000, 'vegan,buah'),
('M-20230607105', 'Cassavastick', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 460.0000, 0.8000, 17.2000, 18.7000, 'vegan,goreng,singkong,umbi'),
('M-20230607106', 'Cempedak, segar', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 116.0000, 3.0000, 28.6000, 0.4000, 'vegan,buah'),
('M-20230607107', 'Ceriping getuk singk', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 462.0000, 1.2000, 67.7000, 20.7000, 'vegan,goreng,singkong,olahan'),
('M-20230607108', 'Chicken teriyaki, ma', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 168.0000, 13.0000, 7.5000, 9.6000, 'non-vegan,goreng,tumis,ayam,daging,oalahan'),
('M-20230607109', 'Chikiniku, masakan', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 143.0000, 9.8000, 22.8000, 1.4000, 'non-vegan,olahan'),
('M-20230607110', 'Coto mangkasara, kud', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 96.0000, 6.8000, 3.8000, 5.9000, 'non-vegan,rebus,daging,olahan'),
('M-20230607111', 'Coto mangkasara, sap', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 84.0000, 6.0000, 1.4000, 6.0000, 'non-vegan,rebus,daging,olahan'),
('M-20230607112', 'Cucuru bayau, masaka', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 349.0000, 6.8000, 38.3000, 18.7000, 'non-vegan,kukus,kue,olahan'),
('M-20230607113', 'Cumi-cumi, goreng', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 265.0000, 40.6000, 0.0000, 10.1000, 'non-vegan,mentah,cumi-cumi,daging,olahan'),
('M-20230607114', 'Daun kacang panjang,', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 40.0000, 3.7000, 8.0000, 0.3000, 'vegan,daun'),
('M-20230607115', 'Daun katuk, rebus', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 53.0000, 5.3000, 9.1000, 0.9000, 'vegan,daun'),
('M-20230607116', 'Daun kelor, rebus', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 61.0000, 6.1000, 10.0000, 0.9000, 'vegan,daun'),
('M-20230607117', 'Daun mengkudu, kukus', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 63.0000, 3.8000, 11.5000, 1.5000, 'vegan,daun'),
('M-20230607118', 'Daun singkong, rebus', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 31.0000, 3.7000, 4.8000, 0.6000, 'vegan,daun'),
('M-20230607119', 'Daun talas, rebus', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 27.0000, 1.3000, 5.9000, 0.2000, 'vegan,daun'),
('M-20230607120', 'Daun ubi merah, kuku', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 56.0000, 3.1000, 13.0000, 0.3000, 'vegan,daun'),
('M-20230607121', 'Dendeng belut, goren', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 382.0000, 55.7000, 8.0000, 14.1000, 'non-vegan,goreng,belut,daging,olahan'),
('M-20230607122', 'Dendeng mujahir, gor', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 598.0000, 74.3000, 9.2000, 26.9000, 'non-vegan,goreng,ikan,daging,olahan'),
('M-20230607123', 'Djibokum, masakan', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 248.0000, 10.0000, 40.9000, 2.3000, 'non-vegan,olahan'),
('M-20230607124', 'Dodol bali', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 298.0000, 3.7000, 65.9000, 2.1000, 'vegan,olahan'),
('M-20230607125', 'Dodol banjarmasin', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 368.0000, 2.6000, 70.0000, 8.6000, 'vegan,olahan'),
('M-20230607126', 'Dodol galamai', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 348.0000, 0.4000, 76.1000, 3.8000, 'vegan,olahan'),
('M-20230607127', 'Dodol kedondong', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 331.0000, 1.9000, 63.8000, 7.6000, 'vegan,olahan'),
('M-20230607128', 'Dodol manado', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 373.0000, 4.3000, 51.9000, 16.5000, 'vegan,olahan'),
('M-20230607129', 'Duku, segar', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 63.0000, 1.0000, 16.1000, 0.2000, 'vegan,buah'),
('M-20230607130', 'Durian, segar', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 134.0000, 2.5000, 28.0000, 3.0000, 'vegan,buah'),
('M-20230607131', 'Duwet, segar', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 80.0000, 0.5000, 18.2000, 0.6000, 'vegan,buah'),
('M-20230607132', 'Embacang, segar', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 98.0000, 1.4000, 25.4000, 0.2000, 'vegan,buah'),
('M-20230607133', 'Empal (daging) Goren', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 248.0000, 36.2000, 10.1000, 6.9000, 'non-vegan,goreng,daging,olahan'),
('M-20230607134', 'Emping (kerupuk meli', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 345.0000, 12.0000, 71.5000, 1.5000, 'vegan,goreng,keripik,olahan'),
('M-20230607135', 'Emping beras', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 403.0000, 10.6000, 85.3000, 2.2000, 'vegan,goreng,keripik,olahan'),
('M-20230607136', 'Emping komak', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 355.0000, 17.8000, 60.7000, 4.6000, 'vegan,goreng,keripik,olahan'),
('M-20230607137', 'Encung asam, segar', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 122.0000, 3.5000, 17.5000, 4.5000, 'vegan,buah'),
('M-20230607138', 'Enting-enting gepuk ', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 538.0000, 13.6000, 52.6000, 30.3000, 'vegan,kue,olahan'),
('M-20230607139', 'Enting-enting gepuk ', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 524.0000, 13.3000, 52.0000, 29.2000, 'vegan,kue,olahan'),
('M-20230607140', 'Enting-enting wijen', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 565.0000, 18.2000, 36.8000, 38.4000, 'vegan,kue,olahan'),
('M-20230607141', 'Erbis, segar', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 70.0000, 0.6000, 18.9000, 0.0000, 'vegan,buah'),
('M-20230607142', 'Es krim', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 210.0000, 4.0000, 20.6000, 12.5000, 'non-vegan,susu,olahan'),
('M-20230607143', 'Fillet o-fish', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 270.0000, 12.3000, 19.3000, 15.9000, 'non-vegan,goreng,ikan,daging'),
('M-20230607144', 'Gado-gado', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 137.0000, 6.1000, 21.0000, 3.2000, 'vegan,mentah,sayur,olahan'),
('M-20230607145', 'Gadung, ubi, kukus', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 88.0000, 0.6000, 20.9000, 0.3000, 'vegan,mentah,umbi'),
('M-20230607146', 'Gandaria masak', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 68.0000, 0.7000, 18.0000, 0.1000, 'vegan,buah,olahan'),
('M-20230607147', 'Ganyong, rebus', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 100.0000, 0.8000, 23.8000, 0.2000, 'vegan,mentah,umbi'),
('M-20230607148', 'Gatep, segar', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 191.0000, 4.5000, 39.7000, 1.5000, 'vegan,buah'),
('M-20230607149', 'Gatot', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 347.0000, 1.3000, 83.8000, 0.7000, 'vegan,buah'),
('M-20230607150', 'Geblek', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 195.0000, 0.4000, 44.4000, 1.7000, 'vegan,buah'),
('M-20230607151', 'Gemblong', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 274.0000, 1.7000, 55.5000, 5.4000, 'vegan,goreng,ketan,olahan'),
('M-20230607152', 'Gendar goreng', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 407.0000, 6.4000, 32.0000, 28.2000, 'vegan,goreng,keripik,olahan,nasi'),
('M-20230607153', 'Geplak', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 350.0000, 1.4000, 53.6000, 14.4000, 'vegan,rebus,singkong,olahan'),
('M-20230607154', 'Geplak jahe', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 462.0000, 3.1000, 57.7000, 24.4000, 'vegan,olahan'),
('M-20230607155', 'Gete kuah asam, masa', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 75.0000, 8.2000, 6.0000, 2.0000, 'non-vegan,olahan'),
('M-20230607156', 'Getuk goreng', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 360.0000, 1.3000, 74.3000, 6.4000, 'vegan,olahan'),
('M-20230607157', 'Getuk singkong', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 204.0000, 0.5000, 47.4000, 1.4000, 'vegan,olahan'),
('M-20230607158', 'Gudeg, sayur', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 160.0000, 3.3000, 16.0000, 9.2000, 'vegan,goreng,tumis,sayur,nangka'),
('M-20230607159', 'Gulai asam keueung, ', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 52.0000, 10.0000, 1.8000, 0.5000, 'non-vegan,rebus,ikan,olahan'),
('M-20230607160', 'Gulai ikan paya, mas', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 148.0000, 10.0000, 5.0000, 9.8000, 'non-vegan,rebus,ikan,olahan'),
('M-20230607161', 'Gulai ikan, masakan', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 106.0000, 16.5000, 2.5000, 3.3000, 'non-vegan,rebus,daging,olahan'),
('M-20230607162', 'Gulai kambing', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 126.0000, 4.2000, 6.2000, 9.4000, 'non-vegan,rebus,daging,olahan'),
('M-20230607163', 'Gulai keumamah, masa', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 110.0000, 5.9000, 3.2000, 8.2000, 'non-vegan,rebus,ikan,olahan'),
('M-20230607164', 'Gulai pakis', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 143.0000, 4.0000, 6.0000, 11.4000, 'vegan,rebus,sayur,olahan'),
('M-20230607165', 'Gulai pliek', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 176.0000, 7.3000, 3.2000, 14.9000, 'vegan,rebus,sayur,olahan'),
('M-20230607166', 'Gulai tiram, masakan', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 132.0000, 9.0000, 7.8000, 7.2000, 'non-vegan,rebus,jamur,olahan'),
('M-20230607167', 'Gurame asem manis, m', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 192.0000, 12.7000, 12.7000, 10.1000, 'non-vegan,goreng,ikan,daging,olahan'),
('M-20230607168', 'Gurandil', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 218.0000, 0.5000, 48.5000, 2.5000, 'vegan,kue,olahan'),
('M-20230607169', 'Ham', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 384.0000, 16.9000, 0.3000, 35.0000, 'non-vegan,mentah,daging,olahan'),
('M-20230607170', 'Hangop', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 65.0000, 10.0000, 3.5000, 1.0000, 'non-vegan,fermentasi,susu,olahan'),
('M-20230607171', 'Ikan asar merah, mas', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 146.0000, 17.7000, 5.6000, 5.9000, 'non-vegan,ikan,olahan'),
('M-20230607172', 'Ikan asin, kering', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 193.0000, 42.0000, 0.0000, 1.5000, 'non-vegan,ikan,olahan'),
('M-20230607173', 'Ikan bandeng presto,', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 296.0000, 17.1000, 11.3000, 20.3000, 'non-vegan,bakar,ikan,olahan'),
('M-20230607174', 'Ikan baung bakar', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 144.0000, 17.8000, 5.2000, 5.8000, 'non-vegan,bakar,ikan,olahan'),
('M-20230607175', 'Ikan Belida bakar', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 128.0000, 18.0000, 7.2000, 3.0000, 'non-vegan,bakar,ikan,olahan'),
('M-20230607176', 'Ikan Gabus, kering', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 268.0000, 58.0000, 0.0000, 4.0000, 'non-vegan,mentah,ikan'),
('M-20230607177', 'Ikan gete, goreng', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 267.0000, 23.1000, 0.2000, 19.4000, 'non-vegan,mentah,ikan'),
('M-20230607178', 'Ikan hiu, kering', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 298.0000, 46.3000, 20.2000, 3.6000, 'non-vegan,mentah,ikan'),
('M-20230607179', 'Ikan katombo, asin', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 162.0000, 31.7000, 0.3000, 2.8000, 'non-vegan,mentah,ikan'),
('M-20230607180', 'Ikan kayu, kering', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 302.0000, 70.7000, 0.4000, 1.9000, 'non-vegan,mentah,ikan'),
('M-20230607181', 'Ikan Lais bakar', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 147.0000, 17.5000, 5.4000, 6.5000, 'non-vegan,bakar,ikan,olahan'),
('M-20230607182', 'Ikan Mas pepes', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 209.0000, 15.2000, 11.8000, 11.3000, 'non-vegan,kukus,ikan,olahan'),
('M-20230607183', 'Ikan mujahir goreng', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 416.0000, 46.9000, 0.0000, 23.9000, 'non-vegan,goreng,ikan,olahan'),
('M-20230607184', 'Ikan Mujahir pepes', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 121.0000, 21.7000, 0.8000, 2.8000, 'non-vegan,kukus,ikan,olahan'),
('M-20230607185', 'Ikan Papuyu, bakar', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 152.0000, 17.6000, 6.7000, 6.1000, 'non-vegan,mentah,ikan'),
('M-20230607186', 'Ikan Patin, bakar', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 144.0000, 17.5000, 4.3000, 6.3000, 'non-vegan,mentah,ikan'),
('M-20230607187', 'Ikan sanggang, masak', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 240.0000, 21.7000, 20.7000, 7.7000, 'non-vegan,mentah,ikan'),
('M-20230607188', 'Intip goreng', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 474.0000, 7.6000, 62.3000, 21.6000, 'vegan,goreng,nasi,olahan'),
('M-20230607189', 'Jagung gerontol', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 156.0000, 2.7000, 33.3000, 1.3000, 'vegan,sayur,olahan'),
('M-20230607190', 'Jagung kuning pipil,', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 154.0000, 3.8000, 28.4000, 3.5000, 'vegan,mentah,sayur'),
('M-20230607191', 'Jagung muda, rebus', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 142.0000, 5.0000, 30.3000, 0.7000, 'vegan,mentah,sayur'),
('M-20230607192', 'Jagung titi', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 374.0000, 9.4000, 79.1000, 2.2000, 'vegan,mentah,sayur'),
('M-20230607193', 'Jambal goreng', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 286.0000, 48.5000, 2.3000, 9.2000, 'non-vegan,goreng,ikan,olahan'),
('M-20230607194', 'Jambu air, segar', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 46.0000, 0.6000, 11.8000, 0.2000, 'vegan,buah'),
('M-20230607195', 'Jambu biji', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 49.0000, 0.9000, 12.2000, 0.3000, 'vegan,buah'),
('M-20230607196', 'Jambu biji putih tid', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 61.0000, 0.9000, 15.4000, 0.3000, 'vegan,buah'),
('M-20230607197', 'Jambu bol, segar', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 49.0000, 2.3000, 9.6000, 0.2000, 'vegan,buah'),
('M-20230607198', 'Jambu monyet, segar', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 64.0000, 0.7000, 15.8000, 0.6000, 'vegan,buah'),
('M-20230607199', 'Jangang bintatoeng, ', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 107.0000, 5.3000, 16.5000, 2.2000, 'non-vegan,olahan'),
('M-20230607200', 'Japilus', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 500.0000, 1.2000, 67.3000, 25.1000, 'vegan,olahan');

INSERT INTO `meals_data` (`meal_id`, `meal_name`, `meal_image`, `calories`, `carb`, `protein`, `fat`, `tag`) VALUES
('M-20230607201', 'Jeruk bali, segar', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 48.0000, 0.6000, 12.4000, 0.2000, 'vegan,buah'),
('M-20230607202', 'Jeruk banjar, segar', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 61.0000, 0.8000, 14.1000, 0.2000, 'vegan,buah'),
('M-20230607203', 'Jeruk garut-keprok', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 44.0000, 0.8000, 10.9000, 0.3000, 'vegan,buah'),
('M-20230607204', 'Jeruk Kalamansi, seg', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 39.0000, 0.3000, 8.9000, 0.3000, 'vegan,buah'),
('M-20230607205', 'Jeruk manis, segar', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 45.0000, 0.9000, 11.2000, 0.2000, 'vegan,buah'),
('M-20230607206', 'Jeruk nipis, segar', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 44.0000, 0.5000, 10.0000, 0.2000, 'vegan,buah'),
('M-20230607207', 'Jeruk ragi, segar', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 49.0000, 0.7000, 11.1000, 0.2000, 'vegan,buah'),
('M-20230607208', 'Jukku pallu kaloa, m', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 15.0000, 15.2000, 8.8000, 4.3000, 'non-vegan,rebus,ikan,olahan'),
('M-20230607209', 'Kabuto', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 250.0000, 2.6000, 35.4000, 2.5000, 'vegan,goreng,singkong,olahan'),
('M-20230607210', 'Kacang atom', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 533.0000, 27.8000, 28.8000, 38.1000, 'vegan,bijian'),
('M-20230607211', 'Kacang belimbing (ke', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 204.0000, 16.9000, 17.5000, 8.8000, 'vegan,bijian'),
('M-20230607212', 'Kacang bogor, goreng', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 479.0000, 12.7000, 58.9000, 23.2000, 'vegan,bijian'),
('M-20230607213', 'Kacang bogor, rebus', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 161.0000, 7.7000, 27.1000, 2.8000, 'vegan,bijian'),
('M-20230607214', 'Kacang goyang', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 516.0000, 14.7000, 44.4000, 31.1000, 'vegan,bijian'),
('M-20230607215', 'Kacang gude, rebus', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 147.0000, 9.0000, 27.5000, 0.5000, 'vegan,bijian'),
('M-20230607216', 'Kacang hijau, rebus', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 109.0000, 8.7000, 18.3000, 0.5000, 'vegan,bijian'),
('M-20230607217', 'Kacang kedelai, gore', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 521.0000, 32.2000, 22.9000, 37.7000, 'vegan,bijian'),
('M-20230607218', 'Kacang kedelai, rebu', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 189.0000, 20.2000, 12.7000, 8.2000, 'vegan,bijian'),
('M-20230607219', 'Kacang merah kering,', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 158.0000, 10.3000, 28.2000, 0.9000, 'vegan,bijian'),
('M-20230607220', 'Kacang merah segar, ', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 144.0000, 10.0000, 24.7000, 1.0000, 'vegan,bijian'),
('M-20230607221', 'Kacang mete/biji jam', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 629.0000, 20.4000, 19.8000, 56.3000, 'vegan,bijian'),
('M-20230607222', 'Kacang negara', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 480.0000, 18.4000, 58.5000, 19.1000, 'vegan,bijian'),
('M-20230607223', 'Kacang panjang, kuku', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 39.0000, 3.0000, 7.6000, 0.6000, 'vegan,bijian'),
('M-20230607224', 'Kacang panjang, rebu', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 30.0000, 2.3000, 5.8000, 0.4000, 'vegan,bijian'),
('M-20230607225', 'Kacang sukro', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 484.0000, 8.8000, 57.7000, 26.1000, 'vegan,bijian,olahan'),
('M-20230607226', 'Kacang tanah rebus d', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 360.0000, 13.5000, 12.8000, 31.2000, 'vegan,bijian'),
('M-20230607227', 'Kacang tanah sari', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 561.0000, 25.5000, 26.0000, 43.8000, 'vegan,bijian'),
('M-20230607228', 'Kacang tanah, goreng', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 564.0000, 25.5000, 25.5000, 44.4000, 'vegan,rebus,bijian'),
('M-20230607229', 'Kacang tanah, rebus', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 220.0000, 10.6000, 8.0000, 18.0000, 'vegan,bijian'),
('M-20230607230', 'Kacang tolo / tungga', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 138.0000, 10.7000, 22.6000, 1.1000, 'vegan,bijian'),
('M-20230607231', 'Kadada katembe', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 110.0000, 4.5000, 7.1000, 6.9000, 'vegan,rebus,sayur,olahan'),
('M-20230607232', 'Kaholeo, masakan', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 413.0000, 28.7000, 29.8000, 19.8000, 'non-vegan,panggang,ikan,olahan'),
('M-20230607233', 'Kakicak', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 296.0000, 3.4000, 36.7000, 15.1000, 'vegan,olahan'),
('M-20230607234', 'Kalio ayam, masakan', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 203.0000, 16.0000, 4.4000, 13.5000, 'non-vegan,goreng,kaldu,ayam,daging,olahan'),
('M-20230607235', 'Kalio jeroan, masaka', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 163.0000, 16.5000, 4.1000, 9.0000, 'non-vegan,goreng,kaldu,olahan'),
('M-20230607236', 'Kalio kikil (tunjang', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 122.0000, 13.8000, 3.9000, 5.7000, 'non-vegan,goreng,kaldu,olahan'),
('M-20230607237', 'Kalio otak, masakan', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 157.0000, 8.1000, 11.4000, 8.8000, 'non-vegan,goreng,kaldu,olahan'),
('M-20230607238', 'Kalio telur, masakan', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 193.0000, 10.6000, 9.7000, 12.4000, 'non-vegan,goreng,kaldu,olahan'),
('M-20230607239', 'Kambose', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 164.0000, 3.0000, 32.6000, 2.4000, 'vegan,sayur,olahan'),
('M-20230607240', 'Kangkung, kukus', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 30.0000, 3.2000, 4.7000, 0.7000, 'vegan,mentah,sayur'),
('M-20230607241', 'Kangkung, rebus', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 22.0000, 2.5000, 3.1000, 0.6000, 'vegan,mentah,sayur'),
('M-20230607242', 'Kaparende, sayur', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 38.0000, 2.4000, 2.6000, 2.0000, 'vegan,rebus,daging,ikan,olahan'),
('M-20230607243', 'Kapurung', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 41.0000, 2.0000, 7.8000, 0.3000, 'vegan,olahan'),
('M-20230607244', 'Kapusa', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 158.0000, 4.4000, 27.8000, 3.2000, 'vegan,olahan'),
('M-20230607245', 'Karedok, sayur', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 92.0000, 2.2000, 14.1000, 3.3000, 'vegan,olahan'),
('M-20230607246', 'Kawista, segar', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 120.0000, 3.5000, 20.8000, 2.5000, 'vegan,olahan'),
('M-20230607247', 'Kecimpring singkong ', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 464.0000, 1.2000, 73.0000, 18.6000, 'vegan,olahan'),
('M-20230607248', 'Keddo bodong', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 290.0000, 4.6000, 55.2000, 5.7000, 'vegan,olahan'),
('M-20230607249', 'Kedondong masak, seg', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 46.0000, 1.0000, 10.3000, 0.1000, 'vegan,buah'),
('M-20230607250', 'Kedondong, segar', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 47.0000, 0.5000, 10.4000, 0.2000, 'vegan,buah'),
('M-20230607251', 'Keju', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 326.0000, 22.8000, 13.1000, 20.3000, 'non-vegan,olahan'),
('M-20230607252', 'Keju kacang tanah (p', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 590.0000, 27.0000, 20.9000, 49.0000, 'vegan,olahan'),
('M-20230607253', 'Kelapa hutan, kering', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 623.0000, 2.0000, 36.5000, 52.1000, 'vegan,buah'),
('M-20230607254', 'Kelapa muda, daging,', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 68.0000, 1.0000, 14.0000, 0.9000, 'vegan,buah'),
('M-20230607255', 'Kelepon, kue', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 215.0000, 3.7000, 41.8000, 3.7000, 'vegan,kue,olahan'),
('M-20230607256', 'Kemang, segar', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 48.0000, 1.0000, 11.9000, 0.2000, 'vegan,olahan'),
('M-20230607257', 'Kembang tahu', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 380.0000, 48.9000, 23.3000, 13.8000, 'vegan,olahan'),
('M-20230607258', 'Kembang tahu rebus', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 90.0000, 10.7000, 4.7000, 4.0000, 'vegan,rebus,olahan'),
('M-20230607259', 'Keremes', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 475.0000, 1.6000, 64.4000, 25.2000, 'vegan,goreng,olahan'),
('M-20230607260', 'Kereput', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 580.0000, 4.8000, 51.1000, 39.6000, 'vegan,olahan'),
('M-20230607261', 'Keripik bayam', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 586.0000, 4.9000, 50.2000, 40.6000, 'vegan,goreng,keripik,olahan'),
('M-20230607262', 'Keripik gadung', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 446.0000, 2.8000, 76.0000, 14.5000, 'vegan,goreng,keripik,olahan'),
('M-20230607263', 'Keripik kentang', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 448.0000, 2.7000, 67.1000, 18.8000, 'vegan,goreng,keripik,olahan'),
('M-20230607264', 'Keripik oncom', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 598.0000, 8.3000, 42.6000, 43.8000, 'vegan,goreng,keripik,olahan'),
('M-20230607265', 'Keripik singkong', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 478.0000, 0.9000, 72.0000, 20.7000, 'vegan,goreng,keripik,olahan'),
('M-20230607266', 'Keripik singkong ber', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 481.0000, 2.2000, 73.6000, 19.7000, 'vegan,goreng,keripik,olahan'),
('M-20230607267', 'Keripik tempe', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 581.0000, 12.1000, 41.7000, 40.6000, 'vegan,goreng,keripik,olahan'),
('M-20230607268', 'Keripik tempe abadi ', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 556.0000, 15.8000, 39.8000, 37.1000, 'vegan,goreng,keripik,olahan'),
('M-20230607269', 'Keripik tempe abadi ', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 542.0000, 40.3000, 11.6000, 42.4000, 'vegan,goreng,keripik,olahan'),
('M-20230607270', 'Keripik tempe abadi ', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 540.0000, 16.7000, 42.0000, 33.9000, 'vegan,goreng,keripik,olahan'),
('M-20230607271', 'Keripik tempe abadi ', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 510.0000, 12.3000, 52.4000, 27.9000, 'vegan,goreng,keripik,olahan'),
('M-20230607272', 'Keripik tempe abadi ', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 529.0000, 20.8000, 40.2000, 31.7000, 'vegan,goreng,keripik,olahan'),
('M-20230607273', 'Keripik ubi', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 486.0000, 0.2000, 67.6000, 23.9000, 'vegan,goreng,keripik,olahan'),
('M-20230607274', 'Kerupuk cumi goreng', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 444.0000, 6.9000, 71.3000, 14.6000, 'vegan,goreng,kerupuk,olahan'),
('M-20230607275', 'Kerupuk kemplang gor', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 504.0000, 5.6000, 57.1000, 28.1000, 'vegan,goreng,kerupuk,olahan'),
('M-20230607276', 'Kerupuk kemplang pan', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 356.0000, 9.7000, 76.9000, 1.1000, 'vegan,goreng,kerupuk,olahan'),
('M-20230607277', 'Kerupuk mie kuning g', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 476.0000, 0.1000, 71.3000, 21.1000, 'vegan,goreng,kerupuk,olahan'),
('M-20230607278', 'Kerupuk udang goreng', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 477.0000, 4.7000, 68.5000, 20.5000, 'vegan,goreng,kerupuk,olahan'),
('M-20230607279', 'Kerupuk urat', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 588.0000, 53.7000, 1.2000, 40.9000, 'non-vegan,goreng,kerupuk,olahan'),
('M-20230607280', 'Kesemek, segar', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 78.0000, 0.8000, 20.0000, 0.4000, 'vegan,buah'),
('M-20230607281', 'Ketan hitam, matang', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 181.0000, 4.0000, 37.3000, 1.2000, 'vegan,kukus,ketan,olahan'),
('M-20230607282', 'Ketan putih, matang', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 163.0000, 3.0000, 35.7000, 0.4000, 'vegan,kukus,ketan,olahan'),
('M-20230607283', 'Ketela pohon/singkon', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 153.0000, 1.2000, 36.4000, 0.3000, 'vegan,kukus,singkong,olahan'),
('M-20230607284', 'Ketoprak', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 153.0000, 7.9000, 13.0000, 7.7000, 'vegan,kukus,olahan'),
('M-20230607285', 'Ketupat kandangan', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 109.0000, 2.2000, 13.4000, 5.2000, 'vegan,rebus,nasi,olahan'),
('M-20230607286', 'Ketupat ketan', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 212.0000, 4.0000, 38.6000, 4.6000, 'vegan,kukus,olahan,ketan,ketupat'),
('M-20230607287', 'Kokosan, segar', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 86.0000, 1.6000, 13.0000, 0.2000, 'vegan,buah'),
('M-20230607288', 'Kotiu hinela tawang ', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 46.0000, 2.2000, 6.0000, 1.5000, 'vegan,sayur,olahan'),
('M-20230607289', 'Koya', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 366.0000, 4.2000, 77.5000, 4.3000, 'vegan,kue,olahan'),
('M-20230607290', 'Koya mirasa', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 370.0000, 8.0000, 82.2000, 1.0000, 'vegan,kue,olahan'),
('M-20230607291', 'Koyabu', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 241.0000, 3.4000, 47.2000, 4.3000, 'vegan,kue,olahan'),
('M-20230607292', 'Kranji, segar', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 315.0000, 2.1000, 73.5000, 1.4000, 'vegan,buah'),
('M-20230607293', 'Kue ali', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 440.0000, 3.8000, 64.5000, 18.5000, 'vegan,kue,olahan'),
('M-20230607294', 'Kue bangen', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 442.0000, 3.3000, 74.2000, 14.7000, 'vegan,kue,olahan'),
('M-20230607295', 'Kue bangket', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 338.0000, 1.5000, 80.3000, 1.2000, 'vegan,kue,olahan'),
('M-20230607296', 'Kue gelang', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 448.0000, 5.8000, 70.0000, 16.1000, 'vegan,kue,olahan'),
('M-20230607297', 'Kue jahe', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 425.0000, 1.6000, 84.6000, 8.8000, 'vegan,kue,olahan'),
('M-20230607298', 'Kue kelapa', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 591.0000, 5.6000, 47.5000, 42.1000, 'vegan,kue,olahan'),
('M-20230607299', 'Kue koa', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 340.0000, 4.8000, 79.3000, 0.4000, 'vegan,kue,olahan'),
('M-20230607300', 'Kue ku temu', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 214.0000, 3.5000, 49.6000, 0.2000, 'vegan,kue,olahan'),
('M-20230607301', 'Kue lumpur', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 291.0000, 3.6000, 44.1000, 11.1000, 'vegan,kue,olahan');

INSERT INTO `meals_data` (`meal_id`, `meal_name`, `meal_image`, `calories`, `carb`, `protein`, `fat`, `tag`) VALUES
('M-20230607302', 'Kue pelita', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 141.0000, 5.3000, 17.6000, 5.5000, 'vegan,kue,olahan'),
('M-20230607303', 'Kue putu cangkir', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 304.0000, 5.3000, 54.9000, 7.0000, 'vegan,kue,olahan'),
('M-20230607304', 'Kue putu singkong', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 217.0000, 1.2000, 53.2000, 0.5000, 'vegan,kue,olahan'),
('M-20230607305', 'Kue sus', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 221.0000, 7.5000, 24.8000, 10.2000, 'vegan,kue,olahan'),
('M-20230607306', 'Kue thipan', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 247.0000, 2.9000, 49.5000, 4.2000, 'vegan,kue,olahan'),
('M-20230607307', 'Kwaci', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 515.0000, 30.6000, 13.8000, 42.1000, 'vegan,bijian'),
('M-20230607308', 'Kwark (Quark)', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 242.0000, 19.0000, 3.0000, 17.0000, 'non-vegan,olahan'),
('M-20230607309', 'Laksa/Putu mayang', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 121.0000, 1.7000, 21.1000, 3.4000, 'vegan,kue,olahan'),
('M-20230607310', 'Langsat, segar', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 56.0000, 0.9000, 14.3000, 0.2000, 'vegan,buah'),
('M-20230607311', 'Lanting getuk', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 422.0000, 0.9000, 80.4000, 10.8000, 'vegan,olahan'),
('M-20230607312', 'Lapis legit', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 389.0000, 6.6000, 55.5000, 15.7000, 'vegan,kue,olahan'),
('M-20230607313', 'Lawar babi, masakan', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 174.0000, 17.0000, 3.0000, 10.0000, 'non-vegan,olahan'),
('M-20230607314', 'Lawar penyu, masakan', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 141.0000, 23.0000, 7.6000, 1.5000, 'non-vegan,olahan'),
('M-20230607315', 'Lawara jangang, masa', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 159.0000, 5.0000, 10.1000, 10.9000, 'non-vegan,olahan'),
('M-20230607316', 'Lawara penjah, masak', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 207.0000, 7.4000, 9.6000, 15.4000, 'non-vegan,olahan'),
('M-20230607317', 'Lema/Rebung asam', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 15.0000, 1.0000, 1.9000, 0.4000, 'vegan,olahan'),
('M-20230607318', 'Lemon, segar', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 34.0000, 0.5000, 6.2000, 0.8000, 'vegan,buah'),
('M-20230607319', 'Lilin bungkus gedi', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 79.0000, 2.3000, 5.8000, 5.2000, 'vegan,olahan'),
('M-20230607320', 'Lontar, segar', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 27.0000, 0.4000, 6.0000, 0.2000, 'vegan,buah'),
('M-20230607321', 'Lupis ketan', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 164.0000, 1.8000, 34.5000, 2.1000, 'vegan,kukus,ketan,olahan'),
('M-20230607322', 'Manan samin', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 379.0000, 3.4000, 50.6000, 18.1000, 'vegan,olahan'),
('M-20230607323', 'Mangga benggala, seg', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 63.0000, 2.4000, 12.4000, 0.4000, 'vegan,buah'),
('M-20230607324', 'Mangga gedung, segar', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 44.0000, 0.7000, 11.2000, 0.2000, 'vegan,buah'),
('M-20230607325', 'Mangga golek, segar', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 63.0000, 0.5000, 16.7000, 0.2000, 'vegan,buah'),
('M-20230607326', 'Mangga harumanis, se', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 46.0000, 0.4000, 11.9000, 0.2000, 'vegan,buah'),
('M-20230607327', 'Mangga indramayu, se', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 72.0000, 0.8000, 18.7000, 0.2000, 'vegan,buah'),
('M-20230607328', 'Mangga kopek, segar', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 56.0000, 0.4000, 14.6000, 0.2000, 'vegan,buah'),
('M-20230607329', 'Mangga kwini, segar', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 86.0000, 0.7000, 19.8000, 0.5000, 'vegan,buah'),
('M-20230607330', 'Mangga manalagi, seg', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 133.0000, 1.0000, 32.1000, 0.1000, 'vegan,buah'),
('M-20230607331', 'Mangga muda, segar', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 59.0000, 0.5000, 15.1000, 0.4000, 'vegan,buah'),
('M-20230607332', 'Mangga, segar', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 52.0000, 0.7000, 12.3000, 0.0000, 'vegan,buah'),
('M-20230607333', 'Manggis, segar', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 63.0000, 0.6000, 15.6000, 0.6000, 'vegan,buah'),
('M-20230607334', 'Margarin', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 720.0000, 0.6000, 0.4000, 81.0000, 'non-vegan,olahan'),
('M-20230607335', 'Markisa, segar', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 144.0000, 3.5000, 29.8000, 1.2000, 'vegan,buah'),
('M-20230607336', 'Martabak india', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 153.0000, 4.5000, 24.3000, 4.2000, 'vegan,olahan'),
('M-20230607337', 'Martabak mesir', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 278.0000, 5.1000, 45.0000, 8.6000, 'vegan,olahan'),
('M-20230607338', 'Masekat', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 369.0000, 2.1000, 74.1000, 7.0000, 'vegan,olahan'),
('M-20230607339', 'Matoa, segar', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 90.0000, 1.2000, 21.1000, 0.1000, 'vegan,buah'),
('M-20230607340', 'Melinjo emping tebal', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 439.0000, 10.0000, 65.7000, 16.4000, 'vegan,goreng,keripik,olahan'),
('M-20230607341', 'Melinjo emping tebal', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 431.0000, 11.1000, 63.0000, 16.2000, 'vegan,goreng,keripik,olahan'),
('M-20230607342', 'Melinjo emping tipis', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 485.0000, 11.5000, 59.1000, 24.5000, 'vegan,goreng,keripik,olahan'),
('M-20230607343', 'Melon, segar', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 37.0000, 0.6000, 7.8000, 0.4000, 'vegan,buah'),
('M-20230607344', 'Mentega', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 742.0000, 0.5000, 1.4000, 81.6000, 'non-vegan,olahan'),
('M-20230607345', 'Menteng, segar', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 65.0000, 1.7000, 16.1000, 0.3000, 'vegan,olahan'),
('M-20230607346', 'Mentimun Suri, segar', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 16.0000, 1.3000, 2.1000, 0.0000, 'vegan,buah'),
('M-20230607347', 'Mi basah', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 88.0000, 0.6000, 14.0000, 3.3000, 'vegan,mie,olahan'),
('M-20230607348', 'Mi golosor', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 71.0000, 0.2000, 15.9000, 0.8000, 'vegan,mie,olahan'),
('M-20230607349', 'Mi kering', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 339.0000, 10.0000, 6.3000, 1.7000, 'vegan,mie,olahan'),
('M-20230607350', 'Mie aceh rebus', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 113.0000, 3.0000, 18.1000, 3.2000, 'vegan,rebus,mie,olahan'),
('M-20230607351', 'Mie ayam', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 102.0000, 6.2000, 10.5000, 3.9000, 'vegan,rebus,mie,ayam,daging,olahan'),
('M-20230607352', 'Mie bakso', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 114.0000, 5.3000, 16.4000, 3.0000, 'vegan,rebus,mie,daging,olahan'),
('M-20230607353', 'Mie Bendo', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 353.0000, 0.3000, 88.0000, 0.0000, 'vegan,rebus,mie,olahan'),
('M-20230607354', 'Mie celon', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 102.0000, 3.0000, 17.8000, 2.1000, 'vegan,rebus,mie,olahan'),
('M-20230607355', 'Mie pangsit basah', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 105.0000, 5.9000, 9.4000, 4.9000, 'vegan,rebus,mie,olahan'),
('M-20230607356', 'Mie Sagu', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 190.0000, 0.2000, 46.5000, 0.4000, 'vegan,mie,olahan'),
('M-20230607357', 'Misoa', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 345.0000, 8.5000, 78.0000, 2.2000, 'vegan,goreng,kue,olahan'),
('M-20230607358', 'Model, masakan', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 79.0000, 2.2000, 8.6000, 4.0000, 'non-vegan,olahan'),
('M-20230607359', 'Moon tahu', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 128.0000, 8.0000, 1.3000, 10.0000, 'vegan,rebus,tahu,olahan'),
('M-20230607360', 'Mujahir acar kuning,', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 330.0000, 17.8000, 12.1000, 23.4000, 'non-vegan,rebus,ikan,olahan'),
('M-20230607361', 'Naan maran sapi, mas', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 478.0000, 38.3000, 5.1000, 33.9000, 'non-vegan,daging,olahan'),
('M-20230607362', 'Nanas palembang, seg', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 58.0000, 0.7000, 13.3000, 0.2000, 'vegan,buah'),
('M-20230607363', 'Nanas, segar', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 40.0000, 0.6000, 9.9000, 0.3000, 'vegan,buah'),
('M-20230607364', 'Nangka masak pohon, ', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 106.0000, 1.2000, 27.6000, 0.3000, 'vegan,buah'),
('M-20230607365', 'Nasi', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 180.0000, 3.0000, 39.8000, 0.3000, 'vegan,kukus,nasi'),
('M-20230607366', 'Nasi beras merah', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 149.0000, 2.8000, 32.5000, 0.4000, 'vegan,kukus,nasi'),
('M-20230607367', 'Nasi gemuk', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 192.0000, 3.8000, 24.4000, 8.8000, 'vegan,kukus,nasi,olahan'),
('M-20230607368', 'Nasi gurih', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 190.0000, 4.7000, 26.0000, 7.5000, 'vegan,kukus,nasi,olahan'),
('M-20230607369', 'Nasi jagung', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 357.0000, 8.8000, 79.5000, 0.5000, 'vegan,kukus,nasi,olahan'),
('M-20230607370', 'Nasi minyak', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 207.0000, 3.5000, 37.1000, 5.0000, 'vegan,kukus,nasi,olahan'),
('M-20230607371', 'Nasi rames', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 155.0000, 10.3000, 19.1000, 4.2000, 'vegan,kukus,nasi,olahan'),
('M-20230607372', 'Nasi tim', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 120.0000, 2.4000, 26.0000, 0.4000, 'vegan,rebus,nasi'),
('M-20230607373', 'Nasu likku, masakan', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 196.0000, 14.5000, 15.9000, 8.3000, 'non-vegan,goreng,ayam,daging,olahan'),
('M-20230607374', 'Nopia spesial', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 387.0000, 5.3000, 74.3000, 7.6000, 'vegan,olahan'),
('M-20230607375', 'Olah-olah', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 9.0000, 2.1000, 7.1000, 6.0000, 'vegan,olahan'),
('M-20230607376', 'Oncom', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 187.0000, 13.0000, 22.6000, 6.0000, 'vegan,fermentasi,bijian,olahan'),
('M-20230607377', 'Oncom ampas kacang h', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 376.0000, 14.9000, 65.7000, 6.0000, 'vegan,fermentasi,bijian,olahan'),
('M-20230607378', 'Oncom kacang hijau +', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 351.0000, 11.0000, 65.9000, 5.3000, 'vegan,fermentasi,bijian,olahan'),
('M-20230607379', 'Oncom kacang tanah p', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 132.0000, 12.7000, 13.7000, 3.8000, 'vegan,fermentasi,bijian,olahan'),
('M-20230607380', 'Onde-onde', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 336.0000, 4.0000, 57.9000, 9.8000, 'vegan,goreng,kue,olahan'),
('M-20230607381', 'Ongol-ongol sagu', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 111.0000, 0.3000, 21.2000, 2.7000, 'vegan,olahan'),
('M-20230607382', 'Oramu ninahu ndawa o', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 117.0000, 13.7000, 4.3000, 5.0000, 'non-vegan,olahan'),
('M-20230607383', 'Oyek', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 351.0000, 0.9000, 84.9000, 0.9000, 'vegan,olahan'),
('M-20230607384', 'Padamaran', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 171.0000, 3.9000, 18.8000, 8.9000, 'vegan,olahan'),
('M-20230607385', 'Paku hinela wuleleng', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 77.0000, 3.5000, 5.4000, 4.6000, 'vegan,olahan'),
('M-20230607386', 'Pala, daging, segar', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 42.0000, 0.3000, 10.9000, 0.2000, 'vegan,mentah,bijian'),
('M-20230607387', 'Paniki masak santan,', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 460.0000, 28.5000, 7.2000, 35.2000, 'non-vegan,olahan'),
('M-20230607388', 'Papeda', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 61.0000, 0.2000, 14.9000, 0.1000, 'vegan,goreng,olahan'),
('M-20230607389', 'Parede baleh, masaka', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 87.0000, 10.5000, 5.5000, 2.5000, 'non-vegan,olahan'),
('M-20230607390', 'Paria putih, kukus', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 16.0000, 0.8000, 3.4000, 0.2000, 'vegan,sayur'),
('M-20230607391', 'Pastel', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 307.0000, 4.5000, 42.4000, 13.3000, 'vegan,goreng,kue,olahan'),
('M-20230607392', 'Pelecing kangkung', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 75.0000, 2.5000, 10.0000, 2.8000, 'vegan,sayur,olahan'),
('M-20230607393', 'Pelolah manuk, masak', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 219.0000, 19.7000, 4.4000, 13.6000, 'non-vegan,goreng,ayam,daging,olahan'),
('M-20230607394', 'Pempek adaan', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 162.0000, 4.9000, 27.8000, 3.0000, 'non-vegan,goreng,ikan,olahan'),
('M-20230607395', 'Pempek belida', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 156.0000, 4.2000, 31.6000, 1.4000, 'non-vegan,goreng,ikan,olahan'),
('M-20230607396', 'Pempek kapal selam', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 152.0000, 4.5000, 28.2000, 2.3000, 'non-vegan,goreng,ikan,olahan'),
('M-20230607397', 'Pempek kelesan', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 211.0000, 12.3000, 26.6000, 6.1000, 'non-vegan,goreng,ikan,olahan'),
('M-20230607398', 'Pempek kulit', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 243.0000, 5.2000, 39.1000, 7.3000, 'non-vegan,goreng,ikan,olahan'),
('M-20230607399', 'Pempek telur', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 156.0000, 4.7000, 28.3000, 2.7000, 'non-vegan,goreng,ikan,olahan'),
('M-20230607400', 'Pempek tenggiri', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 173.0000, 7.2000, 33.4000, 1.2000, 'non-vegan,goreng,ikan,olahan'),
('M-20230607401', 'Pencok lele, masakan', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 372.0000, 7.8000, 3.5000, 36.3000, 'non-vegan,goreng,ikan,olahan'),
('M-20230607402', 'Penyu, serapah, masa', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 174.0000, 13.1000, 2.2000, 12.2000, 'non-vegan,mentah'),
('M-20230607403', 'Pepaya, segar', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 46.0000, 0.5000, 12.2000, 12.0000, 'vegan,buah'),
('M-20230607404', 'Pepes oncom ampas ta', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 76.0000, 5.2000, 10.6000, 1.8000, 'vegan,kukus,bijian,fermentasi,olahan'),
('M-20230607405', 'Pinda, masakan', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 107.0000, 15.9000, 0.4000, 0.6000, 'non-vegan,bijian'),
('M-20230607406', 'Pindang kenari, masa', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 124.0000, 9.5000, 0.0000, 9.6000, 'non-vegan,rebus,ikan,olahan'),
('M-20230607407', 'Pisang ambon, segar', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 108.0000, 1.0000, 24.3000, 0.8000, 'vegan,buah'),
('M-20230607408', 'Pisang angleng (pisa', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 68.0000, 1.3000, 17.2000, 0.2000, 'vegan,buah'),
('M-20230607409', 'Pisang ayam, segar', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 120.0000, 1.1000, 26.8000, 0.2000, 'vegan,buah'),
('M-20230607410', 'Pisang gapi, segar', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 127.0000, 2.1000, 31.1000, 0.3000, 'vegan,buah'),
('M-20230607411', 'Pisang goroho, segar', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 115.0000, 1.9000, 27.9000, 0.2000, 'vegan,buah'),
('M-20230607412', 'Pisang hijau, segar', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 117.0000, 2.0000, 28.9000, 0.3000, 'vegan,buah'),
('M-20230607413', 'Pisang kayu, segar', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 100.0000, 1.4000, 23.6000, 0.5000, 'vegan,buah'),
('M-20230607414', 'Pisang kepok, segar', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 109.0000, 0.8000, 26.3000, 0.5000, 'vegan,buah'),
('M-20230607415', 'Pisang ketip, segar', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 145.0000, 1.1000, 34.5000, 0.3000, 'vegan,buah'),
('M-20230607416', 'Pisang kidang, segar', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 96.0000, 1.0000, 22.5000, 0.2000, 'vegan,buah'),
('M-20230607417', 'Pisang lampung, sega', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 99.0000, 1.3000, 25.6000, 0.2000, 'vegan,buah'),
('M-20230607418', 'Pisang mas bali ampe', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 92.0000, 1.4000, 21.0000, 0.2000, 'vegan,buah'),
('M-20230607419', 'Pisang mas bali kopa', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 127.0000, 1.4000, 31.8000, 0.2000, 'vegan,buah'),
('M-20230607420', 'Pisang mas, segar', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 127.0000, 1.4000, 33.6000, 0.2000, 'vegan,buah'),
('M-20230607421', 'Pisang raja sereh, s', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 108.0000, 1.3000, 28.2000, 0.3000, 'vegan,buah'),
('M-20230607422', 'Pisang raja, segar', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 120.0000, 1.2000, 31.8000, 0.2000, 'vegan,buah'),
('M-20230607423', 'Pisang rotan, segar', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 98.0000, 1.3000, 20.5000, 1.2000, 'vegan,buah'),
('M-20230607424', 'Pisang talas, segar', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 113.0000, 1.2000, 26.7000, 0.2000, 'vegan,buah'),
('M-20230607425', 'Pisang tujuh bulan', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 94.0000, 0.6000, 22.5000, 0.2000, 'vegan,buah'),
('M-20230607426', 'Pisang ua, segar', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 128.0000, 0.8000, 30.2000, 0.5000, 'vegan,buah'),
('M-20230607427', 'Pisang uli, segar', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 134.0000, 1.1000, 35.5000, 0.5000, 'vegan,buah'),
('M-20230607428', 'Pulut', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 216.0000, 2.6000, 44.4000, 3.1000, 'vegan,ketan,olahan'),
('M-20230607429', 'Punai, daging, goren', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 224.0000, 26.2000, 4.4000, 11.3000, 'non-vegan,olahan'),
('M-20230607430', 'Pundut nasi', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 104.0000, 1.9000, 15.1000, 4.1000, 'vegan,kukus,nasi'),
('M-20230607431', 'Purundawa', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 25.0000, 1.5000, 3.6000, 0.5000, 'vegan,olahan'),
('M-20230607432', 'Purut, segar', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 76.0000, 4.1000, 15.2000, 1.1000, 'vegan,buah'),
('M-20230607433', 'Putri hijau', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 189.0000, 5.4000, 37.2000, 2.1000, 'vegan,olahan'),
('M-20230607434', 'Putri selat', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 163.0000, 2.2000, 23.8000, 6.5000, 'vegan,olahan'),
('M-20230607435', 'Putu sopa', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 215.0000, 3.3000, 41.1000, 4.1000, 'vegan,olahan'),
('M-20230607436', 'Rambutan binjai, seg', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 76.0000, 0.5000, 18.0000, 0.2000, 'vegan,buah'),
('M-20230607437', 'Rambutan, segar', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 69.0000, 0.9000, 18.1000, 0.1000, 'vegan,buah'),
('M-20230607438', 'Rasbi (Beras Ubi)', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 394.0000, 2.2000, 76.6000, 8.8000, 'vegan,umbi,olahan'),
('M-20230607439', 'Rasi (Beras Singkong', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 350.0000, 0.9000, 85.7000, 0.4000, 'vegan,umbi,olahan'),
('M-20230607440', 'Rawon, masakan', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 60.0000, 5.4000, 4.0000, 2.5000, 'non-vegan,rebus,daging,olahan'),
('M-20230607441', 'Rempeyek kacang tana', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 513.0000, 17.5000, 44.3000, 32.5000, 'vegan,goreng,keripik,olahan'),
('M-20230607442', 'Rempeyek kacang tolo', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 451.0000, 11.2000, 59.7000, 20.2000, 'vegan,goreng,keripik,olahan'),
('M-20230607443', 'Rempeyek kacang uci', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 497.0000, 17.0000, 50.8000, 27.6000, 'vegan,goreng,keripik,olahan'),
('M-20230607444', 'Rendang sapi, masaka', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 193.0000, 22.6000, 7.8000, 7.9000, 'non-vegan,goreng,daging,olahan'),
('M-20230607445', 'Renggi goreng', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 471.0000, 4.7000, 64.1000, 21.8000, 'vegan,goreng,olahan'),
('M-20230607446', 'Roti boong', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 341.0000, 5.5000, 43.3000, 16.2000, 'vegan,olahan'),
('M-20230607447', 'Roti putih', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 248.0000, 8.0000, 50.0000, 1.2000, 'vegan,olahan'),
('M-20230607448', 'Roti warna sawo mata', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 249.0000, 7.9000, 49.7000, 1.5000, 'vegan,olahan'),
('M-20230607449', 'Rujak cingur', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 153.0000, 11.3000, 8.0000, 8.4000, 'vegan,daging,olahan'),
('M-20230607450', 'Rusip', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 110.0000, 11.5000, 11.7000, 2.0000, 'non-vegan,olahan'),
('M-20230607451', 'RW, anjing, masakan', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 198.0000, 24.6000, 0.9000, 10.7000, 'non-vegan,olahan'),
('M-20230607452', 'Saboko gurita, masak', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 87.0000, 15.7000, 2.6000, 1.5000, 'non-vegan,olahan'),
('M-20230607453', 'Saboko saltan, masak', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 113.0000, 17.1000, 3.0000, 3.6000, 'non-vegan,olahan'),
('M-20230607454', 'Saboko sardin, masak', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 110.0000, 12.9000, 4.9000, 4.3000, 'non-vegan,olahan'),
('M-20230607455', 'Sagu forno', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 291.0000, 0.5000, 63.4000, 4.0000, 'vegan,olahan'),
('M-20230607456', 'Sagu Lemak (Kue Sago', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 452.0000, 2.8000, 76.8000, 14.8000, 'vegan,olahan'),
('M-20230607457', 'Sagu manis', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 287.0000, 0.5000, 62.4000, 3.9000, 'vegan,olahan'),
('M-20230607458', 'Sagu Rendang', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 364.0000, 0.1000, 90.5000, 0.2000, 'vegan,olahan'),
('M-20230607459', 'Sagu sinole', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 354.0000, 0.8000, 68.9000, 8.3000, 'vegan,olahan'),
('M-20230607460', 'Salak bali, segar', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 57.0000, 0.5000, 13.6000, 0.1000, 'vegan,buah'),
('M-20230607461', 'Salak medan, segar', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 55.0000, 0.4000, 12.8000, 0.2000, 'vegan,buah'),
('M-20230607462', 'Salak pondoh, segar', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 87.0000, 0.8000, 20.1000, 0.4000, 'vegan,buah'),
('M-20230607463', 'Salak, segar', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 77.0000, 0.4000, 20.9000, 0.0000, 'vegan,buah'),
('M-20230607464', 'Santan (dengan air)', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 122.0000, 2.0000, 7.6000, 10.0000, 'non-vegan,kelapa,olahan'),
('M-20230607465', 'Santan murni', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 324.0000, 4.2000, 5.6000, 34.3000, 'non-vegan,kelapa,olahan'),
('M-20230607466', 'Sapi, abon', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 212.0000, 18.0000, 59.3000, 10.6000, 'non-vegan,mentah,daging'),
('M-20230607467', 'Sapi, abon, asli', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 358.0000, 14.6000, 38.6000, 16.1000, 'non-vegan,mentah,daging'),
('M-20230607468', 'Sapi, daging, asap', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 182.0000, 32.0000, 0.0000, 6.0000, 'non-vegan,mentah,daging'),
('M-20230607469', 'Sapi, daging, kornet', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 289.0000, 16.0000, 0.0000, 25.0000, 'non-vegan,mentah,daging'),
('M-20230607470', 'Sapi, daging, sosis ', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 448.0000, 14.5000, 2.3000, 42.3000, 'non-vegan,mentah,daging'),
('M-20230607471', 'Sapi, hati, sosis (l', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 274.0000, 16.0000, 3.0000, 22.0000, 'non-vegan,mentah,daging'),
('M-20230607472', 'Sapi, paru, goreng', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 268.0000, 23.9000, 14.5000, 12.7000, 'non-vegan,mentah,daging'),
('M-20230607473', 'Sardines dalam kalen', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 338.0000, 21.1000, 1.0000, 27.0000, 'non-vegan,ikan,olahan'),
('M-20230607474', 'Saridele, bubuk', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 344.0000, 30.0000, 43.0000, 20.0000, 'vegan,susu,bijian,olahan'),
('M-20230607475', 'Sarimuka', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 166.0000, 2.3000, 32.9000, 2.8000, 'vegan,kue,olahan'),
('M-20230607476', 'Sate Bandeng', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 283.0000, 12.1000, 20.9000, 16.8000, 'non-vegan,bakar,daging,olahan'),
('M-20230607477', 'Sate pusut, masakan', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 274.0000, 12.9000, 13.6000, 18.6000, 'non-vegan,bakar,ikan,olahan'),
('M-20230607478', 'Sate, penyu, masakan', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 179.0000, 22.5000, 13.3000, 3.5000, 'non-vegan,bakar,ikan,olahan'),
('M-20230607479', 'Sawo duren, segar', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 64.0000, 1.0000, 8.0000, 3.1000, 'vegan,buah'),
('M-20230607480', 'Sawo kecik, segar', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 111.0000, 0.9000, 21.6000, 2.3000, 'vegan,buah'),
('M-20230607481', 'Sawo Manila, segar', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 92.0000, 0.5000, 22.4000, 1.1000, 'vegan,buah'),
('M-20230607482', 'Sayur asem', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 29.0000, 0.7000, 5.0000, 0.6000, 'vegan,rebus,sayur,olahan'),
('M-20230607483', 'Sayur bunga pepaya', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 49.0000, 1.7000, 9.8000, 0.3000, 'vegan,rebus,sayur,olahan'),
('M-20230607484', 'Sayur garu', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 178.0000, 2.6000, 10.6000, 13.9000, 'vegan,rebus,sayur,olahan'),
('M-20230607485', 'Sayur kohu-kohu', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 133.0000, 7.3000, 11.2000, 6.6000, 'vegan,rebus,sayur,olahan'),
('M-20230607486', 'Sayur lebui', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 64.0000, 2.1000, 12.5000, 0.6000, 'vegan,rebus,sayur,olahan'),
('M-20230607487', 'Sayur lilin-terubuk', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 36.0000, 2.7000, 4.8000, 0.7000, 'vegan,rebus,sayur,olahan'),
('M-20230607488', 'Sayur ndusuk', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 49.0000, 3.1000, 3.6000, 2.5000, 'vegan,rebus,sayur,olahan'),
('M-20230607489', 'Sayur sop', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 27.0000, 1.3000, 1.0000, 2.0000, 'vegan,rebus,sayur,olahan'),
('M-20230607490', 'Sayur umbut kelapa', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 67.0000, 5.2000, 5.1000, 2.9000, 'vegan,rebus,sayur,olahan'),
('M-20230607491', 'Sayur umbut rotan', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 57.0000, 5.4000, 3.1000, 2.6000, 'vegan,rebus,sayur,olahan'),
('M-20230607492', 'Selada, rebus', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 19.0000, 2.7000, 2.9000, 0.2000, 'vegan,sayur'),
('M-20230607493', 'Semangka, segar', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 28.0000, 0.5000, 6.9000, 0.2000, 'vegan,buah'),
('M-20230607494', 'Semur jengkol', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 212.0000, 6.0000, 29.1000, 10.0000, 'vegan,sayur,olahan'),
('M-20230607495', 'Sepi, masakan', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 88.0000, 7.9000, 10.6000, 1.6000, 'non-vegan,olahan'),
('M-20230607496', 'Serimping talas kebu', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 478.0000, 2.5000, 69.2000, 21.2000, 'vegan,olahan'),
('M-20230607497', 'Shabu-shabu', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 88.0000, 3.2000, 0.8000, 8.0000, 'vegan,olahan'),
('M-20230607498', 'Sie reuboh, masakan', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 474.0000, 11.2000, 11.7000, 42.5000, 'non-vegan,olahan'),
('M-20230607499', 'Sirsak, segar', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 65.0000, 1.0000, 16.3000, 0.3000, 'vegan,buah'),
('M-20230607500', 'Sop buntut, masakan', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 71.0000, 7.5000, 2.2000, 3.6000, 'non-vegan,rebus,daging,olahan'),
('M-20230607501', 'Sop daging sapi, mas', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 49.0000, 5.8000, 5.3000, 0.5000, 'non-vegan,rebus,daging,olahan'),
('M-20230607502', 'Sop kaki sapi, masak', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 68.0000, 9.0000, 3.7000, 1.9000, 'non-vegan,rebus,daging,olahan'),
('M-20230607503', 'Sop kambing, masakan', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 34.0000, 5.5000, 1.1000, 0.8000, 'non-vegan,rebus,daging,olahan'),
('M-20230607504', 'Sop konro, masakan', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 71.0000, 7.4000, 4.5000, 2.6000, 'non-vegan,rebus,daging,olahan'),
('M-20230607505', 'Sop saudara, masakan', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 89.0000, 7.2000, 3.9000, 5.0000, 'non-vegan,rebus,daging,olahan'),
('M-20230607506', 'Soto bandung, masaka', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 42.0000, 3.9000, 2.8000, 1.7000, 'non-vegan,rebus,daging,olahan'),
('M-20230607507', 'Soto banjar, masakan', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 110.0000, 2.9000, 3.2000, 9.5000, 'non-vegan,rebus,daging,olahan'),
('M-20230607508', 'Soto betawi, masakan', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 135.0000, 2.5000, 11.5000, 8.8000, 'non-vegan,rebus,daging,olahan'),
('M-20230607509', 'Soto jeroan, masakan', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 92.0000, 11.8000, 1.4000, 4.3000, 'non-vegan,rebus,daging,olahan'),
('M-20230607510', 'Soto kudus, masakan', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 38.0000, 2.6000, 1.8000, 2.3000, 'non-vegan,rebus,daging,olahan'),
('M-20230607511', 'Soto madura, masakan', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 60.0000, 3.5000, 1.3000, 4.5000, 'non-vegan,rebus,daging,olahan'),
('M-20230607512', 'Soto padang, masakan', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 127.0000, 5.9000, 11.0000, 6.6000, 'non-vegan,rebus,daging,olahan'),
('M-20230607513', 'Soto pekalongan, mas', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 94.0000, 3.0000, 5.1000, 6.8000, 'non-vegan,rebus,daging,olahan'),
('M-20230607514', 'Soto pemalang, masak', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 75.0000, 3.6000, 3.5000, 5.2000, 'non-vegan,rebus,daging,olahan'),
('M-20230607515', 'Soto sukaraja, masak', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 80.0000, 3.2000, 9.0000, 3.5000, 'non-vegan,rebus,daging,olahan'),
('M-20230607516', 'Soto sulung, masakan', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 86.0000, 2.3000, 0.0000, 8.5000, 'non-vegan,rebus,daging,olahan'),
('M-20230607517', 'Sowa, segar', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 48.0000, 1.6000, 9.1000, 0.6000, 'vegan,olahan'),
('M-20230607518', 'Spaghetti', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 139.0000, 7.4000, 22.6000, 2.1000, 'vegan,mie,olahan'),
('M-20230607519', 'Srikaya ketan', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 265.0000, 2.7000, 49.1000, 6.4000, 'vegan,kue,olahan'),
('M-20230607520', 'Srikaya, segar', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 63.0000, 1.1000, 13.9000, 0.5000, 'vegan,kue,olahan'),
('M-20230607521', 'Sukiyaki, masakan', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 75.0000, 5.6000, 12.2000, 0.4000, 'non-vegan,daging,olahan'),
('M-20230607522', 'Sukun muda, segar', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 119.0000, 1.4000, 28.1000, 0.2000, 'vegan,buah'),
('M-20230607523', 'Sukun tua, segar', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 126.0000, 1.6000, 24.5000, 0.2000, 'vegan,buah'),
('M-20230607524', 'Sunduk lawang', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 181.0000, 1.9000, 32.4000, 1.3000, 'vegan,olahan'),
('M-20230607525', 'Susu asam untuk bayi', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 418.0000, 19.0000, 65.5000, 9.0000, 'non-vegan,susu,instan,olahan'),
('M-20230607526', 'Susu bubuk', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 513.0000, 24.6000, 36.2000, 30.0000, 'non-vegan,susu,instan,olahan'),
('M-20230607527', 'Susu kedelai', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 41.0000, 3.5000, 5.0000, 2.5000, 'vegan,susu,bijian,olahan'),
('M-20230607528', 'Susu kental manis', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 343.0000, 8.2000, 55.0000, 10.0000, 'non-vegan,susu,instan,olahan'),
('M-20230607529', 'Susu kental tak mani', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 138.0000, 7.0000, 9.9000, 7.9000, 'non-vegan,susu,instan,olahan'),
('M-20230607530', 'Susu skim, bubuk', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 359.0000, 35.6000, 52.0000, 1.0000, 'non-vegan,susu,instan,olahan'),
('M-20230607531', 'Susu skim, segar', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 36.0000, 3.5000, 5.1000, 0.1000, 'non-vegan,susu,instan,olahan'),
('M-20230607532', 'Suweg, talas, kukus', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 93.0000, 1.5000, 21.9000, 0.1000, 'vegan,olahan'),
('M-20230607533', 'Suwir-suwir', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 347.0000, 0.5000, 84.2000, 0.9000, 'vegan,olahan'),
('M-20230607534', 'Tahu goreng', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 115.0000, 9.7000, 2.5000, 8.5000, 'vegan,goreng,tahu,olahan'),
('M-20230607535', 'Tahu telur', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 328.0000, 12.6000, 24.6000, 19.9000, 'vegan,tahu,olahan'),
('M-20230607536', 'Takwa', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 148.0000, 13.8000, 4.0000, 8.5000, 'vegan,olahan'),
('M-20230607537', 'Talas bogor, kukus', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 120.0000, 1.5000, 28.2000, 0.3000, 'vegan,olahan'),
('M-20230607538', 'Taoge, goreng', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 88.0000, 3.2000, 14.0000, 2.1000, 'vegan,sayur'),
('M-20230607539', 'Taoge, seduh', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 28.0000, 3.0000, 4.0000, 0.8000, 'vegan,sayur'),
('M-20230607540', 'Tapai beras', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 99.0000, 1.7000, 22.4000, 0.3000, 'vegan,fermentasi,tapai,oalahan'),
('M-20230607541', 'Tapai ketan hitam', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 166.0000, 3.8000, 34.4000, 1.0000, 'vegan,fermentasi,ketan,olahan'),
('M-20230607542', 'Tapai ketan putih', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 172.0000, 3.0000, 37.5000, 0.5000, 'vegan,fermentasi,ketan,olahan'),
('M-20230607543', 'Tapai singkong', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 169.0000, 1.4000, 40.2000, 0.3000, 'vegan,fermentasi,singkong,olahan'),
('M-20230607544', 'Tauco', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 184.0000, 11.4000, 22.2000, 5.5000, 'vegan,olahan'),
('M-20230607545', 'Tauco cap beruang, c', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 347.0000, 7.4000, 67.6000, 5.2000, 'vegan,olahan'),
('M-20230607546', 'Tauco cap DAS, cake', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 358.0000, 7.5000, 70.4000, 4.3000, 'vegan,olahan'),
('M-20230607547', 'Tauco cap meong', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 159.0000, 7.4000, 21.3000, 4.9000, 'vegan,olahan'),
('M-20230607548', 'Tauji cap singa', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 277.0000, 9.1000, 49.6000, 4.7000, 'vegan,olahan'),
('M-20230607549', 'Tedong pallu basa, m', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 83.0000, 10.4000, 2.8000, 3.4000, 'non-vegan,olahan'),
('M-20230607550', 'Tekwan', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 53.0000, 1.9000, 9.4000, 0.9000, 'non-vegan,olahan'),
('M-20230607551', 'Telur ayam, dadar, m', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 251.0000, 16.3000, 1.4000, 19.4000, 'non-vegan,mentah,telur'),
('M-20230607552', 'Telur bebek, dadar, ', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 301.0000, 20.0000, 0.0000, 23.7000, 'non-vegan,mentah,telur'),
('M-20230607553', 'Tempe bongkrek', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 119.0000, 4.4000, 18.3000, 3.5000, 'vegan,fermentasi,bijian,olahan'),
('M-20230607554', 'Tempe gembus P3G', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 73.0000, 5.7000, 10.3000, 1.3000, 'vegan,fermentasi,bijian,olahan'),
('M-20230607555', 'Tempe gembus yogya', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 76.0000, 6.8000, 10.6000, 0.7000, 'vegan,fermentasi,bijian,olahan'),
('M-20230607556', 'Tempe kacang babi', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 139.0000, 12.5000, 21.9000, 0.8000, 'vegan,fermentasi,bijian,olahan'),
('M-20230607557', 'Tempe kecipir (kacan', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 212.0000, 17.5000, 12.9000, 10.0000, 'vegan,fermentasi,bijian,olahan'),
('M-20230607558', 'Tempe kedelai + jagu', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 143.0000, 12.0000, 11.4000, 5.5000, 'vegan,fermentasi,bijian,olahan'),
('M-20230607559', 'Tempe kedelai murni,', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 350.0000, 24.5000, 10.4000, 26.6000, 'vegan,fermentasi,bijian,olahan'),
('M-20230607560', 'Tempe koro benguk', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 141.0000, 10.2000, 23.2000, 1.3000, 'vegan,fermentasi,bijian,olahan'),
('M-20230607561', 'Tempe lamtoro', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 128.0000, 10.7000, 21.3000, 0.5000, 'vegan,fermentasi,bijian,olahan'),
('M-20230607562', 'Tempe lamtoro var. g', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 146.0000, 11.7000, 19.6000, 2.3000, 'vegan,fermentasi,bijian,olahan'),
('M-20230607563', 'Tempe lamtoro var. g', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 131.0000, 18.0000, 13.0000, 0.8000, 'vegan,fermentasi,bijian,olahan'),
('M-20230607564', 'Tempe pasar', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 150.0000, 14.0000, 9.1000, 7.7000, 'vegan,fermentasi,bijian,olahan'),
('M-20230607565', 'Tempe pasar goreng', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 336.0000, 20.0000, 7.8000, 28.0000, 'vegan,goreng,fermentasi,bijian,olahan'),
('M-20230607566', 'Teri balado, masakan', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 365.0000, 23.7000, 17.5000, 22.3000, 'non-vegan,goreng,ikan,olahan'),
('M-20230607567', 'Terung panjang, kuku', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 23.0000, 1.8000, 4.9000, 0.1000, 'vegan,sayur'),
('M-20230607568', 'Tikus rica, masakan', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 257.0000, 18.8000, 3.8000, 18.5000, 'non-vegan,olahan'),
('M-20230607569', 'Tinira ninahu nggalu', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 33.0000, 1.2000, 4.1000, 1.3000, 'vegan,olahan'),
('M-20230607570', 'Tinoransa, masakan', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 516.0000, 17.7000, 0.0000, 49.5000, 'non-vegan,olahan'),
('M-20230607571', 'Tipa-tipa', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 355.0000, 6.2000, 79.8000, 1.2000, 'vegan,olahan'),
('M-20230607572', 'Tiwul', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 353.0000, 2.4000, 83.4000, 1.1000, 'vegan,olahan'),
('M-20230607573', 'Tiwul Instan', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 395.0000, 3.2000, 76.5000, 8.5000, 'vegan,olahan'),
('M-20230607574', 'Tumis bandeng', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 189.0000, 11.3000, 0.6000, 15.7000, 'non-vegan,tumis,ikan,olahan'),
('M-20230607575', 'Tumis bayam bersanta', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 48.0000, 1.4000, 2.6000, 4.2000, 'vegan,tumis,sayur,olahan'),
('M-20230607576', 'Tumis keumamah', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 300.0000, 14.5000, 15.5000, 20.0000, 'non-vegan,tumis,sayur,olahan'),
('M-20230607577', 'Ubi Cilembu', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 186.0000, 1.9000, 44.3000, 0.2000, 'vegan,umbi'),
('M-20230607578', 'Ubi jalar tinta/ kem', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 165.0000, 0.9000, 39.8000, 0.2000, 'vegan,umbi'),
('M-20230607579', 'Ubi jalar, kuning, k', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 100.0000, 0.7000, 23.8000, 0.3000, 'vegan,umbi'),
('M-20230607580', 'Ulat sagu, panggang', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 380.0000, 11.9000, 14.9000, 30.3000, 'non-vegan,mentah'),
('M-20230607581', 'Uli batatas', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 150.0000, 1.1000, 27.4000, 4.0000, 'vegan,olahan'),
('M-20230607582', 'Vigus, segar', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 44.0000, 2.4000, 8.3000, 0.1000, 'vegan,olahan'),
('M-20230607583', 'Wajit camilan', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 303.0000, 6.3000, 63.3000, 2.7000, 'vegan,olahan'),
('M-20230607584', 'Waluh balamak', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 45.0000, 0.8000, 8.1000, 0.9000, 'vegan,olahan'),
('M-20230607585', 'Wani, segar', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 74.0000, 0.8000, 17.1000, 0.3000, 'vegan,olahan'),
('M-20230607586', 'Widaran', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 424.0000, 1.3000, 80.7000, 10.7000, 'vegan,olahan'),
('M-20230607587', 'Wingko babat', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 355.0000, 3.2000, 51.4000, 15.1000, 'vegan,kue,olahan'),
('M-20230607588', 'Woku ubi', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 143.0000, 3.1000, 15.0000, 7.8000, 'vegan,olahan'),
('M-20230607589', 'Wortel, kukus', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 37.0000, 1.0000, 8.3000, 0.6000, 'vegan,sayur'),
('M-20230607590', 'Wortel, rebus', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 28.0000, 0.7000, 6.3000, 0.5000, 'vegan,sayur'),
('M-20230607591', 'Yangko', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 254.0000, 3.0000, 58.1000, 1.1000, 'vegan,olahan'),
('M-20230607592', 'Yoghurt, segar', 'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png', 52.0000, 3.3000, 4.0000, 2.5000, 'non-vegan,fermentasi,susu,olahan');

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
