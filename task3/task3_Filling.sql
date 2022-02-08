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

INSERT INTO `client` (`code_client`, `fullname_client`, `passport_number`, `address`, `telephone`) VALUES
	(1, 'name1', '333 222', 'ad1', '+4324'),
	(2, 'name2', '3213 21312', 'ad2', '+4335'),
	(3, 'name3', '1231 12312', 'ad3', '+34214');

CREATE TABLE IF NOT EXISTS `deposit` (
  `code_deposit` int(11) NOT NULL,
  `name_deposit` text DEFAULT NULL,
  `storage_life` int(11) DEFAULT NULL,
  `rate,_per_annum` text DEFAULT NULL,
  PRIMARY KEY (`code_deposit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `deposit` (`code_deposit`, `name_deposit`, `storage_life`, `rate,_per_annum`) VALUES
	(1, 'Накопительный (в российских рублях)', 13, '10%'),
	(2, 'Капитал (в долларах США)', 18, '7%'),
	(3, 'Победа (в белорусских рублях)', 13, 'Ставка рефинансирования +2%'),
	(4, 'К отпуску (в белорусских рублях)', 12, 'Ставка рефинансирования -1%'),
	(5, 'Накопительный (в белорусских рублях)', 36, '18%');

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

INSERT INTO `bank account` (`№ _account`, `code_client`, `code_deposit`, `account_opening_date`, `account_closing_date`, `amount_deposit`) VALUES
	(1, 1, 1, '2022-01-28', '2022-02-01', 10000),
	(2, 2, 1, '2022-01-28', '2022-02-01', 2500),
	(3, 3, 3, '2022-01-28', '2022-01-29', 42342),
	(4, 3, 5, '2022-01-27', '2022-02-01', 100000);