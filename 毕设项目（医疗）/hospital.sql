/*
SQLyog Ultimate v12.08 (64 bit)
MySQL - 8.0.22 : Database - hospitalized
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`hospitalized` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `hospitalized`;

/*Table structure for table `dict` */

CREATE TABLE `dict` (
  `id` int NOT NULL COMMENT '字典表主键',
  `code` varchar(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '字典码',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '字典码对应的名字',
  `value` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '字典码对应的值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `dict` */

insert  into `dict`(`id`,`code`,`name`,`value`) values (1,'001','民族','汉族'),(2,'001','民族','蒙古族'),(3,'001','民族','回族'),(4,'001','民族','藏族'),(5,'001','民族','维吾尔族'),(6,'001','民族','苗族'),(7,'001','民族','彝族'),(8,'001','民族','壮族'),(9,'001','民族','布依族'),(10,'001','民族','朝鲜族'),(11,'001','民族','满族'),(12,'001','民族','侗族'),(13,'001','民族','瑶族'),(14,'001','民族','白族'),(15,'001','民族','土家族'),(16,'001','民族','哈尼族'),(17,'001','民族','哈萨克族'),(18,'001','民族','傣族'),(19,'001','民族','黎族'),(20,'001','民族','僳僳族'),(21,'001','民族','佤族'),(22,'001','民族','畲族'),(23,'001','民族','高山族'),(24,'001','民族','拉祜族'),(25,'001','民族','水族'),(26,'001','民族','东乡族'),(27,'001','民族','纳西族'),(28,'001','民族','景颇族'),(29,'001','民族','柯尔克孜族'),(30,'001','民族','土族'),(31,'001','民族','达斡尔族'),(32,'001','民族','仫佬族'),(33,'001','民族','羌族'),(34,'001','民族','布朗族'),(35,'001','民族','撒拉族'),(36,'001','民族','毛南族'),(37,'001','民族','仡佬族'),(38,'001','民族','锡伯族'),(39,'001','民族','阿昌族'),(40,'001','民族','普米族'),(41,'001','民族','塔吉克族'),(42,'001','民族','怒族'),(43,'001','民族','乌孜别克族'),(44,'001','民族','俄罗斯族'),(45,'001','民族','鄂温克族'),(46,'001','民族','德昂族'),(47,'001','民族','保安族'),(48,'001','民族','裕固族'),(49,'001','民族','京族'),(50,'001','民族','塔塔尔族'),(51,'001','民族','独龙族'),(52,'001','民族','鄂伦春族'),(53,'001','民族','赫哲族'),(54,'001','民族','门巴族'),(55,'001','民族','珞巴族'),(56,'001','民族','基诺族'),(57,'002','日志事件类型','INFO'),(58,'002','日志事件类型','WARN'),(59,'002','日志事件类型','ERROR'),(60,'002','日志事件类型','DEBUG');

/*Table structure for table `doctor` */

CREATE TABLE `doctor` (
  `did` bigint NOT NULL AUTO_INCREMENT COMMENT '医生主键',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '医生姓名',
  `hiredate` date DEFAULT NULL COMMENT '雇佣日期',
  `is_male` tinyint(1) DEFAULT NULL COMMENT '是否为男性',
  `tid` int DEFAULT NULL COMMENT '医生类型外键',
  `pid` int DEFAULT NULL COMMENT '医生职位外键',
  `is_retire` tinyint(1) DEFAULT NULL COMMENT '是否离职',
  PRIMARY KEY (`did`),
  UNIQUE KEY `UNIQUE` (`name`),
  KEY `tid` (`tid`),
  KEY `pid` (`pid`),
  CONSTRAINT `doctor_ibfk_1` FOREIGN KEY (`tid`) REFERENCES `doctor_type` (`tid`),
  CONSTRAINT `doctor_ibfk_2` FOREIGN KEY (`pid`) REFERENCES `doctor_position` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `doctor` */

insert  into `doctor`(`did`,`name`,`hiredate`,`is_male`,`tid`,`pid`,`is_retire`) values (1,'张三','2021-03-04',1,1,1,0),(2,'李四','2021-03-02',1,2,1,1),(12,'测试','2021-02-28',1,2,1,0),(13,'阿萨德','2021-02-28',1,1,1,0),(14,'测试2','2021-03-07',0,2,1,0),(15,'ces','2021-03-09',0,1,1,0),(16,'ceshi','2021-03-09',1,2,1,0);

/*Table structure for table `doctor_position` */

CREATE TABLE `doctor_position` (
  `pid` int NOT NULL COMMENT '医生职位主键',
  `code` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '码值',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '码值对应职位名',
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `doctor_position` */

insert  into `doctor_position`(`pid`,`code`,`name`) values (1,'001','住院医师'),(2,'002','主治医师'),(3,'003','副主任医师'),(4,'004','主任医师');

/*Table structure for table `doctor_type` */

CREATE TABLE `doctor_type` (
  `tid` int NOT NULL COMMENT '医生类型主键',
  `code` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '码值',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '码值对应的名',
  PRIMARY KEY (`tid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='ҽ?????ͣ???ҽ???????Ŀ???\r\n';

/*Data for the table `doctor_type` */

insert  into `doctor_type`(`tid`,`code`,`name`) values (1,'001','呼吸内科'),(2,'002','消化内科'),(3,'003','泌尿内科'),(4,'004','心内科'),(5,'005','血液科'),(6,'006','小儿科'),(7,'007','内分泌科'),(8,'008','神经内科'),(9,'009','感染科'),(10,'010','骨科'),(11,'011','神经外科'),(12,'012','肝胆外科'),(13,'013','烧伤科'),(14,'014','妇科'),(15,'015','产科');

/*Table structure for table `hospitalized` */

CREATE TABLE `hospitalized` (
  `hid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '住院单主键',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '患者姓名',
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '患者身份证',
  `nation_id` int DEFAULT NULL COMMENT '民族外键',
  `sex` tinyint(1) DEFAULT NULL COMMENT '性别：1男，0女',
  `workaddress` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '工作地址',
  `birthday` date DEFAULT NULL COMMENT '出生日期',
  `address` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '家庭住址',
  `phone` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '电话号码',
  `is_married` tinyint(1) DEFAULT NULL COMMENT '是否结婚',
  `body_status` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '入院身体状态',
  `emerge_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '紧急联系人',
  `emerge_phone` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '紧急联系人电话',
  `did` bigint DEFAULT NULL COMMENT '分配医生外键',
  `wid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '病房外键',
  `sid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '床位外键',
  `enroll_time` timestamp NULL DEFAULT NULL COMMENT '入院时间',
  `is_active` tinyint(1) DEFAULT NULL COMMENT '是否仍在住院',
  `nid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '护士外键',
  PRIMARY KEY (`hid`),
  KEY `nation_id` (`nation_id`),
  KEY `did` (`did`),
  KEY `wid` (`wid`),
  KEY `sid` (`sid`),
  KEY `hospitalized_nurse_id` (`nid`),
  CONSTRAINT `hospitalized_ibfk_1` FOREIGN KEY (`nation_id`) REFERENCES `dict` (`id`),
  CONSTRAINT `hospitalized_ibfk_2` FOREIGN KEY (`did`) REFERENCES `doctor` (`did`),
  CONSTRAINT `hospitalized_ibfk_3` FOREIGN KEY (`wid`) REFERENCES `ward` (`wid`),
  CONSTRAINT `hospitalized_ibfk_4` FOREIGN KEY (`sid`) REFERENCES `sickbed` (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='??Ժ?ǼǱ';

/*Data for the table `hospitalized` */

insert  into `hospitalized`(`hid`,`name`,`id`,`nation_id`,`sex`,`workaddress`,`birthday`,`address`,`phone`,`is_married`,`body_status`,`emerge_name`,`emerge_phone`,`did`,`wid`,`sid`,`enroll_time`,`is_active`,`nid`) values ('1372386211246362625','病人1','513436200003166012',1,1,'测试','2021-03-10','测试住址','82615632132',0,'一般','病人2','159382615312',1,'100','100001','2021-03-17 03:15:44',0,'1371376369559879681'),('1372476662569672706','嵇明','513436200003168034',1,1,'某某某','2021-03-16','某某某','18316388181',0,'一般','某某某','836152535',12,'100','100001','2021-03-18 09:15:09',0,'1371376369559879681'),('1372481043306291201','史娥 ','513436200003166012',1,0,'某某某','2021-03-10','某某某','18763625173',0,'一般','某某某','827155321',15,'100','100002','2021-03-18 09:32:33',0,'1371376369559879681'),('1374186540279414786','尤莲','513436200003196510',1,0,'某某某地','2021-03-15','某某某地','18702873612',0,'一般','某某某','8271636361',1,'100','100003','2021-03-23 02:29:36',0,'1371376369559879681'),('1390170312359456770','郝诚婉','513436200004219059',1,0,'西安市某单位','2000-04-21','西安市长安区某地','18726251638',0,'一般，略微感冒','郝键','1827271831',1,'100','100001','2021-05-06 05:03:24',0,'1371376369559879681'),('1390538724705591297','关咏寒','513436200004216130',1,1,'西安市某xxx公司','2000-04-21','西安市某地','18271636213',0,'一般','关羽','18271372132',1,'100','100002','2021-05-07 13:27:20',0,'1371376369559879681'),('1398113710198775810','鲁呈敬','130425198708092057',1,1,'无','2021-05-28','河北省邯郸市大名县黄金堤乡黄金堤四村1组40号','1827616563',0,'一般','鲁呈','18727178321',1,'100','100001','2021-05-28 11:07:37',1,'1371376369559879681'),('1398114230506381313','孙宇','210181199209046813',1,1,'辽宁省新民市陶家屯','1992-09-04','辽宁省新民市陶家屯','18271553123',0,'一般','测试','18271532133',1,'100','100003','2021-05-28 11:09:41',1,'1371376369559879681'),('1398114608962625538','林晓光','222302197312260017',1,1,'吉林省洮南市光明街','1972-12-26','吉林省洮南市光明街','1382716362',0,'一般','关羽','176281723131',1,'100','100004','2021-05-28 11:11:11',1,'1371376369559879681');

/*Table structure for table `log` */

CREATE TABLE `log` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `type_id` int DEFAULT NULL COMMENT '日志类型',
  `happen_time` timestamp NULL DEFAULT NULL COMMENT '发生时间',
  `describ` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '描述',
  `operate` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '操作状态',
  PRIMARY KEY (`id`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `log_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `dict` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=221 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='??????־';

/*Data for the table `log` */

insert  into `log`(`id`,`type_id`,`happen_time`,`describ`,`operate`) values (1,57,'2021-04-21 15:22:01','test','admin'),(2,57,'2021-04-21 07:29:55','登录成功','admin'),(3,58,'2021-04-21 07:30:37','Bad credentials','账户用户名或密码错误'),(4,58,'2021-04-21 07:30:41','Bad credentials','账户用户名或密码错误'),(5,57,'2021-04-21 07:30:47','登录成功','admin'),(11,57,'2021-04-21 08:39:55','该用户还未进行出院登记','操作失败'),(12,57,'2021-04-21 09:42:49','该住院号不存在','操作失败'),(13,57,'2021-04-21 09:50:58','出院登记','出院人: 尤莲'),(14,57,'2021-04-21 10:05:44','该住院号不存在','操作失败'),(15,58,'2021-04-27 06:21:45','Bad credentials','账户用户名或密码错误'),(16,57,'2021-04-27 06:21:50','登录成功','admin'),(17,57,'2021-04-28 11:10:42','登录成功','admin'),(18,57,'2021-05-05 10:15:38','登录成功','admin'),(19,57,'2021-05-05 10:19:08','该用户还未进行出院登记','操作失败'),(20,57,'2021-05-05 10:20:33','出院登记','出院人: 嵇明'),(21,57,'2021-05-05 10:33:33','出院登记','出院人: 史娥 '),(22,57,'2021-05-05 10:35:38','支付成功（返还成功）','住院号：1372481043306291201, 支付成功'),(23,57,'2021-05-06 04:47:13','该住院号不存在','操作失败'),(24,57,'2021-05-06 05:03:25','用户住院登记','郝诚婉'),(25,57,'2021-05-06 05:06:16','预缴费','缴费人:郝诚婉, 缴费费用: 200'),(26,57,'2021-05-06 05:13:57','登录成功','nurse'),(27,58,'2021-05-06 05:17:04','Bad credentials','账户用户名或密码错误'),(28,57,'2021-05-06 05:17:09','登录成功','test'),(29,57,'2021-05-06 05:17:26','登录成功','admin'),(30,57,'2021-05-06 05:23:00','登录成功','nurse'),(31,57,'2021-05-06 05:24:07','登录成功','admin'),(32,57,'2021-05-06 05:27:44','登录成功','admin'),(33,57,'2021-05-07 05:27:22','用户住院登记','关咏寒'),(34,57,'2021-05-07 05:28:59','登录成功','admin'),(35,57,'2021-05-07 05:29:48','预缴费','缴费人:关咏寒, 缴费费用: 200'),(36,57,'2021-05-07 06:57:07','登录成功','nurse'),(37,57,'2021-05-08 01:44:24','登录成功','admin'),(38,58,'2021-05-08 01:47:58','Bad credentials','账户用户名或密码错误'),(39,58,'2021-05-08 01:51:01','Bad credentials','账户用户名或密码错误'),(40,58,'2021-05-08 01:52:20','Bad credentials','账户用户名或密码错误'),(41,58,'2021-05-08 01:52:48','Bad credentials','账户用户名或密码错误'),(42,58,'2021-05-08 01:53:18','Bad credentials','账户用户名或密码错误'),(43,58,'2021-05-08 01:53:34','Bad credentials','账户用户名或密码错误'),(44,58,'2021-05-08 01:53:38','Bad credentials','账户用户名或密码错误'),(45,58,'2021-05-08 01:53:41','Bad credentials','账户用户名或密码错误'),(46,58,'2021-05-08 01:53:44','Bad credentials','账户用户名或密码错误'),(47,58,'2021-05-08 01:53:50','Bad credentials','账户用户名或密码错误'),(48,58,'2021-05-08 01:53:54','Bad credentials','账户用户名或密码错误'),(49,58,'2021-05-08 01:53:56','Bad credentials','账户用户名或密码错误'),(50,57,'2021-05-08 01:54:08','登录成功','admin'),(51,57,'2021-05-08 02:21:51','注册成功','front'),(52,57,'2021-05-08 02:28:08','登录成功','front'),(53,57,'2021-05-08 04:40:01','登录成功','front'),(54,57,'2021-05-08 05:41:03','登录成功','admin'),(55,57,'2021-05-08 05:41:59','登录成功','front'),(56,57,'2021-05-08 05:53:37','登录成功','admin'),(57,57,'2021-05-09 01:24:27','登录成功','front'),(58,57,'2021-05-09 01:27:21','登录成功','front'),(59,57,'2021-05-09 01:33:03','登录成功','front'),(60,58,'2021-05-09 01:33:10','Bad credentials','账户用户名或密码错误'),(61,57,'2021-05-09 01:33:16','登录成功','front'),(62,57,'2021-05-09 01:42:58','登录成功','admin'),(63,57,'2021-05-09 01:56:52','登录成功','admin'),(64,57,'2021-05-09 02:00:48','登录成功','front'),(65,57,'2021-05-09 02:23:53','登录成功','admin'),(66,57,'2021-05-09 02:24:37','支付成功（返还成功）','住院号：1372481043306291201, 支付成功'),(67,57,'2021-05-09 02:32:28','支付成功（返还成功）','住院号：1372481043306291201, 支付成功'),(68,58,'2021-05-09 03:01:31','Bad credentials','账户用户名或密码错误'),(69,57,'2021-05-09 03:01:48','登录成功','admin'),(70,57,'2021-05-09 03:03:17','注册成功','zhangsan'),(71,57,'2021-05-09 03:03:42','登录成功','zhangsan'),(72,57,'2021-05-09 07:14:41','登录成功','admin'),(73,57,'2021-05-09 07:14:59','登录成功','front'),(74,58,'2021-05-09 07:15:49','Bad credentials','账户用户名或密码错误'),(75,57,'2021-05-09 07:15:57','登录成功','zhangsan'),(76,57,'2021-05-09 08:00:33','登录成功','front'),(79,57,'2021-05-09 08:03:40','登录成功','zhangsan'),(80,58,'2021-05-09 13:12:29','Bad credentials','账户用户名或密码错误'),(81,57,'2021-05-09 13:12:33','登录成功','front'),(83,57,'2021-05-09 13:12:58','登录成功','zhangsan'),(88,57,'2021-05-10 02:40:24','登录成功','front'),(91,57,'2021-05-10 04:58:30','登录成功','nurse'),(92,57,'2021-05-10 05:07:40','登录成功','nurse'),(97,57,'2021-05-10 05:10:21','登录成功','nurse'),(99,57,'2021-05-10 05:16:52','登录成功','front'),(100,58,'2021-05-10 05:17:23','Bad credentials','账户用户名或密码错误'),(101,57,'2021-05-10 05:17:31','登录成功','zhangsan'),(102,57,'2021-05-10 05:18:21','登录成功','nurse'),(105,57,'2021-05-10 06:39:17','登录成功','nurse'),(107,57,'2021-05-10 06:40:38','登录成功','zhangsan'),(108,57,'2021-05-10 06:46:54','登录成功','front'),(115,57,'2021-05-10 07:04:36','登录成功','front'),(116,57,'2021-05-10 07:04:51','登录成功','admin'),(117,57,'2021-05-10 07:05:07','登录成功','nurse'),(119,57,'2021-05-10 11:26:08','登录成功','front'),(120,57,'2021-05-10 11:26:44','登录成功','nurse'),(121,57,'2021-05-10 15:10:21','登录成功','nurse'),(122,57,'2021-05-11 01:49:02','登录成功','zhangsan'),(123,57,'2021-05-11 02:59:54','登录成功','front'),(125,59,'2021-05-11 13:57:41','\r\n### Error querying database.','系统内部错误'),(126,57,'2021-05-11 14:58:44','登录成功','zhangsan'),(127,59,'2021-05-12 03:49:55','\n### Error updating database. ','系统内部错误'),(128,57,'2021-05-12 04:38:47','登录成功','nurse'),(129,57,'2021-05-12 05:39:03','登录成功','zhangsan'),(130,57,'2021-05-12 06:20:17','登录成功','front'),(131,59,'2021-05-13 11:54:03','不允许访问','系统内部错误'),(132,59,'2021-05-13 11:54:03','不允许访问','系统内部错误'),(133,59,'2021-05-13 11:54:03','不允许访问','系统内部错误'),(134,59,'2021-05-13 11:54:03','不允许访问','系统内部错误'),(135,59,'2021-05-13 11:54:03','不允许访问','系统内部错误'),(136,59,'2021-05-13 11:54:04','不允许访问','系统内部错误'),(137,59,'2021-05-13 11:54:04','不允许访问','系统内部错误'),(138,59,'2021-05-13 11:54:10','不允许访问','系统内部错误'),(139,59,'2021-05-13 11:54:10','不允许访问','系统内部错误'),(140,57,'2021-05-13 11:55:09','登录成功','front'),(141,57,'2021-05-13 11:55:30','登录成功','nurse'),(142,57,'2021-05-13 11:56:00','登录成功','front'),(143,57,'2021-05-13 11:56:14','登录成功','zhangsan'),(144,57,'2021-05-13 11:58:04','登录成功','front'),(145,57,'2021-05-13 11:58:17','登录成功','admin'),(146,57,'2021-05-13 12:03:05','登录成功','admin'),(147,57,'2021-05-13 12:03:19','登录成功','front'),(148,57,'2021-05-14 07:21:03','出院登记','出院人: 郝诚婉'),(149,57,'2021-05-14 07:26:29','该住院号不存在','操作失败'),(150,57,'2021-05-14 07:30:21','该住院号不存在','操作失败'),(151,57,'2021-05-14 07:31:06','该住院号不存在','操作失败'),(152,59,'2021-05-14 07:32:10','不允许访问','系统内部错误'),(153,57,'2021-05-14 07:53:31','该住院号不存在','操作失败'),(154,59,'2021-05-14 07:54:52','不允许访问','系统内部错误'),(155,57,'2021-05-14 07:55:22','登录成功','front'),(156,59,'2021-05-14 07:55:32','不允许访问','系统内部错误'),(157,57,'2021-05-14 08:08:30','登录成功','front'),(158,57,'2021-05-14 08:09:00','支付成功（返还成功）','住院号：1372476662569672706, 支付成功'),(159,57,'2021-05-14 08:13:54','该住院号不存在','操作失败'),(160,57,'2021-05-14 08:14:07','支付成功（返还成功）','住院号：1374186540279414786, 支付成功'),(161,57,'2021-05-14 08:15:07','登录成功','zhangsan'),(162,57,'2021-05-14 11:07:19','登录成功','front'),(163,57,'2021-05-14 11:40:48','登录成功','front'),(164,57,'2021-05-14 11:40:48','登录成功','front'),(165,58,'2021-05-14 11:40:48','Bad credentials','账户用户名或密码错误'),(166,57,'2021-05-14 11:40:48','登录成功','front'),(167,57,'2021-05-14 11:40:48','登录成功','front'),(168,57,'2021-05-14 11:40:48','登录成功','front'),(169,57,'2021-05-14 11:40:48','登录成功','front'),(170,57,'2021-05-14 11:40:48','登录成功','front'),(171,57,'2021-05-14 11:40:48','登录成功','front'),(172,57,'2021-05-14 11:40:52','登录成功','front'),(173,57,'2021-05-14 11:42:22','登录成功','admin'),(174,57,'2021-05-14 11:43:24','登录成功','front'),(175,57,'2021-05-14 11:43:46','登录成功','zhangsan'),(176,57,'2021-05-16 08:53:26','登录成功','admin'),(177,57,'2021-05-16 09:53:39','登录成功','admin'),(178,57,'2021-05-18 02:11:22','登录成功','front'),(179,57,'2021-05-18 14:39:28','登录成功','front'),(180,57,'2021-05-18 15:13:38','登录成功','admin'),(181,57,'2021-05-18 15:51:25','该用户还未进行出院登记','操作失败'),(182,57,'2021-05-18 16:14:21','登录成功','nurse'),(183,57,'2021-05-18 16:14:39','登录成功','zhangsan'),(184,57,'2021-05-19 02:03:18','登录成功','zhangsan'),(185,57,'2021-05-19 02:06:06','登录成功','front'),(186,57,'2021-05-19 02:09:52','该住院号不存在','操作失败'),(187,57,'2021-05-19 02:23:20','登录成功','front'),(188,57,'2021-05-23 02:18:48','登录成功','admin'),(189,57,'2021-05-23 02:21:35','支付成功（返还成功）','住院号：1390170312359456770, 支付成功'),(190,57,'2021-05-25 10:12:48','登录成功','admin'),(191,57,'2021-05-26 12:35:19','登录成功','admin'),(192,57,'2021-05-26 12:35:37','登录成功','front'),(193,57,'2021-05-26 13:43:40','登录成功','nurse'),(194,57,'2021-05-26 13:45:25','登录成功','admin'),(195,58,'2021-05-27 01:28:01','Bad credentials','账户用户名或密码错误'),(196,57,'2021-05-27 01:28:08','登录成功','zhangsan'),(197,57,'2021-05-27 01:36:37','登录成功','admin'),(198,57,'2021-05-28 02:46:04','出院登记','出院人: 关咏寒'),(199,57,'2021-05-28 02:48:34','支付成功（返还成功）','住院号：1390538724705591297, 支付成功'),(200,57,'2021-05-28 02:59:27','登录成功','admin'),(201,57,'2021-05-28 02:59:45','登录成功','front'),(202,57,'2021-05-28 03:07:39','用户住院登记','鲁呈敬'),(203,57,'2021-05-28 03:09:43','用户住院登记','孙宇'),(204,57,'2021-05-28 03:11:13','用户住院登记','林晓光'),(205,57,'2021-05-28 04:15:18','登录成功','front'),(206,57,'2021-05-28 04:15:57','登录成功','zhangsan'),(207,57,'2021-05-28 06:33:35','登录成功','front'),(208,57,'2021-05-28 06:34:06','登录成功','zhangsan'),(209,57,'2021-05-28 06:47:59','登录成功','admin'),(210,57,'2021-05-28 06:49:09','登录成功','front'),(211,57,'2021-05-28 06:51:13','登录成功','zhangsan'),(212,57,'2021-05-28 06:51:35','登录成功','nurse'),(213,57,'2021-05-28 06:55:06','登录成功','front'),(214,57,'2021-05-28 07:03:45','登录成功','admin'),(215,57,'2021-06-05 07:54:42','该住院号不存在','操作失败'),(216,58,'2021-06-05 07:58:54','Bad credentials','账户用户名或密码错误'),(217,58,'2021-06-05 07:58:58','Bad credentials','账户用户名或密码错误'),(218,57,'2021-06-05 07:59:05','登录成功','zhangsan'),(219,57,'2021-06-06 13:48:05','登录成功','front'),(220,57,'2021-06-07 10:44:29','登录成功','admin');

/*Table structure for table `medical_advice` */

CREATE TABLE `medical_advice` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '医嘱单主键',
  `hid` varchar(64) NOT NULL COMMENT '住院单id',
  `uid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '医生id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `medical_advice` */

insert  into `medical_advice`(`id`,`hid`,`uid`) values (1,'1390170312359456770','1391227243085856769'),(2,'1390538724705591297','1391227243085856769'),(3,'1398114608962625538','1391227243085856769');

/*Table structure for table `medical_advice_item` */

CREATE TABLE `medical_advice_item` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '医嘱项',
  `start_time` datetime NOT NULL COMMENT '创建时间',
  `exec_time` datetime DEFAULT NULL COMMENT '执行时间',
  `content` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '内容',
  `doctor_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '医生签字',
  `nurse_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '执行护士签字',
  `aid` bigint DEFAULT NULL COMMENT '医嘱单外键',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `medical_advice_item` */

insert  into `medical_advice_item`(`id`,`start_time`,`exec_time`,`content`,`doctor_name`,`nurse_name`,`aid`) values (1,'2021-05-12 00:00:00','2021-05-11 14:26:49','青霉素 100ml x1瓶','张三','测试2',1),(2,'2021-05-12 04:05:39','2021-05-12 05:36:38','阿莫西林 x1盒','张三','	测试2',1),(3,'2021-05-12 05:41:29','2021-05-12 06:02:17','量血压','张三','	测试2',1),(4,'2021-05-12 06:06:26','2021-05-12 06:12:31','量血糖','张三','测试2',1),(5,'2021-05-12 06:08:06','2021-05-18 16:16:36','量血糖','张三','某某某',2),(6,'2021-05-18 16:17:52','2021-05-26 13:43:55','青霉素 100mlx1瓶','张三','某某某',2),(7,'2021-05-28 06:53:13','2021-05-28 06:54:25','三项','张三','nurse',3),(8,'2021-06-05 08:01:31',NULL,'100ml青霉素 x1','张三',NULL,3);

/*Table structure for table `medicine` */

CREATE TABLE `medicine` (
  `mid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '药品主键',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '药品名',
  `amount` int DEFAULT '0' COMMENT '余量',
  `price` decimal(12,2) DEFAULT NULL COMMENT '单价',
  `produce_time` date DEFAULT NULL COMMENT '制造时间',
  `end_time` date DEFAULT NULL COMMENT '过期时间',
  `in_time` date DEFAULT NULL COMMENT '入库时间',
  `producer` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '制造商',
  `supplier` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '供应商',
  `dis_amount` int DEFAULT '0' COMMENT '分发数量',
  PRIMARY KEY (`mid`),
  UNIQUE KEY `UNIQUE_NAME` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='ҩƷ??\r\n';

/*Data for the table `medicine` */

insert  into `medicine`(`mid`,`name`,`amount`,`price`,`produce_time`,`end_time`,`in_time`,`producer`,`supplier`,`dis_amount`) values ('1','测试药品',10,'39.50','2021-03-02','2021-04-01','2021-03-09','制造商1号','供应商1号',1),('2','药品2',20,'20.00','2021-03-09','2021-04-09','2021-03-10','制造商1号','供应商1号',0),('A0001','阿莫西林胶囊',100,'10.00','2021-03-09','2022-03-09','2021-03-09','西安市某某厂商','西安市某某单位',1),('A0002','测试x',10,'30.00','2021-03-09','2021-04-08','2021-03-10','测试厂商','供货单位',0);

/*Table structure for table `medicine_distribution` */

CREATE TABLE `medicine_distribution` (
  `did` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '药品分发单主键',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '分发人',
  `distribu_amount` int DEFAULT NULL COMMENT '分发数量',
  `price` decimal(12,2) DEFAULT NULL COMMENT '单价',
  `mid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '药品外键',
  `hid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '分发病人住院单',
  PRIMARY KEY (`did`),
  KEY `mid` (`mid`),
  KEY `hid` (`hid`),
  CONSTRAINT `medicine_distribution_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `medicine` (`mid`),
  CONSTRAINT `medicine_distribution_ibfk_2` FOREIGN KEY (`hid`) REFERENCES `hospitalized` (`hid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='ҩƷ???ű?\r\n';

/*Data for the table `medicine_distribution` */

insert  into `medicine_distribution`(`did`,`name`,`distribu_amount`,`price`,`mid`,`hid`) values ('1372390473439367170','病人1',1,'39.50','1','1372386211246362625'),('1374188432720019457','尤莲',1,'10.00','A0001','1374186540279414786');

/*Table structure for table `medicine_return` */

CREATE TABLE `medicine_return` (
  `rid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '返还单主键',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '返还人姓名',
  `medicine_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '返还药品名',
  `rtn_amount` int DEFAULT NULL COMMENT '返还数量',
  `reason` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '返还原因',
  `hid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '住院单id',
  PRIMARY KEY (`rid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='??ҩ??¼';

/*Data for the table `medicine_return` */

/*Table structure for table `menu` */

CREATE TABLE `menu` (
  `menu_id` int NOT NULL COMMENT '菜单主键',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '菜单名',
  `url` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '菜单url',
  `pid` int DEFAULT NULL COMMENT '父级菜单id',
  `orders` int DEFAULT NULL COMMENT '排列值，越小就在上面',
  `icon` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '图标',
  PRIMARY KEY (`menu_id`),
  KEY `index_pid` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `menu` */

insert  into `menu`(`menu_id`,`name`,`url`,`pid`,`orders`,`icon`) values (2,'入院管理','',0,0,'home'),(3,'出院管理',NULL,0,0,'assignment_return'),(4,'病房管理',NULL,0,0,'dashboard'),(5,'结算中心',NULL,0,0,'paid'),(6,'统计中心',NULL,0,0,'analytics'),(7,'药品管理',NULL,0,0,'medication'),(8,'用户管理',NULL,0,0,'groups'),(9,'医生管理',NULL,0,0,'account_box'),(10,'系统配置',NULL,0,0,'settings_suggest'),(11,'入院登记','/enroll',2,0,NULL),(12,'住院查询','/enroll_search',2,0,NULL),(13,'新置病房','/ward_add',4,0,NULL),(14,'病房价位调整','/ward_adjust',4,0,NULL),(15,'医生录入','/doc_enroll',9,0,NULL),(16,'医生检索','/doc_search',9,0,NULL),(17,'药品入库','/med_enroll',7,0,NULL),(18,'药品发放','/med_dis',7,0,NULL),(19,'退药处理','/med_rtn',7,0,NULL),(20,'入库查询','/med_stock',7,0,NULL),(21,'库存查询','/med_reserve_stock',7,0,NULL),(22,'费用预缴','/pay_pre',5,0,NULL),(23,'缴费记录','/pay_record',5,0,NULL),(24,'费用查询','/pay_search',5,0,NULL),(25,'出院登记','/out',3,0,NULL),(26,'出院查询','/out_search',3,0,NULL),(27,'病人统计','/statistic_patient',6,0,NULL),(28,'病房统计','/statistic_ward',6,0,NULL),(29,'日志','/log',10,0,NULL),(30,'用户注册','/user_regist',8,0,NULL),(31,'用户查询','/user_search',8,0,NULL),(32,'病人管理',NULL,0,-1,'supervisor_account'),(33,'我的病人','/mypatient',32,0,''),(34,'过往病人','/record_patient',32,0,NULL),(35,'护理病人','/nurse_patient',32,-1,NULL),(36,'往期护理','/nurse_repatient',32,0,NULL);

/*Table structure for table `pay` */

CREATE TABLE `pay` (
  `pid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '付款单',
  `type_id` int DEFAULT NULL COMMENT '付款类型',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '付款人',
  `pre_amount` decimal(12,2) DEFAULT NULL COMMENT '预付款',
  `pay_amount` decimal(12,2) DEFAULT '0.00' COMMENT '实付款',
  `pay_date` datetime DEFAULT NULL COMMENT '支付日期',
  `receive_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '收款姓名',
  `status` int DEFAULT '0' COMMENT '付款状态',
  `hid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '住院单',
  `tid` int DEFAULT NULL COMMENT '科室外键',
  `doc_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '主治医生',
  `receive_account` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '收款账户',
  PRIMARY KEY (`pid`),
  KEY `FK_Reference_11` (`type_id`),
  KEY `tid` (`tid`),
  CONSTRAINT `FK_Reference_11` FOREIGN KEY (`type_id`) REFERENCES `pay_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `pay_ibfk_1` FOREIGN KEY (`tid`) REFERENCES `doctor_type` (`tid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='?ɷѱ';

/*Data for the table `pay` */

insert  into `pay`(`pid`,`type_id`,`name`,`pre_amount`,`pay_amount`,`pay_date`,`receive_name`,`status`,`hid`,`tid`,`doc_name`,`receive_account`) values ('1372390079933960194',1,'病人1','150.00','150.00','2021-03-17 08:00:00','某某某',9,'1372386211246362625',1,'张三','admin'),('1374187788323930114',1,'尤莲','150.00','5230.00','2021-03-22 16:00:00','某某某',9,'1374186540279414786',1,'张三','admin'),('1374201479438209026',1,'嵇明','100.00','8640.00','2021-03-17 08:00:00','某某某',9,'1372476662569672706',2,'测试','admin'),('1374203051450757122',1,'史娥 ','100.00','8640.00','2021-03-17 00:00:00','某某',9,'1372481043306291201',1,'ces','admin'),('1390171028746579970',1,'郝诚婉','200.00','1440.00','2021-05-05 16:00:00','张三',9,'1390170312359456770',1,'张三','admin'),('1390539336784568322',1,'关咏寒','200.00','3600.00','2021-05-07 00:00:00','张三',9,'1390538724705591297',1,'张三','admin');

/*Table structure for table `pay_item` */

CREATE TABLE `pay_item` (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '支付项',
  `item_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '支付向名',
  `item_price` decimal(10,2) DEFAULT NULL COMMENT '支付金额',
  `item_amount` tinyint DEFAULT NULL COMMENT '数量',
  `pid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '支付单id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `pay_item` */

insert  into `pay_item`(`id`,`item_name`,`item_price`,`item_amount`,`pid`) values ('1372393909719281666','初级病房(4人)','180.00',1,'1372390079933960194'),('1372393909719281667','测试药品','39.50',1,'1372390079933960194'),('1384806858949840897','初级病房(4人)','180.00',29,'1374187788323930114'),('1384806858949840898','阿莫西林胶囊','10.00',1,'1374187788323930114'),('1389887733534187522','初级病房(4人)','180.00',48,'1374201479438209026'),('1389891001979146242','初级病房(4人)','180.00',48,'1374203051450757122'),('1393104052740448258','初级病房(4人)','180.00',8,'1390171028746579970'),('1398108278990331906','初级病房(4人)','180.00',20,'1390539336784568322');

/*Table structure for table `pay_rtn` */

CREATE TABLE `pay_rtn` (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '返还单id',
  `item_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '返还项名',
  `item_amount` tinyint DEFAULT NULL COMMENT '返还项数量',
  `item_price` decimal(10,2) DEFAULT NULL COMMENT '返还价格',
  `pid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '支付单',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `pay_rtn` */

/*Table structure for table `pay_type` */

CREATE TABLE `pay_type` (
  `id` int NOT NULL COMMENT '支付类型',
  `code` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '支付码',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '支付码名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='֧?????';

/*Data for the table `pay_type` */

insert  into `pay_type`(`id`,`code`,`name`) values (1,'001','微信'),(2,'002','支付宝'),(3,'003','现金');

/*Table structure for table `role` */

CREATE TABLE `role` (
  `rid` int NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '角色码',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '角色名',
  PRIMARY KEY (`rid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='??ɫ??Ȩ?޿??';

/*Data for the table `role` */

insert  into `role`(`rid`,`code`,`name`) values (1,'001','系统管理员'),(2,'002','医生'),(3,'003','护士'),(4,'004','服务前台'),(5,'005','患者');

/*Table structure for table `role_menu_relation` */

CREATE TABLE `role_menu_relation` (
  `role_id` int NOT NULL COMMENT '角色外键',
  `menu_id` int NOT NULL COMMENT '菜单外键',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `role_menu_relation` */

insert  into `role_menu_relation`(`role_id`,`menu_id`) values (1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9),(1,10),(1,11),(1,12),(1,13),(1,14),(1,15),(1,16),(1,17),(1,18),(1,19),(1,20),(1,21),(1,22),(1,23),(1,24),(1,25),(1,26),(1,27),(1,28),(1,29),(1,30),(1,31),(2,2),(2,3),(2,12),(2,26),(2,32),(2,33),(2,34),(3,2),(3,3),(3,12),(3,26),(3,32),(3,35),(3,36),(4,2),(4,3),(4,5),(4,11),(4,12),(4,22),(4,23),(4,24),(4,25),(4,26);

/*Table structure for table `sickbed` */

CREATE TABLE `sickbed` (
  `sid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '病床主键',
  `wid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '病房外键',
  `status` tinyint DEFAULT '0' COMMENT '''0''表示未使用',
  PRIMARY KEY (`sid`),
  KEY `wid` (`wid`),
  CONSTRAINT `sickbed_ibfk_1` FOREIGN KEY (`wid`) REFERENCES `ward` (`wid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `sickbed` */

insert  into `sickbed`(`sid`,`wid`,`status`) values ('100001','100',1),('100002','100',1),('100003','100',1),('100004','100',1),('101001','101',0),('101002','101',0),('102001','102',0),('103001','103',0),('103002','103',0),('103003','103',0),('103004','103',0),('104001','104',0),('104002','104',0),('105001','105',0),('105002','105',0);

/*Table structure for table `unhospitalized` */

CREATE TABLE `unhospitalized` (
  `uid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '出院主键',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '出院人',
  `sex` tinyint(1) DEFAULT NULL COMMENT '性别',
  `id` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '身份证',
  `doctor_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '主治医生',
  `in_hospital_time` timestamp NULL DEFAULT NULL COMMENT '入院时间',
  `sid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '床位外键',
  `out_hospital_time` timestamp NULL DEFAULT NULL COMMENT '出院时间',
  `wid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '病房外键',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='??Ժ?Ǽ';

/*Data for the table `unhospitalized` */

insert  into `unhospitalized`(`uid`,`name`,`sex`,`id`,`doctor_name`,`in_hospital_time`,`sid`,`out_hospital_time`,`wid`) values ('1372386211246362625','病人1',1,'513436200003166012','张三','2021-03-17 03:15:44','100001','2021-03-18 03:44:13','100'),('1372476662569672706','嵇明',1,'513436200003168034','测试','2021-03-18 01:15:09','100001','2021-05-05 10:20:33','100'),('1372481043306291201','史娥 ',0,'513436200003166012','ces','2021-03-18 01:32:33','100002','2021-05-05 10:33:32','100'),('1374186540279414786','尤莲',0,'513436200003196510','张三','2021-03-22 18:29:36','100003','2021-04-21 09:50:57','100'),('1390170312359456770','郝诚婉',0,'513436200004219059','张三','2021-05-06 05:03:24','100001','2021-05-14 07:21:03','100'),('1390538724705591297','关咏寒',1,'513436200004216130','张三','2021-05-07 13:27:20','100002','2021-05-28 02:46:04','100');

/*Table structure for table `user` */

CREATE TABLE `user` (
  `uid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户主键',
  `fullname` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '真实姓名',
  `username` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '用户名',
  `password` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '密码',
  `amount` decimal(12,2) DEFAULT '0.00' COMMENT '余额，单位（毛）',
  `rid` int DEFAULT NULL COMMENT '角色外键',
  `phone` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '电话号码',
  `regist_time` timestamp NULL DEFAULT NULL COMMENT '注册时间',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `UNIQUE_USERNAME` (`username`),
  KEY `rid` (`rid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='?û??';

/*Data for the table `user` */

insert  into `user`(`uid`,`fullname`,`username`,`password`,`amount`,`rid`,`phone`,`regist_time`) values ('1','管理员','admin','$2a$10$XeWil9w0tzwqA058yNtq/evD7RhtxG8VKeWoQqAC7/PcWMAbEIHuW','0.00',1,'18362456123','2021-03-17 09:01:11'),('1371376369559879681','测试2','nurse','$2a$10$r.htVfyGaKBG34qsxRYgIeWId9I8bEDEGmZqShOnw2SFQnTAOKbKe','0.00',3,'1349796345','2021-03-15 08:23:00'),('1390854425898840065','胡歌','front','$2a$10$0i/BEdksbrKBgcAKvQsuOOj1qtbhRRk.O0GCx1gFjuptFnTbtgOHW','0.00',4,'18728283812','2021-05-08 02:21:50'),('1391227243085856769','张三','zhangsan','$2a$10$xBjVi3ITXZkYs8KfvP5XU.LEB87WjFs4FA9fnN69jBNJPrOuEdmgy','0.00',2,'18702930193','2021-05-09 03:03:17');

/*Table structure for table `ward` */

CREATE TABLE `ward` (
  `wid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '病房主键',
  `dt_id` int DEFAULT NULL COMMENT '病房所属科室外键',
  `wt_id` int DEFAULT NULL COMMENT '病房类型主键',
  `capacity` int DEFAULT NULL COMMENT '容量',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`wid`),
  KEY `FK_Reference_3` (`dt_id`),
  KEY `FK_Reference_4` (`wt_id`),
  CONSTRAINT `FK_Reference_3` FOREIGN KEY (`dt_id`) REFERENCES `doctor_type` (`tid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Reference_4` FOREIGN KEY (`wt_id`) REFERENCES `ward_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='????';

/*Data for the table `ward` */

insert  into `ward`(`wid`,`dt_id`,`wt_id`,`capacity`,`create_time`) values ('100',1,3,4,'2021-03-02 23:17:01'),('101',1,2,2,'2021-03-01 07:21:46'),('102',1,4,1,'2021-03-01 07:22:47'),('103',3,3,4,'2021-03-01 07:24:11'),('104',4,2,2,'2021-03-01 07:26:43'),('105',5,2,2,'2021-03-01 07:27:25');

/*Table structure for table `ward_type` */

CREATE TABLE `ward_type` (
  `id` int NOT NULL COMMENT '病房类型主键',
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '类型码',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '码值对应的名',
  `price` decimal(12,2) DEFAULT NULL COMMENT '单价/天',
  `update_time` datetime DEFAULT NULL COMMENT '上次更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='???????';

/*Data for the table `ward_type` */

insert  into `ward_type`(`id`,`code`,`name`,`price`,`update_time`) values (1,'001','VIP病房(1人)','380.00','2021-03-01 09:11:20'),(2,'002','高等病房(2人)','250.00','2021-03-01 09:11:42'),(3,'003','初级病房(4人)','180.00','2021-03-01 09:11:57'),(4,'004','重症监护室(1人)','1000.00','2021-03-01 09:12:17');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
