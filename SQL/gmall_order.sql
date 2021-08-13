/*
SQLyog Ultimate v13.1.1 (64 bit)
MySQL - 5.7.34 : Database - gmall_order
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`gmall_order` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `gmall_order`;

/*Table structure for table `cart_info` */

DROP TABLE IF EXISTS `cart_info`;

CREATE TABLE `cart_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` varchar(200) DEFAULT NULL COMMENT '用户id',
  `sku_id` bigint(20) DEFAULT NULL COMMENT 'skuid',
  `cart_price` decimal(10,2) DEFAULT NULL COMMENT '放入购物车时价格',
  `sku_num` int(11) DEFAULT NULL COMMENT '数量',
  `img_url` varchar(500) DEFAULT NULL COMMENT '图片文件',
  `sku_name` varchar(200) DEFAULT NULL COMMENT 'sku名称 (冗余)',
  `is_checked` int(1) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='购物车表 用户登录系统时更新冗余';

/*Data for the table `cart_info` */

insert  into `cart_info`(`id`,`user_id`,`sku_id`,`cart_price`,`sku_num`,`img_url`,`sku_name`,`is_checked`,`create_time`,`update_time`) values 
(84,'2',42,1943.00,3,'http://39.99.159.121:9000/gmall/16210458153701.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=admin%2F20210515%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20210515T023015Z&X-Amz-Expires=604800&X-Amz-SignedHeaders=host&X-Amz-Signature=d8d4bb30f4e9c898c129fcf90f8fc40935b3459867bc0b91d1f6f84aca1412bf','小米 CC9 手机 美颜自拍 游戏手机 蓝色（深蓝星球） 全网通 6GB+128GB',1,'2021-05-15 16:12:54','2021-05-15 16:13:36'),
(85,'2',43,2200.00,1,'http://39.99.159.121:9000/gmall/16210458211101.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=admin%2F20210515%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20210515T023021Z&X-Amz-Expires=604800&X-Amz-SignedHeaders=host&X-Amz-Signature=161460900fe1be3f92e8fcf27db3d14a98533002ad2c78bebf0ed46135f4f50e','小米 CC9 手机 美颜自拍 游戏手机 仙女渐变色（美图定制版） 全网通 6GB+128GB',1,'2021-05-15 16:13:27','2021-05-15 16:13:27');

/*Table structure for table `order_detail` */

DROP TABLE IF EXISTS `order_detail`;

