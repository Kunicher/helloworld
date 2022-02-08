CREATE DATABASE IF NOT EXISTS `library`;
USE `library`;

CREATE TABLE IF NOT EXISTS `publishing_companies` (
  `CodeCompany` int(11) NOT NULL,
  `NameCompany` text NOT NULL,
  `City` text DEFAULT NULL,
  PRIMARY KEY (`CodeCompany`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `readers` (
  `CodeReader` int(11) NOT NULL,
  `FullNameReader` text NOT NULL,
  `Address` text DEFAULT NULL,
  `Telephone` text DEFAULT NULL,
  PRIMARY KEY (`CodeReader`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE IF NOT EXISTS `book` (
  `CodeBook` int(11) NOT NULL,
  `NameBook` text NOT NULL,
  `FirstAuthor` text DEFAULT NULL,
  `YearOfPublication` year(4) DEFAULT NULL,
  `PriceBook` decimal(10,2) NOT NULL,
  `CountBook` int(11) DEFAULT NULL,
  `CodeCompany` int(11) NOT NULL,
  PRIMARY KEY (`CodeBook`),
  KEY `FK_book_publishing_companies` (`CodeCompany`),
  CONSTRAINT `FK_book_publishing_companies` FOREIGN KEY (`CodeCompany`) REFERENCES `publishing_companies` (`CodeCompany`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `keep_out` (
  `CodeReader` int(11) NOT NULL,
  `CodeBook` int(11) NOT NULL,
  `DateKeep` date NOT NULL,
  `SingIn` text DEFAULT NULL,
  KEY `FK_keep_out_book` (`CodeBook`),
  KEY `FK_keep_out_readers` (`CodeReader`),
  CONSTRAINT `FK_keep_out_book` FOREIGN KEY (`CodeBook`) REFERENCES `book` (`CodeBook`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_keep_out_readers` FOREIGN KEY (`CodeReader`) REFERENCES `readers` (`CodeReader`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;