/*
SQLyog Ultimate v13.1.1 (64 bit)
MySQL - 5.7.34 : Database - gmall_ware
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`gmall_ware` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `gmall_ware`;

/*Table structure for table `ware_info` */

DROP TABLE IF EXISTS `ware_info`;

CREATE TABLE `ware_info` (
  `id` bigint(20) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `areacode` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `ware_info` */

insert  into `ware_info`(`id`,`name`,`address`,`areacode`) values 
(1,'北京大兴仓库','北京大兴','110000'),
(2,'北京昌平区仓库','北京昌平','110100');

/*Table structure for table `ware_order_task` */

DROP TABLE IF EXISTS `ware_order_task`;

CREATE TABLE `ware_order_task` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单编号',
  `consignee` varchar(100) DEFAULT NULL COMMENT '收货人',
  `consignee_tel` varchar(20) DEFAULT NULL COMMENT '收货人电话',
  `delivery_address` varchar(1000) DEFAULT NULL COMMENT '送货地址',
  `order_comment` varchar(200) DEFAULT NULL COMMENT '订单备注',
  `payment_way` varchar(2) DEFAULT NULL COMMENT '付款方式 1:在线付款 2:货到付款',
  `task_status` varchar(20) DEFAULT NULL COMMENT '工作单状态',
  `order_body` varchar(200) DEFAULT NULL COMMENT '订单描述',
  `tracking_no` varchar(200) DEFAULT NULL COMMENT '物流单号',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `ware_id` bigint(20) DEFAULT NULL COMMENT '仓库编号',
  `task_comment` varchar(500) DEFAULT NULL COMMENT '工作单备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8 COMMENT='库存工作单表 库存工作单表';

/*Data for the table `ware_order_task` */

insert  into `ware_order_task`(`id`,`order_id`,`consignee`,`consignee_tel`,`delivery_address`,`order_comment`,`payment_way`,`task_status`,`order_body`,`tracking_no`,`create_time`,`ware_id`,`task_comment`) values 
(52,197,'admin','123456789','北京市昌平区北七家','','2','SPLIT','购买笔记本...',NULL,'2021-05-15 17:08:22',NULL,NULL),
(53,204,'admin','123456789','北京市昌平区北七家','','2','DEDUCTED','购买笔记本...',NULL,'2021-05-15 17:08:22',1,NULL),
(54,205,'admin','123456789','北京市昌平区北七家','','2','DEDUCTED','购买笔记本...',NULL,'2021-05-15 17:08:22',2,NULL),
(55,206,'admin','123456789','北京市昌平区北七家','','2','SPLIT','购买笔记本...',NULL,'2021-06-25 19:52:14',NULL,NULL),
(56,207,'admin','123456789','北京市昌平区北七家','','2','DEDUCTED','购买笔记本...',NULL,'2021-06-25 19:52:15',1,NULL),
(57,208,'admin','123456789','北京市昌平区北七家','','2','DEDUCTED','购买笔记本...',NULL,'2021-06-25 19:52:15',2,NULL);

/*Table structure for table `ware_order_task_detail` */

DROP TABLE IF EXISTS `ware_order_task_detail`;

CREATE TABLE `ware_order_task_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `sku_id` bigint(20) DEFAULT NULL COMMENT 'sku_id',
  `sku_name` varchar(200) DEFAULT NULL COMMENT 'sku名称',
  `sku_num` int(11) DEFAULT NULL COMMENT '购买个数',
  `task_id` bigint(20) DEFAULT NULL COMMENT '工作单编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8 COMMENT='库存工作单明细表 库存工作单明细表';

/*Data for the table `ware_order_task_detail` */

insert  into `ware_order_task_detail`(`id`,`sku_id`,`sku_name`,`sku_num`,`task_id`) values 
(77,42,'小米 CC9 手机 美颜自拍 游戏手机 蓝色（深蓝星球） 全网通 6GB+128GB',3,52),
(78,43,'小米 CC9 手机 美颜自拍 游戏手机 仙女渐变色（美图定制版） 全网通 6GB+128GB',1,52),
(79,42,'小米 CC9 手机 美颜自拍 游戏手机 蓝色（深蓝星球） 全网通 6GB+128GB',3,53),
(80,43,'小米 CC9 手机 美颜自拍 游戏手机 仙女渐变色（美图定制版） 全网通 6GB+128GB',1,54),
(81,43,'小米 CC9 手机 美颜自拍 游戏手机 仙女渐变色（美图定制版） 全网通 6GB+128GB',1,55),
(82,42,'小米 CC9 手机 美颜自拍 游戏手机 蓝色（深蓝星球） 全网通 6GB+128GB',3,55),
(83,42,'小米 CC9 手机 美颜自拍 游戏手机 蓝色（深蓝星球） 全网通 6GB+128GB',3,56),
(84,43,'小米 CC9 手机 美颜自拍 游戏手机 仙女渐变色（美图定制版） 全网通 6GB+128GB',1,57);

/*Table structure for table `ware_sku` */

DROP TABLE IF EXISTS `ware_sku`;

CREATE TABLE `ware_sku` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `sku_id` bigint(20) DEFAULT NULL COMMENT 'skuid',
  `warehouse_id` bigint(20) DEFAULT NULL COMMENT '仓库id',
  `stock` int(11) DEFAULT NULL COMMENT '库存数',
  `stock_name` varchar(200) DEFAULT NULL COMMENT '存货名称',
  `stock_locked` int(11) DEFAULT NULL COMMENT '锁定库存数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='sku与仓库关联表';

/*Data for the table `ware_sku` */

insert  into `ware_sku`(`id`,`sku_id`,`warehouse_id`,`stock`,`stock_name`,`stock_locked`) values 
(1,43,2,10000,'小米 CC9 手机 美颜自拍 游戏手机 仙女渐变色（美图定制版） 全网通 6GB+128GB',4),
(2,42,1,10000,'小米 CC9 手机 美颜自拍 游戏手机 蓝色（深蓝星球） 全网通 6GB+128GB',12);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
