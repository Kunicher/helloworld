CREATE DATABASE IF NOT EXISTS `cash_machines`;
USE `cash_machines`;

CREATE TABLE IF NOT EXISTS `banks` (
  `CodeBank` int(11) NOT NULL,
  `NameBank` text NOT NULL,
  `JuridicalAddress` text NOT NULL,
  PRIMARY KEY (`CodeBank`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `banks` (`CodeBank`, `NameBank`, `JuridicalAddress`) VALUES
	(1, 'Name1', 'Ad1'),
	(2, 'Name2', 'Ad2'),
	(3, 'Name3', 'Ad3'),
	(4, 'Name4', 'Ad4');

CREATE TABLE IF NOT EXISTS `cash_machines` (
  `Number` int(11) NOT NULL,
  `Addres` text NOT NULL,
  `CodeBank` int(11) NOT NULL,
  PRIMARY KEY (`Number`),
  KEY `FK_cash_machines_banks` (`CodeBank`),
  CONSTRAINT `FK_cash_machines_banks` FOREIGN KEY (`CodeBank`) REFERENCES `banks` (`CodeBank`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `cash_machines` (`Number`, `Addres`, `CodeBank`) VALUES
	(1, 'Ad1', 1),
	(2, 'Ad2', 1),
	(3, 'Ad3', 2),
	(4, 'Ad4', 3),
	(5, 'Ad5', 3),
	(6, 'Ad6', 4),
	(7, 'Ad7', 4);

CREATE TABLE IF NOT EXISTS `customers` (
  `NumberCard` int(11) NOT NULL,
  `FullnameCustomer` text NOT NULL,
  `AddressCustomer` text NOT NULL,
  `CodeBank` int(11) NOT NULL,
  PRIMARY KEY (`NumberCard`),
  KEY `FK_customers_banks` (`CodeBank`),
  CONSTRAINT `FK_customers_banks` FOREIGN KEY (`CodeBank`) REFERENCES `banks` (`CodeBank`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `customers` (`NumberCard`, `FullnameCustomer`, `AddressCustomer`, `CodeBank`) VALUES
	(1, 'Name1', 'Ad1', 1),
	(2, 'Name2', 'Ad2', 2),
	(3, 'Name3', 'Ad3', 3),
	(4, 'Name4', 'Ad4', 4),
	(5, 'Name5', 'Ad5', 1),
	(6, 'Name6', 'Ad6', 2),
	(7, 'Name7', 'Ad7', 3);

CREATE TABLE IF NOT EXISTS `operations` (
  `NumberCardCustomer` int(11) NOT NULL,
  `NumberCashMachines` int(11) NOT NULL,
  `DateTime` datetime NOT NULL,
  `Commission` text NOT NULL,
  `IssueAmount` decimal(10,0) NOT NULL,
  PRIMARY KEY (`NumberCardCustomer`,`DateTime`,`NumberCashMachines`) USING BTREE,
  KEY `FK_operations_cash_machines` (`NumberCashMachines`),
  CONSTRAINT `FK_operations_cash_machines` FOREIGN KEY (`NumberCashMachines`) REFERENCES `cash_machines` (`Number`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_operations_customers` FOREIGN KEY (`NumberCardCustomer`) REFERENCES `customers` (`NumberCard`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `operations` (`NumberCardCustomer`, `NumberCashMachines`, `DateTime`, `Commission`, `IssueAmount`) VALUES
	(1, 2, '2022-02-13 10:45:09', 'Yes', 10000),
	(1, 2, '2022-02-13 10:45:10', 'Yes', 15000),
	(3, 3, '2022-02-11 10:45:11', 'No', 5000),
	(3, 3, '2022-02-13 10:45:12', 'Yes', 5000),
	(5, 1, '2022-02-12 10:45:11', 'No', 1000);
