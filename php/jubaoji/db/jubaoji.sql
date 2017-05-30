/*
SQLyog v10.2 
MySQL - 5.6.35 : Database - jubaoji_server
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`jubaoji_server` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `jubaoji_server`;

/*Table structure for table `jbj_account` */

DROP TABLE IF EXISTS `jbj_account`;

CREATE TABLE `jbj_account` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  `create_time` datetime NOT NULL,
  `modify_time` datetime NOT NULL,
  `user_id` bigint(20) NOT NULL COMMENT '手机号码',
  `out_trade_no` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '支付宝',
  `module` tinyint(4) DEFAULT NULL COMMENT '所属的功能模块（1.保证金，2.尾款支付，3.余额充值->待定）',
  `total_amount` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `receipt_amount` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `buyer_pay_amount` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `jbj_account` */

insert  into `jbj_account`(`id`,`is_deleted`,`create_time`,`modify_time`,`user_id`,`out_trade_no`,`module`,`total_amount`,`receipt_amount`,`buyer_pay_amount`) values (1,0,'2017-02-17 15:01:20','2017-02-17 15:01:20',0,'148731473411884605',1,'0.01','0.01','0.01'),(2,0,'2017-02-17 15:19:35','2017-02-17 15:19:35',0,'148731574385883814',1,'0.01','0.01','0.01'),(3,0,'2017-02-22 17:53:56','2017-02-22 17:53:56',0,'148731473411884606',1,'0.01','0.01','0.01'),(4,0,'2017-02-22 17:57:33','2017-02-22 17:57:33',0,'148731473411884607',1,'0.01','0.01','0.01'),(5,0,'2017-02-22 19:51:51','2017-02-22 19:51:51',0,'148731473411884608',1,'0.01','0.01','0.01'),(6,0,'2017-02-22 21:22:29','2017-02-22 21:22:29',0,'148731584385883845',2,'0.01','0.01','0.01'),(7,0,'2017-02-25 15:20:26','2017-02-25 15:20:26',0,'148731473411543208',1,'1.01','1.01','1.01');

/*Table structure for table `jbj_activity` */

DROP TABLE IF EXISTS `jbj_activity`;

CREATE TABLE `jbj_activity` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `banner` varchar(2083) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '活动顶部图片',
  `title` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '活动标题',
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '活动内容',
  `state` int(11) NOT NULL DEFAULT '1' COMMENT '活动状态，1:发布; 0:下架',
  `priority` int(11) NOT NULL,
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `jbj_activity` */

insert  into `jbj_activity`(`id`,`banner`,`title`,`content`,`state`,`priority`,`create_time`) values (1,'http://120.26.113.111/dev/uploads/activity/0a0493df13901fd03d79d013999acb36.jpg','南宋窑瓷器展','美石为玉，玉是石头的精华，佛道雅称为大地舍利子，是具有祛邪避凶的灵石，在世界（尤其是东亚）各地区受到广泛欢迎的一个。\r\n举办时间：2015年9月1日\r\n举办地点：杭州室姑山路省博物馆',0,2,'2015-11-03 11:24:02'),(2,'http://120.26.113.111/dev/uploads/activity/45f6e5b175343eae4223b6782dc82ce8.jpg','测试','测试',0,1,'2015-11-03 11:24:05'),(3,'http://120.26.113.111/dev/uploads/activity/0a0493df13901fd03d79d013999acb36.jpg','测试3','测试',1,3,'2015-11-03 11:24:07'),(4,'activity/dc39c85869ae3a4b95a3aff2c0d6408a.jpg','hello','hehe',0,0,'2015-11-03 11:24:10'),(5,'activity/dc39c85869ae3a4b95a3aff2c0d6408a.jpg','hello','hehe',0,0,'2015-11-03 11:24:11'),(6,'activity/dc39c85869ae3a4b95a3aff2c0d6408a.jpg','hello','hehe',0,0,'2015-11-03 11:24:15'),(7,'activity/ce1575f3b2dd55f8fff3875bc14197b6.jpg','hello','hehe',0,0,'2015-11-03 11:24:17'),(8,'activity/3c51c4f5ac2aba2adf7e610fb78efa26.jpg','hello','hehe',0,0,'2015-11-03 11:24:19'),(9,'treasure/ec535d96677fcd95ceaba5052d078517_x2.jpg','聚宝集上线','聚宝集上',1,1,'2015-11-03 11:24:21'),(10,'treasure/cca0716494a170c6b328bbf1a62dc047_x2.jpg','标题001','内容',0,0,'2015-11-03 11:24:23'),(11,'activity/e5868c35003bdbd08f359d9f78d58e9b.png','标题','内容',0,0,'2015-11-05 17:19:24'),(12,'activity/92401238c8bc46c36ee711ba728e7be7.png','聚宝集上线2222222','内容',0,2,'2015-11-06 11:02:48'),(13,'activity/e35789ec72e81cbfe07f12b17fa5d394.png','标题','内容',1,1,'2015-11-10 17:05:14'),(14,'activity/7b61044d6cbc48407739fb0b77074071.jpg','标题','聚宝集上',0,3,'2015-11-10 17:12:24'),(15,'activity/141adc7efe06d6dd49bf31ddff404e35.jpg','活动测试-陈','测试',1,1,'2015-11-10 17:14:04');

/*Table structure for table `jbj_admin` */

DROP TABLE IF EXISTS `jbj_admin`;

CREATE TABLE `jbj_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `account` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `tel` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `jbj_admin` */

insert  into `jbj_admin`(`id`,`name`,`account`,`password`,`tel`) values (1,'呵呵呵呵','000','000','11111111111111');

/*Table structure for table `jbj_advice` */

DROP TABLE IF EXISTS `jbj_advice`;

CREATE TABLE `jbj_advice` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `content` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '反馈内容',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `mark_read` tinyint(4) NOT NULL DEFAULT '0' COMMENT '已读，0未读 1已读',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除标识，0 未删除 1 删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `jbj_advice` */

insert  into `jbj_advice`(`id`,`user_id`,`content`,`create_time`,`mark_read`,`is_deleted`) values (1,34,'测测测测','2015-10-20 11:02:14',1,0),(2,34,'测测测测','2015-10-20 11:02:30',1,0),(3,34,'测测测测','2015-10-20 11:02:31',1,0),(4,34,'测测测测','2015-10-20 11:02:32',1,0),(5,34,'测测测测','2015-10-20 11:02:33',1,0),(6,34,'测测测测','2015-10-20 11:02:34',1,0),(7,54,'红红火火恍恍惚惚','2015-10-31 11:16:06',1,0),(8,54,'哇哇哇','2015-10-31 17:20:57',1,0);

/*Table structure for table `jbj_alipay_stream` */

DROP TABLE IF EXISTS `jbj_alipay_stream`;

CREATE TABLE `jbj_alipay_stream` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  `create_time` datetime NOT NULL,
  `modify_time` datetime NOT NULL,
  `app_id` int(4) NOT NULL DEFAULT '1' COMMENT '应用编号（1.聚宝集，2.酒侍）',
  `user_id` bigint(20) DEFAULT NULL,
  `trade_no` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `out_trade_no` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `out_biz_no` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `buyer_id` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `buyer_logon_id` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seller_id` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seller_email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trade_status` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_amount` double(12,0) DEFAULT NULL,
  `receipt_amount` double(12,0) DEFAULT NULL,
  `invoice_amount` double(12,0) DEFAULT NULL,
  `buyer_pay_amount` double(12,0) DEFAULT NULL,
  `refund_free` double(12,0) DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gmt_create` date DEFAULT NULL,
  `gmt_payment` date DEFAULT NULL,
  `gmt_refund` date DEFAULT NULL,
  `gmt_close` date DEFAULT NULL,
  `fund_bill_list` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `voucher_detail_list` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `jbj_alipay_stream` */

/*Table structure for table `jbj_art_str_shop_liked` */

DROP TABLE IF EXISTS `jbj_art_str_shop_liked`;

CREATE TABLE `jbj_art_str_shop_liked` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shop_id` bigint(20) NOT NULL COMMENT '被关注店铺id',
  `user_id` bigint(20) NOT NULL COMMENT '关注者id',
  `state` int(11) NOT NULL DEFAULT '0' COMMENT '状态（未用）',
  `create_time` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `shop_id_user_id` (`shop_id`,`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=192 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `jbj_art_str_shop_liked` */

insert  into `jbj_art_str_shop_liked`(`id`,`shop_id`,`user_id`,`state`,`create_time`) values (188,1,31,0,1446447891),(189,79,31,0,1446447939),(190,81,54,0,1446448741),(191,81,66,0,1446458926);

/*Table structure for table `jbj_art_str_shop_type` */

DROP TABLE IF EXISTS `jbj_art_str_shop_type`;

CREATE TABLE `jbj_art_str_shop_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shop_id` bigint(20) NOT NULL,
  `shop_type_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `shop_id_shop_type_id` (`shop_id`,`shop_type_id`) USING BTREE,
  KEY `shop_type_id` (`shop_type_id`) USING BTREE,
  CONSTRAINT `jbj_art_str_shop_type_ibfk_1` FOREIGN KEY (`shop_type_id`) REFERENCES `jbj_art_str_shop_type_data` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `jbj_art_str_shop_type_ibfk_2` FOREIGN KEY (`shop_id`) REFERENCES `jbj_art_street_shop` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `jbj_art_str_shop_type` */

/*Table structure for table `jbj_art_str_shop_type_data` */

DROP TABLE IF EXISTS `jbj_art_str_shop_type_data`;

CREATE TABLE `jbj_art_str_shop_type_data` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '类名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `jbj_art_str_shop_type_data` */

insert  into `jbj_art_str_shop_type_data`(`id`,`type_name`) values (1,'书画'),(2,'玉石'),(3,'陶器漆器'),(4,'铜器'),(5,'雕刻家具'),(6,'珠宝翡翠'),(7,'钱币邮票'),(8,'杂项');

/*Table structure for table `jbj_art_street_shop` */

DROP TABLE IF EXISTS `jbj_art_street_shop`;

CREATE TABLE `jbj_art_street_shop` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL COMMENT '艺术街店主id',
  `shop_name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '店铺名称',
  `shop_desc` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '店铺描述',
  `shop_title_pic` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '店铺列表显示图片',
  `shop_banner_bg` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '店铺详情页个性banner',
  `shop_business_license_pic` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '店铺营业执照',
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '店铺评分（用于排序）',
  `create_time` bigint(20) NOT NULL COMMENT '创建时间',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '店铺状态 1: 审核中 2: 审核通过',
  `cooperate` int(11) NOT NULL DEFAULT '0' COMMENT '0 非合作商铺 1 合作商铺',
  `change_time` bigint(20) NOT NULL COMMENT '更新时间',
  `liked_count` int(11) NOT NULL DEFAULT '0' COMMENT '关注数',
  `examine_time` datetime DEFAULT NULL COMMENT '审核时间',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`) USING BTREE,
  CONSTRAINT `jbj_art_street_shop_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `jbj_user` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `jbj_art_street_shop` */

/*Table structure for table `jbj_art_street_shop_loc` */

DROP TABLE IF EXISTS `jbj_art_street_shop_loc`;

CREATE TABLE `jbj_art_street_shop_loc` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shop_id` bigint(20) NOT NULL,
  `adcode` int(11) NOT NULL COMMENT '行政区划编码',
  `province` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '省',
  `city` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '市',
  `lat` float NOT NULL COMMENT '纬度',
  `lng` float NOT NULL COMMENT '经度',
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shop_id` (`shop_id`) USING BTREE,
  CONSTRAINT `jbj_art_street_shop_loc_ibfk_1` FOREIGN KEY (`shop_id`) REFERENCES `jbj_art_street_shop` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `jbj_art_street_shop_loc` */

/*Table structure for table `jbj_art_street_shop_promote` */

DROP TABLE IF EXISTS `jbj_art_street_shop_promote`;

CREATE TABLE `jbj_art_street_shop_promote` (
  `id` bigint(20) NOT NULL,
  `shop_id` bigint(20) NOT NULL COMMENT '店铺id',
  `item_id` bigint(20) NOT NULL COMMENT '该店铺的代表作id',
  `index` bigint(20) NOT NULL COMMENT '该代表作的index (1-6)',
  `create_time` bigint(20) NOT NULL,
  UNIQUE KEY `shop_id_index` (`shop_id`,`index`) USING BTREE,
  KEY `shop_id` (`shop_id`) USING BTREE,
  KEY `item_id` (`item_id`) USING BTREE,
  CONSTRAINT `jbj_art_street_shop_promote_ibfk_1` FOREIGN KEY (`shop_id`) REFERENCES `jbj_art_street_shop` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `jbj_art_street_shop_promote_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `jbj_treasure_item` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `jbj_art_street_shop_promote` */

/*Table structure for table `jbj_article` */

DROP TABLE IF EXISTS `jbj_article`;

CREATE TABLE `jbj_article` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `is_deleted` bit(4) NOT NULL DEFAULT b'0',
  `create_time` datetime NOT NULL,
  `modify_time` datetime NOT NULL,
  `user_id` bigint(20) NOT NULL COMMENT '手机号码',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subtitle` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `image_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `level` int(4) DEFAULT NULL,
  `read_num` int(11) DEFAULT '0',
  `like_num` int(11) DEFAULT '0',
  `type` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `jbj_article` */

insert  into `jbj_article`(`id`,`is_deleted`,`create_time`,`modify_time`,`user_id`,`title`,`subtitle`,`content`,`image_url`,`level`,`read_num`,`like_num`,`type`) values (1,'\0','2017-03-01 17:19:10','2017-03-07 13:34:38',0,'test1','test1','content1','http://www.jvbaoji.com:18006/jvbaoji/image/f0255684-9f00-4344-93a2-adf42f9814aa.png',0,12,0,0),(2,'\0','2017-03-13 11:39:25','2017-03-13 11:39:36',0,'第三方','第三方','水电费\r\n    水电费','http://www.jvbaoji.com:18006/jvbaoji/image/f0255684-9f00-4344-93a2-adf42f9814aa.png',NULL,0,0,NULL),(4,'\0','2017-03-13 11:39:28','2017-03-13 11:39:38',0,'发个','大概','水电费是四个水电费','http://www.jvbaoji.com:18006/jvbaoji/image/f0255684-9f00-4344-93a2-adf42f9814aa.png',NULL,0,0,NULL),(5,'\0','2017-03-13 11:39:30','2017-03-13 11:39:40',0,'发送到','水电费','十多个施工队','http://www.jvbaoji.com:18006/jvbaoji/image/f0255684-9f00-4344-93a2-adf42f9814aa.png',NULL,0,0,NULL),(6,'\0','2017-03-13 11:39:32','2017-03-13 11:39:42',0,'sdf',' 水电费','第三方','http://www.jvbaoji.com:18006/jvbaoji/image/f0255684-9f00-4344-93a2-adf42f9814aa.png',NULL,0,0,NULL),(7,'\0','2017-03-13 11:39:34','2017-03-13 11:39:44',0,'水电费','水电费','的手续费是','http://www.jvbaoji.com:18006/jvbaoji/image/f0255684-9f00-4344-93a2-adf42f9814aa.png',NULL,0,0,NULL),(8,'\0','2017-03-13 03:42:26','2017-03-13 03:42:26',0,'sdf','d','dsf','http://www.jvbaoji.com:18006/jvbaoji/image/f0255684-9f00-4344-93a2-adf42f9814aa.png',NULL,0,0,NULL),(9,'\0','2017-03-13 11:48:06','2017-03-13 11:48:06',0,'sdaf','阿斯蒂芬','阿斯蒂芬','http://www.jvbaoji.com:18006/jvbaoji/image/f0255684-9f00-4344-93a2-adf42f9814aa.png',NULL,0,0,NULL),(14,'\0','2017-03-13 16:14:06','2017-03-13 19:14:03',0,'fsdd','dsf素食','萨达水电费第三方\n    傻得卡速度快解放和会计师大黄蜂就开始对话框房间号数据库东方红尽快收到货安防监控和四大皆空回复可接受的空间发挥尽快收到货加就是对付客户积分沙河福拉萨回复傻得卡速度快解放和会计师大黄蜂就开始对话框房间号数据库东方红尽快收到货安防监控和四大皆空回复可接受的空间发挥尽快收到货加就是对付客户积分沙河福拉萨回复傻得卡速度快解放和会计师大黄蜂就开始对话框房间号数据库东方红尽快收到货安防监控和四大皆空回复可接受的空间发挥尽快收到货加就是对付客户积分沙河福拉萨回复傻得卡速度快解放和会计师大黄蜂就开始对话框房间号数据库东方红尽快收到货安防监控和四大皆空回复可接受的空间发挥尽快收到货加就是对付客户积分沙河福拉萨回复傻得卡速度快解放和会计师大黄蜂就开始对话框房间号数据库东方红尽快收到货安防监控和四大皆空回复可接受的空间发挥尽快收到货加就是对付客户积分沙河福拉萨回复\n    傻得卡速度快解放和会计师大黄蜂就开始对话框房间号数据库东方红尽快收到货安防监控和四大皆空回复可接受的空间发挥尽快收到货加就是对付客户积分沙河福拉萨回复\n    傻得卡速度快解放和会计师大黄蜂就开始对话框房间号数据库东方红尽快收到货安防监控和四大皆空回复可接受的空间发挥尽快收到货加就是对付客户积分沙河福拉萨回复\n傻得卡速度快解放和会计师大黄蜂就开始对话框房间号数据库东方红尽快收到货安防监控和四大皆空回复可接受的空间发挥尽快收到货加就是对付客户积分沙河福拉萨回复\n    傻得卡速度快解放和会计师大黄蜂就开始对话框房间号数据库东方红尽快收到货安防监控和四大皆空回复可接受的空间发挥尽快收到货加就是对付客户积分沙河福拉萨回复\n    傻得卡速度快解放和会计师大黄蜂就开始对话框房间号数据库东方红尽快收到货安防监控和四大皆空回复可接受的空间发挥尽快收到货加就是对付客户积分沙河福拉萨回复\n    傻得卡速度快解放和会计师大黄蜂就开始对话框房间号数据库东方红尽快收到货安防监控和四大皆空回复可接受的空间发挥尽快收到货加就是对付客户积分沙河福拉萨回复\n    傻得卡速度快解放和会计师大黄蜂就开始对话框房间号数据库东方红尽快收到货安防监控和四大皆空回复可接受的空间发挥尽快收到货加就是对付客户积分沙河福拉萨回复\n\n    傻得卡速度快解放和会计师大黄蜂就开始对话框房间号数据库东方红尽快收到货安防监控和四大皆空回复可接受的空间发挥尽快收到货加就是对付客户积分沙河福拉萨回复','http://www.jvbaoji.com:18006/jvbaoji/image/f0255684-9f00-4344-93a2-adf42f9814aa.png',NULL,0,0,NULL);

