/*
SQLyog v10.2 
MySQL - 5.6.21-log : Database - shop
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`shop` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `shop`;

/*Table structure for table `auth_group` */

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `auth_group` */

/*Table structure for table `auth_group_permissions` */

DROP TABLE IF EXISTS `auth_group_permissions`;

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `auth_group_permissions` */

/*Table structure for table `auth_permission` */

DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

/*Data for the table `auth_permission` */

insert  into `auth_permission`(`id`,`name`,`content_type_id`,`codename`) values (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add permission',3,'add_permission'),(8,'Can change permission',3,'change_permission'),(9,'Can delete permission',3,'delete_permission'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add django migrations',7,'add_djangomigrations'),(20,'Can change django migrations',7,'change_djangomigrations'),(21,'Can delete django migrations',7,'delete_djangomigrations'),(22,'Can add info admin',8,'add_infoadmin'),(23,'Can change info admin',8,'change_infoadmin'),(24,'Can delete info admin',8,'delete_infoadmin'),(25,'Can add info comm',9,'add_infocomm'),(26,'Can change info comm',9,'change_infocomm'),(27,'Can delete info comm',9,'delete_infocomm'),(28,'Can add info comm type',10,'add_infocommtype'),(29,'Can change info comm type',10,'change_infocommtype'),(30,'Can delete info comm type',10,'delete_infocommtype'),(31,'Can add info supp',11,'add_infosupp'),(32,'Can change info supp',11,'change_infosupp'),(33,'Can delete info supp',11,'delete_infosupp');

/*Table structure for table `auth_user` */

DROP TABLE IF EXISTS `auth_user`;

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `auth_user` */

/*Table structure for table `auth_user_groups` */

DROP TABLE IF EXISTS `auth_user_groups`;

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `auth_user_groups` */

/*Table structure for table `auth_user_user_permissions` */

DROP TABLE IF EXISTS `auth_user_user_permissions`;

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `auth_user_user_permissions` */

/*Table structure for table `django_admin_log` */

DROP TABLE IF EXISTS `django_admin_log`;

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `django_admin_log` */

/*Table structure for table `django_content_type` */

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Data for the table `django_content_type` */

