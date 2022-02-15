CREATE DATABASE IF NOT EXISTS `printing_house`;
USE `printing_house`;

CREATE TABLE IF NOT EXISTS `contracts` (
  `NumberContract` int(11) NOT NULL,
  `NameCustomer` text NOT NULL,
  `AddressCustomer` text NOT NULL,
  `DateDrawupContract` date NOT NULL,
  `DateCompletionContact` date NOT NULL,
  PRIMARY KEY (`NumberContract`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `offices` (
  `NumberOffice` int(11) NOT NULL,
  `NameOffice` text NOT NULL,
  `ManagerOffice` text NOT NULL,
  `TelephoneOffice` text NOT NULL,
  PRIMARY KEY (`NumberOffice`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `products` (
  `CodeProducts` int(11) NOT NULL,
  `NameProducts` text NOT NULL,
  `NumberOffice` int(11) NOT NULL DEFAULT 0,
  `PriceUnitProduct` decimal(10,2) NOT NULL DEFAULT 0.00,
  PRIMARY KEY (`CodeProducts`),
  KEY `FK_products_offices` (`NumberOffice`),
  CONSTRAINT `FK_products_offices` FOREIGN KEY (`NumberOffice`) REFERENCES `offices` (`NumberOffice`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `orders` (
  `NumberContract` int(11) NOT NULL,
  `CodeProduct` int(11) NOT NULL,
  `CountProducts` int(11) NOT NULL,
  KEY `FK_orders_contracts` (`NumberContract`),
  KEY `FK_orders_products` (`CodeProduct`),
  CONSTRAINT `FK_orders_contracts` FOREIGN KEY (`NumberContract`) REFERENCES `contracts` (`NumberContract`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_orders_products` FOREIGN KEY (`CodeProduct`) REFERENCES `products` (`CodeProducts`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

