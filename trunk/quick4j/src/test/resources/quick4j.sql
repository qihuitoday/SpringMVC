/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50521
Source Host           : localhost:3306
Source Database       : quick4j

Target Server Type    : MYSQL
Target Server Version : 50521
File Encoding         : 65001

Date: 2018-02-28 00:14:04
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `categary`
-- ----------------------------
DROP TABLE IF EXISTS `categary`;
CREATE TABLE `categary` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categary_name` varchar(20) DEFAULT NULL,
  `categary_description` varchar(320) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of categary
-- ----------------------------
INSERT INTO `categary` VALUES ('1', 'Communication', 'Communication');
INSERT INTO `categary` VALUES ('2', 'Requirement Analysis', 'Requirement Analysis');
INSERT INTO `categary` VALUES ('3', 'Design', 'Design');
INSERT INTO `categary` VALUES ('4', 'Development', 'Development');
INSERT INTO `categary` VALUES ('5', 'Test', 'Test');
INSERT INTO `categary` VALUES ('6', 'Review', 'Review');
INSERT INTO `categary` VALUES ('7', 'Bug Fix', 'Bug Fix');
INSERT INTO `categary` VALUES ('8', 'Trouble Shooting', 'Trouble Shooting');
INSERT INTO `categary` VALUES ('9', 'Knowledge Transfer', 'Knowledge Transfer');
INSERT INTO `categary` VALUES ('10', 'Tech.Study', 'Tech.Study');
INSERT INTO `categary` VALUES ('11', 'Others', 'Others');

-- ----------------------------
-- Table structure for `holidays`
-- ----------------------------
DROP TABLE IF EXISTS `holidays`;
CREATE TABLE `holidays` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `holiday_date` datetime DEFAULT NULL,
  `holiday_status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of holidays
-- ----------------------------

-- ----------------------------
-- Table structure for `jobtitle`
-- ----------------------------
DROP TABLE IF EXISTS `jobtitle`;
CREATE TABLE `jobtitle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_title` varchar(20) DEFAULT NULL,
  `job_desc` varchar(320) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='�û�ְ��';

-- ----------------------------
-- Records of jobtitle
-- ----------------------------
INSERT INTO `jobtitle` VALUES ('1', 'Junior Developer', 'Junior Developer');
INSERT INTO `jobtitle` VALUES ('2', 'Senior Developer', 'Senior Developer');
INSERT INTO `jobtitle` VALUES ('3', 'Tech Writer', 'Tech Writer');
INSERT INTO `jobtitle` VALUES ('4', 'Junior Tester', 'Junior Tester');
INSERT INTO `jobtitle` VALUES ('5', 'Senior Tester', 'Senior Tester');
INSERT INTO `jobtitle` VALUES ('6', 'Test Lead', 'Test Lead');
INSERT INTO `jobtitle` VALUES ('7', 'Tech Lead', 'Tech Lead');
INSERT INTO `jobtitle` VALUES ('8', 'Support', 'Support');
INSERT INTO `jobtitle` VALUES ('9', 'Project Manager', 'Project Manager');
INSERT INTO `jobtitle` VALUES ('10', 'Administrator', 'Administrator');
INSERT INTO `jobtitle` VALUES ('11', 'UI Designer', 'UI Designer');
INSERT INTO `jobtitle` VALUES ('12', 'Intern', 'Intern');

-- ----------------------------
-- Table structure for `permission`
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '权限id',
  `permission_name` varchar(32) DEFAULT NULL COMMENT '权限名',
  `permission_sign` varchar(128) DEFAULT NULL COMMENT '权限标识,程序中判断使用,如"user:create"',
  `description` varchar(256) DEFAULT NULL COMMENT '权限描述,UI界面显示使用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='权限表';

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES ('1', '用户新增', 'user:create', null);

