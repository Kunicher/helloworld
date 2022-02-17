CREATE DATABASE IF NOT EXISTS `repair_household`;
USE `repair_household`;

CREATE TABLE IF NOT EXISTS `employees` (
  `CodeEmployee` int(11) NOT NULL,
  `FullnameEmployee` text NOT NULL,
  `Post` text NOT NULL,
  PRIMARY KEY (`CodeEmployee`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `employees` (`CodeEmployee`, `FullnameEmployee`, `Post`) VALUES
	(1, 'Name1', 'Post1'),
	(2, 'Name2', 'Post2'),
	(3, 'Name3', 'Post3'),
	(4, 'Name4', 'Post4'),
	(5, 'Name5', 'Post5');
  
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

INSERT INTO `products` (`CodeProduct`, `NameProduct`, `Firm`, `Model`, `TechnicalDescription`, `WarrantyPeriod`, `Picture`) VALUES
	(1, 'Name1', 'Firm1', 'Model1', 'TD', '1 M', _binary 0x50696374757265),
	(2, 'Name2', 'Firm2', 'Model2', 'TD', '3 M', NULL),
	(3, 'Name3', 'Firm3', 'Model3', 'TD', '', NULL),
	(4, 'Name4', 'Firm4', 'Model4', 'TD', '1 Y', _binary 0x50696374757265);

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

INSERT INTO `orders` (`CodeOrder`, `FullnameClient`, `CodeProduct`, `Guarantee`, `DateReceipt`) VALUES
	(1, 'Name1', 1, 'Yes', '2022-02-15'),
	(2, 'Name2', 2, 'No', '2022-02-14'),
	(3, 'Name3', 3, 'No', '2022-02-13'),
	(4, 'Name4', 3, 'Yes', '2022-02-12');

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

INSERT INTO `execution_orders` (`CodeOrder`, `TypeRepair`, `PriceRepair`, `DateExecutionOrder`, `MessageToClient`, `DateOfReceipt`, `PaymentAmount`, `CodeEmployee`) VALUES
	(1, 'Type1', 100.00, '2022-02-15', 'Yes', '2022-02-15', 150.00, 1),
	(2, 'Type2', 1500.00, NULL, 'No', NULL, NULL, 2),
	(3, 'Type3', 450.00, '2022-02-14', 'Yes', '2022-02-15', 500.00, 1),
	(4, 'Type4', 2000.00, '2022-02-13', 'Yes', NULL, NULL, 3);