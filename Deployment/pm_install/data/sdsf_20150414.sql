CREATE DATABASE  IF NOT EXISTS `dis_sdsf` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `dis_sdsf`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: 192.168.12.214    Database: dis_sdsf
-- ------------------------------------------------------
-- Server version	5.5.28-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `SYS_LOG`
--

DROP TABLE IF EXISTS `SYS_LOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SYS_LOG` (
  `THREAD_NAME` varchar(50) DEFAULT '',
  `LOGGER_NAME` varchar(50) DEFAULT NULL,
  `LOG_TIME` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `LOG_LEVEL` varchar(50) DEFAULT NULL,
  `MESSAGE` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SYS_LOG`
--

LOCK TABLES `SYS_LOG` WRITE;
/*!40000 ALTER TABLE `SYS_LOG` DISABLE KEYS */;
/*!40000 ALTER TABLE `SYS_LOG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deviceServicelog`
--

DROP TABLE IF EXISTS `deviceServicelog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deviceServicelog` (
  `datetime` varchar(255) NOT NULL DEFAULT '',
  `classname` varchar(255) DEFAULT NULL,
  `method` varchar(255) DEFAULT NULL,
  `leavel` varchar(25) DEFAULT NULL,
  `log_msg` longtext,
  PRIMARY KEY (`datetime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deviceServicelog`
--

LOCK TABLES `deviceServicelog` WRITE;
/*!40000 ALTER TABLE `deviceServicelog` DISABLE KEYS */;
/*!40000 ALTER TABLE `deviceServicelog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logging_event`
--

DROP TABLE IF EXISTS `logging_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logging_event` (
  `timestmp` bigint(20) NOT NULL,
  `formatted_message` text NOT NULL,
  `logger_name` varchar(254) NOT NULL,
  `level_string` varchar(254) NOT NULL,
  `thread_name` varchar(254) DEFAULT NULL,
  `reference_flag` smallint(6) DEFAULT NULL,
  `arg0` varchar(254) DEFAULT NULL,
  `arg1` varchar(254) DEFAULT NULL,
  `arg2` varchar(254) DEFAULT NULL,
  `arg3` varchar(254) DEFAULT NULL,
  `caller_filename` varchar(254) NOT NULL,
  `caller_class` varchar(254) NOT NULL,
  `caller_method` varchar(254) NOT NULL,
  `caller_line` char(4) NOT NULL,
  `event_id` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`event_id`)
) ENGINE=InnoDB AUTO_INCREMENT=461023 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logging_event`
--

LOCK TABLES `logging_event` WRITE;
/*!40000 ALTER TABLE `logging_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `logging_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logging_event_exception`
--

DROP TABLE IF EXISTS `logging_event_exception`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logging_event_exception` (
  `event_id` bigint(20) NOT NULL,
  `i` smallint(6) NOT NULL,
  `trace_line` varchar(254) NOT NULL,
  PRIMARY KEY (`event_id`,`i`),
  CONSTRAINT `logging_event_exception_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `logging_event` (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logging_event_exception`
--

LOCK TABLES `logging_event_exception` WRITE;
/*!40000 ALTER TABLE `logging_event_exception` DISABLE KEYS */;
/*!40000 ALTER TABLE `logging_event_exception` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logging_event_property`
--

DROP TABLE IF EXISTS `logging_event_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logging_event_property` (
  `event_id` bigint(20) NOT NULL,
  `mapped_key` varchar(254) NOT NULL,
  `mapped_value` text,
  PRIMARY KEY (`event_id`,`mapped_key`),
  CONSTRAINT `logging_event_property_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `logging_event` (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logging_event_property`
--

LOCK TABLES `logging_event_property` WRITE;
/*!40000 ALTER TABLE `logging_event_property` DISABLE KEYS */;
/*!40000 ALTER TABLE `logging_event_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `range_scope`
--

DROP TABLE IF EXISTS `range_scope`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `range_scope` (
  `id` char(36) NOT NULL,
  `rangeid` char(36) NOT NULL DEFAULT '' COMMENT '范围名称ID',
  `isChecked` char(5) NOT NULL COMMENT '用于判断是否被选择:true为选中',
  `scopeid` char(36) NOT NULL COMMENT '范围的内容ID',
  `scopename` varchar(50) DEFAULT NULL,
  `scopetype` char(36) DEFAULT NULL COMMENT '范围的内容类型2：和教室区域关联 1:和班级关联  2',
  `createdate` datetime DEFAULT NULL,
  `createuser` char(36) DEFAULT NULL,
  `modifydate` datetime DEFAULT NULL,
  `modifyuser` char(36) DEFAULT NULL,
  `deleteflag` char(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `range_scope`
--

LOCK TABLES `range_scope` WRITE;
/*!40000 ALTER TABLE `range_scope` DISABLE KEYS */;
/*!40000 ALTER TABLE `range_scope` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_code`
--

DROP TABLE IF EXISTS `sys_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_code` (
  `id` char(36) NOT NULL DEFAULT '' COMMENT '分类ID',
  `parentid` char(36) NOT NULL DEFAULT '' COMMENT '所属类别上级ID,最高级为1，1可以有多个',
  `NAME` varchar(100) NOT NULL DEFAULT '' COMMENT '分类名称',
  `SHORTNAME` varchar(50) DEFAULT NULL COMMENT '分类短名称',
  `value` varchar(50) DEFAULT NULL COMMENT '分类value',
  `SORT` int(10) DEFAULT '0' COMMENT '显示序号',
  `LEVEL` tinyint(4) DEFAULT NULL COMMENT '所属层',
  `CHILDCOUNT` smallint(6) DEFAULT NULL COMMENT '下属子分类数目，无子分类为0',
  `DEFAULT_VALUE` tinyint(1) DEFAULT NULL COMMENT '是否为缺省或当前,0-缺省，1-非缺省',
  `createdate` datetime DEFAULT NULL,
  `createuser` char(36) DEFAULT NULL,
  `modifydate` datetime DEFAULT NULL,
  `modifyuser` char(36) DEFAULT NULL,
  `deleteflag` char(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_code`
--

LOCK TABLES `sys_code` WRITE;
/*!40000 ALTER TABLE `sys_code` DISABLE KEYS */;
INSERT INTO `sys_code` VALUES ('007ee1f0be8c418f996a0cff5e652a7e','7d5e94e79dd14d0e9d0911137019aaaa','SDI',NULL,'6',7,NULL,NULL,NULL,NULL,'cwx','2014-11-25 14:19:54','admin','0'),('00801e1d4ae6445287f0c58219f36f9a','ac8fb0098dc64c9ca1dc79483cdbaace','50000',NULL,'51200000',0,NULL,NULL,NULL,NULL,'cwx','2014-11-25 15:01:59','admin','0'),('00b5ab2a19ec4890b236dc9cc21b0208','1','反交错启用',NULL,'backEnable',0,NULL,NULL,NULL,NULL,'cwx','2014-11-26 16:46:40','admin','0'),('00bbf5f2ffdb44e1b6b1cb975bda39ed','1','菜单2',NULL,NULL,0,NULL,NULL,NULL,NULL,'cwx','2014-11-03 14:16:04','cwx','1'),('00bef6828ce64bec8967e884e3fd7d0c','67e89e0ce5e249a7870462fed631ed05','学生',NULL,'card2',3,NULL,NULL,NULL,'2014-12-29 13:43:09','admin','2014-12-31 15:44:11','admin','0'),('00d503de50624fadba222c06c510b236','67e89e0ce5e249a7870462fed631ed05','教师全景',NULL,'card1',2,NULL,NULL,NULL,'2014-12-29 13:42:55','admin','2015-01-15 14:19:57','admin','1'),('021207677eec47f486c5d0875d810835','6d2a66728ed34597b61acd0bab01e300','NVIDIA_CUDA',NULL,'3',3,NULL,NULL,NULL,NULL,'cwx','2014-11-25 15:00:43','admin','0'),('02a17740779440a98f9ae581a8ba268e','358e5171cd9a4cb497419e15699a0bc0','2',NULL,'2',1,NULL,NULL,NULL,'2014-11-26 15:31:18','admin','2014-11-26 15:45:09','admin','1'),('0579378a9731422289c6511520225826','065d0e28a2b8448eb1eede75f3a17987','1024*768',NULL,'1024*768',4,NULL,NULL,NULL,NULL,'cwx','2014-11-25 14:57:18','admin','0'),('06272d35ad1947f08f7a6e4eed3bee21','efdf99c05cf447e28b89f9ded15da888','1024*576',NULL,'1024*576',3,NULL,NULL,NULL,NULL,'cwx','2014-11-25 14:30:23','admin','0'),('065d0e28a2b8448eb1eede75f3a17987','1','电影分辨率',NULL,'movieResoluation',0,NULL,NULL,NULL,NULL,'cwx','2014-11-27 09:43:17','admin','0'),('06a0a29d418d4719880d70f99ed28b1c','a57dc2c6fcc4434eabda1d0cfc7d087d','rtsp方案三',NULL,'3',3,NULL,NULL,NULL,'2014-11-25 14:49:20','admin',NULL,NULL,'0'),('06bd5ff6f4ac4b479efc93a685055f10','1','机构分类1',NULL,NULL,0,NULL,NULL,NULL,NULL,'cwx','2014-11-05 17:46:56','cwx','1'),('07d928f7750f441a9d26eed6f9268021','065d0e28a2b8448eb1eede75f3a17987','1024*576',NULL,'1024*576',5,NULL,NULL,NULL,NULL,'cwx','2014-11-25 14:57:14','admin','0'),('09865bc510084d83837bfeae9dc91730','1','12',NULL,NULL,0,NULL,NULL,NULL,NULL,'cwx','2014-11-02 18:25:23','cwx','1'),('0ad2f22e715d40718f619f1c38cdb7c8','c681c6205d4e4bbbbceead2a78e96102','分发服务器',NULL,'3',NULL,NULL,NULL,NULL,'2015-01-15 17:07:53','admin',NULL,NULL,'0'),('0d01edab765b4578909416e67374f3b5','1','测试',NULL,NULL,2,NULL,NULL,NULL,NULL,'cwx','2014-11-07 11:55:38','cwx','1'),('0e463e53ea8d43ceb3e8ffcbfd3e05a0','10','测试1',NULL,NULL,0,NULL,NULL,NULL,NULL,'cwx','2014-11-03 14:50:56','cwx','1'),('0f602269affe470d9f772ede86e5dfa0','88ad2499f49a44c59cabd3922e2883af','LEVEL_22',NULL,'22',22,NULL,NULL,NULL,NULL,'cwx','2014-11-25 14:40:45','admin','0'),('1','0','系统数据字典',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,'2014-11-03 15:05:09','cwx','0'),('10','1','设备类型',NULL,'deviceType',0,NULL,NULL,NULL,NULL,NULL,'2014-12-03 11:52:41','admin','0'),('10a5059ca59144a79cf2e63fa9611ef3','1','4',NULL,NULL,0,NULL,NULL,NULL,NULL,'cwx','2014-11-03 13:55:07','cwx','1'),('11','10','录播机',NULL,'1',1,NULL,NULL,NULL,NULL,NULL,'2014-12-03 11:53:53','admin','0'),('1174495c4016415eb49f7c667e31800c','81a2e1309f474e56b71c498d9dfe3ae4','否',NULL,'false',1,NULL,NULL,NULL,'2014-11-25 14:33:29','admin','2014-12-03 12:01:40','admin','1'),('12','10','中控设备',NULL,'2',2,NULL,NULL,NULL,NULL,NULL,'2014-12-03 11:53:48','admin','0'),('1277e9651ed84efbb8e9c61f0444cf7e','a5c97a4e08f14d2e9e54872ae4bf80d4','4*4',NULL,'16',3,NULL,NULL,NULL,'2014-12-29 13:42:16','admin','2015-01-16 10:33:45','admin','1'),('12fa744dd6e34103a40ad11417ba3ea3','10','6',NULL,NULL,0,NULL,NULL,NULL,NULL,'cwx','2014-11-03 14:50:47','cwx','1'),('13','10','大屏',NULL,'3',3,NULL,NULL,NULL,NULL,NULL,'2014-12-03 11:54:03','admin','0'),('13968b54abd84afdbd47df2e53d0eeee','1','格式',NULL,'format',0,NULL,NULL,NULL,NULL,'cwx','2014-11-26 18:26:32','admin','0'),('14','1','机构属性',NULL,'institution',0,NULL,NULL,NULL,NULL,NULL,'2014-12-03 12:01:17','admin','0'),('15','14','同名',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,'2014-11-18 17:46:50','cwx','1'),('15e138e7163b4d39b499d664a259e04b','c439c5a9873a44aca13ced29a508c5c8','教案',NULL,'1',1,NULL,NULL,NULL,'2015-01-09 11:30:04','admin',NULL,NULL,'0'),('16','14','年级',NULL,'1',1,NULL,NULL,NULL,NULL,NULL,'2014-12-03 11:57:11','admin','0'),('17','14','班级',NULL,'2',2,NULL,NULL,NULL,NULL,NULL,'2014-12-03 11:57:16','admin','0'),('175bb85fffdc4ff899bf7df2dd2c13ee','73eb558bcc6d42459dbb80a67980bac2','COMPLEXITY_5',NULL,'5',5,NULL,NULL,NULL,NULL,'cwx','2014-11-25 14:54:45','admin','0'),('19','1','系统状态',NULL,'status',0,NULL,NULL,NULL,NULL,NULL,'2014-12-03 11:57:45','admin','0'),('1907e8d38b40434c951b62e14a0fc5c6','00b5ab2a19ec4890b236dc9cc21b0208','非',NULL,'3',1,NULL,NULL,NULL,'2014-11-21 15:29:39','admin','2014-11-25 14:15:00','admin','1'),('1aa63ed40dca4f3d86294ab2e938969f','1','112',NULL,NULL,0,NULL,NULL,NULL,NULL,'cwx','2014-11-02 18:22:13','cwx','1'),('1c5f31c0bb1e421898fd0683bb67b8db','73eb558bcc6d42459dbb80a67980bac2','COMPLEXITY_6',NULL,'6',6,NULL,NULL,NULL,NULL,'cwx','2014-11-25 14:54:50','admin','0'),('1df480279dba40d0a1d2a34ff1e1aa69','1','阶段',NULL,'grade',NULL,NULL,NULL,NULL,'2015-01-09 11:26:50','admin',NULL,NULL,'0'),('1fd481da3cb245dfbe7b5600e860e652','c681c6205d4e4bbbbceead2a78e96102','转码服务器',NULL,'2',2,NULL,NULL,NULL,'2015-01-15 17:08:34','admin','2015-01-15 17:08:43','admin','0'),('2','1','状态',NULL,'state',0,NULL,NULL,NULL,NULL,NULL,'2014-12-02 15:07:43','admin','0'),('20','19','有效',NULL,'0',0,NULL,NULL,NULL,NULL,NULL,'2014-11-25 14:58:54','admin','0'),('20ba577770234050ac8ffe49a4759325','1','采集卡类型',NULL,'cardType',0,NULL,NULL,NULL,NULL,'cwx','2014-11-26 16:46:16','admin','0'),('21','19','无效',NULL,'1',1,NULL,NULL,NULL,NULL,NULL,'2014-11-25 14:59:00','admin','0'),('2180730743ae4099b33c4fbb6cf2951a','00b5ab2a19ec4890b236dc9cc21b0208','2*2',NULL,'4',1,NULL,NULL,NULL,'2014-12-29 13:40:02','admin',NULL,NULL,'0'),('22','1','设备状态',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,'2014-10-30 17:52:35','cwx','0'),('22d24f4722cd485ebdf05a3cabf04119','1','测试',NULL,NULL,0,NULL,NULL,NULL,NULL,'cwx','2014-11-06 09:57:49','cwx','1'),('22f9858d73624f9ebe4a5545401ea666','065d0e28a2b8448eb1eede75f3a17987','1280*1024',NULL,'1280*1024',2,NULL,NULL,NULL,NULL,'cwx','2014-11-25 14:57:28','admin','0'),('23','22','在线',NULL,'0',0,NULL,NULL,NULL,NULL,NULL,'2014-12-17 15:54:40','admin','0'),('24','22','离线',NULL,'1',1,NULL,NULL,NULL,NULL,NULL,'2014-12-17 15:54:47','admin','0'),('25','1','性别',NULL,'sex',0,NULL,NULL,NULL,NULL,NULL,'2014-11-26 15:28:43','admin','0'),('251130f534ce42358626dd4d5ea8d667','430cc2e7d738423390ed0fcc8e633204','BLENDING',NULL,'0',0,NULL,NULL,NULL,NULL,'cwx','2014-11-25 14:31:00','admin','0'),('255bbdd7271445caa27a7ff668771987','22d24f4722cd485ebdf05a3cabf04119','22',NULL,NULL,0,NULL,NULL,NULL,NULL,'cwx','2014-11-06 09:57:49','cwx','1'),('26','25','未填',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,'2014-11-04 19:13:31','cwx','1'),('27','25','男',NULL,'0',0,NULL,NULL,NULL,NULL,NULL,'2014-11-25 14:59:39','admin','0'),('27972c6916f7460ab96103814d45174c','065d0e28a2b8448eb1eede75f3a17987','800*600',NULL,'800*600',7,NULL,NULL,NULL,NULL,'cwx','2014-11-25 14:57:00','admin','0'),('28','25','女',NULL,'1',1,NULL,NULL,NULL,NULL,NULL,'2014-11-25 14:59:44','admin','0'),('29','1','菜单分类',NULL,'menu',0,NULL,NULL,NULL,NULL,NULL,'2014-12-03 11:58:58','admin','0'),('296d4101d4724035a2d58fdc6f19a73a','7d5e94e79dd14d0e9d0911137019aaaa','DVI_D',NULL,'3',4,NULL,NULL,NULL,NULL,'cwx','2014-11-25 14:25:06','admin','0'),('2a49b634df144ea7a946a09cc399fd20','d5bf57476d02487dbb19055b6a208cbe','语文',NULL,'1',1,NULL,NULL,NULL,'2015-01-09 11:29:06','admin',NULL,NULL,'0'),('2b17e01b5e414249bbb1781d8935cb44','10','12',NULL,NULL,0,NULL,NULL,NULL,NULL,'cwx','2014-11-03 14:50:29','cwx','1'),('2b9515bfd7b1420f803b6976a41de5a4','36','部门',NULL,NULL,0,NULL,NULL,NULL,NULL,'cwx','2014-12-03 12:01:08','admin','1'),('2c94e6e5c077442e9a838d2cb6a023d4','88ad2499f49a44c59cabd3922e2883af','LEVEL_41',NULL,'41',41,NULL,NULL,NULL,NULL,'cwx','2014-11-25 14:41:54','admin','0'),('2d6bcaeef53349faae0dbf412a1f3b4a','1','轮巡模式',NULL,'RoundType',1,NULL,NULL,NULL,'2015-01-09 11:23:06','admin',NULL,NULL,'0'),('2ea9f6558be74921a7bb39ba4eed75d3','73eb558bcc6d42459dbb80a67980bac2','COMPLEXITY_3',NULL,'3',3,NULL,NULL,NULL,NULL,'cwx','2014-11-25 14:54:55','admin','0'),('2f2c2d6043514c1182afcdd363ec913e','4b2247067eed4ba18924366399fb0e29','9',NULL,'9',9,NULL,NULL,NULL,NULL,'cwx','2014-11-25 14:52:49','admin','0'),('3','2','可用',NULL,'0',0,NULL,NULL,NULL,NULL,NULL,'2014-11-25 14:59:13','admin','0'),('30','29','菜单',NULL,'menu',1,NULL,NULL,NULL,NULL,NULL,'2014-12-03 11:59:06','admin','0'),('31','29','按钮',NULL,'button',2,NULL,NULL,NULL,NULL,NULL,'2014-12-03 11:59:14','admin','0'),('31e8d6616df24a9a8bfed25ec10f7b76','88ad2499f49a44c59cabd3922e2883af','LEVEL_5',NULL,'50',50,NULL,NULL,NULL,NULL,'cwx','2014-11-25 14:42:00','admin','0'),('32','1','录像模式',NULL,'recordType',0,NULL,NULL,NULL,NULL,NULL,'2014-12-03 11:59:28','admin','0'),('328b2e449da24afdaa8baa5fdef41a32','67e89e0ce5e249a7870462fed631ed05','学生全景',NULL,'card4',5,NULL,NULL,NULL,'2014-12-29 13:43:23','admin','2015-01-15 14:19:54','admin','1'),('33','32','电影',NULL,'33',1,NULL,NULL,NULL,NULL,NULL,'2015-01-19 18:04:13','admin','1'),('34','32','资源',NULL,'34',2,NULL,NULL,NULL,NULL,NULL,'2015-01-12 17:24:14','admin','0'),('35','32','电影+资源',NULL,'35',3,NULL,NULL,NULL,NULL,NULL,'2015-01-19 18:04:16','admin','1'),('3528e2f774ab42a5ab416e567f71cb3c','1','3',NULL,NULL,0,NULL,NULL,NULL,NULL,'cwx','2014-11-02 18:24:19','cwx','1'),('358e5171cd9a4cb497419e15699a0bc0','1','测试',NULL,'s',1,NULL,NULL,NULL,'2014-11-26 15:29:20','admin','2014-11-26 15:45:09','admin','1'),('35c2d88ba91144a5834f22d6ad502130','c681c6205d4e4bbbbceead2a78e96102','中继服务器',NULL,'4',NULL,NULL,NULL,NULL,'2015-01-15 17:08:04','admin',NULL,NULL,'0'),('36','1','机构属性',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,'2014-12-03 12:01:08','admin','1'),('37','36','小学',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,'2014-12-03 12:01:08','admin','1'),('38','36','初中',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,'2014-12-03 12:01:08','admin','1'),('386b19c7bc62424c9ee2383b09160709','eebbb7b57c0e4bc1a43abdc58b788eeb','录像方案三',NULL,'3',3,NULL,NULL,NULL,'2014-11-25 14:47:30','admin',NULL,NULL,'0'),('38d86224e4aa44ba8932ee1c08fca326','73eb558bcc6d42459dbb80a67980bac2','COMPLEXITY_2',NULL,'2',2,NULL,NULL,NULL,NULL,'cwx','2014-11-25 14:55:00','admin','0'),('39','36','高中',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,'2014-12-03 12:01:08','admin','1'),('39902caec2ea4eed905ec0d31bcdb938','1','年龄',NULL,NULL,13,NULL,NULL,NULL,NULL,'cwx','2014-12-03 12:03:00','admin','1'),('39ab1da32dca45858a20e64a832df70a','67e89e0ce5e249a7870462fed631ed05','VGA',NULL,'card4',4,NULL,NULL,NULL,'2014-12-29 13:43:37','admin','2015-01-15 19:06:52','admin','0'),('39df0126d0584951bc7afc28b343e3df','eebbb7b57c0e4bc1a43abdc58b788eeb','录像方案二',NULL,'2',2,NULL,NULL,NULL,'2014-11-25 14:47:20','admin',NULL,NULL,'0'),('3a561c3ebb134d7c897a6d5be1c93fdf','4b2247067eed4ba18924366399fb0e29','6',NULL,'6',6,NULL,NULL,NULL,NULL,'cwx','2014-11-25 14:53:14','admin','0'),('3aad8b9ca4864c29abf970f28583aabc','88ad2499f49a44c59cabd3922e2883af','LEVEL_12',NULL,'12',12,NULL,NULL,NULL,NULL,'cwx','2014-11-25 14:42:03','admin','0'),('3e2a512a58ec481d876a104c1e809bc8','9d1ec709480c4f35805808d4a95eea39','HARDWARE',NULL,'1',1,NULL,NULL,NULL,NULL,'cwx','2014-11-25 15:01:11','admin','0'),('3fbaf6629c8b496a95e52ca629094cf5','1df480279dba40d0a1d2a34ff1e1aa69','初中',NULL,'2',2,NULL,NULL,NULL,'2015-01-09 11:28:25','admin','2015-01-09 11:28:41','admin','0'),('4','2','停用',NULL,'1',1,NULL,NULL,NULL,NULL,NULL,'2014-12-03 11:57:53','admin','0'),('40','36','区教委',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,'2014-12-03 12:01:08','admin','1'),('40301d01a39449efbed65003fc58bdb8','8aa04032117045f7b2eae6b80b459947','6',NULL,'6',6,NULL,NULL,NULL,NULL,'cwx','2014-11-25 14:49:48','admin','0'),('407f495a477a4ae4b5100b4efee22523','13968b54abd84afdbd47df2e53d0eeee','FLV',NULL,'FLV',1,NULL,NULL,NULL,NULL,'cwx','2014-11-25 15:05:40','admin','0'),('420f2d6f5d2e4582afbdf58d69a08bbe','14','级部',NULL,'3',3,NULL,NULL,NULL,NULL,'cwx','2015-01-26 11:04:31','admin','0'),('430cc2e7d738423390ed0fcc8e633204','1','反交错类型',NULL,'backType',0,NULL,NULL,NULL,NULL,'cwx','2014-11-26 16:47:02','admin','0'),('4366869d61594335afb42c76a1c3da34','1','设备类型',NULL,NULL,0,NULL,NULL,NULL,NULL,'cwx','2014-11-19 09:35:26','cwx','1'),('44c753a3471348fe8cd649e28faee923','358e5171cd9a4cb497419e15699a0bc0','3',NULL,'2',1,NULL,NULL,NULL,'2014-11-26 15:31:29','admin','2014-11-26 15:45:09','admin','1'),('44d6062bb5c3498ba8b5ef2ecbed8c92','d20987a74f9347a2a34acf400580af7c','老师',NULL,'1',1,NULL,NULL,NULL,NULL,'cwx','2014-11-25 15:07:26','admin','0'),('44f30159d15e427da6d8c426a98ff3c3','9d1ec709480c4f35805808d4a95eea39','NVIDIA_CUDA',NULL,'3',3,NULL,NULL,NULL,NULL,'cwx','2014-11-25 15:01:16','admin','0'),('455a24848a824815af3eaf276653bf10','8aa04032117045f7b2eae6b80b459947','2',NULL,'2',2,NULL,NULL,NULL,NULL,'cwx','2014-11-25 14:49:43','admin','0'),('45835cb52b3042c6a949a53c6b894198','ac8fb0098dc64c9ca1dc79483cdbaace','12000',NULL,'12288000',4,NULL,NULL,NULL,NULL,'cwx','2014-11-25 15:03:02','admin','0'),('4761d8e9f4dd438787e268dae736d302','8aa04032117045f7b2eae6b80b459947','4',NULL,'4',4,NULL,NULL,NULL,NULL,'cwx','2014-11-25 14:50:11','admin','0'),('485f3335672f4e4aa94bd28e20effdbe','ac8fb0098dc64c9ca1dc79483cdbaace','16000',NULL,'16384000',3,NULL,NULL,NULL,NULL,'cwx','2014-11-25 15:02:51','admin','0'),('487f490aef674b4c870a1511a1a1e678','c681c6205d4e4bbbbceead2a78e96102','存储服务器',NULL,'5',NULL,NULL,NULL,NULL,'2015-01-15 17:08:14','admin',NULL,NULL,'0'),('4b2247067eed4ba18924366399fb0e29','1','物理地址配置',NULL,'address',0,NULL,NULL,NULL,NULL,'cwx','2014-11-26 16:46:02','admin','0'),('4c8b016576504a5b89676faa4fb5a936','73eb558bcc6d42459dbb80a67980bac2','COMPLEXITY_4',NULL,'4',4,NULL,NULL,NULL,NULL,'cwx','2014-11-25 14:55:04','admin','0'),('4d0bf0a6b333411a9e8451ae97bb4b56','a57dc2c6fcc4434eabda1d0cfc7d087d','rtsp方案二',NULL,'2',2,NULL,NULL,NULL,'2014-11-25 14:48:12','admin',NULL,NULL,'0'),('4e033ca4c8f14ca7a0815a3b19e45389','00b5ab2a19ec4890b236dc9cc21b0208','非',NULL,'2',1,NULL,NULL,NULL,'2014-11-21 15:26:42','admin','2014-11-21 15:26:59','admin','1'),('5','1','消息分类',NULL,'message',0,NULL,NULL,NULL,NULL,NULL,'2014-12-03 11:50:10','admin','0'),('502282884fb94f7fb56c592a8cc32ae1','ac8fb0098dc64c9ca1dc79483cdbaace','450',NULL,'460800',12,NULL,NULL,NULL,NULL,'cwx','2014-11-25 15:04:47','admin','0'),('522a40e743aa4d209504e840ef93e46c','1','3222',NULL,NULL,0,NULL,NULL,NULL,NULL,'cwx','2014-11-02 18:24:25','cwx','1'),('52d0b254a70d4ed8a6cdda29c31ea2b3','ac8fb0098dc64c9ca1dc79483cdbaace','1000',NULL,'1024000',10,NULL,NULL,NULL,NULL,'cwx','2014-11-25 15:04:24','admin','0'),('5378c44c22b747efad6053575a72b731','73eb558bcc6d42459dbb80a67980bac2','COMPLEXITY_7',NULL,'7',7,NULL,NULL,NULL,NULL,'cwx','2014-11-25 14:55:09','admin','0'),('56b4bccb2a01472aa2abb41ae697acb4','c439c5a9873a44aca13ced29a508c5c8','其它',NULL,'9',9,NULL,NULL,NULL,'2015-01-09 11:30:27','admin',NULL,NULL,'0'),('56e6406e144c4aedbac97de9f3435bd6','7d5e94e79dd14d0e9d0911137019aaaa','COMPOSITE',NULL,'0',2,NULL,NULL,NULL,NULL,'cwx','2014-11-25 14:23:46','admin','0'),('5960df00b9a1411098406b1d203de70f','9d1ec709480c4f35805808d4a95eea39','SOFTWARE',NULL,'0',0,NULL,NULL,NULL,NULL,'cwx','2014-11-25 14:35:44','admin','0'),('5990fc699ee34e9b8b14c0aca757c865','1','RecordProfile',NULL,'recordProfile',0,NULL,NULL,NULL,NULL,'cwx','2014-11-26 18:22:55','admin','0'),('5a6ccfefbfc94d5c9e0f6f7b12593486','88ad2499f49a44c59cabd3922e2883af','LEVEL_4',NULL,'40',40,NULL,NULL,NULL,NULL,'cwx','2014-11-25 14:42:08','admin','0'),('5a6dbf78be67485cb2955528ea979e80','ac8fb0098dc64c9ca1dc79483cdbaace','150',NULL,'153600',10,NULL,NULL,NULL,'2014-12-15 12:13:28','admin',NULL,NULL,'0'),('5bcacdd59ae645099f89fc5a82940105','67e89e0ce5e249a7870462fed631ed05','板书',NULL,'card5',6,NULL,NULL,NULL,'2014-12-29 13:43:50','admin','2015-01-15 14:19:52','admin','1'),('5bd2b2a127cc4bfbacce2af1b0f22335','88ad2499f49a44c59cabd3922e2883af','LEVEL_21',NULL,'21',21,NULL,NULL,NULL,NULL,'cwx','2014-11-25 14:41:50','admin','0'),('5c4ecf541bbb4e9b91a6e56f94019740','358e5171cd9a4cb497419e15699a0bc0','23',NULL,'3',1,NULL,NULL,NULL,'2014-11-26 15:36:58','admin','2014-11-26 15:45:09','admin','1'),('5cc8685038964d73818fb06b2c11182b','d5bf57476d02487dbb19055b6a208cbe','英语',NULL,'3',3,NULL,NULL,NULL,'2015-01-09 11:29:23','admin',NULL,NULL,'0'),('5dce234542624c7d819a48955caf55f3','4b2247067eed4ba18924366399fb0e29','4',NULL,'4',4,NULL,NULL,NULL,NULL,'cwx','2014-11-25 14:53:18','admin','0'),('5fdd96ab9f96462aa9ffbc2ba7987ad1','1','GOP',NULL,NULL,0,NULL,NULL,NULL,NULL,'cwx','2014-11-18 17:48:11','cwx','1'),('6','5','系统消息',NULL,'1',1,NULL,NULL,NULL,NULL,NULL,'2014-11-25 15:06:43','admin','0'),('6032cfbceb4d41e3b2545022f4f3caa6','efdf99c05cf447e28b89f9ded15da888','960*540',NULL,'960*540',4,NULL,NULL,NULL,NULL,'cwx','2014-11-25 14:30:27','admin','0'),('63b4f49e62024be48391f6ed781bd741','a57dc2c6fcc4434eabda1d0cfc7d087d','rtsp默认方案',NULL,'1',1,NULL,NULL,NULL,'2014-11-25 14:48:01','admin',NULL,NULL,'0'),('650b53cf5bb04e1590bd9c364f852820','88ad2499f49a44c59cabd3922e2883af','LEVEL_42',NULL,'42',42,NULL,NULL,NULL,NULL,'cwx','2014-11-25 14:41:21','admin','0'),('651dae7ad967468f8fa1122d3ef7827d','88ad2499f49a44c59cabd3922e2883af','LEVEL_1B',NULL,'9',9,NULL,NULL,NULL,NULL,'cwx','2014-11-25 14:41:11','admin','0'),('65a7de451a514e53a045fa5e7a810d1d','d5bf57476d02487dbb19055b6a208cbe','数学',NULL,'2',2,NULL,NULL,NULL,'2015-01-09 11:29:15','admin',NULL,NULL,'0'),('6623316b9c924bbfb1b5184deef86194','430cc2e7d738423390ed0fcc8e633204','MOTIONAD_APTIVE',NULL,'1',1,NULL,NULL,NULL,NULL,'cwx','2014-11-25 15:00:05','admin','0'),('6647ac2a19804852ac2c4ead38629bba','00b5ab2a19ec4890b236dc9cc21b0208','是',NULL,'0',0,NULL,NULL,NULL,NULL,'cwx','2014-11-21 15:24:47','admin','0'),('67a350ead9724b7ea0be47d9780eb9d2','edecea2cdd7542b384db59750a8ad0f0','录播方案三',NULL,'3',3,NULL,NULL,NULL,'2014-11-25 14:46:57','admin',NULL,NULL,'0'),('67e89e0ce5e249a7870462fed631ed05','1','轮巡机位命名',NULL,'RoundRobin',NULL,NULL,NULL,NULL,'2014-12-29 13:41:33','admin',NULL,NULL,'0'),('68360eb695a44e4f81113c26b5bfb832','ac8fb0098dc64c9ca1dc79483cdbaace','2000',NULL,'2048000',8,NULL,NULL,NULL,NULL,'cwx','2014-11-25 15:03:53','admin','0'),('68a525ac225e483dbad5840eb7b052c6','20ba577770234050ac8ffe49a4759325','QP0203 PCI',NULL,'QP0203 PCI',0,NULL,NULL,NULL,NULL,'cwx','2014-11-25 14:32:06','admin','0'),('6d2a66728ed34597b61acd0bab01e300','1','音频编码类型',NULL,'auditCodeType',0,NULL,NULL,NULL,NULL,'cwx','2014-11-26 16:51:52','admin','0'),('6e4df5205f7b4d6ea94b81c1bdd66d6d','8aa04032117045f7b2eae6b80b459947','5',NULL,'5',5,NULL,NULL,NULL,NULL,'cwx','2014-11-25 14:49:55','admin','0'),('6fb3540d0bdb46f884db6781ec965448','67e89e0ce5e249a7870462fed631ed05','教师',NULL,'card0',1,NULL,NULL,NULL,'2014-12-29 13:42:45','admin','2014-12-31 15:43:59','admin','0'),('7','5','设备消息',NULL,'2',2,NULL,NULL,NULL,NULL,NULL,'2014-11-25 15:06:49','admin','0'),('714a522027ba40259a117f0abd37efb6','13968b54abd84afdbd47df2e53d0eeee','MP4',NULL,'MP4',2,NULL,NULL,NULL,NULL,'cwx','2014-11-25 15:05:43','admin','0'),('71dac36dfc684f36a22b428b4530efb6','1','测试中',NULL,NULL,0,NULL,NULL,NULL,NULL,'cwx','2014-11-03 15:01:41','cwx','1'),('71f37d8827cb43e789bc6cdcad4cefc3','6d2a66728ed34597b61acd0bab01e300','SOFTWARE',NULL,'0',0,NULL,NULL,NULL,NULL,'cwx','2014-11-25 14:36:39','admin','0'),('7395035ad1c04066b87e36885aa5b147','22d24f4722cd485ebdf05a3cabf04119','34',NULL,NULL,0,NULL,NULL,NULL,NULL,'cwx','2014-11-06 09:57:49','cwx','1'),('73eb558bcc6d42459dbb80a67980bac2','1','RecordComplexity',NULL,'recordComplexity',0,NULL,NULL,NULL,NULL,'cwx','2014-11-26 18:24:16','admin','0'),('748eccbcc42445ddb19b82d7073e9db6','1df480279dba40d0a1d2a34ff1e1aa69','高中',NULL,'1',1,NULL,NULL,NULL,'2015-01-09 11:28:16','admin','2015-01-09 11:28:44','admin','0'),('78453bbceb60405696068551b0cda85a','20ba577770234050ac8ffe49a4759325','FH8735 PCI',NULL,'FH8735 PCI',2,NULL,NULL,NULL,NULL,'cwx','2014-11-25 15:06:14','admin','0'),('789874b0e2f0469cac86955783a2fef4','a178e511d6034ab6b51447d9cca24d61','CABAC',NULL,'1',1,NULL,NULL,NULL,NULL,'cwx','2014-11-25 14:54:18','admin','0'),('793c7c10c3a340899e8bc20587d10215','5990fc699ee34e9b8b14c0aca757c865','BASELINE',NULL,'0',0,NULL,NULL,NULL,NULL,'cwx','2014-11-25 14:37:18','admin','0'),('7944602c8dc745588e392ddb5405f179','8aa04032117045f7b2eae6b80b459947','3',NULL,'3',3,NULL,NULL,NULL,NULL,'cwx','2014-11-25 14:50:06','admin','0'),('7966d216a05047e68cdf2ffd874ab653','ac8fb0098dc64c9ca1dc79483cdbaace','8000',NULL,'8192000',5,NULL,NULL,NULL,NULL,'cwx','2014-11-25 15:03:17','admin','0'),('7a3ededa2ae7486681ff697a7113ff87','36','专业',NULL,NULL,0,NULL,NULL,NULL,NULL,'cwx','2014-12-03 12:01:08','admin','1'),('7cd4ff4db6c746df857412781497b96d','a57dc2c6fcc4434eabda1d0cfc7d087d','rtsp方案三',NULL,'3',3,NULL,NULL,NULL,'2014-11-25 14:49:18','admin','2014-11-25 15:01:33','admin','1'),('7cd53f459a28414694bfaa9696e43ba3','1','BFrame',NULL,NULL,0,NULL,NULL,NULL,NULL,'cwx','2014-11-25 15:05:14','admin','1'),('7d5e94e79dd14d0e9d0911137019aaaa','1','视频接口类型',NULL,'videoType',0,NULL,NULL,NULL,NULL,'cwx','2014-11-26 16:49:24','admin','0'),('7e573687edb64c38a17927be4bc59cec','1df480279dba40d0a1d2a34ff1e1aa69','小学',NULL,'3',3,NULL,NULL,NULL,'2015-01-09 11:28:34','admin','2015-01-09 11:28:47','admin','0'),('7f433e7bb4ad47128b606793f6e50bd7','14','教研室',NULL,'4',4,NULL,NULL,NULL,NULL,'cwx','2014-12-03 11:57:23','admin','0'),('8','5','用户消息',NULL,'3',3,NULL,NULL,NULL,NULL,NULL,'2014-11-25 15:06:54','admin','0'),('81a2e1309f474e56b71c498d9dfe3ae4','1','反交错启用',NULL,NULL,1,NULL,NULL,NULL,NULL,'admin','2014-12-03 12:01:40','admin','1'),('82aedd6a105a46d59bd10a0c1a5f90d1','22d24f4722cd485ebdf05a3cabf04119','11',NULL,NULL,0,NULL,NULL,NULL,NULL,'cwx','2014-11-06 09:57:49','cwx','1'),('8316dfb8cc1d45b7989dcca6828f1707','88ad2499f49a44c59cabd3922e2883af','LEVEL_2',NULL,'20',20,NULL,NULL,NULL,NULL,'cwx','2014-11-25 14:41:01','admin','0'),('831f9c9dd48c4089915a82a67f46109f','065d0e28a2b8448eb1eede75f3a17987','1920*1080',NULL,'1920*1080',0,NULL,NULL,NULL,NULL,'cwx','2014-11-25 14:56:27','admin','0'),('83d1907a09854b97a93b5a3a951ddec7','d20987a74f9347a2a34acf400580af7c','学生',NULL,'2',2,NULL,NULL,NULL,NULL,'cwx','2014-11-25 15:07:31','admin','0'),('8557ca85928b4f269a57bfd228ee00f8','358e5171cd9a4cb497419e15699a0bc0','4',NULL,'2',1,NULL,NULL,NULL,'2014-11-26 15:31:46','admin','2014-11-26 15:45:09','admin','1'),('85672cc8934240cf8c8ab2c35fb1cdea','a57dc2c6fcc4434eabda1d0cfc7d087d','rtsp方案三',NULL,'3',3,NULL,NULL,NULL,'2014-11-25 14:49:21','admin','2014-11-25 15:01:35','admin','1'),('86106bbc2b914a1aa5a03c81b34cc16c','14','部门',NULL,'5',5,NULL,NULL,NULL,NULL,'cwx','2014-12-03 11:57:27','admin','0'),('87b506feab384bfe9b68563cdc1577f1','fccc3090bb82406784756f63968ffa60','LINE_IN',NULL,'1',1,NULL,NULL,NULL,NULL,'cwx','2014-11-25 15:09:01','admin','0'),('87c243c0ccdc45c793a856faf3dc5507','20ba577770234050ac8ffe49a4759325','SA7160 PCI',NULL,'SA7160 PCI',1,NULL,NULL,NULL,NULL,'cwx','2014-11-25 15:06:17','admin','0'),('8885bb7dbe484ea29d104d704e1b59a9','430cc2e7d738423390ed0fcc8e633204','FILTER_TRIANGLE',NULL,'2',2,NULL,NULL,NULL,NULL,'cwx','2014-11-25 15:00:09','admin','0'),('888663617a3243c7a662b2d8001c4c31','c439c5a9873a44aca13ced29a508c5c8','学案',NULL,'2',2,NULL,NULL,NULL,'2015-01-09 11:30:11','admin',NULL,NULL,'0'),('88ad2499f49a44c59cabd3922e2883af','1','RecordLevel',NULL,'recordLevel',0,NULL,NULL,NULL,NULL,'cwx','2014-11-26 18:23:39','admin','0'),('8a8bfdf7c77c4558ae46771906b65cb6','7d5e94e79dd14d0e9d0911137019aaaa','HDMI',NULL,'2',3,NULL,NULL,NULL,NULL,'cwx','2014-11-25 14:25:09','admin','0'),('8aa04032117045f7b2eae6b80b459947','1','跟踪机编号',NULL,'trackNum',0,NULL,NULL,NULL,NULL,'cwx','2014-12-03 11:50:41','admin','0'),('8c56284d90be43df9221d97b730217ac','a5c97a4e08f14d2e9e54872ae4bf80d4','2*2',NULL,'4',1,NULL,NULL,NULL,'2014-12-29 13:41:51','admin',NULL,NULL,'0'),('8d49d94f07234ded8b9185c03020701d','88ad2499f49a44c59cabd3922e2883af','LEVEL_3',NULL,'30',30,NULL,NULL,NULL,NULL,'cwx','2014-11-25 14:41:33','admin','0'),('8f987e05ec724574a1e081b584c0d87b','e414b5edf34f4287833e0bd1ae971b22','rtmp方案三',NULL,'3',3,NULL,NULL,NULL,'2014-11-25 14:46:18','admin',NULL,NULL,'0'),('9','5','通知',NULL,'4',4,NULL,NULL,NULL,NULL,NULL,'2014-11-25 15:06:59','admin','0'),('9148cdaa25c1449eb7a1c2bdfdfcbbe2','1','设备名',NULL,NULL,0,NULL,NULL,NULL,NULL,'cwx','2014-12-03 11:50:48','admin','1'),('91cd0a8d852c4477b1ffa14a5a6c036a','00b5ab2a19ec4890b236dc9cc21b0208','否',NULL,'1',1,NULL,NULL,NULL,NULL,'cwx','2014-11-25 14:55:50','admin','0'),('93ae04d281774034a8bc7c7430c8de05','4b2247067eed4ba18924366399fb0e29','5',NULL,'5',5,NULL,NULL,NULL,NULL,'cwx','2014-11-25 14:53:24','admin','0'),('9405128b895a491ab9d74d0d6fbc2ded','7d5e94e79dd14d0e9d0911137019aaaa','AUTO',NULL,'7',0,NULL,NULL,NULL,NULL,'cwx','2014-11-25 14:23:33','admin','0'),('9743dce428cb412b9c8adb49a1658135','88ad2499f49a44c59cabd3922e2883af','LEVEL_52',NULL,'52',52,NULL,NULL,NULL,NULL,'cwx','2014-11-25 14:41:47','admin','0'),('97bea3aad0e34e0692edc18e0f0000d4','5990fc699ee34e9b8b14c0aca757c865','MAIN',NULL,'1',1,NULL,NULL,NULL,NULL,'cwx','2014-11-25 15:00:33','admin','0'),('9b16c04dd5da44ec989f06063bd507f1','6d2a66728ed34597b61acd0bab01e300','HARDWARE',NULL,'1',1,NULL,NULL,NULL,NULL,'cwx','2014-11-25 15:00:50','admin','0'),('9b9b032a927f4e53b1e970fb0dbb33e9','81a2e1309f474e56b71c498d9dfe3ae4','是',NULL,'true',0,NULL,NULL,NULL,'2014-11-25 14:33:45','admin','2014-12-03 12:01:40','admin','1'),('9d085b8d8f5a421aa9d095f668569a7b','7d5e94e79dd14d0e9d0911137019aaaa','COMPONENTS',NULL,'4',5,NULL,NULL,NULL,NULL,'cwx','2014-11-25 14:25:02','admin','0'),('9d1ec709480c4f35805808d4a95eea39','1','视频编码类型',NULL,'videoCodeType',0,NULL,NULL,NULL,NULL,'cwx','2014-11-26 16:50:08','admin','0'),('a178e511d6034ab6b51447d9cca24d61','1','RecordEntropy',NULL,'recordEntropy',0,NULL,NULL,NULL,NULL,'cwx','2014-11-26 18:24:00','admin','0'),('a2b04a569f3141728e30d017147e3234','1','组织',NULL,NULL,0,NULL,NULL,NULL,NULL,'cwx','2014-11-03 15:00:33','cwx','1'),('a336927f1678411fad61d0274165f6b9','c681c6205d4e4bbbbceead2a78e96102','web服务器',NULL,'1',1,NULL,NULL,NULL,'2015-01-15 17:08:22','admin','2015-01-15 17:08:38','admin','0'),('a35352b814ee48658f8babfb734bff32','a178e511d6034ab6b51447d9cca24d61','CAVLC',NULL,'0',0,NULL,NULL,NULL,NULL,'cwx','2014-11-25 14:54:22','admin','0'),('a3612b6546614ad18b45029864e2de00','2d6bcaeef53349faae0dbf412a1f3b4a','流模式',NULL,'flowType',2,NULL,NULL,NULL,'2015-01-09 11:25:08','admin',NULL,NULL,'0'),('a57dc2c6fcc4434eabda1d0cfc7d087d','1','rtsp方案',NULL,'rtspscheam',3,NULL,NULL,NULL,'2014-11-25 14:44:00','admin','2014-12-01 17:06:34','admin','0'),('a5c97a4e08f14d2e9e54872ae4bf80d4','1','轮巡分屏',NULL,'splitScreen',NULL,NULL,NULL,NULL,'2014-12-29 13:41:11','admin',NULL,NULL,'0'),('a710f4ea09284d0d90096955f6a8f4c8','c439c5a9873a44aca13ced29a508c5c8','课件',NULL,'3',3,NULL,NULL,NULL,'2015-01-09 11:30:17','admin',NULL,NULL,'0'),('a72f7a07ae494f57bb6276cdf75e6f3e','ac8fb0098dc64c9ca1dc79483cdbaace','4000',NULL,'4096000',7,NULL,NULL,NULL,NULL,'cwx','2014-11-25 15:03:41','admin','0'),('aa46e6e2a8144da98f313d63d41d68a3','7d5e94e79dd14d0e9d0911137019aaaa','DVI_A',NULL,'5',6,NULL,NULL,NULL,NULL,'cwx','2014-11-25 14:19:40','admin','0'),('aa7e5997c25f44cd8e467531a310b8d7','2d6bcaeef53349faae0dbf412a1f3b4a','图片模式',NULL,'pictureType',1,NULL,NULL,NULL,'2015-01-09 11:23:48','admin',NULL,NULL,'0'),('ab998f62d60746b3acf8387c90576a65','7d5e94e79dd14d0e9d0911137019aaaa','SVIDEO',NULL,'1',1,NULL,NULL,NULL,NULL,'cwx','2014-11-25 14:25:26','admin','0'),('abee31d6fb3d4c77af9dc7609fdfa1d7','065d0e28a2b8448eb1eede75f3a17987','960*540',NULL,'960*540',6,NULL,NULL,NULL,NULL,'cwx','2014-11-25 14:57:06','admin','0'),('ac8fb0098dc64c9ca1dc79483cdbaace','1','码率',NULL,'bitrate',0,NULL,NULL,NULL,NULL,'cwx','2014-11-26 18:24:39','admin','0'),('b058002798f54d79bf1aa65adffc146b','065d0e28a2b8448eb1eede75f3a17987','1280*720',NULL,'1280*720',3,NULL,NULL,NULL,NULL,'cwx','2014-11-25 14:57:24','admin','0'),('b136f6a121bf4e6b877b5a476292d829','8aa04032117045f7b2eae6b80b459947','1',NULL,'1',1,NULL,NULL,NULL,NULL,'cwx','2014-12-15 12:03:42','admin','0'),('b23c6dd04ec04635aa1d34b70737005c','4b2247067eed4ba18924366399fb0e29','1',NULL,'1',1,NULL,NULL,NULL,NULL,'cwx','2014-11-25 14:53:28','admin','0'),('b2f4f39dad184184bc65cabbe81f6ec9','358e5171cd9a4cb497419e15699a0bc0','4',NULL,'2',1,NULL,NULL,NULL,'2014-11-26 15:36:12','admin','2014-11-26 15:45:09','admin','1'),('b51b0e58d430433e91c3dddbb73a41cd','10','e',NULL,NULL,0,NULL,NULL,NULL,NULL,'cwx','2014-11-03 14:50:52','cwx','1'),('b66f077a2609491a8690bfd08748997c','10','测试2',NULL,NULL,0,NULL,NULL,NULL,NULL,'cwx','2014-11-03 14:55:27','cwx','1'),('b7588566b4c7478aabcf899791cb4155','88ad2499f49a44c59cabd3922e2883af','LEVEL_51',NULL,'51',51,NULL,NULL,NULL,NULL,'cwx','2014-11-25 14:41:42','admin','0'),('b86c4013fea04852b678dd1aacd7abfc','6d2a66728ed34597b61acd0bab01e300','INTER_MEDIA_SDK',NULL,'2',2,NULL,NULL,NULL,NULL,'cwx','2014-11-25 15:00:47','admin','0'),('b98a3731b6884aeaa8d8880c2a6c0ec0','edecea2cdd7542b384db59750a8ad0f0','录播默认方案',NULL,'1',1,NULL,NULL,NULL,'2014-11-25 14:46:34','admin',NULL,NULL,'0'),('ba0a8f344480457eb2d15eeeec0dae86','1','12玩123',NULL,NULL,0,NULL,NULL,NULL,NULL,'cwx','2014-11-05 18:06:27','cwx','1'),('bc1e664a1b9344a1a0d6d34ea247e2e2','fccc3090bb82406784756f63968ffa60','SOUNDCARD_MICROPHO',NULL,'2',2,NULL,NULL,NULL,NULL,'cwx','2014-11-25 15:09:05','admin','0'),('bd24e059fd874be492986c7876036d99','10','11',NULL,NULL,0,NULL,NULL,NULL,NULL,'cwx','2014-11-03 16:00:28','cwx','1'),('bd90b8a2644645a38d365b2a7c0d85c4','10','1123123',NULL,NULL,1,NULL,NULL,NULL,NULL,'cwx','2014-11-05 18:05:59','cwx','1'),('bffd2b6c46a143fcae74e1ededb4e040','ac8fb0098dc64c9ca1dc79483cdbaace','1500',NULL,'1536000',9,NULL,NULL,NULL,NULL,'cwx','2014-11-25 15:04:13','admin','0'),('c0fe28d60def4036ae2bc9adbf9793ee','1','测试w',NULL,'111',1,NULL,NULL,NULL,'2015-01-15 13:52:57','admin',NULL,NULL,'0'),('c184943c21dd4b4686284a90e3e21ba4','88ad2499f49a44c59cabd3922e2883af','LEVEL_11',NULL,'11',11,NULL,NULL,NULL,NULL,'cwx','2014-11-25 14:41:15','admin','0'),('c1980040a9b644a7b8ee6065d1a293c4','fccc3090bb82406784756f63968ffa60','EMBEDDED_AUDIO',NULL,'0',0,NULL,NULL,NULL,NULL,'cwx','2014-11-25 14:34:24','admin','0'),('c2c95065957b420b9c477b4d4facf86c','22d24f4722cd485ebdf05a3cabf04119','3',NULL,NULL,3,NULL,NULL,NULL,NULL,'cwx','2014-11-06 09:57:49','cwx','1'),('c2fe2bc88bdc47c2b01bf44a527bf16a','4b2247067eed4ba18924366399fb0e29','10',NULL,'10',10,NULL,NULL,NULL,NULL,'cwx','2014-11-25 14:53:09','admin','0'),('c33e88f71289456bb176157f7aea09c5','73eb558bcc6d42459dbb80a67980bac2','COMPLEXITY_0',NULL,'0',0,NULL,NULL,NULL,NULL,'cwx','2014-11-25 14:55:14','admin','0'),('c439c5a9873a44aca13ced29a508c5c8','1','资源类型',NULL,'resourceType',NULL,NULL,NULL,NULL,'2015-01-09 11:26:19','admin',NULL,NULL,'0'),('c481d11baa5c46a38e6eb2d676f963cf','4b2247067eed4ba18924366399fb0e29','11',NULL,'11',11,NULL,NULL,NULL,NULL,'cwx','2014-11-25 14:52:58','admin','0'),('c681c6205d4e4bbbbceead2a78e96102','1','服务器类型',NULL,'serversType',NULL,NULL,NULL,NULL,'2015-01-15 17:07:16','admin',NULL,NULL,'0'),('c7c4e3cddf544173ab8f72c7389e0ddd','e414b5edf34f4287833e0bd1ae971b22','rtmp默认方案',NULL,'1',1,NULL,NULL,NULL,'2014-11-25 14:45:52','admin',NULL,NULL,'0'),('c86aa042f82341f884851571169b87e4','c681c6205d4e4bbbbceead2a78e96102','点播服务',NULL,'6',NULL,NULL,NULL,NULL,'2015-01-28 21:51:50','admin',NULL,NULL,'0'),('c885bfcbfbb94f7fabece44387173373','1','电影分辨率',NULL,NULL,0,NULL,NULL,NULL,NULL,'admin','2014-11-25 15:04:58','admin','1'),('c8f3d7d07ca643a582146dfcedd6a7b6','efdf99c05cf447e28b89f9ded15da888','1280*768',NULL,'1280*768',2,NULL,NULL,NULL,NULL,'cwx','2014-11-25 14:30:18','admin','0'),('c9d046aa13ec400f89b7b31c76d93968','d20987a74f9347a2a34acf400580af7c','vv',NULL,NULL,5,NULL,NULL,NULL,NULL,'cwx','2014-11-18 09:58:45','cwx','1'),('ccb696420bfa4feca2de1cbcb209661d','4b2247067eed4ba18924366399fb0e29','8',NULL,'8',8,NULL,NULL,NULL,NULL,'cwx','2014-11-25 14:53:41','admin','0'),('cd589d145e6540dea8cb59bfa62f2843','13968b54abd84afdbd47df2e53d0eeee','TS',NULL,'TS',3,NULL,NULL,NULL,NULL,'cwx','2014-11-25 15:05:46','admin','0'),('ce0ac8e324d64b76b26cb628f3746f49','14','专业',NULL,'6',6,NULL,NULL,NULL,NULL,'cwx','2014-12-03 11:57:31','admin','0'),('cf39d9be868841a18cb53d22dc18c39f','ac8fb0098dc64c9ca1dc79483cdbaace','800',NULL,'819200',11,NULL,NULL,NULL,NULL,'cwx','2014-11-25 15:04:37','admin','0'),('d14a6f8eaf35452c8a86f96f862fdc73','13968b54abd84afdbd47df2e53d0eeee','AVI',NULL,'AVI',4,NULL,NULL,NULL,NULL,'cwx','2014-11-25 15:05:51','admin','0'),('d20987a74f9347a2a34acf400580af7c','1','身份',NULL,'identity',0,NULL,NULL,NULL,NULL,'cwx','2014-12-03 11:51:29','admin','0'),('d3d95face591474281b060a23c0c15f8','065d0e28a2b8448eb1eede75f3a17987','720*576',NULL,'720*576',8,NULL,NULL,NULL,NULL,'cwx','2014-11-25 14:56:56','admin','0'),('d5a50d06fca248d68a73f1744ebaa067','1','111',NULL,NULL,0,NULL,NULL,NULL,NULL,'cwx','2014-11-03 14:27:22','cwx','1'),('d5bf57476d02487dbb19055b6a208cbe','1','学科',NULL,'Subject',NULL,NULL,NULL,NULL,'2015-01-09 11:27:47','admin',NULL,NULL,'0'),('d93e9e0aea4a4a76834837afcf2de3bf','edecea2cdd7542b384db59750a8ad0f0','录播方案二',NULL,'2',2,NULL,NULL,NULL,'2014-11-25 14:46:47','admin',NULL,NULL,'0'),('d9e8310bb23a42d7957ad93ebf5cc937','ac8fb0098dc64c9ca1dc79483cdbaace','6000',NULL,'6144000',6,NULL,NULL,NULL,NULL,'cwx','2014-11-25 15:03:30','admin','0'),('da7a985865c14b52909aac8e35e2d2b5','1','33',NULL,NULL,0,NULL,NULL,NULL,NULL,'cwx','2014-11-03 14:42:22','cwx','1'),('db871e7df5f44f0090c6f8fe4dafacf5','fccc3090bb82406784756f63968ffa60','SOUNDCARD_LINE_IN',NULL,'3',3,NULL,NULL,NULL,NULL,'cwx','2014-11-25 15:09:10','admin','0'),('dbccbead268a4c039a46b9ef79254083','4b2247067eed4ba18924366399fb0e29','3',NULL,'3',3,NULL,NULL,NULL,NULL,'cwx','2014-11-25 14:53:32','admin','0'),('dc37dd30ad404969921b61bd3a138058','88ad2499f49a44c59cabd3922e2883af','LEVEL_1',NULL,'10',10,NULL,NULL,NULL,NULL,'cwx','2014-11-25 14:41:25','admin','0'),('dc5bcca05f93485db95180c4c1a2cd30','4b2247067eed4ba18924366399fb0e29','7',NULL,'7',7,NULL,NULL,NULL,NULL,'cwx','2014-11-25 14:53:02','admin','0'),('dca38af449f04d0a8e8faa1594e61f9b','13968b54abd84afdbd47df2e53d0eeee','ASF',NULL,'ASF',5,NULL,NULL,NULL,NULL,'cwx','2014-11-25 15:05:55','admin','0'),('dd24c934e41b4b95a80e3329efaccd3f','9d1ec709480c4f35805808d4a95eea39','INTEL_MEDIA_SDK',NULL,'2',2,NULL,NULL,NULL,NULL,'cwx','2014-11-25 15:01:20','admin','0'),('dd7ae7bcfe0d4cd6ad927a3de6962927','a5c97a4e08f14d2e9e54872ae4bf80d4','3*3',NULL,'9',2,NULL,NULL,NULL,'2014-12-29 13:42:08','admin','2015-01-16 10:33:39','admin','1'),('ddb00962529e458180292d77aa707281','10','121',NULL,NULL,0,NULL,NULL,NULL,NULL,'cwx','2014-11-03 14:50:33','cwx','1'),('deb64079003542868c71637f3cc25c12','10','23',NULL,NULL,0,NULL,NULL,NULL,NULL,'cwx','2014-11-03 14:50:35','cwx','1'),('df0e8cada6854e13afc07ec3cd61819f','10','测试22',NULL,NULL,0,NULL,NULL,NULL,NULL,'cwx','2014-11-03 14:50:59','cwx','1'),('df5f9a343e704d65882d7e470a28b118','e414b5edf34f4287833e0bd1ae971b22','rtmp方案二',NULL,'2',2,NULL,NULL,NULL,'2014-11-25 14:46:04','admin',NULL,NULL,'0'),('e0bbdefc96dd4ee68860c068ee5e573d','ac8fb0098dc64c9ca1dc79483cdbaace','20000',NULL,'20480000',2,NULL,NULL,NULL,NULL,'cwx','2014-11-25 15:02:39','admin','0'),('e0d9e4c4b3a442b0b612a129f4660d92','065d0e28a2b8448eb1eede75f3a17987','640*480',NULL,'640*480',9,NULL,NULL,NULL,NULL,'cwx','2014-11-25 14:56:50','admin','0'),('e1874bc0e69540f9a80b62399913bc46','10','1',NULL,NULL,1,NULL,NULL,NULL,NULL,'cwx','2014-11-14 20:28:12','cwx','1'),('e1ab463493d64edd8eb75944b1c4bafe','1','爱好',NULL,NULL,123123,NULL,NULL,NULL,NULL,'cwx','2014-12-03 12:03:05','admin','1'),('e2f2d5f030214b119fef501c3e54d675','efdf99c05cf447e28b89f9ded15da888','1920*1080',NULL,'1920*1080',1,NULL,NULL,NULL,NULL,'cwx','2014-11-25 14:30:13','admin','0'),('e414b5edf34f4287833e0bd1ae971b22','1','rtmp方案',NULL,'rtmpscheam',3,NULL,NULL,NULL,'2014-11-25 14:44:47','admin','2014-12-02 10:17:58','admin','0'),('e8c054fb83564513a9a072c08282a1f2','eebbb7b57c0e4bc1a43abdc58b788eeb','录像默认方案',NULL,'1',1,NULL,NULL,NULL,'2014-11-25 14:47:11','admin',NULL,NULL,'0'),('e90e5f56239448b592bb09a46273d468','4b2247067eed4ba18924366399fb0e29','2',NULL,'2',2,NULL,NULL,NULL,NULL,'cwx','2014-11-25 14:53:36','admin','0'),('e9f974c6e9874a5baa9048afb9222ee1','ac8fb0098dc64c9ca1dc79483cdbaace','24000',NULL,'24576000',1,NULL,NULL,NULL,NULL,'cwx','2014-11-25 15:02:27','admin','0'),('eda4324eb17e428fac93be64f9cb8855','1','23',NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-25 14:50:06','admin','2014-11-25 14:50:43','admin','1'),('edecea2cdd7542b384db59750a8ad0f0','1','录播方案',NULL,'recordedBroadcastClass',3,NULL,NULL,NULL,'2014-11-25 14:43:21','admin','2014-12-03 12:02:52','admin','0'),('eebbb7b57c0e4bc1a43abdc58b788eeb','1','录像方案',NULL,'videoscheam',3,NULL,NULL,NULL,'2014-11-25 14:43:44','admin','2014-11-26 16:44:54','admin','0'),('efdf99c05cf447e28b89f9ded15da888','1','视频分辨率',NULL,'videoResolution',1,NULL,NULL,NULL,NULL,'cwx','2014-11-26 16:49:09','admin','0'),('f1a63047f47643a0bfadd22118176f9f','358e5171cd9a4cb497419e15699a0bc0','1',NULL,'1',1,NULL,NULL,NULL,'2014-11-26 15:30:58','admin','2014-11-26 15:45:09','admin','1'),('f1a994beb2ad4d2bb2938649739e22af','1','帧率',NULL,NULL,0,NULL,NULL,NULL,NULL,'cwx','2014-11-25 15:08:53','admin','1'),('f28f62d90c574ed796c27023ad563e63','1','2',NULL,NULL,0,NULL,NULL,NULL,NULL,'cwx','2014-11-03 14:39:41','cwx','1'),('f31d0ee5310e469596c3ad24b9320d0e','73eb558bcc6d42459dbb80a67980bac2','COMPLEXITY_1',NULL,'1',1,NULL,NULL,NULL,NULL,'cwx','2014-11-25 14:55:18','admin','0'),('f56377e5528f4a1e962ea3928a65c1fc','5990fc699ee34e9b8b14c0aca757c865','HIGH',NULL,'2',2,NULL,NULL,NULL,NULL,'cwx','2014-11-25 15:00:36','admin','0'),('f5d45744b9714273ae9bbcc55fd37773','1','1233444',NULL,NULL,0,NULL,NULL,NULL,NULL,'cwx','2014-11-03 12:02:42','cwx','1'),('f6be4dbd3168492cbbcc4abc9ad616a0','88ad2499f49a44c59cabd3922e2883af','LEVEL_13',NULL,'13',13,NULL,NULL,NULL,NULL,'cwx','2014-11-25 14:41:06','admin','0'),('f7a174b3869b49aabf62925e9ae84084','4b2247067eed4ba18924366399fb0e29','12',NULL,'12',12,NULL,NULL,NULL,NULL,'cwx','2014-11-25 14:52:54','admin','0'),('fa4e6bdd0ce6439e9ca23d5da35a4d0f','1','1',NULL,'1',1,NULL,NULL,NULL,'2014-11-26 15:30:33','admin','2014-12-03 12:03:14','admin','1'),('fa6f4d76088047688925d68221f2e915','10','33',NULL,NULL,0,NULL,NULL,NULL,NULL,'cwx','2014-11-03 14:50:44','cwx','1'),('fb35bdf4507e45ec8b9dc368a1417965','1','11',NULL,NULL,0,NULL,NULL,NULL,NULL,'cwx','2014-11-06 10:03:37','cwx','1'),('fccc3090bb82406784756f63968ffa60','1','音频接口类型',NULL,'audioType',0,NULL,NULL,NULL,NULL,'cwx','2014-11-26 16:49:48','admin','0'),('ff649c56d8d54a9f8712b7634a6898d7','88ad2499f49a44c59cabd3922e2883af','LEVEL_32',NULL,'32',32,NULL,NULL,NULL,NULL,'cwx','2014-11-25 14:41:38','admin','0'),('ff8d9d3519ae4b9286f86311739029da','88ad2499f49a44c59cabd3922e2883af','LEVEL_31',NULL,'31',31,NULL,NULL,NULL,NULL,'cwx','2014-11-25 14:40:51','admin','0'),('ffd78fd429424d0b9644ed3f899c9c13','10','ce',NULL,NULL,0,NULL,NULL,NULL,NULL,'cwx','2014-11-03 14:50:50','cwx','1');
/*!40000 ALTER TABLE `sys_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_function`
--

DROP TABLE IF EXISTS `sys_function`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_function` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '功能url',
  `parentid` char(36) NOT NULL COMMENT '父节点',
  `fun_code` varchar(50) DEFAULT NULL COMMENT '功能编码',
  `fun_name` varchar(50) NOT NULL COMMENT '功能名称',
  `fun_pinyin` varchar(50) DEFAULT NULL COMMENT '功能名称缩写',
  `F_URL` varchar(100) DEFAULT NULL,
  `fun_type` varchar(50) DEFAULT 'view' COMMENT '功能类型',
  `level` int(2) DEFAULT NULL,
  `target_type` varchar(50) DEFAULT 'button' COMMENT '目标类型',
  `attributes` char(36) DEFAULT '31' COMMENT '功能属性 数据字典：功能属性',
  `state` char(36) DEFAULT '19' COMMENT '状态 数据字典 ：系统状态',
  `ordervalue` int(3) DEFAULT '0' COMMENT '排序',
  `createdate` datetime DEFAULT NULL,
  `createuser` char(36) DEFAULT NULL,
  `modifydate` datetime DEFAULT NULL,
  `modifyuser` char(36) DEFAULT NULL,
  `deleteflag` char(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sys_function_unique` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_function`
--

LOCK TABLES `sys_function` WRITE;
/*!40000 ALTER TABLE `sys_function` DISABLE KEYS */;
INSERT INTO `sys_function` VALUES (1,'0','auth_sy_url_view','系统功能菜单','sy',NULL,'view',0,'url','30','19',1,NULL,NULL,NULL,NULL,'0'),(2,'10','auth_classrooms_tactics_url_view','教室策略','classrooms_tactics','/classrooms/tactics','view',2,'url','30','19',2,NULL,NULL,NULL,NULL,'0'),(3,'1','auth_scheduleManagements_url_view','课表管理','scheduleManagements','/scheduleManagements','view',1,'url','30','19',3,NULL,NULL,NULL,NULL,'0'),(4,'1','auth_director_url_view','导播台','director','/director','view',1,'url','30','19',4,NULL,NULL,NULL,NULL,'0'),(5,'1','auth_coursepatrol_url_view','课程巡视','coursepatrol','/coursepatrol','view',1,'url','30','19',5,NULL,NULL,NULL,NULL,'0'),(6,'1','auth_resource_url_view','资源管理','resource','/resource','view',1,'url','30','19',6,NULL,NULL,NULL,NULL,'0'),(7,'1','auth_portal_url_view','门户管理','portal','/portal','view',1,'url','30','19',7,NULL,NULL,NULL,NULL,NULL),(8,'1','auth_system_url_view','系统管理','system','/system','view',1,'url','30','19',8,NULL,NULL,NULL,NULL,'0'),(9,'1','auth_information_url_view','消息','information','/information','view',1,'url','30','19',9,NULL,NULL,NULL,NULL,'0'),(10,'1','auth_classrooms_url_view','教室管理','classrooms','/classrooms','view',1,'url','30','19',1,NULL,NULL,NULL,NULL,'0'),(11,'10','auth_classrooms_facility_url_view','设备管理','classrooms_facility','/classrooms/facility','view',2,'url','30','19',1,NULL,NULL,NULL,NULL,'0'),(12,'10','auth_classrooms_daily_url_view','教室日常','classrooms_daily','/classrooms/daily','view',2,'url','30','19',1,NULL,NULL,NULL,NULL,'0'),(14,'3','auth_scheduleManagements_live_url_view','直播课表','scheduleManagements_live','/scheduleManagements/live','view',2,'url','30','19',1,NULL,NULL,NULL,NULL,'0'),(15,'3','auth_scheduleManagements_week_url_view','周课表','scheduleManagements_week','/scheduleManagements/week','view',2,'url','30','19',2,NULL,NULL,NULL,NULL,'0'),(16,'10','auth_classrooms_setup_url_view','教室设置','classrooms_setup','/classrooms/setup','view',2,'url','30','19',3,NULL,NULL,NULL,NULL,'0'),(17,'3','auth_scheduleManagements_edit_url_view','课表编辑','scheduleManagements_edit','/scheduleManagements/edit','view',2,'url','30','19',3,NULL,NULL,NULL,NULL,'0'),(18,'8','auth_system_user_url_view','用户管理','system_user','/system/user','view',2,'url','30','19',1,NULL,NULL,NULL,NULL,'0'),(19,'8','auth_system_organization_url_view','机构管理','system_organization','/system/organization','view',2,'url','30','19',2,NULL,NULL,NULL,NULL,'0'),(20,'8','auth_system_limits_url_view','权限管理','system_limits','/system/limits','view',2,'url','30','19',3,NULL,NULL,NULL,NULL,'0'),(21,'8','auth_system_scope_url_view','范围管理','system_scope','/system/scope','view',2,'url','30','19',4,NULL,NULL,NULL,NULL,'0'),(22,'8','auth_system_impower_url_view','授权管理','system_impower','/system/impower','view',2,'url','30','19',5,NULL,NULL,NULL,NULL,'0'),(23,'8','auth_system_data_url_view','数据字典','system_data','/system/data','view',2,'url','30','19',6,NULL,NULL,NULL,NULL,'0'),(24,'6','auth_resource_upload_url_view','资源上传','resource_upload','/resource/upload','view',2,'url','30','19',0,NULL,NULL,NULL,NULL,'0'),(25,'6','auth_resource_video_url_view','视频资源','resource_video','/resource/video','view',2,'url','30','19',0,NULL,NULL,NULL,NULL,'0'),(26,'6','auth_resource_image_url_view','图片资源','resource_image','/resource/image','view',2,'url','30','19',0,NULL,NULL,NULL,NULL,'0'),(27,'6','auth_resource_released_url_view','已发布资源','resource_released','/resource/released','view',2,'url','30','19',0,NULL,NULL,NULL,NULL,'0'),(28,'23','auth_system_data_type_button_add','增加分类','system_data_type',NULL,'add',3,'url','30','19',0,NULL,NULL,NULL,NULL,'0'),(29,'23','auth_system_data_type_button_edit','修改分类','system_data_type',NULL,'edit',3,'button','31','19',0,NULL,NULL,NULL,NULL,'0'),(30,'23','auth_system_data_type_button_delete','删除分类','system_data_type',NULL,'delete',3,'button','31','19',0,NULL,NULL,NULL,NULL,'0'),(31,'23','auth_system_data_content_button_add','增加内容','system_data_content',NULL,'add',3,'button','31','19',0,NULL,NULL,NULL,NULL,'0'),(32,'23','auth_system_data_content_button_edit','修改内容','system_data_content',NULL,'edit',3,'button','31','19',0,NULL,NULL,NULL,NULL,'0'),(33,'23','auth_system_data_content_button_delete','删除内容','system_data_content',NULL,'delete',3,'button','31','19',0,NULL,NULL,NULL,NULL,'0'),(34,'3','auth_scheduleManagements_myschedule_url_view','我的课表','scheduleManagements_myschedule','/scheduleManagements/myschedule','view',2,'url','30','19',4,NULL,NULL,NULL,NULL,'0'),(35,'6','auth_resource_myresource_url_view','我的资源','resource_myresource','/resource/myresource','view',2,'url','30','19',0,NULL,NULL,NULL,NULL,'0'),(36,'10','auth_classrooms_version_url_view','版本控制','classrooms_version','/classrooms/version','view',2,'url','30','19',1,NULL,NULL,NULL,NULL,'0');
/*!40000 ALTER TABLE `sys_function` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_function_temp`
--

DROP TABLE IF EXISTS `sys_function_temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_function_temp` (
  `id` char(32) NOT NULL COMMENT '功能url',
  `parentid` char(36) NOT NULL COMMENT '父节点',
  `fun_code` varchar(50) NOT NULL COMMENT '功能编码',
  `fun_name` varchar(50) NOT NULL COMMENT '功能名称',
  `fun_pinyin` varchar(50) DEFAULT NULL COMMENT '功能名称缩写',
  `fun_type` varchar(50) DEFAULT NULL COMMENT '功能类型',
  `target_type` varchar(50) DEFAULT NULL COMMENT '目标类型',
  `attributes` char(36) DEFAULT NULL COMMENT '功能属性 数据字典：功能属性',
  `state` char(36) DEFAULT '19' COMMENT '状态 数据字典 ：系统状态',
  `ordervalue` int(3) DEFAULT '0' COMMENT '排序',
  `URL` varchar(50) DEFAULT NULL COMMENT '功能对应的URL',
  `createdate` datetime DEFAULT NULL,
  `createuser` char(36) DEFAULT NULL,
  `modifydate` datetime DEFAULT NULL,
  `modifyuser` char(36) DEFAULT NULL,
  `deleteflag` char(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_function_temp`
--

LOCK TABLES `sys_function_temp` WRITE;
/*!40000 ALTER TABLE `sys_function_temp` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_function_temp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_import_info`
--

DROP TABLE IF EXISTS `sys_import_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_import_info` (
  `importid` char(20) NOT NULL COMMENT '导入批次id，时间戳',
  `import_date` datetime DEFAULT NULL COMMENT '导入开始时间',
  `status` int(1) DEFAULT NULL COMMENT '0:成功；1：有错误；2：重复',
  `questionid` int(10) DEFAULT NULL COMMENT '成功的显示成功id,重复的现实重复id',
  `excelid` int(10) NOT NULL COMMENT '当前页第几条记录',
  `sys_type` int(10) DEFAULT NULL COMMENT '题型',
  `knowledgeid` int(10) DEFAULT NULL COMMENT '知识点',
  `error` text COMMENT '出错信息',
  `type` char(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_import_info`
--

LOCK TABLES `sys_import_info` WRITE;
/*!40000 ALTER TABLE `sys_import_info` DISABLE KEYS */;
INSERT INTO `sys_import_info` VALUES ('20150312134136','2015-03-12 13:41:17',0,NULL,1,NULL,NULL,NULL,NULL),('20150312134136','2015-03-12 13:41:17',0,NULL,2,NULL,NULL,NULL,NULL),('20150312134136','2015-03-12 13:41:17',0,NULL,3,NULL,NULL,NULL,NULL),('20150312134136','2015-03-12 13:41:17',0,NULL,4,NULL,NULL,NULL,NULL),('20150312134136','2015-03-12 13:41:17',0,NULL,5,NULL,NULL,NULL,NULL),('20150312134136','2015-03-12 13:41:17',0,NULL,6,NULL,NULL,NULL,NULL),('20150312134136','2015-03-12 13:41:17',0,NULL,7,NULL,NULL,NULL,NULL),('20150312134136','2015-03-12 13:41:17',0,NULL,8,NULL,NULL,NULL,NULL),('20150312134136','2015-03-12 13:41:17',0,NULL,9,NULL,NULL,NULL,NULL),('20150312134136','2015-03-12 13:41:17',0,NULL,10,NULL,NULL,NULL,NULL),('20150312134136','2015-03-12 13:41:17',0,NULL,11,NULL,NULL,NULL,NULL),('20150312134136','2015-03-12 13:41:17',0,NULL,12,NULL,NULL,NULL,NULL),('20150312134136','2015-03-12 13:41:17',0,NULL,13,NULL,NULL,NULL,NULL),('20150312134136','2015-03-12 13:41:17',0,NULL,14,NULL,NULL,NULL,NULL),('20150312134136','2015-03-12 13:41:17',0,NULL,15,NULL,NULL,NULL,NULL),('20150312134136','2015-03-12 13:41:17',0,NULL,16,NULL,NULL,NULL,NULL),('20150312134136','2015-03-12 13:41:17',0,NULL,17,NULL,NULL,NULL,NULL),('20150312134136','2015-03-12 13:41:17',0,NULL,18,NULL,NULL,NULL,NULL),('20150312134136','2015-03-12 13:41:17',0,NULL,19,NULL,NULL,NULL,NULL),('20150312134136','2015-03-12 13:41:17',0,NULL,20,NULL,NULL,NULL,NULL),('20150312134136','2015-03-12 13:41:17',0,NULL,21,NULL,NULL,NULL,NULL),('20150312134136','2015-03-12 13:41:17',0,NULL,22,NULL,NULL,NULL,NULL),('20150312134136','2015-03-12 13:41:17',0,NULL,23,NULL,NULL,NULL,NULL),('20150312134136','2015-03-12 13:41:17',0,NULL,24,NULL,NULL,NULL,NULL),('20150312134136','2015-03-12 13:41:17',0,NULL,25,NULL,NULL,NULL,NULL),('20150312134136','2015-03-12 13:41:17',0,NULL,26,NULL,NULL,NULL,NULL),('20150312134136','2015-03-12 13:41:17',0,NULL,27,NULL,NULL,NULL,NULL),('20150312134136','2015-03-12 13:41:17',0,NULL,28,NULL,NULL,NULL,NULL),('20150312134136','2015-03-12 13:41:17',0,NULL,29,NULL,NULL,NULL,NULL),('20150312134136','2015-03-12 13:41:17',0,NULL,30,NULL,NULL,NULL,NULL),('20150312134136','2015-03-12 13:41:17',0,NULL,31,NULL,NULL,NULL,NULL),('20150312134136','2015-03-12 13:41:17',0,NULL,32,NULL,NULL,NULL,NULL),('20150312134136','2015-03-12 13:41:17',0,NULL,33,NULL,NULL,NULL,NULL),('20150312134136','2015-03-12 13:41:17',0,NULL,34,NULL,NULL,NULL,NULL),('20150312134136','2015-03-12 13:41:17',0,NULL,35,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `sys_import_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_info`
--

DROP TABLE IF EXISTS `sys_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_info` (
  `id` char(36) NOT NULL,
  `name` varchar(100) DEFAULT NULL COMMENT '机构名称',
  `typeid` char(36) DEFAULT NULL COMMENT '机构类型',
  `address` varchar(100) DEFAULT NULL COMMENT '地址',
  `telephone` varchar(20) DEFAULT NULL COMMENT '电话',
  `yzbm` char(6) DEFAULT NULL COMMENT '邮政编码',
  `logourl` varchar(100) DEFAULT NULL COMMENT 'logo地址',
  `createdate` datetime DEFAULT NULL,
  `createuser` char(36) DEFAULT NULL,
  `modifydate` datetime DEFAULT NULL,
  `modifyuser` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_info`
--

LOCK TABLES `sys_info` WRITE;
/*!40000 ALTER TABLE `sys_info` DISABLE KEYS */;
INSERT INTO `sys_info` VALUES ('1','56中学','38','北京','1212121','101001',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `sys_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_log`
--

DROP TABLE IF EXISTS `sys_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_log` (
  `THREAD_NAME` varchar(50) DEFAULT '',
  `LOGGER_NAME` varchar(50) DEFAULT NULL,
  `LOG_TIME` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `LOG_LEVEL` varchar(50) DEFAULT NULL,
  `MESSAGE` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_log`
--

LOCK TABLES `sys_log` WRITE;
/*!40000 ALTER TABLE `sys_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_message`
--

DROP TABLE IF EXISTS `sys_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_message` (
  `id` char(36) NOT NULL DEFAULT '' COMMENT '消息ID',
  `userid` char(36) DEFAULT NULL COMMENT '用户id',
  `typeid` char(36) DEFAULT NULL COMMENT '消息类别：数据字典',
  `title` varchar(50) DEFAULT NULL COMMENT '题目',
  `content` text COMMENT '消息内容',
  `status` char(1) DEFAULT 'N' COMMENT 'N:未读 Y:已读',
  `createdate` datetime DEFAULT NULL,
  `createuser` char(36) DEFAULT NULL,
  `modifydate` datetime DEFAULT NULL,
  `modifyuser` char(36) DEFAULT NULL,
  `deleteflag` char(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_message`
--

LOCK TABLES `sys_message` WRITE;
/*!40000 ALTER TABLE `sys_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_msg_status`
--

DROP TABLE IF EXISTS `sys_msg_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_msg_status` (
  `id` char(36) NOT NULL,
  `msgid` char(36) NOT NULL DEFAULT '' COMMENT '消息id',
  `userid` char(36) NOT NULL DEFAULT '' COMMENT '目标用户id',
  `status` char(1) DEFAULT NULL COMMENT '消息状态',
  `deleteflag` char(1) DEFAULT '0' COMMENT '删除标记',
  `readtime` datetime DEFAULT NULL COMMENT '阅读时间',
  `createdate` datetime DEFAULT NULL,
  `createuser` char(36) DEFAULT NULL,
  `modifydate` datetime DEFAULT NULL,
  `modifyuser` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_msg_status`
--

LOCK TABLES `sys_msg_status` WRITE;
/*!40000 ALTER TABLE `sys_msg_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_msg_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role`
--

DROP TABLE IF EXISTS `sys_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role` (
  `id` char(36) NOT NULL COMMENT '角色ID',
  `role_code` varchar(20) DEFAULT NULL COMMENT '角色编码',
  `role_name` varchar(20) NOT NULL COMMENT '角色名称',
  `createtime` datetime NOT NULL,
  `role_type` char(36) DEFAULT NULL COMMENT '角色类型',
  `createuser` char(36) DEFAULT NULL,
  `modifydate` datetime DEFAULT NULL,
  `modifyuser` char(36) DEFAULT NULL,
  `deleteflag` char(1) DEFAULT '0',
  `Enable` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_code` (`role_code`),
  KEY `sys_role_unique` (`role_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` VALUES ('1',NULL,'教师','2015-01-05 13:37:35',NULL,'admin','2015-01-15 15:14:09','admin','0',''),('2','ROLE_ADMIN','系统管理员','2014-09-23 19:50:43',NULL,NULL,'2014-10-31 10:32:56','cwx','0','N'),('3',NULL,'学生','2015-01-19 10:48:44',NULL,'admin',NULL,NULL,'0',NULL);
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_function`
--

DROP TABLE IF EXISTS `sys_role_function`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role_function` (
  `id` char(36) DEFAULT NULL,
  `roleid` char(36) NOT NULL DEFAULT '' COMMENT '角色 ID',
  `functionid` char(36) NOT NULL DEFAULT '' COMMENT '功能ID',
  `createdate` datetime DEFAULT NULL,
  `createuser` char(36) DEFAULT NULL,
  `modifydate` datetime DEFAULT NULL,
  `modifyuser` char(36) DEFAULT NULL,
  `deleteflag` char(1) DEFAULT '0',
  PRIMARY KEY (`roleid`,`functionid`),
  KEY `functionid` (`functionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_function`
--

LOCK TABLES `sys_role_function` WRITE;
/*!40000 ALTER TABLE `sys_role_function` DISABLE KEYS */;
INSERT INTO `sys_role_function` VALUES ('a9806ff4ae6b49639c6cf7f985ac8209','1','1','2015-02-10 10:37:44','admin',NULL,NULL,'0'),('ce23ceb4eb524da0a5c062719522aa2a','1','27','2015-02-10 10:37:44','admin',NULL,NULL,'0'),('9065bc900aad41718b62b55dd88a6feb','1','3','2015-02-10 10:37:44','admin',NULL,NULL,'0'),('d9d0f136f296419a9cc8709eab85c605','1','34','2015-02-10 10:37:44','admin',NULL,NULL,'0'),('c843d8814bf94b12b567cb146acaa74a','1','35','2015-02-10 10:37:44','admin',NULL,NULL,'0'),('773257d88ce54d628a25e26f47326718','1','6','2015-02-10 10:37:44','admin',NULL,NULL,'0'),('357accaf069a4b219c31c8bb9b3ffad5','2','1','2015-03-05 17:48:38','admin',NULL,NULL,'0'),('f72e2c4062ca4fc286ca7aa3a20393b4','2','10','2015-03-05 17:48:38','admin',NULL,NULL,'0'),('6a9019861e26463eb53a7ab3bee1692d','2','11','2015-03-05 17:48:38','admin',NULL,NULL,'0'),('3bbb47364a77479b8d75b31bde0c2387','2','12','2015-03-05 17:48:38','admin',NULL,NULL,'0'),('6bffb1b7bae14b778cb07c7784d615b9','2','14','2015-03-05 17:48:38','admin',NULL,NULL,'0'),('ca814d17615442e0b772c34bfddba237','2','15','2015-03-05 17:48:38','admin',NULL,NULL,'0'),('dcce61e85dc5476c93291e27340d26fb','2','16','2015-03-05 17:48:38','admin',NULL,NULL,'0'),('329853430076489988b5d37246b8480b','2','17','2015-03-05 17:48:38','admin',NULL,NULL,'0'),('d8968f7e2cef4bad95b0322563ce9bdc','2','18','2015-03-05 17:48:38','admin',NULL,NULL,'0'),('ee184a886de7467b9dcc2d8461eb2d0e','2','19','2015-03-05 17:48:38','admin',NULL,NULL,'0'),('1a57396402314479873b26e30de83d28','2','2','2015-03-05 17:48:38','admin',NULL,NULL,'0'),('671a1aa26a024fe9bb2665ce937f7882','2','20','2015-03-05 17:48:38','admin',NULL,NULL,'0'),('90dc60ed1c2644d39907f7203c6967da','2','21','2015-03-05 17:48:38','admin',NULL,NULL,'0'),('2dbfa8c141c64cbeab78548f5b76c78c','2','22','2015-03-05 17:48:38','admin',NULL,NULL,'0'),('d9b3374f1da845dca028626d559d55d1','2','23','2015-03-05 17:48:38','admin',NULL,NULL,'0'),('8fcd972e01a248db9bf70e77ad1d0b4e','2','24','2015-03-05 17:48:38','admin',NULL,NULL,'0'),('62c53ec8db014aa0a918b5edf3e4485a','2','25','2015-03-05 17:48:38','admin',NULL,NULL,'0'),('d7301271560642df9d90cee45f8ca650','2','26','2015-03-05 17:48:38','admin',NULL,NULL,'0'),('62d0781503a1458ca48cf0f19a5a58cd','2','27','2015-03-05 17:48:38','admin',NULL,NULL,'0'),('b39503d0d1b54238bda7838f939b2b02','2','28','2015-03-05 17:48:38','admin',NULL,NULL,'0'),('d1e9b9d01c2c492bb681982ba3c6edda','2','29','2015-03-05 17:48:38','admin',NULL,NULL,'0'),('e40c8bc6eb474ac396e6b7b9c084e1ab','2','3','2015-03-05 17:48:38','admin',NULL,NULL,'0'),('e7a8392494aa4d85a77961a2e9980e1a','2','30','2015-03-05 17:48:38','admin',NULL,NULL,'0'),('cbd26b4ca6dc49a0926e166ea07ff89f','2','31','2015-03-05 17:48:38','admin',NULL,NULL,'0'),('dd68099e76ef44b7a563d5bea9ebbe52','2','32','2015-03-05 17:48:38','admin',NULL,NULL,'0'),('d0e3ca2849d5442dbcffee3bf904ec8a','2','33','2015-03-05 17:48:38','admin',NULL,NULL,'0'),('9c6222c19cd64644b8a15da4191d08ad','2','36','2015-03-05 17:48:38','admin',NULL,NULL,'0'),('12450758cb574e6aba2a5f221a70cc32','2','4','2015-03-05 17:48:38','admin',NULL,NULL,'0'),('e05d9b0b67da4fbc8fc845fb2ca7eb4b','2','5','2015-03-05 17:48:38','admin',NULL,NULL,'0'),('efddbfe1cc6045899e4a9eb6c73368bc','2','6','2015-03-05 17:48:38','admin',NULL,NULL,'0'),('a1365ccbeead407d937b0b34a7bdb311','2','8','2015-03-05 17:48:38','admin',NULL,NULL,'0'),('d98dbaf1066b406ea300504c52487c5d','2','9','2015-03-05 17:48:38','admin',NULL,NULL,'0');
/*!40000 ALTER TABLE `sys_role_function` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user` (
  `id` char(36) NOT NULL DEFAULT '' COMMENT '用户id',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '姓名',
  `loginname` varchar(50) NOT NULL DEFAULT '' COMMENT '员工唯一ID，校内。',
  `password` varchar(50) NOT NULL DEFAULT '' COMMENT '密码 md5加密',
  `salt` varchar(50) DEFAULT NULL COMMENT '盐值',
  `phone` char(11) DEFAULT NULL COMMENT '联系电话',
  `status` char(32) DEFAULT '20' COMMENT '状态，数据字典：系统状态',
  `deptid` char(36) DEFAULT NULL COMMENT '组织机构id',
  `remark` varchar(200) DEFAULT NULL,
  `sex` char(32) DEFAULT '26' COMMENT '性别，数据字典：系统状态',
  `email` varchar(50) DEFAULT NULL,
  `pictureURL` varchar(50) DEFAULT NULL,
  `schoolyear` char(50) DEFAULT NULL,
  `createdate` datetime DEFAULT NULL,
  `createuser` char(32) DEFAULT NULL,
  `modifydate` datetime DEFAULT NULL,
  `modifyuser` char(32) DEFAULT NULL,
  `deleteflag` char(1) DEFAULT '0',
  `user_type` char(36) DEFAULT NULL COMMENT '0:教师 1：学生',
  `checked` char(1) DEFAULT 'N' COMMENT '验证是否第一次登录',
  `validateCode` varchar(36) DEFAULT NULL COMMENT '用户密码找回的验证码',
  `outDate` datetime DEFAULT NULL COMMENT '密码找回,过时的日期',
  `enable` char(1) DEFAULT NULL,
  `logindate` datetime DEFAULT NULL COMMENT '用户登录时间',
  `loginip` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sys_user_unique` (`loginname`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES ('6','管理员','admin','202cb962ac59075b964b07152d234b70',NULL,'18610339335','0','1','34','27','565760600@qq.com','\\disrec\\upload\\images\\20141114160337.png',NULL,NULL,NULL,'2015-03-02 15:19:40','admin','0','1','Y','0e73e674bf574c8097fc667a5a101070','2015-01-28 14:15:08',NULL,'2015-03-19 11:00:16','192.168.12.54');
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_mid`
--

DROP TABLE IF EXISTS `sys_user_mid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user_mid` (
  `id` char(36) NOT NULL DEFAULT '' COMMENT '用户id',
  `loginname` varchar(50) NOT NULL DEFAULT '' COMMENT '员工唯一ID，校内。',
  `password` varchar(50) NOT NULL DEFAULT '' COMMENT '密码 md5加密',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '姓名',
  `sexName` char(32) DEFAULT '26' COMMENT '性别，数据字典：系统状态',
  `usertypeName` char(36) DEFAULT NULL COMMENT '0:教师 1：学生',
  `schoolyear` char(4) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone` char(11) DEFAULT NULL COMMENT '联系电话',
  `deptName` varchar(100) DEFAULT NULL COMMENT '组织机构id',
  `createdate` datetime DEFAULT NULL,
  `createuser` char(32) DEFAULT NULL,
  `modifydate` datetime DEFAULT NULL,
  `modifyuser` char(32) DEFAULT NULL,
  `deleteflag` char(1) DEFAULT '0',
  `excelbatch` varchar(300) NOT NULL COMMENT '批次',
  `flag` char(1) DEFAULT '1',
  `errordescribe` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sys_user_unique` (`loginname`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_mid`
--

LOCK TABLES `sys_user_mid` WRITE;
/*!40000 ALTER TABLE `sys_user_mid` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_user_mid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_version`
--

DROP TABLE IF EXISTS `sys_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_version` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `programName` varchar(50) DEFAULT '0' COMMENT '版本名称',
  `createDate` datetime DEFAULT NULL COMMENT '创建时间',
  `loginname` varchar(50) DEFAULT '0' COMMENT '上传人源',
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 COMMENT='版本控制';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_version`
--

LOCK TABLES `sys_version` WRITE;
/*!40000 ALTER TABLE `sys_version` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_dept`
--

DROP TABLE IF EXISTS `user_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_dept` (
  `id` char(36) NOT NULL DEFAULT '',
  `userid` char(36) NOT NULL DEFAULT '' COMMENT '用户ID',
  `deptid` char(36) NOT NULL DEFAULT '' COMMENT '部门ID',
  `createdate` datetime DEFAULT NULL,
  `createuser` char(36) DEFAULT NULL,
  `modifydate` datetime DEFAULT NULL,
  `modifyuser` char(36) DEFAULT NULL,
  `deleteflag` char(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_dept`
--

LOCK TABLES `user_dept` WRITE;
/*!40000 ALTER TABLE `user_dept` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_range`
--

DROP TABLE IF EXISTS `user_range`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_range` (
  `id` char(36) NOT NULL,
  `userid` char(36) NOT NULL DEFAULT '' COMMENT '用户iD',
  `rangeid` char(36) NOT NULL DEFAULT '' COMMENT '范围ID',
  `createdate` datetime DEFAULT NULL,
  `createuser` char(36) DEFAULT NULL,
  `modifydate` datetime DEFAULT NULL,
  `modifyuser` char(36) DEFAULT NULL,
  `deleteflag` char(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `rungid` (`rangeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_range`
--

LOCK TABLES `user_range` WRITE;
/*!40000 ALTER TABLE `user_range` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_range` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_role` (
  `id` char(36) NOT NULL,
  `userid` char(36) NOT NULL DEFAULT '',
  `roleid` char(36) NOT NULL DEFAULT '',
  `createtime` datetime DEFAULT NULL,
  `createuser` char(36) DEFAULT NULL,
  `modifydate` datetime DEFAULT NULL,
  `modifyuser` char(36) DEFAULT NULL,
  `deleteflag` char(1) DEFAULT '0',
  `enable` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `roleid` (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES ('1f5e14cb465d492c8cb90597edf3adff','admin','2','2015-02-07 10:13:25','admin',NULL,NULL,'0',NULL);
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zonekey_apply_video`
--

DROP TABLE IF EXISTS `zonekey_apply_video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zonekey_apply_video` (
  `id` char(36) NOT NULL DEFAULT '',
  `areaid` varchar(36) NOT NULL COMMENT '教室id',
  `videoscheam` varchar(32) NOT NULL COMMENT '配置方案value',
  `createdate` datetime DEFAULT NULL,
  `createuser` char(36) DEFAULT NULL,
  `modifydate` datetime DEFAULT NULL,
  `modifyuser` char(36) DEFAULT NULL,
  `deleteflag` char(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='录播方案应用列表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zonekey_apply_video`
--

LOCK TABLES `zonekey_apply_video` WRITE;
/*!40000 ALTER TABLE `zonekey_apply_video` DISABLE KEYS */;
/*!40000 ALTER TABLE `zonekey_apply_video` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zonekey_area`
--

DROP TABLE IF EXISTS `zonekey_area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zonekey_area` (
  `id` char(36) NOT NULL DEFAULT '' COMMENT '设备区域ID',
  `parentid` char(36) DEFAULT NULL COMMENT '父节点',
  `name` varchar(50) DEFAULT NULL COMMENT '区域名字',
  `innerid` varchar(50) DEFAULT NULL COMMENT '如果是教室，需要有一个自定义编号',
  `attribute` char(1) DEFAULT 'N' COMMENT '是否是教室 Y:是教室',
  `deptid` char(32) DEFAULT NULL,
  `userid` char(36) DEFAULT NULL COMMENT '教室管理员',
  `state` char(1) DEFAULT '0',
  `sort` int(10) DEFAULT '0',
  `createdate` varchar(50) DEFAULT NULL,
  `modifydate` datetime DEFAULT NULL,
  `createuser` char(36) DEFAULT NULL,
  `modifyuser` varchar(36) DEFAULT NULL,
  `deleteflag` char(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zonekey_area`
--

LOCK TABLES `zonekey_area` WRITE;
/*!40000 ALTER TABLE `zonekey_area` DISABLE KEYS */;
INSERT INTO `zonekey_area` VALUES ('03023878ef77467298f9604e26d25038','03271f59bad8472c96a0551699f8fea6','柳明二层','l2','Y',NULL,NULL,'0',NULL,'2015-03-12 13:41:17',NULL,'admin',NULL,'0'),('03271f59bad8472c96a0551699f8fea6','af03e905ceff4b959a11b685e7b7415e','柳明校区',NULL,'N',NULL,NULL,NULL,3,'2015-03-12 13:40:57',NULL,'admin',NULL,'0'),('046ed37dd3b44d6084c37c653a135b01','74a6d0c990584db490ab9d2742b49a93','三年级1班','b234','Y',NULL,NULL,'0',NULL,'2015-03-12 13:41:17',NULL,'admin',NULL,'0'),('0812feb49df944669a4f4f687e4996f2','48086b7242aa452f98dbf4e14dfe7c57','二年级14班','y23','Y',NULL,NULL,'0',NULL,'2015-03-12 13:41:17',NULL,'admin',NULL,'0'),('1a5a5bf6891948a9987a2e157059a371','48086b7242aa452f98dbf4e14dfe7c57','二年级17班','y26','Y',NULL,NULL,'0',NULL,'2015-03-12 13:41:17',NULL,'admin',NULL,'0'),('1b65f4e71f964f2a9ffed94f7e574577','48086b7242aa452f98dbf4e14dfe7c57','三年级14班','y29','Y',NULL,NULL,'0',NULL,'2015-03-12 13:41:17',NULL,'admin',NULL,'0'),('2325cd39f12a418d9a886f2e489c9792','48086b7242aa452f98dbf4e14dfe7c57','一年级16班','y19','Y',NULL,NULL,'0',NULL,'2015-03-12 13:41:17',NULL,'admin',NULL,'0'),('25e17dc157c24736a3dbfb8d33d02b79','48086b7242aa452f98dbf4e14dfe7c57','一年级14班','y17','Y',NULL,NULL,'0',NULL,'2015-03-12 13:41:17',NULL,'admin',NULL,'0'),('29742984b74b45f0891b91602bae7d62','48086b7242aa452f98dbf4e14dfe7c57','四楼1','y33','Y',NULL,NULL,'0',NULL,'2015-03-12 13:41:17',NULL,'admin',NULL,'0'),('3766290322d34c3eb7e765dc2e82235f','48086b7242aa452f98dbf4e14dfe7c57','一年级12班','y15','Y',NULL,NULL,'0',NULL,'2015-03-12 13:41:17',NULL,'admin',NULL,'0'),('416f9a7ef391461ebb058e21cd43a77d','03271f59bad8472c96a0551699f8fea6','柳明一层','l3','Y',NULL,NULL,'0',NULL,'2015-03-12 13:41:17',NULL,'admin',NULL,'0'),('41f3c4b3a28e4b088347d8d2a150a808','48086b7242aa452f98dbf4e14dfe7c57','三年级13班','y28','Y',NULL,NULL,'0',NULL,'2015-03-12 13:41:17',NULL,'admin',NULL,'0'),('4365365d13db4312bd232d9da0c8ebc5','48086b7242aa452f98dbf4e14dfe7c57','一年级13班','y16','Y',NULL,NULL,'0',NULL,'2015-03-12 13:41:17',NULL,'admin',NULL,'0'),('442aa3c0062849929592fa4b8ecb3e69','74a6d0c990584db490ab9d2742b49a93','五年级6班','b230','Y',NULL,NULL,'0',NULL,'2015-03-12 13:41:17',NULL,'admin',NULL,'0'),('48086b7242aa452f98dbf4e14dfe7c57','af03e905ceff4b959a11b685e7b7415e','玉泉校区',NULL,'N',NULL,NULL,NULL,2,'2015-03-12 13:40:30','2015-03-12 13:40:41','admin','admin','0'),('4c0789002c3949d0a248ef3f099319d7','74a6d0c990584db490ab9d2742b49a93','五年级2班','b231','Y',NULL,NULL,'0',NULL,'2015-03-12 13:41:17',NULL,'admin',NULL,'0'),('56906add9fd442ba8534f83fff5b3b9b','48086b7242aa452f98dbf4e14dfe7c57','五年级7班','y31','Y',NULL,NULL,'0',NULL,'2015-03-12 13:41:17',NULL,'admin',NULL,'0'),('684a416c44014337a922ec5a19c7073c','48086b7242aa452f98dbf4e14dfe7c57','二年级15班','y24','Y',NULL,NULL,'0',NULL,'2015-03-12 13:41:17',NULL,'admin',NULL,'0'),('737762859ba841e1864d7b01d2b729f2','48086b7242aa452f98dbf4e14dfe7c57','二年级16班','y25','Y',NULL,NULL,'0',NULL,'2015-03-12 13:41:17',NULL,'admin',NULL,'0'),('74a6d0c990584db490ab9d2742b49a93','af03e905ceff4b959a11b685e7b7415e','本部',NULL,'N',NULL,NULL,NULL,1,'2015-03-12 13:40:01','2015-03-12 13:40:47','admin','admin','0'),('777832097a9c47338f841f02629e4bca','03271f59bad8472c96a0551699f8fea6','柳明三层','l1','Y',NULL,NULL,'0',NULL,'2015-03-12 13:41:17',NULL,'admin',NULL,'0'),('7fe6bafdeaaa40cbb5a6ef7d9ef96bb1','48086b7242aa452f98dbf4e14dfe7c57','六年级6班','y32','Y',NULL,NULL,'0',NULL,'2015-03-12 13:41:17',NULL,'admin',NULL,'0'),('8986300133014746ad546232ad0ffc49','74a6d0c990584db490ab9d2742b49a93','一年级6班','b240','Y',NULL,NULL,'0',NULL,'2015-03-12 13:41:17',NULL,'admin',NULL,'0'),('8abd9bafcf2043349fca1c41fa352a03','74a6d0c990584db490ab9d2742b49a93','二年级5班','b241','Y',NULL,NULL,'0',NULL,'2015-03-12 13:41:17',NULL,'admin',NULL,'0'),('9fb043f3a153417c84674448b92c9235','48086b7242aa452f98dbf4e14dfe7c57','四楼2','y34','Y',NULL,NULL,'0',NULL,'2015-03-12 13:41:17',NULL,'admin',NULL,'0'),('a13648a6952846718c756949b7b71bc1','74a6d0c990584db490ab9d2742b49a93','一年级1班','b238','Y',NULL,NULL,'0',NULL,'2015-03-12 13:41:17',NULL,'admin',NULL,'0'),('aef82d0854924bc1a8c2867a277e1fc5','74a6d0c990584db490ab9d2742b49a93','一年级2班','b239','Y',NULL,NULL,'0',NULL,'2015-03-12 13:41:17',NULL,'admin',NULL,'0'),('af03e905ceff4b959a11b685e7b7415e','0','首都师范大学附属小学',NULL,'N',NULL,NULL,'0',1,'2014-10-24 17:04:58','2015-01-15 14:15:43','cwx','admin','0'),('b185252bf0204d65aeae786b9680b781','48086b7242aa452f98dbf4e14dfe7c57','一年级17班','y20','Y',NULL,NULL,'0',NULL,'2015-03-12 13:41:17',NULL,'admin',NULL,'0'),('b41f43019d2a47b2addcf189ab1d50e0','74a6d0c990584db490ab9d2742b49a93','三年级6班','b236','Y',NULL,NULL,'0',NULL,'2015-03-12 13:41:17',NULL,'admin',NULL,'0'),('ba1e11c57ebc491eb45a28de7e1f7916','48086b7242aa452f98dbf4e14dfe7c57','一年级15班','y18','Y',NULL,NULL,'0',NULL,'2015-03-12 13:41:17',NULL,'admin',NULL,'0'),('bd0c38e443124bad85ea8f9258dafe7a','48086b7242aa452f98dbf4e14dfe7c57','三年级12班','y27','Y',NULL,NULL,'0',NULL,'2015-03-12 13:41:17',NULL,'admin',NULL,'0'),('c00744c405a24534b81f21d4bf60200d','48086b7242aa452f98dbf4e14dfe7c57','四年级9班','y30','Y',NULL,NULL,'0',NULL,'2015-03-12 13:41:17',NULL,'admin',NULL,'0'),('c9da1784676d418d8771926e9ba8aed6','48086b7242aa452f98dbf4e14dfe7c57','围棋教室','y21','Y',NULL,NULL,'0',NULL,'2015-03-12 13:41:17',NULL,'admin',NULL,'0'),('db1a20caf2f2454b9d028bc3bd0068be','74a6d0c990584db490ab9d2742b49a93','四年级5班','b237','Y',NULL,NULL,'0',NULL,'2015-03-12 13:41:17',NULL,'admin',NULL,'0'),('e0781ee65179484bb8551170c04cdf99','74a6d0c990584db490ab9d2742b49a93','五年级1班','b232','Y',NULL,NULL,'0',NULL,'2015-03-12 13:41:17',NULL,'admin',NULL,'0'),('e5fc6166ba104875b4497e3a1ead500c','48086b7242aa452f98dbf4e14dfe7c57','二年级13班','y22','Y',NULL,NULL,'0',NULL,'2015-03-12 13:41:17',NULL,'admin',NULL,'0'),('f3ddc23670244a089a6f7dddd38c3de2','74a6d0c990584db490ab9d2742b49a93','六年级1班','b233','Y',NULL,NULL,'0',NULL,'2015-03-12 13:41:17',NULL,'admin',NULL,'0'),('ff4ba7b4f3434f85a1c5f5f6d6b96277','74a6d0c990584db490ab9d2742b49a93','三年级2班','b235','Y',NULL,NULL,'0',NULL,'2015-03-12 13:41:17',NULL,'admin',NULL,'0');
/*!40000 ALTER TABLE `zonekey_area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zonekey_area_mid`
--

DROP TABLE IF EXISTS `zonekey_area_mid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zonekey_area_mid` (
  `id` char(36) NOT NULL DEFAULT '' COMMENT '设备区域ID',
  `innerid` varchar(50) DEFAULT NULL COMMENT '如果是教室，需要有一个自定义编号',
  `name` varchar(50) DEFAULT NULL COMMENT '区域名字',
  `parentname` varchar(200) DEFAULT NULL COMMENT '父节点',
  `createdate` varchar(50) DEFAULT NULL,
  `modifydate` datetime DEFAULT NULL,
  `createuser` char(36) DEFAULT NULL,
  `modifyuser` varchar(36) DEFAULT NULL,
  `deleteflag` char(1) DEFAULT '0',
  `excelbatch` varchar(300) NOT NULL COMMENT '批次',
  `flag` char(1) DEFAULT '1' COMMENT '0为导入成功，1为导入失败',
  `errordescribe` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zonekey_area_mid`
--

LOCK TABLES `zonekey_area_mid` WRITE;
/*!40000 ALTER TABLE `zonekey_area_mid` DISABLE KEYS */;
/*!40000 ALTER TABLE `zonekey_area_mid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zonekey_curriculum`
--

DROP TABLE IF EXISTS `zonekey_curriculum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zonekey_curriculum` (
  `id` char(36) NOT NULL DEFAULT '' COMMENT '课表iD',
  `termid` char(36) NOT NULL COMMENT '学期ID',
  `classid` char(36) DEFAULT NULL COMMENT '节次ID',
  `starttime` time DEFAULT NULL COMMENT '节次开始时间',
  `endtime` time DEFAULT NULL COMMENT '节次结束时间',
  `areaid` char(36) NOT NULL COMMENT '教室ID',
  `userid` char(36) NOT NULL COMMENT '上课教师',
  `deptid` char(36) DEFAULT NULL COMMENT '上课班级',
  `date` date NOT NULL COMMENT '上课时间',
  `weeks` varchar(50) NOT NULL COMMENT '第几周',
  `weekdate` varchar(50) NOT NULL COMMENT '星期',
  `record` char(1) DEFAULT NULL COMMENT '是否录课',
  `live` char(1) DEFAULT NULL COMMENT '是否直播',
  `classniddlerecord` char(1) DEFAULT NULL COMMENT '是否课间录像',
  `subject` varchar(200) DEFAULT NULL COMMENT '课程主体',
  `course_desc` varchar(200) DEFAULT NULL COMMENT '描述',
  `video` char(36) DEFAULT NULL,
  `videoupload` char(36) DEFAULT NULL,
  `livemodel` char(36) DEFAULT NULL COMMENT '直播模式',
  `intercourse` char(1) DEFAULT NULL COMMENT '互动课程',
  `classnum` int(2) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `createuser` char(36) DEFAULT NULL,
  `modifydate` datetime DEFAULT NULL,
  `modifyuser` char(36) DEFAULT NULL,
  `deleteflag` char(1) DEFAULT NULL,
  `class_relation` varchar(30) DEFAULT NULL COMMENT '课节关系',
  `isupload` char(1) DEFAULT NULL COMMENT '资源是否自动上传,0代表否，1代表是',
  `sameclass` varchar(40) DEFAULT NULL COMMENT '哪次课',
  `editclassbatch` varchar(300) DEFAULT NULL COMMENT '一次课的批次号',
  `imageurl` varchar(300) DEFAULT NULL COMMENT '课表图片上传路径',
  `uploadtime` datetime DEFAULT NULL COMMENT '资源上传时间',
  `resourcefloder` varchar(300) DEFAULT NULL COMMENT '资源文件夹名字',
  `uploaddeletestatus` char(1) DEFAULT '0' COMMENT '0：未删除 1:正在删除 2：删除成功 3：删除失败',
  `uploadstatus` char(1) DEFAULT '0' COMMENT '0：未下载 1:正在下载 2：下载成功 3：下载失败',
  `uploadbegin` datetime DEFAULT NULL,
  `uploadend` datetime DEFAULT NULL,
  `upload_is_manual` char(1) DEFAULT 'N' COMMENT 'Y:手动下载 N:未手动下载',
  `upload_is_delete` char(1) DEFAULT 'N' COMMENT 'Y:删除 N:未删除',
  PRIMARY KEY (`id`),
  KEY `curriculumbaseid` (`termid`),
  KEY `areaid` (`areaid`),
  KEY `userid` (`userid`),
  KEY `deptid` (`deptid`),
  KEY `zonekey_curriculum_unique` (`termid`,`classid`,`areaid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zonekey_curriculum`
--

LOCK TABLES `zonekey_curriculum` WRITE;
/*!40000 ALTER TABLE `zonekey_curriculum` DISABLE KEYS */;
/*!40000 ALTER TABLE `zonekey_curriculum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zonekey_curriculum_mid`
--

DROP TABLE IF EXISTS `zonekey_curriculum_mid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zonekey_curriculum_mid` (
  `isupload` char(1) DEFAULT NULL COMMENT '''资源是否自动上传,0代表否，1代表是'',',
  `id` char(36) NOT NULL DEFAULT '' COMMENT '临时课表iD',
  `userno` varchar(200) DEFAULT NULL COMMENT '教师工号',
  `username` char(200) DEFAULT NULL COMMENT '教师名称',
  `areano` char(36) DEFAULT NULL COMMENT '教室编号',
  `areaname` char(200) DEFAULT NULL COMMENT '教室名称',
  `subject` varchar(50) DEFAULT NULL COMMENT '课程名称',
  `deptno` varchar(50) DEFAULT NULL COMMENT '班级编号',
  `deptname` char(200) DEFAULT NULL COMMENT '班级名称',
  `weeks` char(1) DEFAULT NULL COMMENT '第几周',
  `weekdate` char(1) DEFAULT NULL COMMENT '周几',
  `classes` varchar(200) DEFAULT NULL COMMENT '节次',
  `live` varchar(200) DEFAULT NULL COMMENT '是否直播',
  `livemodel` char(36) DEFAULT NULL COMMENT '直播模式',
  `record` char(1) DEFAULT NULL COMMENT '是否录像',
  `video` char(36) DEFAULT NULL COMMENT '录像模式',
  `videoupload` char(1) DEFAULT NULL,
  `classniddlerecord` char(1) DEFAULT NULL COMMENT '课间录像',
  `intercourse` char(1) DEFAULT NULL COMMENT '互动课程',
  `userid` char(36) DEFAULT NULL COMMENT '教师ID',
  `areaid` char(36) DEFAULT NULL COMMENT '教室ID',
  `deptid` char(36) DEFAULT NULL COMMENT '班级ID',
  `termid` char(36) DEFAULT NULL COMMENT '学期ID',
  `flag` char(1) NOT NULL DEFAULT '1' COMMENT '检验标识,0为不通过，1为通过',
  `errordescribe` varchar(300) DEFAULT NULL COMMENT '错误描述',
  `excelbatch` varchar(300) NOT NULL COMMENT '批次',
  `weeksbefore` varchar(100) DEFAULT NULL COMMENT '解析之前的第几周',
  `weeksafter` varchar(100) DEFAULT NULL,
  `classnumbefore` char(36) DEFAULT NULL COMMENT '解析之前的节次',
  `classnumafter` char(36) DEFAULT NULL,
  `sameclass` varchar(40) DEFAULT NULL COMMENT '哪次课',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zonekey_curriculum_mid`
--

LOCK TABLES `zonekey_curriculum_mid` WRITE;
/*!40000 ALTER TABLE `zonekey_curriculum_mid` DISABLE KEYS */;
/*!40000 ALTER TABLE `zonekey_curriculum_mid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zonekey_curriculumbase`
--

DROP TABLE IF EXISTS `zonekey_curriculumbase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zonekey_curriculumbase` (
  `id` char(36) NOT NULL COMMENT '节次ID',
  `class_type` varchar(50) DEFAULT NULL COMMENT '节次方案',
  `areaid` char(36) DEFAULT NULL COMMENT '教室ID',
  `date_begin` date DEFAULT NULL COMMENT '有效期开始时间',
  `date_end` date DEFAULT NULL COMMENT '有效期结束时间',
  `termid` char(36) DEFAULT NULL COMMENT '学年ID',
  `name` varchar(50) DEFAULT NULL COMMENT '节次名称',
  `starttime` time DEFAULT NULL COMMENT '开始时间',
  `endtime` time DEFAULT NULL COMMENT '结束时间',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `createuser` char(36) DEFAULT NULL,
  `modifyuser` char(36) DEFAULT NULL,
  `modifydate` datetime DEFAULT NULL,
  `deleteflag` char(1) DEFAULT '0',
  `i_class` int(1) DEFAULT NULL COMMENT '课节对应的数字',
  `smaxclass` int(20) DEFAULT NULL,
  `maxclass` int(20) DEFAULT NULL,
  `classbatch` varchar(300) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zonekey_curriculumbase`
--

LOCK TABLES `zonekey_curriculumbase` WRITE;
/*!40000 ALTER TABLE `zonekey_curriculumbase` DISABLE KEYS */;
/*!40000 ALTER TABLE `zonekey_curriculumbase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zonekey_dept`
--

DROP TABLE IF EXISTS `zonekey_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zonekey_dept` (
  `id` char(36) NOT NULL DEFAULT '' COMMENT '组织机构 ID',
  `parentid` char(36) NOT NULL DEFAULT '' COMMENT '父节点',
  `code` varchar(50) NOT NULL COMMENT '用户自己录入的ID',
  `name` varchar(50) NOT NULL COMMENT '组织机构名称',
  `attribute` varchar(50) DEFAULT NULL COMMENT '属性,数据字典：组织机构分类',
  `description` varchar(200) DEFAULT NULL COMMENT '描述',
  `Sort` int(10) DEFAULT '0' COMMENT '排序',
  `state` char(32) DEFAULT '20' COMMENT '状态,数据字典：系统状态',
  `classyear` year(4) DEFAULT NULL COMMENT '入学年份:系统年份',
  `createdate` datetime DEFAULT NULL,
  `createuser` char(36) DEFAULT NULL,
  `modifydate` datetime DEFAULT NULL,
  `modifyuser` char(36) DEFAULT NULL,
  `deleteflag` char(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `deptid` (`parentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zonekey_dept`
--

LOCK TABLES `zonekey_dept` WRITE;
/*!40000 ALTER TABLE `zonekey_dept` DISABLE KEYS */;
INSERT INTO `zonekey_dept` VALUES ('1','0','001','首都师范大学附属小学',NULL,NULL,0,'20',NULL,NULL,NULL,'2014-09-30 14:03:52','cwx','0');
/*!40000 ALTER TABLE `zonekey_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zonekey_dept_mid`
--

DROP TABLE IF EXISTS `zonekey_dept_mid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zonekey_dept_mid` (
  `id` char(36) NOT NULL DEFAULT '' COMMENT '组织机构 ID',
  `code` varchar(50) NOT NULL COMMENT '用户自己录入的ID',
  `name` varchar(50) NOT NULL COMMENT '组织机构名称',
  `attribute` varchar(50) DEFAULT NULL COMMENT '属性,数据字典：组织机构分类',
  `areaname` varchar(50) DEFAULT NULL COMMENT '默认教室',
  `parentname` varchar(200) NOT NULL DEFAULT '' COMMENT '父节点',
  `createdate` datetime DEFAULT NULL,
  `createuser` char(36) DEFAULT NULL,
  `modifydate` datetime DEFAULT NULL,
  `modifyuser` char(36) DEFAULT NULL,
  `deleteflag` char(1) DEFAULT '0',
  `excelbatch` varchar(100) NOT NULL COMMENT '批次',
  `errordescribe` varchar(200) DEFAULT NULL COMMENT '导入失败错误描述',
  `flag` char(1) DEFAULT '1' COMMENT '0为导入成功，1为导入失败',
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `deptid` (`parentname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zonekey_dept_mid`
--

LOCK TABLES `zonekey_dept_mid` WRITE;
/*!40000 ALTER TABLE `zonekey_dept_mid` DISABLE KEYS */;
/*!40000 ALTER TABLE `zonekey_dept_mid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zonekey_device`
--

DROP TABLE IF EXISTS `zonekey_device`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zonekey_device` (
  `id` char(36) NOT NULL DEFAULT '' COMMENT '设备代码',
  `parentid` char(36) DEFAULT NULL COMMENT '父节点',
  `areaid` char(36) DEFAULT NULL COMMENT '所属区域（教室）',
  `name` varchar(50) DEFAULT NULL COMMENT '设备名称（系统定义：数据字典：设备名称）',
  `typeid` char(36) DEFAULT NULL COMMENT '设备名称（系统定义：数据字典：设备名称对应代码）',
  `MAC` varchar(48) DEFAULT NULL,
  `IP` varchar(30) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `createuser` char(32) DEFAULT NULL,
  `modifydate` datetime DEFAULT NULL,
  `modifyuser` char(32) DEFAULT NULL,
  `mostly` char(1) DEFAULT NULL COMMENT '是否是主设备',
  `deleteflag` char(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `areaid` (`areaid`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zonekey_device`
--

LOCK TABLES `zonekey_device` WRITE;
/*!40000 ALTER TABLE `zonekey_device` DISABLE KEYS */;
/*!40000 ALTER TABLE `zonekey_device` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zonekey_device_control`
--

DROP TABLE IF EXISTS `zonekey_device_control`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zonekey_device_control` (
  `id` char(36) NOT NULL DEFAULT '',
  `areaid` char(36) DEFAULT NULL,
  `serviceid` char(36) DEFAULT NULL,
  `interface_name` varchar(50) DEFAULT NULL,
  `method` varchar(50) DEFAULT NULL,
  `type` char(1) DEFAULT NULL,
  `parameter` varchar(50) DEFAULT NULL,
  `returncontent` varchar(50) DEFAULT NULL,
  `state` char(1) DEFAULT NULL,
  `createdate` datetime DEFAULT NULL,
  `modifydate` datetime DEFAULT NULL,
  `createuser` char(36) DEFAULT NULL,
  `modifyuser` char(36) DEFAULT NULL,
  `deleteflag` char(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `areaid` (`areaid`),
  KEY `serviceid` (`serviceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zonekey_device_control`
--

LOCK TABLES `zonekey_device_control` WRITE;
/*!40000 ALTER TABLE `zonekey_device_control` DISABLE KEYS */;
/*!40000 ALTER TABLE `zonekey_device_control` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zonekey_device_poling`
--

DROP TABLE IF EXISTS `zonekey_device_poling`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zonekey_device_poling` (
  `id` char(36) NOT NULL,
  `userid` char(36) NOT NULL,
  `areainfo` varchar(500) DEFAULT NULL COMMENT '轮询的教室id，逗号分隔',
  `deviceinfo` varchar(100) DEFAULT NULL COMMENT '轮询的机位id,逗号分隔',
  `polingset` char(36) DEFAULT NULL COMMENT '分屏设置，从数据字典里获取id并保存',
  `polingtime` int(5) DEFAULT NULL COMMENT '轮询间隔描述',
  `roundType` char(36) DEFAULT NULL COMMENT '轮巡模式',
  `createdate` datetime DEFAULT NULL,
  `createuser` char(36) DEFAULT NULL,
  `modifydate` datetime DEFAULT NULL,
  `modifyuser` char(36) DEFAULT NULL,
  `deleteflag` char(1) DEFAULT '0',
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zonekey_device_poling`
--

LOCK TABLES `zonekey_device_poling` WRITE;
/*!40000 ALTER TABLE `zonekey_device_poling` DISABLE KEYS */;
/*!40000 ALTER TABLE `zonekey_device_poling` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zonekey_device_service`
--

DROP TABLE IF EXISTS `zonekey_device_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zonekey_device_service` (
  `id` char(36) NOT NULL DEFAULT '' COMMENT '服务ID',
  `deviceid` char(36) NOT NULL DEFAULT '' COMMENT '设备ID',
  `name` varchar(50) DEFAULT NULL COMMENT '服务名',
  `type` char(1) DEFAULT NULL COMMENT '服务类型',
  `state` char(1) DEFAULT NULL COMMENT '服务状态',
  `url` varchar(200) DEFAULT NULL COMMENT '服务URL',
  `createtime` datetime DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL COMMENT '服务描述',
  `extendinfo` varchar(200) DEFAULT NULL,
  `modifydate` datetime DEFAULT NULL,
  `createuser` char(36) DEFAULT NULL,
  `modifyuser` char(36) DEFAULT NULL,
  `deleteflag` char(1) DEFAULT '0',
  PRIMARY KEY (`id`,`deviceid`),
  KEY `deviceid` (`deviceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zonekey_device_service`
--

LOCK TABLES `zonekey_device_service` WRITE;
/*!40000 ALTER TABLE `zonekey_device_service` DISABLE KEYS */;
/*!40000 ALTER TABLE `zonekey_device_service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zonekey_port`
--

DROP TABLE IF EXISTS `zonekey_port`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zonekey_port` (
  `id` varchar(36) NOT NULL,
  `name` varchar(36) NOT NULL COMMENT '端口器名',
  `port` varchar(10) NOT NULL COMMENT '端口',
  `serverid` varchar(36) NOT NULL COMMENT '服务器id',
  `createdate` datetime NOT NULL,
  `createuser` varchar(36) NOT NULL,
  `modifydate` datetime DEFAULT NULL,
  `modifyuser` varchar(36) DEFAULT NULL,
  `deleteflag` varchar(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='服务器端口';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zonekey_port`
--

LOCK TABLES `zonekey_port` WRITE;
/*!40000 ALTER TABLE `zonekey_port` DISABLE KEYS */;
/*!40000 ALTER TABLE `zonekey_port` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zonekey_range`
--

DROP TABLE IF EXISTS `zonekey_range`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zonekey_range` (
  `id` char(36) NOT NULL DEFAULT '' COMMENT '用户范围ID',
  `name` varchar(50) NOT NULL COMMENT '名称',
  `typeid` char(36) NOT NULL COMMENT '范围的类别  1：表示教室范围 2：表示班级范围',
  `createdate` datetime DEFAULT NULL,
  `createuser` char(36) DEFAULT NULL,
  `modifydate` datetime DEFAULT NULL,
  `modifyuser` char(36) DEFAULT NULL,
  `deleteflag` char(1) DEFAULT '0',
  `enable` char(1) DEFAULT NULL COMMENT 'N:禁止删除与修改',
  PRIMARY KEY (`id`),
  UNIQUE KEY `zonekey_range_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zonekey_range`
--

LOCK TABLES `zonekey_range` WRITE;
/*!40000 ALTER TABLE `zonekey_range` DISABLE KEYS */;
/*!40000 ALTER TABLE `zonekey_range` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zonekey_resource`
--

DROP TABLE IF EXISTS `zonekey_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zonekey_resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentid` char(36) DEFAULT NULL COMMENT '父节点',
  `resource_uuid` char(36) DEFAULT NULL COMMENT '资源唯一ID，资源上传时生成',
  `userid` char(36) DEFAULT NULL COMMENT '资源所属老师',
  `areaid` char(36) DEFAULT NULL COMMENT '资源所属教室',
  `curriculumid` varchar(100) DEFAULT NULL COMMENT '资源所属课表',
  `deptid` char(36) DEFAULT NULL COMMENT '资源所属部门',
  `name` varchar(50) DEFAULT NULL COMMENT '资源的名称',
  `course` varchar(50) DEFAULT NULL COMMENT '课程信息',
  `floder` varchar(50) DEFAULT NULL COMMENT '文件名',
  `fileurl` varchar(50) DEFAULT NULL COMMENT '资源服务器路径',
  `source` varchar(50) DEFAULT NULL COMMENT '服务器源',
  `description` varchar(200) DEFAULT NULL COMMENT '资源描述',
  `uploadstate` char(1) DEFAULT NULL COMMENT '资源上传状态:''0代表未上传，1代表已上传'',2代表上传中',
  `type` char(1) DEFAULT NULL COMMENT '类别:1代表视频；2代表图片',
  `size` int(11) DEFAULT NULL COMMENT '大小',
  `publishstate` char(36) DEFAULT '0' COMMENT '0代表未发布，1代表发布',
  `createdate` datetime DEFAULT NULL,
  `modifydate` datetime DEFAULT NULL,
  `createuser` char(36) DEFAULT NULL,
  `modifyuser` char(36) DEFAULT NULL,
  `deleteflag` char(1) DEFAULT '0' COMMENT '1为删除，0为正常',
  `timelength` varchar(50) DEFAULT NULL COMMENT '时长',
  `watchwatchnum` varchar(50) DEFAULT '0' COMMENT '观看数',
  `sorted` varchar(36) DEFAULT NULL COMMENT '分类',
  `objectpos` varchar(50) DEFAULT NULL COMMENT '视频机位',
  `publishdate` date DEFAULT NULL COMMENT '发布日期',
  `attribute` char(1) DEFAULT 'N' COMMENT '是否是文件夹 Y:是文件夹',
  `label` varchar(100) DEFAULT NULL COMMENT '标签',
  `resourcetype` varchar(100) DEFAULT NULL COMMENT '资源类型',
  `subject` varchar(100) DEFAULT NULL COMMENT '学科',
  `grade` varchar(100) DEFAULT NULL COMMENT '阶段',
  `resourcename` varchar(200) DEFAULT NULL COMMENT '资源名称',
  `status` varchar(2) DEFAULT '-1' COMMENT '点播上传状态:0:正在上传,1:上传完成,-1:未上传',
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  KEY `curriculumid` (`curriculumid`),
  KEY `deptid` (`deptid`),
  KEY `areaid` (`areaid`),
  KEY `zonekey_resource_unique` (`resource_uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=18801 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zonekey_resource`
--

LOCK TABLES `zonekey_resource` WRITE;
/*!40000 ALTER TABLE `zonekey_resource` DISABLE KEYS */;
/*!40000 ALTER TABLE `zonekey_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zonekey_resource_curriculum_strategy`
--

DROP TABLE IF EXISTS `zonekey_resource_curriculum_strategy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zonekey_resource_curriculum_strategy` (
  `id` char(32) NOT NULL,
  `areaid` char(32) DEFAULT '0' COMMENT '区域，默认是整个区域范围',
  `typeid` char(32) DEFAULT NULL COMMENT '策略类型 1：每天开机同步 2：每周  开机同步 3:录像任务有更新时，立即同步',
  `week` int(11) DEFAULT NULL COMMENT '日期(1-7)数字，表示周一-周五',
  `starttime` char(5) DEFAULT NULL COMMENT '开始时间',
  `endtime` char(5) DEFAULT NULL COMMENT '结束时间',
  `createtime` datetime DEFAULT NULL,
  `modifytime` datetime DEFAULT NULL,
  `createuser` varchar(50) DEFAULT NULL,
  `modifyuser` varchar(50) DEFAULT NULL,
  `deleteflag` char(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zonekey_resource_curriculum_strategy`
--

LOCK TABLES `zonekey_resource_curriculum_strategy` WRITE;
/*!40000 ALTER TABLE `zonekey_resource_curriculum_strategy` DISABLE KEYS */;
INSERT INTO `zonekey_resource_curriculum_strategy` VALUES ('c333c1d71fcb46909a970877bba5af01','0','1',NULL,NULL,NULL,'2015-03-09 17:00:49','2015-03-09 17:02:03','admin','admin','0');
/*!40000 ALTER TABLE `zonekey_resource_curriculum_strategy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zonekey_resource_mid`
--

DROP TABLE IF EXISTS `zonekey_resource_mid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zonekey_resource_mid` (
  `id` char(36) NOT NULL,
  `name` varchar(50) DEFAULT NULL COMMENT '资源名称',
  `size` int(11) DEFAULT NULL,
  `timelength` varchar(50) DEFAULT NULL COMMENT '时长',
  `areaid` char(36) DEFAULT NULL,
  `createdate` datetime DEFAULT NULL,
  `modifydate` datetime DEFAULT NULL,
  `modifyuser` char(36) DEFAULT NULL,
  `deleteflag` char(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zonekey_resource_mid`
--

LOCK TABLES `zonekey_resource_mid` WRITE;
/*!40000 ALTER TABLE `zonekey_resource_mid` DISABLE KEYS */;
/*!40000 ALTER TABLE `zonekey_resource_mid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zonekey_resource_remove_strategy`
--

DROP TABLE IF EXISTS `zonekey_resource_remove_strategy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zonekey_resource_remove_strategy` (
  `id` char(32) NOT NULL,
  `areaid` char(32) DEFAULT NULL,
  `typeid` char(32) DEFAULT NULL,
  `space` float DEFAULT NULL,
  `days` char(50) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `modifytime` datetime DEFAULT NULL,
  `createuser` varchar(50) DEFAULT NULL,
  `modifyuser` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zonekey_resource_remove_strategy`
--

LOCK TABLES `zonekey_resource_remove_strategy` WRITE;
/*!40000 ALTER TABLE `zonekey_resource_remove_strategy` DISABLE KEYS */;
INSERT INTO `zonekey_resource_remove_strategy` VALUES ('ca6670b066ac42aebd2dd1d2ae3b5ad5','0','2',0,'1','2015-03-09 17:01:56','2015-03-09 17:02:03','admin',NULL);
/*!40000 ALTER TABLE `zonekey_resource_remove_strategy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zonekey_resource_scheam`
--

DROP TABLE IF EXISTS `zonekey_resource_scheam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zonekey_resource_scheam` (
  `id` char(36) NOT NULL DEFAULT '' COMMENT '用户范围ID',
  `sort` varchar(2) NOT NULL COMMENT '视频源顺序',
  `name` varchar(20) NOT NULL COMMENT '显示名称',
  `filename` varchar(20) NOT NULL COMMENT '录像文件名称',
  `code` varchar(40) NOT NULL COMMENT '跟踪机编码',
  `ismovie` tinyint(1) NOT NULL,
  `classscheam` char(1) NOT NULL COMMENT '教室配置方案',
  `createdate` datetime DEFAULT NULL,
  `createuser` char(36) DEFAULT NULL,
  `modifydate` datetime DEFAULT NULL,
  `modifyuser` char(36) DEFAULT NULL,
  `deleteflag` char(1) DEFAULT '0',
  `enable` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='录播方案';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zonekey_resource_scheam`
--

LOCK TABLES `zonekey_resource_scheam` WRITE;
/*!40000 ALTER TABLE `zonekey_resource_scheam` DISABLE KEYS */;
/*!40000 ALTER TABLE `zonekey_resource_scheam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zonekey_resource_timer`
--

DROP TABLE IF EXISTS `zonekey_resource_timer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zonekey_resource_timer` (
  `id` char(32) DEFAULT NULL COMMENT '任务id',
  `time` datetime DEFAULT NULL COMMENT '执行任务时间',
  `ftpserver` varchar(20) DEFAULT NULL COMMENT '设备ip',
  `foldername` varchar(100) DEFAULT NULL COMMENT '放在资源平台的文件目录名称',
  `status` char(1) DEFAULT NULL COMMENT '下载状态 0:未下载 1：正在下载 2：已下载 3：已删除',
  `download_start` char(5) DEFAULT NULL COMMENT '下载开始时间',
  `download_end` char(5) DEFAULT NULL COMMENT '下载结束时间',
  `delete_time` datetime DEFAULT NULL COMMENT '删除试卷'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zonekey_resource_timer`
--

LOCK TABLES `zonekey_resource_timer` WRITE;
/*!40000 ALTER TABLE `zonekey_resource_timer` DISABLE KEYS */;
/*!40000 ALTER TABLE `zonekey_resource_timer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zonekey_resource_upload_strategy`
--

DROP TABLE IF EXISTS `zonekey_resource_upload_strategy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zonekey_resource_upload_strategy` (
  `id` char(32) NOT NULL,
  `areaid` char(32) DEFAULT '0' COMMENT '区域，默认是整个区域范围',
  `typeid` char(32) DEFAULT NULL COMMENT '策略类型 1：日期策略 2：时间策略 3:手工下载',
  `week` int(11) DEFAULT NULL COMMENT '日期(1-7)数字，表示周一-周五',
  `starttime` char(5) DEFAULT NULL COMMENT '开始时间',
  `endtime` char(5) DEFAULT NULL COMMENT '结束时间',
  `createtime` datetime DEFAULT NULL,
  `modifytime` datetime DEFAULT NULL,
  `createuser` varchar(50) DEFAULT NULL,
  `modifyuser` varchar(50) DEFAULT NULL,
  `deleteflag` char(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zonekey_resource_upload_strategy`
--

LOCK TABLES `zonekey_resource_upload_strategy` WRITE;
/*!40000 ALTER TABLE `zonekey_resource_upload_strategy` DISABLE KEYS */;
INSERT INTO `zonekey_resource_upload_strategy` VALUES ('ce3befc5a0414190b02d68b8021507d1','0','2',NULL,NULL,NULL,'2015-03-09 17:00:49','2015-03-09 17:02:03','admin','admin','0');
/*!40000 ALTER TABLE `zonekey_resource_upload_strategy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zonekey_resource_warn_strategy`
--

DROP TABLE IF EXISTS `zonekey_resource_warn_strategy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zonekey_resource_warn_strategy` (
  `id` char(32) NOT NULL,
  `areaid` char(32) DEFAULT NULL,
  `typeid` char(32) DEFAULT NULL COMMENT '1：磁盘空间不足多少时报警 2：录像时间不足几小时时报警',
  `space` float DEFAULT NULL COMMENT '磁盘空间不足多少时报警',
  `times` char(50) DEFAULT NULL COMMENT '录像时间不足几小时时报警',
  `createtime` datetime DEFAULT NULL,
  `modifytime` datetime DEFAULT NULL,
  `createuser` varchar(50) DEFAULT NULL,
  `modifyuser` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zonekey_resource_warn_strategy`
--

LOCK TABLES `zonekey_resource_warn_strategy` WRITE;
/*!40000 ALTER TABLE `zonekey_resource_warn_strategy` DISABLE KEYS */;
/*!40000 ALTER TABLE `zonekey_resource_warn_strategy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zonekey_rtmp_classroom`
--

DROP TABLE IF EXISTS `zonekey_rtmp_classroom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zonekey_rtmp_classroom` (
  `id` char(36) NOT NULL DEFAULT '',
  `areaid` varchar(36) NOT NULL COMMENT '教室id',
  `rtmpscheam` varchar(32) NOT NULL COMMENT '配置方案value',
  `createdate` datetime DEFAULT NULL,
  `createuser` char(36) DEFAULT NULL,
  `modifydate` datetime DEFAULT NULL,
  `modifyuser` char(36) DEFAULT NULL,
  `deleteflag` char(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='rtmp方案应用列表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zonekey_rtmp_classroom`
--

LOCK TABLES `zonekey_rtmp_classroom` WRITE;
/*!40000 ALTER TABLE `zonekey_rtmp_classroom` DISABLE KEYS */;
/*!40000 ALTER TABLE `zonekey_rtmp_classroom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zonekey_rtmp_scheam`
--

DROP TABLE IF EXISTS `zonekey_rtmp_scheam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zonekey_rtmp_scheam` (
  `id` char(36) NOT NULL DEFAULT '' COMMENT '用户范围ID',
  `rtmpscheam` varchar(50) DEFAULT NULL COMMENT '录像方案',
  `videoCodeType` varchar(50) DEFAULT NULL COMMENT '视频编码类型',
  `auditCodeType` varchar(50) DEFAULT NULL COMMENT '音频编码类型',
  `bFrame` varchar(50) DEFAULT NULL,
  `recordProfile` varchar(50) DEFAULT NULL,
  `recordLevel` varchar(50) DEFAULT NULL,
  `recordEntropy` varchar(50) DEFAULT NULL,
  `recordComplexity` varchar(50) DEFAULT NULL,
  `gop` varchar(50) DEFAULT NULL,
  `bitrate` varchar(50) DEFAULT NULL,
  `framerate` varchar(50) DEFAULT NULL,
  `movieResoluation` varchar(50) DEFAULT NULL,
  `createuser` char(36) DEFAULT NULL,
  `createdate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='录像方案';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zonekey_rtmp_scheam`
--

LOCK TABLES `zonekey_rtmp_scheam` WRITE;
/*!40000 ALTER TABLE `zonekey_rtmp_scheam` DISABLE KEYS */;
/*!40000 ALTER TABLE `zonekey_rtmp_scheam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zonekey_rtsp_classroom`
--

DROP TABLE IF EXISTS `zonekey_rtsp_classroom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zonekey_rtsp_classroom` (
  `id` char(36) NOT NULL DEFAULT '',
  `areaid` varchar(36) NOT NULL COMMENT '教室id',
  `rtspscheam` varchar(32) NOT NULL COMMENT '配置方案value',
  `createdate` datetime DEFAULT NULL,
  `createuser` char(36) DEFAULT NULL,
  `modifydate` datetime DEFAULT NULL,
  `modifyuser` char(36) DEFAULT NULL,
  `deleteflag` char(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='rtsp方案应用列表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zonekey_rtsp_classroom`
--

LOCK TABLES `zonekey_rtsp_classroom` WRITE;
/*!40000 ALTER TABLE `zonekey_rtsp_classroom` DISABLE KEYS */;
/*!40000 ALTER TABLE `zonekey_rtsp_classroom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zonekey_rtsp_scheam`
--

DROP TABLE IF EXISTS `zonekey_rtsp_scheam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zonekey_rtsp_scheam` (
  `id` char(36) NOT NULL DEFAULT '' COMMENT '用户范围ID',
  `sort` int(11) NOT NULL COMMENT '视频源顺序',
  `rtspscheam` varchar(50) NOT NULL COMMENT '录像方案',
  `videoCodeType` varchar(50) NOT NULL COMMENT '视频编码类型',
  `auditCodeType` varchar(50) NOT NULL COMMENT '音频编码类型',
  `bFrame` varchar(50) NOT NULL,
  `recordProfile` varchar(50) NOT NULL,
  `recordLevel` varchar(50) NOT NULL,
  `recordEntropy` varchar(50) NOT NULL,
  `recordComplexity` varchar(50) NOT NULL,
  `gop` varchar(50) NOT NULL,
  `bitrate` varchar(50) NOT NULL,
  `framerate` varchar(50) NOT NULL,
  `movieResoluation` varchar(50) NOT NULL,
  `createuser` char(36) DEFAULT NULL,
  `createdate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='rtsp方案';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zonekey_rtsp_scheam`
--

LOCK TABLES `zonekey_rtsp_scheam` WRITE;
/*!40000 ALTER TABLE `zonekey_rtsp_scheam` DISABLE KEYS */;
/*!40000 ALTER TABLE `zonekey_rtsp_scheam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zonekey_scheam_classroom`
--

DROP TABLE IF EXISTS `zonekey_scheam_classroom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zonekey_scheam_classroom` (
  `id` char(36) NOT NULL DEFAULT '',
  `areaid` varchar(36) NOT NULL COMMENT '教室id',
  `classscheam` varchar(32) NOT NULL COMMENT '配置方案value',
  `createdate` datetime DEFAULT NULL,
  `createuser` char(36) DEFAULT NULL,
  `modifydate` datetime DEFAULT NULL,
  `modifyuser` char(36) DEFAULT NULL,
  `deleteflag` char(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='rtsp方案应用列表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zonekey_scheam_classroom`
--

LOCK TABLES `zonekey_scheam_classroom` WRITE;
/*!40000 ALTER TABLE `zonekey_scheam_classroom` DISABLE KEYS */;
/*!40000 ALTER TABLE `zonekey_scheam_classroom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zonekey_server`
--

DROP TABLE IF EXISTS `zonekey_server`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zonekey_server` (
  `id` varchar(36) NOT NULL,
  `name` varchar(36) NOT NULL COMMENT '服务器名',
  `type` varchar(4) NOT NULL COMMENT '服务器类型',
  `address` varchar(36) NOT NULL COMMENT '地址',
  `createdate` datetime NOT NULL,
  `createuser` varchar(36) NOT NULL,
  `modifydate` datetime DEFAULT NULL,
  `modifyuser` varchar(36) DEFAULT NULL,
  `deleteflag` varchar(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='服务器配置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zonekey_server`
--

LOCK TABLES `zonekey_server` WRITE;
/*!40000 ALTER TABLE `zonekey_server` DISABLE KEYS */;
INSERT INTO `zonekey_server` VALUES ('5b220d82ceae4f518790f76a833aff3c','vds(118)','3','192.168.12.118','2015-01-15 17:28:11','admin',NULL,NULL,'0'),('669e478af416440893f545a58ab22b64','code(211)','2','192.168.12.211','2015-01-15 17:17:15','admin',NULL,NULL,'0'),('882de2042d7e47e38124943c14b22f2d','中继（117）','4','192.168.13.117','2015-01-15 17:12:51','admin',NULL,NULL,'0'),('b07c9c0117774889ba7c6a79f4980a0d','点播','6','192.168.12.214','2015-01-28 21:52:11','admin',NULL,NULL,'0'),('e5bb37fc96fc49ddb0195d06fe284625','web服务器','1','192.168.12.214','2015-01-19 15:16:30','admin',NULL,NULL,'0');
/*!40000 ALTER TABLE `zonekey_server` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zonekey_term`
--

DROP TABLE IF EXISTS `zonekey_term`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zonekey_term` (
  `id` char(36) NOT NULL COMMENT '学期id',
  `termname` varchar(100) NOT NULL COMMENT '学期名称',
  `startday` date NOT NULL COMMENT '开始日期',
  `weeks` int(5) NOT NULL COMMENT '上课周数',
  `createdate` datetime DEFAULT NULL,
  `createuser` char(36) DEFAULT NULL,
  `modifydate` datetime DEFAULT NULL,
  `modifyuser` char(36) DEFAULT NULL,
  `deleteflag` char(1) DEFAULT NULL,
  `is_current` char(10) DEFAULT NULL COMMENT '是否是当前学期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `zonekey_term_unique` (`termname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zonekey_term`
--

LOCK TABLES `zonekey_term` WRITE;
/*!40000 ALTER TABLE `zonekey_term` DISABLE KEYS */;
/*!40000 ALTER TABLE `zonekey_term` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zonekey_video_scheam`
--

DROP TABLE IF EXISTS `zonekey_video_scheam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zonekey_video_scheam` (
  `id` char(36) NOT NULL DEFAULT '' COMMENT '用户范围ID',
  `sort` int(11) DEFAULT NULL COMMENT '视频源顺序',
  `videoscheam` varchar(50) DEFAULT NULL COMMENT '录像方案',
  `address` varchar(20) DEFAULT NULL COMMENT '物理地址配置',
  `cardType` varchar(50) DEFAULT NULL COMMENT '采集卡类型',
  `backEnable` varchar(20) DEFAULT NULL COMMENT '反交错启用',
  `backType` varchar(40) DEFAULT NULL COMMENT '反交错类型',
  `videoResolution` varchar(50) DEFAULT NULL COMMENT '视频分辨率',
  `videoType` varchar(50) DEFAULT NULL COMMENT '视频接口类型',
  `audioType` varchar(50) DEFAULT NULL COMMENT '音频类型',
  `videoCodeType` varchar(50) DEFAULT NULL COMMENT '视频编码类型',
  `auditCodeType` varchar(50) DEFAULT NULL COMMENT '音频编码类型',
  `bFrame` varchar(50) DEFAULT NULL,
  `recordProfile` varchar(50) DEFAULT NULL,
  `recordLevel` varchar(50) DEFAULT NULL,
  `recordEntropy` varchar(50) DEFAULT NULL,
  `recordComplexity` varchar(50) DEFAULT NULL,
  `gop` varchar(50) DEFAULT NULL,
  `bitrate` varchar(50) DEFAULT NULL,
  `framerate` varchar(50) DEFAULT NULL,
  `format` varchar(50) DEFAULT NULL,
  `movieResoluation` varchar(50) DEFAULT NULL,
  `createuser` char(36) DEFAULT NULL,
  `createdate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='录像方案';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zonekey_video_scheam`
--

LOCK TABLES `zonekey_video_scheam` WRITE;
/*!40000 ALTER TABLE `zonekey_video_scheam` DISABLE KEYS */;
/*!40000 ALTER TABLE `zonekey_video_scheam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'dis_sdsf'
--

--
-- Dumping routines for database 'dis_sdsf'
--
/*!50003 DROP FUNCTION IF EXISTS `getareaChildLst` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `getareaChildLst`(`rootId` VARCHAR(100)) RETURNS text CHARSET utf8
BEGIN
DECLARE sTemp TEXT;
DECLARE sTempChd TEXT;
SET sTemp = '$';
SET sTempChd =rootId;
WHILE sTempChd IS NOT NULL DO
SET sTemp = CONCAT(sTemp,',',sTempChd);
SELECT GROUP_CONCAT(id) INTO sTempChd FROM zonekey_area WHERE FIND_IN_SET(parentid,sTempChd)>0 AND deleteflag='0';
END WHILE;
RETURN sTemp;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getAreaParentLst` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getAreaParentLst`(childId VARCHAR(32)) RETURNS text CHARSET utf8
BEGIN
 DECLARE sTemp  TEXT;
 DECLARE sTempparent TEXT;
  SET sTemp = '$';
 SET sTempparent =childId;
  WHILE sTempParent IS NOT NULL DO
	SET sTemp = CONCAT(sTemp,',',sTempParent);
	SELECT GROUP_CONCAT(parentid) INTO sTempParent FROM zonekey_area WHERE FIND_IN_SET(id,sTempParent)>0 
	;
  END WHILE;
  RETURN sTemp;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getDeptChildLst` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getDeptChildLst`(`rootId` VARCHAR(100)) RETURNS text CHARSET utf8
BEGIN
	DECLARE sTemp text;
	DECLARE sTempChd TEXT;
	SET sTemp = '$';
	SET sTempChd =rootId;
	WHILE sTempChd IS NOT NULL DO
		SET sTemp = CONCAT(sTemp,',',sTempChd);
		SELECT GROUP_CONCAT(id) INTO sTempChd FROM zonekey_dept WHERE FIND_IN_SET(parentid,sTempChd)>0 and deleteflag='0';
	END WHILE;
	RETURN sTemp;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-03-19 11:36:28
