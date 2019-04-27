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
  `chapter_time` datetime DEFAULT NULL COMMENT '章节时间',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `state` enum('1','0') DEFAULT NULL COMMENT '采集状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `book_chapter` */

insert  into `book_chapter`(`id`,`url`,`title`,`book_id`,`word_count`,`url_source`,`chapter_id`,`chapter_time`,`create_time`,`state`) values 
(6,'http://www.biqiuge.com/book/340/1790375.html','恶人自有恶人磨',2,NULL,'http://www.biqiuge.com/book/340/1790375.html','149',NULL,NULL,NULL),
(8,'http://www.biqiuge.com/book/340/1790375.html','恶人自有恶人磨',2,NULL,'http://www.biqiuge.com/book/340/1790375.html','149',NULL,NULL,NULL),
(9,'http://www.biqiuge.com/book/340/1790377.html','风太大，你们说的啥子呦',2,NULL,'http://www.biqiuge.com/book/340/1790377.html',NULL,NULL,NULL,NULL);

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
  `create_time` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) DEFAULT NULL COMMENT '最后更新时间',
  `state` enum('1','0') DEFAULT NULL COMMENT '采集状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `books` */

insert  into `books`(`id`,`url`,`name`,`author`,`description`,`type_id`,`last_chapter`,`chapter_count`,`chapterlist_url`,`word_count`,`url_source`,`keywords`,`create_time`,`update_time`,`state`) values 
(1,'http://www.biqiuge.com/book/340/','test',NULL,NULL,1,NULL,NULL,'http://www.biqiuge.com/book/340/',NULL,NULL,NULL,NULL,NULL,'1'),
(2,'http://www.biqiuge.com/book/340/','超时空垃圾合成系统',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/340/',NULL,NULL,NULL,NULL);

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
