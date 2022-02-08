CREATE DATABASE IF NOT EXISTS `trading`;
USE `trading`;


CREATE TABLE IF NOT EXISTS `departments` (
  `CodeDepartment` int(11) NOT NULL,
  `NameDepartment` text DEFAULT NULL,
  `FullNameManager` text NOT NULL,
  `Telephone` text NOT NULL,
  `SalesVolume` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`CodeDepartment`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `products` (
  `ArticleProduct` int(11) NOT NULL,
  `NameProduct` text DEFAULT NULL,
  `UnitOfMeasurement` text DEFAULT NULL,
  `RetailPrice` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`ArticleProduct`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE IF NOT EXISTS `sales` (
  `ArticleProduct` int(11) NOT NULL,
  `DateSale` date NOT NULL,
  `CountSales` int(11) NOT NULL,
  `CodeDepartments` int(11) NOT NULL,
  KEY `FK_sales_products` (`ArticleProduct`),
  KEY `FK_sales_departments` (`CodeDepartments`),
  CONSTRAINT `FK_sales_departments` FOREIGN KEY (`CodeDepartments`) REFERENCES `departments` (`CodeDepartment`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_sales_products` FOREIGN KEY (`ArticleProduct`) REFERENCES `products` (`ArticleProduct`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
