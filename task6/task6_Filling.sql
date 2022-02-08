CREATE DATABASE IF NOT EXISTS `travel_agency` ;
USE `travel_agency`;

CREATE TABLE IF NOT EXISTS `countries` (
  `code_country` int(11) NOT NULL,
  `name_conntry` text DEFAULT NULL,
  `price_VISA` decimal(10,2) NOT NULL,
  PRIMARY KEY (`code_country`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO `countries` (`code_country`, `name_conntry`, `price_VISA`) VALUES
	(1, 'country1', 10000.00),
	(2, 'country2', 20000.00),
	(3, 'country3', 30000.00),
	(4, 'country4', 40000.00),
	(5, 'country5', 50000.00);

CREATE TABLE IF NOT EXISTS `routes` (
  `code_country` int(11) NOT NULL,
  `code_route` int(11) NOT NULL,
  `name_route` text DEFAULT NULL,
  PRIMARY KEY (`code_route`),
  KEY `FK_routes_countries` (`code_country`),
  CONSTRAINT `FK_routes_countries` FOREIGN KEY (`code_country`) REFERENCES `countries` (`code_country`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO `routes` (`code_country`, `code_route`, `name_route`) VALUES
	(4, 1, 'name1'),
	(2, 2, 'name2'),
	(3, 3, 'name3'),
	(4, 4, 'name4'),
	(5, 5, 'name5'),
	(1, 6, 'name6'),
	(2, 7, 'name7'),
	(3, 8, 'name8');

CREATE TABLE IF NOT EXISTS `sales` (
  `code_route` int(11) NOT NULL,
  `purpose_of_the_travel` text NOT NULL,
  `cost_travel_package` decimal(10,2) DEFAULT NULL,
  `count_of_sells_tavel_package` int(11) DEFAULT NULL,
  `date_sale` date DEFAULT NULL,
  KEY `FK_sales_routes` (`code_route`),
  CONSTRAINT `FK_sales_routes` FOREIGN KEY (`code_route`) REFERENCES `routes` (`code_route`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `sales` (`code_route`, `purpose_of_the_travel`, `cost_travel_package`, `count_of_sells_tavel_package`, `date_sale`) VALUES
	(2, 'excursion', 200.00, 20, '2022-01-31'),
	(3, 'healing', 300.00, 30, '2022-01-31'),
	(3, 'shop tour', 400.00, 40, '2022-01-31'),
	(5, 'training', 500.00, 50, '2022-01-31'),
	(1, 'relax', 100.00, 10, '2022-01-31');

