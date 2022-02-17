CREATE DATABASE IF NOT EXISTS `furniture`;
USE `furniture`;

CREATE TABLE IF NOT EXISTS `clients` (
  `CodeClient` int(11) NOT NULL,
  `FullnameClient` text NOT NULL,
  `AddressClient` text NOT NULL,
  `Telephone` text NOT NULL,
  PRIMARY KEY (`CodeClient`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `clients` (`CodeClient`, `FullnameClient`, `AddressClient`, `Telephone`) VALUES
	(1, 'Name1', 'Ad1', '+1'),
	(2, 'Name2', 'Ad2', '+2'),
	(3, 'Name3', 'Ad3', '+3'),
	(4, 'Name4', 'Ad4', '+4');

CREATE TABLE IF NOT EXISTS `models` (
  `CodeFurniture` int(11) NOT NULL,
  `NameFurniture` text NOT NULL,
  `Model` text NOT NULL,
  `Specifications` text DEFAULT NULL,
  `PriceFirniture` decimal(10,2) NOT NULL,
  PRIMARY KEY (`CodeFurniture`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `models` (`CodeFurniture`, `NameFurniture`, `Model`, `Specifications`, `PriceFirniture`) VALUES
	(1, 'Name1', 'Model1', 'Spec1', 1000.00),
	(2, 'Name2', 'Model2', 'Spec2', 2000.00),
	(3, 'Name3', 'Model3', 'Spec3', 3000.00),
	(4, 'Name4', 'Model4', 'Spec4', 4000.00),
	(5, 'Name5', 'Model5', 'Spec5', 5000.00);

CREATE TABLE IF NOT EXISTS `contracts` (
  `NumberContract` int(11) NOT NULL,
  `CodeClient` int(11) NOT NULL,
  `DateDrawingupContract` date NOT NULL,
  `DateExecutionContract` date DEFAULT NULL,
  PRIMARY KEY (`NumberContract`),
  KEY `FK_contracts_clients` (`CodeClient`),
  CONSTRAINT `FK_contracts_clients` FOREIGN KEY (`CodeClient`) REFERENCES `clients` (`CodeClient`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `contracts` (`NumberContract`, `CodeClient`, `DateDrawingupContract`, `DateExecutionContract`) VALUES
	(1, 1, '2022-02-08', '2022-02-15'),
	(2, 2, '2022-01-14', '2022-02-18'),
	(3, 3, '2022-02-10', NULL),
	(4, 4, '2022-02-09', '2022-02-18'),
	(5, 1, '2022-02-11', '2022-02-15');

CREATE TABLE IF NOT EXISTS `sales` (
  `CodeFurniture` int(11) NOT NULL,
  `NumberContract` int(11) NOT NULL,
  `Count` int(11) DEFAULT NULL,
  PRIMARY KEY (`NumberContract`,`CodeFurniture`) USING BTREE,
  KEY `FK_sales_models` (`CodeFurniture`),
  CONSTRAINT `FK_sales_contracts` FOREIGN KEY (`NumberContract`) REFERENCES `contracts` (`NumberContract`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_sales_models` FOREIGN KEY (`CodeFurniture`) REFERENCES `models` (`CodeFurniture`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `sales` (`CodeFurniture`, `NumberContract`, `Count`) VALUES
	(1, 1, 1),
	(3, 2, 3),
	(2, 3, 2),
	(2, 4, 1);
