CREATE DATABASE IF NOT EXISTS `audit`;
USE `audit`;


CREATE TABLE IF NOT EXISTS `categories` (
  `category` int(11) NOT NULL,
  `rate_for_1_hour` decimal(10,0) DEFAULT NULL,
  KEY `category` (`category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `categories` (`category`, `rate_for_1_hour`) VALUES
	(1, 5),
	(2, 10),
	(3, 15);

CREATE TABLE IF NOT EXISTS `employees` (
  `code_employees` int(11) NOT NULL,
  `category` int(11) DEFAULT NULL,
  `fullname_employee` text NOT NULL,
  `passport_number` text NOT NULL,
  `date_of_birth` date NOT NULL,
  `work_phone_number` text DEFAULT NULL,
  KEY `code employees` (`code_employees`),
  KEY `FK_employees_categories` (`category`),
  CONSTRAINT `FK_employees_categories` FOREIGN KEY (`category`) REFERENCES `categories` (`category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `employees` (`code_employees`, `category`, `fullname_employee`, `passport_number`, `date_of_birth`, `work_phone_number`) VALUES
	(1, NULL, 'name1', '6546', '2022-01-28', '+32432'),
	(2, 2, 'name2', '3123', '2022-01-27', '+43432'),
	(3, 3, 'name3', '4324', '2022-01-28', '+12321'),
	(4, 2, 'name4', '7654', '2022-01-27', '+54353'),
	(5, 1, 'name4', '3241', '2022-01-25', '+86754');

CREATE TABLE IF NOT EXISTS `works` (
  `company_name` text DEFAULT NULL,
  `code_employee` int(11) DEFAULT NULL,
  `date_of_completed work` date DEFAULT NULL,
  `count_of_hours_worked` int(11) DEFAULT NULL,
  KEY `FK_work_employees` (`code_employee`),
  CONSTRAINT `FK_work_employees` FOREIGN KEY (`code_employee`) REFERENCES `employees` (`code_employees`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO `works` (`company_name`, `code_employee`, `date_of_completed work`, `count_of_hours_worked`) VALUES
	('namec2', 2, '2022-01-30', 4),
	('namec3', 3, '2022-01-29', 6),
	('namec1', 1, '2022-01-31', 2),
	('namec1', 4, '2022-01-31', 3),
	('namec4', 3, '2022-02-09', 5);

