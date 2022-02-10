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

INSERT INTO `products` (`CodeProduct`, `NameProduct`, `Calorie`, `WeightProduct`, `Price`) VALUES
	(1, 'Name1', 100.00, 100.00, 100.00),
	(2, 'Name2', 200.00, 200.00, 200.00),
	(3, 'Name3', 300.00, 300.00, 300.00),
	(4, 'Name4', 400.00, 400.00, 400.00),
	(5, 'Name5', 500.00, 500.00, 500.00);

CREATE TABLE IF NOT EXISTS `dishes` (
  `DishNumber` int(11) NOT NULL,
  `NameDish` text NOT NULL,
  `TypeDish` text NOT NULL,
  `WeightPortion` decimal(10,2) NOT NULL DEFAULT 0.00,
  `PictureDish` text NOT NULL,
  PRIMARY KEY (`DishNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `dishes` (`DishNumber`, `NameDish`, `TypeDish`, `WeightPortion`, `PictureDish`) VALUES
	(1, 'Name1', 'Type1', 100.00, 'Pict'),
	(2, 'Name2', 'Type2', 200.00, 'Pict'),
	(3, 'Name3', 'Type3', 300.00, 'Pict'),
	(4, 'Name4', 'Type4', 400.00, 'Pict');

CREATE TABLE IF NOT EXISTS `dishpreparations` (
  `DishNumber` int(11) NOT NULL,
  `CodeProduct` int(11) NOT NULL,
  KEY `FK_dishpreparations_dishes` (`DishNumber`),
  KEY `FK_dishpreparations_products` (`CodeProduct`),
  CONSTRAINT `FK_dishpreparations_dishes` FOREIGN KEY (`DishNumber`) REFERENCES `dishes` (`DishNumber`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_dishpreparations_products` FOREIGN KEY (`CodeProduct`) REFERENCES `products` (`CodeProduct`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `dishpreparations` (`DishNumber`, `CodeProduct`) VALUES
	(1, 1),
	(1, 2),
	(2, 2),
	(3, 3),
	(3, 2);


CREATE TABLE IF NOT EXISTS `recipes` (
  `NumberDish` int(11) NOT NULL,
  `TimeCooking` text NOT NULL,
  `CookingTechnology` text NOT NULL,
  KEY `FK_recipes_dishes` (`NumberDish`),
  CONSTRAINT `FK_recipes_dishes` FOREIGN KEY (`NumberDish`) REFERENCES `dishes` (`DishNumber`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `recipes` (`NumberDish`, `TimeCooking`, `CookingTechnology`) VALUES
	(2, '20 minutes', 'Tech4'),
	(3, '30 minutes', 'Tech3'),
	(4, '40 minutes', 'Tech2'),
	(1, '10 minutes', 'Tech1');
CREATE TABLE IF NOT EXISTS `cooking` (
  `DishNumber` int(11) NOT NULL,
  `CountPortion` int(11) NOT NULL,
  `Date` date NOT NULL,
  KEY `FK_cooking_dishes` (`DishNumber`),
  CONSTRAINT `FK_cooking_dishes` FOREIGN KEY (`DishNumber`) REFERENCES `dishes` (`DishNumber`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `cooking` (`DishNumber`, `CountPortion`, `Date`) VALUES
	(1, 10, '2022-02-10'),
	(2, 20, '2022-02-10'),
	(3, 30, '2022-02-10'),
	(2, 10, '2022-02-09'),
	(4, 15, '2022-02-09');
