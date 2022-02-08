CREATE DATABASE IF NOT EXISTS `retail_trade`;
USE `retail_trade`;

CREATE TABLE IF NOT EXISTS `suppliers` (
  `code_supplier` int(11) NOT NULL,
  `name_supplier` text NOT NULL,
  `address` text NOT NULL,
  `telephone` text NOT NULL,
  `who_to_contact` text DEFAULT NULL,
  PRIMARY KEY (`code_supplier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



CREATE TABLE IF NOT EXISTS `products` (
  `code_product` int(11) NOT NULL,
  `name_product` text DEFAULT NULL,
  `count_product` int(11) DEFAULT NULL,
  PRIMARY KEY (`code_product`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `salling` (
  `code_sale` int(11) NOT NULL,
  `code_product` int(11) NOT NULL,
  `date_sale` date DEFAULT NULL,
  `count_sale_product` text DEFAULT NULL,
  `retail_price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`code_sale`),
  KEY `FK_salling_products` (`code_product`),
  CONSTRAINT `FK_salling_products` FOREIGN KEY (`code_product`) REFERENCES `products` (`code_product`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



CREATE TABLE IF NOT EXISTS `delivers` (
  `date_receipts` date NOT NULL,
  `code_supplier` int(11) NOT NULL,
  `code_product` int(11) NOT NULL,
  `purchase_price` decimal(10,2) DEFAULT NULL,
  KEY `FK_delivers_products` (`code_product`),
  KEY `FK_delivers_suppliers` (`code_supplier`),
  CONSTRAINT `FK_delivers_products` FOREIGN KEY (`code_product`) REFERENCES `products` (`code_product`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_delivers_suppliers` FOREIGN KEY (`code_supplier`) REFERENCES `suppliers` (`code_supplier`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
