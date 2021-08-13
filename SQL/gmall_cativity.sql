/*
SQLyog Ultimate v13.1.1 (64 bit)
MySQL - 5.7.34 : Database - gmall_activity
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`gmall_activity` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `gmall_activity`;

/*Table structure for table `activity_info` */

DROP TABLE IF EXISTS `activity_info`;

CREATE TABLE `activity_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '活动id',
  `activity_name` varchar(200) DEFAULT NULL COMMENT '活动名称',
  `activity_type` varchar(20) DEFAULT NULL COMMENT '活动类型（1：满减，2：折扣）',
  `activity_desc` varchar(2000) DEFAULT NULL COMMENT '活动描述',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='活动表';

/*Data for the table `activity_info` */

insert  into `activity_info`(`id`,`activity_name`,`activity_type`,`activity_desc`,`start_time`,`end_time`,`create_time`) values 
(1,'屯年货','FULL_REDUCTION','过年买年货啦...啦啦...','2021-01-17 11:53:51','2021-01-30 00:00:00','2021-01-18 11:54:08'),
(2,'迎春节','FULL_DISCOUNT','满量就减减减....','2021-01-17 11:54:37','2021-01-30 00:00:00','2021-01-18 11:55:02');

/*Table structure for table `activity_rule` */

DROP TABLE IF EXISTS `activity_rule`;

CREATE TABLE `activity_rule` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键编号',
  `activity_id` int(11) DEFAULT NULL COMMENT '活动Id',
  `condition_amount` decimal(16,2) DEFAULT NULL COMMENT '满减金额',
  `condition_num` bigint(20) DEFAULT NULL COMMENT '满减件数',
  `benefit_amount` decimal(16,2) DEFAULT NULL COMMENT '优惠金额',
  `benefit_discount` decimal(10,2) DEFAULT NULL COMMENT '优惠折扣',
  `benefit_level` bigint(20) DEFAULT NULL COMMENT '优惠级别',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='优惠规则';

/*Data for the table `activity_rule` */

insert  into `activity_rule`(`id`,`activity_id`,`condition_amount`,`condition_num`,`benefit_amount`,`benefit_discount`,`benefit_level`) values 
(16,2,NULL,5,NULL,9.00,NULL),
(17,2,NULL,10,NULL,7.00,NULL),
(18,1,5000.00,NULL,800.00,NULL,NULL),
(19,1,2000.00,NULL,200.00,NULL,NULL),
(20,1,1000.00,NULL,100.00,NULL,NULL);

/*Table structure for table `activity_sku` */

DROP TABLE IF EXISTS `activity_sku`;

CREATE TABLE `activity_sku` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键编号',
  `activity_id` bigint(20) DEFAULT NULL COMMENT '活动id ',
  `sku_id` bigint(20) DEFAULT NULL COMMENT 'sku_id',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='活动参与商品';

/*Data for the table `activity_sku` */

insert  into `activity_sku`(`id`,`activity_id`,`sku_id`,`create_time`) values 
(11,2,36,'2021-01-18 06:32:03'),
(12,2,37,'2021-01-18 06:32:03'),
(13,1,30,'2021-01-18 21:59:15'),
(14,1,31,'2021-01-18 21:59:15'),
(15,1,32,'2021-01-18 21:59:16'),
(16,1,33,'2021-01-18 21:59:16');

/*Table structure for table `coupon_info` */

DROP TABLE IF EXISTS `coupon_info`;

CREATE TABLE `coupon_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '购物券编号',
  `coupon_name` varchar(100) DEFAULT NULL COMMENT '购物券名称',
  `coupon_type` varchar(20) DEFAULT NULL COMMENT '购物券类型 1 现金券 2 折扣券 3 满减券 4 满件打折券',
  `condition_amount` decimal(10,2) DEFAULT NULL COMMENT '满额数（3）',
  `condition_num` bigint(20) DEFAULT NULL COMMENT '满件数（4）',
  `activity_id` bigint(20) DEFAULT NULL COMMENT '活动Id',
  `benefit_amount` decimal(16,2) DEFAULT NULL COMMENT '减金额（1 3）',
  `benefit_discount` decimal(10,2) DEFAULT NULL COMMENT '折扣（2 4）',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `range_type` varchar(20) DEFAULT NULL COMMENT '范围类型 1、商品(spuid) 2、品类(三级分类id) 3、品牌(tmid)',
  `limit_num` int(11) NOT NULL DEFAULT '0' COMMENT '最多领用次数',
  `taken_count` int(11) NOT NULL DEFAULT '0' COMMENT '已领用次数',
  `start_time` datetime DEFAULT NULL COMMENT '可以领取的开始日期',
  `end_time` datetime DEFAULT NULL COMMENT '可以领取的结束日期',
  `operate_time` datetime DEFAULT NULL COMMENT '修改时间',
  `expire_time` datetime DEFAULT NULL COMMENT '过期时间',
  `range_desc` varchar(500) DEFAULT NULL COMMENT '范围描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='优惠券表';

/*Data for the table `coupon_info` */

insert  into `coupon_info`(`id`,`coupon_name`,`coupon_type`,`condition_amount`,`condition_num`,`activity_id`,`benefit_amount`,`benefit_discount`,`create_time`,`range_type`,`limit_num`,`taken_count`,`start_time`,`end_time`,`operate_time`,`expire_time`,`range_desc`) values 
(2,'t01','CASH',NULL,NULL,1,1000.00,NULL,'2021-01-18 19:57:35','SPU',10,0,'2021-01-18 14:57:28','2021-01-30 00:00:00',NULL,'2021-01-22 00:00:00','可购买：小米CC9-0522,：华为 HUAWEI Mate 30 5G'),
(3,'t02','DISCOUNT',NULL,NULL,NULL,NULL,9.00,'2021-01-19 13:11:36','TRADEMARK',10,0,'2021-01-19 00:00:00','2021-01-30 00:00:00',NULL,'2021-01-23 00:00:00','可购买品牌：小米');

