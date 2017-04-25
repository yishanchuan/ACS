/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50635
Source Host           : localhost:3306
Source Database       : acs

Target Server Type    : MYSQL
Target Server Version : 50635
File Encoding         : 65001

Date: 2017-04-13 13:28:35
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for accountingsubject
-- ----------------------------
DROP TABLE IF EXISTS `accountingsubject`;
CREATE TABLE `accountingsubject` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '会计科目',
  `balance` double DEFAULT '0',
  `dc` tinyint(1) DEFAULT '1',
  `name` varchar(16) DEFAULT NULL,
  `pid` int(11) DEFAULT '0',
  `status` tinyint(1) DEFAULT '1',
  `type` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=222100111 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of accountingsubject
-- ----------------------------
INSERT INTO `accountingsubject` VALUES ('1001', '0', '0', '库存现金', '0', '1', '资产');
INSERT INTO `accountingsubject` VALUES ('1002', '0', '0', '银行存款', '0', '1', '资产');
INSERT INTO `accountingsubject` VALUES ('1012', '0', '0', '其他货币资金', '0', '1', '资产');
INSERT INTO `accountingsubject` VALUES ('1101', '0', '0', '短期投资', '1101', '1', '资产');
INSERT INTO `accountingsubject` VALUES ('1121', '0', '0', '应收票据', '0', '1', '资产');
INSERT INTO `accountingsubject` VALUES ('1122', '0', '0', '应收账款', '0', '1', '资产');
INSERT INTO `accountingsubject` VALUES ('1123', '0', '0', '预付账款', '0', '1', '资产');
INSERT INTO `accountingsubject` VALUES ('1131', '0', '0', '应收股利', '0', '1', '资产');
INSERT INTO `accountingsubject` VALUES ('1132', '0', '0', '应收利息', '0', '1', '资产');
INSERT INTO `accountingsubject` VALUES ('1221', '0', '0', '其他应收款', '0', '1', '资产');
INSERT INTO `accountingsubject` VALUES ('1401', '0', '0', '材料采购', '0', '1', '资产');
INSERT INTO `accountingsubject` VALUES ('1402', '0', '0', '在途物资', '0', '1', '资产');
INSERT INTO `accountingsubject` VALUES ('1403', '0', '0', '原材料', '0', '1', '资产');
INSERT INTO `accountingsubject` VALUES ('1404', '0', '0', '材料成本差异', '0', '1', '资产');
INSERT INTO `accountingsubject` VALUES ('1405', '0', '0', '库存商品', '0', '1', '资产');
INSERT INTO `accountingsubject` VALUES ('1407', '0', '1', '商品进销差价', '0', '1', '资产');
INSERT INTO `accountingsubject` VALUES ('1408', '0', '0', '委托加工物资', '0', '1', '资产');
INSERT INTO `accountingsubject` VALUES ('1411', '0', '0', '周转材料', '0', '1', '资产');
INSERT INTO `accountingsubject` VALUES ('1421', '0', '0', '消耗性生物资产', '0', '1', '资产');
INSERT INTO `accountingsubject` VALUES ('1501', '0', '0', '长期债券投资', '0', '1', '资产');
INSERT INTO `accountingsubject` VALUES ('1511', '0', '0', '长期股权投资', '0', '1', '资产');
INSERT INTO `accountingsubject` VALUES ('1601', '0', '0', '固定资产', '0', '1', '资产');
INSERT INTO `accountingsubject` VALUES ('1602', '0', '1', '累计折旧', '0', '1', '资产');
INSERT INTO `accountingsubject` VALUES ('1604', '0', '0', '在建工程', '0', '1', '资产');
INSERT INTO `accountingsubject` VALUES ('1605', '0', '0', '工程物资', '0', '1', '资产');
INSERT INTO `accountingsubject` VALUES ('1606', '0', '0', '固定资产清理', '0', '1', '资产');
INSERT INTO `accountingsubject` VALUES ('1621', '0', '0', '生产性生物资产', '0', '1', '资产');
INSERT INTO `accountingsubject` VALUES ('1622', '0', '1', '生产性生物资产累计折旧', '0', '1', '资产');
INSERT INTO `accountingsubject` VALUES ('1701', '0', '0', '无形资产', '0', '1', '资产');
INSERT INTO `accountingsubject` VALUES ('1702', '0', '1', '累计摊销', '0', '1', '资产');
INSERT INTO `accountingsubject` VALUES ('1801', '0', '0', '长期待摊费用', '0', '1', '资产');
INSERT INTO `accountingsubject` VALUES ('1901', '0', '0', '待处理财产损溢', '0', '1', '资产');
INSERT INTO `accountingsubject` VALUES ('2001', '0', '1', '短期借款', '0', '1', '负债');
INSERT INTO `accountingsubject` VALUES ('2201', '0', '1', '应付票据', '0', '1', '负债');
INSERT INTO `accountingsubject` VALUES ('2202', '0', '1', '应付账款', '0', '1', '负债');
INSERT INTO `accountingsubject` VALUES ('2203', '0', '1', '预收账款', '0', '1', '负债');
INSERT INTO `accountingsubject` VALUES ('2211', '0', '1', '应付职工薪酬', '0', '1', '负债');
INSERT INTO `accountingsubject` VALUES ('2221', '0', '1', '应交税费', '0', '1', '负债');
INSERT INTO `accountingsubject` VALUES ('2231', '0', '1', '应付利息', '0', '1', '负债');
INSERT INTO `accountingsubject` VALUES ('2232', '0', '1', '应付利润', '0', '1', '负债');
INSERT INTO `accountingsubject` VALUES ('2241', '0', '1', '其他应付款', '0', '1', '负债');
INSERT INTO `accountingsubject` VALUES ('2401', '0', '1', '递延收益', '0', '1', '负债');
INSERT INTO `accountingsubject` VALUES ('2501', '0', '1', '长期借款', '0', '1', '负债');
INSERT INTO `accountingsubject` VALUES ('2701', '0', '1', '长期应付款', '0', '1', '负债');
INSERT INTO `accountingsubject` VALUES ('3001', '0', '1', '实收资本', '0', '1', '权益');
INSERT INTO `accountingsubject` VALUES ('3002', '0', '1', '资本公积', '0', '1', '权益');
INSERT INTO `accountingsubject` VALUES ('3101', '0', '1', '盈余公积', '0', '1', '权益');
INSERT INTO `accountingsubject` VALUES ('3103', '0', '1', '本年利润', '0', '1', '权益');
INSERT INTO `accountingsubject` VALUES ('3104', '0', '1', '利润分配', '0', '1', '权益');
INSERT INTO `accountingsubject` VALUES ('4001', '0', '0', '生产成本', '0', '1', '成本');
INSERT INTO `accountingsubject` VALUES ('4101', '0', '0', '制造费用', '0', '1', '成本');
INSERT INTO `accountingsubject` VALUES ('4301', '0', '0', '研发支出', '0', '1', '成本');
INSERT INTO `accountingsubject` VALUES ('4401', '0', '0', '工程施工', '0', '1', '成本');
INSERT INTO `accountingsubject` VALUES ('4403', '0', '0', '机械作业', '0', '1', '成本');
INSERT INTO `accountingsubject` VALUES ('5001', '0', '1', '主营业务收入', '0', '1', '损益');
INSERT INTO `accountingsubject` VALUES ('5051', '0', '1', '其他业务收入', '0', '1', '损益');
INSERT INTO `accountingsubject` VALUES ('5111', '0', '1', '投资收益', '0', '1', '损益');
INSERT INTO `accountingsubject` VALUES ('5301', '0', '1', '营业外收入', '0', '1', '损益');
INSERT INTO `accountingsubject` VALUES ('5401', '0', '0', '主营业务成本', '0', '1', '损益');
INSERT INTO `accountingsubject` VALUES ('5402', '0', '0', '其他业务成本', '0', '1', '损益');
INSERT INTO `accountingsubject` VALUES ('5403', '0', '0', '税金及附加', '0', '1', '损益');
INSERT INTO `accountingsubject` VALUES ('5601', '0', '0', '销售费用', '0', '1', '损益');
INSERT INTO `accountingsubject` VALUES ('5602', '0', '0', '管理费用', '0', '1', '损益');
INSERT INTO `accountingsubject` VALUES ('5603', '0', '0', '财务费用', '0', '1', '损益');
INSERT INTO `accountingsubject` VALUES ('5711', '0', '0', '营业外支出', '0', '1', '损益');
INSERT INTO `accountingsubject` VALUES ('5801', '0', '0', '所得税费用', '0', '1', '损益');
INSERT INTO `accountingsubject` VALUES ('1101001', '0', '0', '股票', '0', '0', '资产');
INSERT INTO `accountingsubject` VALUES ('1101002', '0', '0', '债券', '0', '0', '资产');
INSERT INTO `accountingsubject` VALUES ('1101003', '0', '0', '基金', '0', '0', '资产');
INSERT INTO `accountingsubject` VALUES ('2221001', '0', '1', '应交增值税', '2221', '0', '负债');
INSERT INTO `accountingsubject` VALUES ('2221002', '0', '1', '未交增值税', '2221', '0', '负债');
INSERT INTO `accountingsubject` VALUES ('2221003', '0', '1', '应交消费税', '2221', '0', '负债');
INSERT INTO `accountingsubject` VALUES ('2221004', '0', '1', '应交营业税', '2221', '0', '负债');
INSERT INTO `accountingsubject` VALUES ('2221005', '0', '1', '应交资源税', '2221', '0', '负债');
INSERT INTO `accountingsubject` VALUES ('2221006', '0', '1', '应交所得税', '2221', '0', '负债');
INSERT INTO `accountingsubject` VALUES ('2221007', '0', '1', '应交土地增值税', '2221', '0', '负债');
INSERT INTO `accountingsubject` VALUES ('2221008', '0', '1', '应交城市维护建设税', '2221', '0', '负债');
INSERT INTO `accountingsubject` VALUES ('2221009', '0', '1', '应交房产税', '2221', '0', '负债');
INSERT INTO `accountingsubject` VALUES ('2221010', '0', '1', '应交城镇土地使用税', '2221', '0', '负债');
INSERT INTO `accountingsubject` VALUES ('2221011', '0', '1', '应交车船使用税', '2221', '0', '负债');
INSERT INTO `accountingsubject` VALUES ('2221012', '0', '1', '应交个人所得税', '2221', '0', '负债');
INSERT INTO `accountingsubject` VALUES ('2221013', '0', '1', '教育费附加', '2221', '0', '负债');
INSERT INTO `accountingsubject` VALUES ('2221014', '0', '1', '地方教育费附加', '2221', '0', '负债');
INSERT INTO `accountingsubject` VALUES ('2221015', '0', '1', '矿产资源补偿费', '2221', '0', '负债');
INSERT INTO `accountingsubject` VALUES ('2221016', '0', '1', '排污费', '2221', '0', '负债');
INSERT INTO `accountingsubject` VALUES ('2221017', '0', '1', '印花税', '2221', '0', '负债');
INSERT INTO `accountingsubject` VALUES ('2221018', '0', '1', '预交增值税', '2221', '0', '负债');
INSERT INTO `accountingsubject` VALUES ('2221019', '0', '1', '待抵扣进项税额', '2221', '0', '负债');
INSERT INTO `accountingsubject` VALUES ('2221020', '0', '1', '待认证进项税额', '2221', '0', '负债');
INSERT INTO `accountingsubject` VALUES ('2221021', '0', '1', '待转销项税额', '2221', '0', '负债');
INSERT INTO `accountingsubject` VALUES ('2221022', '0', '1', '增值税留抵税额', '2221', '0', '负债');
INSERT INTO `accountingsubject` VALUES ('2221023', '0', '1', '简易计税', '2221', '0', '负债');
INSERT INTO `accountingsubject` VALUES ('2221024', '0', '1', '转让金融商品应交增值税', '2221', '0', '负债');
INSERT INTO `accountingsubject` VALUES ('2221025', '0', '1', '代扣代交增值税', '2221', '0', '负债');
INSERT INTO `accountingsubject` VALUES ('3101001', '0', '1', '法定盈余公积', '3101', '0', '权益');
INSERT INTO `accountingsubject` VALUES ('3101002', '0', '1', '任意盈余公积', '3101', '0', '权益');
INSERT INTO `accountingsubject` VALUES ('3101003', '0', '1', '法定公益金', '3101', '0', '权益');
INSERT INTO `accountingsubject` VALUES ('3104001', '0', '1', '其他转入', '3104', '0', '权益');
INSERT INTO `accountingsubject` VALUES ('3104002', '0', '1', '提取法定盈余公积', '3104', '0', '权益');
INSERT INTO `accountingsubject` VALUES ('3104003', '0', '1', '提取法定公益金', '3104', '0', '权益');
INSERT INTO `accountingsubject` VALUES ('3104004', '0', '1', '提取任意盈余公积', '3104', '0', '权益');
INSERT INTO `accountingsubject` VALUES ('3104005', '0', '1', '应付利润', '3104', '0', '权益');
INSERT INTO `accountingsubject` VALUES ('3104006', '0', '1', '未分配利润', '3104', '0', '权益');
INSERT INTO `accountingsubject` VALUES ('5301001', '0', '1', '非流动资产处置净收益', '5301', '0', '损益');
INSERT INTO `accountingsubject` VALUES ('5301002', '0', '1', '政府补助', '5301', '0', '损益');
INSERT INTO `accountingsubject` VALUES ('5301003', '0', '1', '捐赠收益', '5301', '0', '损益');
INSERT INTO `accountingsubject` VALUES ('5301004', '0', '1', '盘盈收益', '5301', '0', '损益');
INSERT INTO `accountingsubject` VALUES ('5601001', '0', '0', '销售人员职工薪酬', '5601', '0', '损益');
INSERT INTO `accountingsubject` VALUES ('5601002', '0', '0', '业务招待费', '5601', '0', '损益');
INSERT INTO `accountingsubject` VALUES ('5601003', '0', '0', '修理费', '5601', '0', '损益');
INSERT INTO `accountingsubject` VALUES ('5601004', '0', '0', '办公费', '5601', '0', '损益');
INSERT INTO `accountingsubject` VALUES ('5601005', '0', '0', '水电费', '5601', '0', '损益');
INSERT INTO `accountingsubject` VALUES ('5601006', '0', '0', '差旅费', '5601', '0', '损益');
INSERT INTO `accountingsubject` VALUES ('5601007', '0', '0', '折旧费', '5601', '0', '损益');
INSERT INTO `accountingsubject` VALUES ('5601008', '0', '0', '摊销费', '5601', '0', '损益');
INSERT INTO `accountingsubject` VALUES ('5601009', '0', '0', '展览费', '5601', '0', '损益');
INSERT INTO `accountingsubject` VALUES ('5601010', '0', '0', '商品维修费', '5601', '0', '损益');
INSERT INTO `accountingsubject` VALUES ('5601011', '0', '0', '运输费', '5601', '0', '损益');
INSERT INTO `accountingsubject` VALUES ('5601012', '0', '0', '装卸费', '5601', '0', '损益');
INSERT INTO `accountingsubject` VALUES ('5601013', '0', '0', '包装费', '5601', '0', '损益');
INSERT INTO `accountingsubject` VALUES ('5601014', '0', '0', '保险费', '5601', '0', '损益');
INSERT INTO `accountingsubject` VALUES ('5601015', '0', '0', '广告费', '5601', '0', '损益');
INSERT INTO `accountingsubject` VALUES ('5601016', '0', '0', '业务宣传费', '5601', '0', '损益');
INSERT INTO `accountingsubject` VALUES ('5602001', '0', '0', '管理人员职工薪酬', '5602', '0', '损益');
INSERT INTO `accountingsubject` VALUES ('5602002', '0', '0', '业务招待费', '5602', '0', '损益');
INSERT INTO `accountingsubject` VALUES ('5602003', '0', '0', '修理费', '5602', '0', '损益');
INSERT INTO `accountingsubject` VALUES ('5602004', '0', '0', '办公费', '5602', '0', '损益');
INSERT INTO `accountingsubject` VALUES ('5602005', '0', '0', '水电费', '5602', '0', '损益');
INSERT INTO `accountingsubject` VALUES ('5602006', '0', '0', '差旅费', '5602', '0', '损益');
INSERT INTO `accountingsubject` VALUES ('5602007', '0', '0', '折旧费', '5602', '0', '损益');
INSERT INTO `accountingsubject` VALUES ('5602008', '0', '0', '摊销费', '5602', '0', '损益');
INSERT INTO `accountingsubject` VALUES ('5602009', '0', '0', '开办费', '5602', '0', '损益');
INSERT INTO `accountingsubject` VALUES ('5602010', '0', '0', '研究费用', '5602', '0', '损益');
INSERT INTO `accountingsubject` VALUES ('5602011', '0', '0', '咨询费', '5602', '0', '损益');
INSERT INTO `accountingsubject` VALUES ('5602012', '0', '0', '长期待摊费用摊销', '5602', '0', '损益');
INSERT INTO `accountingsubject` VALUES ('5603001', '0', '0', '利息费用', '5603', '0', '损益');
INSERT INTO `accountingsubject` VALUES ('5603002', '0', '0', '手续费', '5603', '0', '损益');
INSERT INTO `accountingsubject` VALUES ('5603003', '0', '0', '汇兑损益', '5603', '0', '损益');
INSERT INTO `accountingsubject` VALUES ('5603004', '0', '0', '现金折扣', '5603', '0', '损益');
INSERT INTO `accountingsubject` VALUES ('5711001', '0', '0', '非流动资产处置净损失', '5711', '0', '损益');
INSERT INTO `accountingsubject` VALUES ('5711002', '0', '0', '赞助支出', '5711', '0', '损益');
INSERT INTO `accountingsubject` VALUES ('5711003', '0', '0', '捐赠支出', '5711', '0', '损益');
INSERT INTO `accountingsubject` VALUES ('5711004', '0', '0', '盘亏损失', '5711', '0', '损益');
INSERT INTO `accountingsubject` VALUES ('5711005', '0', '0', '坏账损失', '5711', '0', '损益');
INSERT INTO `accountingsubject` VALUES ('5711006', '0', '0', '存货毁损报废损失', '5711', '0', '损益');
INSERT INTO `accountingsubject` VALUES ('5711007', '0', '0', '无法收回的长期债券投资损失', '5711', '0', '损益');
INSERT INTO `accountingsubject` VALUES ('5711008', '0', '0', '无法收回的长期股权投资损失', '5711', '0', '损益');
INSERT INTO `accountingsubject` VALUES ('5711009', '0', '0', '自然灾害等不可抗力因素造成的损失', '5711', '0', '损益');
INSERT INTO `accountingsubject` VALUES ('5711010', '0', '0', '税收滞纳金', '5711', '0', '损益');
INSERT INTO `accountingsubject` VALUES ('5711011', '0', '0', '罚款支出', '5711', '0', '损益');
INSERT INTO `accountingsubject` VALUES ('222100101', '0', '1', '进项税额', '2221001', '0', '负债');
INSERT INTO `accountingsubject` VALUES ('222100102', '0', '1', '已交税金', '2221001', '0', '负债');
INSERT INTO `accountingsubject` VALUES ('222100103', '0', '1', '转出未交增值税', '2221001', '0', '负债');
INSERT INTO `accountingsubject` VALUES ('222100104', '0', '1', '减免税款', '2221001', '0', '负债');
INSERT INTO `accountingsubject` VALUES ('222100105', '0', '1', '销项税额', '2221001', '0', '负债');
INSERT INTO `accountingsubject` VALUES ('222100106', '0', '1', '出口退税', '2221001', '0', '负债');
INSERT INTO `accountingsubject` VALUES ('222100107', '0', '1', '进项税额转出', '2221001', '0', '负债');
INSERT INTO `accountingsubject` VALUES ('222100108', '0', '1', '出口抵减内销产品应纳税额', '2221001', '0', '负债');
INSERT INTO `accountingsubject` VALUES ('222100109', '0', '1', '转出多交增值税', '2221001', '0', '负债');
INSERT INTO `accountingsubject` VALUES ('222100110', '0', '1', '销项税额抵减', '2221001', '0', '负债');

