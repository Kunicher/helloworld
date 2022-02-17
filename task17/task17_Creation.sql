CREATE DATABASE IF NOT EXISTS `repair_household`;
USE `repair_household`;

CREATE TABLE IF NOT EXISTS `employees` (
  `CodeEmployee` int(11) NOT NULL,
  `FullnameEmployee` text NOT NULL,
  `Post` text NOT NULL,
  PRIMARY KEY (`CodeEmployee`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `products` (
  `CodeProduct` int(11) NOT NULL,
  `NameProduct` text NOT NULL,
  `Firm` text NOT NULL,
  `Model` text NOT NULL,
  `TechnicalDescription` text NOT NULL,
  `WarrantyPeriod` text DEFAULT NULL,
  `Picture` blob DEFAULT NULL,
  PRIMARY KEY (`CodeProduct`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `orders` (
  `CodeOrder` int(11) NOT NULL,
  `FullnameClient` text NOT NULL,
  `CodeProduct` int(11) NOT NULL,
  `Guarantee` text NOT NULL,
  `DateReceipt` date NOT NULL,
  PRIMARY KEY (`CodeOrder`),
  KEY `FK_orders_products` (`CodeProduct`),
  CONSTRAINT `FK_orders_products` FOREIGN KEY (`CodeProduct`) REFERENCES `products` (`CodeProduct`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `execution_orders` (
  `CodeOrder` int(11) NOT NULL,
  `TypeRepair` text NOT NULL,
  `PriceRepair` decimal(10,2) DEFAULT 0.00,
  `DateExecutionOrder` date DEFAULT NULL,
  `MessageToClient` text NOT NULL,
  `DateOfReceipt` date DEFAULT NULL,
  `PaymentAmount` decimal(10,2) DEFAULT 0.00,
  `CodeEmployee` int(11) NOT NULL,
  PRIMARY KEY (`CodeOrder`),
  KEY `FK_execution_orders_employees` (`CodeEmployee`),
  CONSTRAINT `FK_execution_orders_employees` FOREIGN KEY (`CodeEmployee`) REFERENCES `employees` (`CodeEmployee`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_execution_orders_orders` FOREIGN KEY (`CodeOrder`) REFERENCES `orders` (`CodeOrder`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
