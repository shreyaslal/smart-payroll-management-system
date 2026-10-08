-- Smart Payroll Management System - database schema + demo data
-- Import with:  mysql -u root < database/payroll_db.sql   (or via phpMyAdmin > Import)

CREATE DATABASE IF NOT EXISTS `payroll_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `payroll_db`;

-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 16, 2024 at 01:22 PM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `payroll_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `addition`
--

CREATE TABLE `addition` (
  `addi_id` int(14) NOT NULL,
  `salary_id` int(14) NOT NULL,
  `basic` varchar(128) DEFAULT NULL,
  `medical` varchar(64) DEFAULT NULL,
  `house_rent` varchar(64) DEFAULT NULL,
  `conveyance` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `addition`
--

INSERT INTO `addition` (`addi_id`, `salary_id`, `basic`, `medical`, `house_rent`, `conveyance`) VALUES
(25, 25, '17500.00', '1750.00', '14000.00', '1750.00'),
(26, 26, '20000.00', '2000.00', '16000.00', '2000.00'),
(27, 27, '16500.00', '1650.00', '13200.00', '1650.00'),
(28, 28, '15000', '2000', '6000', '3000'),
(29, 29, '14,000', '1,000', '1,000', '1,000'),
(30, 30, '13000.00', '1300.00', '10400.00', '1300.00');

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `id` int(14) NOT NULL,
  `emp_id` varchar(64) DEFAULT NULL,
  `city` varchar(128) DEFAULT NULL,
  `country` varchar(128) DEFAULT NULL,
  `address` varchar(512) DEFAULT NULL,
  `type` enum('Present','Permanent') DEFAULT 'Present'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`id`, `emp_id`, `city`, `country`, `address`, `type`) VALUES
(29, 'Ran1558', 'Bangalore', 'India', 'Lakshmi nagar', 'Permanent'),
(30, '.R1636', 'Noida', 'India', '\r\nGandhi Street', 'Permanent'),
(31, 'K.1146', 'Chennai', 'India', 'Jothi nagar', 'Permanent'),
(32, 'A.1352', 'Delhi', 'India', 'Nehru Street', 'Permanent'),
(33, 'kum1963', 'Chennai', 'India', 'No:3/40, Surya nagar', 'Permanent'),
(34, 'Pra1827', 'Madurai', 'India', 'Govinda Street', 'Permanent'),
(35, 'Jas1706', 'Pondicheery', 'India', 'Angadi Street', 'Permanent');

-- --------------------------------------------------------

--
-- Table structure for table `assets`
--