-- ----------------------------
-- Table structure for accountselect
-- ----------------------------
DROP TABLE IF EXISTS `accountselect`;
CREATE TABLE `accountselect` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of accountselect
-- ----------------------------

-- ----------------------------
-- Table structure for accountset
-- ----------------------------
DROP TABLE IF EXISTS `accountset`;
CREATE TABLE `accountset` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  `name` varchar(12) DEFAULT NULL,
  `period` int(11) DEFAULT '1',
  `place` varchar(20) DEFAULT NULL,
  `vat` tinyint(1) DEFAULT '0',
  `isdefault` tinyint(1) DEFAULT '0',
  `as` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of accountset
-- ----------------------------
INSERT INTO `accountset` VALUES ('1', '2017-03-03 00:00:00', '账套一', '3', '城区', '0', '1', '0');
INSERT INTO `accountset` VALUES ('2', '2017-02-24 00:00:00', '账套二', '3', '郊区', '1', '0', '1');

-- ----------------------------
-- Table structure for bank
-- ----------------------------
DROP TABLE IF EXISTS `bank`;
CREATE TABLE `bank` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `balance` double DEFAULT '0',
  `bankAccount` varchar(19) DEFAULT NULL,
  `name` varchar(12) DEFAULT NULL,
  `accountingsubject_id` int(11) DEFAULT NULL,
  `current_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_iu3f4kvjf3t18vejkp4rsheje` (`accountingsubject_id`),
  KEY `FK_5ekh6l9u1tubwpd1wgxdg7gug` (`current_id`),
  CONSTRAINT `FK_5ekh6l9u1tubwpd1wgxdg7gug` FOREIGN KEY (`current_id`) REFERENCES `current` (`id`),
  CONSTRAINT `FK_iu3f4kvjf3t18vejkp4rsheje` FOREIGN KEY (`accountingsubject_id`) REFERENCES `accountingsubject` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bank
