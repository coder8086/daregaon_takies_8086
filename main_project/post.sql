-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 15, 2025 at 05:42 PM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `daregaon_takies_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `post_id` int(8) NOT NULL,
  `user_id` int(8) NOT NULL,
  `title` varchar(255) NOT NULL,
  `video_path` varchar(300) NOT NULL,
  `post_type` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`post_id`, `user_id`, `title`, `video_path`, `post_type`) VALUES
(1, 1, 'First', '../uploadedImages/Budhhaquote.jpg', 'myImage'),
(2, 1, 'Second', '../uploadedImages/677e9f3f9372d_1000015716.jpg', 'myImage'),
(3, 1, 'My Video', '../uploadedVideo/677eb3224f710_1000011323.mp4', 'video'),
(4, 1, 'B3', '../uploadedVideo/1000000640.mkv', 'video'),
(5, 1, 'Hi', '../uploadedImages/677f4cefefeb2_1000016448.jpg', 'myImage'),
(6, 1, 'Gm', '../uploadedImages/677f4dba95134_1000014281.jpg', 'myImage'),
(17, 2, 'HNY', '../uploadedImages/677f95228226f_1000013302.jpg', 'myImage'),
(18, 2, 'Manmohan Singh', '../uploadedImages/677fc4e161100_1000011456.jpg', 'myImage'),
(19, 1, 'Baby', '../uploadedImages/6780c339d2c4b_1000016506.jpg', 'myImage'),
(20, 2, 'Bird', '../uploadedImages/678201ed6a43f_1000017195.jpg', 'myImage'),
(21, 3, 'Kirshna mall', '../uploadedImages/6782bd5d5c8c8_1000010693.jpg', 'myImage'),
(22, 3, 'Tomarow wedding pic', '../uploadedImages/67847bd82ffa5_1000018023.jpg', 'myImage'),
(23, 4, 'Party', '../uploadedImages/67851523d3de1_IMG_0413.jpeg', 'myImage'),
(24, 4, 'Vinay Birthday celebrate 2024', '../uploadedVideo/IMG_0446.mov', 'video'),
(25, 4, 'Election Rally Daregaon Tq,Dist.Jalna ', '../uploadedVideo/IMG_0221.mov', 'video'),
(26, 1, 'Boy\'s 3', '../uploadedVideo/1000000640.mkv', 'video'),
(27, 2, 'Kurti payjama', '../uploadedImages/678658a8aed88_1000019324.jpg', 'myImage'),
(28, 1, 'A click on vata', '../uploadedImages/67868d4a0e053_1000019351.jpg', 'myImage'),
(29, 1, 'Fulwanti ', '../uploadedVideo/1000001483.mkv', 'video');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`post_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `post_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
