/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50540
Source Host           : localhost:3306
Source Database       : humanresourcesystem

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2018-12-06 16:15:33
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for checkin
-- ----------------------------
DROP TABLE IF EXISTS `checkin`;
CREATE TABLE `checkin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `checkdate` varchar(255) DEFAULT NULL COMMENT '考察月份',
  `qqdays` int(11) DEFAULT NULL COMMENT '全勤天数',
  `qjdays` int(11) DEFAULT NULL COMMENT '请假天数',
  `kgdays` int(11) DEFAULT NULL COMMENT '旷工天数',
  `fdxjdays` int(11) DEFAULT NULL COMMENT '法定节假日',
  `cdminutes` int(11) DEFAULT NULL COMMENT '迟到分钟数',
  `ztminutes` int(11) DEFAULT NULL COMMENT '早退分钟数',
  `eid` int(11) DEFAULT NULL COMMENT '一对多',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of checkin
-- ----------------------------

-- ----------------------------
-- Table structure for contract
-- ----------------------------
DROP TABLE IF EXISTS `contract`;
CREATE TABLE `contract` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `cname` varchar(255) DEFAULT NULL,
  `begindate` varchar(255) DEFAULT NULL,
  `enddate` varchar(255) DEFAULT NULL,
  `eid` int(11) DEFAULT NULL COMMENT '一对多',
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of contract
-- ----------------------------

-- ----------------------------
-- Table structure for departments
-- ----------------------------
DROP TABLE IF EXISTS `departments`;
CREATE TABLE `departments` (
  `did` int(11) NOT NULL AUTO_INCREMENT,
  `dname` varchar(50) DEFAULT NULL COMMENT '部门名称',
  `upperno` varchar(50) DEFAULT NULL COMMENT '上级部门编号',
  `mobile` varchar(255) DEFAULT NULL COMMENT '电话',
  PRIMARY KEY (`did`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of departments
-- ----------------------------
INSERT INTO `departments` VALUES ('1', '行政部', '无', '17803477175');
INSERT INTO `departments` VALUES ('2', '财务部', '行政部', '17803477176');
INSERT INTO `departments` VALUES ('3', '策划部', '无', '17803477177');
INSERT INTO `departments` VALUES ('4', '研发部', '无', '17803477178');
INSERT INTO `departments` VALUES ('5', '公关部', '无', '17803477179');
INSERT INTO `departments` VALUES ('6', '市场部', '无', '17803477180');
INSERT INTO `departments` VALUES ('7', '人事部', '行政部', '17803477181');
INSERT INTO `departments` VALUES ('8', 'java开发', '研发部', '17803477182');
INSERT INTO `departments` VALUES ('9', 'web开发', '研发部', '17803477183');
INSERT INTO `departments` VALUES ('10', '程序测试', '研发部', '17803477184');

-- ----------------------------
-- Table structure for employees
-- ----------------------------
DROP TABLE IF EXISTS `employees`;
CREATE TABLE `employees` (
  `eid` int(11) NOT NULL AUTO_INCREMENT COMMENT '自动自增',
  `eno` varchar(50) DEFAULT NULL COMMENT '员工编号',
  `ename` varchar(50) DEFAULT NULL COMMENT '员工姓名',
  `esex` varchar(10) DEFAULT NULL COMMENT '性别',
  `nationality` varchar(50) DEFAULT NULL COMMENT '民族',
  `brity` varchar(255) DEFAULT NULL COMMENT '出生日期',
  `political_party` varchar(50) DEFAULT NULL COMMENT '政治面貌',
  `culture_level` varchar(255) DEFAULT NULL COMMENT '文化程度',
  `family_place` varchar(255) DEFAULT NULL COMMENT '籍贯',
  `id_card` varchar(255) DEFAULT NULL COMMENT '身份证号',
  `mobile` varchar(255) DEFAULT NULL COMMENT '手机号码',
  `hiredate` varchar(255) DEFAULT NULL COMMENT '到岗日期',
  `title` varchar(255) DEFAULT NULL COMMENT '职务',
  `upperno` varchar(50) DEFAULT NULL COMMENT '上级员工编号',
  `did` int(11) DEFAULT NULL COMMENT '部门外键',
  `uid` int(11) DEFAULT NULL,
  `cid` int(11) DEFAULT NULL,
  PRIMARY KEY (`eid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of employees