/*Table structure for table `jbj_article_user_like_record` */

DROP TABLE IF EXISTS `jbj_article_user_like_record`;

CREATE TABLE `jbj_article_user_like_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  `create_time` datetime NOT NULL,
  `modify_time` datetime NOT NULL,
  `user_id` bigint(20) NOT NULL COMMENT '手机号码',
  `article_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `jbj_article_user_like_record` */

insert  into `jbj_article_user_like_record`(`id`,`is_deleted`,`create_time`,`modify_time`,`user_id`,`article_id`) values (1,1,'2017-03-01 17:37:56','2017-03-01 17:37:56',0,1),(2,1,'2017-03-01 17:39:11','2017-03-01 17:39:11',0,1);

/*Table structure for table `jbj_article_user_read_record` */

DROP TABLE IF EXISTS `jbj_article_user_read_record`;

CREATE TABLE `jbj_article_user_read_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  `create_time` datetime NOT NULL,
  `modify_time` datetime NOT NULL,
  `user_id` bigint(20) DEFAULT NULL COMMENT '手机号码',
  `article_id` bigint(20) NOT NULL,
  `source` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `frequency` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `jbj_article_user_read_record` */

insert  into `jbj_article_user_read_record`(`id`,`is_deleted`,`create_time`,`modify_time`,`user_id`,`article_id`,`source`,`frequency`) values (1,0,'2017-03-01 17:19:10','2017-03-01 17:19:10',-1,1,'others',9),(2,0,'2017-03-01 17:32:32','2017-03-01 17:32:32',0,1,'ios',6);

/*Table structure for table `jbj_auction_bid_situation` */

DROP TABLE IF EXISTS `jbj_auction_bid_situation`;

CREATE TABLE `jbj_auction_bid_situation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  `create_time` datetime NOT NULL,
  `modify_time` datetime NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `auction_id` bigint(20) NOT NULL,
  `bid_price` double(20,0) NOT NULL DEFAULT '0',
  `commission` double(10,0) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `jbj_auction_bid_situation` */

insert  into `jbj_auction_bid_situation`(`id`,`is_deleted`,`create_time`,`modify_time`,`user_id`,`auction_id`,`bid_price`,`commission`) values (2,0,'2017-02-12 14:22:26','2017-02-12 14:22:26',0,1,900,2),(3,0,'2017-02-12 14:30:13','2017-02-12 14:30:13',0,2,1200,2),(4,0,'2017-02-20 14:28:01','2017-02-20 14:28:01',49,1,30000,5),(7,0,'2017-03-03 15:07:03','2017-03-03 15:07:03',0,1,1000,2),(9,0,'2017-03-03 15:08:51','2017-03-03 15:08:51',0,1,1100,2),(10,0,'2017-03-04 11:49:30','2017-03-04 11:49:30',49,1,30000,5);

/*Table structure for table `jbj_auction_bid_winner` */

DROP TABLE IF EXISTS `jbj_auction_bid_winner`;

CREATE TABLE `jbj_auction_bid_winner` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  `create_time` datetime NOT NULL,
  `modify_time` datetime NOT NULL,
  `auction_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `highest_price` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `jbj_auction_bid_winner` */

insert  into `jbj_auction_bid_winner`(`id`,`is_deleted`,`create_time`,`modify_time`,`auction_id`,`user_id`,`highest_price`) values (2,0,'2017-02-12 14:22:26','2017-02-12 14:22:26',1,49,30000),(3,0,'2017-02-12 14:22:26','2017-02-12 14:22:26',4,49,30000),(4,0,'2017-02-20 20:42:25','2017-02-20 20:42:27',3,49,30000);

/*Table structure for table `jbj_auction_item` */

DROP TABLE IF EXISTS `jbj_auction_item`;

CREATE TABLE `jbj_auction_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  `modify_time` datetime NOT NULL,
  `create_time` datetime NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '拍品名',
  `introduction` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '简介',
  `describing` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '描述',
  `image_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '图片地址',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `start_price` double(20,0) NOT NULL COMMENT '开拍价格',
  `seller_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '拍品原主ID',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '拍品状态（0.未开始1.开始前半小时2.已经开始3.结束等待支付4.结束流拍用户未支付5.结束流拍未到封顶价6.正常结束交易7.后台关闭）',
  `type` tinyint(2) NOT NULL COMMENT '类型（未定义）',
  `insurance` double NOT NULL COMMENT '保证金',
  `special_id` bigint(20) NOT NULL COMMENT '专场ID',
  `add_mini_price` double NOT NULL COMMENT '最低加价',
  `commission` double NOT NULL DEFAULT '0' COMMENT 'y佣金',
  `level` int(4) DEFAULT NULL COMMENT '优先级',
  `capped_price` double NOT NULL COMMENT '封顶价',
  `reserve_price` double NOT NULL COMMENT '保留价',
  `parameters` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `remark` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `jbj_auction_item` */

insert  into `jbj_auction_item`(`id`,`is_deleted`,`modify_time`,`create_time`,`name`,`introduction`,`describing`,`image_url`,`start_time`,`end_time`,`start_price`,`seller_id`,`status`,`type`,`insurance`,`special_id`,`add_mini_price`,`commission`,`level`,`capped_price`,`reserve_price`,`parameters`,`admin_id`,`remark`) values (1,0,'2016-12-21 18:59:06','2016-12-05 15:01:39','测试1','测试简介1','测试介绍1','http://www.jvbaoji.com:18006/jvbaoji/image/f0255684-9f00-4344-93a2-adf42f9814aa.png','2016-12-06 15:23:26','2019-12-22 15:23:32',12000,1,0,0,2200,1,0,0,1,45000,0,'key11,value1.key12,value',1,NULL),(2,0,'2016-12-21 18:59:09','2016-12-21 15:01:42','测试2','测试简介2','测试介绍2','http://www.jvbaoji.com:18006/jvbaoji/image/f0255684-9f00-4344-93a2-adf42f9814aa.png','2016-12-09 15:23:37','2016-12-18 15:23:42',15000,0,-2,0,1500,1,0,0,2,0,0,'key21,value.key22,value',0,NULL),(3,0,'2017-03-13 20:59:57','2017-01-18 16:47:41','test2','test2','test2','http://www.jvbaoji.com:18006/jvbaoji/image/f0255684-9f00-4344-93a2-adf42f9814aa.png','1970-01-18 12:25:18','2017-02-20 21:23:58',13000,0,-2,0,1000,1,1000,0,3,40000,0,'key1,value.key2,value',0,NULL),(4,0,'2017-03-13 14:01:41','2016-12-21 15:01:42','测试3','测试简介3','测试介绍3','http://www.jvbaoji.com:18006/jvbaoji/image/f0255684-9f00-4344-93a2-adf42f9814aa.png','2017-02-20 14:36:37','2017-02-21 14:01:42',15000,0,0,0,1500,1,0,0,2,30000,0,'key21,value.key22,value',0,NULL),(6,0,'2017-03-01 14:55:49','2017-03-01 14:55:49','test1','test1',NULL,'http://www.jvbaoji.com:18006/jvbaoji/image/f0255684-9f00-4344-93a2-adf42f9814aa.png','1970-01-18 12:25:18','1970-01-18 12:26:58',13000,0,-2,0,1000,0,1000,3,2,30000,0,'key31,value.key32,value',1,NULL),(7,0,'2017-03-01 15:02:41','2017-03-01 15:02:41','test3','test3',NULL,'http://www.jvbaoji.com:18006/jvbaoji/image/f0255684-9f00-4344-93a2-adf42f9814aa.png','1970-01-18 12:25:18','1970-01-18 12:26:58',13000,0,-1,0,1000,0,1000,3,3,30000,0,'key41,value.key42,value',0,NULL),(8,0,'2017-03-02 11:30:36','2017-03-02 11:30:36','test4','test4',NULL,'http://www.jvbaoji.com:18006/jvbaoji/image/f0255684-9f00-4344-93a2-adf42f9814aa.png','1970-01-18 12:25:18','1970-01-18 12:26:58',13000,0,-2,0,1000,1,1000,3,4,30000,0,'key1,value.key2,value',1,NULL),(9,0,'2017-03-02 11:53:44','2017-03-02 11:53:44','test5','test5',NULL,'http://www.jvbaoji.com:18006/jvbaoji/image/f0255684-9f00-4344-93a2-adf42f9814aa.png','1970-01-18 12:25:18','1970-01-18 12:26:58',13000,0,-2,0,1000,1,1000,3,4,30000,0,'key1,value.key2,value',1,NULL),(10,0,'2017-03-02 16:25:15','2017-03-02 16:25:15','test6','test6',NULL,'http://www.jvbaoji.com:18006/jvbaoji/image/f0255684-9f00-4344-93a2-adf42f9814aa.png','1970-01-18 12:25:18','1970-01-18 12:26:58',13000,0,4,0,1000,0,1000,3,5,30000,0,'key1,value.key2,value',NULL,NULL);

/*Table structure for table `jbj_banner` */

DROP TABLE IF EXISTS `jbj_banner`;

CREATE TABLE `jbj_banner` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  `create_time` datetime NOT NULL,
  `modify_time` datetime NOT NULL,
  `image_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` tinyint(4) DEFAULT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `jbj_banner` */

insert  into `jbj_banner`(`id`,`is_deleted`,`create_time`,`modify_time`,`image_url`,`type`,`value`) values (1,0,'2017-03-02 18:58:39','2017-03-02 18:58:39','http://www.jvbaoji.com:18006/jvbaoji/image/441b1afd-2149-465e-a79c-3f178bbbb7ec.png',1,'1'),(2,0,'2017-03-02 18:59:42','2017-03-02 19:02:02','http://www.jvbaoji.com:18006/jvbaoji/image/1591d3e0-edc0-4edc-928f-bd7b51d8fe0f.png',1,'2'),(3,0,'2017-03-02 18:59:48','2017-03-02 18:59:48','http://www.jvbaoji.com:18006/jvbaoji/image/1591d3e0-edc0-4edc-928f-bd7b51d8fe0f.png',2,'1'),(4,1,'2017-03-02 18:59:51','2017-03-02 18:59:51','http://www.jvbaoji.com:18006/jvbaoji/image/a198c5ab-0d4f-4f3e-acc3-e334689970bc.png',3,'1');

/*Table structure for table `jbj_blacklist_org` */

DROP TABLE IF EXISTS `jbj_blacklist_org`;

