INSERT INTO `customers` (`code_customer`, `name_customer`, `address_customer`, `telephone`) VALUES
	(1, 'name1', 'ad1', '+23'),
	(2, 'name2', 'dd2', '+74324'),
	(3, 'name3', 'ad3', '+3422');

INSERT INTO `delivers` (`code_deliver`, `date_of_deliver`) VALUES
	(1, '2022-02-02'),
	(2, '2022-02-01'),
	(3, '2022-01-31'),
	(4, '2022-01-30');

INSERT INTO `delivers_content` (`count_products`, `code_deliver`, `code_order`) VALUES
	(100, 1, 2),
	(200, 1, 4),
	(300, 2, 1),
	(400, 3, 3);

INSERT INTO `orders` (`code_order`, `date_of_conclude_of_contracts`, `code_customer`, `№_contract`, `planned_delivery`, `code_product`) VALUES
	(1, '2022-02-01', 1, 1, 200, 1),
	(2, '2022-01-31', 3, 2, 400, 2),
	(3, '2022-01-30', 2, 3, 600, 3),
	(4, '2022-01-29', 2, 4, 800, 2);

INSERT INTO `products` (`code_product`, `name_product`, `price_product`) VALUES
	(1, 'prod1', 100.00),
	(2, 'prod2', 200.00),
	(3, 'prod3', 300.00),
	(4, 'prod4', 400.00);
