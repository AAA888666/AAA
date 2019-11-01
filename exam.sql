/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : exam

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2019-09-20 10:58:37
*/

SET FOREIGN_KEY_CHECKS=0;
/*
创建库
*/
DROP DATABASE if exists exam ;
CREATE DATABASE exam default character set 'utf8';
use exam;
-- ----------------------------
-- Table structure for `exam`
-- ----------------------------
DROP TABLE IF EXISTS `exam`;
CREATE TABLE `exam` (
  `id` int(11) NOT NULL,
  ` student_id` int(11) DEFAULT NULL COMMENT '学生表id',
  ` singleChoice_id` int(11) DEFAULT NULL COMMENT '错误题号(单选题题号)id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of exam
-- ----------------------------

-- ----------------------------
-- Table structure for `examtype`
-- ----------------------------
DROP TABLE IF EXISTS `examtype`;
CREATE TABLE `examtype` (
  `id` int(11) NOT NULL,
  `examTypeName` varchar(255) DEFAULT '' COMMENT '考试类型名',
  `parentId` int(11) DEFAULT NULL COMMENT '父节点Id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of examtype
-- ----------------------------
INSERT INTO `examtype` VALUES ('1', '数学类型', null);
INSERT INTO `examtype` VALUES ('2', '后端类型', null);
INSERT INTO `examtype` VALUES ('3', '前端类型', null);
INSERT INTO `examtype` VALUES ('4', '语文类型', null);
INSERT INTO `examtype` VALUES ('5', '小学数学', '1');
INSERT INTO `examtype` VALUES ('6', '大学数学', '1');
INSERT INTO `examtype` VALUES ('7', 'Java基础', '2');
INSERT INTO `examtype` VALUES ('8', '面向对象', '2');
INSERT INTO `examtype` VALUES ('9', 'HTML', '3');
INSERT INTO `examtype` VALUES ('10', 'JS', '3');
INSERT INTO `examtype` VALUES ('11', '文言文', '4');
INSERT INTO `examtype` VALUES ('12', '古诗词', '4');

-- ----------------------------
-- Table structure for `examtype_singlechoice`
-- ----------------------------
DROP TABLE IF EXISTS `examtype_singlechoice`;
CREATE TABLE `examtype_singlechoice` (
  `id` int(11) NOT NULL,
  `examType_id` int(11) DEFAULT NULL,
  `singleChoice_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of examtype_singlechoice
-- ----------------------------
INSERT INTO `examtype_singlechoice` VALUES ('1', '1', '1');
INSERT INTO `examtype_singlechoice` VALUES ('2', '2', '1');

-- ----------------------------
-- Table structure for `score`
-- ----------------------------
DROP TABLE IF EXISTS `score`;
CREATE TABLE `score` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL COMMENT '学生id',
  `exam_id` int(11) NOT NULL,
  `student_name` varchar(20) NOT NULL DEFAULT '' COMMENT '学生姓名',
  `score` int(11) NOT NULL,
  `startTime` datetime NOT NULL COMMENT '考试开始时间',
  `endTime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of score
-- ----------------------------
INSERT INTO `score` VALUES ('1', '1', '0', '张三', '80', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `score` VALUES ('2', '2', '0', '李四', '60', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `score` VALUES ('3', '3', '0', '王五', '90', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `score` VALUES ('4', '1', '0', '张三', '88', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `score` VALUES ('5', '2', '0', '李四', '88', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `score` VALUES ('6', '3', '0', '王五', '80', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- ----------------------------
-- Table structure for `singlechoice`
-- ----------------------------
DROP TABLE IF EXISTS `singlechoice`;
CREATE TABLE `singlechoice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) DEFAULT '' COMMENT '题目',
  `choiceA` varchar(255) DEFAULT '' COMMENT '选项',
  `choiceB` varchar(255) DEFAULT '' COMMENT '选项',
  `choiceC` varchar(255) DEFAULT '' COMMENT '选项',
  `choiceD` varchar(255) DEFAULT '' COMMENT '选项',
  `answer` varchar(255) DEFAULT '' COMMENT '标准答案',
  `examTypeName` varchar(255) DEFAULT '' COMMENT '考题类型名',
  `examType_id` int(11) NOT NULL COMMENT '考题类型id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=163 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of singlechoice
-- ----------------------------
INSERT INTO `singlechoice` VALUES ('1', '一加一等于?', 'A.2', 'B.1', 'C.3', 'D.4', 'A', ' 数学类型', '1');
INSERT INTO `singlechoice` VALUES ('2', '如果JDK的安装路径是\"d:\\jdk\"，若想在命令行窗口中任何路径下，都可以直接使用javac和java命令，\n需要将环境变量Path设置为以下哪个选项：（     ）', 'A. d:\\jdk', 'B. d:\\jdk\\bin', 'C. d:\\jre\\bin', 'D. d:\\jre', 'B', 'Java基础', '2');
INSERT INTO `singlechoice` VALUES ('3', '下面以哪种类型的文件可以直接在Java虚拟机中运行：（     ）。', 'A．.java', 'B．.jre', 'C．.exe', 'D．.class', 'D', 'Java基础', '2');
INSERT INTO `singlechoice` VALUES ('4', '下面哪个是合法的Java标识符：（      ）', 'A．void', 'B．12class', 'C．_blank', 'D．95', 'C', 'Java基础', '2');
INSERT INTO `singlechoice` VALUES ('5', 'Java中类的定义必须包含在一下哪种符号之间？（      ）', 'A. 方括号[ ]', 'B. 花括号{ }', 'C. 双引号\" \"', 'D. 圆括号( )', 'B', 'Java基础', '2');
INSERT INTO `singlechoice` VALUES ('6', 'Java的运算符中用于执行除法运算的是哪个？（      ）', 'A. /', 'B. \\', 'C. %', 'D. *', 'A', 'Java基础', '2');
INSERT INTO `singlechoice` VALUES ('7', '以下哪个关键字不是用于循环语句的？（      ）', 'A. for', 'B. do...while', 'C. while', 'D. switch', 'D', 'Java基础', '2');
INSERT INTO `singlechoice` VALUES ('8', ' 2的平方等于?', ' A.1', 'B.2', 'C.3', 'D.4', 'D', '数学基础', '1');
INSERT INTO `singlechoice` VALUES ('9', '假设i=10, j=20, k=30，则表达式 !(i<j+k) || !(i+10<=j) 的值为：（      ）', 'A.100', ' B.12', ' C.8', 'D.以上都不对', 'C', 'Java基础', '2');
INSERT INTO `singlechoice` VALUES ('162', '表达式2>3?4:5的值为：（      ）', 'A.2', 'B.3', ' C.4', ' D.5', 'D', 'Java基础', '2');

-- ----------------------------
-- Table structure for `student`
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '学生id',
  `name` varchar(100) NOT NULL COMMENT '学生姓名',
  `mobile` varchar(100) NOT NULL COMMENT '手机号码',
  `username` varchar(20) NOT NULL DEFAULT '' COMMENT '登录用户名',
  `password` varchar(20) DEFAULT NULL COMMENT '登录密码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('1', '张三', '111111', 'zhangsan', '123456');
INSERT INTO `student` VALUES ('2', '李四', '166444', 'lisi', '123456');
INSERT INTO `student` VALUES ('3', '王五', '45646645', 'wangwu', '123456');

-- ----------------------------
-- Table structure for `student_score`
-- ----------------------------
DROP TABLE IF EXISTS `student_score`;
CREATE TABLE `student_score` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL COMMENT '学生id',
  `score_id` int(11) NOT NULL COMMENT '成绩id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student_score
-- ----------------------------
INSERT INTO `student_score` VALUES ('1', '1', '1');
INSERT INTO `student_score` VALUES ('2', '1', '4');
INSERT INTO `student_score` VALUES ('3', '2', '2');
INSERT INTO `student_score` VALUES ('4', '2', '5');
INSERT INTO `student_score` VALUES ('5', '3', '3');
INSERT INTO `student_score` VALUES ('6', '3', '6');

-- ----------------------------
-- Table structure for `teacher`
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '教师ID',
  `name` varchar(100) NOT NULL COMMENT '教师名称/用户名',
  `mobile` varchar(100) NOT NULL,
  `username` varchar(20) NOT NULL COMMENT '登录账号',
  `password` varchar(16) DEFAULT NULL COMMENT '登录密码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('1', '王海涛', '11111111', 'wht', '123456');
INSERT INTO `teacher` VALUES ('2', '张慎政', '1213564645', 'zsz', '123456');
INSERT INTO `teacher` VALUES ('3', '齐雷', '1221353543', 'ql', '1223456');

-- ----------------------------
-- Table structure for `teacher_student`
-- ----------------------------
DROP TABLE IF EXISTS `teacher_student`;
CREATE TABLE `teacher_student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL COMMENT '学生id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacher_student
-- ----------------------------
INSERT INTO `teacher_student` VALUES ('1', '3', '1');
INSERT INTO `teacher_student` VALUES ('2', '1', '2');
INSERT INTO `teacher_student` VALUES ('3', '2', '3');
