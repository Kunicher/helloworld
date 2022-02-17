CREATE DATABASE IF NOT EXISTS `diploma_projects`;
USE `diploma_projects`;

CREATE TABLE IF NOT EXISTS `students` (
  `NumberTestBook` int(11) NOT NULL AUTO_INCREMENT,
  `FullnameStudent` text NOT NULL,
  `Faculty` text NOT NULL,
  `Group` text NOT NULL,
  PRIMARY KEY (`NumberTestBook`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

INSERT INTO `students` (`NumberTestBook`, `FullnameStudent`, `Faculty`, `Group`) VALUES
	(1, 'Name1', 'Fac1', 'Gr1'),
	(2, 'Name2', 'Fac2', 'Gr2'),
	(3, 'Name3', 'Fac3', 'Gr3'),
	(4, 'Name4', 'Fac4', 'Gr4'),
	(5, 'Name5', 'Fac5', 'Gr5');

CREATE TABLE IF NOT EXISTS `teachers` (
  `CodeTeacher` int(11) NOT NULL,
  `FullnameTeacher` text NOT NULL,
  `Degree` text NOT NULL,
  `Department` text NOT NULL,
  `Telephone` text NOT NULL,
  `EMail` text NOT NULL,
  PRIMARY KEY (`CodeTeacher`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO `teachers` (`CodeTeacher`, `FullnameTeacher`, `Degree`, `Department`, `Telephone`, `EMail`) VALUES
	(1, 'Name1', 'Deg1', 'Dep1', '+1', 'Mail1'),
	(2, 'Name2', 'Deg2', 'Dep2', '+2', 'Mail2'),
	(3, 'Name3', 'Deg3', 'Dep3', '+3', 'Mail3'),
	(4, 'Name4', 'Deg4', 'Dep4', '+4', 'Mail4');

CREATE TABLE IF NOT EXISTS `topics` (
  `CodeTeacher` int(11) NOT NULL,
  `TopicDoploma` text NOT NULL,
  `NumberTestBook` int(11) NOT NULL,
  KEY `FK_topics_teachers` (`CodeTeacher`),
  KEY `FK_topics_students` (`NumberTestBook`),
  CONSTRAINT `FK_topics_students` FOREIGN KEY (`NumberTestBook`) REFERENCES `students` (`NumberTestBook`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_topics_teachers` FOREIGN KEY (`CodeTeacher`) REFERENCES `teachers` (`CodeTeacher`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `topics` (`CodeTeacher`, `TopicDoploma`, `NumberTestBook`) VALUES
	(1, 'Top1', 1),
	(2, 'Top2', 2),
	(3, 'Top3', 3),
	(3, 'Top4', 4),
	(2, 'Top5', 5);

CREATE TABLE IF NOT EXISTS `marks` (
  `NumberTestBook` int(11) NOT NULL,
  `MarkExam` int(11) NOT NULL,
  `MarkDiploma` int(11) NOT NULL,
  PRIMARY KEY (`NumberTestBook`),
  CONSTRAINT `FK__students` FOREIGN KEY (`NumberTestBook`) REFERENCES `students` (`NumberTestBook`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `marks` (`NumberTestBook`, `MarkExam`, `MarkDiploma`) VALUES
	(1, 5, 4),
	(2, 5, 5),
	(3, 4, 5),
	(4, 3, 4),
	(5, 4, 5);