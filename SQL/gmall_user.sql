/*
SQLyog Ultimate v13.1.1 (64 bit)
MySQL - 5.7.34 : Database - gmall_user
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`gmall_user` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `gmall_user`;

/*Table structure for table `user_address` */

DROP TABLE IF EXISTS `user_address`;

CREATE TABLE `user_address` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_address` varchar(500) DEFAULT NULL COMMENT '用户地址',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `consignee` varchar(40) DEFAULT NULL COMMENT '收件人',
  `phone_num` varchar(40) DEFAULT NULL COMMENT '联系方式',
  `is_default` varchar(1) DEFAULT NULL COMMENT '是否是默认',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='用户地址表';

/*Data for the table `user_address` */

insert  into `user_address`(`id`,`user_address`,`user_id`,`consignee`,`phone_num`,`is_default`) values 
(1,'北京市海淀区',1,'atguigu','1','0'),
(2,'北京市昌平区北七家',2,'admin','123456789','1'),
(3,'北京市大兴区',3,'atguigu666','13833456789','0');

/*Table structure for table `user_info` */

DROP TABLE IF EXISTS `user_info`;

CREATE TABLE `user_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `login_name` varchar(200) DEFAULT NULL COMMENT '用户名称',
  `nick_name` varchar(200) DEFAULT NULL COMMENT '用户昵称',
  `passwd` varchar(200) DEFAULT NULL COMMENT '用户密码',
  `name` varchar(200) DEFAULT NULL COMMENT '用户姓名',
  `phone_num` varchar(200) DEFAULT NULL COMMENT '手机号',
  `email` varchar(200) DEFAULT NULL COMMENT '邮箱',
  `head_img` varchar(200) DEFAULT NULL COMMENT '头像',
  `user_level` varchar(200) DEFAULT NULL COMMENT '用户级别',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='用户表';

/*Data for the table `user_info` */

insert  into `user_info`(`id`,`login_name`,`nick_name`,`passwd`,`name`,`phone_num`,`email`,`head_img`,`user_level`) values 
(1,'atguigu','Atguigu','96e79218965eb72c92a549dd5a330112','尚硅谷','11111','atguigu.com','1','1'),
(2,'13700000000','Administrator','96e79218965eb72c92a549dd5a330112','Admin','2222','upd@qq.com','2','2'),
(3,'admin','admin','96e79218965eb72c92a549dd5a330112','haha','123','atguigu.com','3','3');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
