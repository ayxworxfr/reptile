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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

/*Data for the table `book_chapter` */

insert  into `book_chapter`(`id`,`url`,`title`,`book_id`,`word_count`,`url_source`,`chapter_id`,`update_time`,`create_time`,`chapter_time`,`state`) values 
(6,'http://www.biqiuge.com/book/340/1790375.html','恶人自有恶人磨',2,NULL,'http://www.biqiuge.com/book/340/1790375.html','149','2019-04-29 23:29:58',NULL,NULL,NULL),
(8,'http://www.biqiuge.com/book/340/1790375.html','恶人自有恶人磨',2,NULL,'http://www.biqiuge.com/book/340/1790375.html','149','2019-04-29 23:29:58',NULL,NULL,NULL),
(9,'http://www.biqiuge.com/book/340/1790377.html','风太大，你们说的啥子呦',2,NULL,'http://www.biqiuge.com/book/340/1790377.html',NULL,NULL,NULL,NULL,NULL),
(10,'http://www.biqiuge.com/book/499/2094819.html','血鬼虫',3,NULL,'http://www.biqiuge.com/book/499/2094819.html','一千零一十五',NULL,NULL,NULL,NULL),
(11,'http://www.biqiuge.com/book/499/2094820.html','黄泉',3,NULL,'http://www.biqiuge.com/book/499/2094820.html','一千零一十六',NULL,NULL,NULL,NULL),
(12,'http://www.biqiuge.com/book/499/2094821.html','轮回术',3,NULL,'http://www.biqiuge.com/book/499/2094821.html','一千零一十七',NULL,NULL,NULL,NULL),
(13,'http://www.biqiuge.com/book/340/1790377.html','风太大，你们说的啥子呦',2,NULL,'http://www.biqiuge.com/book/340/1790377.html','150','2019-04-29 23:30:35','2019-04-29 23:30:35',NULL,NULL),
(14,'http://www.biqiuge.com/book/340/1790378.html','意外',2,NULL,'http://www.biqiuge.com/book/340/1790378.html','151','2019-04-29 23:30:43','2019-04-29 23:30:43',NULL,NULL),
(15,'http://www.biqiuge.com/book/340/1790379.html','偏僻的小巷',2,NULL,'http://www.biqiuge.com/book/340/1790379.html','152','2019-04-29 23:30:47','2019-04-29 23:30:47',NULL,NULL),
(16,'http://www.biqiuge.com/book/340/1790381.html','一呼百应',2,NULL,'http://www.biqiuge.com/book/340/1790381.html','153','2019-04-29 23:30:51','2019-04-29 23:30:51',NULL,NULL),
(17,'http://www.biqiuge.com/book/340/1790382.html','合成香料',2,NULL,'http://www.biqiuge.com/book/340/1790382.html','154','2019-04-29 23:30:55','2019-04-29 23:30:55',NULL,NULL),
(18,'http://www.biqiuge.com/book/10/12196.html','我的高考不可能这么可爱',10,NULL,'http://www.biqiuge.com/book/10/12196.html','1','2019-04-29 23:43:02','2019-04-29 23:43:02',NULL,NULL),
(19,'http://www.biqiuge.com/book/10/12197.html','现在流行神展开',10,NULL,'http://www.biqiuge.com/book/10/12197.html','2','2019-04-29 23:43:05','2019-04-29 23:43:05',NULL,NULL),
(20,'http://www.biqiuge.com/book/10/12198.html','食堂即是战场',10,NULL,'http://www.biqiuge.com/book/10/12198.html','3','2019-04-29 23:43:07','2019-04-29 23:43:07',NULL,NULL),
(21,'http://www.biqiuge.com/book/30/1489799.html','天劫降临',21,NULL,'http://www.biqiuge.com/book/30/1489799.html','125','2019-05-01 10:04:28','2019-05-01 10:04:28',NULL,NULL),
(22,'http://www.biqiuge.com/book/30/1489803.html','灭世雷劫',21,NULL,'http://www.biqiuge.com/book/30/1489803.html','126','2019-05-01 10:04:30','2019-05-01 10:04:30',NULL,NULL),
(23,'http://www.biqiuge.com/book/358/1433431.html','为了兄弟！',4,NULL,'http://www.biqiuge.com/book/358/1433431.html','九十二','2019-05-01 10:10:28','2019-05-01 10:10:28',NULL,NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=169 DEFAULT CHARSET=utf8;

/*Data for the table `books` */

insert  into `books`(`id`,`url`,`name`,`author`,`description`,`type_id`,`last_chapter`,`chapter_count`,`chapterlist_url`,`word_count`,`url_source`,`keywords`,`create_time`,`update_time`,`state`) values 
(1,'http://www.biqiuge.com/book/340/','test',NULL,NULL,1,NULL,NULL,'http://www.biqiuge.com/book/340/',NULL,NULL,NULL,NULL,NULL,'1'),
(2,'http://www.biqiuge.com/book/340/','超时空垃圾合成系统',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/340/',NULL,NULL,NULL,NULL),
(3,'http://www.biqiuge.com/book/499/','剑尊',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/499/',NULL,NULL,NULL,NULL),
(4,'http://www.biqiuge.com/book/358/','巨星宗师',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/358/',NULL,NULL,NULL,NULL),
(5,'http://www.biqiuge.com/book/372/','超能空间戒指',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/372/',NULL,NULL,NULL,NULL),
(6,'http://www.biqiuge.com/book/349/','带条神龙游异界',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/349/',NULL,NULL,NULL,NULL),
(7,'http://www.biqiuge.com/book/381/','超级声望系统',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/381/',NULL,NULL,NULL,NULL),
(8,'http://www.biqiuge.com/book/438/','黄金地球',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/438/',NULL,NULL,NULL,NULL),
(10,'http://www.biqiuge.com/book/10/','最强次元学院',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/10/',NULL,'http://www.biqiuge.com/book/10/',NULL,'2019-04-29 23:41:33','2019-04-29 23:41:33',NULL),
(21,'http://www.biqiuge.com/book/30/','不朽霸主',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/30/',NULL,'http://www.biqiuge.com/book/30/',NULL,'2019-05-01 10:02:20','2019-05-01 10:02:20',NULL),
(23,'http://www.biqiuge.com/book/35/','邪帝传人在都市',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/35/',NULL,'http://www.biqiuge.com/book/35/',NULL,'2019-05-01 10:07:26','2019-05-01 10:07:26',NULL),
(24,'http://www.biqiuge.com/book/433/','超级天启',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/433/',NULL,'http://www.biqiuge.com/book/433/',NULL,'2019-05-01 10:09:25','2019-05-01 10:09:25',NULL),
(25,'http://www.biqiuge.com/book/379/','诸天谣',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/379/',NULL,'http://www.biqiuge.com/book/379/',NULL,'2019-05-01 10:09:28','2019-05-01 10:09:28',NULL),
(26,'http://www.biqiuge.com/book/369/','火爆兵王在都市',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/369/',NULL,'http://www.biqiuge.com/book/369/',NULL,'2019-05-01 10:09:30','2019-05-01 10:09:30',NULL),
(27,'http://www.biqiuge.com/book/351/','格斗专家',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/351/',NULL,'http://www.biqiuge.com/book/351/',NULL,'2019-05-01 10:09:30','2019-05-01 10:09:30',NULL),
(28,'http://www.biqiuge.com/book/373/','一点浩然气',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/373/',NULL,'http://www.biqiuge.com/book/373/',NULL,'2019-05-01 10:09:30','2019-05-01 10:09:30',NULL),
(29,'http://www.biqiuge.com/book/355/','逆命',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/355/',NULL,'http://www.biqiuge.com/book/355/',NULL,'2019-05-01 10:09:30','2019-05-01 10:09:30',NULL),
(30,'http://www.biqiuge.com/book/362/','再建天宫',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/362/',NULL,'http://www.biqiuge.com/book/362/',NULL,'2019-05-01 10:09:32','2019-05-01 10:09:32',NULL),
(31,'http://www.biqiuge.com/book/391/','梵魔记',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/391/',NULL,'http://www.biqiuge.com/book/391/',NULL,'2019-05-01 10:09:36','2019-05-01 10:09:36',NULL),
(32,'http://www.biqiuge.com/book/390/','位面祭坛',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/390/',NULL,'http://www.biqiuge.com/book/390/',NULL,'2019-05-01 10:09:39','2019-05-01 10:09:39',NULL),
(33,'http://www.biqiuge.com/book/417/','妖怪王',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/417/',NULL,'http://www.biqiuge.com/book/417/',NULL,'2019-05-01 10:09:39','2019-05-01 10:09:39',NULL),
(34,'http://www.biqiuge.com/book/347/','天剑御道',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/347/',NULL,'http://www.biqiuge.com/book/347/',NULL,'2019-05-01 10:09:39','2019-05-01 10:09:39',NULL),
(35,'http://www.biqiuge.com/book/453/','无限位面游记',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/453/',NULL,'http://www.biqiuge.com/book/453/',NULL,'2019-05-01 10:09:41','2019-05-01 10:09:41',NULL),
(36,'http://www.biqiuge.com/book/382/','È«ÇòÌìÍõÏµÍ³',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/382/',NULL,'http://www.biqiuge.com/book/382/',NULL,'2019-05-01 10:09:41','2019-05-01 10:09:41',NULL),
(37,'http://www.biqiuge.com/book/367/','大武皇',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/367/',NULL,'http://www.biqiuge.com/book/367/',NULL,'2019-05-01 10:09:42','2019-05-01 10:09:42',NULL),
(38,'http://www.biqiuge.com/book/365/','征战洪荒',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/365/',NULL,'http://www.biqiuge.com/book/365/',NULL,'2019-05-01 10:09:42','2019-05-01 10:09:42',NULL),
(39,'http://www.biqiuge.com/book/448/','信仰封神',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/448/',NULL,'http://www.biqiuge.com/book/448/',NULL,'2019-05-01 10:09:44','2019-05-01 10:09:44',NULL),
(40,'http://www.biqiuge.com/book/430/','侠影惊鸿',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/430/',NULL,'http://www.biqiuge.com/book/430/',NULL,'2019-05-01 10:09:44','2019-05-01 10:09:44',NULL),
(41,'http://www.biqiuge.com/book/407/','我在异界有个家',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/407/',NULL,'http://www.biqiuge.com/book/407/',NULL,'2019-05-01 10:09:45','2019-05-01 10:09:45',NULL),
(42,'http://www.biqiuge.com/book/460/','重生剑侠图',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/460/',NULL,'http://www.biqiuge.com/book/460/',NULL,'2019-05-01 10:09:46','2019-05-01 10:09:46',NULL),
(43,'http://www.biqiuge.com/book/348/','大道凌天',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/348/',NULL,'http://www.biqiuge.com/book/348/',NULL,'2019-05-01 10:09:46','2019-05-01 10:09:46',NULL),
(44,'http://www.biqiuge.com/book/409/','超时空大帝国',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/409/',NULL,'http://www.biqiuge.com/book/409/',NULL,'2019-05-01 10:09:47','2019-05-01 10:09:47',NULL),
(45,'http://www.biqiuge.com/book/399/','三国封神路',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/399/',NULL,'http://www.biqiuge.com/book/399/',NULL,'2019-05-01 10:09:48','2019-05-01 10:09:48',NULL),
(46,'http://www.biqiuge.com/book/451/','势利眼',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/451/',NULL,'http://www.biqiuge.com/book/451/',NULL,'2019-05-01 10:09:48','2019-05-01 10:09:48',NULL),
(47,'http://www.biqiuge.com/book/383/','八云家的大少爷',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/383/',NULL,'http://www.biqiuge.com/book/383/',NULL,'2019-05-01 10:09:48','2019-05-01 10:09:48',NULL),
(48,'http://www.biqiuge.com/book/370/','九荒帝魔决',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/370/',NULL,'http://www.biqiuge.com/book/370/',NULL,'2019-05-01 10:09:48','2019-05-01 10:09:48',NULL),
(49,'http://www.biqiuge.com/book/387/','绝地兵王',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/387/',NULL,'http://www.biqiuge.com/book/387/',NULL,'2019-05-01 10:09:48','2019-05-01 10:09:48',NULL),
(50,'http://www.biqiuge.com/book/428/','升斗小民',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/428/',NULL,'http://www.biqiuge.com/book/428/',NULL,'2019-05-01 10:09:49','2019-05-01 10:09:49',NULL),
(51,'http://www.biqiuge.com/book/375/','踏天战神',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/375/',NULL,'http://www.biqiuge.com/book/375/',NULL,'2019-05-01 10:09:49','2019-05-01 10:09:49',NULL),
(52,'http://www.biqiuge.com/book/464/','网游三国之神话',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/464/',NULL,'http://www.biqiuge.com/book/464/',NULL,'2019-05-01 10:09:52','2019-05-01 10:09:52',NULL),
(53,'http://www.biqiuge.com/book/449/','大小姐的异能保镖',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/449/',NULL,'http://www.biqiuge.com/book/449/',NULL,'2019-05-01 10:09:52','2019-05-01 10:09:52',NULL),
(54,'http://www.biqiuge.com/book/346/','医者为王',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/346/',NULL,'http://www.biqiuge.com/book/346/',NULL,'2019-05-01 10:09:52','2019-05-01 10:09:52',NULL),
(55,'http://www.biqiuge.com/book/459/','灵神传说',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/459/',NULL,'http://www.biqiuge.com/book/459/',NULL,'2019-05-01 10:09:51','2019-05-01 10:09:51',NULL),
(56,'http://www.biqiuge.com/book/397/','王牌御医',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/397/',NULL,'http://www.biqiuge.com/book/397/',NULL,'2019-05-01 10:09:53','2019-05-01 10:09:53',NULL),
(57,'http://www.biqiuge.com/book/424/','天火大道',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/424/',NULL,'http://www.biqiuge.com/book/424/',NULL,'2019-05-01 10:09:54','2019-05-01 10:09:54',NULL),
(58,'http://www.biqiuge.com/book/363/','超级高手养成计划',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/363/',NULL,'http://www.biqiuge.com/book/363/',NULL,'2019-05-01 10:09:56','2019-05-01 10:09:56',NULL),
(59,'http://www.biqiuge.com/book/440/','灭噬乾坤',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/440/',NULL,'http://www.biqiuge.com/book/440/',NULL,'2019-05-01 10:09:56','2019-05-01 10:09:56',NULL),
(60,'http://www.biqiuge.com/book/384/','我来自阿斯嘉德',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/384/',NULL,'http://www.biqiuge.com/book/384/',NULL,'2019-05-01 10:09:57','2019-05-01 10:09:57',NULL),
(61,'http://www.biqiuge.com/book/426/','超级神相',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/426/',NULL,'http://www.biqiuge.com/book/426/',NULL,'2019-05-01 10:10:01','2019-05-01 10:10:01',NULL),
(62,'http://www.biqiuge.com/book/477/','昙香客栈',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/477/',NULL,'http://www.biqiuge.com/book/477/',NULL,'2019-05-01 10:10:02','2019-05-01 10:10:02',NULL),
(63,'http://www.biqiuge.com/book/345/','苗疆道事',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/345/',NULL,'http://www.biqiuge.com/book/345/',NULL,'2019-05-01 10:10:02','2019-05-01 10:10:02',NULL),
(64,'http://www.biqiuge.com/book/360/','特级诡兵',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/360/',NULL,'http://www.biqiuge.com/book/360/',NULL,'2019-05-01 10:10:06','2019-05-01 10:10:06',NULL),
(65,'http://www.biqiuge.com/book/388/','武林半侠传',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/388/',NULL,'http://www.biqiuge.com/book/388/',NULL,'2019-05-01 10:10:06','2019-05-01 10:10:06',NULL),
(66,'http://www.biqiuge.com/book/354/','妖道至尊',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/354/',NULL,'http://www.biqiuge.com/book/354/',NULL,'2019-05-01 10:10:08','2019-05-01 10:10:08',NULL),
(67,'http://www.biqiuge.com/book/350/','步步高升',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/350/',NULL,'http://www.biqiuge.com/book/350/',NULL,'2019-05-01 10:10:08','2019-05-01 10:10:08',NULL),
(68,'http://www.biqiuge.com/book/467/','怒瀚',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/467/',NULL,'http://www.biqiuge.com/book/467/',NULL,'2019-05-01 10:10:08','2019-05-01 10:10:08',NULL),
(69,'http://www.biqiuge.com/book/385/','仙念',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/385/',NULL,'http://www.biqiuge.com/book/385/',NULL,'2019-05-01 10:10:14','2019-05-01 10:10:14',NULL),
(70,'http://www.biqiuge.com/book/377/','永生天帝',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/377/',NULL,'http://www.biqiuge.com/book/377/',NULL,'2019-05-01 10:10:15','2019-05-01 10:10:15',NULL),
(71,'http://www.biqiuge.com/book/422/','无量真途',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/422/',NULL,'http://www.biqiuge.com/book/422/',NULL,'2019-05-01 10:10:15','2019-05-01 10:10:15',NULL),
(72,'http://www.biqiuge.com/book/470/','超人来袭',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/470/',NULL,'http://www.biqiuge.com/book/470/',NULL,'2019-05-01 10:10:16','2019-05-01 10:10:16',NULL),
(73,'http://www.biqiuge.com/book/435/','玄界之门',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/435/',NULL,'http://www.biqiuge.com/book/435/',NULL,'2019-05-01 10:10:14','2019-05-01 10:10:14',NULL),
(74,'http://www.biqiuge.com/book/401/','深海战神',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/401/',NULL,'http://www.biqiuge.com/book/401/',NULL,'2019-05-01 10:10:16','2019-05-01 10:10:16',NULL),
(75,'http://www.biqiuge.com/book/452/','摸金天帝',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/452/',NULL,'http://www.biqiuge.com/book/452/',NULL,'2019-05-01 10:10:17','2019-05-01 10:10:17',NULL),
(76,'http://www.biqiuge.com/book/353/','震动',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/353/',NULL,'http://www.biqiuge.com/book/353/',NULL,'2019-05-01 10:10:19','2019-05-01 10:10:19',NULL),
(77,'http://www.biqiuge.com/book/352/','英雄联盟之啸傲天下',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/352/',NULL,'http://www.biqiuge.com/book/352/',NULL,'2019-05-01 10:10:21','2019-05-01 10:10:21',NULL),
(78,'http://www.biqiuge.com/book/404/','夺鼎1617',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/404/',NULL,'http://www.biqiuge.com/book/404/',NULL,'2019-05-01 10:10:22','2019-05-01 10:10:22',NULL),
(79,'http://www.biqiuge.com/book/371/','行走阴阳',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/371/',NULL,'http://www.biqiuge.com/book/371/',NULL,'2019-05-01 10:10:24','2019-05-01 10:10:24',NULL),
(80,'http://www.biqiuge.com/book/359/','超级海盗船',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/359/',NULL,'http://www.biqiuge.com/book/359/',NULL,'2019-05-01 10:10:25','2019-05-01 10:10:25',NULL),
(81,'http://www.biqiuge.com/book/443/','黄金斗魂',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/443/',NULL,'http://www.biqiuge.com/book/443/',NULL,'2019-05-01 10:10:28','2019-05-01 10:10:28',NULL),
(82,'http://www.biqiuge.com/book/469/','侠骨擎天',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/469/',NULL,'http://www.biqiuge.com/book/469/',NULL,'2019-05-01 10:10:28','2019-05-01 10:10:28',NULL),
(83,'http://www.biqiuge.com/book/490/','奥术篇章',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/490/',NULL,'http://www.biqiuge.com/book/490/',NULL,'2019-05-01 11:08:45','2019-05-01 11:08:45',NULL),
(84,'http://www.biqiuge.com/book/487/','霸天雷神',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/487/',NULL,'http://www.biqiuge.com/book/487/',NULL,'2019-05-01 11:08:46','2019-05-01 11:08:46',NULL),
(85,'http://www.biqiuge.com/book/439/','文娱教父',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/439/',NULL,'http://www.biqiuge.com/book/439/',NULL,'2019-05-01 11:08:52','2019-05-01 11:08:52',NULL),
(86,'http://www.biqiuge.com/book/486/','英雄联盟之无敌召唤',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/486/',NULL,'http://www.biqiuge.com/book/486/',NULL,'2019-05-01 11:08:53','2019-05-01 11:08:53',NULL),
(87,'http://www.biqiuge.com/book/483/','足球豪门',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/483/',NULL,'http://www.biqiuge.com/book/483/',NULL,'2019-05-01 11:08:53','2019-05-01 11:08:53',NULL),
(88,'http://www.biqiuge.com/book/481/','无极真仙',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/481/',NULL,'http://www.biqiuge.com/book/481/',NULL,'2019-05-01 11:08:53','2019-05-01 11:08:53',NULL),
(89,'http://www.biqiuge.com/book/456/','神目风',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/456/',NULL,'http://www.biqiuge.com/book/456/',NULL,'2019-05-01 11:08:54','2019-05-01 11:08:54',NULL),
(90,'http://www.biqiuge.com/book/495/','幸福武侠',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/495/',NULL,'http://www.biqiuge.com/book/495/',NULL,'2019-05-01 11:08:54','2019-05-01 11:08:54',NULL),
(91,'http://www.biqiuge.com/book/494/','笑傲神雕天龙',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/494/',NULL,'http://www.biqiuge.com/book/494/',NULL,'2019-05-01 11:08:57','2019-05-01 11:08:57',NULL),
(92,'http://www.biqiuge.com/book/425/','黑暗主宰',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/425/',NULL,'http://www.biqiuge.com/book/425/',NULL,'2019-05-01 11:08:57','2019-05-01 11:08:57',NULL),
(93,'http://www.biqiuge.com/book/480/','悍庄',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/480/',NULL,'http://www.biqiuge.com/book/480/',NULL,'2019-05-01 11:09:01','2019-05-01 11:09:01',NULL),
(94,'http://www.biqiuge.com/book/454/','超级打工仔',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/454/',NULL,'http://www.biqiuge.com/book/454/',NULL,'2019-05-01 11:09:02','2019-05-01 11:09:02',NULL),
(95,'http://www.biqiuge.com/book/463/','武侠之父',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/463/',NULL,'http://www.biqiuge.com/book/463/',NULL,'2019-05-01 11:09:02','2019-05-01 11:09:02',NULL),
(96,'http://www.biqiuge.com/book/400/','重生印度之高人一等',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/400/',NULL,'http://www.biqiuge.com/book/400/',NULL,'2019-05-01 11:09:04','2019-05-01 11:09:04',NULL),
(97,'http://www.biqiuge.com/book/491/','来自昆仑的男人',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/491/',NULL,'http://www.biqiuge.com/book/491/',NULL,'2019-05-01 11:09:04','2019-05-01 11:09:04',NULL),
(98,'http://www.biqiuge.com/book/478/','成长特烦恼',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/478/',NULL,'http://www.biqiuge.com/book/478/',NULL,'2019-05-01 11:09:07','2019-05-01 11:09:07',NULL),
(99,'http://www.biqiuge.com/book/455/','战火来袭',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/455/',NULL,'http://www.biqiuge.com/book/455/',NULL,'2019-05-01 11:09:08','2019-05-01 11:09:08',NULL),
(100,'http://www.biqiuge.com/book/465/','韩娱之演技大师',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/465/',NULL,'http://www.biqiuge.com/book/465/',NULL,'2019-05-01 11:09:09','2019-05-01 11:09:09',NULL),
(101,'http://www.biqiuge.com/book/361/','混在日本女校的高手',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/361/',NULL,'http://www.biqiuge.com/book/361/',NULL,'2019-05-01 11:09:11','2019-05-01 11:09:11',NULL),
(102,'http://www.biqiuge.com/book/461/','六界神君',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/461/',NULL,'http://www.biqiuge.com/book/461/',NULL,'2019-05-01 11:09:11','2019-05-01 11:09:11',NULL),
(103,'http://www.biqiuge.com/book/441/','权妃之帝医风华',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/441/',NULL,'http://www.biqiuge.com/book/441/',NULL,'2019-05-01 11:09:11','2019-05-01 11:09:11',NULL),
(104,'http://www.biqiuge.com/book/496/','逍遥侯',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/496/',NULL,'http://www.biqiuge.com/book/496/',NULL,'2019-05-01 11:09:14','2019-05-01 11:09:14',NULL),
(105,'http://www.biqiuge.com/book/493/','求道武侠世界',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/493/',NULL,'http://www.biqiuge.com/book/493/',NULL,'2019-05-01 11:09:17','2019-05-01 11:09:17',NULL),
(106,'http://www.biqiuge.com/book/479/','仙路争锋',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/479/',NULL,'http://www.biqiuge.com/book/479/',NULL,'2019-05-01 11:09:17','2019-05-01 11:09:17',NULL),
(107,'http://www.biqiuge.com/book/398/','帝御山河',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/398/',NULL,'http://www.biqiuge.com/book/398/',NULL,'2019-05-01 11:09:18','2019-05-01 11:09:18',NULL),
(108,'http://www.biqiuge.com/book/492/','重生之围棋梦',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/492/',NULL,'http://www.biqiuge.com/book/492/',NULL,'2019-05-01 11:09:18','2019-05-01 11:09:18',NULL),
(109,'http://www.biqiuge.com/book/380/','太易',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/380/',NULL,'http://www.biqiuge.com/book/380/',NULL,'2019-05-01 11:09:18','2019-05-01 11:09:18',NULL),
(110,'http://www.biqiuge.com/book/368/','重生之神级学霸',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/368/',NULL,'http://www.biqiuge.com/book/368/',NULL,'2019-05-01 11:09:19','2019-05-01 11:09:19',NULL),
(111,'http://www.biqiuge.com/book/466/','红缨记',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/466/',NULL,'http://www.biqiuge.com/book/466/',NULL,'2019-05-01 11:09:19','2019-05-01 11:09:19',NULL),
(112,'http://www.biqiuge.com/book/423/','崛起1892',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/423/',NULL,'http://www.biqiuge.com/book/423/',NULL,'2019-05-01 11:09:19','2019-05-01 11:09:19',NULL),
(113,'http://www.biqiuge.com/book/366/','我就是传奇',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/366/',NULL,'http://www.biqiuge.com/book/366/',NULL,'2019-05-01 11:09:20','2019-05-01 11:09:20',NULL),
(114,'http://www.biqiuge.com/book/462/','山神',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/462/',NULL,'http://www.biqiuge.com/book/462/',NULL,'2019-05-01 11:09:20','2019-05-01 11:09:20',NULL),
(115,'http://www.biqiuge.com/book/343/','雅拉世界之旅',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/343/',NULL,'http://www.biqiuge.com/book/343/',NULL,'2019-05-01 11:09:21','2019-05-01 11:09:21',NULL),
(116,'http://www.biqiuge.com/book/476/','盗贼王座',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/476/',NULL,'http://www.biqiuge.com/book/476/',NULL,'2019-05-01 11:09:22','2019-05-01 11:09:22',NULL),
(117,'http://www.biqiuge.com/book/411/','吃鬼的男孩',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/411/',NULL,'http://www.biqiuge.com/book/411/',NULL,'2019-05-01 11:09:22','2019-05-01 11:09:22',NULL),
(118,'http://www.biqiuge.com/book/437/','绝世战祖',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/437/',NULL,'http://www.biqiuge.com/book/437/',NULL,'2019-05-01 11:09:22','2019-05-01 11:09:22',NULL),
(119,'http://www.biqiuge.com/book/432/','都市巅峰强少',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/432/',NULL,'http://www.biqiuge.com/book/432/',NULL,'2019-05-01 11:09:22','2019-05-01 11:09:22',NULL),
(120,'http://www.biqiuge.com/book/341/','我的妹妹是偶像',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/341/',NULL,'http://www.biqiuge.com/book/341/',NULL,'2019-05-01 11:09:22','2019-05-01 11:09:22',NULL),
(121,'http://www.biqiuge.com/book/412/','娱乐宗师',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/412/',NULL,'http://www.biqiuge.com/book/412/',NULL,'2019-05-01 11:09:23','2019-05-01 11:09:23',NULL),
(122,'http://www.biqiuge.com/book/344/','天兵在1917',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/344/',NULL,'http://www.biqiuge.com/book/344/',NULL,'2019-05-01 11:09:23','2019-05-01 11:09:23',NULL),
(123,'http://www.biqiuge.com/book/386/','万族王座',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/386/',NULL,'http://www.biqiuge.com/book/386/',NULL,'2019-05-01 11:09:23','2019-05-01 11:09:23',NULL),
(124,'http://www.biqiuge.com/book/394/','百变妖锋',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/394/',NULL,'http://www.biqiuge.com/book/394/',NULL,'2019-05-01 11:09:23','2019-05-01 11:09:23',NULL),
(125,'http://www.biqiuge.com/book/497/','田园牧场',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/497/',NULL,'http://www.biqiuge.com/book/497/',NULL,'2019-05-01 11:09:23','2019-05-01 11:09:23',NULL),
(126,'http://www.biqiuge.com/book/458/','剑控天下',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/458/',NULL,'http://www.biqiuge.com/book/458/',NULL,'2019-05-01 11:09:23','2019-05-01 11:09:23',NULL),
(127,'http://www.biqiuge.com/book/395/','抗日之铁血兵王',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/395/',NULL,'http://www.biqiuge.com/book/395/',NULL,'2019-05-01 11:09:23','2019-05-01 11:09:23',NULL),
(128,'http://www.biqiuge.com/book/376/','皇牌龙骑',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/376/',NULL,'http://www.biqiuge.com/book/376/',NULL,'2019-05-01 11:09:23','2019-05-01 11:09:23',NULL),
(129,'http://www.biqiuge.com/book/450/','万象搜索器',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/450/',NULL,'http://www.biqiuge.com/book/450/',NULL,'2019-05-01 11:09:24','2019-05-01 11:09:24',NULL),
(130,'http://www.biqiuge.com/book/364/','最强穿越者',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/364/',NULL,'http://www.biqiuge.com/book/364/',NULL,'2019-05-01 11:09:24','2019-05-01 11:09:24',NULL),
(131,'http://www.biqiuge.com/book/396/','次元大乱斗',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/396/',NULL,'http://www.biqiuge.com/book/396/',NULL,'2019-05-01 11:09:24','2019-05-01 11:09:24',NULL),
(132,'http://www.biqiuge.com/book/488/','萌萌山海经',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/488/',NULL,'http://www.biqiuge.com/book/488/',NULL,'2019-05-01 11:09:24','2019-05-01 11:09:24',NULL),
(133,'http://www.biqiuge.com/book/471/','男神抽奖系统',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/471/',NULL,'http://www.biqiuge.com/book/471/',NULL,'2019-05-01 11:09:25','2019-05-01 11:09:25',NULL),
(134,'http://www.biqiuge.com/book/413/','天启之门',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/413/',NULL,'http://www.biqiuge.com/book/413/',NULL,'2019-05-01 11:09:25','2019-05-01 11:09:25',NULL),
(135,'http://www.biqiuge.com/book/389/','我就是太平洋',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/389/',NULL,'http://www.biqiuge.com/book/389/',NULL,'2019-05-01 11:09:25','2019-05-01 11:09:25',NULL),
(136,'http://www.biqiuge.com/book/484/','燃烧的莫斯科',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/484/',NULL,'http://www.biqiuge.com/book/484/',NULL,'2019-05-01 11:09:25','2019-05-01 11:09:25',NULL),
(137,'http://www.biqiuge.com/book/457/','权力巅峰',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/457/',NULL,'http://www.biqiuge.com/book/457/',NULL,'2019-05-01 11:09:25','2019-05-01 11:09:25',NULL),
(138,'http://www.biqiuge.com/book/445/','超级创作大师',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/445/',NULL,'http://www.biqiuge.com/book/445/',NULL,'2019-05-01 11:09:26','2019-05-01 11:09:26',NULL),
(139,'http://www.biqiuge.com/book/482/','盛嫁',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/482/',NULL,'http://www.biqiuge.com/book/482/',NULL,'2019-05-01 11:09:26','2019-05-01 11:09:26',NULL),
(140,'http://www.biqiuge.com/book/418/','人族训练场',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/418/',NULL,'http://www.biqiuge.com/book/418/',NULL,'2019-05-01 11:09:26','2019-05-01 11:09:26',NULL),
(141,'http://www.biqiuge.com/book/405/','超品透视',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/405/',NULL,'http://www.biqiuge.com/book/405/',NULL,'2019-05-01 11:09:26','2019-05-01 11:09:26',NULL),
(142,'http://www.biqiuge.com/book/421/','随身带着星际争霸',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/421/',NULL,'http://www.biqiuge.com/book/421/',NULL,'2019-05-01 11:09:27','2019-05-01 11:09:27',NULL),
(143,'http://www.biqiuge.com/book/378/','青帝',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/378/',NULL,'http://www.biqiuge.com/book/378/',NULL,'2019-05-01 11:09:27','2019-05-01 11:09:27',NULL),
(144,'http://www.biqiuge.com/book/408/','草根石布衣',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/408/',NULL,'http://www.biqiuge.com/book/408/',NULL,'2019-05-01 11:09:27','2019-05-01 11:09:27',NULL),
(145,'http://www.biqiuge.com/book/402/','鼎定仙域',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/402/',NULL,'http://www.biqiuge.com/book/402/',NULL,'2019-05-01 11:09:27','2019-05-01 11:09:27',NULL),
(146,'http://www.biqiuge.com/book/374/','寒门状元',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/374/',NULL,'http://www.biqiuge.com/book/374/',NULL,'2019-05-01 11:09:28','2019-05-01 11:09:28',NULL),
(147,'http://www.biqiuge.com/book/427/','执掌乾坤',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/427/',NULL,'http://www.biqiuge.com/book/427/',NULL,'2019-05-01 11:09:28','2019-05-01 11:09:28',NULL),
(148,'http://www.biqiuge.com/book/436/','魔尊重生传',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/436/',NULL,'http://www.biqiuge.com/book/436/',NULL,'2019-05-01 11:09:28','2019-05-01 11:09:28',NULL),
(149,'http://www.biqiuge.com/book/342/','武神风暴',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/342/',NULL,'http://www.biqiuge.com/book/342/',NULL,'2019-05-01 11:09:28','2019-05-01 11:09:28',NULL),
(150,'http://www.biqiuge.com/book/415/','沧狼行',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/415/',NULL,'http://www.biqiuge.com/book/415/',NULL,'2019-05-01 11:09:29','2019-05-01 11:09:29',NULL),
(151,'http://www.biqiuge.com/book/475/','特种神医',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/475/',NULL,'http://www.biqiuge.com/book/475/',NULL,'2019-05-01 11:09:29','2019-05-01 11:09:29',NULL),
(152,'http://www.biqiuge.com/book/414/','我为王',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/414/',NULL,'http://www.biqiuge.com/book/414/',NULL,'2019-05-01 11:09:29','2019-05-01 11:09:29',NULL),
(153,'http://www.biqiuge.com/book/356/','网游之梦幻法师',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/356/',NULL,'http://www.biqiuge.com/book/356/',NULL,'2019-05-01 11:09:30','2019-05-01 11:09:30',NULL),
(154,'http://www.biqiuge.com/book/420/','龙王传说',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/420/',NULL,'http://www.biqiuge.com/book/420/',NULL,'2019-05-01 11:09:30','2019-05-01 11:09:30',NULL),
(155,'http://www.biqiuge.com/book/489/','武灵天下',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/489/',NULL,'http://www.biqiuge.com/book/489/',NULL,'2019-05-01 11:09:30','2019-05-01 11:09:30',NULL),
(156,'http://www.biqiuge.com/book/406/','不败升级',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/406/',NULL,'http://www.biqiuge.com/book/406/',NULL,'2019-05-01 11:09:31','2019-05-01 11:09:31',NULL),
(157,'http://www.biqiuge.com/book/447/','蛊真人',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/447/',NULL,'http://www.biqiuge.com/book/447/',NULL,'2019-05-01 11:09:33','2019-05-01 11:09:33',NULL),
(158,'http://www.biqiuge.com/book/410/','韩娱之星光灿烂',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/410/',NULL,'http://www.biqiuge.com/book/410/',NULL,'2019-05-01 11:09:33','2019-05-01 11:09:33',NULL),
(159,'http://www.biqiuge.com/book/444/','三国重生马孟起',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/444/',NULL,'http://www.biqiuge.com/book/444/',NULL,'2019-05-01 11:09:34','2019-05-01 11:09:34',NULL),
(160,'http://www.biqiuge.com/book/416/','泡妞低手',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/416/',NULL,'http://www.biqiuge.com/book/416/',NULL,'2019-05-01 11:09:35','2019-05-01 11:09:35',NULL),
(161,'http://www.biqiuge.com/book/403/','帝灭苍穹',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/403/',NULL,'http://www.biqiuge.com/book/403/',NULL,'2019-05-01 11:09:37','2019-05-01 11:09:37',NULL),
(162,'http://www.biqiuge.com/book/473/','最强兵王',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/473/',NULL,'http://www.biqiuge.com/book/473/',NULL,'2019-05-01 11:09:39','2019-05-01 11:09:39',NULL),
(163,'http://www.biqiuge.com/book/431/','乾坤剑神',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/431/',NULL,'http://www.biqiuge.com/book/431/',NULL,'2019-05-01 11:09:42','2019-05-01 11:09:42',NULL),
(164,'http://www.biqiuge.com/book/474/','修罗武神',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/474/',NULL,'http://www.biqiuge.com/book/474/',NULL,'2019-05-01 11:09:45','2019-05-01 11:09:45',NULL),
(165,'http://www.biqiuge.com/book/429/','战气凌霄',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/429/',NULL,'http://www.biqiuge.com/book/429/',NULL,'2019-05-01 11:09:47','2019-05-01 11:09:47',NULL),
(166,'http://www.biqiuge.com/book/357/','官道无疆',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/357/',NULL,'http://www.biqiuge.com/book/357/',NULL,'2019-05-01 11:09:50','2019-05-01 11:09:50',NULL),
(167,'http://www.biqiuge.com/book/392/','花间高手',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/392/',NULL,'http://www.biqiuge.com/book/392/',NULL,'2019-05-01 11:09:59','2019-05-01 11:09:59',NULL),
(168,'http://www.biqiuge.com/book/393/','我的贴身校花',NULL,NULL,NULL,NULL,NULL,'http://www.biqiuge.com/book/393/',NULL,'http://www.biqiuge.com/book/393/',NULL,'2019-05-01 11:10:10','2019-05-01 11:10:10',NULL);

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