-- ----------------------------
INSERT INTO `bank` VALUES ('1', '1000', '1111111111', '银行', '1002', '1');

-- ----------------------------
-- Table structure for bankjournal
-- ----------------------------
DROP TABLE IF EXISTS `bankjournal`;
CREATE TABLE `bankjournal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `balance` double DEFAULT NULL,
  `date` date DEFAULT NULL,
  `description` varchar(12) DEFAULT NULL,
  `expenditure` double DEFAULT NULL,
  `income` double DEFAULT NULL,
  `optype` varchar(12) DEFAULT NULL,
  `paymentMethod` varchar(12) DEFAULT NULL,
  `period` int(11) DEFAULT '1',
  `receiptNumber` int(11) DEFAULT NULL,
  `solved` tinyint(1) DEFAULT '0',
  `bank_id` int(11) DEFAULT NULL,
  `ietype_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_5eqdqjwtp3xyuxwtwfrnpb16m` (`bank_id`),
  KEY `FK_g9ey4l2jgtssahktqxkufp5yj` (`ietype_id`),
  CONSTRAINT `FK_5eqdqjwtp3xyuxwtwfrnpb16m` FOREIGN KEY (`bank_id`) REFERENCES `bank` (`id`),
  CONSTRAINT `FK_g9ey4l2jgtssahktqxkufp5yj` FOREIGN KEY (`ietype_id`) REFERENCES `ietype` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bankjournal
-- ----------------------------

-- ----------------------------
-- Table structure for cash
-- ----------------------------
DROP TABLE IF EXISTS `cash`;
CREATE TABLE `cash` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `balance` double DEFAULT '0',
  `name` varchar(12) DEFAULT NULL,
  `accountingsubject_id` int(11) DEFAULT NULL,
  `current_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_e2nf14bnyl2adig2rypg7tyru` (`accountingsubject_id`),
  KEY `FK_av3jfj5e9e0ihsur693pk491r` (`current_id`),
  CONSTRAINT `FK_av3jfj5e9e0ihsur693pk491r` FOREIGN KEY (`current_id`) REFERENCES `current` (`id`),
  CONSTRAINT `FK_e2nf14bnyl2adig2rypg7tyru` FOREIGN KEY (`accountingsubject_id`) REFERENCES `accountingsubject` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cash
-- ----------------------------
INSERT INTO `cash` VALUES ('1', '10000', '现金', '1001', '1');
INSERT INTO `cash` VALUES ('2', '0', '股票', '1511', '1');

-- ----------------------------
-- Table structure for current
-- ----------------------------
DROP TABLE IF EXISTS `current`;
CREATE TABLE `current` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(4) DEFAULT NULL,
  `name` varchar(12) DEFAULT NULL,
  `rate` float DEFAULT NULL,
  `standard` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of current
-- ----------------------------
INSERT INTO `current` VALUES ('1', 'RMB', '人民币', '1', '1');
INSERT INTO `current` VALUES ('2', 'USD', '美元', '6.864', '0');

-- ----------------------------
-- Table structure for ietype
-- ----------------------------
DROP TABLE IF EXISTS `ietype`;
CREATE TABLE `ietype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ie` bit(1) NOT NULL,
  `name` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ietype
-- ----------------------------
INSERT INTO `ietype` VALUES ('1', '', '现金收入');
INSERT INTO `ietype` VALUES ('2', '', '销售收入');
INSERT INTO `ietype` VALUES ('3', '\0', '研发支出');
INSERT INTO `ietype` VALUES ('4', '\0', '渠道支出');

-- ----------------------------
-- Table structure for journal
-- ----------------------------
DROP TABLE IF EXISTS `journal`;
CREATE TABLE `journal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `description` varchar(12) DEFAULT NULL,
  `expenditure` double DEFAULT NULL,
  `income` double DEFAULT NULL,
  `optype` varchar(12) DEFAULT NULL,
  `paymentMethod` varchar(12) DEFAULT NULL,
  `period` int(11) DEFAULT '1',
  `receiptNumber` int(11) DEFAULT NULL,
  `solved` tinyint(1) DEFAULT '0',
  `cash_id` int(11) DEFAULT NULL,
  `ietype_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_13qvje9hu89ukb7oxir1hsshk` (`cash_id`),
  KEY `FK_bdt8j2934vuysjoh2u8hxs4yl` (`ietype_id`),
  CONSTRAINT `FK_13qvje9hu89ukb7oxir1hsshk` FOREIGN KEY (`cash_id`) REFERENCES `cash` (`id`),
  CONSTRAINT `FK_bdt8j2934vuysjoh2u8hxs4yl` FOREIGN KEY (`ietype_id`) REFERENCES `ietype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of journal
-- ----------------------------
INSERT INTO `journal` VALUES ('1', '2017-04-03', '研发CPU', '1000', '0', null, null, '0', '0', '0', '1', '3');
INSERT INTO `journal` VALUES ('2', '2017-04-03', 'CPU卖出', '0', '5000', null, null, '0', '0', '0', '1', '2');

-- ----------------------------
-- Table structure for log
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log` (
  `logid` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(32) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `modual` varchar(10) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`logid`),
  KEY `FK_tn5sbw0j15ycavkleayhcrvxd` (`user_id`),
  CONSTRAINT `FK_tn5sbw0j15ycavkleayhcrvxd` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of log
