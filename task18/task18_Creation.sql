CREATE DATABASE IF NOT EXISTS `furniture`;
USE `furniture`;

CREATE TABLE IF NOT EXISTS `clients` (
  `CodeClient` int(11) NOT NULL,
  `FullnameClient` text NOT NULL,
  `AddressClient` text NOT NULL,
  `Telephone` text NOT NULL,
  PRIMARY KEY (`CodeClient`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `models` (
  `CodeFurniture` int(11) NOT NULL,
  `NameFurniture` text NOT NULL,
  `Model` text NOT NULL,
  `Specifications` text DEFAULT NULL,
  `PriceFirniture` decimal(10,2) NOT NULL,
  PRIMARY KEY (`CodeFurniture`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `contracts` (
  `NumberContract` int(11) NOT NULL,
  `CodeClient` int(11) NOT NULL,
  `DateDrawingupContract` date NOT NULL,
  `DateExecutionContract` date DEFAULT NULL,
  PRIMARY KEY (`NumberContract`),
  KEY `FK_contracts_clients` (`CodeClient`),
  CONSTRAINT `FK_contracts_clients` FOREIGN KEY (`CodeClient`) REFERENCES `clients` (`CodeClient`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



CREATE TABLE IF NOT EXISTS `sales` (
  `CodeFurniture` int(11) NOT NULL,
  `NumberContract` int(11) NOT NULL,
  `Count` int(11) DEFAULT NULL,
  PRIMARY KEY (`NumberContract`,`CodeFurniture`) USING BTREE,
  KEY `FK_sales_models` (`CodeFurniture`),
  CONSTRAINT `FK_sales_contracts` FOREIGN KEY (`NumberContract`) REFERENCES `contracts` (`NumberContract`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_sales_models` FOREIGN KEY (`CodeFurniture`) REFERENCES `models` (`CodeFurniture`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
