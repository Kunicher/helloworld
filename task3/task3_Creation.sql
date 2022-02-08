CREATE DATABASE IF NOT EXISTS `bank_deposits` ;
USE `bank_deposits`;

CREATE TABLE IF NOT EXISTS `client` (
  `code_client` int(11) NOT NULL,
  `fullname_client` text NOT NULL,
  `passport_number` text NOT NULL,
  `address` text NOT NULL,
  `telephone` text NOT NULL,
  PRIMARY KEY (`code_client`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE IF NOT EXISTS `deposit` (
  `code_deposit` int(11) NOT NULL,
  `name_deposit` text DEFAULT NULL,
  `storage_life` int(11) DEFAULT NULL,
  `rate,_per_annum` text DEFAULT NULL,
  PRIMARY KEY (`code_deposit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `bank account` (
  `№ _account` int(11) NOT NULL,
  `code_client` int(11) NOT NULL,
  `code_deposit` int(11) NOT NULL,
  `account_opening_date` date DEFAULT NULL,
  `account_closing_date` date DEFAULT NULL,
  `amount_deposit` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`№ _account`),
  KEY `FK_bank account_client` (`code_client`),
  KEY `FK_bank account_deposit` (`code_deposit`),
  CONSTRAINT `FK_bank account_client` FOREIGN KEY (`code_client`) REFERENCES `client` (`code_client`),
  CONSTRAINT `FK_bank account_deposit` FOREIGN KEY (`code_deposit`) REFERENCES `deposit` (`code_deposit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;