insert  into `django_content_type`(`id`,`app_label`,`model`) values (1,'admin','logentry'),(2,'auth','group'),(3,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(7,'formDemo','djangomigrations'),(8,'formDemo','infoadmin'),(9,'formDemo','infocomm'),(10,'formDemo','infocommtype'),(11,'formDemo','infosupp'),(6,'sessions','session');

/*Table structure for table `django_migrations` */

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

/*Data for the table `django_migrations` */

insert  into `django_migrations`(`id`,`app`,`name`,`applied`) values (1,'contenttypes','0001_initial','2017-04-22 08:15:25.795917'),(2,'auth','0001_initial','2017-04-22 08:15:38.561630'),(3,'admin','0001_initial','2017-04-22 08:15:41.795995'),(4,'admin','0002_logentry_remove_auto_add','2017-04-22 08:15:41.858501'),(5,'contenttypes','0002_remove_content_type_name','2017-04-22 08:15:43.405382'),(6,'auth','0002_alter_permission_name_max_length','2017-04-22 08:15:44.530463'),(7,'auth','0003_alter_user_email_max_length','2017-04-22 08:15:45.401705'),(8,'auth','0004_alter_user_username_opts','2017-04-22 08:15:45.448583'),(9,'auth','0005_alter_user_last_login_null','2017-04-22 08:15:46.370462'),(10,'auth','0006_require_contenttypes_0002','2017-04-22 08:15:46.417338'),(11,'auth','0007_alter_validators_add_error_messages','2017-04-22 08:15:46.464213'),(12,'auth','0008_alter_user_username_max_length','2017-04-22 08:15:47.120576'),(13,'sessions','0001_initial','2017-04-22 08:15:48.323600');

/*Table structure for table `django_session` */

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `django_session` */

insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values ('6mlbzqy6ojvlxe44tgitg5lvuuwo0ii9','MWY3NzhiZmE3MTVkNmI5ZjNhZjBmYzMyYWJlOTZkYmE0MDNiMjc2YTp7InVzZXJfYWNjb3VudCI6ImN3aiIsInVzZXJfaWQiOjIyfQ==','2017-05-06 13:12:59.162573'),('7m5dpt80piyp6mehzlimc2mtlm5flp0q','NzhlYmVhYjVlNTI5Zjk4MzVlYWIyMzVkOWJlZTY5OGJiNDc0NjNlODp7InVzZXJfaWQiOjIyLCJ1c2VyX2FjY291bnQiOiJjd2oifQ==','2017-05-06 13:20:01.068666'),('8ypmzo0b8ykf5owq1yt2e6n8km0m51lh','NzhlYmVhYjVlNTI5Zjk4MzVlYWIyMzVkOWJlZTY5OGJiNDc0NjNlODp7InVzZXJfaWQiOjIyLCJ1c2VyX2FjY291bnQiOiJjd2oifQ==','2017-05-08 04:22:40.810443'),('ad2lhugp6vqh1rrevihx1c3eg69hytp8','NzhlYmVhYjVlNTI5Zjk4MzVlYWIyMzVkOWJlZTY5OGJiNDc0NjNlODp7InVzZXJfaWQiOjIyLCJ1c2VyX2FjY291bnQiOiJjd2oifQ==','2017-05-09 02:04:07.999670'),('awhzbh0x35xpnvmxiji5mzd7r5snk4or','MWY3NzhiZmE3MTVkNmI5ZjNhZjBmYzMyYWJlOTZkYmE0MDNiMjc2YTp7InVzZXJfYWNjb3VudCI6ImN3aiIsInVzZXJfaWQiOjIyfQ==','2017-05-09 02:06:45.440533'),('dztb3ltfnjfslm9ri6hfec3ninc8ve37','NzhlYmVhYjVlNTI5Zjk4MzVlYWIyMzVkOWJlZTY5OGJiNDc0NjNlODp7InVzZXJfaWQiOjIyLCJ1c2VyX2FjY291bnQiOiJjd2oifQ==','2017-05-06 13:21:42.382627'),('ekzqq6f7pzgbzpf2aiwrzjsa4gpw13cy','MWY3NzhiZmE3MTVkNmI5ZjNhZjBmYzMyYWJlOTZkYmE0MDNiMjc2YTp7InVzZXJfYWNjb3VudCI6ImN3aiIsInVzZXJfaWQiOjIyfQ==','2017-05-08 03:53:42.125073'),('hnz45jsb8ymf50gziz0gld3qxbgvjcxw','MWY3NzhiZmE3MTVkNmI5ZjNhZjBmYzMyYWJlOTZkYmE0MDNiMjc2YTp7InVzZXJfYWNjb3VudCI6ImN3aiIsInVzZXJfaWQiOjIyfQ==','2017-05-06 08:16:12.482223'),('i447t5ydgdp5f82nhuejvox8qllphu0o','NzhlYmVhYjVlNTI5Zjk4MzVlYWIyMzVkOWJlZTY5OGJiNDc0NjNlODp7InVzZXJfaWQiOjIyLCJ1c2VyX2FjY291bnQiOiJjd2oifQ==','2017-05-08 12:35:09.679219'),('jxu2fmvuhvpdb0w6cg2rewwv2q7rjt11','NjViZDcxZTNiYjFhNjYyZmQ4MjEwODQxNDBmNzY4YjY1NmE1MzNlNjp7InVzZXJfYWNjb3VudCI6InlxcyIsInVzZXJfaWQiOjI3fQ==','2017-05-08 12:51:22.206076'),('pofpmck6a1muwygtcpssqq5ltndfno1r','MzMwMDhmYjE3YWM0MDlkZWFlYWNiNTljNGE3MDk1ZTVlZGM3NDQ2ODp7InVzZXJfaWQiOjIzLCJ1c2VyX2FjY291bnQiOiJkYWdlIn0=','2017-05-11 08:01:12.105666'),('qoqbikkstufejatydrwqqcj69rql0s5a','MWY3NzhiZmE3MTVkNmI5ZjNhZjBmYzMyYWJlOTZkYmE0MDNiMjc2YTp7InVzZXJfYWNjb3VudCI6ImN3aiIsInVzZXJfaWQiOjIyfQ==','2017-05-08 10:44:56.526514'),('rmxm1tj7gqu7pk7efd7omritkk9ghvsf','NzhlYmVhYjVlNTI5Zjk4MzVlYWIyMzVkOWJlZTY5OGJiNDc0NjNlODp7InVzZXJfaWQiOjIyLCJ1c2VyX2FjY291bnQiOiJjd2oifQ==','2017-05-06 13:27:00.468756'),('rtl93gnbbjxzuf866unxs937rwukuyoa','NzhlYmVhYjVlNTI5Zjk4MzVlYWIyMzVkOWJlZTY5OGJiNDc0NjNlODp7InVzZXJfaWQiOjIyLCJ1c2VyX2FjY291bnQiOiJjd2oifQ==','2017-05-09 02:35:39.989064'),('tbmxdtn52kivej8ge5xk8fjiizafv57e','MWMyNzU0MDMxY2M3NDNkNTcyMTE5NzVmZTMzMzFkNzAzZTVhNDgwYzp7InVzZXJfYWNjb3VudCI6ImRhZ2UiLCJ1c2VyX2lkIjoyM30=','2017-05-08 13:15:10.364969'),('umzauy0muo041vpxolbebjh0k7c56ybc','NzhlYmVhYjVlNTI5Zjk4MzVlYWIyMzVkOWJlZTY5OGJiNDc0NjNlODp7InVzZXJfaWQiOjIyLCJ1c2VyX2FjY291bnQiOiJjd2oifQ==','2017-05-08 04:09:35.641062'),('xlbgbyiptqa9wq32jjn15hw4vpadvv7o','NzhlYmVhYjVlNTI5Zjk4MzVlYWIyMzVkOWJlZTY5OGJiNDc0NjNlODp7InVzZXJfaWQiOjIyLCJ1c2VyX2FjY291bnQiOiJjd2oifQ==','2017-05-06 08:45:38.013019');

/*Table structure for table `info_admin` */

DROP TABLE IF EXISTS `info_admin`;

CREATE TABLE `info_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(11) NOT NULL,
  `password` varchar(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

/*Data for the table `info_admin` */

insert  into `info_admin`(`id`,`account`,`password`) values (1,'mmm','yyyy'),(3,'xxx','sss'),(4,'xxx','sss'),(5,'haojian','shabi'),(6,'qisheng','shabi'),(7,'jintao','shabi'),(8,'xxxxxxx','sssss'),(9,'oooo','ppppp'),(14,'woteme','tebieshuai'),(15,'xxxxxxx','sssss');

/*Table structure for table `info_comm` */

DROP TABLE IF EXISTS `info_comm`;

CREATE TABLE `info_comm` (
  `commId` int(11) NOT NULL AUTO_INCREMENT,
  `commName` char(5) DEFAULT NULL,
  `commPurprice` int(11) DEFAULT NULL,
  `commPrice` int(11) DEFAULT NULL,
  `commStock` int(11) DEFAULT NULL,
  `commTypeId` int(11) DEFAULT NULL,
  `commsuppId` int(11) DEFAULT NULL,
  PRIMARY KEY (`commId`),
  KEY `commTypeId` (`commTypeId`),
  KEY `commsuppId` (`commsuppId`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

/*Data for the table `info_comm` */

insert  into `info_comm`(`commId`,`commName`,`commPurprice`,`commPrice`,`commStock`,`commTypeId`,`commsuppId`) values (1,'毛巾',25,30,1000,1,3),(2,'牙刷',16,20,10000,1,2),(3,'脸盆',30,35,6666,1,5),(4,'洗衣液',60,80,88,1,2),(5,'饼干',10,13,545643,2,5),(6,'溜溜梅',13,20,1000,2,4),(7,'薯条',9,11,15,2,3),(8,'面包',8,10,100,2,1),(9,'空调',1000,1500,600,3,1),(10,'风扇',90,120,1000,3,3),(11,'电磁炉',200,300,900,3,4),(12,'冰箱',1500,2500,100,3,5),(13,'洗衣机',2000,2800,60,3,2),(14,'女鞋',80,150,600,4,4),(15,'女士连衣裙',100,199,300,4,3),(16,'男士衬衫',100,199,400,4,1),(17,'鸭舌帽',30,60,500,4,1);

/*Table structure for table `info_comm_type` */

DROP TABLE IF EXISTS `info_comm_type`;

CREATE TABLE `info_comm_type` (
  `commtypeId` int(11) NOT NULL AUTO_INCREMENT,
  `commtyptName` char(11) DEFAULT NULL,
  PRIMARY KEY (`commtypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `info_comm_type` */

insert  into `info_comm_type`(`commtypeId`,`commtyptName`) values (1,'学习用品'),(2,'傻逼2'),(3,'日用品');

/*Table structure for table `info_supp` */

DROP TABLE IF EXISTS `info_supp`;

CREATE TABLE `info_supp` (
  `suppId` int(11) NOT NULL AUTO_INCREMENT,
  `suppName` char(5) DEFAULT NULL,
  `suppTel` int(11) DEFAULT NULL,
  `suppAddr` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`suppId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `info_supp` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
