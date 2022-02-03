CREATE DATABASE IF NOT EXISTS `bank_deposits`;
USE `bank_deposits`;

CREATE TABLE IF NOT EXISTS `bank account` (
  `№ _account` int(11) NOT NULL,
  `code_client` int(11) NOT NULL,
  `code_deposit` int(11) NOT NULL,
  `account_opening_date` date DEFAULT NULL,
  `account_closing_date` date DEFAULT NULL,
  `amount_deposit` decimal(10,0) DEFAULT NULL,
  KEY `FK_bank account_client` (`code_client`),
  KEY `FK_bank account_deposit` (`code_deposit`),
  KEY `№ _account` (`№ _account`),
  CONSTRAINT `FK_bank account_client` FOREIGN KEY (`code_client`) REFERENCES `client` (`code_client`),
  CONSTRAINT `FK_bank account_deposit` FOREIGN KEY (`code_deposit`) REFERENCES `deposit` (`code_deposit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `client` (
  `code_client` int(11) NOT NULL,
  `№_account` int(11) NOT NULL,
  `fullname_client` text DEFAULT NULL,
  `passport_number` text DEFAULT NULL,
  `address` text DEFAULT NULL,
  `telephone` text DEFAULT NULL,
  KEY `code_client` (`code_client`),
  KEY `FK_client_bank account` (`№_account`),
  CONSTRAINT `FK_client_bank account` FOREIGN KEY (`№_account`) REFERENCES `bank account` (`№ _account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `deposit` (
  `code_deposit` int(11) NOT NULL,
  `name_deposit` text DEFAULT NULL,
  `storage_life` int(11) DEFAULT NULL,
  `rate,_per_annum` text DEFAULT NULL,
  KEY `code deposit` (`code_deposit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
