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

INSERT INTO `books` (`CodeBook`, `NameBook`, `FirstAuthor`, `PublishingHouse`, `PlacePublication`, `YearPublication`, `QuantityPages`, `Price`) VALUES
	(1, 'Name1', 'Aut1', 'Ph1', 'Place1', '2022', 100, 100.00),
	(2, 'Name2', 'Aut2', 'Ph2', 'Place2', '2021', 200, 200.00),
	(3, 'Name3', 'Aut3', 'Ph3', 'Place3', '2020', 200, 200.00),
	(4, 'Name4', 'Aut4', 'Ph4', 'Place4', '2019', 150, 300.00);

CREATE TABLE IF NOT EXISTS `instances` (
  `CodeBook` int(11) NOT NULL,
  `CountInstance` decimal(10,0) NOT NULL,
  `InventoryNumber` int(11) NOT NULL,
  PRIMARY KEY (`CodeBook`),
  CONSTRAINT `FK__books` FOREIGN KEY (`CodeBook`) REFERENCES `books` (`CodeBook`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `instances` (`CodeBook`, `CountInstance`, `InventoryNumber`) VALUES
	(1, 10, 1),
	(2, 20, 2),
	(3, 10, 3),
	(4, 15, 4);

CREATE TABLE IF NOT EXISTS `readers` (
  `CodeReaderTicket` int(11) NOT NULL AUTO_INCREMENT,
  `FullnameReader` text NOT NULL,
  `DateBirth` date NOT NULL,
  `Telephone` text NOT NULL,
  PRIMARY KEY (`CodeReaderTicket`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

INSERT INTO `readers` (`CodeReaderTicket`, `FullnameReader`, `DateBirth`, `Telephone`) VALUES
	(1, 'Name1', '2022-02-17', '+1'),
	(2, 'Name2', '2022-01-17', '+2'),
	(3, 'Name3', '2021-12-17', '+3'),
	(4, 'Name4', '2021-11-17', '+4');

CREATE TABLE IF NOT EXISTS `thematic_catalog` (
  `CodeTopic` int(11) NOT NULL AUTO_INCREMENT,
  `NameTopic` text NOT NULL,
  `CodeBook` int(11) NOT NULL,
  PRIMARY KEY (`CodeTopic`),
  KEY `FK_thematic_catalog_books` (`CodeBook`),
  CONSTRAINT `FK_thematic_catalog_books` FOREIGN KEY (`CodeBook`) REFERENCES `books` (`CodeBook`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

INSERT INTO `thematic_catalog` (`CodeTopic`, `NameTopic`, `CodeBook`) VALUES
	(1, 'Name1', 2),
	(2, 'Name2', 3),
	(3, 'Name3', 1),
	(4, 'Name4', 4);

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

INSERT INTO `keep_out_books` (`CodeBook`, `CodeReaderTicket`, `DeteKeepOut`, `DateReturn`) VALUES
	(1, 1, '2022-01-17', '2022-02-17'),
	(2, 1, '2022-01-16', NULL),
	(2, 3, '2022-01-17', '2022-02-17'),
	(3, 2, '2021-12-17', '2022-02-17');
