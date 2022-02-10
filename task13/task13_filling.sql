CREATE DATABASE IF NOT EXISTS `zhes`;
USE `zhes`;

CREATE TABLE IF NOT EXISTS `flats` (
  `Address` text NOT NULL,
  `ТumberOfResidents` int(11) NOT NULL,
  `AreaFlat` text NOT NULL,
  `CodeFlat` int(11) NOT NULL,
  PRIMARY KEY (`CodeFlat`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `flats` (`Address`, `ТumberOfResidents`, `AreaFlat`, `CodeFlat`) VALUES
	('ad4', 3, '30', 0),
	('ad1', 1, '10', 1),
	('ad2', 2, '20', 2),
	('ad3', 1, '25', 3);

CREATE TABLE IF NOT EXISTS `services` (
  `CodeService` int(11) NOT NULL,
  `TypeService` text NOT NULL,
  `UnitOfMeasurement` text NOT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`CodeService`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `services` (`CodeService`, `TypeService`, `UnitOfMeasurement`, `Price`) VALUES
	(1, 'Type1', 'U1', 200.00),
	(2, 'Type2', 'U2', 300.00),
	(3, 'Type3', 'U3', 400.00);

CREATE TABLE IF NOT EXISTS `tenants` (
  `CodeTenant` int(11) NOT NULL,
  `Fullname` text DEFAULT NULL,
  `Telephone` text DEFAULT NULL,
  PRIMARY KEY (`CodeTenant`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `tenants` (`CodeTenant`, `Fullname`, `Telephone`) VALUES
	(1, 'Name1', '+1'),
	(2, 'Name2', '+2'),
	(3, 'Name3', '+3'),
	(4, 'Name4', '+4');

CREATE TABLE IF NOT EXISTS `payments` (
  `CodeTenat` int(11) NOT NULL,
  `CodeService` int(11) DEFAULT NULL,
  `CodeFlat` int(11) NOT NULL,
  `ActualConsumption` text NOT NULL,
  `PayBefore` date NOT NULL,
  `PaymentOnTime` text NOT NULL,
  `PaymentDate` date DEFAULT NULL,
  PRIMARY KEY (`CodeTenat`,`CodeFlat`),
  UNIQUE KEY `CodeTenat` (`CodeTenat`),
  UNIQUE KEY `CodeFlat` (`CodeFlat`),
  KEY `FK_payments_services` (`CodeService`),
  CONSTRAINT `FK_payments_flats` FOREIGN KEY (`CodeFlat`) REFERENCES `flats` (`CodeFlat`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_payments_services` FOREIGN KEY (`CodeService`) REFERENCES `services` (`CodeService`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_payments_tenants` FOREIGN KEY (`CodeTenat`) REFERENCES `tenants` (`CodeTenant`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO `payments` (`CodeTenat`, `CodeService`, `CodeFlat`, `ActualConsumption`, `PayBefore`, `PaymentOnTime`, `PaymentDate`) VALUES
	(1, 1, 1, '100AC', '2022-02-15', 'Yes', NULL),
	(2, 2, 2, '140AC', '2022-01-15', 'No', '2022-01-16'),
	(3, NULL, 3, '50AC', '2022-02-15', 'Yes', NULL);


