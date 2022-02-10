CREATE DATABASE IF NOT EXISTS `zhes`;
USE `zhes`;

CREATE TABLE IF NOT EXISTS `flats` (
  `Address` text NOT NULL,
  `ТumberOfResidents` int(11) NOT NULL,
  `AreaFlat` text NOT NULL,
  `CodeFlat` int(11) NOT NULL,
  PRIMARY KEY (`CodeFlat`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `services` (
  `CodeService` int(11) NOT NULL,
  `TypeService` text NOT NULL,
  `UnitOfMeasurement` text NOT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`CodeService`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `tenants` (
  `CodeTenant` int(11) NOT NULL,
  `Fullname` text DEFAULT NULL,
  `Telephone` text DEFAULT NULL,
  PRIMARY KEY (`CodeTenant`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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

