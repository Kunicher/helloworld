CREATE DATABASE IF NOT EXISTS `currency_exchange_office`;
USE `currency_exchange_office`;

CREATE TABLE IF NOT EXISTS `cashiers` (
  `NumberCashier` int(11) NOT NULL AUTO_INCREMENT,
  `FullnameCashier` text NOT NULL,
  PRIMARY KEY (`NumberCashier`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

INSERT INTO `cashiers` (`NumberCashier`, `FullnameCashier`) VALUES
	(1, 'Name1'),
	(2, 'Name2'),
	(3, 'Name3'),
	(4, 'Name4');

CREATE TABLE IF NOT EXISTS `clients` (
  `CodeClient` int(11) NOT NULL AUTO_INCREMENT,
  `FullnameClient` text NOT NULL,
  `Passport` int(11) NOT NULL,
  PRIMARY KEY (`CodeClient`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

INSERT INTO `clients` (`CodeClient`, `FullnameClient`, `Passport`) VALUES
	(1, 'Name1', 1),
	(2, 'Name2', 2),
	(3, 'Name3', 3),
	(4, 'Name4', 4);

CREATE TABLE IF NOT EXISTS `currencies` (
  `CodeCurrencySold` int(11) NOT NULL,
  `CodePurchasedCurrency` int(11) NOT NULL,
  `NameCurrency` text NOT NULL,
  `SellingRate` text NOT NULL,
  `PurchaseRate` text NOT NULL,
  UNIQUE KEY `CodeCurrencySold` (`CodeCurrencySold`),
  UNIQUE KEY `CodePurchasedCurrency` (`CodePurchasedCurrency`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `currencies` (`CodeCurrencySold`, `CodePurchasedCurrency`, `NameCurrency`, `SellingRate`, `PurchaseRate`) VALUES
	(1, 1, 'Name1', 'Rate1', 'Rate1'),
	(2, 2, 'Name2', 'Rate2', 'Rate2'),
	(3, 3, 'Name3', 'Rate3', 'Rate3');

CREATE TABLE IF NOT EXISTS `deals` (
  `CodeCurrencySold` int(11) DEFAULT NULL,
  `CodePurchasedCurrency` int(11) DEFAULT NULL,
  `NumberCashier` int(11) NOT NULL,
  `CodeClient` int(11) NOT NULL,
  `DateTimeDeal` datetime NOT NULL,
  `CountSalesCurrency` int(11) DEFAULT NULL,
  `CountPurchasedCurrency` int(11) DEFAULT NULL,
  KEY `FK_deals_currencies` (`CodeCurrencySold`),
  KEY `FK_deals_cashiers` (`NumberCashier`),
  KEY `FK_deals_clients` (`CodeClient`),
  KEY `FK_deals_currencies_2` (`CodePurchasedCurrency`),
  CONSTRAINT `FK_deals_cashiers` FOREIGN KEY (`NumberCashier`) REFERENCES `cashiers` (`NumberCashier`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_deals_clients` FOREIGN KEY (`CodeClient`) REFERENCES `clients` (`CodeClient`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_deals_currencies` FOREIGN KEY (`CodeCurrencySold`) REFERENCES `currencies` (`CodeCurrencySold`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_deals_currencies_2` FOREIGN KEY (`CodePurchasedCurrency`) REFERENCES `currencies` (`CodePurchasedCurrency`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `deals` (`CodeCurrencySold`, `CodePurchasedCurrency`, `NumberCashier`, `CodeClient`, `DateTimeDeal`, `CountSalesCurrency`, `CountPurchasedCurrency`) VALUES
	(1, NULL, 2, 3, '2022-02-17 11:38:20', 10, NULL),
	(NULL, 2, 3, 4, '2022-02-14 11:38:30', NULL, 20);
