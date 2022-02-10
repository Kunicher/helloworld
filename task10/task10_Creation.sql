CREATE DATABASE IF NOT EXISTS `polyclinic`;
USE `polyclinic`;

CREATE TABLE IF NOT EXISTS `specialties` (
  `CodeSpecialty` int(11) NOT NULL,
  `Specialty` text NOT NULL,
  PRIMARY KEY (`CodeSpecialty`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `tickets` (
  `NumberTicket` int(11) NOT NULL,
  `Time` text NOT NULL,
  `CodeSpecialty` int(11) NOT NULL,
  PRIMARY KEY (`NumberTicket`),
  KEY `FK_tickets_specialties` (`CodeSpecialty`),
  CONSTRAINT `FK_tickets_specialties` FOREIGN KEY (`CodeSpecialty`) REFERENCES `specialties` (`CodeSpecialty`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE IF NOT EXISTS `diagnosis` (
  `CodeDiagnosis` int(11) NOT NULL,
  `NameDiagnosis` text NOT NULL,
  PRIMARY KEY (`CodeDiagnosis`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `doctors` (
  `CodeDoctor` int(11) NOT NULL,
  `FullName` text NOT NULL,
  `CodeSpecialty` int(11) NOT NULL,
  `Category` int(11) NOT NULL,
  PRIMARY KEY (`CodeDoctor`) USING BTREE,
  KEY `FK_doctors_specialties` (`CodeSpecialty`),
  CONSTRAINT `FK_doctors_specialties` FOREIGN KEY (`CodeSpecialty`) REFERENCES `specialties` (`CodeSpecialty`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE IF NOT EXISTS `patients` (
  `IdMedicalCard` int(11) NOT NULL,
  `FullName` text NOT NULL,
  `DateBirth` date NOT NULL,
  `Address` text NOT NULL,
  `Gender` text NOT NULL,
  `DiscountOnService` text DEFAULT NULL,
  PRIMARY KEY (`IdMedicalCard`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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


