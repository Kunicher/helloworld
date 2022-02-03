CREATE DATABASE IF NOT EXISTS `factory`;
USE `factory`;

CREATE TABLE IF NOT EXISTS `model` (
  `code_model` int(11) NOT NULL,
  `name_model` text DEFAULT NULL,
  `code_product` int(11) DEFAULT NULL,
  `cost_model` decimal(10,0) DEFAULT NULL,
  KEY `code_model` (`code_model`),
  KEY `FK_model_products` (`code_product`),
  CONSTRAINT `FK_model_products` FOREIGN KEY (`code_product`) REFERENCES `products` (`code_product`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `products` (
  `code_product` int(11) NOT NULL,
  `name_product` text DEFAULT NULL,
  KEY `code_product` (`code_product`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `receipts` (
  `code_receipts` int(11) NOT NULL,
  `code_model` int(11) DEFAULT NULL,
  `date_of_receipt_product` date DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `who_accepted` text DEFAULT NULL,
  KEY `code_receipts` (`code_receipts`),
  KEY `FK_receipts_model` (`code_model`),
  CONSTRAINT `FK_receipts_model` FOREIGN KEY (`code_model`) REFERENCES `model` (`code_model`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
