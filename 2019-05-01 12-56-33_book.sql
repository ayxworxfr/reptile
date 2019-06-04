/*
SQLyog Ultimate v12.5.0 (64 bit)
MySQL - 5.7.25 : Database - book
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`book` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `book`;

/*Table structure for table `author_detail` */

DROP TABLE IF EXISTS `author_detail`;

CREATE TABLE `author_detail` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `level_id` int(11) DEFAULT NULL COMMENT '作家等级id',
  `hot` bigint(20) DEFAULT NULL COMMENT '作家热度',
  `info` varchar(255) DEFAULT NULL COMMENT '作家描述',
  `achievement` varchar(255) DEFAULT NULL COMMENT '作家成就',
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `author_detail` */

/*Table structure for table `author_level` */

DROP TABLE IF EXISTS `author_level`;

CREATE TABLE `author_level` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `level` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `author_level` */

/*Table structure for table `book_chapter` */

DROP TABLE IF EXISTS `book_chapter`;

CREATE TABLE `book_chapter` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `url` varchar(100) DEFAULT NULL COMMENT '阅读页URL',
  `title` varchar(50) DEFAULT NULL COMMENT '章节名',
  `book_id` bigint(100) DEFAULT NULL COMMENT '小说id',
  `word_count` int(11) DEFAULT NULL COMMENT '字数',
  `url_source` varchar(256) DEFAULT NULL COMMENT '章节采集源网址',
  `chapter_id` varchar(100) DEFAULT NULL COMMENT '章节排序',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `chapter_time` datetime DEFAULT NULL COMMENT '章节时间',
  `state` enum('1','0') DEFAULT NULL COMMENT '采集状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8;

/*Data for the table `book_chapter` */

