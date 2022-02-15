CREATE DATABASE IF NOT EXISTS `cash_machines`;
USE `cash_machines`;

CREATE TABLE IF NOT EXISTS `banks` (
  `CodeBank` int(11) NOT NULL,
  `NameBank` text NOT NULL,
  `JuridicalAddress` text NOT NULL,
  PRIMARY KEY (`CodeBank`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `cash_machines` (
  `Number` int(11) NOT NULL,
  `Addres` text NOT NULL,
  `CodeBank` int(11) NOT NULL,
  PRIMARY KEY (`Number`),
  KEY `FK_cash_machines_banks` (`CodeBank`),
  CONSTRAINT `FK_cash_machines_banks` FOREIGN KEY (`CodeBank`) REFERENCES `banks` (`CodeBank`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `customers` (
  `NumberCard` int(11) NOT NULL,
  `FullnameCustomer` text NOT NULL,
  `AddressCustomer` text NOT NULL,
  `CodeBank` int(11) NOT NULL,
  PRIMARY KEY (`NumberCard`),
  KEY `FK_customers_banks` (`CodeBank`),
  CONSTRAINT `FK_customers_banks` FOREIGN KEY (`CodeBank`) REFERENCES `banks` (`CodeBank`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `operations` (
  `NumberCardCustomer` int(11) NOT NULL,
  `NumberCashMachines` int(11) NOT NULL,
  `Date` date NOT NULL,
  `Time` time NOT NULL,
  `Commission` text NOT NULL,
  `IssueAmount` decimal(10,0) NOT NULL,
  PRIMARY KEY (`NumberCardCustomer`,`Date`,`Time`) USING BTREE,
  KEY `FK_operations_cash_machines` (`NumberCashMachines`),
  CONSTRAINT `FK_operations_cash_machines` FOREIGN KEY (`NumberCashMachines`) REFERENCES `cash_machines` (`Number`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_operations_customers` FOREIGN KEY (`NumberCardCustomer`) REFERENCES `customers` (`NumberCard`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

