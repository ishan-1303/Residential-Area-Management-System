-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 08, 2021 at 09:26 PM
-- Server version: 10.1.35-MariaDB
-- PHP Version: 7.1.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `residence`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `street` varchar(50) NOT NULL,
  `pincode` int(6) NOT NULL,
  `id` varchar(50) NOT NULL,
  `house` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`street`, `pincode`, `id`, `house`) VALUES
('Franz Schmidt Road ', 44006, 'A1234', 1);

-- --------------------------------------------------------

--
-- Table structure for table `areas`
--

CREATE TABLE `areas` (
  `pincode` int(6) NOT NULL,
  `area` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `areas`
--

INSERT INTO `areas` (`pincode`, `area`) VALUES
(44001, 'Central'),
(44002, 'East'),
(44003, 'West'),
(44004, 'North'),
(44005, 'South'),
(44006, 'Downtown');

-- --------------------------------------------------------

--
-- Table structure for table `houses`
--

CREATE TABLE `houses` (
  `street` varchar(50) NOT NULL,
  `house` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `houses`
--

INSERT INTO `houses` (`street`, `house`) VALUES
('Berlin Street', 1),
('Berlin Street', 2),
('Berlin Street', 3),
('Berliner Road', 1),
('Berliner Road', 2),
('Berliner Road', 3),
('Berliner Road', 4),
('Berliner Road', 5),
('East Indian Road', 1),
('East Indian Road', 2),
('Franz Schmidt Road', 1),
('Franz Schmidt Road', 2),
('Franz Schmidt Road', 3),
('London Street', 1),
('London Street', 2),
('Main Road', 1),
('Main Road', 2),
('Main Road', 3),
('Main Road', 4),
('Market Street', 1),
('Market Street', 2),
('Market Street', 3),
('MG Road', 1),
('MG Road', 2),
('South Road', 1),
('South Road', 2),
('South Road', 3),
('University Road', 1),
('University Road', 2),
('Waterfall Road', 1),
('Waterfall Road', 2),
('Western Street', 1),
('Western Street', 2);

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `email_id` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`email_id`, `password`, `fname`, `lname`) VALUES
('ishan.kulkarni@gmail.com', 'isk@#1997', 'Ishan', 'Kulkarni'),
('john.weber@gmail.com', 'John', 'John', 'Weber');

-- --------------------------------------------------------

--
-- Table structure for table `people`
--

CREATE TABLE `people` (
  `id` varchar(50) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `dob` date NOT NULL,
  `gender` varchar(20) NOT NULL,
  `contact` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `people`
--

INSERT INTO `people` (`id`, `fname`, `lname`, `dob`, `gender`, `contact`) VALUES
('A1234', 'Mary', 'Lara', '2003-02-01', 'Female', 345612);

-- --------------------------------------------------------

--
-- Table structure for table `streets`
--

CREATE TABLE `streets` (
  `street` varchar(50) NOT NULL,
  `pincode` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `streets`
--

INSERT INTO `streets` (`street`, `pincode`) VALUES
('Main Road', 44001),
('Market Street', 44001),
('East Indian Road', 44002),
('MG Road', 44002),
('Berlin Street', 44003),
('Western Street', 44003),
('Berliner Road', 44004),
('London Street', 44004),
('South Road', 44005),
('University Road', 44005),
('Franz Schmidt Road', 44006),
('Waterfall Road', 44006);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_str` (`street`);

--
-- Indexes for table `areas`
--
ALTER TABLE `areas`
  ADD PRIMARY KEY (`pincode`);

--
-- Indexes for table `houses`
--
ALTER TABLE `houses`
  ADD PRIMARY KEY (`street`,`house`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`email_id`);

--
-- Indexes for table `people`
--
ALTER TABLE `people`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `streets`
--
ALTER TABLE `streets`
  ADD PRIMARY KEY (`street`),
  ADD KEY `fk_pin` (`pincode`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `fk_id` FOREIGN KEY (`id`) REFERENCES `people` (`id`),
  ADD CONSTRAINT `fk_str` FOREIGN KEY (`street`) REFERENCES `streets` (`street`);

--
-- Constraints for table `houses`
--
ALTER TABLE `houses`
  ADD CONSTRAINT `fk_street` FOREIGN KEY (`street`) REFERENCES `streets` (`street`);

--
-- Constraints for table `streets`
--
ALTER TABLE `streets`
  ADD CONSTRAINT `fk_pin` FOREIGN KEY (`pincode`) REFERENCES `areas` (`pincode`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
