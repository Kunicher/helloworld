CREATE DATABASE IF NOT EXISTS `commercial_company`;
USE `commercial_company`;

CREATE TABLE IF NOT EXISTS `models` (
  `CodeModel` int(11) NOT NULL AUTO_INCREMENT,
  `NameModel` text NOT NULL,
  `Color` text NOT NULL,
  `Plating` text NOT NULL,
  `EnginePower` text NOT NULL,
  `CountDoors` decimal(10,0) NOT NULL,
  `Transmission` text NOT NULL,
  PRIMARY KEY (`CodeModel`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `clients` (
  `FullnameClient` text NOT NULL,
  `NumberContract` int(11) NOT NULL,
  `DatePurchase` date DEFAULT NULL,
  `Telephone` text NOT NULL,
  `Address` text NOT NULL,
  `CodeModel` int(11) DEFAULT NULL,
  PRIMARY KEY (`NumberContract`),
  KEY `FK__models` (`CodeModel`),
  CONSTRAINT `FK__models` FOREIGN KEY (`CodeModel`) REFERENCES `models` (`CodeModel`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `providers` (
  `CodeFirm` int(11) NOT NULL AUTO_INCREMENT,
  `NameFirm` text NOT NULL,
  `Telephone` text NOT NULL,
  `EMail` text NOT NULL,
  `WebSite` text DEFAULT NULL,
  PRIMARY KEY (`CodeFirm`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `price_list` (
  `CodeModel` int(11) NOT NULL,
  `YearRelease` year(4) NOT NULL,
  `Price` decimal(10,2) NOT NULL,
  `Pre-salePreparation` decimal(10,2) NOT NULL,
  `TransportationCosts` decimal(10,2) NOT NULL,
  `CodeFirm` int(11) NOT NULL,
  PRIMARY KEY (`CodeModel`),
  KEY `FK_price_list_providers` (`CodeFirm`),
  CONSTRAINT `FK_price_list_models` FOREIGN KEY (`CodeModel`) REFERENCES `models` (`CodeModel`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_price_list_providers` FOREIGN KEY (`CodeFirm`) REFERENCES `providers` (`CodeFirm`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;