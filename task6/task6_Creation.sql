CREATE DATABASE IF NOT EXISTS `travel_agency`;
USE `travel_agency`;

CREATE TABLE IF NOT EXISTS `countries` (
  `code_country` int(11) NOT NULL,
  `name_conntry` text DEFAULT NULL,
  `price_VISA` decimal(10,0) DEFAULT NULL,
  KEY `code_country` (`code_country`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `routes` (
  `code_country` int(11) NOT NULL,
  `code_route` int(11) NOT NULL,
  `name_route` text DEFAULT NULL,
  KEY `code_route` (`code_route`),
  KEY `FK_routes_countries` (`code_country`),
  CONSTRAINT `FK_routes_countries` FOREIGN KEY (`code_country`) REFERENCES `countries` (`code_country`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE IF NOT EXISTS `sales` (
  `code_route` int(11) NOT NULL,
  `purpose_of_the_travel` text DEFAULT NULL,
  `cost_travel_package` decimal(10,0) DEFAULT NULL,
  `count_of_sells_tavel_package` int(11) DEFAULT NULL,
  `date_sale` date DEFAULT NULL,
  KEY `FK_sales_routes` (`code_route`),
  CONSTRAINT `FK_sales_routes` FOREIGN KEY (`code_route`) REFERENCES `routes` (`code_route`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
