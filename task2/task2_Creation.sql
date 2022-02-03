
CREATE DATABASE IF NOT EXISTS `retail_trade` ;
USE `retail_trade`;




CREATE TABLE IF NOT EXISTS `suppliers` (
  `code_supplier` int(11) NOT NULL,
  `name_supplier` text DEFAULT NULL,
  `address` text DEFAULT NULL,
  `telephone` text DEFAULT NULL,
  `who_to_contact` text DEFAULT NULL,
  KEY `code_supplier` (`code_supplier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `products` (
  `code_product` int(11) NOT NULL,
  `code_supplier` int(11) NOT NULL,
  `name_product` text DEFAULT NULL,
  `date_receipts` date DEFAULT NULL,
  `purchase_price` decimal(10,2) DEFAULT NULL,
  `count_product` int(11) DEFAULT NULL,
  KEY `code_product` (`code_product`),
  KEY `FK_products_suppliers` (`code_supplier`),
  CONSTRAINT `FK_products_suppliers` FOREIGN KEY (`code_supplier`) REFERENCES `suppliers` (`code_supplier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `salling` (
  `code_sale` int(11) NOT NULL,
  `code_product` int(11) NOT NULL,
  `date_sale` date DEFAULT NULL,
  `count_sale_product` int(11) DEFAULT NULL,
  `retail_price` decimal(10,2) DEFAULT NULL,
  KEY `codу_sale` (`code_sale`),
  KEY `FK_salling_products` (`code_product`),
  CONSTRAINT `FK_salling_products` FOREIGN KEY (`code_product`) REFERENCES `products` (`code_product`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


