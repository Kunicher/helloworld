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

INSERT INTO `cars` (`CarNumber`, `Mark`, `Model`, `Color`, `ReleaseYear`, `RegistrationDate`) VALUES
	(1, 'mark1', 'model1', 'color1', '2021', '2022-02-10'),
	(2, 'mark2', 'model2', 'color2', '2020', '2021-02-10'),
	(3, 'mark3', 'model3', 'color3', '2019', '2020-02-10'),
	(4, 'mark3', 'model4', 'color4', '2018', '2019-02-10'),
	(5, 'mark4', 'model5', 'color5', '2017', '2018-02-10');

CREATE TABLE IF NOT EXISTS `drivers` (
  `DriversLicenseNumber` int(11) NOT NULL,
  `FullName` text NOT NULL,
  `Address` text NOT NULL,
  `Telephone` text NOT NULL,
  PRIMARY KEY (`DriversLicenseNumber`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `drivers` (`DriversLicenseNumber`, `FullName`, `Address`, `Telephone`) VALUES
	(1, 'Name1', 'Ad1', '+1'),
	(2, 'Name2', 'Ad2', '+2'),
	(3, 'Name3', 'Ad3', '+3'),
	(4, 'Name4', 'Ad4', '+4');

CREATE TABLE IF NOT EXISTS `violations` (
  `CodeViolation` int(11) NOT NULL,
  `TypeViolation` text NOT NULL,
  `Fine` decimal(10,1) NOT NULL,
  `Warn` text NOT NULL,
  `TermOfDeprivation` text NOT NULL,
  PRIMARY KEY (`CodeViolation`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `violations` (`CodeViolation`, `TypeViolation`, `Fine`, `Warn`, `TermOfDeprivation`) VALUES
	(1, 'type1', 5.0, 'Yes', '1-10 Month'),
	(2, 'type2', 2.0, 'Yes', '2-20 Month'),
	(3, 'type3', 6.0, 'Yes', '3-30 Month'),
	(4, 'type4', 3.0, 'Yes', '4-40 Month');

CREATE TABLE IF NOT EXISTS `drivercars` (
  `DriversLicenseNumber` int(11) NOT NULL,
  `CarNumber` int(11) NOT NULL,
  PRIMARY KEY (`DriversLicenseNumber`,`CarNumber`) USING BTREE,
  KEY `FK_drivercars_cars` (`CarNumber`),
  CONSTRAINT `FK_drivercars_cars` FOREIGN KEY (`CarNumber`) REFERENCES `cars` (`CarNumber`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_drivercars_drivers` FOREIGN KEY (`DriversLicenseNumber`) REFERENCES `drivers` (`DriversLicenseNumber`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `drivercars` (`DriversLicenseNumber`, `CarNumber`) VALUES
	(1, 1),
	(1, 2),
	(2, 3),
	(3, 4);

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

INSERT INTO `descriptions` (`CodeViolation`, `DateViolation`, `DriversLicenseNumber`, `District`, `PaymentFine`, `TermOfDeprivation`, `BasicValue`, `PersonalNumberTrafficPoliceInspector`) VALUES
	(1, '2022-02-10 12:41:38', 2, 'd1', 'No', '1 Month', 3.0, 1),
	(2, '2021-02-10 12:43:20', 2, 'd3', 'Yes', '2 Month', 2.0, 2),
	(1, '2020-02-10 12:44:44', 1, 'd2', 'Yes', NULL, 1.0, 3);




