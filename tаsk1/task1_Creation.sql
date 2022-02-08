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


CREATE TABLE IF NOT EXISTS `delivers` (
  `code_deliver` int(11) NOT NULL AUTO_INCREMENT,
  `date_of_deliver` date DEFAULT NULL,
  PRIMARY KEY (`code_deliver`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

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

CREATE TABLE IF NOT EXISTS `delivers_content` (
  `code_deliver` int(11) DEFAULT NULL,
  `code_order` int(11) DEFAULT NULL,
  `count_products` int(11) DEFAULT NULL,
  KEY `FK_delivers_content_delivers` (`code_deliver`),
  KEY `FK_delivers_content_orders` (`code_order`),
  CONSTRAINT `FK_delivers_content_delivers` FOREIGN KEY (`code_deliver`) REFERENCES `delivers` (`code_deliver`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_delivers_content_orders` FOREIGN KEY (`code_order`) REFERENCES `orders` (`code_order`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;