-- ----------------------------
INSERT INTO `log` VALUES ('1', '用户登录', '2017-03-20 19:14:52', '基础模块/首页', '正常', '1');
INSERT INTO `log` VALUES ('2', 'to增加凭证', '2017-03-20 19:15:05', '凭证/to增加凭证', '正常', '1');
INSERT INTO `log` VALUES ('3', '增加凭证', '2017-03-20 19:16:17', '凭证/增加凭证', '正常', '1');
INSERT INTO `log` VALUES ('4', 'to增加凭证', '2017-03-20 19:16:17', '凭证/to增加凭证', '正常', '1');
INSERT INTO `log` VALUES ('5', '用户登录', '2017-03-21 11:40:37', '基础模块/首页', '正常', '1');
INSERT INTO `log` VALUES ('7', '用户登录', '2017-03-21 11:40:37', '基础模块/首页', '异常', '1');
INSERT INTO `log` VALUES ('8', '用户登录', '2017-03-21 11:43:14', '基础模块/首页', '正常', '1');
INSERT INTO `log` VALUES ('9', 'to增加凭证', '2017-03-21 11:43:22', '凭证/to增加凭证', '正常', '1');
INSERT INTO `log` VALUES ('10', '用户登录', '2017-03-25 15:04:24', '基础模块/首页', '正常', '1');
INSERT INTO `log` VALUES ('11', 'to增加凭证', '2017-03-25 15:05:19', '凭证/to增加凭证', '正常', '1');
INSERT INTO `log` VALUES ('12', '增加凭证', '2017-03-25 15:06:24', '凭证/增加凭证', '正常', '1');
INSERT INTO `log` VALUES ('13', 'to增加凭证', '2017-03-25 15:06:24', '凭证/to增加凭证', '正常', '1');
INSERT INTO `log` VALUES ('14', '查看', '2017-03-25 15:14:18', '出纳/资金报表', '正常', '1');
INSERT INTO `log` VALUES ('15', '增加', '2017-03-25 15:15:55', '出纳/现金日记账', '正常', '1');
INSERT INTO `log` VALUES ('16', '查看', '2017-03-25 15:21:53', '出纳/资金报表', '正常', '1');
INSERT INTO `log` VALUES ('17', '查看', '2017-03-25 15:22:13', '设置/账套', '正常', '1');
INSERT INTO `log` VALUES ('18', '查看', '2017-03-25 15:22:21', '设置/账套', '正常', '1');
INSERT INTO `log` VALUES ('19', '日志管理', '2017-03-25 15:22:30', '设置/日志管理', '正常', '1');
INSERT INTO `log` VALUES ('20', '用户登录', '2017-03-25 17:23:30', '基础模块/首页', '正常', '1');
INSERT INTO `log` VALUES ('21', '增加', '2017-03-25 17:23:59', '出纳/现金日记账', '正常', '1');
INSERT INTO `log` VALUES ('22', 'to增加凭证', '2017-03-25 17:25:37', '凭证/to增加凭证', '正常', '1');
INSERT INTO `log` VALUES ('23', 'to增加凭证', '2017-03-25 17:31:07', '凭证/to增加凭证', '正常', '1');
INSERT INTO `log` VALUES ('24', 'to增加凭证', '2017-03-25 17:31:31', '凭证/to增加凭证', '正常', '1');
INSERT INTO `log` VALUES ('25', 'to增加凭证', '2017-03-25 17:32:02', '凭证/to增加凭证', '正常', '1');
INSERT INTO `log` VALUES ('26', 'to增加凭证', '2017-03-25 17:32:50', '凭证/to增加凭证', '正常', '1');
INSERT INTO `log` VALUES ('27', 'to增加凭证', '2017-03-25 17:33:07', '凭证/to增加凭证', '正常', '1');
INSERT INTO `log` VALUES ('28', 'to增加凭证', '2017-03-25 17:34:33', '凭证/to增加凭证', '正常', '1');
INSERT INTO `log` VALUES ('29', 'to增加凭证', '2017-03-25 17:38:53', '凭证/to增加凭证', '正常', '1');
INSERT INTO `log` VALUES ('30', 'to增加凭证', '2017-03-25 17:40:23', '凭证/to增加凭证', '正常', '1');
INSERT INTO `log` VALUES ('31', 'to增加凭证', '2017-03-25 17:41:05', '凭证/to增加凭证', '正常', '1');
INSERT INTO `log` VALUES ('32', 'to增加凭证', '2017-03-25 17:41:56', '凭证/to增加凭证', '正常', '1');
INSERT INTO `log` VALUES ('33', 'to增加凭证', '2017-03-25 17:42:28', '凭证/to增加凭证', '正常', '1');
INSERT INTO `log` VALUES ('34', 'to增加凭证', '2017-03-25 17:44:36', '凭证/to增加凭证', '正常', '1');
INSERT INTO `log` VALUES ('35', 'to增加凭证', '2017-03-25 17:45:04', '凭证/to增加凭证', '正常', '1');
INSERT INTO `log` VALUES ('36', 'to增加凭证', '2017-03-25 17:45:54', '凭证/to增加凭证', '正常', '1');
INSERT INTO `log` VALUES ('37', 'to增加凭证', '2017-03-25 17:46:34', '凭证/to增加凭证', '正常', '1');
INSERT INTO `log` VALUES ('38', '用户登录', '2017-03-26 09:17:18', '基础模块/首页', '正常', '1');
INSERT INTO `log` VALUES ('39', 'to增加凭证', '2017-03-26 09:17:30', '凭证/to增加凭证', '正常', '1');
INSERT INTO `log` VALUES ('40', 'to增加凭证', '2017-03-26 09:34:21', '凭证/to增加凭证', '正常', '1');
INSERT INTO `log` VALUES ('41', 'to增加凭证', '2017-03-26 09:35:13', '凭证/to增加凭证', '正常', '1');
INSERT INTO `log` VALUES ('42', 'to增加凭证', '2017-03-26 09:35:41', '凭证/to增加凭证', '正常', '1');
INSERT INTO `log` VALUES ('43', 'to增加凭证', '2017-03-26 09:37:02', '凭证/to增加凭证', '正常', '1');
INSERT INTO `log` VALUES ('44', 'to增加凭证', '2017-03-26 09:37:50', '凭证/to增加凭证', '正常', '1');
INSERT INTO `log` VALUES ('45', 'to增加凭证', '2017-03-26 09:38:19', '凭证/to增加凭证', '正常', '1');
INSERT INTO `log` VALUES ('46', 'to增加凭证', '2017-03-26 09:39:14', '凭证/to增加凭证', '正常', '1');
INSERT INTO `log` VALUES ('47', 'to增加凭证', '2017-03-26 09:41:05', '凭证/to增加凭证', '正常', '1');
INSERT INTO `log` VALUES ('48', 'to增加凭证', '2017-03-26 09:42:28', '凭证/to增加凭证', '正常', '1');
INSERT INTO `log` VALUES ('49', 'to增加凭证', '2017-03-26 09:44:08', '凭证/to增加凭证', '正常', '1');
INSERT INTO `log` VALUES ('50', 'to增加凭证', '2017-03-26 09:46:01', '凭证/to增加凭证', '正常', '1');
INSERT INTO `log` VALUES ('51', 'to增加凭证', '2017-03-26 09:46:54', '凭证/to增加凭证', '正常', '1');
INSERT INTO `log` VALUES ('52', 'to增加凭证', '2017-03-26 09:47:46', '凭证/to增加凭证', '正常', '1');
INSERT INTO `log` VALUES ('53', 'to增加凭证', '2017-03-26 09:49:40', '凭证/to增加凭证', '正常', '1');
INSERT INTO `log` VALUES ('54', 'to增加凭证', '2017-03-26 09:58:40', '凭证/to增加凭证', '正常', '1');
INSERT INTO `log` VALUES ('55', 'to增加凭证', '2017-03-26 10:00:11', '凭证/to增加凭证', '正常', '1');
INSERT INTO `log` VALUES ('56', 'to增加凭证', '2017-03-26 10:01:28', '凭证/to增加凭证', '正常', '1');
INSERT INTO `log` VALUES ('57', 'to增加凭证', '2017-03-26 10:02:13', '凭证/to增加凭证', '正常', '1');
INSERT INTO `log` VALUES ('58', 'to增加凭证', '2017-03-26 10:02:48', '凭证/to增加凭证', '正常', '1');
INSERT INTO `log` VALUES ('59', 'to增加凭证', '2017-03-26 10:04:58', '凭证/to增加凭证', '正常', '1');
INSERT INTO `log` VALUES ('60', 'to增加凭证', '2017-03-26 10:06:03', '凭证/to增加凭证', '正常', '1');
INSERT INTO `log` VALUES ('61', '增加', '2017-03-26 10:06:37', '出纳/现金日记账', '正常', '1');
INSERT INTO `log` VALUES ('62', '增加', '2017-03-26 10:10:28', '出纳/现金日记账', '正常', '1');
INSERT INTO `log` VALUES ('63', '用户登录', '2017-03-26 10:24:57', '基础模块/首页', '正常', '1');
INSERT INTO `log` VALUES ('64', '用户登录', '2017-03-26 10:28:18', '基础模块/首页', '正常', '1');
INSERT INTO `log` VALUES ('65', '用户登录', '2017-03-26 11:01:37', '基础模块/首页', '正常', '1');
INSERT INTO `log` VALUES ('66', '用户登录', '2017-03-26 11:09:47', '基础模块/首页', '正常', '1');
INSERT INTO `log` VALUES ('67', '用户登录', '2017-03-26 11:18:28', '基础模块/首页', '正常', '1');
INSERT INTO `log` VALUES ('68', '用户登录', '2017-03-26 11:19:58', '基础模块/首页', '正常', '1');
INSERT INTO `log` VALUES ('69', 'to增加凭证', '2017-03-26 11:20:38', '凭证/to增加凭证', '正常', '1');
INSERT INTO `log` VALUES ('70', '用户登录', '2017-03-26 11:22:33', '基础模块/首页', '正常', '1');
INSERT INTO `log` VALUES ('71', '用户登录', '2017-03-26 11:28:00', '基础模块/首页', '正常', '1');
INSERT INTO `log` VALUES ('72', '用户登录', '2017-03-26 11:38:57', '基础模块/首页', '正常', '1');
INSERT INTO `log` VALUES ('73', '用户登录', '2017-03-26 11:39:00', '基础模块/首页', '正常', '1');
INSERT INTO `log` VALUES ('74', '用户登录', '2017-03-26 11:39:25', '基础模块/首页', '正常', '1');
INSERT INTO `log` VALUES ('75', '用户登录', '2017-03-26 11:39:38', '基础模块/首页', '正常', '1');
INSERT INTO `log` VALUES ('76', '用户登录', '2017-03-26 11:39:41', '基础模块/首页', '正常', '1');
INSERT INTO `log` VALUES ('77', '用户登录', '2017-03-26 11:39:47', '基础模块/首页', '正常', '1');
INSERT INTO `log` VALUES ('78', '用户登录', '2017-03-26 11:39:52', '基础模块/首页', '正常', '1');
INSERT INTO `log` VALUES ('79', '用户登录', '2017-03-26 11:41:00', '基础模块/首页', '正常', '1');
INSERT INTO `log` VALUES ('80', '用户登录', '2017-03-26 11:41:06', '基础模块/首页', '正常', '1');
INSERT INTO `log` VALUES ('81', '用户登录', '2017-03-26 16:13:58', '基础模块/首页', '正常', '1');
INSERT INTO `log` VALUES ('82', '用户登录', '2017-03-26 16:14:30', '基础模块/首页', '正常', '1');
INSERT INTO `log` VALUES ('83', '用户登录', '2017-03-26 17:13:58', '基础模块/首页', '正常', '1');
INSERT INTO `log` VALUES ('84', '用户登录', '2017-04-02 15:15:53', '基础模块/首页', '正常', '1');
INSERT INTO `log` VALUES ('85', '用户登录', '2017-04-02 19:14:56', '基础模块/首页', '正常', '1');
INSERT INTO `log` VALUES ('86', '用户登录', '2017-04-02 19:18:07', '基础模块/首页', '正常', '1');
INSERT INTO `log` VALUES ('87', 'to增加凭证', '2017-04-02 19:18:14', '凭证/to增加凭证', '正常', '1');
INSERT INTO `log` VALUES ('88', 'to增加凭证', '2017-04-02 19:44:59', '凭证/to增加凭证', '正常', '1');
INSERT INTO `log` VALUES ('89', '日志管理', '2017-04-02 19:45:05', '设置/日志管理', '正常', '1');
INSERT INTO `log` VALUES ('90', 'to增加凭证', '2017-04-02 19:45:12', '凭证/to增加凭证', '正常', '1');
INSERT INTO `log` VALUES ('91', 'to增加凭证', '2017-04-02 19:46:37', '凭证/to增加凭证', '正常', '1');
INSERT INTO `log` VALUES ('92', '用户登录', '2017-04-03 15:56:07', '基础模块/首页', '正常', '1');
INSERT INTO `log` VALUES ('93', '用户登录', '2017-04-03 15:59:53', '基础模块/首页', '正常', '1');
INSERT INTO `log` VALUES ('94', 'to增加凭证', '2017-04-03 16:00:20', '凭证/to增加凭证', '正常', '1');
INSERT INTO `log` VALUES ('95', 'to增加凭证', '2017-04-03 16:00:42', '凭证/to增加凭证', '正常', '1');
INSERT INTO `log` VALUES ('96', 'to增加凭证', '2017-04-03 16:04:57', '凭证/to增加凭证', '正常', '1');
INSERT INTO `log` VALUES ('97', '增加', '2017-04-03 16:15:23', '出纳/现金日记账', '正常', '1');
INSERT INTO `log` VALUES ('98', '增加', '2017-04-03 16:17:42', '出纳/现金日记账', '正常', '1');
INSERT INTO `log` VALUES ('99', '增加', '2017-04-03 16:19:41', '出纳/现金日记账', '正常', '1');
INSERT INTO `log` VALUES ('100', '用户登录', '2017-04-04 10:34:57', '基础模块/首页', '正常', '1');
INSERT INTO `log` VALUES ('101', '用户登录', '2017-04-04 16:34:26', '基础模块/首页', '正常', '1');
INSERT INTO `log` VALUES ('102', '明细账', '2017-04-04 16:38:09', '账簿', '异常', '1');
INSERT INTO `log` VALUES ('103', '明细账', '2017-04-04 17:15:32', '账簿', '正常', '1');
INSERT INTO `log` VALUES ('104', '明细账', '2017-04-04 17:19:58', '账簿', '正常', '1');
INSERT INTO `log` VALUES ('105', '明细账', '2017-04-04 17:23:26', '账簿', '正常', '1');
INSERT INTO `log` VALUES ('106', '明细账', '2017-04-04 17:25:25', '账簿', '正常', '1');
INSERT INTO `log` VALUES ('107', '明细账', '2017-04-04 17:33:50', '账簿', '正常', '1');
INSERT INTO `log` VALUES ('108', '明细账', '2017-04-04 17:38:12', '账簿', '正常', '1');
INSERT INTO `log` VALUES ('109', '明细账', '2017-04-04 17:40:30', '账簿', '正常', '1');
INSERT INTO `log` VALUES ('110', '明细账', '2017-04-04 17:41:11', '账簿', '正常', '1');
INSERT INTO `log` VALUES ('111', '明细账', '2017-04-04 17:42:46', '账簿', '正常', '1');
INSERT INTO `log` VALUES ('112', '明细账', '2017-04-04 18:08:18', '账簿', '正常', '1');
INSERT INTO `log` VALUES ('113', '明细账', '2017-04-04 18:08:36', '账簿', '正常', '1');
INSERT INTO `log` VALUES ('114', '用户登录', '2017-04-05 22:18:18', '基础模块/首页', '正常', '1');
INSERT INTO `log` VALUES ('115', '明细账', '2017-04-05 22:18:31', '账簿', '正常', '1');
INSERT INTO `log` VALUES ('116', '明细账', '2017-04-05 22:20:29', '账簿', '正常', '1');
INSERT INTO `log` VALUES ('117', '明细账', '2017-04-05 22:21:36', '账簿', '正常', '1');
INSERT INTO `log` VALUES ('118', '明细账', '2017-04-05 22:21:54', '账簿', '正常', '1');
INSERT INTO `log` VALUES ('119', '明细账', '2017-04-05 22:32:03', '账簿', '正常', '1');
INSERT INTO `log` VALUES ('120', '明细账', '2017-04-05 22:32:37', '账簿', '正常', '1');
INSERT INTO `log` VALUES ('121', '明细账', '2017-04-05 22:34:30', '账簿', '正常', '1');
INSERT INTO `log` VALUES ('122', '查看', '2017-04-05 22:57:05', '设置/账套', '正常', '1');
INSERT INTO `log` VALUES ('123', '日志管理', '2017-04-05 22:58:17', '设置/日志管理', '正常', '1');
INSERT INTO `log` VALUES ('124', '查看', '2017-04-05 23:00:05', '设置/期初设置', '正常', '1');
INSERT INTO `log` VALUES ('125', '查看', '2017-04-05 23:15:50', '出纳/资金报表', '正常', '1');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rolename` varchar(20) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '管理员', '5');
INSERT INTO `role` VALUES ('2', '主管', '4');
INSERT INTO `role` VALUES ('3', '制单人', '3');
INSERT INTO `role` VALUES ('4', '出纳人', '2');
INSERT INTO `role` VALUES ('5', '查看', '1');

-- ----------------------------
-- Table structure for subsidiary
-- ----------------------------
DROP TABLE IF EXISTS `subsidiary`;
CREATE TABLE `subsidiary` (
  `id` int(11) NOT NULL,
  `balance` double NOT NULL,
  `credit` double NOT NULL,
  `date` datetime DEFAULT NULL,
  `dc` bit(1) NOT NULL,
  `debit` double NOT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `summary` varchar(255) DEFAULT NULL,
  `vch` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of subsidiary
-- ----------------------------

-- ----------------------------
-- Table structure for test
-- ----------------------------
DROP TABLE IF EXISTS `test`;
CREATE TABLE `test` (
  `id` int(11) NOT NULL,
  `name` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of test
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(32) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `tel` varchar(32) DEFAULT NULL,
  `userName` varchar(32) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_4bakctviobmdk6ddh2nwg08c2` (`userName`),
  KEY `FK_qleu8ddawkdltal07p8e6hgva` (`role_id`),
  CONSTRAINT `FK_qleu8ddawkdltal07p8e6hgva` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '1@163.com', '1', '123456', '用户1', '1');
