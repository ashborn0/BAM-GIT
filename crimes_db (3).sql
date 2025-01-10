-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 10, 2025 at 08:50 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `crimes_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `armed`
--

CREATE TABLE `armed` (
  `armed_id` int(11) NOT NULL,
  `armed` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `armed`
--

INSERT INTO `armed` (`armed_id`, `armed`) VALUES
(1, 'gun'),
(2, 'unarmed'),
(3, 'toy weapon'),
(4, 'nail gun');

-- --------------------------------------------------------

--
-- Table structure for table `arms_category`
--

CREATE TABLE `arms_category` (
  `arms_category_id` int(11) NOT NULL,
  `arms_category` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `arms_category`
--

INSERT INTO `arms_category` (`arms_category_id`, `arms_category`) VALUES
(1, 'Guns'),
(2, 'Unarmed'),
(3, 'Other unusual objects'),
(4, 'Piercing objects');

-- --------------------------------------------------------

--
-- Table structure for table `flee`
--

CREATE TABLE `flee` (
  `flee_id` int(11) NOT NULL,
  `flee` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `flee`
--

INSERT INTO `flee` (`flee_id`, `flee`) VALUES
(1, 'Car'),
(2, 'foot'),
(3, 'Not fleeing');

-- --------------------------------------------------------

--
-- Table structure for table `incident`
--

CREATE TABLE `incident` (
  `incident_id` int(11) NOT NULL,
  `person_id` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `manner_of_death_id` int(11) DEFAULT NULL,
  `armed_id` int(11) DEFAULT NULL,
  `threat_level_id` int(11) DEFAULT NULL,
  `flee_id` int(11) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(2) DEFAULT NULL,
  `arms_category_id` int(11) DEFAULT NULL,
  `year` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `incident`
--

INSERT INTO `incident` (`incident_id`, `person_id`, `date`, `manner_of_death_id`, `armed_id`, `threat_level_id`, `flee_id`, `city`, `state`, `arms_category_id`, `year`) VALUES
(1, 1, '2015-01-02', 1, 1, 1, 3, 'Shelton', 'WA', 1, 2015),
(2, 2, '2015-01-02', 1, 1, 1, 3, 'Aloha', 'OR', 1, 2015),
(3, 3, '2015-01-03', 2, 1, 2, 3, 'Wichita', 'KS', 1, 2015),
(4, 4, '2015-01-04', 1, 3, 1, 1, 'San Francisco', 'CA', 3, 2015),
(5, 5, '2015-01-04', 1, 4, 1, 1, 'Evans', 'CO', 4, 2015),
(6, 6, '2015-01-05', 1, 1, 1, 2, 'Los Angeles', 'CA', 1, 2015),
(7, 7, '2015-01-06', 1, 1, 2, 1, 'New York', 'NY', 2, 2015),
(8, 8, '2015-01-07', 1, 3, 1, 1, 'Chicago', 'IL', 3, 2015),
(9, 9, '2015-01-08', 2, 2, 2, 1, 'Seattle', 'WA', 2, 2015),
(10, 10, '2015-01-09', 1, 1, 1, 3, 'Dallas', 'TX', 1, 2015),
(11, 11, '2015-01-10', 2, 3, 2, 1, 'Miami', 'FL', 3, 2015),
(12, 12, '2015-01-11', 1, 1, 1, 1, 'Phoenix', 'AZ', 1, 2015),
(13, 13, '2015-01-12', 1, 2, 1, 2, 'Denver', 'CO', 2, 2015),
(14, 14, '2015-01-13', 1, 1, 1, 2, 'Las Vegas', 'NV', 1, 2015),
(15, 15, '2015-01-14', 2, 3, 2, 1, 'San Diego', 'CA', 3, 2015),
(16, 16, '2015-01-15', 1, 2, 1, 3, 'Atlanta', 'GA', 2, 2015),
(17, 17, '2015-01-16', 1, 1, 1, 1, 'Portland', 'OR', 1, 2015),
(18, 18, '2015-01-17', 2, 3, 2, 1, 'Houston', 'TX', 3, 2015),
(19, 19, '2015-01-18', 1, 1, 1, 1, 'Philadelphia', 'PA', 1, 2015),
(20, 20, '2015-01-19', 2, 2, 1, 3, 'Detroit', 'MI', 2, 2015),
(21, 21, '2015-01-20', 1, 1, 1, 1, 'Columbus', 'OH', 1, 2015),
(22, 22, '2015-01-21', 2, 3, 2, 1, 'Charlotte', 'NC', 3, 2015),
(23, 23, '2015-01-22', 1, 2, 1, 1, 'Indianapolis', 'IN', 2, 2015),
(24, 24, '2015-01-23', 1, 1, 1, 1, 'San Antonio', 'TX', 1, 2015),
(25, 25, '2015-01-24', 1, 3, 1, 2, 'Austin', 'TX', 3, 2015),
(26, 26, '2015-02-01', 1, 1, 1, 3, 'Tucson', 'AZ', 1, 2015),
(27, 27, '2015-02-02', 2, 2, 2, 1, 'Baltimore', 'MD', 2, 2015),
(28, 28, '2015-02-03', 1, 3, 1, 2, 'Orlando', 'FL', 3, 2015),
(29, 29, '2015-02-04', 1, 2, 2, 1, 'St. Louis', 'MO', 2, 2015),
(30, 30, '2015-02-05', 2, 1, 1, 3, 'Memphis', 'TN', 1, 2015),
(31, 31, '2015-02-06', 1, 2, 1, 2, 'Raleigh', 'NC', 2, 2015),
(32, 32, '2015-02-07', 2, 3, 2, 1, 'Oakland', 'CA', 3, 2015),
(33, 33, '2015-02-08', 1, 1, 1, 3, 'Sacramento', 'CA', 1, 2015),
(34, 34, '2015-02-09', 2, 2, 1, 2, 'Louisville', 'KY', 2, 2015),
(35, 35, '2015-02-10', 1, 1, 1, 1, 'Nashville', 'TN', 1, 2015),
(36, 36, '2015-02-11', 2, 3, 2, 3, 'San Jose', 'CA', 3, 2015),
(37, 37, '2015-02-12', 1, 1, 1, 1, 'Houston', 'TX', 1, 2015),
(38, 38, '2015-02-13', 1, 2, 2, 2, 'Fort Worth', 'TX', 2, 2015),
(39, 39, '2015-02-14', 2, 1, 1, 1, 'Fresno', 'CA', 1, 2015),
(40, 40, '2015-02-15', 1, 3, 2, 3, 'San Antonio', 'TX', 3, 2015),
(41, 41, '2015-02-16', 2, 2, 1, 2, 'El Paso', 'TX', 2, 2015),
(42, 42, '2015-02-17', 1, 1, 1, 1, 'Denver', 'CO', 1, 2015),
(43, 43, '2015-02-18', 2, 2, 2, 3, 'Boston', 'MA', 2, 2015),
(44, 44, '2015-02-19', 1, 3, 1, 2, 'Charlotte', 'NC', 3, 2015),
(45, 45, '2015-02-20', 2, 1, 1, 3, 'New Orleans', 'LA', 1, 2015),
(46, 46, '2016-03-01', 1, 1, 1, 3, 'Phoenix', 'AZ', 1, 2016),
(47, 47, '2016-03-02', 2, 2, 2, 2, 'Newark', 'NJ', 2, 2016),
(48, 48, '2016-03-03', 1, 3, 1, 1, 'Detroit', 'MI', 3, 2016),
(49, 49, '2016-03-04', 2, 1, 2, 3, 'Miami', 'FL', 1, 2016),
(50, 50, '2016-03-05', 1, 2, 1, 1, 'Houston', 'TX', 2, 2016),
(51, 51, '2016-03-06', 1, 3, 2, 2, 'Atlanta', 'GA', 3, 2016),
(52, 52, '2016-03-07', 1, 1, 1, 2, 'Boston', 'MA', 1, 2016),
(53, 53, '2016-03-08', 2, 2, 2, 3, 'Denver', 'CO', 2, 2016),
(54, 54, '2016-03-09', 1, 3, 1, 1, 'San Francisco', 'CA', 3, 2016),
(55, 55, '2016-03-10', 1, 1, 1, 2, 'Philadelphia', 'PA', 1, 2016),
(56, 56, '2016-03-11', 1, 2, 2, 3, 'Dallas', 'TX', 2, 2016),
(57, 57, '2016-03-12', 2, 3, 1, 2, 'Portland', 'OR', 3, 2016),
(58, 58, '2016-03-13', 1, 1, 1, 1, 'Seattle', 'WA', 1, 2016),
(59, 59, '2016-03-14', 2, 2, 2, 1, 'San Diego', 'CA', 2, 2016),
(60, 60, '2016-03-15', 1, 3, 1, 3, 'Chicago', 'IL', 3, 2016),
(61, 61, '2016-03-16', 1, 1, 1, 2, 'Las Vegas', 'NV', 1, 2016),
(62, 62, '2016-03-17', 2, 2, 2, 3, 'Cleveland', 'OH', 2, 2016),
(63, 63, '2016-03-18', 1, 3, 1, 1, 'Minneapolis', 'MN', 3, 2016),
(64, 64, '2016-03-19', 2, 1, 1, 2, 'Indianapolis', 'IN', 1, 2016),
(65, 65, '2016-03-20', 1, 2, 1, 3, 'Tampa', 'FL', 2, 2016),
(66, 66, '2016-04-01', 1, 1, 1, 2, 'Jacksonville', 'FL', 1, 2016),
(67, 67, '2016-04-02', 2, 2, 2, 1, 'Oklahoma City', 'OK', 2, 2016),
(68, 68, '2016-04-03', 1, 3, 1, 3, 'Charlotte', 'NC', 3, 2016),
(69, 69, '2016-04-04', 1, 1, 2, 1, 'Baltimore', 'MD', 1, 2016),
(70, 70, '2016-04-05', 2, 2, 1, 2, 'San Antonio', 'TX', 2, 2016),
(71, 71, '2016-04-06', 1, 3, 2, 3, 'Los Angeles', 'CA', 3, 2016),
(72, 72, '2016-04-07', 1, 1, 1, 1, 'Houston', 'TX', 1, 2016),
(73, 73, '2016-04-08', 2, 2, 2, 3, 'New York', 'NY', 2, 2016),
(74, 74, '2016-04-09', 1, 3, 1, 2, 'Chicago', 'IL', 3, 2016),
(75, 75, '2016-04-10', 2, 1, 1, 1, 'Phoenix', 'AZ', 1, 2016),
(76, 76, '2016-04-11', 1, 2, 2, 2, 'Dallas', 'TX', 2, 2016),
(77, 77, '2016-04-12', 2, 3, 1, 3, 'Miami', 'FL', 3, 2016),
(78, 78, '2016-04-13', 1, 1, 1, 1, 'Las Vegas', 'NV', 1, 2016),
(79, 79, '2016-04-14', 1, 2, 1, 2, 'Portland', 'OR', 2, 2016),
(80, 80, '2016-04-15', 2, 3, 2, 3, 'Atlanta', 'GA', 3, 2016),
(81, 81, '2017-05-01', 1, 1, 1, 2, 'Austin', 'TX', 1, 2017),
(82, 82, '2017-05-02', 2, 2, 2, 1, 'Raleigh', 'NC', 2, 2017),
(83, 83, '2017-05-03', 1, 3, 1, 3, 'Columbus', 'OH', 3, 2017),
(84, 84, '2017-05-04', 2, 1, 2, 1, 'Indianapolis', 'IN', 1, 2017),
(85, 85, '2017-05-05', 1, 2, 1, 2, 'Memphis', 'TN', 2, 2017),
(86, 86, '2017-05-06', 1, 3, 2, 3, 'Fresno', 'CA', 3, 2017),
(87, 87, '2017-05-07', 1, 1, 1, 1, 'San Jose', 'CA', 1, 2017),
(88, 88, '2017-05-08', 2, 2, 2, 3, 'Tucson', 'AZ', 2, 2017),
(89, 89, '2017-05-09', 1, 3, 1, 2, 'San Francisco', 'CA', 3, 2017),
(90, 90, '2017-05-10', 1, 1, 1, 1, 'Charlotte', 'NC', 1, 2017),
(91, 91, '2017-05-11', 1, 2, 2, 2, 'Milwaukee', 'WI', 2, 2017),
(92, 92, '2017-05-12', 2, 3, 1, 3, 'Albuquerque', 'NM', 3, 2017),
(93, 93, '2017-05-13', 1, 1, 1, 1, 'Denver', 'CO', 1, 2017),
(94, 94, '2017-05-14', 2, 2, 2, 1, 'Seattle', 'WA', 2, 2017),
(95, 95, '2017-05-15', 1, 3, 1, 3, 'Boston', 'MA', 3, 2017),
(96, 96, '2017-05-16', 1, 1, 1, 2, 'Portland', 'OR', 1, 2017),
(97, 97, '2017-05-17', 2, 2, 2, 3, 'Miami', 'FL', 2, 2017),
(98, 98, '2017-05-18', 1, 3, 1, 1, 'Orlando', 'FL', 3, 2017),
(99, 99, '2017-05-19', 2, 1, 1, 2, 'Sacramento', 'CA', 1, 2017),
(100, 100, '2017-05-20', 1, 2, 2, 3, 'Jacksonville', 'FL', 2, 2017),
(101, 101, '2017-05-21', 2, 3, 1, 1, 'Fort Worth', 'TX', 3, 2017),
(102, 102, '2017-05-22', 1, 1, 1, 2, 'El Paso', 'TX', 1, 2017),
(103, 103, '2017-05-23', 1, 2, 2, 1, 'Detroit', 'MI', 2, 2017),
(104, 104, '2017-05-24', 1, 3, 1, 2, 'Las Vegas', 'NV', 3, 2017),
(105, 105, '2017-05-25', 2, 1, 1, 3, 'Kansas City', 'MO', 1, 2017),
(106, 106, '2017-05-26', 1, 2, 2, 1, 'Cleveland', 'OH', 2, 2017),
(107, 107, '2017-05-27', 1, 3, 1, 3, 'Omaha', 'NE', 3, 2017),
(108, 108, '2017-05-28', 1, 1, 1, 2, 'Louisville', 'KY', 1, 2017),
(109, 109, '2017-05-29', 1, 2, 2, 1, 'Tampa', 'FL', 2, 2017),
(110, 110, '2017-05-30', 2, 3, 1, 3, 'Philadelphia', 'PA', 3, 2017),
(112, 112, '2017-10-31', 1, 1, 2, 2, 'CDO', 'WA', 1, 2017),
(114, 113, '2017-08-10', 2, 3, 1, 1, 'CDO', 'CO', 4, 2017),
(115, 114, '2017-09-12', 1, 1, 1, 3, 'CDO', 'WA', 1, 2017),
(116, 115, '2017-08-18', 1, 4, 1, 3, 'New York', 'WA', 1, 2017),
(117, 116, '2017-08-16', 1, 1, 2, 1, 'New York', 'WA', 3, 2017),
(118, 12, '2017-07-20', 2, 3, 1, 3, 'New York', 'WA', 1, 2017);

-- --------------------------------------------------------

--
-- Table structure for table `manner_of_death`
--

CREATE TABLE `manner_of_death` (
  `manner_of_death_id` int(11) NOT NULL,
  `manner_of_death` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `manner_of_death`
--

INSERT INTO `manner_of_death` (`manner_of_death_id`, `manner_of_death`) VALUES
(1, 'shot'),
(2, 'shot and Tasered');

-- --------------------------------------------------------

--
-- Table structure for table `suspect`
--

CREATE TABLE `suspect` (
  `person_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `gender` varchar(1) DEFAULT NULL,
  `race` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `suspect`