CREATE TABLE `order_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单编号',
  `sku_id` bigint(20) DEFAULT NULL COMMENT 'sku_id',
  `sku_name` varchar(200) DEFAULT NULL COMMENT 'sku名称（冗余)',
  `img_url` varchar(500) DEFAULT NULL COMMENT '图片名称（冗余)',
  `order_price` decimal(10,0) DEFAULT NULL COMMENT '购买价格(下单时sku价格）',
  `sku_num` varchar(200) DEFAULT NULL COMMENT '购买个数',
  `create_time` datetime DEFAULT NULL COMMENT '操作时间',
  `split_total_amount` decimal(10,2) DEFAULT NULL COMMENT '实际支付金额',
  `split_activity_amount` decimal(10,2) DEFAULT NULL COMMENT '促销分摊金额',
  `split_coupon_amount` decimal(10,2) DEFAULT NULL COMMENT '优惠券分摊金额',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=333 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='订单明细表';

/*Data for the table `order_detail` */

insert  into `order_detail`(`id`,`order_id`,`sku_id`,`sku_name`,`img_url`,`order_price`,`sku_num`,`create_time`,`split_total_amount`,`split_activity_amount`,`split_coupon_amount`) values 
(317,197,42,'小米 CC9 手机 美颜自拍 游戏手机 蓝色（深蓝星球） 全网通 6GB+128GB','http://39.99.159.121:9000/gmall/16210458153701.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=admin%2F20210515%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20210515T023015Z&X-Amz-Expires=604800&X-Amz-SignedHeaders=host&X-Amz-Signature=d8d4bb30f4e9c898c129fcf90f8fc40935b3459867bc0b91d1f6f84aca1412bf',1943,'3',NULL,NULL,NULL,NULL),
(318,197,43,'小米 CC9 手机 美颜自拍 游戏手机 仙女渐变色（美图定制版） 全网通 6GB+128GB','http://39.99.159.121:9000/gmall/16210458211101.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=admin%2F20210515%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20210515T023021Z&X-Amz-Expires=604800&X-Amz-SignedHeaders=host&X-Amz-Signature=161460900fe1be3f92e8fcf27db3d14a98533002ad2c78bebf0ed46135f4f50e',2200,'1',NULL,NULL,NULL,NULL),
(327,204,42,'小米 CC9 手机 美颜自拍 游戏手机 蓝色（深蓝星球） 全网通 6GB+128GB','http://39.99.159.121:9000/gmall/16210458153701.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=admin%2F20210515%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20210515T023015Z&X-Amz-Expires=604800&X-Amz-SignedHeaders=host&X-Amz-Signature=d8d4bb30f4e9c898c129fcf90f8fc40935b3459867bc0b91d1f6f84aca1412bf',1943,'3',NULL,NULL,NULL,NULL),
(328,205,43,'小米 CC9 手机 美颜自拍 游戏手机 仙女渐变色（美图定制版） 全网通 6GB+128GB','http://39.99.159.121:9000/gmall/16210458211101.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=admin%2F20210515%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20210515T023021Z&X-Amz-Expires=604800&X-Amz-SignedHeaders=host&X-Amz-Signature=161460900fe1be3f92e8fcf27db3d14a98533002ad2c78bebf0ed46135f4f50e',2200,'1',NULL,NULL,NULL,NULL),
(329,206,43,'小米 CC9 手机 美颜自拍 游戏手机 仙女渐变色（美图定制版） 全网通 6GB+128GB','http://39.99.159.121:9000/gmall/16210458211101.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=admin%2F20210515%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20210515T023021Z&X-Amz-Expires=604800&X-Amz-SignedHeaders=host&X-Amz-Signature=161460900fe1be3f92e8fcf27db3d14a98533002ad2c78bebf0ed46135f4f50e',2200,'1',NULL,NULL,NULL,NULL),
(330,206,42,'小米 CC9 手机 美颜自拍 游戏手机 蓝色（深蓝星球） 全网通 6GB+128GB','http://39.99.159.121:9000/gmall/16210458153701.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=admin%2F20210515%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20210515T023015Z&X-Amz-Expires=604800&X-Amz-SignedHeaders=host&X-Amz-Signature=d8d4bb30f4e9c898c129fcf90f8fc40935b3459867bc0b91d1f6f84aca1412bf',1943,'3',NULL,NULL,NULL,NULL),
(331,207,42,'小米 CC9 手机 美颜自拍 游戏手机 蓝色（深蓝星球） 全网通 6GB+128GB','http://39.99.159.121:9000/gmall/16210458153701.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=admin%2F20210515%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20210515T023015Z&X-Amz-Expires=604800&X-Amz-SignedHeaders=host&X-Amz-Signature=d8d4bb30f4e9c898c129fcf90f8fc40935b3459867bc0b91d1f6f84aca1412bf',1943,'3',NULL,NULL,NULL,NULL),
(332,208,43,'小米 CC9 手机 美颜自拍 游戏手机 仙女渐变色（美图定制版） 全网通 6GB+128GB','http://39.99.159.121:9000/gmall/16210458211101.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=admin%2F20210515%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20210515T023021Z&X-Amz-Expires=604800&X-Amz-SignedHeaders=host&X-Amz-Signature=161460900fe1be3f92e8fcf27db3d14a98533002ad2c78bebf0ed46135f4f50e',2200,'1',NULL,NULL,NULL,NULL);

/*Table structure for table `order_detail_activity` */

DROP TABLE IF EXISTS `order_detail_activity`;

CREATE TABLE `order_detail_activity` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `order_detail_id` bigint(20) DEFAULT NULL COMMENT '订单明细id',
  `activity_id` bigint(20) DEFAULT NULL COMMENT '活动ID',
  `activity_rule` bigint(20) DEFAULT NULL COMMENT '活动规则',
  `sku_id` bigint(20) DEFAULT NULL COMMENT 'sku_id',
  `create_time` datetime DEFAULT NULL COMMENT '获取时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单明细活动表';

/*Data for the table `order_detail_activity` */

/*Table structure for table `order_detail_coupon` */

DROP TABLE IF EXISTS `order_detail_coupon`;

CREATE TABLE `order_detail_coupon` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `order_detail_id` bigint(20) DEFAULT NULL COMMENT '订单明细id',
  `coupon_id` bigint(20) DEFAULT NULL COMMENT '购物券ID',
  `sku_id` bigint(20) DEFAULT NULL COMMENT 'sku_id',
  `create_time` datetime DEFAULT NULL COMMENT '获取时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单明细购物券表';

/*Data for the table `order_detail_coupon` */

/*Table structure for table `order_info` */

DROP TABLE IF EXISTS `order_info`;

CREATE TABLE `order_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `consignee` varchar(100) DEFAULT NULL COMMENT '收货人',
  `consignee_tel` varchar(20) DEFAULT NULL COMMENT '收件人电话',
  `total_amount` decimal(10,2) DEFAULT NULL COMMENT '总金额',
  `order_status` varchar(20) DEFAULT NULL COMMENT '订单状态',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `payment_way` varchar(20) DEFAULT NULL COMMENT '付款方式',
  `delivery_address` varchar(1000) DEFAULT NULL COMMENT '送货地址',
  `order_comment` varchar(200) DEFAULT NULL COMMENT '订单备注',
  `out_trade_no` varchar(50) DEFAULT NULL COMMENT '订单交易编号（第三方支付用)',
  `trade_body` varchar(200) DEFAULT NULL COMMENT '订单描述(第三方支付用)',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `expire_time` datetime DEFAULT NULL COMMENT '失效时间',
  `process_status` varchar(20) DEFAULT NULL COMMENT '进度状态',
  `tracking_no` varchar(100) DEFAULT NULL COMMENT '物流单编号',
  `parent_order_id` bigint(20) DEFAULT NULL COMMENT '父订单编号',
  `img_url` varchar(500) DEFAULT NULL COMMENT '图片路径',
  `province_id` bigint(20) DEFAULT NULL COMMENT '省id',
  `operate_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '操作时间',
  `activity_reduce_amount` decimal(10,2) DEFAULT NULL COMMENT '促销金额',
  `coupon_amount` decimal(10,2) DEFAULT NULL COMMENT '优惠券金额',
  `original_total_amount` decimal(10,2) DEFAULT NULL COMMENT '原价金额',
  `feight_fee` decimal(10,2) DEFAULT NULL COMMENT '运费',
  `refundable_time` datetime DEFAULT NULL COMMENT '可退款日期（签收后30天）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=209 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='订单表 订单表';

/*Data for the table `order_info` */

insert  into `order_info`(`id`,`consignee`,`consignee_tel`,`total_amount`,`order_status`,`user_id`,`payment_way`,`delivery_address`,`order_comment`,`out_trade_no`,`trade_body`,`create_time`,`expire_time`,`process_status`,`tracking_no`,`parent_order_id`,`img_url`,`province_id`,`operate_time`,`activity_reduce_amount`,`coupon_amount`,`original_total_amount`,`feight_fee`,`refundable_time`) values 
(197,'admin','123456789',8029.00,'SPLIT',2,'ONLINE','北京市昌平区北七家','','ATGUIGU1621067085923832','购买笔记本...','2021-05-15 16:24:46','2021-05-16 16:24:46','SPLIT',NULL,NULL,NULL,NULL,'2021-05-15 09:08:22',NULL,0.00,8029.00,NULL,NULL),
(204,'admin','123456789',5829.00,'WAITING_DELEVER',2,'ONLINE','北京市昌平区北七家','','ATGUIGU1621069702123572','购买笔记本...','2021-05-15 17:08:22','2021-05-16 17:08:22','WAITING_DELEVER',NULL,197,NULL,NULL,'2021-05-15 09:08:22',NULL,0.00,5829.00,NULL,NULL),
(205,'admin','123456789',2200.00,'WAITING_DELEVER',2,'ONLINE','北京市昌平区北七家','','ATGUIGU1621069702151502','购买笔记本...','2021-05-15 17:08:22','2021-05-16 17:08:22','WAITING_DELEVER',NULL,197,NULL,NULL,'2021-05-15 09:08:23',NULL,0.00,2200.00,NULL,NULL),
(206,'admin','123456789',8029.00,'SPLIT',2,'ONLINE','北京市昌平区北七家','','ATGUIGU1624621885794912','购买笔记本...','2021-06-25 19:51:26','2021-06-26 19:51:26','SPLIT',NULL,NULL,NULL,NULL,'2021-06-25 11:52:12',NULL,0.00,8029.00,NULL,NULL),
(207,'admin','123456789',5829.00,'WAITING_DELEVER',2,'ONLINE','北京市昌平区北七家','','ATGUIGU1624621934677358','购买笔记本...','2021-06-25 19:52:15','2021-06-26 19:52:15','WAITING_DELEVER',NULL,206,NULL,NULL,'2021-06-25 11:52:12',NULL,0.00,5829.00,NULL,NULL),
(208,'admin','123456789',2200.00,'WAITING_DELEVER',2,'ONLINE','北京市昌平区北七家','','ATGUIGU162462193469212','购买笔记本...','2021-06-25 19:52:15','2021-06-26 19:52:15','WAITING_DELEVER',NULL,206,NULL,NULL,'2021-06-25 11:52:12',NULL,0.00,2200.00,NULL,NULL);

/*Table structure for table `order_status_log` */

DROP TABLE IF EXISTS `order_status_log`;

CREATE TABLE `order_status_log` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `order_id` bigint(11) DEFAULT NULL COMMENT '订单id',
  `order_status` varchar(11) DEFAULT NULL COMMENT '订单状态',
  `operate_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `order_status_log` */

