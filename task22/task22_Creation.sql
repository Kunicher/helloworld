CREATE DATABASE IF NOT EXISTS `scientific_production_factory`;
USE `scientific_production_factory`;

CREATE TABLE IF NOT EXISTS `contracts` (
  `NumberContract` int(11) NOT NULL AUTO_INCREMENT,
  `NameOrganization` text NOT NULL,
  `DateCouncludeContract` date NOT NULL,
  PRIMARY KEY (`NumberContract`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `employee` (
  `CodeEmployee` int(11) NOT NULL AUTO_INCREMENT,
  `CodeDepartment` int(11) NOT NULL,
  `FullnameEmployee` text NOT NULL,
  `Post` text NOT NULL,
  `Salary` decimal(10,2) NOT NULL,
  `Award` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`CodeEmployee`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `organizations` (
  `NumberContract` int(11) NOT NULL,
  `CodeCountry` int(11) NOT NULL,
  `City` text NOT NULL,
  `Address` text NOT NULL,
  `Telephone` text NOT NULL,
  `EMail` text NOT NULL,
  `WebSite` text DEFAULT NULL,
  PRIMARY KEY (`NumberContract`),
  CONSTRAINT `FK__contracts` FOREIGN KEY (`NumberContract`) REFERENCES `contracts` (`NumberContract`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `delivers` (
  `NumberContract` int(11) NOT NULL,
  `TypeEquipment` text NOT NULL,
  `Comment` text DEFAULT NULL,
  `CodeEmployee` int(11) NOT NULL,
  PRIMARY KEY (`NumberContract`),
  KEY `FK_delivers_employee` (`CodeEmployee`),
  CONSTRAINT `FK_delivers_contracts` FOREIGN KEY (`NumberContract`) REFERENCES `contracts` (`NumberContract`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_delivers_employee` FOREIGN KEY (`CodeEmployee`) REFERENCES `employee` (`CodeEmployee`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;