insert  into `book_chapter`(`id`,`url`,`title`,`book_id`,`word_count`,`url_source`,`chapter_id`,`update_time`,`create_time`,`chapter_time`,`state`) values 
(6,'http://www.biqiuge.com/book/340/1790375.html','恶人自有恶人磨',2,NULL,'http://www.biqiuge.com/book/340/1790375.html','149','2019-05-01 11:20:27',NULL,NULL,NULL),
(8,'http://www.biqiuge.com/book/340/1790375.html','恶人自有恶人磨',2,NULL,'http://www.biqiuge.com/book/340/1790375.html','149','2019-05-01 11:20:27',NULL,NULL,NULL),
(9,'http://www.biqiuge.com/book/340/1790377.html','风太大，你们说的啥子呦',2,NULL,'http://www.biqiuge.com/book/340/1790377.html',NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `book_chapter_detail` */

DROP TABLE IF EXISTS `book_chapter_detail`;

CREATE TABLE `book_chapter_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `url` varchar(100) NOT NULL COMMENT '阅读页url',
  `title` varchar(50) DEFAULT NULL COMMENT '章节标题',
  `book_id` bigint(20) DEFAULT NULL COMMENT '小说id',
  `word_count` int(11) DEFAULT NULL COMMENT '字数',
  `chapter_id` varchar(100) DEFAULT NULL COMMENT '章节排序',
  `content` text COMMENT '正文',
  `chapter_time` bigint(20) DEFAULT NULL COMMENT '章节时间',
  `url_source` varchar(255) DEFAULT NULL COMMENT '章节采集源网址',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `book_chapter_detail` */

/*Table structure for table `book_type` */

DROP TABLE IF EXISTS `book_type`;

CREATE TABLE `book_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(20) DEFAULT NULL,
  `info` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `book_type` */

insert  into `book_type`(`id`,`type`,`info`) values 
(1,'推理小说','推理小说'),
(2,'文学','文学'),
(3,'java','java');

/*Table structure for table `books` */

DROP TABLE IF EXISTS `books`;

CREATE TABLE `books` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `url` varchar(100) DEFAULT NULL COMMENT '简介页url',
  `name` varchar(50) DEFAULT NULL COMMENT '书名',
  `author` varchar(30) DEFAULT NULL COMMENT '作者名',
  `description` text COMMENT '书简介',
  `type_id` int(11) DEFAULT NULL COMMENT '分类',
  `last_chapter` varchar(100) DEFAULT NULL COMMENT '最新章节名',
  `chapter_count` int(11) DEFAULT NULL COMMENT '章节数',
  `chapterlist_url` varchar(100) DEFAULT NULL COMMENT '章节列表页url',
  `word_count` int(11) DEFAULT NULL COMMENT '字数',
  `url_source` varchar(256) DEFAULT NULL COMMENT '书本源网址',
  `keywords` varchar(100) DEFAULT NULL COMMENT '关键字',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `state` enum('1','0') DEFAULT NULL COMMENT '采集状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=178 DEFAULT CHARSET=utf8;

/*Data for the table `books` */

insert  into `books`(`id`,`url`,`name`,`author`,`description`,`type_id`,`last_chapter`,`chapter_count`,`chapterlist_url`,`word_count`,`url_source`,`keywords`,`create_time`,`update_time`,`state`) values 
(1,'http://www.biqiuge.com/book/340/','超时空垃圾合成系统',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/340/',NULL,'http://www.biqiuge.com/book/340/',NULL,'2019-05-01 12:53:41','2019-05-01 12:53:41',NULL);

/*Table structure for table `comment` */

DROP TABLE IF EXISTS `comment`;

CREATE TABLE `comment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` varchar(500) DEFAULT NULL COMMENT '评论内容',
  `topic_id` bigint(20) DEFAULT NULL COMMENT '评论主题id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '评论者id',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父评论id',
  `all_comment` int(11) DEFAULT NULL COMMENT '所有评论数量',
  `prompt_comment` int(11) DEFAULT NULL COMMENT '所有未读评论数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `comment` */

/*Table structure for table `crawl_list` */

DROP TABLE IF EXISTS `crawl_list`;

CREATE TABLE `crawl_list` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `url` varchar(100) NOT NULL COMMENT '采集url',
  `state` enum('1','0') NOT NULL COMMENT '采集状态',
  `info` varchar(100) DEFAULT NULL COMMENT '描述',
  `frequency` int(11) DEFAULT '60' COMMENT '采集频率',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `crawl_list` */

/*Table structure for table `impermission` */

DROP TABLE IF EXISTS `impermission`;

CREATE TABLE `impermission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `from_id` bigint(20) DEFAULT NULL COMMENT '授权人id',
  `to_id` bigint(20) DEFAULT NULL COMMENT '被授权人id',
  `impermission_time` datetime DEFAULT NULL COMMENT '授权时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `impermission` */

insert  into `impermission`(`id`,`from_id`,`to_id`,`impermission_time`) values 
(1,1,2,NULL),
(2,1,3,NULL),
(3,1,4,NULL),
(4,3,5,NULL),
(5,4,6,NULL),
(6,1,7,NULL);

/*Table structure for table `permission_detail` */

DROP TABLE IF EXISTS `permission_detail`;

CREATE TABLE `permission_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `permission` int(11) DEFAULT NULL COMMENT '权限代号',
  `resource` varchar(500) DEFAULT NULL COMMENT '权限代号对应的权利',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

/*Data for the table `permission_detail` */

insert  into `permission_detail`(`id`,`permission`,`resource`) values 
(1,1,'阅读所有小说'),
(2,2,'修改所有小说'),
(3,3,'删除所有小说'),
(4,4,'添加所有小说'),
(5,5,'阅读SVIP小说'),
(6,6,'修改SVIP小说'),
(7,7,'阅读VIP小说'),
(8,8,'修改VIP小说'),
(13,9,'阅读普通小说');

/*Table structure for table `read_level` */

DROP TABLE IF EXISTS `read_level`;

CREATE TABLE `read_level` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `level` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `read_level` */

/*Table structure for table `reader_detail` */

DROP TABLE IF EXISTS `reader_detail`;

CREATE TABLE `reader_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `level_id` int(11) DEFAULT NULL,
  `achievement` varchar(255) DEFAULT NULL COMMENT '阅读成就',
  `user_id` bigint(20) DEFAULT NULL,
  `info` varchar(255) DEFAULT NULL COMMENT '读者描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `reader_detail` */

/*Table structure for table `role` */

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_code` varchar(255) DEFAULT NULL COMMENT '角色代号',
  `role_name` varchar(255) DEFAULT NULL COMMENT '角色名称',
  `permissions` varchar(255) DEFAULT NULL COMMENT '角色对应权利',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `role` */

insert  into `role`(`id`,`role_code`,`role_name`,`permissions`) values 
(1,'rc000001','超级管理员','1,2,3,4'),
(2,'rc000002','普通管理员','5,6'),
(3,'rc000003','高级作家','5'),
(4,'rc000004','中级作家','7'),
(5,'rc000005','初级作家','9'),
(6,'rc000006','读者SVIP','1'),
(7,'rc000007','读者VIP','7'),
(8,'rc000008','普通读者','9');

/*Table structure for table `topic` */

DROP TABLE IF EXISTS `topic`;

CREATE TABLE `topic` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(256) DEFAULT NULL COMMENT '评论主题',
  `all_comment` int(11) DEFAULT NULL COMMENT '所有评论数量',
  `prompt_comment` int(11) DEFAULT NULL COMMENT '所有未读评论数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `topic` */

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户表id',
  `num` varchar(100) DEFAULT NULL COMMENT '编号',
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(50) NOT NULL COMMENT '用户密码，MD5加密',
  `role_code` varchar(50) NOT NULL COMMENT '角色',
  `email` varchar(50) DEFAULT NULL,
  `read_id` bigint(20) DEFAULT NULL COMMENT '作为读者的详细信息',
  `organ` varchar(100) DEFAULT NULL COMMENT '组织',
  `phone` varchar(20) DEFAULT NULL,
  `author_id` bigint(20) DEFAULT NULL COMMENT '作为作者的详细信息',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '最后一次更新时间',
  `vip` varchar(12) DEFAULT NULL COMMENT 'SVIP,VIP,NORMAL',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_name_unique` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`id`,`num`,`username`,`password`,`role_code`,`email`,`read_id`,`organ`,`phone`,`author_id`,`create_time`,`update_time`,`vip`) values 
(1,'1700301235','admin','EE3120EFDF18F9641397CD691BCC0F51','rc000001','admin@happymmall.com',NULL,'worxfr','13800138000',NULL,'2016-11-06 16:56:45','2019-04-08 13:53:24',NULL),
(2,'1700301221','geely','EE3120EFDF18F9641397CD691BCC0F51','rc000002','geely@happymmall.com',NULL,'worxfr','13800138000',NULL,'2016-11-19 22:19:25','2016-11-19 22:19:25',NULL),
(3,'1700301625','rosen','12345','rc000003','rosen1@happymmall.com',NULL,'csdn','13800138000',NULL,'2017-03-17 10:51:33','2017-04-09 23:13:26',NULL),
(4,'1700300215','sooner','1234','rc000004','test06@happymmall.com',NULL,'csdn','13800138000',NULL,'2017-04-13 21:26:22','2017-04-13 21:26:22',NULL),
(5,'1600300818','zj','EE3120EFDF18F9641397CD691BCC0F51','rc000005',NULL,NULL,NULL,NULL,NULL,'2019-04-08 12:22:23','2019-04-08 12:22:23',NULL),
(6,'1700301224','ymh','EE3120EFDF18F9641397CD691BCC0F51','rc000006',NULL,NULL,NULL,NULL,NULL,'2019-04-08 12:35:28','2019-04-08 12:35:28',NULL);

/*Table structure for table `user_role` */

DROP TABLE IF EXISTS `user_role`;

/*!50001 DROP VIEW IF EXISTS `user_role` */;
/*!50001 DROP TABLE IF EXISTS `user_role` */;

/*!50001 CREATE TABLE  `user_role`(
 `id` int(11) ,
 `num` varchar(100) ,
 `username` varchar(50) ,
 `password` varchar(50) ,
 `role_code` varchar(50) ,
 `organ` varchar(100) ,
 `phone` varchar(20) ,
 `email` varchar(50) ,
 `create_time` datetime ,
 `update_time` datetime ,
 `role_name` varchar(255) ,
 `permissions` varchar(255) ,
 `from_id` bigint(20) ,
 `impermission_time` datetime 
)*/;

/*View structure for view user_role */

/*!50001 DROP TABLE IF EXISTS `user_role` */;
/*!50001 DROP VIEW IF EXISTS `user_role` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `user_role` AS select `u`.`id` AS `id`,`u`.`num` AS `num`,`u`.`username` AS `username`,`u`.`password` AS `password`,`u`.`role_code` AS `role_code`,`u`.`organ` AS `organ`,`u`.`phone` AS `phone`,`u`.`email` AS `email`,`u`.`create_time` AS `create_time`,`u`.`update_time` AS `update_time`,`r`.`role_name` AS `role_name`,`r`.`permissions` AS `permissions`,`i`.`from_id` AS `from_id`,`i`.`impermission_time` AS `impermission_time` from ((`user` `u` join `role` `r`) join `impermission` `i`) where ((`u`.`role_code` = `r`.`role_code`) and (`u`.`id` = `i`.`to_id`)) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
