CREATE DATABASE IF NOT EXISTS `online_sales`;
USE `online_sales`;

CREATE TABLE IF NOT EXISTS `clientinfo` (
  `CodeClient` int(11) NOT NULL,
  `NameClient` text NOT NULL,
  `Addres` text DEFAULT NULL,
  PRIMARY KEY (`CodeClient`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `products` (
  `CodeProduct` int(11) NOT NULL DEFAULT 0,
  `NameProduct` text NOT NULL,
  `Firm` text NOT NULL,
  `Model` text NOT NULL,
  `TechnicalCharacteristics` text DEFAULT NULL,
  `WarrantyPeriod` text DEFAULT NULL,
  `Picture` text DEFAULT NULL,
  PRIMARY KEY (`CodeProduct`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `online_store` (
  `CodeStore` int(11) NOT NULL,
  `EmailAddress` text DEFAULT NULL,
  `PaymentForDelivery` text NOT NULL,
  PRIMARY KEY (`CodeStore`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `order` (
  `CodeOrder` int(11) NOT NULL,
  `CodeStore` int(11) NOT NULL,
  `CodeProduct` int(11) NOT NULL,
  `DateOrder` date NOT NULL,
  `TimeOrder` time NOT NULL,
  `Count` int(11) NOT NULL,
  `CodeClient` int(11) NOT NULL DEFAULT 0,
  `Telephone` text DEFAULT NULL,
  `OrderConfirmation` text NOT NULL,
  PRIMARY KEY (`CodeOrder`),
  KEY `FK_order_online_store` (`CodeStore`),
  KEY `FK_order_products` (`CodeProduct`),
  KEY `FK_order_clientinfo` (`CodeClient`) USING BTREE,
  CONSTRAINT `FK_order_clientinfo` FOREIGN KEY (`CodeClient`) REFERENCES `clientinfo` (`CodeClient`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_order_online_store` FOREIGN KEY (`CodeStore`) REFERENCES `online_store` (`CodeStore`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_order_products` FOREIGN KEY (`CodeProduct`) REFERENCES `products` (`CodeProduct`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `deliver` (
  `CodeOrder` int(11) NOT NULL,
  `DateDeliver` date DEFAULT NULL,
  `TimeDeliver` time DEFAULT NULL,
  `FullnameCourier` text NOT NULL,
  `CodeClient` int(11) NOT NULL,
  UNIQUE KEY `CodeOrder` (`CodeOrder`),
  KEY `FK_deliver_clientinfo` (`CodeClient`),
  CONSTRAINT `FK_deliver_clientinfo` FOREIGN KEY (`CodeClient`) REFERENCES `clientinfo` (`CodeClient`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_deliver_order` FOREIGN KEY (`CodeOrder`) REFERENCES `order` (`CodeOrder`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;