CREATE DATABASE IF NOT EXISTS `workwear`;
USE `workwear`;
CREATE TABLE IF NOT EXISTS `workshops` (
  `CodeWorkshop` int(11) NOT NULL,
  `NameWorkshop` text NOT NULL,
  `FullNameManager` text NOT NULL,
  PRIMARY KEY (`CodeWorkshop`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `workwears` (
  `CodeWorkwear` int(11) NOT NULL,
  `TypeWorkwear` text NOT NULL,
  `ExploitationTime` text NOT NULL,
  `UnitPrice` decimal(10,2) NOT NULL,
  PRIMARY KEY (`CodeWorkwear`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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




