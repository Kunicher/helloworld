CREATE DATABASE IF NOT EXISTS `pharmacy_warehouse`;
USE `pharmacy_warehouse`;

CREATE TABLE IF NOT EXISTS `medications` (
  `CodeMedication` int(11) NOT NULL,
  `NameMedication` text NOT NULL,
  `Manufacturer` text NOT NULL,
  `Price` decimal(10,2) NOT NULL DEFAULT 0.00,
  PRIMARY KEY (`CodeMedication`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `medications` (`CodeMedication`, `NameMedication`, `Manufacturer`, `Price`) VALUES
	(1, 'Name1', 'Man1', 100.00),
	(2, 'Name2', 'Man2', 200.00),
	(3, 'Name3', 'Man3', 300.00),
	(4, 'Name4', 'Man4', 400.00);

CREATE TABLE IF NOT EXISTS `pharmacies` (
  `NumberPharmacy` int(11) NOT NULL,
  `NamePharmacy` text NOT NULL,
  `AddressPharmacy` text NOT NULL,
  `Telephone` text DEFAULT NULL,
  PRIMARY KEY (`NumberPharmacy`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `pharmacies` (`NumberPharmacy`, `NamePharmacy`, `AddressPharmacy`, `Telephone`) VALUES
	(1, 'Name1', 'Ad1', '+1'),
	(2, 'Name2', 'Ad2', '+2'),
	(3, 'Name3', 'Ad3', '+3');

CREATE TABLE IF NOT EXISTS `requests` (
  `NumberRequest` int(11) NOT NULL,
  `DateDrawupRequest` date NOT NULL,
  `NumberPharmacy` int(11) NOT NULL,
  `RequestCompletionDate` date NOT NULL,
  PRIMARY KEY (`NumberRequest`),
  KEY `FK_requests_pharmacies` (`NumberPharmacy`),
  CONSTRAINT `FK_requests_pharmacies` FOREIGN KEY (`NumberPharmacy`) REFERENCES `pharmacies` (`NumberPharmacy`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `requests` (`NumberRequest`, `DateDrawupRequest`, `NumberPharmacy`, `RequestCompletionDate`) VALUES
	(1, '2022-02-14', 1, '2022-02-14'),
	(2, '2022-02-13', 1, '2022-02-15'),
	(3, '2022-02-11', 3, '2022-02-15'),
	(4, '2022-02-10', 2, '2022-02-13');

CREATE TABLE IF NOT EXISTS `purchases` (
  `NumberRequest` int(11) NOT NULL,
  `CodeMedication` int(11) NOT NULL,
  `Count` decimal(10,0) NOT NULL,
  KEY `FK_purchases_requests` (`NumberRequest`),
  KEY `FK_purchases_medications` (`CodeMedication`),
  CONSTRAINT `FK_purchases_medications` FOREIGN KEY (`CodeMedication`) REFERENCES `medications` (`CodeMedication`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_purchases_requests` FOREIGN KEY (`NumberRequest`) REFERENCES `requests` (`NumberRequest`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `purchases` (`NumberRequest`, `CodeMedication`, `Count`) VALUES
	(4, 1, 100),
	(2, 3, 10),
	(3, 4, 33);