/*Table structure for table `coupon_range` */

DROP TABLE IF EXISTS `coupon_range`;

CREATE TABLE `coupon_range` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键编号',
  `coupon_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '购物券编号',
  `range_type` varchar(10) NOT NULL DEFAULT '' COMMENT '范围类型 1、商品(spuid) 2、品类(三级分类id) 3、品牌(tmid)',
  `range_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '范围类型对应的Id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='优惠券范围表';

/*Data for the table `coupon_range` */

insert  into `coupon_range`(`id`,`coupon_id`,`range_type`,`range_id`) values 
(2,2,'SPU',16),
(3,2,'SPU',2),
(4,3,'TRADEMARK',4);

/*Table structure for table `coupon_use` */

DROP TABLE IF EXISTS `coupon_use`;

CREATE TABLE `coupon_use` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键编号',
  `coupon_id` bigint(20) DEFAULT NULL COMMENT '购物券编号',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单ID',
  `coupon_status` varchar(10) DEFAULT NULL COMMENT '购物券状态（1：未使用 2：已使用）',
  `get_time` datetime DEFAULT NULL COMMENT '获取时间',
  `using_time` datetime DEFAULT NULL COMMENT '使用时间',
  `used_time` datetime DEFAULT NULL COMMENT '支付时间',
  `expire_time` datetime DEFAULT NULL COMMENT '过期时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='优惠券领用表';

/*Data for the table `coupon_use` */

insert  into `coupon_use`(`id`,`coupon_id`,`user_id`,`order_id`,`coupon_status`,`get_time`,`using_time`,`used_time`,`expire_time`) values 
(5,3,2,NULL,'NOT_USED','2021-01-20 10:51:54',NULL,NULL,'2021-01-23 00:00:00'),
(6,2,2,NULL,'NOT_USED','2021-01-21 20:42:15',NULL,NULL,'2021-01-22 00:00:00');

/*Table structure for table `seckill_goods` */

DROP TABLE IF EXISTS `seckill_goods`;

CREATE TABLE `seckill_goods` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `spu_id` bigint(20) DEFAULT NULL COMMENT 'spu_id',
  `sku_id` bigint(20) DEFAULT NULL COMMENT 'sku_id',
  `sku_name` varchar(100) DEFAULT NULL COMMENT '标题',
  `sku_default_img` varchar(150) DEFAULT NULL COMMENT '商品图片',
  `price` decimal(10,2) DEFAULT NULL COMMENT '原价格',
  `cost_price` decimal(10,2) DEFAULT NULL COMMENT '秒杀价格',
  `create_time` datetime DEFAULT NULL COMMENT '添加日期',
  `check_time` datetime DEFAULT NULL COMMENT '审核日期',
  `status` varchar(1) DEFAULT NULL COMMENT '审核状态',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `num` int(11) DEFAULT NULL COMMENT '秒杀商品数',
  `stock_count` int(11) DEFAULT NULL COMMENT '剩余库存数',
  `sku_desc` varchar(2000) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `seckill_goods` */

insert  into `seckill_goods`(`id`,`spu_id`,`sku_id`,`sku_name`,`sku_default_img`,`price`,`cost_price`,`create_time`,`check_time`,`status`,`start_time`,`end_time`,`num`,`stock_count`,`sku_desc`) values 
(1,56,30,'Apple苹果iPhone 6s 32G金色 移动联通电','http://www.gmall.com/img/_/b1.png',100.00,0.01,NULL,NULL,'1','2020-01-06 08:00:00','2020-12-31 22:00:00',10,10,NULL),
(2,13,29,'荣耀V30 PRO DXO122分 5G双模 麒麟990 5GSOC芯片 双超级快充 游戏手机8GB+256GB幻夜星河 双卡双待','http://192.168.200.128:8080/group1/M00/00/01/wKjIgF90ajWETassAAAAAHTzbJo040.png',3699.00,100.00,NULL,NULL,'1','2020-10-29 07:48:46','2020-10-29 18:49:06',10,10,NULL),
(3,16,31,'0522 小米cc9e手机 蓝色（深蓝星球） 6G+64G 全网通','http://192.168.200.128:8080/group1/M00/00/02/wKjIgF-lKCGETWpkAAAAAHx6uAE137.png',1348.00,1.00,NULL,NULL,'1','2020-11-27 08:36:55','2020-11-28 13:37:00',10,8,NULL),
(4,23,38,'0621 小米CC9 手机 美图定制版 仙女渐变色 全网通(6G+64G)','http://192.168.200.128:8080/group1/M00/00/02/wKjIgF_HciCEbs_xAAAAANgmDQ8058.png',1999.00,1.00,NULL,NULL,'1','2020-12-25 11:20:39','2020-12-26 14:20:46',10,8,NULL),
(5,23,39,'0621 小米CC9 手机 美图定制版 仙女渐变色 全网通(6G+64G)','http://192.168.200.128:8080/group1/M00/00/02/wKjIgF_HciCEbs_xAAAAANgmDQ8058.png',1999.00,1.00,NULL,NULL,'1','2021-05-10 19:46:34','2021-05-11 19:46:48',10,8,NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
