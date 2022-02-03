
CREATE DATABASE IF NOT EXISTS `audit`;
USE `audit`;


CREATE TABLE IF NOT EXISTS `categories` (
  `category` int(11) NOT NULL,
  `rate_for_1_hour` decimal(10,0) DEFAULT NULL,
  KEY `category` (`category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `employees` (
  `code_employees` int(11) NOT NULL,
  `category` int(11) DEFAULT NULL,
  `fullname_employee` text DEFAULT NULL,
  `passport_number` text DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `work_phone_number` text DEFAULT NULL,
  KEY `code employees` (`code_employees`),
  KEY `FK_employees_categories` (`category`),
  CONSTRAINT `FK_employees_categories` FOREIGN KEY (`category`) REFERENCES `categories` (`category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `works` (
  `company_name` text DEFAULT NULL,
  `code_employee` int(11) DEFAULT NULL,
  `date_of_completed work` date DEFAULT NULL,
  `count_of_hours_worked` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  KEY `FK_work_employees` (`code_employee`),
  KEY `FK_work_categories` (`category`),
  CONSTRAINT `FK_work_categories` FOREIGN KEY (`category`) REFERENCES `categories` (`category`),
  CONSTRAINT `FK_work_employees` FOREIGN KEY (`code_employee`) REFERENCES `employees` (`code_employees`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
