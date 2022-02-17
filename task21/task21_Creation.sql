CREATE DATABASE IF NOT EXISTS `currency_exchange_office`;
USE `currency_exchange_office`;

CREATE TABLE IF NOT EXISTS `cashiers` (
  `NumberCashier` int(11) NOT NULL AUTO_INCREMENT,
  `FullnameCashier` text NOT NULL,
  PRIMARY KEY (`NumberCashier`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `clients` (
  `CodeClient` int(11) NOT NULL AUTO_INCREMENT,
  `FullnameClient` text NOT NULL,
  `Passport` int(11) NOT NULL,
  PRIMARY KEY (`CodeClient`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `currencies` (
  `CodeCurrencySold` int(11) NOT NULL,
  `CodePurchasedCurrency` int(11) NOT NULL,
  `NameCurrency` text NOT NULL,
  `SellingRate` text NOT NULL,
  `PurchaseRate` text NOT NULL,
  UNIQUE KEY `CodeCurrencySold` (`CodeCurrencySold`),
  UNIQUE KEY `CodePurchasedCurrency` (`CodePurchasedCurrency`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
