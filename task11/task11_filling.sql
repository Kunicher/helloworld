CREATE DATABASE IF NOT EXISTS `workwear`;
USE `workwear`;

CREATE TABLE IF NOT EXISTS `workshops` (
  `CodeWorkshop` int(11) NOT NULL,
  `NameWorkshop` text NOT NULL,
  `FullNameManager` text NOT NULL,
  PRIMARY KEY (`CodeWorkshop`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `workshops` (`CodeWorkshop`, `NameWorkshop`, `FullNameManager`) VALUES
	(1, 'Name1', 'Name1'),
	(2, 'Name2', 'Name2'),
	(3, 'Name3', 'Name3'),
	(4, 'Name4', 'Name4');

CREATE TABLE IF NOT EXISTS `workwears` (
  `CodeWorkwear` int(11) NOT NULL,
  `TypeWorkwear` text NOT NULL,
  `ExploitationTime` text NOT NULL,
  `UnitPrice` decimal(10,2) NOT NULL,
  PRIMARY KEY (`CodeWorkwear`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `workwears` (`CodeWorkwear`, `TypeWorkwear`, `ExploitationTime`, `UnitPrice`) VALUES
	(1, 'type1', '1 Year', 1000.00),
	(2, 'type2', '2 Year', 2000.00),
	(3, 'type3', '1 Month', 5000.00),
	(4, 'type4', '6 Month', 2000.00);

CREATE TABLE IF NOT EXISTS `workers` (
  `CodeWorker` int(11) NOT NULL,
  `FullNameWorker` text NOT NULL,
  `WorkPost` text NOT NULL,
  `DiscountWorkWear` text DEFAULT NULL,
  `CodeWorkshop` int(11) NOT NULL,
  PRIMARY KEY (`CodeWorker`),
  KEY `FK_workers_workshops` (`CodeWorkshop`),
  CONSTRAINT `FK_workers_workshops` FOREIGN KEY (`CodeWorkshop`) REFERENCES `workshops` (`CodeWorkshop`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `workers` (`CodeWorker`, `FullNameWorker`, `WorkPost`, `DiscountWorkWear`, `CodeWorkshop`) VALUES
	(1, 'name1', 'post1', NULL, 1),
	(2, 'name2', 'post2', '10%', 2),
	(3, 'name3', 'post3', NULL, 3),
	(4, 'name4', 'post4', '5%', 4),
	(5, 'name5', 'post5', '7%', 2);

CREATE TABLE IF NOT EXISTS `keep_out` (
  `CodeWorker` int(11) NOT NULL,
  `CodeWorkwear` int(11) NOT NULL,
  `DateKeep` date NOT NULL,
  `SingIn` text NOT NULL,
  KEY `FK_keep_out_workers` (`CodeWorker`),
  KEY `FK_keep_out_workwears` (`CodeWorkwear`),
  CONSTRAINT `FK_keep_out_workers` FOREIGN KEY (`CodeWorker`) REFERENCES `workers` (`CodeWorker`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_keep_out_workwears` FOREIGN KEY (`CodeWorkwear`) REFERENCES `workwears` (`CodeWorkwear`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `keep_out` (`CodeWorker`, `CodeWorkwear`, `DateKeep`, `SingIn`) VALUES
	(1, 2, '2022-02-10', 'ss'),
	(2, 3, '2022-02-09', 'dsda'),
	(3, 4, '2022-02-08', 'asda'),
	(3, 1, '2022-02-04', 'dsd');

