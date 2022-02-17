CREATE DATABASE IF NOT EXISTS `commercial_company`;
USE `commercial_company`;

CREATE TABLE IF NOT EXISTS `providers` (
  `CodeFirm` int(11) NOT NULL AUTO_INCREMENT,
  `NameFirm` text NOT NULL,
  `Telephone` text NOT NULL,
  `EMail` text NOT NULL,
  `WebSite` text DEFAULT NULL,
  PRIMARY KEY (`CodeFirm`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

INSERT INTO `providers` (`CodeFirm`, `NameFirm`, `Telephone`, `EMail`, `WebSite`) VALUES
	(1, 'Name1', '+1', 'Mail1', 'Site1'),
	(2, 'Name2', '+3', 'Mail3', 'Site2'),
	(3, 'Name3', '+2', 'Mail2', 'Site3');

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

INSERT INTO `models` (`CodeModel`, `NameModel`, `Color`, `Plating`, `EnginePower`, `CountDoors`, `Transmission`) VALUES
	(1, 'Name1', 'Color1', 'Plat1', 'Pow1', 2, 'Tran1'),
	(2, 'Name2', 'Color3', 'Plat2', 'Pow2', 4, 'Tran2'),
	(3, 'Name3', 'Color3', 'Plat3', 'Pow3', 4, 'Tran2'),
	(4, 'Name4', 'Color4', 'Plat4', 'Pow4', 2, 'Tran1');

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

INSERT INTO `clients` (`FullnameClient`, `NumberContract`, `DatePurchase`, `Telephone`, `Address`, `CodeModel`) VALUES
	('Name1', 1, '2022-02-17', '+1', 'Ad1', 1),
	('Name2', 2, NULL, '+2', 'Ad2', NULL),
	('Name3', 3, '2022-02-16', '+3', 'Ad3', 3);

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

INSERT INTO `price_list` (`CodeModel`, `YearRelease`, `Price`, `Pre-salePreparation`, `TransportationCosts`, `CodeFirm`) VALUES
	(1, '2022', 1000.00, 100.00, 50.00, 1),
	(2, '2022', 2000.00, 200.00, 100.00, 2),
	(3, '2020', 1500.00, 300.00, 50.00, 3);

