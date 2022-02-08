
CREATE DATABASE IF NOT EXISTS `delivery_products`;
USE `delivery_products`;

CREATE TABLE IF NOT EXISTS `customers` (
  `code_customer` int(11) NOT NULL,
  `name_customer` text NOT NULL,
  `address_customer` text DEFAULT NULL,
  `telephone` text DEFAULT NULL,
  PRIMARY KEY (`code_customer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `products` (
  `code_product` int(11) NOT NULL,
  `name_product` text DEFAULT NULL,
  `price_product` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`code_product`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `products` (`code_product`, `name_product`, `price_product`) VALUES
	(1, 'prod1', 100.00),
	(2, 'prod2', 200.00),
	(3, 'prod3', 300.00),
	(4, 'prod4', 400.00);

INSERT INTO `customers` (`code_customer`, `name_customer`, `address_customer`, `telephone`) VALUES
	(1, 'name1', 'ad1', '+23'),
	(2, 'name2', 'dd2', '+74324'),
	(3, 'name3', 'ad3', '+3422');

CREATE TABLE IF NOT EXISTS `delivers` (
  `code_deliver` int(11) NOT NULL AUTO_INCREMENT,
  `date_of_deliver` date DEFAULT NULL,
  PRIMARY KEY (`code_deliver`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

INSERT INTO `delivers` (`code_deliver`, `date_of_deliver`) VALUES
	(1, '2022-02-02'),
	(2, '2022-02-01'),
	(3, '2022-01-31'),
	(4, '2022-01-30');

CREATE TABLE IF NOT EXISTS `orders` (
  `code_order` int(11) NOT NULL,
  `date_of_conclude_of_contracts` date DEFAULT NULL,
  `code_customer` int(11) NOT NULL,
  `№_contract` int(11) DEFAULT NULL,
  `planned_delivery` text DEFAULT NULL,
  `code_product` int(11) NOT NULL,
  PRIMARY KEY (`code_order`),
  KEY `FK_orders_customers` (`code_customer`),
  KEY `FK_orders_products` (`code_product`),
  CONSTRAINT `FK_orders_customers` FOREIGN KEY (`code_customer`) REFERENCES `customers` (`code_customer`),
  CONSTRAINT `FK_orders_products` FOREIGN KEY (`code_product`) REFERENCES `products` (`code_product`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `orders` (`code_order`, `date_of_conclude_of_contracts`, `code_customer`, `№_contract`, `planned_delivery`, `code_product`) VALUES
	(1, '2022-02-01', 1, 1, '200', 1),
	(2, '2022-01-31', 3, 2, '400', 2),
	(3, '2022-01-30', 2, 3, '600', 3),
	(4, '2022-01-29', 2, 4, '800', 2);

CREATE TABLE IF NOT EXISTS `delivers_content` (
  `code_deliver` int(11) DEFAULT NULL,
  `code_order` int(11) DEFAULT NULL,
  `count_products` int(11) DEFAULT NULL,
  KEY `FK_delivers_content_delivers` (`code_deliver`),
  KEY `FK_delivers_content_orders` (`code_order`),
  CONSTRAINT `FK_delivers_content_delivers` FOREIGN KEY (`code_deliver`) REFERENCES `delivers` (`code_deliver`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_delivers_content_orders` FOREIGN KEY (`code_order`) REFERENCES `orders` (`code_order`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `delivers_content` (`code_deliver`, `code_order`, `count_products`) VALUES
	(1, 2, 100),
	(1, 4, 200),
	(2, 1, 300),
	(3, 3, 400);