-- ----------------------------
-- Table structure for `project`
-- ----------------------------
DROP TABLE IF EXISTS `project`;
CREATE TABLE `project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_name` varchar(64) DEFAULT NULL,
  `project_leader` int(11) DEFAULT NULL,
  `project_status` int(11) DEFAULT NULL,
  `project_viewStatus` int(11) DEFAULT NULL,
  `project_desc` varchar(320) DEFAULT NULL,
  `project_flag` int(11) DEFAULT NULL,
  `project_create_by` int(11) DEFAULT NULL,
  `project_create_time` datetime DEFAULT NULL,
  `project_update_by` int(11) DEFAULT NULL,
  `project_update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='��Ŀ';

-- ----------------------------
-- Records of project
-- ----------------------------

-- ----------------------------
-- Table structure for `project_user`
-- ----------------------------
DROP TABLE IF EXISTS `project_user`;
CREATE TABLE `project_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_project_user_project_id` (`project_id`),
  KEY `fk_project_user_user_id` (`user_id`),
  CONSTRAINT `fk_project_user_project_id` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`),
  CONSTRAINT `fk_project_user_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='��Ŀ���û��м��';

-- ----------------------------
-- Records of project_user
-- ----------------------------

-- ----------------------------
-- Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `role_name` varchar(32) DEFAULT NULL COMMENT '角色名',
  `role_sign` varchar(128) DEFAULT NULL COMMENT '角色标识,程序中判断使用,如"admin"',
  `description` varchar(256) DEFAULT NULL COMMENT '角色描述,UI界面显示使用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='角色表';

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', 'admin', 'admin', '管理员');
INSERT INTO `role` VALUES ('2', 'pm', 'pm', '项目经理');
INSERT INTO `role` VALUES ('3', 'user', 'user', '用户');

-- ----------------------------
-- Table structure for `role_permission`
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',
  `role_id` int(11) unsigned DEFAULT NULL COMMENT '角色id',
  `permission_id` int(11) unsigned DEFAULT NULL COMMENT '权限id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='角色与权限关联表';

-- ----------------------------
-- Records of role_permission
-- ----------------------------
INSERT INTO `role_permission` VALUES ('1', '2', '1');

-- ----------------------------
-- Table structure for `systems`
-- ----------------------------
DROP TABLE IF EXISTS `systems`;
CREATE TABLE `systems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `system_name` varchar(160) DEFAULT NULL,
  `system_status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of systems
-- ----------------------------

-- ----------------------------
-- Table structure for `timesheet`
-- ----------------------------
DROP TABLE IF EXISTS `timesheet`;
CREATE TABLE `timesheet` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL COMMENT 'Project ID',
  `user_id` int(11) DEFAULT NULL COMMENT 'User ID',
  `time_date` datetime DEFAULT NULL,
  `time_type` int(11) DEFAULT NULL COMMENT 'TimeSheetType',
  `time_cost_hours` int(11) DEFAULT NULL COMMENT 'time_cost_hours',
  `time_week_day` int(11) DEFAULT NULL,
  `time_description` varchar(320) DEFAULT NULL,
  `time_comment` varchar(320) DEFAULT NULL,
  `time_status` int(11) DEFAULT NULL,
  `time_reject_comment` varchar(320) DEFAULT NULL,
  `time_create_by` int(11) DEFAULT NULL,
  `time_create_time` datetime DEFAULT NULL,
  `time_update_by` int(11) DEFAULT NULL,
  `time_update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_timesheet_project_id` (`project_id`),
  CONSTRAINT `fk_timesheet_project_id` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of timesheet
-- ----------------------------

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eid` varchar(30) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(320) DEFAULT NULL,
  `user_email` varchar(60) DEFAULT NULL,
  `user_job_title` int(11) DEFAULT NULL COMMENT 'JobTitle',
  `state` int(11) DEFAULT NULL COMMENT '״̬',
  `user_surpervisor_id` int(11) DEFAULT NULL,
  `user_create_by` int(11) DEFAULT NULL,
  `user_create_time` datetime DEFAULT NULL,
  `user_update_by` int(11) DEFAULT NULL,
  `user_update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'aaa', 'aaa', 'aaa', 'aaa@aaa.com', null, '1', null, null, null, null, null);
INSERT INTO `user` VALUES ('3', null, 'starzou', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', null, null, null, null, null, '2018-02-28 00:08:26', null, null);

-- ----------------------------
-- Table structure for `user_role`
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',
  `user_id` int(11) unsigned DEFAULT NULL COMMENT '用户id',
  `role_id` int(11) unsigned DEFAULT NULL COMMENT '角色id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='用户与角色关联表';

-- ----------------------------
-- Records of user_role
-- ----------------------------