CREATE TABLE `jbj_blacklist_org` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_Id` int(11) DEFAULT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `create_time` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `jbj_blacklist_org` */

/*Table structure for table `jbj_blacklist_user` */

DROP TABLE IF EXISTS `jbj_blacklist_user`;

CREATE TABLE `jbj_blacklist_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_Id` int(11) DEFAULT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `create_time` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `jbj_blacklist_user` */

/*Table structure for table `jbj_cpct` */

DROP TABLE IF EXISTS `jbj_cpct`;

CREATE TABLE `jbj_cpct` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  `create_time` datetime NOT NULL,
  `modify_time` datetime NOT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `province` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `town` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `jbj_cpct` */

/*Table structure for table `jbj_district_data` */

DROP TABLE IF EXISTS `jbj_district_data`;

CREATE TABLE `jbj_district_data` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `name` char(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=820002 DEFAULT CHARSET=utf8mb4;

/*Data for the table `jbj_district_data` */

insert  into `jbj_district_data`(`id`,`parent_id`,`name`) values (100000,0,'其他'),(110000,0,'北京市'),(110100,110000,'市辖区'),(110101,110100,'东城区'),(110102,110100,'西城区'),(110103,110100,'崇文区'),(110104,110100,'宣武区'),(110105,110100,'朝阳区'),(110106,110100,'丰台区'),(110107,110100,'石景山区'),(110108,110100,'海淀区'),(110109,110100,'门头沟区'),(110111,110100,'房山区'),(110112,110100,'通州区'),(110113,110100,'顺义区'),(110114,110100,'昌平区'),(110115,110100,'大兴区'),(110116,110100,'怀柔区'),(110117,110100,'平谷区'),(110200,110000,'北京市'),(110228,110200,'密云县'),(110229,110200,'延庆县'),(120000,0,'天津市'),(120100,120000,'市辖区'),(120101,120100,'和平区'),(120102,120100,'河东区'),(120103,120100,'河西区'),(120104,120100,'南开区'),(120105,120100,'河北区'),(120106,120100,'红桥区'),(120107,120100,'塘沽区'),(120108,120100,'汉沽区'),(120109,120100,'大港区'),(120110,120100,'东丽区'),(120111,120100,'西青区'),(120112,120100,'津南区'),(120113,120100,'北辰区'),(120114,120100,'武清区'),(120115,120100,'宝坻区'),(120200,120000,'县'),(120221,120200,'宁河县'),(120223,120200,'静海县'),(120225,120200,'蓟　县'),(130000,0,'河北省'),(130100,130000,'石家庄市'),(130101,130100,'市辖区'),(130102,130100,'长安区'),(130103,130100,'桥东区'),(130104,130100,'桥西区'),(130105,130100,'新华区'),(130107,130100,'井陉矿区'),(130108,130100,'裕华区'),(130121,130100,'井陉县'),(130123,130100,'正定县'),(130124,130100,'栾城县'),(130125,130100,'行唐县'),(130126,130100,'灵寿县'),(130127,130100,'高邑县'),(130128,130100,'深泽县'),(130129,130100,'赞皇县'),(130130,130100,'无极县'),(130131,130100,'平山县'),(130132,130100,'元氏县'),(130133,130100,'赵　县'),(130181,130100,'辛集市'),(130182,130100,'藁城市'),(130183,130100,'晋州市'),(130184,130100,'新乐市'),(130185,130100,'鹿泉市'),(130200,130000,'唐山市'),(130201,130200,'市辖区'),(130202,130200,'路南区'),(130203,130200,'路北区'),(130204,130200,'古冶区'),(130205,130200,'开平区'),(130207,130200,'丰南区'),(130208,130200,'丰润区'),(130223,130200,'滦　县'),(130224,130200,'滦南县'),(130225,130200,'乐亭县'),(130227,130200,'迁西县'),(130229,130200,'玉田县'),(130230,130200,'唐海县'),(130281,130200,'遵化市'),(130283,130200,'迁安市'),(130300,130000,'秦皇岛市'),(130301,130300,'市辖区'),(130302,130300,'海港区'),(130303,130300,'山海关区'),(130304,130300,'北戴河区'),(130321,130300,'青龙满族自治县'),(130322,130300,'昌黎县'),(130323,130300,'抚宁县'),(130324,130300,'卢龙县'),(130400,130000,'邯郸市'),(130401,130400,'市辖区'),(130402,130400,'邯山区'),(130403,130400,'丛台区'),(130404,130400,'复兴区'),(130406,130400,'峰峰矿区'),(130421,130400,'邯郸县'),(130423,130400,'临漳县'),(130424,130400,'成安县'),(130425,130400,'大名县'),(130426,130400,'涉　县'),(130427,130400,'磁　县'),(130428,130400,'肥乡县'),(130429,130400,'永年县'),(130430,130400,'邱　县'),(130431,130400,'鸡泽县'),(130432,130400,'广平县'),(130433,130400,'馆陶县'),(130434,130400,'魏　县'),(130435,130400,'曲周县'),(130481,130400,'武安市'),(130500,130000,'邢台市'),(130501,130500,'市辖区'),(130502,130500,'桥东区'),(130503,130500,'桥西区'),(130521,130500,'邢台县'),(130522,130500,'临城县'),(130523,130500,'内丘县'),(130524,130500,'柏乡县'),(130525,130500,'隆尧县'),(130526,130500,'任　县'),(130527,130500,'南和县'),(130528,130500,'宁晋县'),(130529,130500,'巨鹿县'),(130530,130500,'新河县'),(130531,130500,'广宗县'),(130532,130500,'平乡县'),(130533,130500,'威　县'),(130534,130500,'清河县'),(130535,130500,'临西县'),(130581,130500,'南宫市'),(130582,130500,'沙河市'),(130600,130000,'保定市'),(130601,130600,'市辖区'),(130602,130600,'新市区'),(130603,130600,'北市区'),(130604,130600,'南市区'),(130621,130600,'满城县'),(130622,130600,'清苑县'),(130623,130600,'涞水县'),(130624,130600,'阜平县'),(130625,130600,'徐水县'),(130626,130600,'定兴县'),(130627,130600,'唐　县'),(130628,130600,'高阳县'),(130629,130600,'容城县'),(130630,130600,'涞源县'),(130631,130600,'望都县'),(130632,130600,'安新县'),(130633,130600,'易　县'),(130634,130600,'曲阳县'),(130635,130600,'蠡　县'),(130636,130600,'顺平县'),(130637,130600,'博野县'),(130638,130600,'雄　县'),(130681,130600,'涿州市'),(130682,130600,'定州市'),(130683,130600,'安国市'),(130684,130600,'高碑店市'),(130700,130000,'张家口市'),(130701,130700,'市辖区'),(130702,130700,'桥东区'),(130703,130700,'桥西区'),(130705,130700,'宣化区'),(130706,130700,'下花园区'),(130721,130700,'宣化县'),(130722,130700,'张北县'),(130723,130700,'康保县'),(130724,130700,'沽源县'),(130725,130700,'尚义县'),(130726,130700,'蔚　县'),(130727,130700,'阳原县'),(130728,130700,'怀安县'),(130729,130700,'万全县'),(130730,130700,'怀来县'),(130731,130700,'涿鹿县'),(130732,130700,'赤城县'),(130733,130700,'崇礼县'),(130800,130000,'承德市'),(130801,130800,'市辖区'),(130802,130800,'双桥区'),(130803,130800,'双滦区'),(130804,130800,'鹰手营子矿区'),(130821,130800,'承德县'),(130822,130800,'兴隆县'),(130823,130800,'平泉县'),(130824,130800,'滦平县'),(130825,130800,'隆化县'),(130826,130800,'丰宁满族自治县'),(130827,130800,'宽城满族自治县'),(130828,130800,'围场满族蒙古族自治县'),(130900,130000,'沧州市'),(130901,130900,'市辖区'),(130902,130900,'新华区'),(130903,130900,'运河区'),(130921,130900,'沧　县'),(130922,130900,'青　县'),(130923,130900,'东光县'),(130924,130900,'海兴县'),(130925,130900,'盐山县'),(130926,130900,'肃宁县'),(130927,130900,'南皮县'),(130928,130900,'吴桥县'),(130929,130900,'献　县'),(130930,130900,'孟村回族自治县'),(130981,130900,'泊头市'),(130982,130900,'任丘市'),(130983,130900,'黄骅市'),(130984,130900,'河间市'),(131000,130000,'廊坊市'),(131001,131000,'市辖区'),(131002,131000,'安次区'),(131003,131000,'广阳区'),(131022,131000,'固安县'),(131023,131000,'永清县'),(131024,131000,'香河县'),(131025,131000,'大城县'),(131026,131000,'文安县'),(131028,131000,'大厂回族自治县'),(131081,131000,'霸州市'),(131082,131000,'三河市'),(131100,130000,'衡水市'),(131101,131100,'市辖区'),(131102,131100,'桃城区'),(131121,131100,'枣强县'),(131122,131100,'武邑县'),(131123,131100,'武强县'),(131124,131100,'饶阳县'),(131125,131100,'安平县'),(131126,131100,'故城县'),(131127,131100,'景　县'),(131128,131100,'阜城县'),(131181,131100,'冀州市'),(131182,131100,'深州市'),(140000,0,'山西省'),(140100,140000,'太原市'),(140101,140100,'市辖区'),(140105,140100,'小店区'),(140106,140100,'迎泽区'),(140107,140100,'杏花岭区'),(140108,140100,'尖草坪区'),(140109,140100,'万柏林区'),(140110,140100,'晋源区'),(140121,140100,'清徐县'),(140122,140100,'阳曲县'),(140123,140100,'娄烦县'),(140181,140100,'古交市'),(140200,140000,'大同市'),(140201,140200,'市辖区'),(140202,140200,'城　区'),(140203,140200,'矿　区'),(140211,140200,'南郊区'),(140212,140200,'新荣区'),(140221,140200,'阳高县'),(140222,140200,'天镇县'),(140223,140200,'广灵县'),(140224,140200,'灵丘县'),(140225,140200,'浑源县'),(140226,140200,'左云县'),(140227,140200,'大同县'),(140300,140000,'阳泉市'),(140301,140300,'市辖区'),(140302,140300,'城　区'),(140303,140300,'矿　区'),(140311,140300,'郊　区'),(140321,140300,'平定县'),(140322,140300,'盂　县'),(140400,140000,'长治市'),(140401,140400,'市辖区'),(140402,140400,'城　区'),(140411,140400,'郊　区'),(140421,140400,'长治县'),(140423,140400,'襄垣县'),(140424,140400,'屯留县'),(140425,140400,'平顺县'),(140426,140400,'黎城县'),(140427,140400,'壶关县'),(140428,140400,'长子县'),(140429,140400,'武乡县'),(140430,140400,'沁　县'),(140431,140400,'沁源县'),(140481,140400,'潞城市'),(140500,140000,'晋城市'),(140501,140500,'市辖区'),(140502,140500,'城　区'),(140521,140500,'沁水县'),(140522,140500,'阳城县'),(140524,140500,'陵川县'),(140525,140500,'泽州县'),(140581,140500,'高平市'),(140600,140000,'朔州市'),(140601,140600,'市辖区'),(140602,140600,'朔城区'),(140603,140600,'平鲁区'),(140621,140600,'山阴县'),(140622,140600,'应　县'),(140623,140600,'右玉县'),(140624,140600,'怀仁县'),(140700,140000,'晋中市'),(140701,140700,'市辖区'),(140702,140700,'榆次区'),(140721,140700,'榆社县'),(140722,140700,'左权县'),(140723,140700,'和顺县'),(140724,140700,'昔阳县'),(140725,140700,'寿阳县'),(140726,140700,'太谷县'),(140727,140700,'祁　县'),(140728,140700,'平遥县'),(140729,140700,'灵石县'),(140781,140700,'介休市'),(140800,140000,'运城市'),(140801,140800,'市辖区'),(140802,140800,'盐湖区'),(140821,140800,'临猗县'),(140822,140800,'万荣县'),(140823,140800,'闻喜县'),(140824,140800,'稷山县'),(140825,140800,'新绛县'),(140826,140800,'绛　县'),(140827,140800,'垣曲县'),(140828,140800,'夏　县'),(140829,140800,'平陆县'),(140830,140800,'芮城县'),(140881,140800,'永济市'),(140882,140800,'河津市'),(140900,140000,'忻州市'),(140901,140900,'市辖区'),(140902,140900,'忻府区'),(140921,140900,'定襄县'),(140922,140900,'五台县'),(140923,140900,'代　县'),(140924,140900,'繁峙县'),(140925,140900,'宁武县'),(140926,140900,'静乐县'),(140927,140900,'神池县'),(140928,140900,'五寨县'),(140929,140900,'岢岚县'),(140930,140900,'河曲县'),(140931,140900,'保德县'),(140932,140900,'偏关县'),(140981,140900,'原平市'),(141000,140000,'临汾市'),(141001,141000,'市辖区'),(141002,141000,'尧都区'),(141021,141000,'曲沃县'),(141022,141000,'翼城县'),(141023,141000,'襄汾县'),(141024,141000,'洪洞县'),(141025,141000,'古　县'),(141026,141000,'安泽县'),(141027,141000,'浮山县'),(141028,141000,'吉　县'),(141029,141000,'乡宁县'),(141030,141000,'大宁县'),(141031,141000,'隰　县'),(141032,141000,'永和县'),(141033,141000,'蒲　县'),(141034,141000,'汾西县'),(141081,141000,'侯马市'),(141082,141000,'霍州市'),(141100,140000,'吕梁市'),(141101,141100,'市辖区'),(141102,141100,'离石区'),(141121,141100,'文水县'),(141122,141100,'交城县'),(141123,141100,'兴　县'),(141124,141100,'临　县'),(141125,141100,'柳林县'),(141126,141100,'石楼县'),(141127,141100,'岚　县'),(141128,141100,'方山县'),(141129,141100,'中阳县'),(141130,141100,'交口县'),(141181,141100,'孝义市'),(141182,141100,'汾阳市'),(150000,0,'内蒙古自治区'),(150100,150000,'呼和浩特市'),(150101,150100,'市辖区'),(150102,150100,'新城区'),(150103,150100,'回民区'),(150104,150100,'玉泉区'),(150105,150100,'赛罕区'),(150121,150100,'土默特左旗'),(150122,150100,'托克托县'),(150123,150100,'和林格尔县'),(150124,150100,'清水河县'),(150125,150100,'武川县'),(150200,150000,'包头市'),(150201,150200,'市辖区'),(150202,150200,'东河区'),(150203,150200,'昆都仑区'),(150204,150200,'青山区'),(150205,150200,'石拐区'),(150206,150200,'白云矿区'),(150207,150200,'九原区'),(150221,150200,'土默特右旗'),(150222,150200,'固阳县'),(150223,150200,'达尔罕茂明安联合旗'),(150300,150000,'乌海市'),(150301,150300,'市辖区'),(150302,150300,'海勃湾区'),(150303,150300,'海南区'),(150304,150300,'乌达区'),(150400,150000,'赤峰市'),(150401,150400,'市辖区'),(150402,150400,'红山区'),(150403,150400,'元宝山区'),(150404,150400,'松山区'),(150421,150400,'阿鲁科尔沁旗'),(150422,150400,'巴林左旗'),(150423,150400,'巴林右旗'),(150424,150400,'林西县'),(150425,150400,'克什克腾旗'),(150426,150400,'翁牛特旗'),(150428,150400,'喀喇沁旗'),(150429,150400,'宁城县'),(150430,150400,'敖汉旗'),(150500,150000,'通辽市'),(150501,150500,'市辖区'),(150502,150500,'科尔沁区'),(150521,150500,'科尔沁左翼中旗'),(150522,150500,'科尔沁左翼后旗'),(150523,150500,'开鲁县'),(150524,150500,'库伦旗'),(150525,150500,'奈曼旗'),(150526,150500,'扎鲁特旗'),(150581,150500,'霍林郭勒市'),(150600,150000,'鄂尔多斯市'),(150602,150600,'东胜区'),(150621,150600,'达拉特旗'),(150622,150600,'准格尔旗'),(150623,150600,'鄂托克前旗'),(150624,150600,'鄂托克旗'),(150625,150600,'杭锦旗'),(150626,150600,'乌审旗'),(150627,150600,'伊金霍洛旗'),(150700,150000,'呼伦贝尔市'),(150701,150700,'市辖区'),(150702,150700,'海拉尔区'),(150721,150700,'阿荣旗'),(150722,150700,'莫力达瓦达斡尔族自治旗'),(150723,150700,'鄂伦春自治旗'),(150724,150700,'鄂温克族自治旗'),(150725,150700,'陈巴尔虎旗'),(150726,150700,'新巴尔虎左旗'),(150727,150700,'新巴尔虎右旗'),(150781,150700,'满洲里市'),(150782,150700,'牙克石市'),(150783,150700,'扎兰屯市'),(150784,150700,'额尔古纳市'),(150785,150700,'根河市'),(150800,150000,'巴彦淖尔市'),(150801,150800,'市辖区'),(150802,150800,'临河区'),(150821,150800,'五原县'),(150822,150800,'磴口县'),(150823,150800,'乌拉特前旗'),(150824,150800,'乌拉特中旗'),(150825,150800,'乌拉特后旗'),(150826,150800,'杭锦后旗'),(150900,150000,'乌兰察布市'),(150901,150900,'市辖区'),(150902,150900,'集宁区'),(150921,150900,'卓资县'),(150922,150900,'化德县'),(150923,150900,'商都县'),(150924,150900,'兴和县'),(150925,150900,'凉城县'),(150926,150900,'察哈尔右翼前旗'),(150927,150900,'察哈尔右翼中旗'),(150928,150900,'察哈尔右翼后旗'),(150929,150900,'四子王旗'),(150981,150900,'丰镇市'),(152200,150000,'兴安盟'),(152201,152200,'乌兰浩特市'),(152202,152200,'阿尔山市'),(152221,152200,'科尔沁右翼前旗'),(152222,152200,'科尔沁右翼中旗'),(152223,152200,'扎赉特旗'),(152224,152200,'突泉县'),(152500,150000,'锡林郭勒盟'),(152501,152500,'二连浩特市'),(152502,152500,'锡林浩特市'),(152522,152500,'阿巴嘎旗'),(152523,152500,'苏尼特左旗'),(152524,152500,'苏尼特右旗'),(152525,152500,'东乌珠穆沁旗'),(152526,152500,'西乌珠穆沁旗'),(152527,152500,'太仆寺旗'),(152528,152500,'镶黄旗'),(152529,152500,'正镶白旗'),(152530,152500,'正蓝旗'),(152531,152500,'多伦县'),(152900,150000,'阿拉善盟'),(152921,152900,'阿拉善左旗'),(152922,152900,'阿拉善右旗'),(152923,152900,'额济纳旗'),(210000,0,'辽宁省'),(210100,210000,'沈阳市'),(210101,210100,'市辖区'),(210102,210100,'和平区'),(210103,210100,'沈河区'),(210104,210100,'大东区'),(210105,210100,'皇姑区'),(210106,210100,'铁西区'),(210111,210100,'苏家屯区'),(210112,210100,'东陵区'),(210113,210100,'新城子区'),(210114,210100,'于洪区'),(210122,210100,'辽中县'),(210123,210100,'康平县'),(210124,210100,'法库县'),(210181,210100,'新民市'),(210200,210000,'大连市'),(210201,210200,'市辖区'),(210202,210200,'中山区'),(210203,210200,'西岗区'),(210204,210200,'沙河口区'),(210211,210200,'甘井子区'),(210212,210200,'旅顺口区'),(210213,210200,'金州区'),(210224,210200,'长海县'),(210281,210200,'瓦房店市'),(210282,210200,'普兰店市'),(210283,210200,'庄河市'),(210300,210000,'鞍山市'),(210301,210300,'市辖区'),(210302,210300,'铁东区'),(210303,210300,'铁西区'),(210304,210300,'立山区'),(210311,210300,'千山区'),(210321,210300,'台安县'),(210323,210300,'岫岩满族自治县'),(210381,210300,'海城市'),(210400,210000,'抚顺市'),(210401,210400,'市辖区'),(210402,210400,'新抚区'),(210403,210400,'东洲区'),(210404,210400,'望花区'),(210411,210400,'顺城区'),(210421,210400,'抚顺县'),(210422,210400,'新宾满族自治县'),(210423,210400,'清原满族自治县'),(210500,210000,'本溪市'),(210501,210500,'市辖区'),(210502,210500,'平山区'),(210503,210500,'溪湖区'),(210504,210500,'明山区'),(210505,210500,'南芬区'),(210521,210500,'本溪满族自治县'),(210522,210500,'桓仁满族自治县'),(210600,210000,'丹东市'),(210601,210600,'市辖区'),(210602,210600,'元宝区'),(210603,210600,'振兴区'),(210604,210600,'振安区'),(210624,210600,'宽甸满族自治县'),(210681,210600,'东港市'),(210682,210600,'凤城市'),(210700,210000,'锦州市'),(210701,210700,'市辖区'),(210702,210700,'古塔区'),(210703,210700,'凌河区'),(210711,210700,'太和区'),(210726,210700,'黑山县'),(210727,210700,'义　县'),(210781,210700,'凌海市'),(210782,210700,'北宁市'),(210800,210000,'营口市'),(210801,210800,'市辖区'),(210802,210800,'站前区'),(210803,210800,'西市区'),(210804,210800,'鲅鱼圈区'),(210811,210800,'老边区'),(210881,210800,'盖州市'),(210882,210800,'大石桥市'),(210900,210000,'阜新市'),(210901,210900,'市辖区'),(210902,210900,'海州区'),(210903,210900,'新邱区'),(210904,210900,'太平区'),(210905,210900,'清河门区'),(210911,210900,'细河区'),(210921,210900,'阜新蒙古族自治县'),(210922,210900,'彰武县'),(211000,210000,'辽阳市'),(211001,211000,'市辖区'),(211002,211000,'白塔区'),(211003,211000,'文圣区'),(211004,211000,'宏伟区'),(211005,211000,'弓长岭区'),(211011,211000,'太子河区'),(211021,211000,'辽阳县'),(211081,211000,'灯塔市'),(211100,210000,'盘锦市'),(211101,211100,'市辖区'),(211102,211100,'双台子区'),(211103,211100,'兴隆台区'),(211121,211100,'大洼县'),(211122,211100,'盘山县'),(211200,210000,'铁岭市'),(211201,211200,'市辖区'),(211202,211200,'银州区'),(211204,211200,'清河区'),(211221,211200,'铁岭县'),(211223,211200,'西丰县'),(211224,211200,'昌图县'),(211281,211200,'调兵山市'),(211282,211200,'开原市'),(211300,210000,'朝阳市'),(211301,211300,'市辖区'),(211302,211300,'双塔区'),(211303,211300,'龙城区'),(211321,211300,'朝阳县'),(211322,211300,'建平县'),(211324,211300,'喀喇沁左翼蒙古族自治县'),(211381,211300,'北票市'),(211382,211300,'凌源市'),(211400,210000,'葫芦岛市'),(211401,211400,'市辖区'),(211402,211400,'连山区'),(211403,211400,'龙港区'),(211404,211400,'南票区'),(211421,211400,'绥中县'),(211422,211400,'建昌县'),(211481,211400,'兴城市'),(220000,0,'吉林省'),(220100,220000,'长春市'),(220101,220100,'市辖区'),(220102,220100,'南关区'),(220103,220100,'宽城区'),(220104,220100,'朝阳区'),(220105,220100,'二道区'),(220106,220100,'绿园区'),(220112,220100,'双阳区'),(220122,220100,'农安县'),(220181,220100,'九台市'),(220182,220100,'榆树市'),(220183,220100,'德惠市'),(220200,220000,'吉林市'),(220201,220200,'市辖区'),(220202,220200,'昌邑区'),(220203,220200,'龙潭区'),(220204,220200,'船营区'),(220211,220200,'丰满区'),(220221,220200,'永吉县'),(220281,220200,'蛟河市'),(220282,220200,'桦甸市'),(220283,220200,'舒兰市'),(220284,220200,'磐石市'),(220300,220000,'四平市'),(220301,220300,'市辖区'),(220302,220300,'铁西区'),(220303,220300,'铁东区'),(220322,220300,'梨树县'),(220323,220300,'伊通满族自治县'),(220381,220300,'公主岭市'),(220382,220300,'双辽市'),(220400,220000,'辽源市'),(220401,220400,'市辖区'),(220402,220400,'龙山区'),(220403,220400,'西安区'),(220421,220400,'东丰县'),(220422,220400,'东辽县'),(220500,220000,'通化市'),(220501,220500,'市辖区'),(220502,220500,'东昌区'),(220503,220500,'二道江区'),(220521,220500,'通化县'),(220523,220500,'辉南县'),(220524,220500,'柳河县'),(220581,220500,'梅河口市'),(220582,220500,'集安市'),(220600,220000,'白山市'),(220601,220600,'市辖区'),(220602,220600,'八道江区'),(220621,220600,'抚松县'),(220622,220600,'靖宇县'),(220623,220600,'长白朝鲜族自治县'),(220625,220600,'江源县'),(220681,220600,'临江市'),(220700,220000,'松原市'),(220701,220700,'市辖区'),(220702,220700,'宁江区'),(220721,220700,'前郭尔罗斯蒙古族自治县'),(220722,220700,'长岭县'),(220723,220700,'乾安县'),(220724,220700,'扶余县'),(220800,220000,'白城市'),(220801,220800,'市辖区'),(220802,220800,'洮北区'),(220821,220800,'镇赉县'),(220822,220800,'通榆县'),(220881,220800,'洮南市'),(220882,220800,'大安市'),(222400,220000,'延边朝鲜族自治州'),(222401,222400,'延吉市'),(222402,222400,'图们市'),(222403,222400,'敦化市'),(222404,222400,'珲春市'),(222405,222400,'龙井市'),(222406,222400,'和龙市'),(222424,222400,'汪清县'),(222426,222400,'安图县'),(230000,0,'黑龙江省'),(230100,230000,'哈尔滨市'),(230101,230100,'市辖区'),(230102,230100,'道里区'),(230103,230100,'南岗区'),(230104,230100,'道外区'),(230106,230100,'香坊区'),(230107,230100,'动力区'),(230108,230100,'平房区'),(230109,230100,'松北区'),(230111,230100,'呼兰区'),(230123,230100,'依兰县'),(230124,230100,'方正县'),(230125,230100,'宾　县'),(230126,230100,'巴彦县'),(230127,230100,'木兰县'),(230128,230100,'通河县'),(230129,230100,'延寿县'),(230181,230100,'阿城市'),(230182,230100,'双城市'),(230183,230100,'尚志市'),(230184,230100,'五常市'),(230200,230000,'齐齐哈尔市'),(230201,230200,'市辖区'),(230202,230200,'龙沙区'),(230203,230200,'建华区'),(230204,230200,'铁锋区'),(230205,230200,'昂昂溪区'),(230206,230200,'富拉尔基区'),(230207,230200,'碾子山区'),(230208,230200,'梅里斯达斡尔族区'),(230221,230200,'龙江县'),(230223,230200,'依安县'),(230224,230200,'泰来县'),(230225,230200,'甘南县'),(230227,230200,'富裕县'),(230229,230200,'克山县'),(230230,230200,'克东县'),(230231,230200,'拜泉县'),(230281,230200,'讷河市'),(230300,230000,'鸡西市'),(230301,230300,'市辖区'),(230302,230300,'鸡冠区'),(230303,230300,'恒山区'),(230304,230300,'滴道区'),(230305,230300,'梨树区'),(230306,230300,'城子河区'),(230307,230300,'麻山区'),(230321,230300,'鸡东县'),(230381,230300,'虎林市'),(230382,230300,'密山市'),(230400,230000,'鹤岗市'),(230401,230400,'市辖区'),(230402,230400,'向阳区'),(230403,230400,'工农区'),(230404,230400,'南山区'),(230405,230400,'兴安区'),(230406,230400,'东山区'),(230407,230400,'兴山区'),(230421,230400,'萝北县'),(230422,230400,'绥滨县'),(230500,230000,'双鸭山市'),(230501,230500,'市辖区'),(230502,230500,'尖山区'),(230503,230500,'岭东区'),(230505,230500,'四方台区'),(230506,230500,'宝山区'),(230521,230500,'集贤县'),(230522,230500,'友谊县'),(230523,230500,'宝清县'),(230524,230500,'饶河县'),(230600,230000,'大庆市'),(230601,230600,'市辖区'),(230602,230600,'萨尔图区'),(230603,230600,'龙凤区'),(230604,230600,'让胡路区'),(230605,230600,'红岗区'),(230606,230600,'大同区'),(230621,230600,'肇州县'),(230622,230600,'肇源县'),(230623,230600,'林甸县'),(230624,230600,'杜尔伯特蒙古族自治县'),(230700,230000,'伊春市'),(230701,230700,'市辖区'),(230702,230700,'伊春区'),(230703,230700,'南岔区'),(230704,230700,'友好区'),(230705,230700,'西林区'),(230706,230700,'翠峦区'),(230707,230700,'新青区'),(230708,230700,'美溪区'),(230709,230700,'金山屯区'),(230710,230700,'五营区'),(230711,230700,'乌马河区'),(230712,230700,'汤旺河区'),(230713,230700,'带岭区'),(230714,230700,'乌伊岭区'),(230715,230700,'红星区'),(230716,230700,'上甘岭区'),(230722,230700,'嘉荫县'),(230781,230700,'铁力市'),(230800,230000,'佳木斯市'),(230801,230800,'市辖区'),(230802,230800,'永红区'),(230803,230800,'向阳区'),(230804,230800,'前进区'),(230805,230800,'东风区'),(230811,230800,'郊　区'),(230822,230800,'桦南县'),(230826,230800,'桦川县'),(230828,230800,'汤原县'),(230833,230800,'抚远县'),(230881,230800,'同江市'),(230882,230800,'富锦市'),(230900,230000,'七台河市'),(230901,230900,'市辖区'),(230902,230900,'新兴区'),(230903,230900,'桃山区'),(230904,230900,'茄子河区'),(230921,230900,'勃利县'),(231000,230000,'牡丹江市'),(231001,231000,'市辖区'),(231002,231000,'东安区'),(231003,231000,'阳明区'),(231004,231000,'爱民区'),(231005,231000,'西安区'),(231024,231000,'东宁县'),(231025,231000,'林口县'),(231081,231000,'绥芬河市'),(231083,231000,'海林市'),(231084,231000,'宁安市'),(231085,231000,'穆棱市'),(231100,230000,'黑河市'),(231101,231100,'市辖区'),(231102,231100,'爱辉区'),(231121,231100,'嫩江县'),(231123,231100,'逊克县'),(231124,231100,'孙吴县'),(231181,231100,'北安市'),(231182,231100,'五大连池市'),(231200,230000,'绥化市'),(231201,231200,'市辖区'),(231202,231200,'北林区'),(231221,231200,'望奎县'),(231222,231200,'兰西县'),(231223,231200,'青冈县'),(231224,231200,'庆安县'),(231225,231200,'明水县'),(231226,231200,'绥棱县'),(231281,231200,'安达市'),(231282,231200,'肇东市'),(231283,231200,'海伦市'),(232700,230000,'大兴安岭地区'),(232721,232700,'呼玛县'),(232722,232700,'塔河县'),(232723,232700,'漠河县'),(310000,0,'上海市'),(310100,310000,'市辖区'),(310101,310100,'黄浦区'),(310103,310100,'卢湾区'),(310104,310100,'徐汇区'),(310105,310100,'长宁区'),(310106,310100,'静安区'),(310107,310100,'普陀区'),(310108,310100,'闸北区'),(310109,310100,'虹口区'),(310110,310100,'杨浦区'),(310112,310100,'闵行区'),(310113,310100,'宝山区'),(310114,310100,'嘉定区'),(310115,310100,'浦东新区'),(310116,310100,'金山区'),(310117,310100,'松江区'),(310118,310100,'青浦区'),(310119,310100,'南汇区'),(310120,310100,'奉贤区'),(310200,310000,'县'),(310230,310200,'崇明县'),(320000,0,'江苏省'),(320100,320000,'南京市'),(320101,320100,'市辖区'),(320102,320100,'玄武区'),(320103,320100,'白下区'),(320104,320100,'秦淮区'),(320105,320100,'建邺区'),(320106,320100,'鼓楼区'),(320107,320100,'下关区'),(320111,320100,'浦口区'),(320113,320100,'栖霞区'),(320114,320100,'雨花台区'),(320115,320100,'江宁区'),(320116,320100,'六合区'),(320124,320100,'溧水县'),(320125,320100,'高淳县'),(320200,320000,'无锡市'),(320201,320200,'市辖区'),(320202,320200,'崇安区'),(320203,320200,'南长区'),(320204,320200,'北塘区'),(320205,320200,'锡山区'),(320206,320200,'惠山区'),(320211,320200,'滨湖区'),(320281,320200,'江阴市'),(320282,320200,'宜兴市'),(320300,320000,'徐州市'),(320301,320300,'市辖区'),(320302,320300,'鼓楼区'),(320303,320300,'云龙区'),(320304,320300,'九里区'),(320305,320300,'贾汪区'),(320311,320300,'泉山区'),(320321,320300,'丰　县'),(320322,320300,'沛　县'),(320323,320300,'铜山县'),(320324,320300,'睢宁县'),(320381,320300,'新沂市'),(320382,320300,'邳州市'),(320400,320000,'常州市'),(320401,320400,'市辖区'),(320402,320400,'天宁区'),(320404,320400,'钟楼区'),(320405,320400,'戚墅堰区'),(320411,320400,'新北区'),(320412,320400,'武进区'),(320481,320400,'溧阳市'),(320482,320400,'金坛市'),(320500,320000,'苏州市'),(320501,320500,'市辖区'),(320502,320500,'沧浪区'),(320503,320500,'平江区'),(320504,320500,'金阊区'),(320505,320500,'虎丘区'),(320506,320500,'吴中区'),(320507,320500,'相城区'),(320581,320500,'常熟市'),(320582,320500,'张家港市'),(320583,320500,'昆山市'),(320584,320500,'吴江市'),(320585,320500,'太仓市'),(320600,320000,'南通市'),(320601,320600,'市辖区'),(320602,320600,'崇川区'),(320611,320600,'港闸区'),(320621,320600,'海安县'),(320623,320600,'如东县'),(320681,320600,'启东市'),(320682,320600,'如皋市'),(320683,320600,'通州市'),(320684,320600,'海门市'),(320700,320000,'连云港市'),(320701,320700,'市辖区'),(320703,320700,'连云区'),(320705,320700,'新浦区'),(320706,320700,'海州区'),(320721,320700,'赣榆县'),(320722,320700,'东海县'),(320723,320700,'灌云县'),(320724,320700,'灌南县'),(320800,320000,'淮安市'),(320801,320800,'市辖区'),(320802,320800,'清河区'),(320803,320800,'楚州区'),(320804,320800,'淮阴区'),(320811,320800,'清浦区'),(320826,320800,'涟水县'),(320829,320800,'洪泽县'),(320830,320800,'盱眙县'),(320831,320800,'金湖县'),(320900,320000,'盐城市'),(320901,320900,'市辖区'),(320902,320900,'亭湖区'),(320903,320900,'盐都区'),(320921,320900,'响水县'),(320922,320900,'滨海县'),(320923,320900,'阜宁县'),(320924,320900,'射阳县'),(320925,320900,'建湖县'),(320981,320900,'东台市'),(320982,320900,'大丰市'),(321000,320000,'扬州市'),(321001,321000,'市辖区'),(321002,321000,'广陵区'),(321003,321000,'邗江区'),(321011,321000,'郊　区'),(321023,321000,'宝应县'),(321081,321000,'仪征市'),(321084,321000,'高邮市'),(321088,321000,'江都市'),(321100,320000,'镇江市'),(321101,321100,'市辖区'),(321102,321100,'京口区'),(321111,321100,'润州区'),(321112,321100,'丹徒区'),(321181,321100,'丹阳市'),(321182,321100,'扬中市'),(321183,321100,'句容市'),(321200,320000,'泰州市'),(321201,321200,'市辖区'),(321202,321200,'海陵区'),(321203,321200,'高港区'),(321281,321200,'兴化市'),(321282,321200,'靖江市'),(321283,321200,'泰兴市'),(321284,321200,'姜堰市'),(321300,320000,'宿迁市'),(321301,321300,'市辖区'),(321302,321300,'宿城区'),(321311,321300,'宿豫区'),(321322,321300,'沭阳县'),(321323,321300,'泗阳县'),(321324,321300,'泗洪县'),(330000,0,'浙江省'),(330100,330000,'杭州市'),(330101,330100,'市辖区'),(330102,330100,'上城区'),(330103,330100,'下城区'),(330104,330100,'江干区'),(330105,330100,'拱墅区'),(330106,330100,'西湖区'),(330108,330100,'滨江区'),(330109,330100,'萧山区'),(330110,330100,'余杭区'),(330122,330100,'桐庐县'),(330127,330100,'淳安县'),(330182,330100,'建德市'),(330183,330100,'富阳市'),(330185,330100,'临安市'),(330200,330000,'宁波市'),(330201,330200,'市辖区'),(330203,330200,'海曙区'),(330204,330200,'江东区'),(330205,330200,'江北区'),(330206,330200,'北仑区'),(330211,330200,'镇海区'),(330212,330200,'鄞州区'),(330225,330200,'象山县'),(330226,330200,'宁海县'),(330281,330200,'余姚市'),(330282,330200,'慈溪市'),(330283,330200,'奉化市'),(330300,330000,'温州市'),(330301,330300,'市辖区'),(330302,330300,'鹿城区'),(330303,330300,'龙湾区'),(330304,330300,'瓯海区'),(330322,330300,'洞头县'),(330324,330300,'永嘉县'),(330326,330300,'平阳县'),(330327,330300,'苍南县'),(330328,330300,'文成县'),(330329,330300,'泰顺县'),(330381,330300,'瑞安市'),(330382,330300,'乐清市'),(330400,330000,'嘉兴市'),(330401,330400,'市辖区'),(330402,330400,'秀城区'),(330411,330400,'秀洲区'),(330421,330400,'嘉善县'),(330424,330400,'海盐县'),(330481,330400,'海宁市'),(330482,330400,'平湖市'),(330483,330400,'桐乡市'),(330500,330000,'湖州市'),(330501,330500,'市辖区'),(330502,330500,'吴兴区'),(330503,330500,'南浔区'),(330521,330500,'德清县'),(330522,330500,'长兴县'),(330523,330500,'安吉县'),(330600,330000,'绍兴市'),(330601,330600,'市辖区'),(330602,330600,'越城区'),(330621,330600,'绍兴县'),(330624,330600,'新昌县'),(330681,330600,'诸暨市'),(330682,330600,'上虞市'),(330683,330600,'嵊州市'),(330700,330000,'金华市'),(330701,330700,'市辖区'),(330702,330700,'婺城区'),(330703,330700,'金东区'),(330723,330700,'武义县'),(330726,330700,'浦江县'),(330727,330700,'磐安县'),(330781,330700,'兰溪市'),(330782,330700,'义乌市'),(330783,330700,'东阳市'),(330784,330700,'永康市'),(330800,330000,'衢州市'),(330801,330800,'市辖区'),(330802,330800,'柯城区'),(330803,330800,'衢江区'),(330822,330800,'常山县'),(330824,330800,'开化县'),(330825,330800,'龙游县'),(330881,330800,'江山市'),(330900,330000,'舟山市'),(330901,330900,'市辖区'),(330902,330900,'定海区'),(330903,330900,'普陀区'),(330921,330900,'岱山县'),(330922,330900,'嵊泗县'),(331000,330000,'台州市'),(331001,331000,'市辖区'),(331002,331000,'椒江区'),(331003,331000,'黄岩区'),(331004,331000,'路桥区'),(331021,331000,'玉环县'),(331022,331000,'三门县'),(331023,331000,'天台县'),(331024,331000,'仙居县'),(331081,331000,'温岭市'),(331082,331000,'临海市'),(331100,330000,'丽水市'),(331101,331100,'市辖区'),(331102,331100,'莲都区'),(331121,331100,'青田县'),(331122,331100,'缙云县'),(331123,331100,'遂昌县'),(331124,331100,'松阳县'),(331125,331100,'云和县'),(331126,331100,'庆元县'),(331127,331100,'景宁畲族自治县'),(331181,331100,'龙泉市'),(340000,0,'安徽省'),(340100,340000,'合肥市'),(340101,340100,'市辖区'),(340102,340100,'瑶海区'),(340103,340100,'庐阳区'),(340104,340100,'蜀山区'),(340111,340100,'包河区'),(340121,340100,'长丰县'),(340122,340100,'肥东县'),(340123,340100,'肥西县'),(340200,340000,'芜湖市'),(340201,340200,'市辖区'),(340202,340200,'镜湖区'),(340203,340200,'马塘区'),(340204,340200,'新芜区'),(340207,340200,'鸠江区'),(340221,340200,'芜湖县'),(340222,340200,'繁昌县'),(340223,340200,'南陵县'),(340300,340000,'蚌埠市'),(340301,340300,'市辖区'),(340302,340300,'龙子湖区'),(340303,340300,'蚌山区'),(340304,340300,'禹会区'),(340311,340300,'淮上区'),(340321,340300,'怀远县'),(340322,340300,'五河县'),(340323,340300,'固镇县'),(340400,340000,'淮南市'),(340401,340400,'市辖区'),(340402,340400,'大通区'),(340403,340400,'田家庵区'),(340404,340400,'谢家集区'),(340405,340400,'八公山区'),(340406,340400,'潘集区'),(340421,340400,'凤台县'),(340500,340000,'马鞍山市'),(340501,340500,'市辖区'),(340502,340500,'金家庄区'),(340503,340500,'花山区'),(340504,340500,'雨山区'),(340521,340500,'当涂县'),(340600,340000,'淮北市'),(340601,340600,'市辖区'),(340602,340600,'杜集区'),(340603,340600,'相山区'),(340604,340600,'烈山区'),(340621,340600,'濉溪县'),(340700,340000,'铜陵市'),(340701,340700,'市辖区'),(340702,340700,'铜官山区'),(340703,340700,'狮子山区'),(340711,340700,'郊　区'),(340721,340700,'铜陵县'),(340800,340000,'安庆市'),(340801,340800,'市辖区'),(340802,340800,'迎江区'),(340803,340800,'大观区'),(340811,340800,'郊　区'),(340822,340800,'怀宁县'),(340823,340800,'枞阳县'),(340824,340800,'潜山县'),(340825,340800,'太湖县'),(340826,340800,'宿松县'),(340827,340800,'望江县'),(340828,340800,'岳西县'),(340881,340800,'桐城市'),(341000,340000,'黄山市'),(341001,341000,'市辖区'),(341002,341000,'屯溪区'),(341003,341000,'黄山区'),(341004,341000,'徽州区'),(341021,341000,'歙　县'),(341022,341000,'休宁县'),(341023,341000,'黟　县'),(341024,341000,'祁门县'),(341100,340000,'滁州市'),(341101,341100,'市辖区'),(341102,341100,'琅琊区'),(341103,341100,'南谯区'),(341122,341100,'来安县'),(341124,341100,'全椒县'),(341125,341100,'定远县'),(341126,341100,'凤阳县'),(341181,341100,'天长市'),(341182,341100,'明光市'),(341200,340000,'阜阳市'),(341201,341200,'市辖区'),(341202,341200,'颍州区'),(341203,341200,'颍东区'),(341204,341200,'颍泉区'),(341221,341200,'临泉县'),(341222,341200,'太和县'),(341225,341200,'阜南县'),(341226,341200,'颍上县'),(341282,341200,'界首市'),(341300,340000,'宿州市'),(341301,341300,'市辖区'),(341302,341300,'墉桥区'),(341321,341300,'砀山县'),(341322,341300,'萧　县'),(341323,341300,'灵璧县'),(341324,341300,'泗　县'),(341400,340000,'巢湖市'),(341401,341400,'市辖区'),(341402,341400,'居巢区'),(341421,341400,'庐江县'),(341422,341400,'无为县'),(341423,341400,'含山县'),(341424,341400,'和　县'),(341500,340000,'六安市'),(341501,341500,'市辖区'),(341502,341500,'金安区'),(341503,341500,'裕安区'),(341521,341500,'寿　县'),(341522,341500,'霍邱县'),(341523,341500,'舒城县'),(341524,341500,'金寨县'),(341525,341500,'霍山县'),(341600,340000,'亳州市'),(341601,341600,'市辖区'),(341602,341600,'谯城区'),(341621,341600,'涡阳县'),(341622,341600,'蒙城县'),(341623,341600,'利辛县'),(341700,340000,'池州市'),(341701,341700,'市辖区'),(341702,341700,'贵池区'),(341721,341700,'东至县'),(341722,341700,'石台县'),(341723,341700,'青阳县'),(341800,340000,'宣城市'),(341801,341800,'市辖区'),(341802,341800,'宣州区'),(341821,341800,'郎溪县'),(341822,341800,'广德县'),(341823,341800,'泾　县'),(341824,341800,'绩溪县'),(341825,341800,'旌德县'),(341881,341800,'宁国市'),(350000,0,'福建省'),(350100,350000,'福州市'),(350101,350100,'市辖区'),(350102,350100,'鼓楼区'),(350103,350100,'台江区'),(350104,350100,'仓山区'),(350105,350100,'马尾区'),(350111,350100,'晋安区'),(350121,350100,'闽侯县'),(350122,350100,'连江县'),(350123,350100,'罗源县'),(350124,350100,'闽清县'),(350125,350100,'永泰县'),(350128,350100,'平潭县'),(350181,350100,'福清市'),(350182,350100,'长乐市'),(350200,350000,'厦门市'),(350201,350200,'市辖区'),(350203,350200,'思明区'),(350205,350200,'海沧区'),(350206,350200,'湖里区'),(350211,350200,'集美区'),(350212,350200,'同安区'),(350213,350200,'翔安区'),(350300,350000,'莆田市'),(350301,350300,'市辖区'),(350302,350300,'城厢区'),(350303,350300,'涵江区'),(350304,350300,'荔城区'),(350305,350300,'秀屿区'),(350322,350300,'仙游县'),(350400,350000,'三明市'),(350401,350400,'市辖区'),(350402,350400,'梅列区'),(350403,350400,'三元区'),(350421,350400,'明溪县'),(350423,350400,'清流县'),(350424,350400,'宁化县'),(350425,350400,'大田县'),(350426,350400,'尤溪县'),(350427,350400,'沙　县'),(350428,350400,'将乐县'),(350429,350400,'泰宁县'),(350430,350400,'建宁县'),(350481,350400,'永安市'),(350500,350000,'泉州市'),(350501,350500,'市辖区'),(350502,350500,'鲤城区'),(350503,350500,'丰泽区'),(350504,350500,'洛江区'),(350505,350500,'泉港区'),(350521,350500,'惠安县'),(350524,350500,'安溪县'),(350525,350500,'永春县'),(350526,350500,'德化县'),(350527,350500,'金门县'),(350581,350500,'石狮市'),(350582,350500,'晋江市'),(350583,350500,'南安市'),(350600,350000,'漳州市'),(350601,350600,'市辖区'),(350602,350600,'芗城区'),(350603,350600,'龙文区'),(350622,350600,'云霄县'),(350623,350600,'漳浦县'),(350624,350600,'诏安县'),(350625,350600,'长泰县'),(350626,350600,'东山县'),(350627,350600,'南靖县'),(350628,350600,'平和县'),(350629,350600,'华安县'),(350681,350600,'龙海市'),(350700,350000,'南平市'),(350701,350700,'市辖区'),(350702,350700,'延平区'),(350721,350700,'顺昌县'),(350722,350700,'浦城县'),(350723,350700,'光泽县'),(350724,350700,'松溪县'),(350725,350700,'政和县'),(350781,350700,'邵武市'),(350782,350700,'武夷山市'),(350783,350700,'建瓯市'),(350784,350700,'建阳市'),(350800,350000,'龙岩市'),(350801,350800,'市辖区'),(350802,350800,'新罗区'),(350821,350800,'长汀县'),(350822,350800,'永定县'),(350823,350800,'上杭县'),(350824,350800,'武平县'),(350825,350800,'连城县'),(350881,350800,'漳平市'),(350900,350000,'宁德市'),(350901,350900,'市辖区'),(350902,350900,'蕉城区'),(350921,350900,'霞浦县'),(350922,350900,'古田县'),(350923,350900,'屏南县'),(350924,350900,'寿宁县'),(350925,350900,'周宁县'),(350926,350900,'柘荣县'),(350981,350900,'福安市'),(350982,350900,'福鼎市'),(360000,0,'江西省'),(360100,360000,'南昌市'),(360101,360100,'市辖区'),(360102,360100,'东湖区'),(360103,360100,'西湖区'),(360104,360100,'青云谱区'),(360105,360100,'湾里区'),(360111,360100,'青山湖区'),(360121,360100,'南昌县'),(360122,360100,'新建县'),(360123,360100,'安义县'),(360124,360100,'进贤县'),(360200,360000,'景德镇市'),(360201,360200,'市辖区'),(360202,360200,'昌江区'),(360203,360200,'珠山区'),(360222,360200,'浮梁县'),(360281,360200,'乐平市'),(360300,360000,'萍乡市'),(360301,360300,'市辖区'),(360302,360300,'安源区'),(360313,360300,'湘东区'),(360321,360300,'莲花县'),(360322,360300,'上栗县'),(360323,360300,'芦溪县'),(360400,360000,'九江市'),(360401,360400,'市辖区'),(360402,360400,'庐山区'),(360403,360400,'浔阳区'),(360421,360400,'九江县'),(360423,360400,'武宁县'),(360424,360400,'修水县'),(360425,360400,'永修县'),(360426,360400,'德安县'),(360427,360400,'星子县'),(360428,360400,'都昌县'),(360429,360400,'湖口县'),(360430,360400,'彭泽县'),(360481,360400,'瑞昌市'),(360500,360000,'新余市'),(360501,360500,'市辖区'),(360502,360500,'渝水区'),(360521,360500,'分宜县'),(360600,360000,'鹰潭市'),(360601,360600,'市辖区'),(360602,360600,'月湖区'),(360622,360600,'余江县'),(360681,360600,'贵溪市'),(360700,360000,'赣州市'),(360701,360700,'市辖区'),(360702,360700,'章贡区'),(360721,360700,'赣　县'),(360722,360700,'信丰县'),(360723,360700,'大余县'),(360724,360700,'上犹县'),(360725,360700,'崇义县'),(360726,360700,'安远县'),(360727,360700,'龙南县'),(360728,360700,'定南县'),(360729,360700,'全南县'),(360730,360700,'宁都县'),(360731,360700,'于都县'),(360732,360700,'兴国县'),(360733,360700,'会昌县'),(360734,360700,'寻乌县'),(360735,360700,'石城县'),(360781,360700,'瑞金市'),(360782,360700,'南康市'),(360800,360000,'吉安市'),(360801,360800,'市辖区'),(360802,360800,'吉州区'),(360803,360800,'青原区'),(360821,360800,'吉安县'),(360822,360800,'吉水县'),(360823,360800,'峡江县'),(360824,360800,'新干县'),(360825,360800,'永丰县'),(360826,360800,'泰和县'),(360827,360800,'遂川县'),(360828,360800,'万安县'),(360829,360800,'安福县'),(360830,360800,'永新县'),(360881,360800,'井冈山市'),(360900,360000,'宜春市'),(360901,360900,'市辖区'),(360902,360900,'袁州区'),(360921,360900,'奉新县'),(360922,360900,'万载县'),(360923,360900,'上高县'),(360924,360900,'宜丰县'),(360925,360900,'靖安县'),(360926,360900,'铜鼓县'),(360981,360900,'丰城市'),(360982,360900,'樟树市'),(360983,360900,'高安市'),(361000,360000,'抚州市'),(361001,361000,'市辖区'),(361002,361000,'临川区'),(361021,361000,'南城县'),(361022,361000,'黎川县'),(361023,361000,'南丰县'),(361024,361000,'崇仁县'),(361025,361000,'乐安县'),(361026,361000,'宜黄县'),(361027,361000,'金溪县'),(361028,361000,'资溪县'),(361029,361000,'东乡县'),(361030,361000,'广昌县'),(361100,360000,'上饶市'),(361101,361100,'市辖区'),(361102,361100,'信州区'),(361121,361100,'上饶县'),(361122,361100,'广丰县'),(361123,361100,'玉山县'),(361124,361100,'铅山县'),(361125,361100,'横峰县'),(361126,361100,'弋阳县'),(361127,361100,'余干县'),(361128,361100,'鄱阳县'),(361129,361100,'万年县'),(361130,361100,'婺源县'),(361181,361100,'德兴市'),(370000,0,'山东省'),(370100,370000,'济南市'),(370101,370100,'市辖区'),(370102,370100,'历下区'),(370103,370100,'市中区'),(370104,370100,'槐荫区'),(370105,370100,'天桥区'),(370112,370100,'历城区'),(370113,370100,'长清区'),(370124,370100,'平阴县'),(370125,370100,'济阳县'),(370126,370100,'商河县'),(370181,370100,'章丘市'),(370200,370000,'青岛市'),(370201,370200,'市辖区'),(370202,370200,'市南区'),(370203,370200,'市北区'),(370205,370200,'四方区'),(370211,370200,'黄岛区'),(370212,370200,'崂山区'),(370213,370200,'李沧区'),(370214,370200,'城阳区'),(370281,370200,'胶州市'),(370282,370200,'即墨市'),(370283,370200,'平度市'),(370284,370200,'胶南市'),(370285,370200,'莱西市'),(370300,370000,'淄博市'),(370301,370300,'市辖区'),(370302,370300,'淄川区'),(370303,370300,'张店区'),(370304,370300,'博山区'),(370305,370300,'临淄区'),(370306,370300,'周村区'),(370321,370300,'桓台县'),(370322,370300,'高青县'),(370323,370300,'沂源县'),(370400,370000,'枣庄市'),(370401,370400,'市辖区'),(370402,370400,'市中区'),(370403,370400,'薛城区'),(370404,370400,'峄城区'),(370405,370400,'台儿庄区'),(370406,370400,'山亭区'),(370481,370400,'滕州市'),(370500,370000,'东营市'),(370501,370500,'市辖区'),(370502,370500,'东营区'),(370503,370500,'河口区'),(370521,370500,'垦利县'),(370522,370500,'利津县'),(370523,370500,'广饶县'),(370600,370000,'烟台市'),(370601,370600,'市辖区'),(370602,370600,'芝罘区'),(370611,370600,'福山区'),(370612,370600,'牟平区'),(370613,370600,'莱山区'),(370634,370600,'长岛县'),(370681,370600,'龙口市'),(370682,370600,'莱阳市'),(370683,370600,'莱州市'),(370684,370600,'蓬莱市'),(370685,370600,'招远市'),(370686,370600,'栖霞市'),(370687,370600,'海阳市'),(370700,370000,'潍坊市'),(370701,370700,'市辖区'),(370702,370700,'潍城区'),(370703,370700,'寒亭区'),(370704,370700,'坊子区'),(370705,370700,'奎文区'),(370724,370700,'临朐县'),(370725,370700,'昌乐县'),(370781,370700,'青州市'),(370782,370700,'诸城市'),(370783,370700,'寿光市'),(370784,370700,'安丘市'),(370785,370700,'高密市'),(370786,370700,'昌邑市'),(370800,370000,'济宁市'),(370801,370800,'市辖区'),(370802,370800,'市中区'),(370811,370800,'任城区'),(370826,370800,'微山县'),(370827,370800,'鱼台县'),(370828,370800,'金乡县'),(370829,370800,'嘉祥县'),(370830,370800,'汶上县'),(370831,370800,'泗水县'),(370832,370800,'梁山县'),(370881,370800,'曲阜市'),(370882,370800,'兖州市'),(370883,370800,'邹城市'),(370900,370000,'泰安市'),(370901,370900,'市辖区'),(371000,370000,'威海市'),(371100,370000,'日照市'),(371200,370000,'莱芜市'),(371300,370000,'临沂市'),(371400,370000,'德州市'),(371500,370000,'聊城市'),(371600,370000,'滨州市'),(371700,370000,'荷泽市'),(410000,0,'河南省'),(410100,410000,'郑州市'),(410200,410000,'开封市'),(410300,410000,'洛阳市'),(410400,410000,'平顶山市'),(410500,410000,'安阳市'),(410600,410000,'鹤壁市'),(410700,410000,'新乡市'),(410800,410000,'焦作市'),(410900,410000,'濮阳市'),(411000,410000,'许昌市'),(411100,410000,'漯河市'),(411200,410000,'三门峡市'),(411300,410000,'南阳市'),(411400,410000,'商丘市'),(411500,410000,'信阳市'),(411600,410000,'周口市'),(411700,410000,'驻马店市'),(420100,420000,'武汉市'),(420200,420000,'黄石市'),(420300,420000,'十堰市'),(420500,420000,'宜昌市'),(420600,420000,'襄樊市'),(420700,420000,'鄂州市'),(420800,420000,'荆门市'),(420900,420000,'孝感市'),(421000,420000,'荆州市'),(421100,420000,'黄冈市'),(421200,420000,'咸宁市'),(421300,420000,'随州市'),(422800,420000,'恩施土家族苗族自治州'),(430000,0,'湖南省'),(430100,430000,'长沙市'),(430200,430000,'株洲市'),(430300,430000,'湘潭市'),(430400,430000,'衡阳市'),(430500,430000,'邵阳市'),(430600,430000,'岳阳市'),(430700,430000,'常德市'),(430800,430000,'张家界市'),(430900,430000,'益阳市'),(431000,430000,'郴州市'),(431100,430000,'永州市'),(431200,430000,'怀化市'),(431300,430000,'娄底市'),(433100,430000,'湘西土家族苗族自治州'),(440000,0,'广东省'),(440100,440000,'广州市'),(440200,440000,'韶关市'),(440300,440000,'深圳市'),(440400,440000,'珠海市'),(440500,440000,'汕头市'),(440600,440000,'佛山市'),(440700,440000,'江门市'),(440800,440000,'湛江市'),(440900,440000,'茂名市'),(441200,440000,'肇庆市'),(441300,440000,'惠州市'),(441400,440000,'梅州市'),(441500,440000,'汕尾市'),(441600,440000,'河源市'),(441700,440000,'阳江市'),(441800,440000,'清远市'),(441900,440000,'东莞市'),(442000,440000,'中山市'),(445100,440000,'潮州市'),(445200,440000,'揭阳市'),(445300,440000,'云浮市'),(450000,0,'广西壮族自治区'),(450100,450000,'南宁市'),(450200,450000,'柳州市'),(450300,450000,'桂林市'),(450400,450000,'梧州市'),(450500,450000,'北海市'),(450600,450000,'防城港市'),(450700,450000,'钦州市'),(450800,450000,'贵港市'),(450900,450000,'玉林市'),(451000,450000,'百色市'),(451100,450000,'贺州市'),(451200,450000,'河池市'),(451300,450000,'来宾市'),(451400,450000,'崇左市'),(460000,0,'海南省'),(460100,460000,'海口市'),(460200,460000,'三亚市'),(500000,0,'重庆市'),(500100,500000,'市辖区'),(500200,500000,'县'),(510000,0,'四川省'),(510100,510000,'成都市'),(510300,510000,'自贡市'),(510400,510000,'攀枝花市'),(510500,510000,'泸州市'),(510600,510000,'德阳市'),(510700,510000,'绵阳市'),(510800,510000,'广元市'),(510900,510000,'遂宁市'),(511000,510000,'内江市'),(511100,510000,'乐山市'),(511300,510000,'南充市'),(511400,510000,'眉山市'),(511500,510000,'宜宾市'),(511600,510000,'广安市'),(511700,510000,'达州市'),(511800,510000,'雅安市'),(511900,510000,'巴中市'),(512000,510000,'资阳市'),(513200,510000,'阿坝藏族羌族自治州'),(513300,510000,'甘孜藏族自治州'),(513400,510000,'凉山彝族自治州'),(520000,0,'贵州省'),(520100,520000,'贵阳市'),(520200,520000,'六盘水市'),(520300,520000,'遵义市'),(520400,520000,'安顺市'),(522200,520000,'铜仁地区'),(522300,520000,'黔西南布依族苗族自治州'),(522400,520000,'毕节地区'),(522600,520000,'黔东南苗族侗族自治州'),(522700,520000,'黔南布依族苗族自治州'),(530000,0,'云南省'),(530100,530000,'昆明市'),(530300,530000,'曲靖市'),(530400,530000,'玉溪市'),(530500,530000,'保山市'),(530600,530000,'昭通市'),(530700,530000,'丽江市'),(530800,530000,'思茅市'),(530900,530000,'临沧市'),(532300,530000,'楚雄彝族自治州'),(532500,530000,'红河哈尼族彝族自治州'),(532600,530000,'文山壮族苗族自治州'),(532800,530000,'西双版纳傣族自治州'),(532900,530000,'大理白族自治州'),(533100,530000,'德宏傣族景颇族自治州'),(533300,530000,'怒江傈僳族自治州'),(533400,530000,'迪庆藏族自治州'),(540000,0,'西藏自治区'),(540100,540000,'拉萨市'),(542100,540000,'昌都地区'),(542200,540000,'山南地区'),(542300,540000,'日喀则地区'),(542400,540000,'那曲地区'),(542500,540000,'阿里地区'),(542600,540000,'林芝地区'),(610000,0,'陕西省'),(610100,610000,'西安市'),(610200,610000,'铜川市'),(610300,610000,'宝鸡市'),(610400,610000,'咸阳市'),(610500,610000,'渭南市'),(610600,610000,'延安市'),(610700,610000,'汉中市'),(610800,610000,'榆林市'),(610900,610000,'安康市'),(611000,610000,'商洛市'),(620000,0,'甘肃省'),(620100,620000,'兰州市'),(620200,620000,'嘉峪关市'),(620300,620000,'金昌市'),(620400,620000,'白银市'),(620500,620000,'天水市'),(620600,620000,'武威市'),(620700,620000,'张掖市'),(620800,620000,'平凉市'),(620900,620000,'酒泉市'),(621000,620000,'庆阳市'),(621100,620000,'定西市'),(621200,620000,'陇南市'),(622900,620000,'临夏回族自治州'),(623000,620000,'甘南藏族自治州'),(630000,0,'青海省'),(630100,630000,'西宁市'),(632100,630000,'海东地区'),(632200,630000,'海北藏族自治州'),(632300,630000,'黄南藏族自治州'),(632500,630000,'海南藏族自治州'),(632600,630000,'果洛藏族自治州'),(632700,630000,'玉树藏族自治州'),(632800,630000,'海西蒙古族藏族自治州'),(640000,0,'宁夏回族自治区'),(640100,640000,'银川市'),(640200,640000,'石嘴山市'),(640300,640000,'吴忠市'),(640400,640000,'固原市'),(640500,640000,'中卫市'),(650000,0,'新疆维吾尔自治区'),(650100,650000,'乌鲁木齐市'),(650200,650000,'克拉玛依市'),(652100,650000,'吐鲁番地区'),(652200,650000,'哈密地区'),(652300,650000,'昌吉回族自治州'),(652700,650000,'博尔塔拉蒙古自治州'),(652800,650000,'巴音郭楞蒙古自治州'),(652900,650000,'阿克苏地区'),(653000,650000,'克孜勒苏柯尔克孜自治州'),(653100,650000,'喀什地区'),(653200,650000,'和田地区'),(654000,650000,'伊犁哈萨克自治州'),(654200,650000,'塔城地区'),(654300,650000,'阿勒泰地区'),(710000,0,'台湾省'),(810000,0,'香港特别行政区'),(820000,0,'澳门特别行政区'),(820001,0,'其他');

/*Table structure for table `jbj_item_type` */

DROP TABLE IF EXISTS `jbj_item_type`;

CREATE TABLE `jbj_item_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `jbj_item_type` */