--

INSERT INTO `suspect` (`person_id`, `name`, `age`, `gender`, `race`) VALUES
(1, 'Tim Elliot', 53, 'M', 'Asian'),
(2, 'Lewis Lee Lembke', 47, 'M', 'White'),
(3, 'John Paul Quintero', 23, 'M', 'Hispanic'),
(4, 'Matthew Hoffman', 32, 'M', 'White'),
(5, 'Michael Rodriguez', 39, 'M', 'Hispanic'),
(6, 'John Doe', 30, 'M', 'White'),
(7, 'Jane Smith', 25, 'F', 'Black'),
(8, 'Robert Johnson', 40, 'M', 'Hispanic'),
(9, 'Emily Davis', 29, 'F', 'Asian'),
(10, 'James Wilson', 33, 'M', 'White'),
(11, 'Mary Martinez', 22, 'F', 'Hispanic'),
(12, 'Charles Lee', 27, 'M', 'Asian'),
(13, 'Linda Brown', 50, 'F', 'White'),
(14, 'Michael White', 45, 'M', 'Black'),
(15, 'Patricia Harris', 36, 'F', 'White'),
(16, 'David Clark', 60, 'M', 'Black'),
(17, 'Susan Lewis', 38, 'F', 'Hispanic'),
(18, 'Joseph Walker', 26, 'M', 'White'),
(19, 'Barbara Hall', 44, 'F', 'White'),
(20, 'Richard Allen', 35, 'M', 'Black'),
(21, 'Sarah Young', 28, 'F', 'Asian'),
(22, 'Daniel King', 32, 'M', 'White'),
(23, 'Elizabeth Wright', 21, 'F', 'Hispanic'),
(24, 'Mark Lopez', 31, 'M', 'Hispanic'),
(25, 'Karen Scott', 37, 'F', 'Black'),
(26, 'Thomas Evans', 34, 'M', 'White'),
(27, 'Nancy Robinson', 28, 'F', 'Black'),
(28, 'Steven Carter', 43, 'M', 'Hispanic'),
(29, 'Margaret Green', 38, 'F', 'White'),
(30, 'Donald Hill', 47, 'M', 'Black'),
(31, 'Karen Adams', 31, 'F', 'White'),
(32, 'Paul Nelson', 40, 'M', 'Asian'),
(33, 'Deborah Baker', 24, 'F', 'Hispanic'),
(34, 'Kevin Hall', 52, 'M', 'Black'),
(35, 'Lisa Perez', 33, 'F', 'Hispanic'),
(36, 'Joshua Roberts', 29, 'M', 'White'),
(37, 'Betty Hernandez', 26, 'F', 'Black'),
(38, 'Ryan Collins', 35, 'M', 'Asian'),
(39, 'Shirley Simmons', 42, 'F', 'White'),
(40, 'Timothy Butler', 36, 'M', 'Hispanic'),
(41, 'Dorothy Bell', 48, 'F', 'Black'),
(42, 'Andrew Scott', 39, 'M', 'White'),
(43, 'Brenda Turner', 30, 'F', 'Asian'),
(44, 'Jerry Phillips', 53, 'M', 'Hispanic'),
(45, 'Catherine Parker', 27, 'F', 'White'),
(46, 'Bruce Morgan', 33, 'M', 'White'),
(47, 'Michelle Kelly', 29, 'F', 'Black'),
(48, 'David Fisher', 41, 'M', 'Hispanic'),
(49, 'Angela Ross', 25, 'F', 'Asian'),
(50, 'Jonathan Murphy', 38, 'M', 'White'),
(51, 'Sandra Bailey', 45, 'F', 'Black'),
(52, 'Philip Reed', 27, 'M', 'Hispanic'),
(53, 'Cynthia Carter', 31, 'F', 'White'),
(54, 'Jason Rivera', 30, 'M', 'Hispanic'),
(55, 'Amanda Cooper', 23, 'F', 'Black'),
(56, 'Jeffrey Morgan', 52, 'M', 'White'),
(57, 'Christina Edwards', 34, 'F', 'Asian'),
(58, 'Ronald Brooks', 40, 'M', 'Black'),
(59, 'Stephanie Long', 28, 'F', 'White'),
(60, 'Patrick Kelly', 37, 'M', 'White'),
(61, 'Laura Howard', 26, 'F', 'Hispanic'),
(62, 'Anthony Torres', 42, 'M', 'Hispanic'),
(63, 'Nicole Powell', 35, 'F', 'Black'),
(64, 'Adam Hernandez', 32, 'M', 'White'),
(65, 'Monica Baker', 29, 'F', 'Asian'),
(66, 'Brian Stewart', 36, 'M', 'White'),
(67, 'Kimberly Flores', 28, 'F', 'Hispanic'),
(68, 'Daniel Jenkins', 41, 'M', 'Black'),
(69, 'Rebecca Clark', 30, 'F', 'Asian'),
(70, 'Aaron Reed', 47, 'M', 'White'),
(71, 'Carolyn Martinez', 33, 'F', 'Hispanic'),
(72, 'Gregory Simmons', 39, 'M', 'White'),
(73, 'Victoria Morris', 26, 'F', 'Black'),
(74, 'Tyler Anderson', 44, 'M', 'Black'),
(75, 'Rachel Turner', 27, 'F', 'White'),
(76, 'Harold Scott', 50, 'M', 'Hispanic'),
(77, 'Maria Rodriguez', 32, 'F', 'Hispanic'),
(78, 'Peter Foster', 38, 'M', 'Asian'),
(79, 'Jessica Gray', 24, 'F', 'Black'),
(80, 'Charles Bennett', 49, 'M', 'White'),
(81, 'James Watson', 32, 'M', 'White'),
(82, 'Emily Foster', 27, 'F', 'Black'),
(83, 'Robert Hughes', 40, 'M', 'Hispanic'),
(84, 'Melissa Patterson', 29, 'F', 'Asian'),
(85, 'William Bailey', 46, 'M', 'White'),
(86, 'Linda Mitchell', 35, 'F', 'Black'),
(87, 'Matthew Bennett', 38, 'M', 'White'),
(88, 'Ashley Carter', 33, 'F', 'Hispanic'),
(89, 'Christopher Edwards', 28, 'M', 'Black'),
(90, 'Patricia Price', 26, 'F', 'White'),
(91, 'Mark Richardson', 50, 'M', 'Hispanic'),
(92, 'Heather Coleman', 30, 'F', 'Asian'),
(93, 'Joseph Ward', 41, 'M', 'White'),
(94, 'Deborah Collins', 24, 'F', 'Black'),
(95, 'Brandon Scott', 36, 'M', 'Black'),
(96, 'Denise Brooks', 31, 'F', 'White'),
(97, 'Justin Simmons', 39, 'M', 'Hispanic'),
(98, 'Amy Evans', 34, 'F', 'White'),
(99, 'Derek Phillips', 42, 'M', 'Asian'),
(100, 'Sharon Henderson', 28, 'F', 'Black'),
(101, 'Joshua Rogers', 37, 'M', 'White'),
(102, 'Lisa Russell', 25, 'F', 'Hispanic'),
(103, 'Brian Cox', 48, 'M', 'Black'),
(104, 'Debra Ramirez', 43, 'F', 'White'),
(105, 'Ethan Torres', 45, 'M', 'Hispanic'),
(106, 'Nancy Freeman', 31, 'F', 'Asian'),
(107, 'Raymond Turner', 34, 'M', 'White'),
(108, 'Stephanie James', 29, 'F', 'Black'),
(109, 'Harold Howard', 52, 'M', 'Hispanic'),
(110, 'Catherine Morgan', 27, 'F', 'White'),
(112, 'elele', 23, 'm', 'black'),
(113, 'LOLA', 45, 'F', 'Hispanic'),
(114, 'ELOW', 21, 'F', 'Hispanic'),
(115, 'Djohn', 21, 'M', 'Asian'),
(116, 'Elmer', 23, 'M', 'Asian');

