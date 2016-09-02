-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 13, 2016 at 10:21 AM
-- Server version: 10.1.9-MariaDB
-- PHP Version: 7.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `parentfinderDB`
--

-- --------------------------------------------------------

--
-- Table structure for table `kids_in_family`
--

CREATE TABLE `kids_in_family` (
  `kids_id` int(5) NOT NULL,
  `no_of_kids` int(11) NOT NULL,
  `description` text NOT NULL,
  `sort_order` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kids_in_family`
--

INSERT INTO `kids_in_family` (`kids_id`, `no_of_kids`, `description`, `sort_order`) VALUES
(1, 0, 'No Children', 1),
(2, 1, '1 Child', 2),
(3, 2, '2 Children', 3),
(4, 3, '3 Children', 4),
(5, 4, '4 Children', 5),
(6, 5, '5 Children', 6),
(7, 6, '6 or more Children', 7);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
