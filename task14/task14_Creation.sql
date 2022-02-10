CREATE DATABASE IF NOT EXISTS `catering`;
USE `catering`;

CREATE TABLE IF NOT EXISTS `products` (
  `CodeProduct` int(11) NOT NULL,
  `NameProduct` text NOT NULL,
  `Calorie` decimal(10,2) NOT NULL,
  `WeightProduct` decimal(10,2) NOT NULL,
  `Price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`CodeProduct`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `dishes` (
  `DishNumber` int(11) NOT NULL,
  `NameDish` text NOT NULL,
  `TypeDish` text NOT NULL,
  `WeightPortion` decimal(10,2) NOT NULL DEFAULT 0.00,
  `PictureDish` text NOT NULL,
  PRIMARY KEY (`DishNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `recipes` (
  `NumberDish` int(11) NOT NULL,
  `TimeCooking` text NOT NULL,
  `CookingTechnology` text NOT NULL,
  KEY `FK_recipes_dishes` (`NumberDish`),
  CONSTRAINT `FK_recipes_dishes` FOREIGN KEY (`NumberDish`) REFERENCES `dishes` (`DishNumber`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE IF NOT EXISTS `cooking` (
  `DishNumber` int(11) NOT NULL,
  `CountPortion` int(11) NOT NULL,
  `Date` date NOT NULL,
  KEY `FK_cooking_dishes` (`DishNumber`),
  CONSTRAINT `FK_cooking_dishes` FOREIGN KEY (`DishNumber`) REFERENCES `dishes` (`DishNumber`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `dishpreparations` (
  `DishNumber` int(11) NOT NULL,
  `CodeProduct` int(11) NOT NULL,
  KEY `FK_dishpreparations_dishes` (`DishNumber`),
  KEY `FK_dishpreparations_products` (`CodeProduct`),
  CONSTRAINT `FK_dishpreparations_dishes` FOREIGN KEY (`DishNumber`) REFERENCES `dishes` (`DishNumber`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_dishpreparations_products` FOREIGN KEY (`CodeProduct`) REFERENCES `products` (`CodeProduct`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