/*Table structure for table `payment_info` */

DROP TABLE IF EXISTS `payment_info`;

CREATE TABLE `payment_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `out_trade_no` varchar(50) DEFAULT NULL COMMENT '对外业务编号',
  `order_id` varchar(50) DEFAULT NULL COMMENT '订单编号',
  `payment_type` varchar(20) DEFAULT NULL COMMENT '支付类型（微信 支付宝）',
  `trade_no` varchar(50) DEFAULT NULL COMMENT '交易编号',
  `total_amount` decimal(10,2) DEFAULT NULL COMMENT '支付金额',
  `subject` varchar(200) DEFAULT NULL COMMENT '交易内容',
  `payment_status` varchar(20) DEFAULT NULL COMMENT '支付状态',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `callback_time` datetime DEFAULT NULL COMMENT '回调时间',
  `callback_content` varchar(1000) DEFAULT NULL COMMENT '回调信息',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='支付信息表';

/*Data for the table `payment_info` */

insert  into `payment_info`(`id`,`out_trade_no`,`order_id`,`payment_type`,`trade_no`,`total_amount`,`subject`,`payment_status`,`create_time`,`callback_time`,`callback_content`) values 
(100,'ATGUIGU1621067085923832','197','ALIPAY','2021051522001456601403881218',8029.00,'购买笔记本...','PAID','2021-05-15 17:08:10','2021-05-15 17:08:22','{gmt_create=2021-05-15 17:08:16, charset=utf-8, gmt_payment=2021-05-15 17:08:21, notify_time=2021-05-15 17:08:21, subject=购买笔记本..., buyer_id=2088702818256601, invoice_amount=0.01, version=1.0, notify_id=2021051500222170821056601452962776, fund_bill_list=[{\"amount\":\"0.01\",\"fundChannel\":\"PCREDIT\"}], notify_type=trade_status_sync, out_trade_no=ATGUIGU1621067085923832, total_amount=0.01, trade_status=TRADE_SUCCESS, trade_no=2021051522001456601403881218, auth_app_id=2021001163617452, receipt_amount=0.01, point_amount=0.00, buyer_pay_amount=0.01, app_id=2021001163617452, seller_id=2088831489324244}'),
(101,'ATGUIGU1624621885794912','206','ALIPAY','2021062522001456601433058226',8029.00,'购买笔记本...','PAID','2021-06-25 19:51:30','2021-06-25 19:52:14','{gmt_create=2021-06-25 19:51:41, charset=utf-8, gmt_payment=2021-06-25 19:52:10, notify_time=2021-06-25 19:52:11, subject=购买笔记本..., buyer_id=2088702818256601, invoice_amount=0.01, version=1.0, notify_id=2021062500222195211056601455093366, fund_bill_list=[{\"amount\":\"0.01\",\"fundChannel\":\"PCREDIT\"}], notify_type=trade_status_sync, out_trade_no=ATGUIGU1624621885794912, total_amount=0.01, trade_status=TRADE_SUCCESS, trade_no=2021062522001456601433058226, auth_app_id=2021001163617452, receipt_amount=0.01, point_amount=0.00, buyer_pay_amount=0.01, app_id=2021001163617452, seller_id=2088831489324244}');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
