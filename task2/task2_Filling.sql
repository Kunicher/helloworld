CREATE DATABASE IF NOT EXISTS `retail_trade`;
USE `retail_trade`;

CREATE TABLE IF NOT EXISTS `suppliers` (
  `code_supplier` int(11) NOT NULL,
  `name_supplier` text DEFAULT NULL,
  `address` text DEFAULT NULL,
  `telephone` text DEFAULT NULL,
  `who_to_contact` text DEFAULT NULL,
  KEY `code_supplier` (`code_supplier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO `suppliers` (`code_supplier`, `name_supplier`, `address`, `telephone`, `who_to_contact`) VALUES
	(2, 'name2', 'ad2', '+124312', 'Tafa'),
	(3, 'name3', 'ad3', '+43243', 'Obluch'),
	(1, 'name1', 'ad1', '+3121', 'Alex'),
	(4, 'name4', 'ad4', '+3242', 'Solek');

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

INSERT INTO `products` (`code_product`, `code_supplier`, `name_product`, `date_receipts`, `purchase_price`, `count_product`) VALUES
	(1, 1, 'name1', '2022-02-01', 100.00, 200),
	(2, 1, 'name2', '2022-02-01', 200.00, 100),
	(3, 2, 'name3', '2022-02-02', 150.00, 50),
	(3, 3, 'name3', '2022-02-02', 145.00, 55);
  
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

INSERT INTO `salling` (`code_sale`, `code_product`, `date_sale`, `count_sale_product`, `retail_price`) VALUES
	(1, 1, '2022-02-01', 10, 50.00),
	(1, 1, '2022-01-31', 20, 55.00),
	(2, 2, '2022-01-30', 30, 60.00);
