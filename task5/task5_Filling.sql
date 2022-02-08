
CREATE DATABASE IF NOT EXISTS `factory`;
USE `factory`;

CREATE TABLE IF NOT EXISTS `products` (
  `code_product` int(11) NOT NULL,
  `name_product` text DEFAULT NULL,
  PRIMARY KEY (`code_product`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `products` (`code_product`, `name_product`) VALUES
	(1, 'prod1'),
	(2, 'prod2'),
	(3, 'prod3');
  
CREATE TABLE IF NOT EXISTS `model` (
  `code_model` int(11) NOT NULL,
  `name_model` text DEFAULT NULL,
  `code_product` int(11) NOT NULL,
  `cost_model` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`code_model`),
  KEY `FK_model_products` (`code_product`),
  CONSTRAINT `FK_model_products` FOREIGN KEY (`code_product`) REFERENCES `products` (`code_product`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `model` (`code_model`, `name_model`, `code_product`, `cost_model`) VALUES
	(1, 'model1', 1, 100.00),
	(2, 'model2', 2, 200.00),
	(3, 'model3', 3, 300.00),
	(4, 'model4', 2, 50.00);
CREATE TABLE IF NOT EXISTS `receipts` (
  `code_receipts` int(11) NOT NULL,
  `code_model` int(11) DEFAULT NULL,
  `date_of_receipt_product` date NOT NULL,
  `count` int(11) NOT NULL,
  `who_accepted` text DEFAULT NULL,
  PRIMARY KEY (`code_receipts`),
  KEY `FK_receipts_model` (`code_model`),
  CONSTRAINT `FK_receipts_model` FOREIGN KEY (`code_model`) REFERENCES `model` (`code_model`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `receipts` (`code_receipts`, `code_model`, `date_of_receipt_product`, `count`, `who_accepted`) VALUES
	(1, 1, '2022-01-31', 100, 'ALex'),
	(2, 2, '2022-01-30', 200, 'Tafa'),
	(3, 3, '2022-01-29', 300, 'Solek'),
	(4, 1, '2022-01-31', 150, 'ALex');

