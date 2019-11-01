-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.5.12


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema onlinepaper
--

CREATE DATABASE IF NOT EXISTS onlinepaper;
USE onlinepaper;

--
-- Definition of table `operator`
--

DROP TABLE IF EXISTS `operator`;
CREATE TABLE `operator` (
  `optID` varchar(10) NOT NULL COMMENT '登录帐号',
  `optName` varchar(10) DEFAULT NULL COMMENT '登录用户名',
  `password` varchar(10) DEFAULT NULL COMMENT '密码',
  `isExpired` tinyint(1) DEFAULT NULL COMMENT '是否过期',
  `isAdmin` tinyint(1) DEFAULT NULL COMMENT '是否管理员',
  PRIMARY KEY (`optID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='操作人员';

--
-- Dumping data for table `operator`
--

/*!40000 ALTER TABLE `operator` DISABLE KEYS */;
INSERT INTO `operator` (`optID`,`optName`,`password`,`isExpired`,`isAdmin`) VALUES 
 ('A0030',NULL,'111111',1,1),
 ('A1111',NULL,'111',NULL,1),
 ('S1111',NULL,'111',NULL,0),
 ('S2222',NULL,'222',NULL,1),
 ('S3333',NULL,'333',NULL,1),
 ('S5555',NULL,'555',NULL,0),
 ('S6666',NULL,'666',NULL,0);
/*!40000 ALTER TABLE `operator` ENABLE KEYS */;


--
-- Definition of table `paper`
--

DROP TABLE IF EXISTS `paper`;
CREATE TABLE `paper` (
  `paperID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `fullScore` int(11) DEFAULT NULL COMMENT '满分',
  `paperTime` datetime DEFAULT NULL COMMENT '考试时间',
  `validateTime` datetime DEFAULT NULL,
  `paperName` varchar(45) NOT NULL COMMENT '试卷名称',
  `byUser` varchar(45) NOT NULL COMMENT '出卷人',
  PRIMARY KEY (`paperID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='试卷主体信息';

--
-- Dumping data for table `paper`
--

/*!40000 ALTER TABLE `paper` DISABLE KEYS */;
INSERT INTO `paper` (`paperID`,`fullScore`,`paperTime`,`validateTime`,`paperName`,`byUser`) VALUES 
 (2,12,NULL,NULL,'bbbbb','232'),
 (3,5,NULL,NULL,'sdfadsf','asdf'),
 (4,34,NULL,NULL,'3434','3434');
/*!40000 ALTER TABLE `paper` ENABLE KEYS */;


--
-- Definition of table `paperdetail`
--

DROP TABLE IF EXISTS `paperdetail`;
CREATE TABLE `paperdetail` (
  `paperDetailID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `paperID` int(11) DEFAULT NULL COMMENT '试卷ID',
  `questID` int(11) DEFAULT NULL COMMENT '题库ID',
  `validFlag` tinyint(1) DEFAULT NULL COMMENT '是否有效',
  PRIMARY KEY (`paperDetailID`),
  KEY `FK_Reference_3` (`paperID`),
  KEY `FK_paperdetail_2` (`questID`),
  CONSTRAINT `FK_paperdetail_2` FOREIGN KEY (`questID`) REFERENCES `question` (`questID`),
  CONSTRAINT `FK_Reference_3` FOREIGN KEY (`paperID`) REFERENCES `paper` (`paperID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='试卷明细信息';

--
-- Dumping data for table `paperdetail`
--

/*!40000 ALTER TABLE `paperdetail` DISABLE KEYS */;
INSERT INTO `paperdetail` (`paperDetailID`,`paperID`,`questID`,`validFlag`) VALUES 
 (4,2,6,NULL),
 (5,2,1,NULL),
 (6,2,7,NULL),
 (7,2,9,NULL),
 (8,2,8,NULL),
 (9,2,2,NULL),
 (10,3,2,NULL),
 (11,3,7,NULL),
 (12,3,6,NULL),
 (13,3,1,NULL);
/*!40000 ALTER TABLE `paperdetail` ENABLE KEYS */;


--
-- Definition of table `question`
--

DROP TABLE IF EXISTS `question`;
CREATE TABLE `question` (
  `questID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `type` varchar(2) DEFAULT NULL COMMENT '题型',
  `mainContent` varchar(100) DEFAULT NULL COMMENT '题干',
  `score` int(11) DEFAULT NULL COMMENT '所占分',
  `easyLevel` varchar(2) DEFAULT NULL COMMENT '难易程度',
  `answer` varchar(10) DEFAULT NULL COMMENT '答案',
  PRIMARY KEY (`questID`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='题库主体信息';

--
-- Dumping data for table `question`
--

/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` (`questID`,`type`,`mainContent`,`score`,`easyLevel`,`answer`) VALUES 
 (1,NULL,'ccccccccc',2,'02','B'),
 (2,NULL,'xxxxxx',2,'02','B, C'),
 (6,NULL,'ppppp',6,'03','C'),
 (7,NULL,'tttttttttttttttt',3,'01','B, C'),
 (8,NULL,'jjjjjjjjjjj',6,'03','B, C, D'),
 (9,NULL,'qqqqqqqq',6,'01','C'),
 (10,NULL,'bbbbbbbbbbbbb',3,'01','B, C'),
 (11,NULL,'qwqweqweqe',3,'01','C'),
 (12,NULL,'asfda',2,'01','B'),
 (13,NULL,'sdafa',12,'01','B'),
 (14,NULL,'sdadf',2,'01','B'),
 (15,NULL,'asaf',5,'01','B'),
 (16,NULL,'aerfadf',6,'01','B'),
 (17,NULL,'agfasdf',5,'01','B'),
 (18,NULL,'htadf',5,'01','B'),
 (19,NULL,'sdfa',5,'01','B'),
 (20,NULL,'gfasdf',5,'01','C'),
 (21,NULL,'asdfad',5,'01','B'),
 (22,NULL,'asdfa',3,'01','B'),
 (23,NULL,'asdfa',3,'01','B'),
 (24,NULL,'jbjbjbjbjbjbjbjbjbjbjbjbjb',2,'01','B, C, D');
/*!40000 ALTER TABLE `question` ENABLE KEYS */;


--
-- Definition of table `questiondetail`
--

DROP TABLE IF EXISTS `questiondetail`;
CREATE TABLE `questiondetail` (
  `questDetailID` int(11) NOT NULL AUTO_INCREMENT,
  `optionNo` varchar(2) DEFAULT NULL,
  `optionContent` varchar(100) DEFAULT NULL,
  `questID` int(11) DEFAULT NULL,
  PRIMARY KEY (`questDetailID`),
  KEY `FK_Reference_2` (`questID`),
  CONSTRAINT `FK_Reference_2` FOREIGN KEY (`questID`) REFERENCES `question` (`questID`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8 COMMENT='题库明细信息';

--
-- Dumping data for table `questiondetail`
--

/*!40000 ALTER TABLE `questiondetail` DISABLE KEYS */;
INSERT INTO `questiondetail` (`questDetailID`,`optionNo`,`optionContent`,`questID`) VALUES 
 (1,'C','cc',1),
 (2,'D','dd',1),
 (3,'B','cc',1),
 (4,'A','bb',1),
 (5,'B','xxxxxx',2),
 (6,'D','xxxx',2),
 (7,'A','xxxxxxx',2),
 (8,'C','xxxx',2),
 (21,'D','ppp',6),
 (22,'B','pppp',6),
 (23,'A','ppppp',6),
 (24,'C','ppp',6),
 (25,'B','ttttttttt',7),
 (26,'D','tttttt',7),
 (27,'C','ttttttt',7),
 (28,'A','tttttttttttt',7),
 (29,'B','jjjjj',8),
 (30,'A','jjjjj',8),
 (31,'D','j',8),
 (32,'C','jjjjjjjj',8),
 (33,'D','qqqqqqq',9),
 (34,'A','qqqqqqqq',9),
 (35,'B','qqqqqqqqq',9),
 (36,'C','qqqqqqqqqqq',9),
 (37,'A','xccxc',10),
 (38,'D','cxcx',10),
 (39,'B','xcxcxc',10),
 (40,'C','x',10),
 (41,'D','weqewqwe',11),
 (42,'B','qweq',11),
 (43,'A','qweqwe',11),
 (44,'C','weqewq',11),
 (45,'B','sfdadfa',12),
 (46,'C','dfadf',12),
 (47,'D','asdfadf',12),
 (48,'A','sfdasdfa',12),
 (49,'B','asdfa',13),
 (50,'D','adfasdf',13),
 (51,'C','sdfasdf',13),
 (52,'A','sdfasdf',13),
 (53,'A','adfa',14),
 (54,'B','fdadf',14),
 (55,'C','adfa',14),
 (56,'D','sdfafdaf',14),
 (57,'A','asdfa',15),
 (58,'B','dfadf',15),
 (59,'C','adsfa',15),
 (60,'D','sdfasdf',15),
 (61,'C','sdfasdf',16),
 (62,'A','sdfa',16),
 (63,'D','asdfadf',16),
 (64,'B','sdfa',16),
 (65,'A','asdf',17),
 (66,'B','asdf',17),
 (67,'D','sdfadf',17),
 (68,'C','asdfa',17),
 (69,'D','sdfasdf',18),
 (70,'C','sdfa',18),
 (71,'A','asdf',18),
 (72,'B','asdfa',18),
 (73,'D','fadsfasdf',19),
 (74,'C','asdfasd',19),
 (75,'A','sdfasdf',19),
 (76,'B','asdf',19),
 (77,'B','sdfa',20),
 (78,'D','asdf',20),
 (79,'A','asdfa',20),
 (80,'C','sdfadf',20),
 (81,'C','dfasdf',21),
 (82,'D','adsfaf',21),
 (83,'B','asdfa',21),
 (84,'A','fasdfa',21),
 (85,'B','asdf',22),
 (86,'D','sdfasdfadf',22),
 (87,'A','dfasdf',22),
 (88,'C','asdfa',22),
 (89,'B','asdf',23),
 (90,'C','asdfa',23),
 (91,'D','sdfasdf',23),
 (92,'A','sdfasdf',23);
/*!40000 ALTER TABLE `questiondetail` ENABLE KEYS */;


--
-- Definition of table `studentinfo`
--

DROP TABLE IF EXISTS `studentinfo`;
CREATE TABLE `studentinfo` (
  `stdID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(15) DEFAULT NULL COMMENT '学生姓名',
  `age` int(11) DEFAULT NULL COMMENT '学生年龄',
  `sex` int(11) DEFAULT NULL COMMENT '性别',
  `grade` varchar(10) DEFAULT NULL COMMENT '年级',
  `teacher` varchar(15) DEFAULT NULL COMMENT '老师',
  `optID` varchar(10) DEFAULT NULL COMMENT '操作员帐号',
  PRIMARY KEY (`stdID`),
  KEY `FK_Reference_1` (`optID`),
  CONSTRAINT `FK_Reference_1` FOREIGN KEY (`optID`) REFERENCES `operator` (`optID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='学生信息';

--
-- Dumping data for table `studentinfo`
--

/*!40000 ALTER TABLE `studentinfo` DISABLE KEYS */;
INSERT INTO `studentinfo` (`stdID`,`name`,`age`,`sex`,`grade`,`teacher`,`optID`) VALUES 
 (1,'alice',13,1,'3','teacZhang','A0030'),
 (15,'sdad',NULL,1,'fsadf','asdf','A1111'),
 (16,'asddf',NULL,0,'5','asdf','S1111'),
 (17,'ÖÜÇà',NULL,1,'5','»ÆÀÏÊ¦','S2222'),
 (18,'??',NULL,0,'3','???','S3333'),
 (19,'???',NULL,1,'3','?????','S5555'),
 (20,'???',NULL,0,'3','???','S6666');
/*!40000 ALTER TABLE `studentinfo` ENABLE KEYS */;


--
-- Definition of table `studscore`
--

DROP TABLE IF EXISTS `studscore`;
CREATE TABLE `studscore` (
  `studScoreID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `paperID` int(11) DEFAULT NULL COMMENT '试卷ID',
  `score` int(11) DEFAULT NULL COMMENT '总分',
  `stdID` int(11) DEFAULT NULL COMMENT '学生',
  PRIMARY KEY (`studScoreID`),
  KEY `FK_studscore_1` (`paperID`),
  KEY `FK_studscore_2` (`stdID`),
  CONSTRAINT `FK_studscore_1` FOREIGN KEY (`paperID`) REFERENCES `paper` (`paperID`),
  CONSTRAINT `FK_studscore_2` FOREIGN KEY (`stdID`) REFERENCES `studentinfo` (`stdID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='学生考试成绩';

--
-- Dumping data for table `studscore`
--

/*!40000 ALTER TABLE `studscore` DISABLE KEYS */;
INSERT INTO `studscore` (`studScoreID`,`paperID`,`score`,`stdID`) VALUES 
 (14,3,2,1);
/*!40000 ALTER TABLE `studscore` ENABLE KEYS */;


--
-- Definition of table `studscoredetail`
--

DROP TABLE IF EXISTS `studscoredetail`;
CREATE TABLE `studscoredetail` (
  `studscoreDetailID` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `studScoreID` int(11) NOT NULL COMMENT '考试ID',
  `paperDetailID` int(11) NOT NULL COMMENT '考试题ID号',
  `answer` varchar(15) DEFAULT NULL COMMENT '考生答案',
  `scoreForID` int(11) DEFAULT NULL COMMENT '单题得分',
  `flag` int(10) unsigned DEFAULT NULL COMMENT '对错标记',
  `correctAnswer` varchar(15) DEFAULT NULL COMMENT '正确答案',
  `correctScore` int(10) unsigned DEFAULT NULL COMMENT '正确满分',
  PRIMARY KEY (`studscoreDetailID`),
  KEY `FK_studscoreDetail_1` (`studScoreID`),
  KEY `FK_studscoreDetail_2` (`paperDetailID`),
  CONSTRAINT `FK_studscoreDetail_1` FOREIGN KEY (`studScoreID`) REFERENCES `studscore` (`studScoreID`),
  CONSTRAINT `FK_studscoreDetail_2` FOREIGN KEY (`paperDetailID`) REFERENCES `paperdetail` (`paperDetailID`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `studscoredetail`
--

/*!40000 ALTER TABLE `studscoredetail` DISABLE KEYS */;
INSERT INTO `studscoredetail` (`studscoreDetailID`,`studScoreID`,`paperDetailID`,`answer`,`scoreForID`,`flag`,`correctAnswer`,`correctScore`) VALUES 
 (49,14,13,'BCD',0,0,'B',2),
 (50,14,11,'ABC',0,0,'BC',3),
 (51,14,10,'BC',2,1,'BC',2),
 (52,14,12,'CD',0,0,'C',6);
/*!40000 ALTER TABLE `studscoredetail` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
