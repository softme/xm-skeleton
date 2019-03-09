/*
SQLyog Ultimate v12.5.0 (64 bit)
MySQL - 5.5.53 : Database - xm_skeleton
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`xm_skeleton` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `xm_skeleton`;

/*Table structure for table `qrtz_blob_triggers` */

DROP TABLE IF EXISTS `qrtz_blob_triggers`;

CREATE TABLE `qrtz_blob_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `QRTZ_BLOB_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `qrtz_blob_triggers` */

/*Table structure for table `qrtz_calendars` */

DROP TABLE IF EXISTS `qrtz_calendars`;

CREATE TABLE `qrtz_calendars` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(200) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `qrtz_calendars` */

/*Table structure for table `qrtz_cron_triggers` */

DROP TABLE IF EXISTS `qrtz_cron_triggers`;

CREATE TABLE `qrtz_cron_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `CRON_EXPRESSION` varchar(200) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `QRTZ_CRON_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `qrtz_cron_triggers` */

insert  into `qrtz_cron_triggers`(`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`CRON_EXPRESSION`,`TIME_ZONE_ID`) values 
('quartzScheduler','com.xm.admin.quartz.jobs.JobWithoutParam','DEFAULT','*/5 * * * * ?','Asia/Shanghai'),
('quartzScheduler','com.xm.admin.quartz.jobs.JobWithParam','DEFAULT','*/5 * * * * ?','Asia/Shanghai');

/*Table structure for table `qrtz_fired_triggers` */

DROP TABLE IF EXISTS `qrtz_fired_triggers`;

CREATE TABLE `qrtz_fired_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(200) DEFAULT NULL,
  `JOB_GROUP` varchar(200) DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `qrtz_fired_triggers` */

/*Table structure for table `qrtz_job_details` */

DROP TABLE IF EXISTS `qrtz_job_details`;

CREATE TABLE `qrtz_job_details` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` varchar(1) NOT NULL,
  `IS_NONCONCURRENT` varchar(1) NOT NULL,
  `IS_UPDATE_DATA` varchar(1) NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `qrtz_job_details` */

insert  into `qrtz_job_details`(`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`,`DESCRIPTION`,`JOB_CLASS_NAME`,`IS_DURABLE`,`IS_NONCONCURRENT`,`IS_UPDATE_DATA`,`REQUESTS_RECOVERY`,`JOB_DATA`) values 
('quartzScheduler','com.xm.admin.quartz.jobs.JobWithoutParam','DEFAULT',NULL,'com.xm.admin.quartz.jobs.JobWithoutParam','0','0','0','0','��\0sr\0org.quartz.JobDataMap���迩��\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap�����](\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMap�.�(v\n�\0Z\0dirtyL\0mapt\0Ljava/util/Map;xpsr\0java.util.HashMap���`�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0	parameterpx\0'),
('quartzScheduler','com.xm.admin.quartz.jobs.JobWithParam','DEFAULT',NULL,'com.xm.admin.quartz.jobs.JobWithParam','0','0','0','0','��\0sr\0org.quartz.JobDataMap���迩��\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap�����](\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMap�.�(v\n�\0Z\0dirtyL\0mapt\0Ljava/util/Map;xpsr\0java.util.HashMap���`�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0	parametert\0Test Jobx\0');

/*Table structure for table `qrtz_locks` */

DROP TABLE IF EXISTS `qrtz_locks`;

CREATE TABLE `qrtz_locks` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `qrtz_locks` */

insert  into `qrtz_locks`(`SCHED_NAME`,`LOCK_NAME`) values 
('quartzScheduler','TRIGGER_ACCESS');

/*Table structure for table `qrtz_paused_trigger_grps` */

DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;

CREATE TABLE `qrtz_paused_trigger_grps` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `qrtz_paused_trigger_grps` */

/*Table structure for table `qrtz_quartz_job` */

DROP TABLE IF EXISTS `qrtz_quartz_job`;

CREATE TABLE `qrtz_quartz_job` (
  `id` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `cron_expression` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `job_class_name` varchar(255) DEFAULT NULL,
  `parameter` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_quartz_job` */

insert  into `qrtz_quartz_job`(`id`,`created_at`,`created_by`,`updated_at`,`updated_by`,`cron_expression`,`description`,`job_class_name`,`parameter`,`status`) values 
('95631859723014144','2019-01-10 11:39:13','null','2019-03-10 01:57:42','null','*/5 * * * * ?','无参测试任务','com.xm.admin.quartz.jobs.JobWithoutParam','null',-1),
('95632048328282112','2019-01-10 11:39:58','null','2019-03-10 01:57:44','null','*/5 * * * * ?','有参测试任务','com.xm.admin.quartz.jobs.JobWithParam','Test Job',-1);

/*Table structure for table `qrtz_scheduler_state` */

DROP TABLE IF EXISTS `qrtz_scheduler_state`;

CREATE TABLE `qrtz_scheduler_state` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `qrtz_scheduler_state` */

/*Table structure for table `qrtz_simple_triggers` */

DROP TABLE IF EXISTS `qrtz_simple_triggers`;

CREATE TABLE `qrtz_simple_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `QRTZ_SIMPLE_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `qrtz_simple_triggers` */

/*Table structure for table `qrtz_simprop_triggers` */

DROP TABLE IF EXISTS `qrtz_simprop_triggers`;

CREATE TABLE `qrtz_simprop_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `STR_PROP_1` varchar(512) DEFAULT NULL,
  `STR_PROP_2` varchar(512) DEFAULT NULL,
  `STR_PROP_3` varchar(512) DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `QRTZ_SIMPROP_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `qrtz_simprop_triggers` */

/*Table structure for table `qrtz_triggers` */

DROP TABLE IF EXISTS `qrtz_triggers`;

CREATE TABLE `qrtz_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  CONSTRAINT `QRTZ_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `qrtz_triggers` */

insert  into `qrtz_triggers`(`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`JOB_NAME`,`JOB_GROUP`,`DESCRIPTION`,`NEXT_FIRE_TIME`,`PREV_FIRE_TIME`,`PRIORITY`,`TRIGGER_STATE`,`TRIGGER_TYPE`,`START_TIME`,`END_TIME`,`CALENDAR_NAME`,`MISFIRE_INSTR`,`JOB_DATA`) values 
('quartzScheduler','com.xm.admin.quartz.jobs.JobWithoutParam','DEFAULT','com.xm.admin.quartz.jobs.JobWithoutParam','DEFAULT',NULL,1552154265000,1552154260000,5,'PAUSED','CRON',1547091553000,0,NULL,0,''),
('quartzScheduler','com.xm.admin.quartz.jobs.JobWithParam','DEFAULT','com.xm.admin.quartz.jobs.JobWithParam','DEFAULT',NULL,1552154265000,1552154260000,5,'PAUSED','CRON',1547091598000,0,NULL,0,'');

/*Table structure for table `sys_admin` */

DROP TABLE IF EXISTS `sys_admin`;

CREATE TABLE `sys_admin` (
  `id` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `avatar` varchar(1000) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `nick_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `sex` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `department_id` varchar(255) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `pass_strength` varchar(2) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `sys_admin` */

insert  into `sys_admin`(`id`,`address`,`avatar`,`description`,`email`,`mobile`,`nick_name`,`password`,`sex`,`status`,`type`,`username`,`department_id`,`street`,`pass_strength`,`created_at`,`created_by`,`updated_at`,`updated_by`) values 
('47599079840026624','[\"440000\",\"440300\",\"440306\"]','','','admin@iwallet.com','13888888888','','$2a$10$aPzqnodF2F4vdlZO/Qzid.xBMepn2VF52ScSOSa.ovm1jFWq667UW',1,0,1,'admin','87336440425353216','','','2018-08-30 22:34:06','','2019-03-10 01:58:15',''),
('87338083204206592','[\"440000\",\"440300\",\"440305\"]','','','a@b.com','13888888888','','$2a$10$rO5zHxTKJZI4iWEp9f6cLOgwZDoteB29Ba03farLwioAfdFxNOUQa',1,0,1,'skeleton','87336063856545792','','','2018-12-18 14:22:43','','2019-03-10 01:42:44','');

/*Table structure for table `sys_admin_log` */

DROP TABLE IF EXISTS `sys_admin_log`;

CREATE TABLE `sys_admin_log` (
  `id` varchar(255) NOT NULL,
  `cost_time` int(11) DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `ip_info` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `request_param` varchar(512) DEFAULT NULL,
  `request_type` varchar(255) DEFAULT NULL,
  `request_url` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `sys_admin_log` */

/*Table structure for table `sys_admin_role` */

DROP TABLE IF EXISTS `sys_admin_role`;

CREATE TABLE `sys_admin_role` (
  `id` varchar(255) NOT NULL,
  `role_id` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `sys_admin_role` */

insert  into `sys_admin_role`(`id`,`role_id`,`user_id`,`created_at`,`created_by`,`updated_at`,`updated_by`) values 
('51919463095734273','496138616573953','51919414177566720','2018-09-11 20:41:46',NULL,'2018-09-11 20:41:46',NULL),
('116854783687528448','496138616573952','47599079840026624','2019-03-10 01:11:32',NULL,'2019-03-10 01:11:32',NULL),
('116854776909533184','496138616573953','87338083204206592','2019-03-10 01:11:30',NULL,'2019-03-10 01:11:30',NULL),
('116844842029420544','496138616573952','116844841647738880','2019-03-10 00:32:02',NULL,'2019-03-10 00:32:02',NULL),
('116847350214823936','496138616573952','116846552936353792','2019-03-10 00:42:00',NULL,'2019-03-10 00:42:00',NULL),
('116851632993472512','116849032776650752','116847659427303424','2019-03-10 00:59:01',NULL,'2019-03-10 00:59:01',NULL),
('116850548648448000','496138616573952','116848891118227456','2019-03-10 00:54:42',NULL,'2019-03-10 00:54:42',NULL);

/*Table structure for table `sys_department` */

DROP TABLE IF EXISTS `sys_department`;

CREATE TABLE `sys_department` (
  `id` varchar(255) NOT NULL,
  `is_parent` bit(1) DEFAULT NULL,
  `parent_id` varchar(255) DEFAULT NULL,
  `sort_order` decimal(10,2) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `sys_department` */

insert  into `sys_department`(`id`,`is_parent`,`parent_id`,`sort_order`,`status`,`title`,`created_at`,`created_by`,`updated_at`,`updated_by`) values 
('87336063856545792','\0','87335940934078464',1.00,0,'数据维护','2018-12-18 14:14:41','','2018-12-18 14:15:02',''),
('87335940934078464','','0',1.00,0,'运营中心','2018-12-18 14:14:12',NULL,'2018-12-18 14:14:41',NULL),
('40681289119961088','\0','40652270295060480',2.00,0,'VIP','2018-08-11 20:25:16','','2018-08-11 22:47:48',''),
('87336376579657728','','0',1.00,0,'产品中心','2018-12-18 14:15:56',NULL,'2018-12-18 14:16:11',NULL),
('87336440425353216','\0','87336376579657728',1.00,0,'研发一部','2018-12-18 14:16:11',NULL,'2018-12-18 14:16:11',NULL),
('40652338142121984','\0','40652270295060480',1.00,0,'游客','2018-08-11 18:30:13',NULL,'2018-08-11 18:30:13',NULL);

/*Table structure for table `sys_permission` */

DROP TABLE IF EXISTS `sys_permission`;

CREATE TABLE `sys_permission` (
  `id` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `parent_id` varchar(255) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `sort_order` decimal(10,2) DEFAULT NULL,
  `component` varchar(255) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `button_type` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `sys_permission` */

insert  into `sys_permission`(`id`,`description`,`name`,`parent_id`,`type`,`sort_order`,`component`,`path`,`title`,`icon`,`level`,`button_type`,`status`,`url`,`created_at`,`created_by`,`updated_at`,`updated_by`) values 
('5129710648430592','','sys','',0,3.00,'Main','/form','系统管理','ios-settings',1,'',0,'','2018-06-04 19:02:29','','2018-09-04 22:50:52',''),
('5129710648430593','','user-manage','5129710648430592',0,1.10,'sys/user-manage/userManage','user-manage','管理员管理','md-person',2,'',0,'','2018-06-04 19:02:32','','2018-09-03 16:06:57',''),
('5129710648430594','','role-manage','5129710648430592',0,1.50,'sys/role-manage/roleManage','role-manage','角色管理','md-contacts',2,'',0,'','2018-06-04 19:02:35','','2018-08-23 17:31:27',''),
('5129710648430595','','menu-manage','5129710648430592',0,1.60,'sys/menu-manage/menuManage','menu-manage','菜单权限管理','md-menu',2,'',0,'','2018-06-04 19:02:37','','2018-08-23 17:31:33',''),
('15701400130424832','','','5129710648430593',1,1.11,'','/iwallet/user/admin/add','添加用户','',3,'add',0,'','2018-06-03 22:04:06','','2018-08-31 17:24:08',''),
('15701915807518720','','','5129710648430593',1,1.13,'','/iwallet/user/admin/disable/**','禁用用户','',3,'disable',0,'','2018-06-03 22:06:09','','2018-08-31 17:24:39',''),
('15708892205944832','','','5129710648430593',1,1.14,'','/iwallet/user/admin/enable/**','启用用户','',3,'enable',0,'','2018-06-03 22:33:52','','2018-08-31 17:24:52',''),
('16678126574637056','','','5129710648430593',1,1.12,'','/iwallet/user/admin/edit','编辑用户','',3,'edit',0,'','2018-06-06 14:45:16','','2018-08-31 17:24:23',''),
('16678447719911424','','','5129710648430593',1,1.15,'','/iwallet/user/delByIds/**','删除用户','',3,'delete',0,'','2018-06-06 14:46:32','','2018-08-31 17:25:07',''),
('16687383932047360','','','5129710648430594',1,1.21,'','/iwallet/role/save','添加角色','',3,'add',0,'','2018-06-06 15:22:03','','2018-08-31 17:26:02',''),
('16689632049631232','','','5129710648430594',1,1.22,'','/iwallet/role/edit','编辑角色','',3,'edit',0,'','2018-06-06 15:30:59','','2018-08-31 17:26:13',''),
('16689745006432256','','','5129710648430594',1,1.23,'','/iwallet/role/delAllByIds/**','删除角色','',3,'delete',0,'','2018-06-06 15:31:26','','2018-08-31 17:26:23',''),
('16689883993083904','','','5129710648430594',1,1.24,'','/iwallet/role/editRolePerm/**','分配权限','',3,'editPerm',0,'','2018-06-06 15:31:59','','2018-08-31 17:26:45',''),
('16690313745666048','','','5129710648430594',1,1.25,'','/iwallet/role/setDefault','设为默认角色','',3,'setDefault',0,'','2018-06-06 15:33:41','','2018-08-31 17:27:00',''),
('16694861252005888','','','5129710648430595',1,1.31,'','/iwallet/permission/add','添加菜单','',3,'add',0,'','2018-06-06 15:51:46','','2018-08-31 17:27:14',''),
('16695107491205120','','','5129710648430595',1,1.32,'','/iwallet/permission/edit','编辑菜单','',3,'edit',0,'','2018-06-06 15:52:44','','2018-08-31 17:27:21',''),
('16695243126607872','','','5129710648430595',1,1.33,'','/iwallet/permission/delByIds/**','删除菜单','',3,'delete',0,'','2018-06-06 15:53:17','','2018-08-31 17:27:31',''),
('25014528525733888',NULL,NULL,'5129710648430593',1,1.16,NULL,'upload','上传图片',NULL,3,'upload',0,NULL,'2018-06-29 14:51:09',NULL,'2018-06-29 14:51:09',NULL),
('39915540965232640','','monitor','',0,4.00,'Main','/monitor','系统监控','ios-analytics',1,'',0,'','2018-08-09 17:42:28','','2018-09-04 22:50:47',''),
('40238597734928384',NULL,'department-manage','5129710648430592',0,1.20,'sys/department-manage/departmentManage','department-manage','部门管理','md-git-branch',2,'',0,NULL,'2018-08-10 15:06:10',NULL,'2018-08-10 15:06:10',NULL),
('41363147411427328','','log-manage','39915540965232640',0,2.20,'sys/log-manage/logManage','log-manage','操作日志管理','md-list-box',2,'',0,'','2018-08-13 17:34:43','','2018-08-20 20:05:21',''),
('41363537456533504','','','41363147411427328',1,2.11,'','/iwallet/log/delByIds/**','删除日志','',3,'delete',0,'','2018-08-13 17:36:16','','2018-08-31 17:28:04',''),
('41364927394353152','','','41363147411427328',1,2.12,'','/iwallet/log/delAll','清空日志','',3,'undefined',0,'','2018-08-13 17:41:48','','2018-08-31 17:28:13',''),
('45235621697949696','','','40238597734928384',1,1.21,'','/iwallet/department/add','添加部门','',3,'add',0,'','2018-08-24 10:02:33','','2018-08-31 17:25:26',''),
('45235787867885568','','','40238597734928384',1,1.22,'','/iwallet/department/edit','编辑部门','',3,'edit',0,'','2018-08-24 10:03:13','','2018-08-31 17:25:36',''),
('45235939278065664','','','40238597734928384',1,1.23,'','/iwallet/department/delByIds/*','删除部门','',3,'delete',0,'','2018-08-24 10:03:49','','2018-08-31 17:25:46',''),
('84907582589767680',NULL,'quartz-job','39915540965232640',0,2.10,'sys/quartz-manage/quartzManage','quartz-job','定时任务','md-time',2,'',0,NULL,'2018-12-11 21:24:46',NULL,'2018-12-11 21:24:46',NULL),
('84907899767230464',NULL,'','84907582589767680',1,2.11,'','/mozi/quartzJob/add*','添加定时任务','',3,'add',0,NULL,'2018-12-11 21:26:02',NULL,'2018-12-11 21:26:02',NULL),
('84908172535402496',NULL,'','84907582589767680',1,2.12,'','/mozi/quartzJob/edit*','编辑定时任务','',3,'edit',0,NULL,'2018-12-11 21:27:07',NULL,'2018-12-11 21:27:07',NULL),
('84908391842975744',NULL,'','84907582589767680',1,2.13,'','/mozi/quartzJob/pause*','暂停定时任务','',3,'disable',0,NULL,'2018-12-11 21:27:59',NULL,'2018-12-11 21:27:59',NULL),
('84908678297161728',NULL,'','84907582589767680',1,2.14,'','/mozi/quartzJob/resume*','恢复定时任务','',3,'enable',0,NULL,'2018-12-11 21:29:07',NULL,'2018-12-11 21:29:07',NULL),
('84908899202764800',NULL,'','84907582589767680',1,2.15,'','/mozi/quartzJob/delByIds/*','删除定时任务','',3,'delete',0,NULL,'2018-12-11 21:30:00',NULL,'2018-12-11 21:30:00',NULL);

/*Table structure for table `sys_role` */

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `default_role` bit(1) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `data_type` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `sys_role` */

insert  into `sys_role`(`id`,`name`,`default_role`,`description`,`data_type`,`created_at`,`created_by`,`updated_at`,`updated_by`) values 
('496138616573952','ROLE_ADMIN',NULL,'超级管理员 拥有所有权限',NULL,'2018-04-22 23:03:49','','2018-08-12 16:14:31',''),
('496138616573953','ROLE_USER','','分润查询',NULL,'2018-05-02 21:40:03','','2018-12-14 17:21:59','');

/*Table structure for table `sys_role_permission` */

DROP TABLE IF EXISTS `sys_role_permission`;

CREATE TABLE `sys_role_permission` (
  `id` varchar(255) NOT NULL,
  `permission_id` varchar(255) DEFAULT NULL,
  `role_id` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `sys_role_permission` */

insert  into `sys_role_permission`(`id`,`permission_id`,`role_id`,`created_at`,`created_by`,`updated_at`,`updated_by`) values 
('116855839020552192','41364927394353152','496138616573952','2019-03-10 01:15:44',NULL,'2019-03-10 01:15:44',NULL),
('116855839016357888','41363537456533504','496138616573952','2019-03-10 01:15:44',NULL,'2019-03-10 01:15:44',NULL),
('116855839012163585','41363147411427328','496138616573952','2019-03-10 01:15:44',NULL,'2019-03-10 01:15:44',NULL),
('116855839012163584','84908899202764800','496138616573952','2019-03-10 01:15:44',NULL,'2019-03-10 01:15:44',NULL),
('116855839007969280','84908678297161728','496138616573952','2019-03-10 01:15:44',NULL,'2019-03-10 01:15:44',NULL),
('116855839003774976','84908391842975744','496138616573952','2019-03-10 01:15:44',NULL,'2019-03-10 01:15:44',NULL),
('116855838999580672','84908172535402496','496138616573952','2019-03-10 01:15:44',NULL,'2019-03-10 01:15:44',NULL),
('116855838995386368','84907899767230464','496138616573952','2019-03-10 01:15:44',NULL,'2019-03-10 01:15:44',NULL),
('116855838991192064','84907582589767680','496138616573952','2019-03-10 01:15:44',NULL,'2019-03-10 01:15:44',NULL),
('116855838986997760','39915540965232640','496138616573952','2019-03-10 01:15:44',NULL,'2019-03-10 01:15:44',NULL),
('116855838982803456','16695243126607872','496138616573952','2019-03-10 01:15:44',NULL,'2019-03-10 01:15:44',NULL),
('116855838978609152','16695107491205120','496138616573952','2019-03-10 01:15:44',NULL,'2019-03-10 01:15:44',NULL),
('116855838974414848','16694861252005888','496138616573952','2019-03-10 01:15:44',NULL,'2019-03-10 01:15:44',NULL),
('116855838966026240','5129710648430595','496138616573952','2019-03-10 01:15:44',NULL,'2019-03-10 01:15:44',NULL),
('116855838961831936','16690313745666048','496138616573952','2019-03-10 01:15:44',NULL,'2019-03-10 01:15:44',NULL),
('116855838957637632','16689883993083904','496138616573952','2019-03-10 01:15:44',NULL,'2019-03-10 01:15:44',NULL),
('116855838949249024','16689745006432256','496138616573952','2019-03-10 01:15:44',NULL,'2019-03-10 01:15:44',NULL),
('116855838945054721','16689632049631232','496138616573952','2019-03-10 01:15:44',NULL,'2019-03-10 01:15:44',NULL),
('116855838945054720','16687383932047360','496138616573952','2019-03-10 01:15:44',NULL,'2019-03-10 01:15:44',NULL),
('116855838940860416','5129710648430594','496138616573952','2019-03-10 01:15:44',NULL,'2019-03-10 01:15:44',NULL),
('116855838936666112','45235939278065664','496138616573952','2019-03-10 01:15:44',NULL,'2019-03-10 01:15:44',NULL),
('116855838932471808','45235787867885568','496138616573952','2019-03-10 01:15:44',NULL,'2019-03-10 01:15:44',NULL),
('116855838928277504','45235621697949696','496138616573952','2019-03-10 01:15:44',NULL,'2019-03-10 01:15:44',NULL),
('116855838919888896','40238597734928384','496138616573952','2019-03-10 01:15:44',NULL,'2019-03-10 01:15:44',NULL),
('116855838869557248','5129710648430592','496138616573952','2019-03-10 01:15:44',NULL,'2019-03-10 01:15:44',NULL),
('116855838873751552','5129710648430593','496138616573952','2019-03-10 01:15:44',NULL,'2019-03-10 01:15:44',NULL),
('116855838877945856','15701400130424832','496138616573952','2019-03-10 01:15:44',NULL,'2019-03-10 01:15:44',NULL),
('116855838886334464','16678126574637056','496138616573952','2019-03-10 01:15:44',NULL,'2019-03-10 01:15:44',NULL),
('116855838894723072','15701915807518720','496138616573952','2019-03-10 01:15:44',NULL,'2019-03-10 01:15:44',NULL),
('116855838898917376','15708892205944832','496138616573952','2019-03-10 01:15:44',NULL,'2019-03-10 01:15:44',NULL),
('116855838907305984','16678447719911424','496138616573952','2019-03-10 01:15:44',NULL,'2019-03-10 01:15:44',NULL),
('116855838915694592','25014528525733888','496138616573952','2019-03-10 01:15:44',NULL,'2019-03-10 01:15:44',NULL);

/*Table structure for table `user_info` */

DROP TABLE IF EXISTS `user_info`;

CREATE TABLE `user_info` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `password` varchar(64) DEFAULT '' COMMENT '密码',
  `email` varchar(32) DEFAULT '' COMMENT '邮箱',
  `status` tinyint(4) DEFAULT '1' COMMENT '状态',
  `created_at` int(11) DEFAULT '0' COMMENT '注册时间',
  `updated_at` int(11) DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQUE` (`username`,`mobile`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='用户表';

/*Data for the table `user_info` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