-- --------------------------------------------------------

--
-- Table structure for table `threat_level`
--

CREATE TABLE `threat_level` (
  `threat_level_id` int(11) NOT NULL,
  `threat_level` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `threat_level`
--

INSERT INTO `threat_level` (`threat_level_id`, `threat_level`) VALUES
(1, 'attack'),
(2, 'other');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `firstname` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `password_hash`, `gender`, `created_at`) VALUES
(1, 'Sadboy', 'LALa', 'vblood407@gmail.com', '$2y$10$uZExH0Lw3a3HzvNFRS4I6.r0QaNYB6ehl1vpFNDOfgK4gLuN7VcMW', 'female', '2025-01-10 14:55:20'),
(2, 'Sadboy3', 'lolo', 'panong.emman456@gmail.com', '$2y$10$AK8Mw.aRoX4S47QjU57ODO6XoBPoBmQuLDiLCyfBUAjzsHUgPGOvK', 'male', '2025-01-10 15:00:33'),
(3, 'Sadboy34', 'lolos', 'yeps123@gmail.con', '$2y$10$XrG7vLG9.3xkMpdyZq5o5uYacE/jYgGczjENvfHkr/tz/E/7E1iiq', 'male', '2025-01-10 15:02:42');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `armed`
--
ALTER TABLE `armed`
  ADD PRIMARY KEY (`armed_id`);

