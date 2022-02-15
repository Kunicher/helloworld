CREATE DATABASE IF NOT EXISTS `pharmacy_warehouse`;
USE `pharmacy_warehouse`;

CREATE TABLE IF NOT EXISTS `medications` (
  `CodeMedication` int(11) NOT NULL,
  `NameMedication` text NOT NULL,
  `Manufacturer` text NOT NULL,
  `Price` decimal(10,2) NOT NULL DEFAULT 0.00,
  PRIMARY KEY (`CodeMedication`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `pharmacies` (
  `NumberPharmacy` int(11) NOT NULL,
  `NamePharmacy` text NOT NULL,
  `AddressPharmacy` text NOT NULL,
  `Telephone` text DEFAULT NULL,
  PRIMARY KEY (`NumberPharmacy`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `requests` (
  `NumberRequest` int(11) NOT NULL,
  `DateDrawupRequest` date NOT NULL,
  `NumberPharmacy` int(11) NOT NULL,
  `RequestCompletionDate` date NOT NULL,
  PRIMARY KEY (`NumberRequest`),
  KEY `FK_requests_pharmacies` (`NumberPharmacy`),
  CONSTRAINT `FK_requests_pharmacies` FOREIGN KEY (`NumberPharmacy`) REFERENCES `pharmacies` (`NumberPharmacy`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `purchases` (
  `NumberRequest` int(11) NOT NULL,
  `CodeMedication` int(11) NOT NULL,
  `Count` decimal(10,0) NOT NULL,
  KEY `FK_purchases_requests` (`NumberRequest`),
  KEY `FK_purchases_medications` (`CodeMedication`),
  CONSTRAINT `FK_purchases_medications` FOREIGN KEY (`CodeMedication`) REFERENCES `medications` (`CodeMedication`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_purchases_requests` FOREIGN KEY (`NumberRequest`) REFERENCES `requests` (`NumberRequest`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
