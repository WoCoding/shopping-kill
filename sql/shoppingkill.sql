/*
 Navicat Premium Data Transfer

 Source Server         : 121.196.187.160
 Source Server Type    : MySQL
 Source Server Version : 50731
 Source Host           : 121.196.187.160:3306
 Source Schema         : shoppingkill

 Target Server Type    : MySQL
 Target Server Version : 50731
 File Encoding         : 65001

 Date: 05/11/2020 00:51:26
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_activity
-- ----------------------------
DROP TABLE IF EXISTS `t_activity`;
CREATE TABLE `t_activity` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '秒杀活动',
  `goods_id` bigint(20) DEFAULT NULL COMMENT '商品id',
  `start_time` datetime NOT NULL COMMENT '开始时间',
  `end_time` datetime NOT NULL COMMENT '结束时间',
  `creat_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '跟新时间',
  `del_flag` tinyint(1) DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='限时抢购活动表';

-- ----------------------------
-- Table structure for t_activity_limit
-- ----------------------------
DROP TABLE IF EXISTS `t_activity_limit`;
CREATE TABLE `t_activity_limit` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `sku_id` bigint(20) DEFAULT NULL COMMENT 'skuId',
  `activity_id` bigint(20) DEFAULT NULL COMMENT '活动id',
  `limit_num` int(11) DEFAULT '0' COMMENT '上限数量',
  `creat_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `del_flag` tinyint(1) DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='SKU在秒杀时候限制上限数量';

-- ----------------------------
-- Table structure for t_address
-- ----------------------------
DROP TABLE IF EXISTS `t_address`;
CREATE TABLE `t_address` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '地址id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `name` varchar(10) DEFAULT NULL COMMENT '收件人姓名',
  `phone` varchar(11) DEFAULT NULL COMMENT '收件人电话',
  `address` varchar(50) DEFAULT NULL COMMENT '地址',
  `address_num` int(8) DEFAULT NULL COMMENT '邮编',
  `status` tinyint(1) DEFAULT NULL COMMENT '是否是默认的',
  `creat_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='收货地址';

-- ----------------------------
-- Table structure for t_admin
-- ----------------------------
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(50) DEFAULT NULL COMMENT '账户',
  `password` varchar(255) NOT NULL COMMENT '密码',
  `sex` int(1) DEFAULT NULL COMMENT '性别',
  `id_card` varchar(18) NOT NULL COMMENT '身份证号',
  `phone` char(11) NOT NULL COMMENT '手机号',
  `address` varchar(50) NOT NULL COMMENT '家庭住址',
  `we_chat` varchar(10) DEFAULT NULL COMMENT '微信',
  `creat_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '跟新时间',
  `del_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否离职',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_card` (`id_card`),
  UNIQUE KEY `phone` (`phone`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='管理员表';

-- ----------------------------
-- Table structure for t_advertise
-- ----------------------------
DROP TABLE IF EXISTS `t_advertise`;
CREATE TABLE `t_advertise` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '广告id',
  `img_url` varchar(10) DEFAULT NULL COMMENT '广告图片链接',
  `target_url` varchar(30) DEFAULT NULL COMMENT '目标url',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `creat_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `del_flag` tinyint(1) DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='广告内容';

-- ----------------------------
-- Table structure for t_after_sales
-- ----------------------------
DROP TABLE IF EXISTS `t_after_sales`;
CREATE TABLE `t_after_sales` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `order_id` varchar(18) DEFAULT NULL COMMENT '订单id',
  `admin_id` bigint(20) DEFAULT NULL COMMENT '管理员id',
  `detail` varchar(100) DEFAULT NULL COMMENT '处理内容',
  `type` int(1) DEFAULT NULL COMMENT '处理类型 （0-退货退款 1-换货 3-仅退款）',
  `deal_time` datetime DEFAULT NULL COMMENT '处理时间',
  `result` tinyint(1) DEFAULT '0' COMMENT '是否解决（0-未解决 1-已解决  默认0）',
  `creat_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `del_flag` tinyint(1) DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='售后记录表';

-- ----------------------------
-- Table structure for t_appraisal
-- ----------------------------
DROP TABLE IF EXISTS `t_appraisal`;
CREATE TABLE `t_appraisal` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `order_id` varchar(18) DEFAULT NULL COMMENT '订单id',
  `detail` varchar(50) DEFAULT NULL COMMENT '评价内容',
  `img_url` varchar(20) DEFAULT NULL COMMENT '评价图片',
  `grade` int(1) DEFAULT '5' COMMENT '评价星级（1-5）',
  `creat_time` datetime DEFAULT NULL COMMENT '创建时间（评价时间）',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `del_flag` tinyint(1) DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='评价表';

-- ----------------------------
-- Table structure for t_cart
-- ----------------------------
DROP TABLE IF EXISTS `t_cart`;
CREATE TABLE `t_cart` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '购物车id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `sku_id` bigint(20) DEFAULT NULL COMMENT 'sku_id',
  `creat_time` datetime DEFAULT NULL COMMENT '创建时间（加入时间）',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `status` int(1) DEFAULT '0' COMMENT '状态(0-正常 1-已失效)',
  `del_flag` tinyint(1) DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='购物车';

-- ----------------------------
-- Table structure for t_goods
-- ----------------------------
DROP TABLE IF EXISTS `t_goods`;
CREATE TABLE `t_goods` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '商品id',
  `name` varchar(50) NOT NULL COMMENT '商品名',
  `type_id` int(11) DEFAULT NULL COMMENT '类别id',
  `img_url` varchar(50) DEFAULT NULL COMMENT '图片地址',
  `shelf` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否上架',
  `detail` varchar(100) DEFAULT NULL COMMENT '商品描述',
  `creat_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `del_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品表';

-- ----------------------------
-- Table structure for t_limit_list
-- ----------------------------
DROP TABLE IF EXISTS `t_limit_list`;
CREATE TABLE `t_limit_list` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `type` int(1) NOT NULL COMMENT '类型(0-手机号 1-ip)',
  `number` varchar(20) NOT NULL COMMENT '号码',
  `status` int(1) DEFAULT '0' COMMENT '状态（0-黑名单 1-白名单）',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `creat_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `del_flag` tinyint(1) DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `number` (`number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='黑名单与白名单';

-- ----------------------------
-- Table structure for t_loggers
-- ----------------------------
DROP TABLE IF EXISTS `t_loggers`;
CREATE TABLE `t_loggers` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志id',
  `detail` varchar(30) DEFAULT NULL COMMENT '操作内容',
  `man_id` bigint(20) DEFAULT NULL COMMENT '操作人id',
  `type` int(1) DEFAULT NULL COMMENT '操作类型(0-用户 1-管理员)',
  `grade` int(1) DEFAULT NULL COMMENT '等级(0-正常 1-良好 2-严重 3-极其严重)',
  `creat_time` datetime DEFAULT NULL COMMENT '创建时间(操作时间)',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `del_flag` tinyint(1) DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_order
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order` (
  `id` varchar(18) NOT NULL COMMENT '订单id',
  `user_id` bigint(20) NOT NULL COMMENT '买家id',
  `sku_id` bigint(20) NOT NULL COMMENT 'sku_id',
  `num` int(11) NOT NULL COMMENT '购买数量',
  `order_time` datetime DEFAULT NULL COMMENT '下单时间',
  `pay_time` datetime DEFAULT NULL COMMENT '支付时间',
  `send_time` datetime DEFAULT NULL COMMENT '发货时间',
  `pay_type` int(1) DEFAULT NULL COMMENT '支付类型 (0-支付宝 1-微信 2-银行...)',
  `address_id` bigint(20) DEFAULT NULL COMMENT '地址id',
  `pay_price` decimal(10,2) DEFAULT NULL COMMENT '支付金额',
  `remark` varchar(20) DEFAULT NULL COMMENT '备注',
  `status` int(1) DEFAULT NULL COMMENT '订单状态(0-已下单未支付 1-已支付 2-已出库 3-已收货 4-已评价)',
  `creat_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `del_flag` tinyint(1) DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单表';

-- ----------------------------
-- Table structure for t_sku
-- ----------------------------
DROP TABLE IF EXISTS `t_sku`;
CREATE TABLE `t_sku` (
  `id` bigint(20) NOT NULL COMMENT 'SKU_ID',
  `goods_id` bigint(20) NOT NULL COMMENT '商品id',
  `attribute` varchar(50) NOT NULL COMMENT '商品属性',
  `img_url` varchar(50) DEFAULT NULL COMMENT '商品图片',
  `real_price` decimal(10,2) NOT NULL COMMENT '进价',
  `cost_price` decimal(10,2) NOT NULL COMMENT '成本价',
  `sell_price` decimal(10,2) NOT NULL COMMENT '售价',
  `num` int(11) NOT NULL COMMENT '数量',
  `warn_num` int(10) DEFAULT '10' COMMENT '预警量（默认10）',
  `exp_price` decimal(10,2) DEFAULT NULL COMMENT '快递费用',
  `creat_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `del_flag` tinyint(1) DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='SKU（商品的售卖产生的影响属性）';

-- ----------------------------
-- Table structure for t_subscription
-- ----------------------------
DROP TABLE IF EXISTS `t_subscription`;
CREATE TABLE `t_subscription` (
  `number` varchar(11) NOT NULL COMMENT '订阅者号',
  `type` int(1) NOT NULL COMMENT '订阅类型(0-手机订阅 1-邮件订阅)',
  `status` int(1) DEFAULT '0' COMMENT '状态(0-正常  1-取消)',
  `creat_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `del_flag` tinyint(1) DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订阅者表';

-- ----------------------------
-- Table structure for t_subscription_history
-- ----------------------------
DROP TABLE IF EXISTS `t_subscription_history`;
CREATE TABLE `t_subscription_history` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `title` varchar(30) DEFAULT NULL COMMENT '标题',
  `detail` varchar(255) DEFAULT NULL COMMENT '订阅内容',
  `type` int(1) DEFAULT NULL COMMENT '类型(0-手机  1-邮件)',
  `admin_id` int(11) DEFAULT NULL COMMENT '发布者id',
  `creat_time` datetime DEFAULT NULL COMMENT '创建时间(发布时间)',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `del_flag` tinyint(1) DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订阅历史表';

-- ----------------------------
-- Table structure for t_types
-- ----------------------------
DROP TABLE IF EXISTS `t_types`;
CREATE TABLE `t_types` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '类别id',
  `name` varchar(20) NOT NULL COMMENT '类别名字',
  `creat_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `del_flag` tinyint(1) DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品类别表';

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(20) DEFAULT NULL COMMENT '账号',
  `password` varchar(255) NOT NULL COMMENT '密码',
  `nick_name` varchar(20) NOT NULL COMMENT '昵称',
  `img` varchar(40) DEFAULT NULL COMMENT '头像',
  `sex` char(2) NOT NULL COMMENT '性别',
  `signature` varchar(10) DEFAULT NULL COMMENT '个性签名',
  `phone` char(11) NOT NULL COMMENT '手机号',
  `email` varchar(25) DEFAULT NULL COMMENT '邮箱',
  `id_card` varchar(18) DEFAULT NULL COMMENT '身份证号',
  `real_name` varchar(10) DEFAULT NULL COMMENT '真实姓名',
  `we_chat` varchar(20) DEFAULT NULL COMMENT '微信',
  `apply` varchar(15) DEFAULT NULL COMMENT '支付宝（暂时不用）',
  `creat_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '跟新时间',
  `del_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone` (`phone`) COMMENT '手机号非重复',
  UNIQUE KEY `id_card` (`id_card`) COMMENT '身份证非重复',
  UNIQUE KEY `name` (`name`) COMMENT '账号非重复'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

SET FOREIGN_KEY_CHECKS = 1;