-- ----------------------------
INSERT INTO `employees` VALUES ('1', '1-1', 'a', '男', '汉', '1995-11', '团员', '本科', '太原', '140111199512121212', '18234078451', '2016-07', '职员', null, '1', '1', '1');
INSERT INTO `employees` VALUES ('2', '2-1', 'b', '男', '汉', '1996-04', '群众', '本科', '长治', '140111199512121212', '18234078451', '2016-08', '超级管理员', '', '2', '2', '2');
INSERT INTO `employees` VALUES ('4', '8-1', 'c', '男', '汉', '1996-10', '党员', '博士后', '山西省临汾市', '140111199512121212', '18234078451', '2016-12-30', '职员', '研发部', '8', '4', '3');
INSERT INTO `employees` VALUES ('5', '9-1', 'd', '男', '汉', '1993-04', '团员', '本科', '山西省吕梁市', '140111199512121212', '18234078451', '2016-12-30', '职员', '研发部', '9', '5', '4');
INSERT INTO `employees` VALUES ('6', '5-1', 'e', '男', '汉', '1996-05', '团员', '本科', '山西省临汾市', '140111199512121212', '18234078451', '2016-11-29', '职员', '无', '5', '6', '5');
INSERT INTO `employees` VALUES ('7', '10-1', 'f', '男', '汉', '1995-09', '团员', '本科', '山西省吕梁市', '140111199512121212', '18234078451', '2016-11-29', '职员', '研发部', '10', '7', '6');

-- ----------------------------
-- Table structure for leave
-- ----------------------------
DROP TABLE IF EXISTS `leave`;
CREATE TABLE `leave` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '姓名',
  `daynumber` int(11) DEFAULT NULL COMMENT '请假天数',
  `fromday` varchar(255) DEFAULT NULL COMMENT '开始日期',
  `today` varchar(255) DEFAULT NULL COMMENT '结束日期',
  `because` varchar(255) DEFAULT NULL COMMENT '理由',
  `departmentid` int(11) DEFAULT NULL COMMENT '部门号',
  `eno` varchar(11) DEFAULT NULL COMMENT '一对多',
  `state` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of leave