--
-- Indexes for table `arms_category`
--
ALTER TABLE `arms_category`
  ADD PRIMARY KEY (`arms_category_id`);

--
-- Indexes for table `flee`
--
ALTER TABLE `flee`
  ADD PRIMARY KEY (`flee_id`);

--
-- Indexes for table `incident`
--
ALTER TABLE `incident`
  ADD PRIMARY KEY (`incident_id`),
  ADD KEY `person_id` (`person_id`),
  ADD KEY `manner_of_death_id` (`manner_of_death_id`),
  ADD KEY `armed_id` (`armed_id`),
  ADD KEY `threat_level_id` (`threat_level_id`),
  ADD KEY `flee_id` (`flee_id`),
  ADD KEY `arms_category_id` (`arms_category_id`);

--
-- Indexes for table `manner_of_death`
--
ALTER TABLE `manner_of_death`
  ADD PRIMARY KEY (`manner_of_death_id`);

--
-- Indexes for table `suspect`
--
ALTER TABLE `suspect`
  ADD PRIMARY KEY (`person_id`);

--
-- Indexes for table `threat_level`
--
ALTER TABLE `threat_level`
  ADD PRIMARY KEY (`threat_level_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `armed`
--
ALTER TABLE `armed`
  MODIFY `armed_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `arms_category`
--
ALTER TABLE `arms_category`
  MODIFY `arms_category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `flee`
--
ALTER TABLE `flee`
  MODIFY `flee_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `incident`
--
ALTER TABLE `incident`
  MODIFY `incident_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=119;

--
-- AUTO_INCREMENT for table `manner_of_death`
--
ALTER TABLE `manner_of_death`
  MODIFY `manner_of_death_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `suspect`
--
ALTER TABLE `suspect`
  MODIFY `person_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=117;

--
-- AUTO_INCREMENT for table `threat_level`
--
ALTER TABLE `threat_level`
  MODIFY `threat_level_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `incident`
--
ALTER TABLE `incident`
  ADD CONSTRAINT `incident_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `suspect` (`person_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `incident_ibfk_2` FOREIGN KEY (`manner_of_death_id`) REFERENCES `manner_of_death` (`manner_of_death_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `incident_ibfk_3` FOREIGN KEY (`armed_id`) REFERENCES `armed` (`armed_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `incident_ibfk_4` FOREIGN KEY (`threat_level_id`) REFERENCES `threat_level` (`threat_level_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `incident_ibfk_5` FOREIGN KEY (`flee_id`) REFERENCES `flee` (`flee_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `incident_ibfk_6` FOREIGN KEY (`arms_category_id`) REFERENCES `arms_category` (`arms_category_id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