CREATE TABLE `assets` (
  `ass_id` int(14) NOT NULL,
  `catid` varchar(14) NOT NULL,
  `ass_name` varchar(256) DEFAULT NULL,
  `ass_brand` varchar(128) DEFAULT NULL,
  `ass_model` varchar(256) DEFAULT NULL,
  `ass_code` varchar(256) DEFAULT NULL,
  `configuration` varchar(512) DEFAULT NULL,
  `purchasing_date` varchar(128) DEFAULT NULL,
  `ass_price` varchar(128) DEFAULT NULL,
  `ass_qty` varchar(64) DEFAULT NULL,
  `in_stock` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `assets`
--

INSERT INTO `assets` (`ass_id`, `catid`, `ass_name`, `ass_brand`, `ass_model`, `ass_code`, `configuration`, `purchasing_date`, `ass_price`, `ass_qty`, `in_stock`) VALUES
(19, '3', 'Headphones', 'HP', '120MV', '2501', 'Wired headphones with inbuilt mic', '10/20/2023', '20000', '50', '50'),
(20, '5', 'Mouse', 'Lenovo', 'D35', '2502', 'Lenovo Optical mouse', '10/15/2023', '15000', '100', '99'),
(21, '4', 'Office Cars', 'Hyundai', 'Ioniq 5', '5001', 'Office cars for Chennai branch', '10/01/2023', '5000000', '5', '4');

-- --------------------------------------------------------

--
-- Table structure for table `assets_category`
--

CREATE TABLE `assets_category` (
  `cat_id` int(14) NOT NULL,
  `cat_status` enum('ASSETS','LOGISTIC') NOT NULL DEFAULT 'ASSETS',
  `cat_name` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `assets_category`
--

INSERT INTO `assets_category` (`cat_id`, `cat_status`, `cat_name`) VALUES
(1, 'ASSETS', 'Laptop'),
(2, 'ASSETS', 'Computer'),
(3, 'ASSETS', 'Headphones'),
(4, 'LOGISTIC', 'Office Car'),
(5, 'ASSETS', 'Mouse'),
(6, 'ASSETS', 'Keyboard'),
(7, 'ASSETS', 'Modem'),
(8, 'ASSETS', 'Laptop Bag'),
(9, 'LOGISTIC', 'Access card'),
(10, 'ASSETS', 'Employee ID Card');

-- --------------------------------------------------------

--
-- Table structure for table `assign_leave`
--

CREATE TABLE `assign_leave` (
  `id` int(14) NOT NULL,
  `app_id` varchar(11) NOT NULL,
  `emp_id` varchar(64) DEFAULT NULL,
  `type_id` int(14) NOT NULL,
  `day` varchar(256) DEFAULT NULL,
  `hour` varchar(255) NOT NULL,
  `total_day` varchar(64) DEFAULT NULL,
  `dateyear` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `assign_leave`
--

INSERT INTO `assign_leave` (`id`, `app_id`, `emp_id`, `type_id`, `day`, `hour`, `total_day`, `dateyear`) VALUES
(22, '', '.R1636', 2, NULL, '8', NULL, '2023'),
(23, '', 'Jas1706', 1, NULL, '8', NULL, '2023'),
(24, '', 'G.1791', 7, NULL, '8', NULL, '2023');

-- --------------------------------------------------------

--
-- Table structure for table `assign_task`
--

CREATE TABLE `assign_task` (
  `id` int(14) NOT NULL,
  `task_id` int(14) NOT NULL,
  `project_id` int(14) NOT NULL,
  `assign_user` varchar(64) DEFAULT NULL,
  `user_type` enum('Team Head','Collaborators') NOT NULL DEFAULT 'Collaborators'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `assign_task`
--

INSERT INTO `assign_task` (`id`, `task_id`, `project_id`, `assign_user`, `user_type`) VALUES
(34, 15, 6, 'kum1963', 'Team Head'),
(35, 15, 6, 'Kum1382', 'Collaborators'),
(36, 15, 6, 'kum1890', 'Collaborators'),
(37, 15, 6, 'Pra1827', 'Collaborators'),
(38, 16, 6, 'kum1963', 'Team Head'),
(39, 16, 6, 'Pra1827', 'Collaborators'),
(40, 17, 6, 'kum1963', 'Team Head'),
(41, 17, 6, 'Jas1706', 'Collaborators'),
(42, 17, 6, '.R1636', 'Collaborators'),
(43, 17, 6, 'Ran1558', 'Collaborators');

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `id` int(14) NOT NULL,
  `emp_id` varchar(64) DEFAULT NULL,
  `atten_date` varchar(64) DEFAULT NULL,
  `signin_time` time DEFAULT NULL,
  `signout_time` time DEFAULT NULL,
  `working_hour` varchar(64) DEFAULT NULL,
  `place` varchar(255) NOT NULL,
  `absence` varchar(128) DEFAULT NULL,
  `overtime` varchar(128) DEFAULT NULL,
  `earnleave` varchar(128) DEFAULT NULL,
  `status` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`id`, `emp_id`, `atten_date`, `signin_time`, `signout_time`, `working_hour`, `place`, `absence`, `overtime`, `earnleave`, `status`) VALUES
(1, 'E5002', '2023-06-18', '08:01:00', '17:00:00', '08 h 59 m', 'office', NULL, NULL, NULL, 'A'),
(2, 'E5001', '2023-07-01', '09:00:00', '18:02:00', '09 h 2 m', 'office', NULL, NULL, NULL, 'A'),
(3, 'E5003', '2023-07-03', '10:00:00', '17:33:00', '07 h 33 m', 'office', NULL, NULL, NULL, 'A'),
(4, 'E5007', '2023-07-04', '09:10:00', '19:33:00', '10 h 23 m', 'office', NULL, NULL, NULL, 'A'),
(5, 'E5005', '2023-07-05', '08:12:00', '17:18:00', '09 h 6 m', 'field', NULL, NULL, NULL, 'A'),
(6, 'E5004', '2023-07-06', '11:13:00', '18:27:00', '07 h 14 m', 'office', NULL, NULL, NULL, 'A'),
(7, 'E5006', '2023-07-07', '09:12:00', '07:23:00', '01 h 49 m', 'office', NULL, NULL, NULL, 'E'),
(8, 'E5006', '2023-07-02', '09:15:00', '18:37:00', '09 h 22 m', 'office', NULL, NULL, NULL, 'A'),
(9, 'E5008', '2023-07-04', '10:05:00', '07:42:00', '02 h 23 m', 'office', NULL, NULL, NULL, 'A'),
(10, 'E5009', '2023-07-03', '08:35:00', '17:50:00', '09 h 15 m', 'office', NULL, NULL, NULL, 'A'),
(11, 'E5001', '2023-07-03', '09:08:00', '17:17:00', '08 h 9 m', 'office', NULL, NULL, NULL, 'A'),
(12, 'E5001', '2023-07-04', '09:02:00', '17:37:00', '08 h 35 m', 'field', NULL, NULL, NULL, 'A'),
(13, 'E5001', '2023-07-05', '10:03:00', '18:32:00', '08 h 29 m', 'office', NULL, NULL, NULL, 'A'),
(14, 'E5001', '2023-07-10', '09:00:00', '17:00:00', '480', '', NULL, NULL, NULL, 'E'),
(15, 'E5001', '2023-07-11', '09:00:00', '17:00:00', '480', '', NULL, NULL, NULL, 'E'),
(16, 'E5001', '2023-07-12', '09:00:00', '17:00:00', '480', '', NULL, NULL, NULL, 'E'),
(17, 'E5001', '2023-07-13', '09:00:00', '17:00:00', '480', '', NULL, NULL, NULL, 'E'),
(18, 'E5002', '1970-01-01', '09:00:00', '17:00:00', '480', '', NULL, NULL, NULL, 'E'),
(19, 'E5003', '2023-07-04', '09:00:00', '17:00:00', '480', '', NULL, NULL, NULL, 'E'),
(20, 'E5003', '2023-07-05', '09:00:00', '17:00:00', '480', '', NULL, NULL, NULL, 'E'),
(21, 'E5003', '2023-07-06', '09:00:00', '17:00:00', '480', '', NULL, NULL, NULL, 'E'),
(22, 'E5003', '2023-07-07', '09:00:00', '17:00:00', '480', '', NULL, NULL, NULL, 'E'),
(23, 'E5004', '2023-11-01', '06:30:00', '02:30:00', '04 h 0 m', 'office', NULL, NULL, NULL, 'A'),
(24, 'E5004', '2023-11-02', '06:30:00', '02:33:00', '03 h 57 m', 'office', NULL, NULL, NULL, 'A'),
(25, 'E5007', '2023-11-01', '02:30:00', '10:30:00', '08 h 0 m', 'office', NULL, NULL, NULL, 'A'),
(26, 'E5007', '2023-11-02', '02:31:00', '10:48:00', '08 h 17 m', 'office', NULL, NULL, NULL, 'A');

-- --------------------------------------------------------

--
-- Table structure for table `bank_info`
--

CREATE TABLE `bank_info` (
  `id` int(14) NOT NULL,
  `em_id` varchar(64) DEFAULT NULL,
  `holder_name` varchar(256) DEFAULT NULL,
  `bank_name` varchar(256) DEFAULT NULL,
  `branch_name` varchar(256) DEFAULT NULL,
  `account_number` varchar(256) DEFAULT NULL,
  `account_type` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bank_info`
--

INSERT INTO `bank_info` (`id`, `em_id`, `holder_name`, `bank_name`, `branch_name`, `account_number`, `account_type`) VALUES
(10, 'Ran1558', 'Nancy Rani', 'Indian Overseas Bank', 'Bangalore', '452637389738296', 'Savings'),
(11, '.R1636', 'Akila R', 'Bank of Baroda', 'Noida', '656564236257', 'Savings'),
(12, 'A.1352', 'Sanjay Kumar', 'Union Bank of India', 'Delhi', '537253735757648', 'Savings'),
(13, 'A.1352', 'Sanjay Kumar', 'Union Bank of India', 'Delhi', '537253735757648', 'Savings'),
(14, 'Pra1827', 'Suriya Prakash', 'Bharat Bank', 'Meenakshipuram', '50758420083117', 'Savings'),
(15, 'Jas1706', 'Meera Jasmine', 'Bank Of Canara', 'Veppam Patti', '34364700928651', 'Savings'),
(16, 'K.1146', 'Madhavan K', 'IOC Bank', 'Keezhkattalai', '76364700928609', 'Savings');

-- --------------------------------------------------------

--
-- Table structure for table `deduction`
--

CREATE TABLE `deduction` (
  `de_id` int(14) NOT NULL,
  `salary_id` int(14) NOT NULL,
  `provident_fund` varchar(64) DEFAULT NULL,
  `bima` varchar(64) DEFAULT NULL,
  `tax` varchar(64) DEFAULT NULL,
  `others` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `deduction`
--

INSERT INTO `deduction` (`de_id`, `salary_id`, `provident_fund`, `bima`, `tax`, `others`) VALUES
(25, 25, '2200', '200', '750', '1100'),
(26, 26, '2200', '200', '1300', '1400'),
(27, 27, '1950', '400', '870', '300'),
(28, 28, '1200', '600', '100', '100'),
(29, 29, '1,000', '0', '0', '0'),
(30, 30, '1200', '600', '2000', '400');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `id` int(11) NOT NULL,
  `dep_name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`id`, `dep_name`) VALUES
(2, 'Admin'),
(4, 'Research and Development'),
(7, 'Sales and Marketing'),
(8, 'Operations'),
(9, 'Quality Assurance'),
(10, 'Accounts and Finance'),
(11, 'Learning and Development'),
(12, 'Human Resources Team'),
(13, 'Customer Support'),
(14, 'Security');

-- --------------------------------------------------------

--
-- Table structure for table `desciplinary`
--

CREATE TABLE `desciplinary` (
  `id` int(14) NOT NULL,
  `em_id` varchar(64) DEFAULT NULL,
  `action` varchar(256) DEFAULT NULL,
  `title` varchar(256) DEFAULT NULL,
  `description` varchar(512) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `designation`
--

CREATE TABLE `designation` (
  `id` int(11) NOT NULL,
  `des_name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `designation`
--

INSERT INTO `designation` (`id`, `des_name`) VALUES
(3, 'Chief Executive Officer (CEO)'),
(15, 'Chief Operation Officer (COO)'),
(16, 'Chief Finance Officer (CFO)'),
(17, 'Chief Technology Officer (CTO)'),
(18, 'President'),
(19, 'Vice President'),
(20, 'Chief Revenue Officer (CRO)'),
(21, 'Senior Project Manager'),
(22, 'Project Director/Project Head'),
(23, 'Project Manager'),
(24, 'Trainee'),
(25, 'IT Architect'),
(26, 'Senior Technical Head'),
(27, 'Technical Head'),
(28, 'Senior Quality Analyst'),
(29, 'Senior Testing Officer'),
(30, 'Senior Resource Management Officer'),
(31, 'Human Resource Manager'),
(32, 'Senior Software Engineer'),
(33, 'Software Engineer'),
(34, 'Software Developer'),
(35, 'Junior Developer'),
(36, 'Programmer Analyst'),
(37, 'Software Testing Officer'),
(38, 'Quality Testing Officer'),
(39, 'Team Leader');

-- --------------------------------------------------------

--
-- Table structure for table `earned_leave`
--

CREATE TABLE `earned_leave` (
  `id` int(14) NOT NULL,
  `em_id` varchar(64) DEFAULT NULL,
  `present_date` varchar(64) DEFAULT NULL,
  `hour` varchar(64) DEFAULT NULL,
  `status` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `earned_leave`
--

INSERT INTO `earned_leave` (`id`, `em_id`, `present_date`, `hour`, `status`) VALUES
(26, 'Mir1685', '0', '0', '1'),
(27, 'Rah1682', '0', '0', '1'),
(28, 'edr1432', '0', '0', '1'),
(29, 'kum1963', '3', '24', '1'),
(30, 'A.1352', '1', '8', '1'),
(31, 'G.1791', '3', '24', '1');

-- --------------------------------------------------------

--
-- Table structure for table `education`
--

CREATE TABLE `education` (
  `id` int(11) NOT NULL,
  `emp_id` varchar(128) DEFAULT NULL,
  `edu_type` varchar(256) DEFAULT NULL,
  `institute` varchar(256) DEFAULT NULL,
  `result` varchar(64) DEFAULT NULL,
  `year` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `education`
--

INSERT INTO `education` (`id`, `emp_id`, `edu_type`, `institute`, `result`, `year`) VALUES
(22, 'Ran1558', 'B.E (CSE)', 'Kings Engineering College', '92.5', '2021'),
(23, '.R1636', 'M.E (ECE)', 'Jaimata Institute of Technology', '87.3', '2015'),
(24, 'A.1352', 'M.E (Computer science)', 'Delhi IIT', '97.8', '2018'),
(25, 'kum1963', '10th STD', 'Chennai Govt Hr school', '98.7', '2006'),
(26, 'kum1963', '12th STD', 'Chennai Govt Hr school', '97.2', '2008'),
(27, 'kum1963', 'M.Sc (Computer Science)', 'IIT Chennai', '90.25', '2013'),
(28, 'Pra1827', 'B.E (IT)', 'Annai Unnversity', '89.3', '2021'),
(29, 'Jas1706', 'B.Com', 'Queens Arts And Science', '92.8', '2022');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `id` int(11) NOT NULL,
  `em_id` varchar(64) DEFAULT NULL,
  `em_code` varchar(64) DEFAULT NULL,
  `des_id` int(11) DEFAULT NULL,
  `dep_id` int(11) DEFAULT NULL,
  `first_name` varchar(128) DEFAULT NULL,
  `last_name` varchar(128) DEFAULT NULL,
  `em_email` varchar(64) DEFAULT NULL,
  `em_password` varchar(512) NOT NULL,
  `em_role` enum('ADMIN','EMPLOYEE','SUPER ADMIN') NOT NULL DEFAULT 'EMPLOYEE',
  `em_address` varchar(512) DEFAULT NULL,
  `status` enum('ACTIVE','INACTIVE') NOT NULL DEFAULT 'ACTIVE',
  `em_gender` enum('Male','Female') NOT NULL DEFAULT 'Male',
  `em_phone` varchar(64) DEFAULT NULL,
  `em_birthday` varchar(128) DEFAULT NULL,
  `em_blood_group` enum('O+','O-','A+','A-','B+','B-','AB+','OB+') DEFAULT NULL,
  `em_joining_date` varchar(128) DEFAULT NULL,
  `em_contact_end` varchar(128) DEFAULT NULL,
  `em_image` varchar(128) DEFAULT NULL,
  `em_nid` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`id`, `em_id`, `em_code`, `des_id`, `dep_id`, `first_name`, `last_name`, `em_email`, `em_password`, `em_role`, `em_address`, `status`, `em_gender`, `em_phone`, `em_birthday`, `em_blood_group`, `em_joining_date`, `em_contact_end`, `em_image`, `em_nid`) VALUES
(36, 'Aka1753', 'E-ADM01', 18, 2, 'Akash', 'Kumar', 'admin@impactsolutions.com', 'cd5ea73cd58f827fa78eef7197b8ee606c99b2e6', 'ADMIN', NULL, 'ACTIVE', 'Male', '4481625102', '1970-06-11', 'O+', '2010-02-15', '', 'Aka17531.jpg', '763832430989'),
(38, 'kum1963', 'E5001', 22, 4, 'Vinoth', 'Kumar', 'vinoth@impactsolutions.com', 'e922121dd173510e164a45695b7eb6f19d023f90', 'EMPLOYEE', NULL, 'ACTIVE', 'Male', '8042043626', '1988-06-01', 'O+', '2014-10-13', '', 'kum1963.jpg', '456378132451'),
(39, 'A.1352', 'E5002', 38, 9, 'Sanjay', 'Kumar', 'sanjay@impactsolutions.com', '4b96b7ff409108dfb0b7da33627547b8e37232c2', 'EMPLOYEE', NULL, 'ACTIVE', 'Male', '6437463900', '1998-05-26', 'B-', '2018-02-14', '', 'A.1352', '6832 5845 9645'),
(40, 'G.1791', 'E5003', 16, 10, 'Priya', 'Lakshmi', 'priya@impactsolutions.com', '1c633607c7a3afd5b3a3812d4ee0934d7fd21d23', 'ADMIN', NULL, 'ACTIVE', 'Female', '6385338096', '1992-08-31', 'AB+', '2013-03-28', '', 'G.1791', '6485 9347 4634'),
(41, 'K.1146', 'E5007', 36, 8, 'Madhavan', 'K.', 'madhavan@impactsolutions.com', 'f74eee2e3272267d21f5b9df8b7b03b4c0974cd5', 'EMPLOYEE', NULL, 'ACTIVE', 'Male', '9876544540', '1994-09-24', 'B-', '2016-11-04', '', 'K.1146', '6357 6375 8547'),
(43, 'Kum1382', 'E5005', 17, 11, 'Sarath', 'Kumar', 'sarath@impactsolutions.com', '300ddb30cea2f63a774c20b74efe678bbbf7c80e', 'ADMIN', NULL, 'ACTIVE', 'Male', '7689256378', '1984-10-24', 'B+', '2010-02-16', '', 'Kum1382.jpg', '768914523673'),
(44, 'kum1890', 'E5010', 31, 12, 'Akash', 'kumar', 'akashkumar@impactsolutions.com', '9d00cbe635d35a914d6d2412b52d7f4647c0a103', 'EMPLOYEE', NULL, 'INACTIVE', 'Male', '6465745650', '1986-12-18', 'AB+', '2008-03-05', '', 'kum1890.jpg', '453054783298'),
(45, 'Pra1827', 'E5004', NULL, NULL, 'Suriya', 'Prakash', 'suriyaprakash@impactsolutions.com', 'b0b0677d59f0bedf94ece99a41c9e439564bf91c', 'EMPLOYEE', NULL, 'ACTIVE', 'Male', '9567354800', '2000-07-19', 'B+', '2022-08-06', '', 'Pra1827.jpg', '758942585901'),
(46, 'Jas1706', 'E5006', 10, 10, 'Meera', 'Jasmine', 'mjasmine@impactsolutions.com', '54baf7dfb6a939408d7cc7cb0d87aeb1354d52a5', 'EMPLOYEE', NULL, 'ACTIVE', 'Female', '9834628556', '2001-09-26', 'O-', '2022-06-09', '', 'Jas1706.jpg', '864334567903'),
(47, '.R1636', 'E5008', 27, 12, 'Akila', '.R', 'AkilaR@impactsolutions.com', '9b8521b1685c8a3f9fa8093f2074ae56d10ac7d6', 'EMPLOYEE', NULL, 'ACTIVE', 'Female', '8966024529', '1999-04-13', 'A+', '2021-02-23', '', '.R1636', '454754754608'),
(48, 'Ran1558', 'E5009', 38, 9, 'Nancy', 'Rani', 'nancyrani@impactsolutions.com', '7e3bece932910dc7c18ac3a9a073e7545a460737', 'EMPLOYEE', NULL, 'ACTIVE', 'Female', '8004722894', '1998-03-19', 'A-', '2021-06-03', '', 'Ran1558.jpg', '7698554023');

-- --------------------------------------------------------

--
-- Table structure for table `employee_file`
--

CREATE TABLE `employee_file` (
  `id` int(14) NOT NULL,
  `em_id` varchar(64) DEFAULT NULL,
  `file_title` varchar(512) DEFAULT NULL,
  `file_url` varchar(512) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `emp_assets`
--

CREATE TABLE `emp_assets` (
  `id` int(11) NOT NULL,
  `emp_id` int(11) NOT NULL,
  `assets_id` int(11) NOT NULL,
  `given_date` date NOT NULL,
  `return_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `emp_experience`
--

CREATE TABLE `emp_experience` (
  `id` int(14) NOT NULL,
  `emp_id` varchar(256) DEFAULT NULL,
  `exp_company` varchar(128) DEFAULT NULL,
  `exp_com_position` varchar(128) DEFAULT NULL,
  `exp_com_address` varchar(128) DEFAULT NULL,
  `exp_workduration` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `emp_leave`
--

CREATE TABLE `emp_leave` (
  `id` int(11) NOT NULL,
  `em_id` varchar(64) DEFAULT NULL,
  `typeid` int(14) NOT NULL,
  `leave_type` varchar(64) DEFAULT NULL,
  `start_date` varchar(64) DEFAULT NULL,
  `end_date` varchar(64) DEFAULT NULL,
  `leave_duration` varchar(128) DEFAULT NULL,
  `apply_date` varchar(64) DEFAULT NULL,
  `reason` varchar(1024) DEFAULT NULL,
  `leave_status` enum('Approve','Not Approve','Rejected') NOT NULL DEFAULT 'Not Approve'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `emp_leave`
--

INSERT INTO `emp_leave` (`id`, `em_id`, `typeid`, `leave_type`, `start_date`, `end_date`, `leave_duration`, `apply_date`, `reason`, `leave_status`) VALUES
(37, '.R1636', 2, 'Full Day', '2023-07-09', '', '8', '2023-07-08', 'Stomach pain', 'Approve'),
(38, 'Jas1706', 1, 'Full Day', '2023-07-03', '', '8', '2023-07-08', 'To attend parents meeting day in school for my kids', 'Approve'),
(39, 'G.1791', 7, 'Full Day', '2023-11-12', '', '8', '2023-11-13', 'Deepavali Festival holiday request', 'Approve'),
(40, 'Pra1827', 5, 'Full Day', '2023-11-21', '2023-11-21', '8', '2023-11-21', 'Outing going with family', 'Rejected');

-- --------------------------------------------------------

--
-- Table structure for table `emp_penalty`
--

CREATE TABLE `emp_penalty` (
  `id` int(11) NOT NULL,
  `emp_id` int(11) NOT NULL,
  `penalty_id` int(11) NOT NULL,
  `penalty_desc` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `emp_salary`
--

CREATE TABLE `emp_salary` (
  `id` int(11) NOT NULL,
  `emp_id` varchar(64) DEFAULT NULL,
  `type_id` int(11) NOT NULL,
  `total` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `emp_salary`
--

INSERT INTO `emp_salary` (`id`, `emp_id`, `type_id`, `total`) VALUES
(25, 'Ran1558', 2, '35000'),
(26, '.R1636', 2, '40000'),
(27, 'A.1352', 2, '33000'),
(28, 'Pra1827', 2, '28,000'),
(29, 'Jas1706', 2, '18,000'),
(30, 'K.1146', 2, '26000');

-- --------------------------------------------------------

--
-- Table structure for table `emp_training`
--

CREATE TABLE `emp_training` (
  `id` int(11) NOT NULL,
  `trainig_id` int(11) NOT NULL,
  `emp_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `field_visit`
--

CREATE TABLE `field_visit` (
  `id` int(14) NOT NULL,
  `project_id` varchar(256) NOT NULL,
  `emp_id` varchar(64) DEFAULT NULL,
  `field_location` varchar(512) NOT NULL,
  `start_date` varchar(64) DEFAULT NULL,
  `approx_end_date` varchar(28) NOT NULL,
  `total_days` varchar(64) DEFAULT NULL,
  `notes` varchar(500) NOT NULL,
  `actual_return_date` varchar(28) NOT NULL,
  `status` enum('Approved','Not Approve','Rejected') NOT NULL DEFAULT 'Not Approve',
  `attendance_updated` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `field_visit`
--

INSERT INTO `field_visit` (`id`, `project_id`, `emp_id`, `field_location`, `start_date`, `approx_end_date`, `total_days`, `notes`, `actual_return_date`, `status`, `attendance_updated`) VALUES
(24, '6', 'kum1890', 'Tambaram, Chennai', '2023-09-20', '2023-09-24', '4', 'Field site visit - week1 for Star City Township', '', 'Approved', ''),
(25, '6', 'Kum1382', 'Guindy, Chennai', '2023-09-20', '2023-09-21', '1', 'Field visit to Guindy site', '', 'Not Approve', '');

-- --------------------------------------------------------

--
-- Table structure for table `holiday`
--

CREATE TABLE `holiday` (
  `id` int(11) NOT NULL,
  `holiday_name` varchar(256) DEFAULT NULL,
  `from_date` varchar(64) DEFAULT NULL,
  `to_date` varchar(64) DEFAULT NULL,
  `number_of_days` varchar(64) DEFAULT NULL,
  `year` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `holiday`
--

INSERT INTO `holiday` (`id`, `holiday_name`, `from_date`, `to_date`, `number_of_days`, `year`) VALUES
(9, 'English New Year', '2023-01-01', '2023-01-01', '0', '01-2023'),
(11, 'Swami Vivekananda Jayanti', '2023-01-12', '2023-01-12', '0', '01-2023'),
(13, 'Pongal', '2023-01-14', '2023-01-16', '2', '01-2023'),
(14, 'Republic Day', '2023-01-26', '2023-01-26', '0', '01-2023'),
(16, 'Sant Ravidas Jayanti', '2023-02-05', '2023-02-05', '0', '02-2023'),
(17, 'Good Friday', '2023-04-07', '2023-04-07', '0', '04-2023'),
(18, 'Easter', '2023-04-09', '2023-04-09', '0', '04-2023'),
(19, 'Eid ul-Adha', '2023-06-28', '2023-06-29', '1', '06-2023'),
(20, 'Sri Krishna Janmashtami', '2023-09-06', '2023-09-07', '1', '09-2023'),
(21, 'Milad un-Nabi ', '2023-09-27', '2023-09-28', '1', '09-2023'),
(22, 'Mahatma Gandhi Jayanti', '2023-10-02', '2023-10-02', '0', '10-2023'),
(23, 'Durga Puja Begins', '2023-10-20', '2023-10-24', '4', '10-2023'),
(24, 'Halloween', '2023-10-31', '2023-10-31', '0', '10-2023'),
(25, 'Children\'s Day', '2023-11-14', '2023-11-14', '0', '11-2023'),
(26, 'Diwali', '2023-11-12', '2023-11-12', '0', '11-2023'),
(27, 'Christmas', '2023-12-25', '2023-12-25', '0', '12-2023'),
(28, 'Mahashivratri', '2023-02-18', '2023-02-18', '0', '02-2023'),
(29, 'Bank\'s Holiday', '2023-04-01', '2023-04-01', '0', '04-2023'),
(30, 'Independence Day', '2023-08-15', '2023-08-15', '0', '08-2023'),
(31, 'Ganesh Chaturthi', '2023-09-19', '2023-09-19', '0', '09-2023');

-- --------------------------------------------------------

--
-- Table structure for table `leave_types`
--

CREATE TABLE `leave_types` (
  `type_id` int(14) NOT NULL,
  `name` varchar(64) NOT NULL,
  `leave_day` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `leave_types`
--

INSERT INTO `leave_types` (`type_id`, `name`, `leave_day`, `status`) VALUES
(1, 'Casual Leave', '12', 1),
(2, 'Sick Leave', '14', 1),
(3, 'Maternity Leave', '180', 1),
(4, 'Paternity Leave', '10', 1),
(5, 'Earned leave', '14', 1),
(7, 'Public Holiday', '14', 1),
(8, 'Comp Off', '4', 1),
(9, 'Leave without Pay', '10', 1);

-- --------------------------------------------------------

--
-- Table structure for table `loan`
--

CREATE TABLE `loan` (
  `id` int(14) NOT NULL,
  `emp_id` varchar(256) DEFAULT NULL,
  `amount` varchar(256) DEFAULT NULL,
  `interest_percentage` varchar(256) DEFAULT NULL,
  `total_amount` varchar(64) DEFAULT NULL,
  `total_pay` varchar(64) DEFAULT NULL,
  `total_due` varchar(64) DEFAULT NULL,
  `installment` varchar(256) DEFAULT NULL,
  `loan_number` varchar(256) DEFAULT NULL,
  `loan_details` varchar(256) DEFAULT NULL,
  `approve_date` varchar(256) DEFAULT NULL,
  `install_period` varchar(256) DEFAULT NULL,
  `status` enum('Granted','Deny','Pause','Done') NOT NULL DEFAULT 'Pause'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `loan`
--

INSERT INTO `loan` (`id`, `emp_id`, `amount`, `interest_percentage`, `total_amount`, `total_pay`, `total_due`, `installment`, `loan_number`, `loan_details`, `approve_date`, `install_period`, `status`) VALUES
(35, '.R1636', '30000', NULL, NULL, '18000', '12000', '6000', '28226956', 'this loan is for education of kids', '2023-02-01', '2', 'Granted'),
(36, 'Ran1558', '20000', NULL, NULL, '6666', '13334', '3333', '40366380', 'For Personal emergency', '2023-10-14', '4', 'Granted');

-- --------------------------------------------------------

--
-- Table structure for table `loan_installment`
--

CREATE TABLE `loan_installment` (
  `id` int(14) NOT NULL,
  `loan_id` int(14) NOT NULL,
  `emp_id` varchar(64) DEFAULT NULL,
  `loan_number` varchar(256) DEFAULT NULL,
  `install_amount` varchar(256) DEFAULT NULL,
  `pay_amount` varchar(64) DEFAULT NULL,
  `app_date` varchar(256) DEFAULT NULL,
  `receiver` varchar(256) DEFAULT NULL,
  `install_no` varchar(256) DEFAULT NULL,
  `notes` varchar(512) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `loan_installment`
--

INSERT INTO `loan_installment` (`id`, `loan_id`, `emp_id`, `loan_number`, `install_amount`, `pay_amount`, `app_date`, `receiver`, `install_no`, `notes`) VALUES
(32, 35, '.R1636', '28226956', '6000', NULL, '2023-10-14', 'Impact Payroll Solutions', '4', 'Amount received'),
(33, 35, '.R1636', '28226956', '6000', NULL, '2023-10-02', 'Impact Payroll Solutions', '3', 'Amount received'),
(34, 36, 'Ran1558', '40366380', '3333', NULL, '2023-11-01', 'Impact Payroll Solutions', '5', 'Amount received'),
(35, 36, 'Ran1558', '40366380', '3333', NULL, '2023-10-31', 'Impact Payroll Solutions', '4', 'Amount received'),
(36, 35, '.R1636', '28226956', '6000', NULL, '2023-10-31', 'Impact Payroll Solutions', '2', 'Amount received');

-- --------------------------------------------------------

--
-- Table structure for table `logistic_asset`
--

CREATE TABLE `logistic_asset` (
  `log_id` int(14) NOT NULL,
  `name` varchar(256) DEFAULT NULL,
  `qty` varchar(64) DEFAULT NULL,
  `entry_date` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `logistic_asset`
--

INSERT INTO `logistic_asset` (`log_id`, `name`, `qty`, `entry_date`) VALUES
(1, 'Lubricant', '30', '12/25/17');

-- --------------------------------------------------------

--
-- Table structure for table `logistic_assign`
--

CREATE TABLE `logistic_assign` (
  `ass_id` int(14) NOT NULL,
  `asset_id` int(14) NOT NULL,
  `assign_id` varchar(64) DEFAULT NULL,
  `project_id` int(14) NOT NULL,
  `task_id` int(14) NOT NULL,
  `log_qty` varchar(64) DEFAULT NULL,
  `start_date` varchar(64) DEFAULT NULL,
  `end_date` varchar(64) DEFAULT NULL,
  `back_date` varchar(64) DEFAULT NULL,
  `back_qty` varchar(64) DEFAULT NULL,
  `remarks` varchar(512) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `logistic_assign`
--

INSERT INTO `logistic_assign` (`ass_id`, `asset_id`, `assign_id`, `project_id`, `task_id`, `log_qty`, `start_date`, `end_date`, `back_date`, `back_qty`, `remarks`) VALUES
(11, 21, 'Pra1827', 6, 16, '1', '2023-10-01', '2023-10-31', NULL, NULL, 'For Star City Township project, ! month site visit'),
(12, 20, 'kum1890', 6, 15, '1', '2023-06-01', '', NULL, NULL, 'For shift support');

-- --------------------------------------------------------

--
-- Table structure for table `notice`
--

CREATE TABLE `notice` (
  `id` int(11) NOT NULL,
  `title` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `file_url` varchar(256) DEFAULT NULL,
  `date` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notice`
--

INSERT INTO `notice` (`id`, `title`, `file_url`, `date`) VALUES
(4, 'Star City Township Project - New Year Updates', 'Star_City_Township_Project.pdf', '2023-11-08');

-- --------------------------------------------------------

--
-- Table structure for table `owner`
--

CREATE TABLE `owner` (
  `id` int(11) NOT NULL,
  `owner_name` varchar(64) NOT NULL,
  `owner_position` varchar(64) DEFAULT NULL,
  `note` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pay_salary`
--

CREATE TABLE `pay_salary` (
  `pay_id` int(14) NOT NULL,
  `emp_id` varchar(64) DEFAULT NULL,
  `type_id` int(14) NOT NULL,
  `month` varchar(64) DEFAULT NULL,
  `year` varchar(64) DEFAULT NULL,
  `paid_date` varchar(64) DEFAULT NULL,
  `total_days` varchar(64) DEFAULT NULL,
  `basic` varchar(64) DEFAULT NULL,
  `medical` varchar(64) DEFAULT NULL,
  `house_rent` varchar(64) DEFAULT NULL,
  `bonus` varchar(64) DEFAULT NULL,
  `bima` varchar(64) DEFAULT NULL,
  `tax` varchar(64) DEFAULT NULL,
  `provident_fund` varchar(64) DEFAULT NULL,
  `loan` varchar(64) DEFAULT NULL,
  `total_pay` varchar(128) DEFAULT NULL,
  `addition` int(128) NOT NULL,
  `diduction` int(128) NOT NULL,
  `status` enum('Paid','Process') DEFAULT 'Process',
  `paid_type` enum('Hand Cash','Bank') NOT NULL DEFAULT 'Bank'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pay_salary`
--

INSERT INTO `pay_salary` (`pay_id`, `emp_id`, `type_id`, `month`, `year`, `paid_date`, `total_days`, `basic`, `medical`, `house_rent`, `bonus`, `bima`, `tax`, `provident_fund`, `loan`, `total_pay`, `addition`, `diduction`, `status`, `paid_type`) VALUES
(34, 'Ran1558', 0, 'October', '2023', '2023-10-31', '180', '35000', NULL, NULL, NULL, NULL, NULL, NULL, '3333', '30906.60', 0, 4094, 'Paid', 'Bank'),
(35, '.R1636', 0, 'October', '2023', '2023-10-31', '170', '40000', NULL, NULL, NULL, NULL, NULL, NULL, '6000', '30956.30', 0, 9043, 'Paid', 'Bank'),
(36, 'A.1352', 0, 'October', '2023', '2023-10-31', '180', '33000', NULL, NULL, NULL, NULL, NULL, NULL, '0', '32283.00', 0, 717, 'Paid', 'Bank'),
(37, 'K.1146', 0, 'November', '2023', '2023-11-30', '200', '26000', NULL, NULL, NULL, NULL, NULL, NULL, '0', '25000.00', 0, 1000, 'Paid', 'Bank');

-- --------------------------------------------------------

--
-- Table structure for table `penalty`
--

CREATE TABLE `penalty` (
  `id` int(11) NOT NULL,
  `penalty_name` varchar(64) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

CREATE TABLE `project` (
  `id` int(14) NOT NULL,
  `pro_name` varchar(128) DEFAULT NULL,
  `pro_start_date` varchar(128) DEFAULT NULL,
  `pro_end_date` varchar(128) DEFAULT NULL,
  `pro_description` varchar(1024) DEFAULT NULL,
  `pro_summary` varchar(512) DEFAULT NULL,
  `pro_status` enum('upcoming','complete','running') NOT NULL DEFAULT 'running',
  `progress` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `project`
--

INSERT INTO `project` (`id`, `pro_name`, `pro_start_date`, `pro_end_date`, `pro_description`, `pro_summary`, `pro_status`, `progress`) VALUES
(6, 'Star City Township', '15/09/2023', '31/12/2023', ' Project budget - 25 crores', 'This is township construction project', 'running', NULL),
(7, 'Radiance Majestic', '11/01/2023', '04/30/2024', 'Initial Budget Estimation: 2 Crores\r\nNo of resources assigned:  4\r\nCompletion Duration Estimated:  6 Months', 'Radiance Majestic, Chennai Suburbs is a luxurious project that offers 234 units spread over 2.5 acres in a serene and peaceful location. The gated project consists of 2.5, 3BHK and 4BHK apartments that come with smart home automation and premium specifications. The apartments come with sizes ranging from 936 sqft to 2436 sqft. The project offers a convenient shopping center for daily needs and is well connected to Grand Southern Trunk Road.', 'upcoming', NULL),
(8, 'Emerald Peninsula', '10/31/2024', '01/03/2024', 'Initial Budget Estimation: 5 Crores\r\nNo of resources assigned:  8\r\nCompletion Duration Estimated:  10 Months', 'Peninsula is being offered by TVS Emerald in Manapakkam. just 392 apartments, all corner units, spread over 6 acres! lavish green homes, spacious residences with three sides of ventilation. In the centre of the city, adjacent to IT Parks, hospitals, and schools, is the TVS Emerald Peninsula. World-class amenities like an organic garden, an aroma garden, reading nooks, and hammocks are available at TVS Emerald Peninsula.\r\n\r\nThe TVS Emerald Peninsula is intended to bring happiness with 72% open area. Enjoy a ', 'upcoming', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `project_file`
--

CREATE TABLE `project_file` (
  `id` int(14) NOT NULL,
  `pro_id` int(14) NOT NULL,
  `file_details` varchar(1028) DEFAULT NULL,
  `file_url` varchar(256) DEFAULT NULL,
  `assigned_to` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pro_expenses`
--

CREATE TABLE `pro_expenses` (
  `id` int(14) NOT NULL,
  `pro_id` int(14) NOT NULL,
  `assign_to` varchar(64) DEFAULT NULL,
  `details` varchar(512) DEFAULT NULL,
  `amount` varchar(256) DEFAULT NULL,
  `date` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pro_notes`
--

CREATE TABLE `pro_notes` (
  `id` int(14) NOT NULL,
  `assign_to` varchar(64) DEFAULT NULL,
  `pro_id` int(14) NOT NULL,
  `details` varchar(1024) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pro_task`
--

CREATE TABLE `pro_task` (
  `id` int(14) NOT NULL,
  `pro_id` int(14) NOT NULL,
  `task_title` varchar(256) DEFAULT NULL,
  `start_date` varchar(128) DEFAULT NULL,
  `end_date` varchar(128) DEFAULT NULL,
  `image` varchar(128) DEFAULT NULL,
  `description` varchar(2048) DEFAULT NULL,
  `task_type` enum('Office','Field') NOT NULL DEFAULT 'Office',
  `status` enum('running','complete','cancel') DEFAULT 'running',
  `location` varchar(512) DEFAULT NULL,
  `return_date` varchar(128) DEFAULT NULL,
  `total_days` varchar(128) DEFAULT NULL,
  `create_date` varchar(128) DEFAULT NULL,
  `approve_status` enum('Approved','Not Approve','Rejected') NOT NULL DEFAULT 'Not Approve'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pro_task`
--

INSERT INTO `pro_task` (`id`, `pro_id`, `task_title`, `start_date`, `end_date`, `image`, `description`, `task_type`, `status`, `location`, `return_date`, `total_days`, `create_date`, `approve_status`) VALUES
(15, 6, 'Assessment', '2023-09-15', '2023-09-17', NULL, 'Assess project info and requirements', '', 'running', NULL, NULL, NULL, '2023-09-12', ''),
(16, 6, 'Blueprint Report', '2023-09-18', '2023-09-20', NULL, 'Generate township blueprint report', '', 'running', NULL, NULL, NULL, '2023-09-12', ''),
(17, 6, 'Land acquisition documenting', '2023-11-13', '2023-11-30', NULL, 'Land acquisition formalities and documenting the costs involved, resources needed, etc/', 'Office', 'running', NULL, NULL, NULL, '2023-11-13', '');

-- --------------------------------------------------------

--
-- Table structure for table `pro_task_assets`
--

CREATE TABLE `pro_task_assets` (
  `id` int(11) NOT NULL,
  `pro_task_id` int(11) NOT NULL,
  `assign_id` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `salary_type`
--

CREATE TABLE `salary_type` (
  `id` int(14) NOT NULL,
  `salary_type` varchar(256) DEFAULT NULL,
  `create_date` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `salary_type`
--

INSERT INTO `salary_type` (`id`, `salary_type`, `create_date`) VALUES
(1, 'Hourly', '2017-11-22'),
(2, 'Monthly', '2017-12-30'),
(3, 'Per Day', '2023-02-08'),
(4, 'Per Week', '2023-02-08');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `sitelogo` varchar(128) DEFAULT NULL,
  `sitetitle` varchar(256) DEFAULT NULL,
  `description` varchar(512) DEFAULT NULL,
  `copyright` varchar(128) DEFAULT NULL,
  `contact` varchar(128) DEFAULT NULL,
  `currency` varchar(128) DEFAULT NULL,
  `symbol` varchar(64) DEFAULT NULL,
  `system_email` varchar(128) DEFAULT NULL,
  `address` varchar(256) DEFAULT NULL,
  `address2` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `sitelogo`, `sitetitle`, `description`, `copyright`, `contact`, `currency`, `symbol`, `system_email`, `address`, `address2`) VALUES
(1, 'impact.jpg', 'Impact Payroll Systems', 'Calculate payroll and disburse salaries in just a few clicks. Impact Payroll automates payments and filings of compliances like TDS, PF, ESI, PT, and more!', 'Genie Projects World', '08023416839', 'Rupee', '₹', 'contact@impactpayrollsystems.in', 'H.NO.605 HBR LAYOUT,1ST STAGE,5TH BLOCK BANGALORE Bangalore KA 560043 IN', 'India');

-- --------------------------------------------------------

--
-- Table structure for table `social_media`
--

CREATE TABLE `social_media` (
  `id` int(14) NOT NULL,
  `emp_id` varchar(64) DEFAULT NULL,
  `facebook` varchar(256) DEFAULT NULL,
  `twitter` varchar(256) DEFAULT NULL,
  `google_plus` varchar(512) DEFAULT NULL,
  `skype_id` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `to-do_list`
--

CREATE TABLE `to-do_list` (
  `id` int(14) NOT NULL,
  `user_id` varchar(64) DEFAULT NULL,
  `to_dodata` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` varchar(128) DEFAULT NULL,
  `value` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `to-do_list`
--

INSERT INTO `to-do_list` (`id`, `user_id`, `to_dodata`, `date`, `value`) VALUES
(31, 'Aka1753', 'Client centric model implementation ', '2023-11-13 08:46:03pm', '0'),
(32, 'Aka1753', 'Performance Connect 2023', '2023-11-21 01:40:45pm', '1'),
(33, 'Aka1753', 'Automating Standard Tasks', '2023-11-21 01:41:30pm', '1'),
(34, 'kum1963', 'Performance Connect 2023', '2023-12-26 09:44:18pm', '1'),
(35, 'kum1963', 'Automating Failure Jobs Alerts', '2023-12-26 09:44:47pm', '1');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addition`
--
ALTER TABLE `addition`
  ADD PRIMARY KEY (`addi_id`);

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `assets`
--
ALTER TABLE `assets`
  ADD PRIMARY KEY (`ass_id`);

--
-- Indexes for table `assets_category`
--
ALTER TABLE `assets_category`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `assign_leave`
--
ALTER TABLE `assign_leave`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `assign_task`
--
ALTER TABLE `assign_task`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bank_info`
--
ALTER TABLE `bank_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deduction`
--
ALTER TABLE `deduction`
  ADD PRIMARY KEY (`de_id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `desciplinary`
--
ALTER TABLE `desciplinary`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `designation`
--
ALTER TABLE `designation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `earned_leave`
--
ALTER TABLE `earned_leave`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `education`
--
ALTER TABLE `education`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee_file`
--
ALTER TABLE `employee_file`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `emp_assets`
--
ALTER TABLE `emp_assets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `emp_experience`
--
ALTER TABLE `emp_experience`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `emp_leave`
--
ALTER TABLE `emp_leave`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `emp_penalty`
--
ALTER TABLE `emp_penalty`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `emp_salary`
--
ALTER TABLE `emp_salary`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `field_visit`
--
ALTER TABLE `field_visit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `holiday`
--
ALTER TABLE `holiday`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leave_types`
--
ALTER TABLE `leave_types`
  ADD PRIMARY KEY (`type_id`);

--
-- Indexes for table `loan`
--
ALTER TABLE `loan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loan_installment`
--
ALTER TABLE `loan_installment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `logistic_asset`
--
ALTER TABLE `logistic_asset`
  ADD PRIMARY KEY (`log_id`);

--
-- Indexes for table `logistic_assign`
--
ALTER TABLE `logistic_assign`
  ADD PRIMARY KEY (`ass_id`);

--
-- Indexes for table `notice`
--
ALTER TABLE `notice`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pay_salary`
--
ALTER TABLE `pay_salary`
  ADD PRIMARY KEY (`pay_id`);

--
-- Indexes for table `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project_file`
--
ALTER TABLE `project_file`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pro_expenses`
--
ALTER TABLE `pro_expenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pro_notes`
--
ALTER TABLE `pro_notes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pro_task`
--
ALTER TABLE `pro_task`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pro_task_assets`
--
ALTER TABLE `pro_task_assets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `salary_type`
--
ALTER TABLE `salary_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `social_media`
--
ALTER TABLE `social_media`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `to-do_list`
--
ALTER TABLE `to-do_list`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addition`
--
ALTER TABLE `addition`
  MODIFY `addi_id` int(14) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `id` int(14) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `assets`
--
ALTER TABLE `assets`
  MODIFY `ass_id` int(14) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `assets_category`
--
ALTER TABLE `assets_category`
  MODIFY `cat_id` int(14) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `assign_leave`
--
ALTER TABLE `assign_leave`
  MODIFY `id` int(14) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `assign_task`
--
ALTER TABLE `assign_task`
  MODIFY `id` int(14) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `id` int(14) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `bank_info`
--
ALTER TABLE `bank_info`
  MODIFY `id` int(14) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `deduction`
--
ALTER TABLE `deduction`
  MODIFY `de_id` int(14) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `desciplinary`
--
ALTER TABLE `desciplinary`
  MODIFY `id` int(14) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `designation`
--
ALTER TABLE `designation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `earned_leave`
--
ALTER TABLE `earned_leave`
  MODIFY `id` int(14) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `education`
--
ALTER TABLE `education`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `employee_file`
--
ALTER TABLE `employee_file`
  MODIFY `id` int(14) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `emp_assets`
--
ALTER TABLE `emp_assets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `emp_experience`
--
ALTER TABLE `emp_experience`
  MODIFY `id` int(14) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `emp_leave`
--
ALTER TABLE `emp_leave`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `emp_penalty`
--
ALTER TABLE `emp_penalty`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `emp_salary`
--
ALTER TABLE `emp_salary`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `field_visit`
--
ALTER TABLE `field_visit`
  MODIFY `id` int(14) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `holiday`
--
ALTER TABLE `holiday`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `leave_types`
--
ALTER TABLE `leave_types`
  MODIFY `type_id` int(14) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `loan`
--
ALTER TABLE `loan`
  MODIFY `id` int(14) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `loan_installment`
--
ALTER TABLE `loan_installment`
  MODIFY `id` int(14) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `logistic_asset`
--
ALTER TABLE `logistic_asset`
  MODIFY `log_id` int(14) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `logistic_assign`
--
ALTER TABLE `logistic_assign`
  MODIFY `ass_id` int(14) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `notice`
--
ALTER TABLE `notice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `pay_salary`
--
ALTER TABLE `pay_salary`
  MODIFY `pay_id` int(14) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `project`
--
ALTER TABLE `project`
  MODIFY `id` int(14) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `project_file`
--
ALTER TABLE `project_file`
  MODIFY `id` int(14) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pro_expenses`
--
ALTER TABLE `pro_expenses`
  MODIFY `id` int(14) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pro_notes`
--
ALTER TABLE `pro_notes`
  MODIFY `id` int(14) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `pro_task`
--
ALTER TABLE `pro_task`
  MODIFY `id` int(14) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `pro_task_assets`
--
ALTER TABLE `pro_task_assets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `salary_type`
--
ALTER TABLE `salary_type`
  MODIFY `id` int(14) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `social_media`
--
ALTER TABLE `social_media`
  MODIFY `id` int(14) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `to-do_list`
--
ALTER TABLE `to-do_list`
  MODIFY `id` int(14) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