-- ----------------------------
INSERT INTO `leave` VALUES ('3', 'a', '3', '2017-11-18', '2017-11-21', '事假', '1', '1-1', '已审核');
INSERT INTO `leave` VALUES ('4', 'c', '2', '2017-11-21', '2017-11-23', '事假\r\n', '8', '8-1', '已审核');

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `mid` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `main` int(11) DEFAULT NULL,
  `index` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `usertype` int(11) DEFAULT NULL,
  PRIMARY KEY (`mid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('1', '系统管理员', '0', '1', null, '/manage', '1');
INSERT INTO `menu` VALUES ('2', '部门组织管理', '0', '2', null, '/department', '3');
INSERT INTO `menu` VALUES ('3', '人事档案管理', '0', '3', null, '/employees', '3');
INSERT INTO `menu` VALUES ('4', '薪资管理', '0', '4', null, '/money', '3');
INSERT INTO `menu` VALUES ('5', '奖惩管理', '0', '5', null, '/rap', '1');
INSERT INTO `menu` VALUES ('6', '请假记录管理', '0', '6', null, '/checkin', '3');
INSERT INTO `menu` VALUES ('7', '合同管理', '0', '7', null, '/contract', '3');
INSERT INTO `menu` VALUES ('8', '部门添加', '1', '1', '2', '/department/add', '1');
INSERT INTO `menu` VALUES ('9', '部门查询', '1', '2', '2', '/department/search', '3');
INSERT INTO `menu` VALUES ('10', '人员添加', '1', '1', '3', '/employees/add', '1');
INSERT INTO `menu` VALUES ('11', '人员查询', '1', '2', '3', '/employees/search', '3');
INSERT INTO `menu` VALUES ('12', '请假信息', '1', '1', '6', '/checkin/leave', '1');
INSERT INTO `menu` VALUES ('14', '请假表', '1', '3', '6', '/checkin/form', '3');
INSERT INTO `menu` VALUES ('15', '薪资详情', '1', '1', '4', '/money/show', '3');
INSERT INTO `menu` VALUES ('16', '合同详情', '1', '1', '7', '/contract/look', '3');
INSERT INTO `menu` VALUES ('17', '奖罚信息', '1', '1', '5', '/rap/show', '1');

-- ----------------------------
-- Table structure for money
-- ----------------------------
DROP TABLE IF EXISTS `money`;
CREATE TABLE `money` (
  `mid` int(11) NOT NULL AUTO_INCREMENT,
  `basemoney` decimal(20,2) DEFAULT NULL COMMENT '基本工资',
  `month` varchar(20) DEFAULT NULL COMMENT '月',
  `Work_overtime` decimal(20,2) DEFAULT NULL COMMENT '加班钱',
  `subsidization` decimal(20,2) DEFAULT NULL COMMENT '各种补助总和',
  `reality_money` decimal(20,2) DEFAULT NULL COMMENT '实际收入',
  `qqmoney` decimal(20,2) DEFAULT NULL COMMENT '全勤奖',
  `payment` decimal(20,2) DEFAULT NULL COMMENT '个人纳税',
  `rapall` decimal(20,2) DEFAULT NULL COMMENT '奖罚总和',
  `state` int(11) DEFAULT NULL COMMENT '状态',
  `eid` int(11) DEFAULT NULL COMMENT '员工外键  一对多对应',
  PRIMARY KEY (`mid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of money
-- ----------------------------
INSERT INTO `money` VALUES ('1', '3000.00', '2017-11', '100.00', '100.00', '3600.00', '0.00', '0.00', '400.00', '1', '1');
INSERT INTO `money` VALUES ('2', '5000.00', '2017-12', '300.00', '200.00', '5905.00', '0.00', '95.00', '500.00', '0', '1');
INSERT INTO `money` VALUES ('5', '5000.00', '2017-09', '200.00', '220.00', '5377.40', '0.00', '42.60', '0.00', '0', '1');

-- ----------------------------
-- Table structure for reward_and_punish
-- ----------------------------
DROP TABLE IF EXISTS `reward_and_punish`;
CREATE TABLE `reward_and_punish` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `month` varchar(255) DEFAULT NULL COMMENT '日期',
  `reward` decimal(6,2) DEFAULT NULL COMMENT '奖励',
  `punishment` decimal(6,2) DEFAULT NULL COMMENT '惩罚',
  `because` varchar(255) DEFAULT NULL COMMENT '原因',
  `eid` int(11) DEFAULT NULL COMMENT '一对多  ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of reward_and_punish
-- ----------------------------
INSERT INTO `reward_and_punish` VALUES ('1', '2017-11', '400.00', null, 'meiyouliyou', '1');
INSERT INTO `reward_and_punish` VALUES ('2', '2017-12 ', '600.00', null, 'meiyouliyou', '1');
INSERT INTO `reward_and_punish` VALUES ('5', '2017-12', null, '100.00', '事实上', '1');

-- ----------------------------
-- Table structure for tax
-- ----------------------------
DROP TABLE IF EXISTS `tax`;
CREATE TABLE `tax` (
  `tid` int(11) NOT NULL AUTO_INCREMENT,
  `frommoneny` int(11) DEFAULT NULL,
  `topmoney` int(11) DEFAULT NULL,
  `rate` float DEFAULT NULL,
  `reduce` int(11) DEFAULT NULL,
  PRIMARY KEY (`tid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tax
-- ----------------------------
INSERT INTO `tax` VALUES ('1', '-1', '1500', '0.03', '0');
INSERT INTO `tax` VALUES ('2', '1500', '4500', '0.1', '105');
INSERT INTO `tax` VALUES ('3', '4500', '9000', '0.2', '555');
INSERT INTO `tax` VALUES ('4', '9000', '35000', '0.25', '1005');
INSERT INTO `tax` VALUES ('5', '35000', '55000', '0.3', '2755');
INSERT INTO `tax` VALUES ('6', '55000', '80000', '0.35', '5505');
INSERT INTO `tax` VALUES ('7', '80000', null, '0.45', '13505');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `uno` varchar(255) DEFAULT NULL COMMENT '员工号',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `user_type` int(11) DEFAULT NULL COMMENT '权限',
  `eid` int(11) DEFAULT NULL COMMENT '一一对应',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'aa', 'oqGiG3w2C/s4l945xI++My4Wpv2cCyLi', '3', '1');
INSERT INTO `users` VALUES ('2', 'admin', 'hoIPI+1VeV3GFzJijYH9cQQzJwLy4WG+', '1', '2');
INSERT INTO `users` VALUES ('4', 'cc', 'oqGiG3w2C/s4l945xI++My4Wpv2cCyLi', '3', '4');
INSERT INTO `users` VALUES ('5', 'dd', 'oqGiG3w2C/s4l945xI++My4Wpv2cCyLi', '3', '5');
INSERT INTO `users` VALUES ('6', 'ee', 'oqGiG3w2C/s4l945xI++My4Wpv2cCyLi', '3', '6');
INSERT INTO `users` VALUES ('7', 'ff', 'oqGiG3w2C/s4l945xI++My4Wpv2cCyLi', '3', '7');