INSERT INTO `user` VALUES ('2', '2@163.com', '2', '123', '用户2', '2');
INSERT INTO `user` VALUES ('3', '3@163.com', '3', '12', '用户3', '3');
INSERT INTO `user` VALUES ('4', '4@163.com', '4', '11', '用户4', '4');
INSERT INTO `user` VALUES ('5', '5@163.com', '5', '1', '用户5', '5');

-- ----------------------------
-- Table structure for voucher
-- ----------------------------
DROP TABLE IF EXISTS `voucher`;
CREATE TABLE `voucher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `checked` tinyint(1) DEFAULT '0',
  `date` datetime DEFAULT NULL,
  `period` int(11) DEFAULT '1',
  `poststatus` tinyint(1) DEFAULT '0',
  `solved` tinyint(1) DEFAULT '0',
  `total` double DEFAULT NULL,
  `vchnum` int(11) DEFAULT NULL,
  `voucherstatus` tinyint(1) DEFAULT '0',
  `user_id` int(11) DEFAULT NULL,
  `vouchergroup_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_c68qradtdok7vddr3bcpymhls` (`user_id`),
  KEY `FK_aki63xd25q01yqsgct7tdui18` (`vouchergroup_id`),
  CONSTRAINT `FK_aki63xd25q01yqsgct7tdui18` FOREIGN KEY (`vouchergroup_id`) REFERENCES `vouchergroup` (`id`),
  CONSTRAINT `FK_c68qradtdok7vddr3bcpymhls` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of voucher
-- ----------------------------
INSERT INTO `voucher` VALUES ('1', '0', '2017-03-20 00:00:00', '201703', '0', '0', '2000', '1', '0', '1', '1');
INSERT INTO `voucher` VALUES ('2', '0', '2017-02-01 15:05:00', '201703', '0', '0', '230', '2', '0', '1', '1');

-- ----------------------------
-- Table structure for vouchercore
-- ----------------------------
DROP TABLE IF EXISTS `vouchercore`;
CREATE TABLE `vouchercore` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `credits` double DEFAULT NULL,
  `debits` double DEFAULT NULL,
  `summary` varchar(10) DEFAULT NULL,
  `accountingsubject_id` int(11) DEFAULT NULL,
  `voucher_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ouifchrju9a7i2g6rjl6fl88w` (`accountingsubject_id`),
  KEY `FK_g9avc0olj74ct5qui38l07jng` (`voucher_id`),
  CONSTRAINT `FK_g9avc0olj74ct5qui38l07jng` FOREIGN KEY (`voucher_id`) REFERENCES `voucher` (`id`),
  CONSTRAINT `FK_ouifchrju9a7i2g6rjl6fl88w` FOREIGN KEY (`accountingsubject_id`) REFERENCES `accountingsubject` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of vouchercore
-- ----------------------------
INSERT INTO `vouchercore` VALUES ('1', '0', '2000', '提现', '1001', '1');
INSERT INTO `vouchercore` VALUES ('2', '1000', '0', '提现', '1002', '1');
INSERT INTO `vouchercore` VALUES ('3', '1000', '0', '提现', '1012', '1');
INSERT INTO `vouchercore` VALUES ('4', '230', '0', '买水果', '1001', '2');
INSERT INTO `vouchercore` VALUES ('5', '0', '230', '买水果', '1401', '2');

-- ----------------------------
-- Table structure for vouchergroup
-- ----------------------------
DROP TABLE IF EXISTS `vouchergroup`;
CREATE TABLE `vouchergroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `isdefault` bit(1) NOT NULL,
  `name` varchar(4) DEFAULT NULL,
  `title` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of vouchergroup
-- ----------------------------
INSERT INTO `vouchergroup` VALUES ('1', '', '记', '记账凭证');
INSERT INTO `vouchergroup` VALUES ('2', '\0', '收', '收账凭证');
INSERT INTO `vouchergroup` VALUES ('3', '\0', '付', '付款凭证');
INSERT INTO `vouchergroup` VALUES ('4', '\0', '转', '转账凭证');
SET FOREIGN_KEY_CHECKS=1;
