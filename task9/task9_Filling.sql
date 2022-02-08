CREATE DATABASE IF NOT EXISTS `library`;
USE `library`;



CREATE TABLE IF NOT EXISTS `publishing_companies` (
  `CodeCompany` int(11) NOT NULL,
  `NameCompany` text NOT NULL,
  `City` text DEFAULT NULL,
  PRIMARY KEY (`CodeCompany`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO `publishing_companies` (`CodeCompany`, `NameCompany`, `City`) VALUES
	(1, 'name1', 'City1'),
	(2, 'Name2', 'City2'),
	(3, 'Nam3', 'City3');

CREATE TABLE IF NOT EXISTS `readers` (
  `CodeReader` int(11) NOT NULL,
  `FullNameReader` text NOT NULL,
  `Address` text DEFAULT NULL,
  `Telephone` text DEFAULT NULL,
  PRIMARY KEY (`CodeReader`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO `readers` (`CodeReader`, `FullNameReader`, `Address`, `Telephone`) VALUES
	(1, 'name1', 'ad1', '+1'),
	(2, 'name2', 'ad2', '+2'),
	(3, 'name3', 'ad3', '+3');

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

INSERT INTO `book` (`CodeBook`, `NameBook`, `FirstAuthor`, `YearOfPublication`, `PriceBook`, `CountBook`, `CodeCompany`) VALUES
	(1, 'Name1', 'Au1', '2014', 100.00, 20, 1),
	(2, 'Name2', 'Au2', '2015', 200.00, 100, 2),
	(3, 'Nam3', 'au3', '2019', 300.00, 10, 3);

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

INSERT INTO `keep_out` (`CodeReader`, `CodeBook`, `DateKeep`, `SingIn`) VALUES
	(1, 2, '2021-07-08', 'da'),
	(2, 1, '2021-12-08', 'ad'),
	(3, 3, '2021-09-08', 'we');
