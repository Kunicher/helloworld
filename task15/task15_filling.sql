CREATE DATABASE IF NOT EXISTS `online_sales`;
USE `online_sales`;

CREATE TABLE IF NOT EXISTS `clientinfo` (
  `CodeClient` int(11) NOT NULL,
  `NameClient` text NOT NULL,
  `Addres` text DEFAULT NULL,
  PRIMARY KEY (`CodeClient`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `clientinfo` (`CodeClient`, `NameClient`, `Addres`) VALUES
	(1, 'Name1', 'Ad1'),
	(2, 'Name2', NULL),
	(3, 'Name3', 'Ad2'),
	(4, 'Name4', NULL);


CREATE TABLE IF NOT EXISTS `online_store` (
  `CodeStore` int(11) NOT NULL,
  `EmailAddress` text DEFAULT NULL,
  `PaymentForDelivery` text NOT NULL,
  PRIMARY KEY (`CodeStore`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `online_store` (`CodeStore`, `EmailAddress`, `PaymentForDelivery`) VALUES
	(1, 'mail1', 'Yes'),
	(2, 'mail2', 'No'),
	(3, 'mail3', 'Yes');

CREATE TABLE IF NOT EXISTS `products` (
  `CodeProduct` int(11) NOT NULL,
  `NameProduct` text NOT NULL,
  `Firm` text NOT NULL,
  `Model` text NOT NULL,
  `Price` decimal(10,2) NOT NULL,
  `TechnicalCharacteristics` text DEFAULT NULL,
  `WarrantyPeriod` date DEFAULT NULL,
  `Picture` blob DEFAULT NULL,
  PRIMARY KEY (`CodeProduct`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `products` (`CodeProduct`, `NameProduct`, `Firm`, `Model`, `Price`, `TechnicalCharacteristics`, `WarrantyPeriod`, `Picture`) VALUES
	(1, 'Name1', 'Firm1', 'Model1', 100.00, 'TC1', '2022-02-17', _binary 0x7069637431),
	(2, 'Name2', 'Firm2', 'Model2', 200.00, NULL, NULL, NULL),
	(3, 'Name3', 'Firm3', 'Model3', 300.00, 'TC3', '2022-02-17', _binary 0x7069637433),
	(4, 'Name4', 'Firm4', 'Model4', 400.00, 'TC4', NULL, _binary 0x7069637434),
	(5, 'Name5', 'Firm5', 'Model5', 500.00, 'TC5', '2022-02-17', NULL);

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

INSERT INTO `order` (`CodeOrder`, `CodeStore`, `CodeProduct`, `DateOrder`, `TimeOrder`, `Count`, `CodeClient`, `Telephone`, `OrderConfirmation`) VALUES
	(1, 1, 1, '2022-02-10', '14:09:27', 1, 1, '+1', 'Yes'),
	(2, 2, 3, '2022-02-10', '14:09:27', 3, 2, '+2', 'No'),
	(3, 3, 2, '2022-02-09', '14:10:33', 2, 3, '+3', 'Yes'),
	(4, 2, 1, '2022-02-10', '14:11:00', 1, 4, '+4', 'Yes');



CREATE TABLE IF NOT EXISTS `deliver` (
  `CodeOrder` int(11) NOT NULL,
  `DateDeliver` date DEFAULT NULL,
  `TimeDeliver` time DEFAULT NULL,
  `FullnameCourier` text NOT NULL,
  `CodeClient` int(11) NOT NULL,
  PRIMARY KEY (`CodeOrder`),
  KEY `FK_deliver_clientinfo` (`CodeClient`),
  CONSTRAINT `FK_deliver_clientinfo` FOREIGN KEY (`CodeClient`) REFERENCES `clientinfo` (`CodeClient`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_deliver_order` FOREIGN KEY (`CodeOrder`) REFERENCES `order` (`CodeOrder`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `deliver` (`CodeOrder`, `DateDeliver`, `TimeDeliver`, `FullnameCourier`, `CodeClient`) VALUES
	(1, '2022-02-10', '14:18:05', 'Name1', 1);
