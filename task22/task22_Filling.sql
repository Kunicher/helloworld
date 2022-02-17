CREATE DATABASE IF NOT EXISTS `scientific_production_factory`;
USE `scientific_production_factory`;

CREATE TABLE IF NOT EXISTS `contracts` (
  `NumberContract` int(11) NOT NULL AUTO_INCREMENT,
  `NameOrganization` text NOT NULL,
  `DateCouncludeContract` date NOT NULL,
  PRIMARY KEY (`NumberContract`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

INSERT INTO `contracts` (`NumberContract`, `NameOrganization`, `DateCouncludeContract`) VALUES
	(1, 'Name1', '2022-02-17'),
	(2, 'Name2', '2022-02-16'),
	(3, 'Name3', '2022-02-15'),
	(4, 'Name4', '2022-02-14');

CREATE TABLE IF NOT EXISTS `employee` (
  `CodeEmployee` int(11) NOT NULL AUTO_INCREMENT,
  `CodeDepartment` int(11) NOT NULL,
  `FullnameEmployee` text NOT NULL,
  `Post` text NOT NULL,
  `Salary` decimal(10,2) NOT NULL,
  `Award` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`CodeEmployee`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

INSERT INTO `employee` (`CodeEmployee`, `CodeDepartment`, `FullnameEmployee`, `Post`, `Salary`, `Award`) VALUES
	(1, 1, 'Name1', 'Post1', 1000.00, 100.00),
	(2, 2, 'Name2', 'Post3', 2000.00, NULL),
	(3, 3, 'Name3', 'Post3', 3000.00, 200.00);

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

INSERT INTO `organizations` (`NumberContract`, `CodeCountry`, `City`, `Address`, `Telephone`, `EMail`, `WebSite`) VALUES
	(1, 1, 'City1', 'Ad1', '+1', 'Mail1', 'Site1'),
	(2, 2, 'City2', 'Ad2', '+2', 'Mail2', NULL),
	(3, 3, 'City3', 'Ad3', '+3', 'Mail3', 'Site3'),
	(4, 4, 'City4', 'Ad4', '+4', 'Mail4', 'Site4');

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

INSERT INTO `delivers` (`NumberContract`, `TypeEquipment`, `Comment`, `CodeEmployee`) VALUES
	(1, 'Type1', 'Com1', 1),
	(3, 'Type2', NULL, 3);