/*Table structure for table `jbj_order_commission` */

DROP TABLE IF EXISTS `jbj_order_commission`;

CREATE TABLE `jbj_order_commission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  `create_time` datetime NOT NULL,
  `modify_time` datetime NOT NULL,
  `auction_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `commission` double NOT NULL,
  `commission_status` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `jbj_order_commission` */

insert  into `jbj_order_commission`(`id`,`is_deleted`,`create_time`,`modify_time`,`auction_id`,`user_id`,`commission`,`commission_status`) values (1,0,'2017-03-03 15:07:03','2017-03-03 15:07:03',1,0,4,2),(2,0,'2017-03-04 11:49:30','2017-03-04 11:49:30',1,49,5,2),(3,0,'2017-03-04 11:49:30','2017-03-04 11:49:30',1,49,0,2);

/*Table structure for table `jbj_order_commission_record` */

DROP TABLE IF EXISTS `jbj_order_commission_record`;

CREATE TABLE `jbj_order_commission_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  `create_time` datetime NOT NULL,
  `modify_time` datetime NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `auction_id` bigint(20) NOT NULL,
  `commission` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `jbj_order_commission_record` */

insert  into `jbj_order_commission_record`(`id`,`is_deleted`,`create_time`,`modify_time`,`user_id`,`auction_id`,`commission`) values (7,0,'2017-03-03 15:07:03','2017-03-03 15:07:03',0,1,2),(9,0,'2017-03-03 15:08:51','2017-03-03 15:08:51',0,1,2);

/*Table structure for table `jbj_order_insurance` */

DROP TABLE IF EXISTS `jbj_order_insurance`;

CREATE TABLE `jbj_order_insurance` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  `create_time` datetime NOT NULL,
  `modify_time` datetime NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `auction_id` bigint(20) NOT NULL,
  `insurance` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `insurance_status` tinyint(4) DEFAULT '0' COMMENT '保证金状态（-1.超时订单取消，0.待支付，1.冻结，2.可转余额，3.已进入得主订单，4.违约扣除）',
  `out_trade_no` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商户订单号（时间戳13位+随机数5位）',
  `trade_no` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '支付宝交易订单号（14位时间+14位随机数）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `jbj_order_insurance` */

insert  into `jbj_order_insurance`(`id`,`is_deleted`,`create_time`,`modify_time`,`user_id`,`auction_id`,`insurance`,`insurance_status`,`out_trade_no`,`trade_no`) values (3,0,'2017-02-17 12:54:05','2017-02-17 12:54:04',0,1,'0.01',2,'148731473411543208','2017022521001004610264382931'),(4,0,'2017-02-17 15:08:50','2017-02-17 15:08:50',0,2,'0.01',3,'148731532957513253','2017021721001004530295534193'),(5,0,'2017-02-17 15:15:43','2017-02-17 15:15:43',0,3,'0.01',3,'148731574385883814','2017021721001004530295573210'),(6,0,'2017-02-24 16:39:58','2017-02-24 16:39:58',220,1,'0.01',0,'148792559892476159','0'),(7,0,'2017-02-27 20:15:34','2017-02-27 20:17:38',0,4,'0',1,NULL,'0');

/*Table structure for table `jbj_order_winner` */

DROP TABLE IF EXISTS `jbj_order_winner`;

CREATE TABLE `jbj_order_winner` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  `create_time` datetime NOT NULL,
  `modify_time` datetime NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `auction_id` bigint(20) NOT NULL,
  `retainage` double NOT NULL,
  `total_price` double NOT NULL,
  `pay_status` tinyint(4) NOT NULL,
  `logistics_num` varchar(24) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `out_trade_no` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `end_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `jbj_order_winner` */

