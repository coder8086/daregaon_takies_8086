-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 15, 2025 at 05:51 PM
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

-- --------------------------------------------------------

--
-- Table structure for table `tbcomment`
--

CREATE TABLE `tbcomment` (
  `comment_id` int(8) NOT NULL,
  `user_id` int(8) NOT NULL,
  `post_id` int(8) NOT NULL,
  `comment` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbcomment`
--

INSERT INTO `tbcomment` (`comment_id`, `user_id`, `post_id`, `comment`) VALUES
(1, 1, 26, 'Best movie forever '),
(2, 2, 26, 'Yes best movie '),
(3, 3, 26, 'Very funny thrill not boaring at any time '),
(4, 1, 27, 'Wow nice pic'),
(5, 3, 26, 'Nice movie ');

-- --------------------------------------------------------

--
-- Table structure for table `tblikes`
--

CREATE TABLE `tblikes` (
  `like_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_likes` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblikes`
--

INSERT INTO `tblikes` (`like_id`, `post_id`, `user_id`, `user_likes`) VALUES
(1, 1, 1, 1),
(2, 2, 1, 1),
(3, 6, 1, 1),
(4, 7, 1, 1),
(5, 8, 1, 1),
(6, 12, 1, 1),
(7, 4, 1, 1),
(8, 16, 2, 1),
(9, 1, 2, 1),
(10, 17, 2, 1),
(11, 2, 2, 1),
(12, 3, 2, 1),
(13, 4, 2, 1),
(14, 5, 2, 1),
(15, 18, 2, 1),
(16, 6, 2, 1),
(17, 19, 2, 1),
(18, 20, 1, 1),
(19, 21, 3, 1),
(20, 2, 3, 1),
(21, 21, 1, 1),
(22, 22, 1, 1),
(23, 22, 4, 1),
(24, 21, 4, 1),
(25, 23, 3, 1),
(26, 23, 1, 1),
(27, 23, 4, 1),
(28, 26, 1, 1),
(29, 24, 3, 1),
(30, 25, 3, 1),
(31, 26, 3, 1),
(32, 23, 2, 1),
(33, 27, 1, 1),
(34, 25, 2, 1),
(35, 28, 1, 1),
(36, 25, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(4) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `email`, `password`) VALUES
(1, 'Abc', 'abc@abc.c', 'abc'),
(2, 'Vinay', 'vinay@gmail.com', 'vinay'),
(3, 'Kumar', 'kumar@gmail.com', 'kumar'),
(4, 'Manoj wahule', 'Manojwahule250@gmail.com', 'MW@25'),
(5, 'Akash ', 'akash@gamail.com', '12345678');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`post_id`);

--
-- Indexes for table `tbcomment`
--
ALTER TABLE `tbcomment`
  ADD PRIMARY KEY (`comment_id`);

--
-- Indexes for table `tblikes`
--
ALTER TABLE `tblikes`
  ADD PRIMARY KEY (`like_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `post_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `tbcomment`
--
ALTER TABLE `tbcomment`
  MODIFY `comment_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tblikes`
--
ALTER TABLE `tblikes`
  MODIFY `like_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
