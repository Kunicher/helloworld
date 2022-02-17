CREATE DATABASE IF NOT EXISTS `diploma_projects`;
USE `diploma_projects`;

CREATE TABLE IF NOT EXISTS `students` (
  `NumberTestBook` int(11) NOT NULL AUTO_INCREMENT,
  `FullnameStudent` text NOT NULL,
  `Faculty` text NOT NULL,
  `Group` text NOT NULL,
  PRIMARY KEY (`NumberTestBook`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `teachers` (
  `CodeTeacher` int(11) NOT NULL,
  `FullnameTeacher` text NOT NULL,
  `Degree` text NOT NULL,
  `Department` text NOT NULL,
  `Telephone` text NOT NULL,
  `EMail` text NOT NULL,
  PRIMARY KEY (`CodeTeacher`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `topics` (
  `CodeTeacher` int(11) NOT NULL,
  `TopicDoploma` text NOT NULL,
  `NumberTestBook` int(11) NOT NULL,
  KEY `FK_topics_teachers` (`CodeTeacher`),
  KEY `FK_topics_students` (`NumberTestBook`),
  CONSTRAINT `FK_topics_students` FOREIGN KEY (`NumberTestBook`) REFERENCES `students` (`NumberTestBook`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_topics_teachers` FOREIGN KEY (`CodeTeacher`) REFERENCES `teachers` (`CodeTeacher`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `marks` (
  `NumberTestBook` int(11) NOT NULL,
  `MarkExam` int(11) NOT NULL,
  `MarkDiploma` int(11) NOT NULL,
  PRIMARY KEY (`NumberTestBook`),
  CONSTRAINT `FK__students` FOREIGN KEY (`NumberTestBook`) REFERENCES `students` (`NumberTestBook`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;