insert  into `jbj_order_winner`(`id`,`is_deleted`,`create_time`,`modify_time`,`user_id`,`auction_id`,`retainage`,`total_price`,`pay_status`,`logistics_num`,`out_trade_no`,`end_time`) values (1,0,'2017-02-22 17:29:56','2017-02-22 17:29:59',0,9,0,1,2,NULL,'148731584385883845','2017-02-24 20:47:40'),(2,0,'2017-02-27 20:17:07','2017-02-27 20:17:09',0,10,100,0,2,NULL,'','2017-02-27 20:23:30');

/*Table structure for table `jbj_org` */

DROP TABLE IF EXISTS `jbj_org`;

CREATE TABLE `jbj_org` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `license` varchar(100) NOT NULL,
  `account` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `principal` varchar(20) NOT NULL,
  `state` int(11) NOT NULL,
  `address` varchar(40) NOT NULL,
  `date` date DEFAULT NULL,
  `identify_front` varchar(100) NOT NULL,
  `identify_behind` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `icon` varchar(100) NOT NULL,
  `auction_items` varchar(1024) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `jbj_org` */

insert  into `jbj_org`(`id`,`name`,`license`,`account`,`password`,`principal`,`state`,`address`,`date`,`identify_front`,`identify_behind`,`phone`,`icon`,`auction_items`) values (1,'哈哈哈','','111','123455','我叫哈',-1,'阿法士大夫','2017-03-05','','','','',''),(2,'卡时候端口','','222','234567','电风扇',-1,'第三方','2017-03-14','','','','','');

