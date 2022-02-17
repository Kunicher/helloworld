CREATE DATABASE IF NOT EXISTS `library_subscription`;
USE `library_subscription`;

CREATE TABLE IF NOT EXISTS `books` (
  `CodeBook` int(11) NOT NULL AUTO_INCREMENT,
  `NameBook` text NOT NULL,
  `FirstAuthor` text NOT NULL,
  `PublishingHouse` text NOT NULL,
  `PlacePublication` text NOT NULL,
  `YearPublication` year(4) NOT NULL,
  `QuantityPages` int(11) NOT NULL,
  `Price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`CodeBook`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `instances` (
  `CodeBook` int(11) NOT NULL,
  `CountInstance` decimal(10,0) NOT NULL,
  `InventoryNumber` int(11) NOT NULL,
  PRIMARY KEY (`CodeBook`),
  CONSTRAINT `FK__books` FOREIGN KEY (`CodeBook`) REFERENCES `books` (`CodeBook`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `readers` (
  `CodeReaderTicket` int(11) NOT NULL AUTO_INCREMENT,
  `FullnameReader` text NOT NULL,
  `DateBirth` date NOT NULL,
  `Telephone` text NOT NULL,
  PRIMARY KEY (`CodeReaderTicket`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `thematic_catalog` (
  `CodeTopic` int(11) NOT NULL AUTO_INCREMENT,
  `NameTopic` text NOT NULL,
  `CodeBook` int(11) NOT NULL,
  PRIMARY KEY (`CodeTopic`),
  KEY `FK_thematic_catalog_books` (`CodeBook`),
  CONSTRAINT `FK_thematic_catalog_books` FOREIGN KEY (`CodeBook`) REFERENCES `books` (`CodeBook`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `keep_out_books` (
  `CodeBook` int(11) NOT NULL,
  `CodeReaderTicket` int(11) NOT NULL,
  `DeteKeepOut` date NOT NULL,
  `DateReturn` date DEFAULT NULL,
  PRIMARY KEY (`CodeBook`,`CodeReaderTicket`),
  KEY `FK_keep_out_books_readers` (`CodeReaderTicket`),
  CONSTRAINT `FK_keep_out_books_books` FOREIGN KEY (`CodeBook`) REFERENCES `books` (`CodeBook`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_keep_out_books_readers` FOREIGN KEY (`CodeReaderTicket`) REFERENCES `readers` (`CodeReaderTicket`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;