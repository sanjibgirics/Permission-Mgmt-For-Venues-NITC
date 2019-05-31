-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 29, 2019 at 06:55 PM
-- Server version: 5.7.26-0ubuntu0.16.04.1
-- PHP Version: 7.0.33-0ubuntu0.16.04.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `PermissionManagement`
--

-- --------------------------------------------------------

--
-- Table structure for table `Authority`
--

CREATE TABLE `Authority` (
  `authority_id` int(11) NOT NULL,
  `lab_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `join_date` date NOT NULL,
  `leave_date` date DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Authority`
--

INSERT INTO `Authority` (`authority_id`, `lab_id`, `user_id`, `join_date`, `leave_date`, `status`) VALUES
(1, 1, 5, '2000-01-01', NULL, 'active'),
(2, 1, 7, '2000-01-01', NULL, 'active'),
(3, 2, 8, '1999-02-01', NULL, 'active'),
(4, 2, 9, '1999-02-01', NULL, 'active'),
(5, 1, 2, '2018-09-15', NULL, 'active'),
(7, 1, 4, '2018-09-17', NULL, 'active'),
(8, 2, 6, '2018-11-17', NULL, 'active');

-- --------------------------------------------------------

--
-- Table structure for table `Lab`
--

CREATE TABLE `Lab` (
  `lab_id` int(11) NOT NULL,
  `lab_name` varchar(30) NOT NULL,
  `lab` varchar(10) NOT NULL,
  `room_number` varchar(10) NOT NULL,
  `dept` varchar(10) NOT NULL DEFAULT 'csed',
  `max_capacity` int(11) NOT NULL DEFAULT '40',
  `availability` int(11) NOT NULL DEFAULT '40'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Lab`
--

INSERT INTO `Lab` (`lab_id`, `lab_name`, `lab`, `room_number`, `dept`, `max_capacity`, `availability`) VALUES
(1, 'network system laboratory', 'nsl', 'itl301', 'cse', 40, 38),
(2, 'software system laboratory', 'ssl', 'itl302', 'cse', 40, 39);

-- --------------------------------------------------------

--
-- Table structure for table `Permission`
--

CREATE TABLE `Permission` (
  `event_id` int(11) NOT NULL,
  `start_datetime` datetime NOT NULL,
  `end_datetime` datetime NOT NULL,
  `purpose` varchar(1000) NOT NULL,
  `student_rollno` varchar(10) NOT NULL,
  `student_name` varchar(50) NOT NULL,
  `raised_datetime` datetime NOT NULL,
  `response_datetime` datetime DEFAULT NULL,
  `status` enum('pending','lab_admin','faculty_incharge','approved','declined') NOT NULL DEFAULT 'lab_admin',
  `message` varchar(5000) DEFAULT NULL,
  `lab_id` int(11) NOT NULL,
  `max_audience` int(11) NOT NULL,
  `dept` varchar(10) NOT NULL DEFAULT 'cse'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Permission`
--

INSERT INTO `Permission` (`event_id`, `start_datetime`, `end_datetime`, `purpose`, `student_rollno`, `student_name`, `raised_datetime`, `response_datetime`, `status`, `message`, `lab_id`, `max_audience`, `dept`) VALUES
(1, '2019-04-11 12:30:00', '2019-04-11 04:30:00', 'for  event', 'M170364CA', 'Lokeshvar', '2019-03-08 22:22:18', '2019-03-11 19:50:48', 'declined', 'Please allow this event.', 2, 22, 'cse'),
(2, '2019-04-10 11:00:00', '2019-04-10 12:00:00', 'for coding comp', 'M170348CA', 'Mithun', '2019-03-08 23:10:01', '2019-03-11 20:46:11', 'declined', 'Please accept this request', 1, 22, 'cse'),
(3, '2019-03-15 00:00:00', '2019-03-16 00:00:00', 'for workshop', 'm170348ca', 'mithun kumar', '2019-03-13 00:00:00', '2019-03-10 17:54:11', 'approved', 'No Message', 1, 50, 'cse'),
(4, '2019-03-15 12:00:00', '2019-03-15 02:00:00', 'Coding with senior', 'm170345ca', 'Rupesh Kumar Sahu', '2019-03-09 14:54:29', '2019-03-12 15:06:50', 'approved', 'Recommended', 2, 36, 'me'),
(5, '2019-03-12 13:00:00', '2019-03-12 14:00:00', 'Workshop for github', 'm170348ca', 'mithun kumar', '2019-03-09 22:44:43', '2019-03-10 17:28:03', 'declined', 'No Message', 2, 35, 'cse'),
(6, '2019-03-16 12:00:00', '2019-03-16 16:10:00', 'Linux Workshop', 'm170348ca', 'mithun kumar', '2019-03-09 23:22:35', '2019-03-12 15:53:50', 'approved', 'No Message', 1, 34, 'cse'),
(7, '2017-03-02 03:32:00', '0031-02-22 04:02:00', 'Workshop', 'm170348ca', 'mithun kumar', '2019-03-10 09:18:45', '2019-03-11 20:45:53', 'declined', 'Allow this Workshop', 2, 33, 'cse'),
(8, '2019-03-11 10:00:00', '2019-03-12 17:00:00', 'For Workshop ', 'm170348ca', 'mithun kumar', '2019-03-10 17:50:45', '2019-03-11 20:45:58', 'approved', 'work', 1, 44, 'cse'),
(9, '2019-03-11 21:57:00', '2019-03-12 21:57:00', 'Learn Git', 'm170564ca', 'sanjib kumar giri', '2019-03-11 21:57:42', '2019-03-12 14:42:10', 'approved', 'It is good', 1, 15, 'cse'),
(10, '2019-03-30 16:16:00', '2019-03-31 16:16:00', 'Basic in C++', 'm170348ca', 'mithun kumar', '2019-03-12 16:17:11', '2019-03-12 16:19:30', 'approved', 'Recommened', 2, 10, 'cse'),
(11, '2019-03-22 12:08:00', '2019-03-24 12:08:00', 'GitLab Intro', 'm170348ca', 'mithun kumar', '2019-03-20 12:09:38', '2019-03-20 12:12:26', 'approved', 'Recommended', 1, 34, 'cse'),
(12, '2019-05-30 09:40:00', '2019-05-31 09:40:00', 'python', 'm170348ca', 'mithun kumar', '2019-05-29 09:41:09', '2019-05-29 09:46:17', 'approved', 'need numpy', 1, 56, 'cse'),
(13, '2019-06-01 11:48:00', '2019-06-03 11:48:00', 'machine learning', 'm170348ca', 'mithun kumar', '2019-05-29 11:50:09', '2019-05-29 11:53:41', 'approved', 'gyfu', 2, 566, 'cse'),
(14, '2019-06-07 18:47:00', '2019-06-07 21:47:00', 'hadoop', 'm170348ca', 'mithun kumar', '2019-05-29 18:48:41', '2019-05-29 18:54:03', 'approved', 'java', 2, 78787, 'cse');

-- --------------------------------------------------------

--
-- Table structure for table `Student`
--

CREATE TABLE `Student` (
  `rollno` varchar(10) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Student`
--

INSERT INTO `Student` (`rollno`, `user_id`) VALUES
('m170348ca', 1),
('m170364ca', 2),
('m170564ca', 3),
('m170345ca', 4),
('m170363ca', 6);

-- --------------------------------------------------------

--
-- Table structure for table `StudentLabAdmin`
--

CREATE TABLE `StudentLabAdmin` (
  `student_lab_admin_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `lab_id` int(11) NOT NULL,
  `join_date` date NOT NULL,
  `leave_date` date DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `StudentLabAdmin`
--

INSERT INTO `StudentLabAdmin` (`student_lab_admin_id`, `user_id`, `lab_id`, `join_date`, `leave_date`, `status`) VALUES
(1, 2, 1, '2018-09-15', NULL, 'active'),
(2, 4, 1, '2018-09-17', NULL, 'active'),
(3, 6, 2, '2018-11-17', NULL, 'active');

-- --------------------------------------------------------

--
-- Table structure for table `User`
--

CREATE TABLE `User` (
  `user_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mobile` varchar(11) DEFAULT NULL,
  `dept` varchar(30) NOT NULL DEFAULT 'CSE',
  `type` enum('student','faculty_incharge','staff_incharge','student_lab_admin') NOT NULL DEFAULT 'student'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `User`
--

INSERT INTO `User` (`user_id`, `name`, `password`, `email`, `mobile`, `dept`, `type`) VALUES
(1, 'mithun kumar', 'mithun', 'mithun_m170348ca@nitc.ac.in', '9931591228', 'cse', 'student'),
(2, 'lokeshvar kumar', 'lokeshvar', 'lokeshvar_m170364ca@nitc.ac.in', '8210363742', 'cse', 'student_lab_admin'),
(3, 'sanjib kumar giri', 'sanjib', 'sanjib_m170564ca@nitc.ac.in', '9853591944', 'cse', 'student'),
(4, 'rupesh kumar sahu', 'rupesh', 'rupesh_m170345ca@nitc.ac.in', '8984679161', 'cse', 'student_lab_admin'),
(5, 'jayraj p', 'J123', 'notavailablenow', '1234567890', 'cse', 'faculty_incharge'),
(6, 'pankaj kumar saini', 'pankaj', 'pankaj_m170363ca@nitc.ac.in', '9876543210', 'cse', 'student'),
(7, 'biju francis', 'B123', 'notavailablenow1', '12345678901', 'cse', 'staff_incharge'),
(8, 'Sumesh TA', 'S123', 'notavailablenow3', '1234567891', 'cse', 'faculty_incharge'),
(9, 'Ajayachandran V R', 'A123', 'notavailablenow4', '12345678902', 'cse', 'staff_incharge');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Authority`
--
ALTER TABLE `Authority`
  ADD PRIMARY KEY (`authority_id`),
  ADD KEY `Authority_ibfk_1` (`lab_id`),
  ADD KEY `Authority_ibfk_2` (`user_id`);

--
-- Indexes for table `Lab`
--
ALTER TABLE `Lab`
  ADD PRIMARY KEY (`lab_id`),
  ADD UNIQUE KEY `lab_name` (`lab_name`),
  ADD UNIQUE KEY `room_number` (`room_number`);

--
-- Indexes for table `Permission`
--
ALTER TABLE `Permission`
  ADD PRIMARY KEY (`event_id`),
  ADD KEY `student_rollno` (`student_rollno`),
  ADD KEY `booked_lab_id` (`lab_id`);

--
-- Indexes for table `Student`
--
ALTER TABLE `Student`
  ADD PRIMARY KEY (`rollno`),
  ADD KEY `student_id` (`user_id`);

--
-- Indexes for table `StudentLabAdmin`
--
ALTER TABLE `StudentLabAdmin`
  ADD PRIMARY KEY (`student_lab_admin_id`),
  ADD KEY `admin_lab_id` (`lab_id`),
  ADD KEY `StudentLabAdmin_ibfk_1` (`user_id`);

--
-- Indexes for table `User`
--
ALTER TABLE `User`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `mobile` (`mobile`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Authority`
--
ALTER TABLE `Authority`
  MODIFY `authority_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `Lab`
--
ALTER TABLE `Lab`
  MODIFY `lab_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `Permission`
--
ALTER TABLE `Permission`
  MODIFY `event_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `StudentLabAdmin`
--
ALTER TABLE `StudentLabAdmin`
  MODIFY `student_lab_admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `User`
--
ALTER TABLE `User`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `Authority`
--
ALTER TABLE `Authority`
  ADD CONSTRAINT `Authority_ibfk_1` FOREIGN KEY (`lab_id`) REFERENCES `Lab` (`lab_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Authority_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Permission`
--
ALTER TABLE `Permission`
  ADD CONSTRAINT `Permission_ibfk_1` FOREIGN KEY (`student_rollno`) REFERENCES `Student` (`rollno`),
  ADD CONSTRAINT `Permission_ibfk_2` FOREIGN KEY (`lab_id`) REFERENCES `Lab` (`lab_id`);

--
-- Constraints for table `Student`
--
ALTER TABLE `Student`
  ADD CONSTRAINT `Student_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`);

--
-- Constraints for table `StudentLabAdmin`
--
ALTER TABLE `StudentLabAdmin`
  ADD CONSTRAINT `StudentLabAdmin_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `StudentLabAdmin_ibfk_2` FOREIGN KEY (`lab_id`) REFERENCES `Lab` (`lab_id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
