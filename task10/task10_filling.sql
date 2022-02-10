CREATE DATABASE IF NOT EXISTS `polyclinic`;
USE `polyclinic`;

CREATE TABLE IF NOT EXISTS `specialties` (
  `CodeSpecialty` int(11) NOT NULL,
  `Specialty` text NOT NULL,
  PRIMARY KEY (`CodeSpecialty`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `specialties` (`CodeSpecialty`, `Specialty`) VALUES
	(1, 'sp1'),
	(2, 'sp2'),
	(3, 'sp3'),
	(4, 'sp4');

CREATE TABLE IF NOT EXISTS `tickets` (
  `NumberTicket` int(11) NOT NULL,
  `Time` text NOT NULL,
  `CodeSpecialty` int(11) NOT NULL,
  PRIMARY KEY (`NumberTicket`),
  KEY `FK_tickets_specialties` (`CodeSpecialty`),
  CONSTRAINT `FK_tickets_specialties` FOREIGN KEY (`CodeSpecialty`) REFERENCES `specialties` (`CodeSpecialty`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `tickets` (`NumberTicket`, `Time`, `CodeSpecialty`) VALUES
	(1, '9:00-10:00', 1),
	(2, '10:00-11:00', 1),
	(3, '9:00-9:30', 2),
	(4, '9:30-10:00', 2),
	(5, '9:00-9:20', 3),
	(6, '9:20-9:40', 3);

CREATE TABLE IF NOT EXISTS `diagnosis` (
  `CodeDiagnosis` int(11) NOT NULL,
  `NameDiagnosis` text NOT NULL,
  PRIMARY KEY (`CodeDiagnosis`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `diagnosis` (`CodeDiagnosis`, `NameDiagnosis`) VALUES
	(1, 'name1'),
	(2, 'name2'),
	(3, 'name3'),
	(4, 'name4');

CREATE TABLE IF NOT EXISTS `doctors` (
  `CodeDoctor` int(11) NOT NULL,
  `FullName` text NOT NULL,
  `CodeSpecialty` int(11) NOT NULL,
  `Category` int(11) NOT NULL,
  PRIMARY KEY (`CodeDoctor`) USING BTREE,
  KEY `FK_doctors_specialties` (`CodeSpecialty`),
  CONSTRAINT `FK_doctors_specialties` FOREIGN KEY (`CodeSpecialty`) REFERENCES `specialties` (`CodeSpecialty`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `doctors` (`CodeDoctor`, `FullName`, `CodeSpecialty`, `Category`) VALUES
	(1, 'Name1', 1, 1),
	(2, 'Name2', 2, 2),
	(3, 'Name3', 3, 3),
	(4, 'Name4', 4, 4);

CREATE TABLE IF NOT EXISTS `patients` (
  `IdMedicalCard` int(11) NOT NULL,
  `FullName` text NOT NULL,
  `DateBirth` date NOT NULL,
  `Address` text NOT NULL,
  `Gender` text NOT NULL,
  `DiscountOnService` text DEFAULT NULL,
  PRIMARY KEY (`IdMedicalCard`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `patients` (`IdMedicalCard`, `FullName`, `DateBirth`, `Address`, `Gender`, `DiscountOnService`) VALUES
	(1, 'Name1', '2022-01-08', 'ad1', 'male', '5%'),
	(2, 'Name2', '2021-12-08', 'ad2', 'female', '6%'),
	(3, 'Name3', '2021-11-08', 'ad3', 'male', '7%'),
	(4, 'Name4', '2021-10-08', 'ad4', 'female', '8%');

CREATE TABLE IF NOT EXISTS `reception` (
  `NumberTicket` int(11) NOT NULL,
  `DateVisit` date NOT NULL,
  `PourposeVisit` text DEFAULT NULL,
  `PriceVisit` decimal(10,2) DEFAULT NULL,
  `CodeDoctor` int(11) NOT NULL,
  `IdMedicalCard` int(11) NOT NULL,
  `CodeDiagnosis` int(11) DEFAULT NULL,
  PRIMARY KEY (`NumberTicket`,`DateVisit`),
  KEY `FK_reception_doctors` (`CodeDoctor`),
  KEY `FK_reception_patients` (`IdMedicalCard`),
  KEY `FK_reception_diagnosis` (`CodeDiagnosis`),
  CONSTRAINT `FK_reception_diagnosis` FOREIGN KEY (`CodeDiagnosis`) REFERENCES `diagnosis` (`CodeDiagnosis`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_reception_doctors` FOREIGN KEY (`CodeDoctor`) REFERENCES `doctors` (`CodeDoctor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_reception_patients` FOREIGN KEY (`IdMedicalCard`) REFERENCES `patients` (`IdMedicalCard`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_reception_tickets` FOREIGN KEY (`NumberTicket`) REFERENCES `tickets` (`NumberTicket`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO `reception` (`NumberTicket`, `DateVisit`, `PourposeVisit`, `PriceVisit`, `CodeDoctor`, `IdMedicalCard`, `CodeDiagnosis`) VALUES
	(1, '2022-02-08', 'po1', 100.00, 1, 1, NULL),
	(1, '2022-02-10', 'po5', 100.00, 1, 4, NULL),
	(2, '2022-02-08', 'po2', 150.00, 2, 2, 2),
	(2, '2022-02-10', 'po6', 150.00, 2, 2, 1),
	(3, '2022-02-08', 'po3', 100.00, 1, 1, 2),
	(4, '2022-02-08', 'po4', 200.00, 3, 3, 3);




