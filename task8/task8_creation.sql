CREATE DATABASE IF NOT EXISTS `subscription_publications`;
USE `subscription_publications`;

CREATE TABLE IF NOT EXISTS `publications` (
  `IndexPublication` int(11) NOT NULL,
  `TypePublication` text DEFAULT NULL,
  `NamePublication` text NOT NULL,
  `SubscriptionPrice` decimal(10,2) NOT NULL,
  PRIMARY KEY (`IndexPublication`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE IF NOT EXISTS `recipients` (
  `CodeRecipient` int(11) NOT NULL,
  `FullName` text NOT NULL,
  `Address` text NOT NULL,
  PRIMARY KEY (`CodeRecipient`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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