/*Table structure for table `jbj_recommend_shop` */

DROP TABLE IF EXISTS `jbj_recommend_shop`;

CREATE TABLE `jbj_recommend_shop` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shop_id` bigint(20) NOT NULL COMMENT '商铺id',
  `banner` varchar(2083) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '推荐图片',
  `state` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1 有效 0 无效',
  `priority` int(11) NOT NULL COMMENT '排序优先级 升序',
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_shop_id` (`shop_id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `jbj_recommend_shop` */

insert  into `jbj_recommend_shop`(`id`,`shop_id`,`banner`,`state`,`priority`,`create_time`) values (35,79,'shop/7bf83058e80a6add43d018964c356d84.png',0,1,'2015-10-28 11:16:57'),(36,80,'shop/29731074634eb5deb1e90c666818cc63.jpg',0,1,'2015-10-28 16:48:27'),(37,82,'shop/1b57db1958a8147a18e99e96fac0ca09.png',1,6,'2015-11-06 14:01:16'),(38,82,'shop/c7f6535a85c6f196cb12806a9dd3d5bf.jpg',0,1,'2015-11-06 14:09:15'),(39,82,'shop/383823e00d1b25e24c807045400b58e8.jpg',0,1,'2015-11-06 14:09:36'),(40,79,'shop/625e8c42d8a53a133eb016ccd9981b7f.png',1,3,'2015-11-06 15:22:50'),(41,80,'shop/69e4eecb8ee99dd81f11e03a2ae372d1.png',1,5,'2015-11-06 16:38:21'),(42,80,'shop/3166dc5b14ec87ff9e35a60da335a031.png',1,7,'2015-11-12 11:18:54');

/*Table structure for table `jbj_report` */

DROP TABLE IF EXISTS `jbj_report`;

CREATE TABLE `jbj_report` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `source_id` bigint(20) NOT NULL COMMENT '举报源id',
  `source_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '举报源 类别',
  `state` bigint(20) NOT NULL DEFAULT '0' COMMENT '处理状态  0 处理中 1 处理 2 不处理',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否删除，1 删除 2 未删除',
  `create_time` datetime NOT NULL,
  `reason` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `jbj_report` */

insert  into `jbj_report`(`id`,`user_id`,`source_id`,`source_type`,`state`,`is_deleted`,`create_time`,`reason`) values (1,34,58,'SHOP_ITEM',1,0,'2015-10-19 16:14:37',''),(2,34,58,'SHOP_ITEM',1,0,'2015-10-19 16:14:42',''),(3,34,58,'SHOP_ITEM',1,0,'2015-10-19 16:14:43',''),(4,34,58,'SHOP_ITEM',1,0,'2015-10-19 16:14:43',''),(5,34,58,'SHOP_ITEM',1,0,'2015-10-20 11:05:50',''),(6,34,58,'SHOP_ITEM',1,0,'2015-10-20 11:05:52',''),(7,54,221,'TREASURE',2,0,'2015-10-31 17:07:32',''),(8,66,227,'TREASURE',1,0,'2015-10-31 17:08:14',''),(9,66,227,'TREASURE',1,0,'2015-11-01 22:45:56',''),(10,49,60,'SHOP_ITEM',1,0,'2015-11-10 13:12:26',''),(11,49,57,'SHOP_ITEM',2,0,'2015-11-10 16:18:31',''),(12,49,57,'SHOP_ITEM',2,0,'2015-11-10 16:20:07',''),(13,49,57,'SHOP_ITEM',2,0,'2015-11-10 16:20:09',''),(14,49,57,'SHOP_ITEM',2,0,'2015-11-10 16:20:46',''),(15,49,57,'SHOP_ITEM',2,0,'2015-11-10 16:20:48',''),(16,49,49,'SHOP_ITEM_COMMENT',1,0,'2015-11-10 16:31:49',''),(17,49,49,'SHOP_ITEM_COMMENT',1,0,'2015-11-10 16:31:52',''),(18,49,49,'SHOP_ITEM_COMMENT',1,0,'2015-11-10 16:31:58',''),(19,49,49,'SHOP_ITEM_COMMENT',1,0,'2015-11-10 16:33:05',''),(20,49,49,'SHOP_ITEM_COMMENT',1,0,'2015-11-10 16:33:08',''),(21,49,49,'SHOP_ITEM_COMMENT',1,0,'2015-11-10 16:34:33',''),(22,49,49,'SHOP_ITEM_COMMENT',1,0,'2015-11-10 16:34:36',''),(23,31,626,'TREASURE_COMMENT',1,0,'2015-11-10 17:32:47',''),(24,49,229,'TREASURE',1,0,'2015-11-12 11:15:13',''),(25,49,225,'TREASURE',2,0,'2015-11-12 12:54:54',''),(26,49,225,'TREASURE',2,0,'2015-11-12 12:55:52','0'),(27,49,225,'TREASURE',2,0,'2015-11-12 12:56:02','0'),(28,49,225,'TREASURE',2,0,'2015-11-12 13:02:01','0'),(29,49,225,'TREASURE',2,0,'2015-11-12 13:03:10','人身攻击'),(30,31,228,'TREASURE',0,0,'2015-11-12 14:07:39','人身攻击'),(31,31,59,'SHOP_ITEM',0,0,'2015-11-12 14:10:04','疑似欺诈'),(32,49,623,'TREASURE_COMMENT',0,0,'2015-11-12 14:10:47',''),(33,31,48,'SHOP_ITEM_COMMENT',1,0,'2015-11-12 14:11:06','');

/*Table structure for table `jbj_resource` */

DROP TABLE IF EXISTS `jbj_resource`;

CREATE TABLE `jbj_resource` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '资源编码',
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '资源值',
  `remark` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '备注',
  `is_deleted` tinyint(4) NOT NULL,
  `create_time` datetime NOT NULL,
  `edit_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uidx_code` (`code`) USING HASH
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `jbj_resource` */

insert  into `jbj_resource`(`id`,`code`,`value`,`remark`,`is_deleted`,`create_time`,`edit_time`) values (1,'VER_SYSTEM_MESSAGE','11','系统消息版本号',0,'2015-10-23 16:11:19','2015-10-23 16:11:23'),(2,'HOME_REC_WEIGHT_VIEW_COUNT','1','首页推荐，浏览量权值',0,'2015-12-12 11:31:23','2015-12-12 11:31:26'),(3,'HOME_REC_WEIGHT_COMMENT_COUNT','6','首页推荐，评论量权值',0,'2015-12-12 11:32:08','2015-12-12 11:32:10'),(4,'HOME_REC_WEIGHT_LIKED_COUNT','5','首页推荐，关注量权值',0,'2015-12-19 17:27:40','2015-12-19 17:27:43'),(5,'HOME_REC_SECOND_LIST_PERIOD_DAYS','30','首页推荐，第二列表推荐周期',0,'2015-12-19 17:33:44','2015-12-19 17:33:46');

/*Table structure for table `jbj_shop_item` */

DROP TABLE IF EXISTS `jbj_shop_item`;

CREATE TABLE `jbj_shop_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shop_id` bigint(20) DEFAULT NULL COMMENT '店铺id',
  `title` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '标题',
  `content` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '内容',
  `price` double DEFAULT NULL COMMENT '价格',
  `share_time` bigint(20) DEFAULT NULL COMMENT '分享时间',
  `type` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '宝贝类型',
  `pageview` int(11) DEFAULT NULL COMMENT '浏览量',
  `state` int(1) NOT NULL DEFAULT '1' COMMENT '保留字段',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0 未删除 1已删除',
  PRIMARY KEY (`id`),
  KEY `shop_id` (`shop_id`) USING BTREE,
  CONSTRAINT `jbj_shop_item_ibfk_2` FOREIGN KEY (`shop_id`) REFERENCES `jbj_art_street_shop` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `jbj_shop_item` */

/*Table structure for table `jbj_shop_item_comment` */

DROP TABLE IF EXISTS `jbj_shop_item_comment`;

CREATE TABLE `jbj_shop_item_comment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shop_item_id` bigint(20) DEFAULT NULL COMMENT '被评论的宝贝id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '评论者用户id',
  `content` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '内容',
  `create_time` bigint(20) DEFAULT NULL COMMENT '评论时间',
  `state` int(1) NOT NULL DEFAULT '1' COMMENT '保留字段',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '0: 根评论 其他：二级评论',
  `reply_to_user_id` bigint(20) NOT NULL DEFAULT '1' COMMENT '回复id （1:默认不回复任何人）',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0 未删除 1 已删除',
  PRIMARY KEY (`id`),
  KEY `shop_item_id` (`shop_item_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  CONSTRAINT `jbj_shop_item_comment_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `jbj_user` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `jbj_shop_item_comment_ibfk_4` FOREIGN KEY (`shop_item_id`) REFERENCES `jbj_shop_item` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `jbj_shop_item_comment` */

/*Table structure for table `jbj_shop_item_image` */

DROP TABLE IF EXISTS `jbj_shop_item_image`;

CREATE TABLE `jbj_shop_item_image` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shop_item_id` bigint(20) DEFAULT NULL COMMENT '图片所属宝贝id',
  `img_mini` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '图片小尺寸',
  `img_normal` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '图片正常尺寸',
  `img_large` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '图片大尺寸',
  PRIMARY KEY (`id`),
  KEY `shop_item_id` (`shop_item_id`) USING BTREE,
  CONSTRAINT `jbj_shop_item_image_ibfk_1` FOREIGN KEY (`shop_item_id`) REFERENCES `jbj_shop_item` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `jbj_shop_item_image` */

/*Table structure for table `jbj_shop_item_liked` */

DROP TABLE IF EXISTS `jbj_shop_item_liked`;

CREATE TABLE `jbj_shop_item_liked` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shop_item_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '关注宝贝id',
  `user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '关注者id',
  `state` int(11) NOT NULL DEFAULT '1' COMMENT '状态',
  `create_time` bigint(20) DEFAULT NULL COMMENT '关注时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `shop_item_id_user_id` (`shop_item_id`,`user_id`) USING BTREE,
  KEY `shop_item_id` (`shop_item_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  CONSTRAINT `jbj_shop_item_liked_ibfk_2` FOREIGN KEY (`shop_item_id`) REFERENCES `jbj_shop_item` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `jbj_shop_item_liked_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `jbj_user` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `jbj_shop_item_liked` */

/*Table structure for table `jbj_shop_item_loc` */

DROP TABLE IF EXISTS `jbj_shop_item_loc`;

CREATE TABLE `jbj_shop_item_loc` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `item_id` bigint(20) NOT NULL,
  `adcode` int(11) NOT NULL COMMENT '行政区划编码',
  `province` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '省',
  `city` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '市',
  `lat` float NOT NULL COMMENT '纬度',
  `lng` float NOT NULL COMMENT '经度',
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `item_id` (`item_id`) USING BTREE,
  CONSTRAINT `jbj_shop_item_loc_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `jbj_shop_item` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `jbj_shop_item_loc` */

/*Table structure for table `jbj_special` */

DROP TABLE IF EXISTS `jbj_special`;

CREATE TABLE `jbj_special` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `is_deleted` int(4) NOT NULL DEFAULT '0',
  `modify_time` datetime NOT NULL,
  `create_time` datetime NOT NULL,
  `type` tinyint(4) NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `title` varchar(48) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `introduction` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `jbj_special` */

insert  into `jbj_special`(`id`,`is_deleted`,`modify_time`,`create_time`,`type`,`start_time`,`end_time`,`title`,`image_url`,`introduction`,`content`) values (1,0,'2017-03-18 14:49:36','2017-01-09 14:49:42',1,'2017-03-25 14:49:47','2017-01-13 14:49:54','test','http://www.jvbaoji.com:18006/jvbaoji/image/f0255684-9f00-4344-93a2-adf42f9814aa.png','test','test'),(10,0,'2017-01-18 15:52:30','2017-01-18 15:52:30',1,'2017-03-20 12:25:18','2017-03-03 12:26:58','testTitle','http://www.jvbaoji.com:18006/jvbaoji/image/f0255684-9f00-4344-93a2-adf42f9814aa.png','test','test'),(11,0,'2017-01-18 16:12:26','2017-01-18 15:56:06',1,'2017-03-20 12:25:18','2017-03-03 12:26:58','testTitle2','http://www.jvbaoji.com:18006/jvbaoji/image/f0255684-9f00-4344-93a2-adf42f9814aa.png','test','test'),(12,0,'2017-01-18 16:10:57','2017-01-18 16:10:57',1,'1970-01-18 12:25:18','1970-01-18 12:26:58','testTitle','http://www.jvbaoji.com:18006/jvbaoji/image/f0255684-9f00-4344-93a2-adf42f9814aa.png','test','test'),(13,0,'2017-01-20 16:32:10','2017-01-20 16:32:10',1,'1970-01-18 12:25:18','1970-01-18 12:26:58','testTitle','http://www.jvbaoji.com:18006/jvbaoji/image/f0255684-9f00-4344-93a2-adf42f9814aa.png','test','test'),(14,0,'2017-02-06 16:48:45','2017-02-06 16:48:45',1,'1970-01-18 12:25:18','1970-01-18 12:26:58','testTitle','http://www.jvbaoji.com:18006/jvbaoji/image/f0255684-9f00-4344-93a2-adf42f9814aa.png','test','test'),(15,0,'2017-02-06 16:50:01','2017-02-06 16:50:01',1,'1970-01-18 12:25:18','1970-01-18 12:26:58','testTitle','http://www.jvbaoji.com:18006/jvbaoji/image/f0255684-9f00-4344-93a2-adf42f9814aa.png','test','test'),(16,0,'2017-02-06 17:04:20','2017-02-06 17:04:20',1,'1970-01-18 12:25:18','1970-01-18 12:26:58','testTitle','http://www.jvbaoji.com:18006/jvbaoji/image/f0255684-9f00-4344-93a2-adf42f9814aa.png','test','test'),(17,0,'2017-02-06 17:08:29','2017-02-06 17:08:29',1,'1970-01-18 12:25:18','1970-01-18 12:26:58','testTitle','http://www.jvbaoji.com:18006/jvbaoji/image/f0255684-9f00-4344-93a2-adf42f9814aa.png','test','test'),(18,0,'2017-02-06 17:10:11','2017-02-06 17:10:11',1,'1970-01-18 12:25:18','1970-01-18 12:26:58','testTitle','http://www.jvbaoji.com:18006/jvbaoji/image/f0255684-9f00-4344-93a2-adf42f9814aa.png','test','test'),(19,0,'2017-02-06 17:10:28','2017-02-06 17:10:28',1,'1970-01-18 12:25:18','1970-01-18 12:26:58','testTitle','http://www.jvbaoji.com:18006/jvbaoji/image/f0255684-9f00-4344-93a2-adf42f9814aa.png','test','test'),(20,0,'2017-03-01 15:00:49','2017-03-01 15:00:49',1,'1970-01-18 12:25:18','1970-01-18 12:26:58','testTitle','http://www.jvbaoji.com:18006/jvbaoji/image/f0255684-9f00-4344-93a2-adf42f9814aa.png6c9368361c.png','test','test');

/*Table structure for table `jbj_system_message` */

DROP TABLE IF EXISTS `jbj_system_message`;

CREATE TABLE `jbj_system_message` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'TEXT' COMMENT '消息类型: ''TEXT'' 纯文本',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '标题',
  `content` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '内容',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0 未删除 1 删除',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `edit_time` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `jbj_system_message` */

insert  into `jbj_system_message`(`id`,`type`,`title`,`content`,`is_deleted`,`create_time`,`edit_time`) values (1,'TEXT','1.0发布啦','终于发布啦',0,'2015-10-26 10:56:23','2015-10-26 10:56:26'),(2,'TEXT','怪我咯','怪聪',0,'2015-10-26 10:57:29','2015-10-26 10:57:32'),(3,'TEXT','222','3333',1,'2015-11-13 17:11:59','0000-00-00 00:00:00'),(4,'TEXT','ssdfsd','sdsd',1,'2015-11-13 17:14:59','0000-00-00 00:00:00'),(5,'TEXT','222','222',1,'2015-11-13 17:44:13','0000-00-00 00:00:00'),(6,'TEXT','222','222',1,'2015-11-13 17:45:12','0000-00-00 00:00:00'),(7,'TEXT','2222','2222',1,'2015-11-13 17:45:19','0000-00-00 00:00:00'),(8,'TEXT','32323','2323',1,'2015-11-13 17:47:13','0000-00-00 00:00:00'),(9,'TEXT','dsfsdf','dsfsdf',1,'2015-11-13 17:50:15','0000-00-00 00:00:00'),(10,'TEXT','dsfsdf','dsfsdf',1,'2015-11-13 17:50:52','0000-00-00 00:00:00'),(11,'TEXT','踩踩踩踩踩','22222222222222',0,'2015-11-13 18:16:55','0000-00-00 00:00:00');

/*Table structure for table `jbj_test` */

DROP TABLE IF EXISTS `jbj_test`;

CREATE TABLE `jbj_test` (
  `c_id` int(11) NOT NULL AUTO_INCREMENT,
  `c_param1` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `jbj_test` */

/*Table structure for table `jbj_trade_generation` */

DROP TABLE IF EXISTS `jbj_trade_generation`;

CREATE TABLE `jbj_trade_generation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  `create_time` datetime NOT NULL,
  `modify_time` datetime NOT NULL,
  `user_id` bigint(20) NOT NULL COMMENT '手机号码',
  `out_trade_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `module` int(11) NOT NULL DEFAULT '1' COMMENT '所属的功能模块（1.保证金，2.尾款支付，3.余额充值->待定）',
  `pay_platform` int(11) NOT NULL DEFAULT '1' COMMENT '支付平台（1.支付宝，2.微信支付，3.银行卡支付）',
  `auction_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `jbj_trade_generation` */

insert  into `jbj_trade_generation`(`id`,`is_deleted`,`create_time`,`modify_time`,`user_id`,`out_trade_no`,`module`,`pay_platform`,`auction_id`) values (1,0,'2017-02-17 12:54:05','2017-02-17 12:54:05',1,'148730724496953894',1,1,1),(2,0,'2017-02-17 15:08:51','2017-02-17 15:08:51',0,'148731473411543208',1,1,1),(3,0,'2017-02-17 15:15:44','2017-02-17 15:15:44',0,'148731574385883814',1,1,3),(4,0,'2017-02-22 21:12:35','2017-02-22 21:12:32',0,'148731584385883845',1,1,2),(5,0,'2017-02-24 16:39:59','2017-02-24 16:39:59',220,'148792559892476159',1,1,1);

/*Table structure for table `jbj_treasure_item` */

DROP TABLE IF EXISTS `jbj_treasure_item`;

CREATE TABLE `jbj_treasure_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '宝贝拥有者用户id',
  `content` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '内容',
  `price` double DEFAULT NULL COMMENT '价格',
  `share_time` bigint(20) DEFAULT NULL COMMENT '分享时间',
  `type` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '宝贝类型',
  `pageview` int(11) DEFAULT NULL COMMENT '浏览量',
  `state` int(1) NOT NULL DEFAULT '1' COMMENT '保留字段',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0 未删除 1已删除',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`) USING BTREE,
  CONSTRAINT `jbj_treasure_item_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `jbj_user` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `jbj_treasure_item` */

/*Table structure for table `jbj_treasure_item_comment` */

DROP TABLE IF EXISTS `jbj_treasure_item_comment`;

CREATE TABLE `jbj_treasure_item_comment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `treasure_item_id` bigint(20) DEFAULT NULL COMMENT '被评论的宝贝id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '评论者用户id',
  `content` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '内容',
  `create_time` bigint(20) DEFAULT NULL COMMENT '评论时间',
  `state` int(1) NOT NULL DEFAULT '1' COMMENT '保留字段',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '0: 根评论 其他：二级评论',
  `reply_to_user_id` bigint(20) NOT NULL DEFAULT '1' COMMENT '回复id （1:默认不回复任何人）',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0 未删除 1 已删除',
  PRIMARY KEY (`id`),
  KEY `treasure_item_id` (`treasure_item_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  CONSTRAINT `jbj_treasure_item_comment_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `jbj_user` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `jbj_treasure_item_comment_ibfk_4` FOREIGN KEY (`treasure_item_id`) REFERENCES `jbj_treasure_item` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `jbj_treasure_item_comment` */

/*Table structure for table `jbj_treasure_item_image` */

DROP TABLE IF EXISTS `jbj_treasure_item_image`;

CREATE TABLE `jbj_treasure_item_image` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `treasure_item_id` bigint(20) DEFAULT NULL COMMENT '图片所属宝贝id',
  `img_mini` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '图片小尺寸',
  `img_normal` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '图片正常尺寸',
  `img_large` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '图片大尺寸',
  PRIMARY KEY (`id`),
  KEY `treasure_item_id` (`treasure_item_id`) USING BTREE,
  CONSTRAINT `jbj_treasure_item_image_ibfk_1` FOREIGN KEY (`treasure_item_id`) REFERENCES `jbj_treasure_item` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `jbj_treasure_item_image` */

/*Table structure for table `jbj_treasure_item_liked` */

DROP TABLE IF EXISTS `jbj_treasure_item_liked`;

CREATE TABLE `jbj_treasure_item_liked` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `treasure_item_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '关注宝贝id',
  `user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '关注者id',
  `state` int(11) NOT NULL DEFAULT '1' COMMENT '状态',
  `create_time` bigint(20) DEFAULT NULL COMMENT '关注时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `treasure_item_id_user_id` (`treasure_item_id`,`user_id`) USING BTREE,
  KEY `treasure_item_id` (`treasure_item_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  CONSTRAINT `jbj_treasure_item_liked_ibfk_2` FOREIGN KEY (`treasure_item_id`) REFERENCES `jbj_treasure_item` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `jbj_treasure_item_liked_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `jbj_user` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `jbj_treasure_item_liked` */

/*Table structure for table `jbj_treasure_item_loc` */

DROP TABLE IF EXISTS `jbj_treasure_item_loc`;

CREATE TABLE `jbj_treasure_item_loc` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `item_id` bigint(20) NOT NULL,
  `adcode` int(11) NOT NULL COMMENT '行政区划编码',
  `province` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '省',
  `city` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '市',
  `lat` float NOT NULL COMMENT '纬度',
  `lng` float NOT NULL COMMENT '经度',
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `item_id_unique` (`item_id`) USING BTREE,
  KEY `item_id` (`item_id`) USING BTREE,
  CONSTRAINT `jbj_treasure_item_loc_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `jbj_treasure_item` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `jbj_treasure_item_loc` */

/*Table structure for table `jbj_user` */

DROP TABLE IF EXISTS `jbj_user`;

CREATE TABLE `jbj_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `account` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '账号（唯一）',
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密码',
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '邮箱（唯一）',
  `nickname` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '昵称',
  `mobile` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
  `created_date` bigint(20) DEFAULT NULL,
  `last_modified_date` bigint(20) DEFAULT NULL COMMENT '最近修改时间',
  `authed` int(11) NOT NULL DEFAULT '0' COMMENT '是否通过实名验证 0,未实名认证；1,认证中；2，认证通过',
  `avatar_mini` longtext COLLATE utf8mb4_unicode_ci COMMENT '用户头像小尺寸',
  `avatar_normal` longtext COLLATE utf8mb4_unicode_ci COMMENT '用户头像正常尺寸',
  `avatar_large` longtext COLLATE utf8mb4_unicode_ci COMMENT '用户头像大尺寸',
  `sex` bit(1) NOT NULL DEFAULT b'0' COMMENT '性别（bool）0:male,1:female',
  `bio` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '个性签名',
  `banner` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '个人主页banner_img',
  `account_state` int(11) NOT NULL DEFAULT '1' COMMENT '账号状态 1:normal,-1:abnormal,0:deleted',
  `shop_id` bigint(20) DEFAULT NULL COMMENT '藏馆',
  `pay_pwd` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar_image_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `USER_ACCOUNT_COL` (`account`) USING BTREE,
  UNIQUE KEY `USER_EMAIL_COL` (`email`) USING BTREE,
  UNIQUE KEY `USER_MOBILE_COL` (`mobile`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=236 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `jbj_user` */

insert  into `jbj_user`(`id`,`account`,`password`,`email`,`nickname`,`mobile`,`created_date`,`last_modified_date`,`authed`,`avatar_mini`,`avatar_normal`,`avatar_large`,`sex`,`bio`,`banner`,`account_state`,`shop_id`,`pay_pwd`,`avatar_image_url`) values (1,'test','123',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'\0','test','test',1,NULL,NULL,NULL),(2,'test1','123',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'\0','test','test',1,NULL,NULL,NULL),(4,'test2','123',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'\0','test','test',1,NULL,NULL,NULL),(220,'青峰','$2y$10$8aCEozbFCqXlR11/isAi/e5t95Cy7rY19Af4X8FN3m8T4CCzZfl0i',NULL,'青峰1','18758257905',1447899783,1451891314,0,'avatar/cda4c91219c963c835136523a1624bdc_100.jpg','avatar/cda4c91219c963c835136523a1624bdc_200.jpg','avatar/cda4c91219c963c835136523a1624bdc_300.jpg','','测','userBanner/bb5a96709daef9f6ac7a7715a90a49fd.jpg',1,NULL,NULL,NULL),(235,'齐神','$2y$10$nhlj7aPwiZ1HoAOoc7Drf.aBbYEivoys/Ty28YKuadQZN0mNvjgVe','','齐神','17764576223',1487854672,NULL,0,'','','','\0','','',1,NULL,'$2a$10$JBt93Ej3s05EiMBQ5y6Tium4bAZmVGuJSm3WBahytDlwtr6nA2Wg.',NULL);

/*Table structure for table `jbj_user_account` */

DROP TABLE IF EXISTS `jbj_user_account`;

CREATE TABLE `jbj_user_account` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  `create_time` datetime NOT NULL,
  `modify_time` datetime NOT NULL,
  `pay_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `card_type` tinyint(4) NOT NULL COMMENT '卡类别（1.身份证）',
  `card_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `type` tinyint(4) DEFAULT NULL COMMENT '账户类型（1.支付宝2.微信3.Apple支付4.银行卡）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `jbj_user_account` */

insert  into `jbj_user_account`(`id`,`is_deleted`,`create_time`,`modify_time`,`pay_id`,`name`,`card_type`,`card_id`,`phone`,`user_id`,`type`) values (1,0,'2017-02-23 20:14:27','2017-02-23 20:14:27','17764576223','hanawa',1,'12312312312312312312','17764576223',0,1),(2,0,'2017-03-01 12:35:11','2017-03-01 12:35:11','17764576223','hanawa',1,'12312312312312312312','17764576223',0,1),(3,0,'2017-03-01 12:35:47','2017-03-01 12:35:47','17764576223','hanawa',1,'12312312312312312312','17764576223',0,1),(4,0,'2017-03-01 12:36:50','2017-03-01 12:36:50','17764576223','hanawa',1,'12312312312312312312','17764576223',0,1),(5,0,'2017-03-01 12:40:01','2017-03-01 12:40:01','17764576223','hanawa',1,'12312312312312312312','17764576223',0,1),(6,0,'2017-03-01 13:43:49','2017-03-01 13:43:49','17764576223','hanawa',1,'12312312312312312312','17764576223',0,1),(7,0,'2017-03-01 14:11:50','2017-03-01 14:11:50','17764576223','hanawa',1,'12312312312312312312','17764576223',0,1);

/*Table structure for table `jbj_user_address` */

DROP TABLE IF EXISTS `jbj_user_address`;

CREATE TABLE `jbj_user_address` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  `create_time` datetime NOT NULL,
  `modify_time` datetime NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '2' COMMENT '(1.默认 2.其他）',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `jbj_user_address` */

insert  into `jbj_user_address`(`id`,`is_deleted`,`create_time`,`modify_time`,`address`,`user_id`,`status`,`name`,`phone`) values (1,0,'2017-03-02 13:53:30','2017-03-02 13:53:32','test1',0,2,'',''),(2,0,'2017-03-02 13:54:14','2017-03-02 13:54:17','test2',0,2,'',''),(3,0,'2017-03-02 15:19:01','2017-03-02 15:49:27','浙江省杭州市 江晖路487号 兴耀科技园3-403',0,2,'',''),(4,0,'2017-03-02 15:37:43','2017-03-02 15:37:43','浙江省杭州市 江晖路487号 兴耀科技园3-403',0,2,'',''),(5,0,'2017-03-02 15:49:27','2017-03-07 13:56:43','浙江省杭州市 江晖路487号 兴耀科技园3-40',0,2,'Hanawa','98765432101'),(6,0,'2017-03-07 13:56:00','2017-03-07 13:56:00','浙江省杭州市 江晖路487号 兴耀科技园3-403',0,1,'Hanawa','12345678901');

/*Table structure for table `jbj_user_auth` */

DROP TABLE IF EXISTS `jbj_user_auth`;

CREATE TABLE `jbj_user_auth` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `real_name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '真实姓名',
  `idcard_front_img` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '身份证正面',
  `idcard_back_img` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '身份证背面',
  `address` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '地址',
  `auth_time` datetime NOT NULL COMMENT '实名认证申请时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `USER_AUTH_USERID` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `jbj_user_auth` */

insert  into `jbj_user_auth`(`id`,`user_id`,`real_name`,`idcard_front_img`,`idcard_back_img`,`address`,`auth_time`) values (1,4,'周博','http://120.26.113.111:8080/uploads/auth/702f2d472f4e8b90cfd75409deeb57ea.jpg','http://120.26.113.111:8080/uploads/auth/1cfbcd82d693f6b1548d8343f74145eb.jpg','玉泉','2015-05-24 17:02:04');

/*Table structure for table `jbj_user_follow` */

DROP TABLE IF EXISTS `jbj_user_follow`;

CREATE TABLE `jbj_user_follow` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '粉丝',
  `followed_user_id` bigint(20) DEFAULT NULL COMMENT '被关注者',
  `create_time` bigint(20) DEFAULT NULL COMMENT '关注时时间',
  `state` int(11) NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id_followed_user_id` (`user_id`,`followed_user_id`) USING BTREE,
  KEY `followed_user_id` (`followed_user_id`) USING BTREE,
  CONSTRAINT `jbj_user_follow_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `jbj_user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `jbj_user_follow_ibfk_2` FOREIGN KEY (`followed_user_id`) REFERENCES `jbj_user` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `jbj_user_follow` */

/*Table structure for table `jbj_user_location` */

DROP TABLE IF EXISTS `jbj_user_location`;

CREATE TABLE `jbj_user_location` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `adcode` int(11) NOT NULL COMMENT '行政区划代码',
  `province` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '省 / 直辖市',
  `city` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '市 / 地级区',
  `lat` float NOT NULL COMMENT '纬度',
  `lng` float NOT NULL COMMENT '经度',
  `update_time` int(11) NOT NULL COMMENT '更新时间',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id_unique` (`user_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  CONSTRAINT `jbj_user_location_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `jbj_user` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `jbj_user_location` */

/*Table structure for table `jbj_user_wallet` */

DROP TABLE IF EXISTS `jbj_user_wallet`;

CREATE TABLE `jbj_user_wallet` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  `create_time` datetime NOT NULL,
  `modify_time` datetime NOT NULL,
  `balance` double(20,0) NOT NULL DEFAULT '0',
  `insurance_cold` double(20,0) NOT NULL DEFAULT '0',
  `commission_cold` double(20,0) NOT NULL DEFAULT '0',
  `pay_pwd` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `jbj_user_wallet` */

insert  into `jbj_user_wallet`(`id`,`is_deleted`,`create_time`,`modify_time`,`balance`,`insurance_cold`,`commission_cold`,`pay_pwd`,`user_id`) values (1,0,'2017-02-23 18:43:11','2017-02-23 18:43:13',0,0,4,'',0),(4,0,'2017-02-25 20:24:45','2017-02-25 20:24:45',0,0,0,'',4),(5,0,'2017-03-01 11:27:50','2017-03-01 11:27:50',0,0,0,'',234),(45,0,'2017-03-01 19:38:38','2017-03-01 19:38:38',0,0,0,'',220);

/*Table structure for table `jbj_user_wallet_record` */

DROP TABLE IF EXISTS `jbj_user_wallet_record`;

CREATE TABLE `jbj_user_wallet_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  `create_time` datetime NOT NULL,
  `modify_time` datetime NOT NULL,
  `operation` int(4) NOT NULL COMMENT '金额操作（1.保证金转入2.佣金转入3.提现等待4.提现成功5.提现失败）',
  `money` double NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `account_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `jbj_user_wallet_record` */

insert  into `jbj_user_wallet_record`(`id`,`is_deleted`,`create_time`,`modify_time`,`operation`,`money`,`user_id`,`account_id`) values (2,0,'2017-02-23 20:04:25','2017-02-23 20:04:25',3,1,0,1);

/*Table structure for table `test` */

DROP TABLE IF EXISTS `test`;

CREATE TABLE `test` (
  `user_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id` bigint(20) NOT NULL,
  `create_time` datetime NOT NULL,
  `edit_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `test` */

/* Trigger structure for table `jbj_user` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `addUserWallet` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `addUserWallet` AFTER INSERT ON `jbj_user` FOR EACH ROW begin
insert into jbj_user_wallet (balance,create_time,modify_time,insurance_cold,commission_cold,user_id) values (0,now(),now(),0,0,new.id);
end */$$


DELIMITER ;

/*Table structure for table `jbj_collection_item` */

DROP TABLE IF EXISTS `jbj_collection_item`;

/*!50001 DROP VIEW IF EXISTS `jbj_collection_item` */;
/*!50001 DROP TABLE IF EXISTS `jbj_collection_item` */;

/*!50001 CREATE TABLE  `jbj_collection_item`(
 `item_id` bigint(20) ,
 `content` text ,
 `share_time` bigint(20) ,
 `item_type` varchar(13) ,
 `shop_id` bigint(20) ,
 `user_id` bigint(20) ,
 `is_deleted` tinyint(4) 
)*/;

/*Table structure for table `jbj_collection_item_image` */

DROP TABLE IF EXISTS `jbj_collection_item_image`;

/*!50001 DROP VIEW IF EXISTS `jbj_collection_item_image` */;
/*!50001 DROP TABLE IF EXISTS `jbj_collection_item_image` */;

/*!50001 CREATE TABLE  `jbj_collection_item_image`(
 `id` bigint(20) ,
 `item_id` bigint(20) ,
 `item_type` varchar(13) ,
 `img_mini` varchar(256) ,
 `img_normal` varchar(256) ,
 `img_large` varchar(256) 
)*/;

/*Table structure for table `jbj_collection_item_liked` */

DROP TABLE IF EXISTS `jbj_collection_item_liked`;

/*!50001 DROP VIEW IF EXISTS `jbj_collection_item_liked` */;
/*!50001 DROP TABLE IF EXISTS `jbj_collection_item_liked` */;

/*!50001 CREATE TABLE  `jbj_collection_item_liked`(
 `id` bigint(20) ,
 `item_id` bigint(20) ,
 `user_id` bigint(20) ,
 `state` int(11) ,
 `create_time` bigint(20) ,
 `item_type` varchar(13) 
)*/;

/*Table structure for table `jbj_collection_item_loc` */

DROP TABLE IF EXISTS `jbj_collection_item_loc`;

/*!50001 DROP VIEW IF EXISTS `jbj_collection_item_loc` */;
/*!50001 DROP TABLE IF EXISTS `jbj_collection_item_loc` */;

/*!50001 CREATE TABLE  `jbj_collection_item_loc`(
 `item_id` bigint(20) ,
 `adcode` int(11) ,
 `province` varchar(64) ,
 `city` char(20) ,
 `lat` float ,
 `lng` float ,
 `create_time` int(11) ,
 `update_time` int(11) ,
 `item_type` varchar(13) 
)*/;

/*View structure for view jbj_collection_item */

/*!50001 DROP TABLE IF EXISTS `jbj_collection_item` */;
/*!50001 DROP VIEW IF EXISTS `jbj_collection_item` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `jbj_collection_item` AS (select `jbj_treasure_item`.`id` AS `item_id`,`jbj_treasure_item`.`content` AS `content`,`jbj_treasure_item`.`share_time` AS `share_time`,'TREASURE_ITEM' AS `item_type`,NULL AS `shop_id`,`jbj_treasure_item`.`user_id` AS `user_id`,`jbj_treasure_item`.`is_deleted` AS `is_deleted` from `jbj_treasure_item`) union (select `si`.`id` AS `item_id`,`si`.`content` AS `content`,`si`.`share_time` AS `share_time`,'SHOP_ITEM' AS `type`,`si`.`shop_id` AS `shop_id`,`ass`.`user_id` AS `user_id`,`si`.`is_deleted` AS `is_deleted` from (`jbj_shop_item` `si` join `jbj_art_street_shop` `ass` on((`si`.`shop_id` = `ass`.`id`)))) */;

/*View structure for view jbj_collection_item_image */

/*!50001 DROP TABLE IF EXISTS `jbj_collection_item_image` */;
/*!50001 DROP VIEW IF EXISTS `jbj_collection_item_image` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `jbj_collection_item_image` AS (select `jbj_shop_item_image`.`id` AS `id`,`jbj_shop_item_image`.`shop_item_id` AS `item_id`,'SHOP_ITEM' AS `item_type`,`jbj_shop_item_image`.`img_mini` AS `img_mini`,`jbj_shop_item_image`.`img_normal` AS `img_normal`,`jbj_shop_item_image`.`img_large` AS `img_large` from `jbj_shop_item_image`) union (select `jbj_treasure_item_image`.`id` AS `id`,`jbj_treasure_item_image`.`treasure_item_id` AS `item_id`,'TREASURE_ITEM' AS `item_type`,`jbj_treasure_item_image`.`img_mini` AS `img_mini`,`jbj_treasure_item_image`.`img_normal` AS `img_normal`,`jbj_treasure_item_image`.`img_large` AS `img_large` from `jbj_treasure_item_image`) */;

/*View structure for view jbj_collection_item_liked */

/*!50001 DROP TABLE IF EXISTS `jbj_collection_item_liked` */;
/*!50001 DROP VIEW IF EXISTS `jbj_collection_item_liked` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `jbj_collection_item_liked` AS (select `jbj_shop_item_liked`.`id` AS `id`,`jbj_shop_item_liked`.`shop_item_id` AS `item_id`,`jbj_shop_item_liked`.`user_id` AS `user_id`,`jbj_shop_item_liked`.`state` AS `state`,`jbj_shop_item_liked`.`create_time` AS `create_time`,'SHOP_ITEM' AS `item_type` from `jbj_shop_item_liked`) union (select `jbj_treasure_item_liked`.`id` AS `id`,`jbj_treasure_item_liked`.`treasure_item_id` AS `item_id`,`jbj_treasure_item_liked`.`user_id` AS `user_id`,`jbj_treasure_item_liked`.`state` AS `state`,`jbj_treasure_item_liked`.`create_time` AS `create_time`,'TREASURE_ITEM' AS `item_type` from `jbj_treasure_item_liked`) */;

/*View structure for view jbj_collection_item_loc */

/*!50001 DROP TABLE IF EXISTS `jbj_collection_item_loc` */;
/*!50001 DROP VIEW IF EXISTS `jbj_collection_item_loc` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `jbj_collection_item_loc` AS (select `l`.`item_id` AS `item_id`,`l`.`adcode` AS `adcode`,`l`.`province` AS `province`,`d`.`name` AS `city`,`l`.`lat` AS `lat`,`l`.`lng` AS `lng`,`l`.`create_time` AS `create_time`,`l`.`update_time` AS `update_time`,'SHOP_ITEM' AS `item_type` from (`jbj_shop_item_loc` `l` left join `jbj_district_data` `d` on((`l`.`adcode` = `d`.`id`)))) union (select `l`.`item_id` AS `item_id`,`l`.`adcode` AS `adcode`,`l`.`province` AS `province`,`d`.`name` AS `city`,`l`.`lat` AS `lat`,`l`.`lng` AS `lng`,`l`.`create_time` AS `create_time`,`l`.`update_time` AS `update_time`,'TREASURE_ITEM' AS `item_type` from (`jbj_treasure_item_loc` `l` left join `jbj_district_data` `d` on((`l`.`adcode` = `d`.`id`)))) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
