CREATE DATABASE IF NOT EXISTS `traffic_police`;
USE `traffic_police`;

CREATE TABLE IF NOT EXISTS `cars` (
  `CarNumber` int(11) NOT NULL,
  `Mark` text NOT NULL,
  `Model` text NOT NULL,
  `Color` text NOT NULL,
  `ReleaseYear` year(4) NOT NULL,
  `RegistrationDate` date NOT NULL,
  PRIMARY KEY (`CarNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `drivers` (
  `DriversLicenseNumber` int(11) NOT NULL,
  `FullName` text NOT NULL,
  `Address` text NOT NULL,
  `Telephone` text NOT NULL,
  PRIMARY KEY (`DriversLicenseNumber`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `drivercars` (
  `DriversLicenseNumber` int(11) NOT NULL,
  `CarNumber` int(11) NOT NULL,
  PRIMARY KEY (`DriversLicenseNumber`,`CarNumber`) USING BTREE,
  KEY `FK_drivercars_cars` (`CarNumber`),
  CONSTRAINT `FK_drivercars_cars` FOREIGN KEY (`CarNumber`) REFERENCES `cars` (`CarNumber`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_drivercars_drivers` FOREIGN KEY (`DriversLicenseNumber`) REFERENCES `drivers` (`DriversLicenseNumber`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `violations` (
  `CodeViolation` int(11) NOT NULL,
  `TypeViolation` text NOT NULL,
  `Fine` decimal(10,1) NOT NULL,
  `Warn` text NOT NULL,
  `TermOfDeprivation` text NOT NULL,
  PRIMARY KEY (`CodeViolation`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `descriptions` (
  `CodeViolation` int(11) NOT NULL,
  `DateViolation` datetime DEFAULT NULL,
  `DriversLicenseNumber` int(11) NOT NULL,
  `District` text DEFAULT NULL,
  `PaymentFine` text NOT NULL,
  `TermOfDeprivation` text DEFAULT NULL,
  `BasicValue` decimal(10,1) NOT NULL,
  `PersonalNumberTrafficPoliceInspector` int(11) NOT NULL,
  KEY `FK_descriptions_drivers` (`DriversLicenseNumber`),
  KEY `FK_descriptions_violations` (`CodeViolation`),
  CONSTRAINT `FK_descriptions_drivers` FOREIGN KEY (`DriversLicenseNumber`) REFERENCES `drivers` (`DriversLicenseNumber`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_descriptions_violations` FOREIGN KEY (`CodeViolation`) REFERENCES `violations` (`CodeViolation`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
