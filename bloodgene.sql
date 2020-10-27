-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 26, 2020 at 06:38 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bloodgene`
--

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `cid` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `age` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `contact_no` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `client_doc`
--

CREATE TABLE `client_doc` (
  `cid` int(11) NOT NULL,
  `dr_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `disease`
--

CREATE TABLE `disease` (
  `did` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `dr_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `c_no` int(11) NOT NULL,
  `c_mail` varchar(255) NOT NULL,
  `did` int(11) NOT NULL,
  `specialized_area` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `fbc`
--

CREATE TABLE `fbc` (
  `rid` int(11) NOT NULL,
  `RBC` int(11) NOT NULL,
  `WBC` int(11) NOT NULL,
  `PCV` int(11) NOT NULL,
  `MCV` int(11) NOT NULL,
  `MCH` int(11) NOT NULL,
  `MCHC` int(11) NOT NULL,
  `heamoglobin` int(11) NOT NULL,
  `basophils` int(11) NOT NULL,
  `neutrophils` int(11) NOT NULL,
  `lymphocytes` int(11) NOT NULL,
  `easinophils` int(11) NOT NULL,
  `monocytes` int(11) NOT NULL,
  `cid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `fbc_dis`
--

CREATE TABLE `fbc_dis` (
  `rid` int(11) NOT NULL,
  `did` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`cid`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `password` (`password`);

--
-- Indexes for table `client_doc`
--
ALTER TABLE `client_doc`
  ADD KEY `cid` (`cid`),
  ADD KEY `dr_id` (`dr_id`);

--
-- Indexes for table `disease`
--
ALTER TABLE `disease`
  ADD PRIMARY KEY (`did`);

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`dr_id`),
  ADD KEY `did` (`did`);

--
-- Indexes for table `fbc`
--
ALTER TABLE `fbc`
  ADD PRIMARY KEY (`rid`),
  ADD KEY `cid` (`cid`);

--
-- Indexes for table `fbc_dis`
--
ALTER TABLE `fbc_dis`
  ADD KEY `rid` (`rid`),
  ADD KEY `did` (`did`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `client`
--
ALTER TABLE `client`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `disease`
--
ALTER TABLE `disease`
  MODIFY `did` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fbc`
--
ALTER TABLE `fbc`
  MODIFY `rid` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `client_doc`
--
ALTER TABLE `client_doc`
  ADD CONSTRAINT `client_doc_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `client` (`cid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `client_doc_ibfk_2` FOREIGN KEY (`dr_id`) REFERENCES `doctor` (`dr_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `doctor`
--
ALTER TABLE `doctor`
  ADD CONSTRAINT `doctor_ibfk_1` FOREIGN KEY (`did`) REFERENCES `disease` (`did`) ON UPDATE CASCADE;

--
-- Constraints for table `fbc`
--
ALTER TABLE `fbc`
  ADD CONSTRAINT `fbc_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `client` (`cid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `fbc_dis`
--
ALTER TABLE `fbc_dis`
  ADD CONSTRAINT `fbc_dis_ibfk_1` FOREIGN KEY (`rid`) REFERENCES `fbc` (`rid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fbc_dis_ibfk_2` FOREIGN KEY (`did`) REFERENCES `disease` (`did`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
