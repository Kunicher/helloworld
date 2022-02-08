
CREATE DATABASE IF NOT EXISTS `subscription_publications`;
USE `subscription_publications`;

CREATE TABLE IF NOT EXISTS `publications` (
  `IndexPublication` int(11) NOT NULL,
  `TypePublication` text DEFAULT NULL,
  `NamePublication` text NOT NULL,
  `SubscriptionPrice` decimal(10,2) NOT NULL,
  PRIMARY KEY (`IndexPublication`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO `publications` (`IndexPublication`, `TypePublication`, `NamePublication`, `SubscriptionPrice`) VALUES
	(1, 't1', 'Name1', 100.00),
	(2, 't2', 'Name2', 100.00),
	(3, 't3', 'Name3', 100.00);

CREATE TABLE IF NOT EXISTS `recipients` (
  `CodeRecipient` int(11) NOT NULL,
  `FullName` text NOT NULL,
  `Address` text NOT NULL,
  PRIMARY KEY (`CodeRecipient`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `recipients` (`CodeRecipient`, `FullName`, `Address`) VALUES
	(1, 'Name1', 'Ad1'),
	(2, 'Name2', 'Ad2'),
	(3, 'Name3', 'Ad3');

CREATE TABLE IF NOT EXISTS `subscribers` (
  `CodeRecipient` int(11) NOT NULL,
  `IndexPublication` int(11) NOT NULL,
  `SubscriptionPeriod` text DEFAULT NULL,
  `MonthStartDeliver` text DEFAULT NULL,
  `YearStartDeliver` text DEFAULT NULL,
  KEY `FK_subscribers_recipients` (`CodeRecipient`),
  KEY `FK_subscribers_publications` (`IndexPublication`),
  CONSTRAINT `FK_subscribers_publications` FOREIGN KEY (`IndexPublication`) REFERENCES `publications` (`IndexPublication`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_subscribers_recipients` FOREIGN KEY (`CodeRecipient`) REFERENCES `recipients` (`CodeRecipient`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `subscribers` (`CodeRecipient`, `IndexPublication`, `SubscriptionPeriod`, `MonthStartDeliver`, `YearStartDeliver`) VALUES
	(1, 1, '2', '1', '2000'),
	(2, 2, '3', '3', '2001'),
	(3, 3, '4', '5', '2002');
