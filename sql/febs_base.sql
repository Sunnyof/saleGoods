/*
 Navicat MySQL Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80023
 Source Host           : localhost:3306
 Source Schema         : febs_base

 Target Server Type    : MySQL
 Target Server Version : 80023
 File Encoding         : 65001

 Date: 17/02/2021 19:11:45
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_category
-- ----------------------------
DROP TABLE IF EXISTS `t_category`;
CREATE TABLE `t_category`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '种类名称',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '单价',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `creator_id` bigint(0) NULL DEFAULT NULL COMMENT '创建者ID',
  `creator_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建者名称',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `modifier_id` bigint(0) NULL DEFAULT NULL COMMENT '修改者ID',
  `modifier_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '修改者名称',
  `category_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_category
-- ----------------------------
INSERT INTO `t_category` VALUES (3, '白菜', 202.00, '2021-02-07 09:07:03', 1, 'MrBird', NULL, NULL, NULL, '000002');
INSERT INTO `t_category` VALUES (4, '土豆', 2.00, '2021-02-09 08:43:07', 1, 'MrBird', NULL, NULL, NULL, '000001');

-- ----------------------------
-- Table structure for t_data_permission_test
-- ----------------------------
DROP TABLE IF EXISTS `t_data_permission_test`;
CREATE TABLE `t_data_permission_test`  (
  `FIELD1` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `FIELD2` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `FIELD3` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `FIELD4` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DEPT_ID` int(0) NOT NULL,
  `CREATE_TIME` datetime(0) NOT NULL,
  `ID` int(0) NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户权限测试' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_data_permission_test
-- ----------------------------
INSERT INTO `t_data_permission_test` VALUES ('小米', '小米10Pro', '4999', '珍珠白', 1, '2020-04-14 15:00:38', 1);
INSERT INTO `t_data_permission_test` VALUES ('腾讯', '黑鲨游戏手机3', '3799', '铠甲灰', 2, '2020-04-14 15:01:36', 2);
INSERT INTO `t_data_permission_test` VALUES ('华为', '华为P30', '3299', '天空之境', 1, '2020-04-14 15:03:11', 3);
INSERT INTO `t_data_permission_test` VALUES ('华为', '华为P40Pro', '6488', '亮黑色', 3, '2020-04-14 15:04:31', 4);
INSERT INTO `t_data_permission_test` VALUES ('vivo', 'Vivo iQOO 3', '3998', '拉力橙', 4, '2020-04-14 15:05:55', 5);
INSERT INTO `t_data_permission_test` VALUES ('一加', '一加7T', '3199', '冰际蓝', 5, '2020-04-14 15:06:53', 6);
INSERT INTO `t_data_permission_test` VALUES ('三星', '三星Galaxy S10', '4098', '浩玉白', 6, '2020-04-14 15:08:25', 7);
INSERT INTO `t_data_permission_test` VALUES ('苹果', 'iPhone 11 pro max', '9198', '暗夜绿', 4, '2020-04-14 15:09:20', 8);

-- ----------------------------
-- Table structure for t_dept
-- ----------------------------
DROP TABLE IF EXISTS `t_dept`;
CREATE TABLE `t_dept`  (
  `DEPT_ID` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '部门ID',
  `PARENT_ID` bigint(0) NOT NULL COMMENT '上级部门ID',
  `DEPT_NAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '部门名称',
  `ORDER_NUM` bigint(0) NULL DEFAULT NULL COMMENT '排序',
  `CREATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `MODIFY_TIME` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`DEPT_ID`) USING BTREE,
  INDEX `t_dept_parent_id`(`PARENT_ID`) USING BTREE,
  INDEX `t_dept_dept_name`(`DEPT_NAME`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_dept
-- ----------------------------
INSERT INTO `t_dept` VALUES (1, 0, '开发部', 1, '2019-06-14 20:56:41', NULL);
INSERT INTO `t_dept` VALUES (2, 1, '开发一部', 1, '2019-06-14 20:58:46', NULL);
INSERT INTO `t_dept` VALUES (3, 1, '开发二部', 2, '2019-06-14 20:58:56', NULL);
INSERT INTO `t_dept` VALUES (4, 0, '采购部', 2, '2019-06-14 20:59:56', NULL);
INSERT INTO `t_dept` VALUES (5, 0, '财务部', 3, '2019-06-14 21:00:08', NULL);
INSERT INTO `t_dept` VALUES (6, 0, '销售部', 4, '2019-06-14 21:00:15', NULL);
INSERT INTO `t_dept` VALUES (7, 0, '工程部', 5, '2019-06-14 21:00:42', NULL);
INSERT INTO `t_dept` VALUES (8, 0, '行政部', 6, '2019-06-14 21:00:49', NULL);
INSERT INTO `t_dept` VALUES (9, 0, '人力资源部', 8, '2019-06-14 21:01:14', '2019-06-14 21:01:34');
INSERT INTO `t_dept` VALUES (10, 0, '系统部', 7, '2019-06-14 21:01:31', NULL);

-- ----------------------------
-- Table structure for t_eximport
-- ----------------------------
DROP TABLE IF EXISTS `t_eximport`;
CREATE TABLE `t_eximport`  (
  `FIELD1` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字段1',
  `FIELD2` int(0) NOT NULL COMMENT '字段2',
  `FIELD3` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字段3',
  `CREATE_TIME` datetime(0) NOT NULL
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Excel导入导出测试' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_eximport
-- ----------------------------
INSERT INTO `t_eximport` VALUES ('字段1', 1, 'mrbird0@gmail.com', '2019-06-13 03:14:06');
INSERT INTO `t_eximport` VALUES ('字段1', 2, 'mrbird1@gmail.com', '2019-06-13 03:14:06');
INSERT INTO `t_eximport` VALUES ('字段1', 3, 'mrbird2@gmail.com', '2019-06-13 03:14:06');
INSERT INTO `t_eximport` VALUES ('字段1', 4, 'mrbird3@gmail.com', '2019-06-13 03:14:06');
INSERT INTO `t_eximport` VALUES ('字段1', 5, 'mrbird4@gmail.com', '2019-06-13 03:14:06');
INSERT INTO `t_eximport` VALUES ('字段1', 6, 'mrbird5@gmail.com', '2019-06-13 03:14:06');
INSERT INTO `t_eximport` VALUES ('字段1', 7, 'mrbird6@gmail.com', '2019-06-13 03:14:06');
INSERT INTO `t_eximport` VALUES ('字段1', 8, 'mrbird7@gmail.com', '2019-06-13 03:14:06');
INSERT INTO `t_eximport` VALUES ('字段1', 9, 'mrbird8@gmail.com', '2019-06-13 03:14:06');
INSERT INTO `t_eximport` VALUES ('字段1', 10, 'mrbird9@gmail.com', '2019-06-13 03:14:06');
INSERT INTO `t_eximport` VALUES ('字段1', 11, 'mrbird10@gmail.com', '2019-06-13 03:14:06');
INSERT INTO `t_eximport` VALUES ('字段1', 12, 'mrbird11@gmail.com', '2019-06-13 03:14:06');
INSERT INTO `t_eximport` VALUES ('字段1', 13, 'mrbird12@gmail.com', '2019-06-13 03:14:06');
INSERT INTO `t_eximport` VALUES ('字段1', 14, 'mrbird13@gmail.com', '2019-06-13 03:14:06');
INSERT INTO `t_eximport` VALUES ('字段1', 15, 'mrbird14@gmail.com', '2019-06-13 03:14:06');
INSERT INTO `t_eximport` VALUES ('字段1', 16, 'mrbird15@gmail.com', '2019-06-13 03:14:06');
INSERT INTO `t_eximport` VALUES ('字段1', 17, 'mrbird16@gmail.com', '2019-06-13 03:14:06');
INSERT INTO `t_eximport` VALUES ('字段1', 18, 'mrbird17@gmail.com', '2019-06-13 03:14:06');
INSERT INTO `t_eximport` VALUES ('字段1', 19, 'mrbird18@gmail.com', '2019-06-13 03:14:06');
INSERT INTO `t_eximport` VALUES ('字段1', 20, 'mrbird19@gmail.com', '2019-06-13 03:14:06');

-- ----------------------------
-- Table structure for t_generator_config
-- ----------------------------
DROP TABLE IF EXISTS `t_generator_config`;
CREATE TABLE `t_generator_config`  (
  `id` int(0) NOT NULL COMMENT '主键',
  `author` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '作者',
  `base_package` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '基础包名',
  `entity_package` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'entity文件存放路径',
  `mapper_package` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'mapper文件存放路径',
  `mapper_xml_package` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'mapper xml文件存放路径',
  `service_package` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'servcie文件存放路径',
  `service_impl_package` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'serviceImpl文件存放路径',
  `controller_package` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'controller文件存放路径',
  `is_trim` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否去除前缀 1是 0否',
  `trim_value` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '前缀内容',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_generator_config
-- ----------------------------
INSERT INTO `t_generator_config` VALUES (1, 'MrBird', 'cc.mrbird.febs.gen', 'entity', 'mapper', 'mapper', 'service', 'service.impl', 'controller', '1', 't_');

-- ----------------------------
-- Table structure for t_job
-- ----------------------------
DROP TABLE IF EXISTS `t_job`;
CREATE TABLE `t_job`  (
  `JOB_ID` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '任务id',
  `BEAN_NAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'spring bean名称',
  `METHOD_NAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '方法名',
  `PARAMS` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数',
  `CRON_EXPRESSION` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'cron表达式',
  `STATUS` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务状态  0：正常  1：暂停',
  `REMARK` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `CREATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`JOB_ID`) USING BTREE,
  INDEX `t_job_create_time`(`CREATE_TIME`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_job
-- ----------------------------
INSERT INTO `t_job` VALUES (1, 'testTask', 'test', 'mrbird', '0/1 * * * * ?', '1', '有参任务调度测试~~', '2018-02-24 16:26:14');
INSERT INTO `t_job` VALUES (2, 'testTask', 'test1', NULL, '0/10 * * * * ?', '1', '无参任务调度测试', '2018-02-24 17:06:23');
INSERT INTO `t_job` VALUES (3, 'testTask', 'test', 'hello world', '0/1 * * * * ?', '1', '有参任务调度测试,每隔一秒触发', '2018-02-26 09:28:26');
INSERT INTO `t_job` VALUES (11, 'testTask', 'test2', NULL, '0/5 * * * * ?', '1', '测试异常', '2018-02-26 11:15:30');

-- ----------------------------
-- Table structure for t_job_log
-- ----------------------------
DROP TABLE IF EXISTS `t_job_log`;
CREATE TABLE `t_job_log`  (
  `LOG_ID` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '任务日志id',
  `JOB_ID` bigint(0) NOT NULL COMMENT '任务id',
  `BEAN_NAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'spring bean名称',
  `METHOD_NAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '方法名',
  `PARAMS` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数',
  `STATUS` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务状态    0：成功    1：失败',
  `ERROR` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '失败信息',
  `TIMES` decimal(11, 0) NULL DEFAULT NULL COMMENT '耗时(单位：毫秒)',
  `CREATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`LOG_ID`) USING BTREE,
  INDEX `t_job_log_create_time`(`CREATE_TIME`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2562 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for t_log
-- ----------------------------
DROP TABLE IF EXISTS `t_log`;
CREATE TABLE `t_log`  (
  `ID` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '日志ID',
  `USERNAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作用户',
  `OPERATION` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '操作内容',
  `TIME` decimal(11, 0) NULL DEFAULT NULL COMMENT '耗时',
  `METHOD` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '操作方法',
  `PARAMS` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '方法参数',
  `IP` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作者IP',
  `CREATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `location` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作地点',
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `t_log_create_time`(`CREATE_TIME`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1123 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_log
-- ----------------------------
INSERT INTO `t_log` VALUES (1011, 'MrBird', '修改菜单/按钮', 55, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=1, parentId=0, menuName=系统管理, url=商品管理, perms=, icon=layui-icon-setting, type=0, orderNum=1, createTime=null, modifyTime=Fri Feb 05 10:11:54 CST 2021)\"', '192.168.3.2', '2021-02-05 10:11:55', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1012, 'MrBird', '新增菜单/按钮', 11, 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=179, parentId=0, menuName=商品管理, url=/, perms=, icon=layui-icon-trophy, type=0, orderNum=null, createTime=Fri Feb 05 10:12:40 CST 2021, modifyTime=null)\"', '192.168.3.2', '2021-02-05 10:12:40', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1013, 'MrBird', '修改菜单/按钮', 14, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=179, parentId=0, menuName=商品管理, url=商品管理, perms=, icon=layui-icon-trophy, type=0, orderNum=null, createTime=null, modifyTime=Fri Feb 05 10:12:55 CST 2021)\"', '192.168.3.2', '2021-02-05 10:12:56', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1014, 'MrBird', '修改菜单/按钮', 16, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=1, parentId=0, menuName=系统管理, url=, perms=, icon=layui-icon-setting, type=0, orderNum=1, createTime=null, modifyTime=Fri Feb 05 10:13:03 CST 2021)\"', '192.168.3.2', '2021-02-05 10:13:04', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1015, 'MrBird', '修改菜单/按钮', 14, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=179, parentId=0, menuName=商品管理, url=商品管理, perms=, icon=layui-icon-trophy, type=0, orderNum=0, createTime=null, modifyTime=Fri Feb 05 10:13:10 CST 2021)\"', '192.168.3.2', '2021-02-05 10:13:10', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1016, 'MrBird', '修改菜单/按钮', 15, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=179, parentId=0, menuName=商品管理, url=, perms=, icon=layui-icon-trophy, type=0, orderNum=0, createTime=null, modifyTime=Fri Feb 05 10:13:47 CST 2021)\"', '192.168.3.2', '2021-02-05 10:13:47', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1017, 'MrBird', '修改菜单/按钮', 19, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=179, parentId=0, menuName=商品管理, url=, perms=, icon=layui-icon-trophy, type=0, orderNum=6, createTime=null, modifyTime=Fri Feb 05 10:13:55 CST 2021)\"', '192.168.3.2', '2021-02-05 10:13:55', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1018, 'MrBird', '新增菜单/按钮', 21, 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=180, parentId=179, menuName=销售记录, url=/saleRecord/saleRecord, perms=, icon=layui-icon-check-circle, type=0, orderNum=1, createTime=Fri Feb 05 10:15:05 CST 2021, modifyTime=null)\"', '192.168.3.2', '2021-02-05 10:15:05', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1019, 'MrBird', '修改菜单/按钮', 17, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=180, parentId=179, menuName=销售记录, url=saleRecord:saleRecord, perms=, icon=layui-icon-check-circle, type=0, orderNum=1, createTime=null, modifyTime=Fri Feb 05 10:15:55 CST 2021)\"', '192.168.3.2', '2021-02-05 10:15:55', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1020, 'MrBird', '修改菜单/按钮', 21, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=180, parentId=179, menuName=销售记录, url=saleRecord:saleRecord, perms=saleRecord:saleRecord, icon=layui-icon-check-circle, type=0, orderNum=1, createTime=null, modifyTime=Fri Feb 05 10:16:03 CST 2021)\"', '192.168.3.2', '2021-02-05 10:16:04', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1021, 'MrBird', '修改菜单/按钮', 14, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=180, parentId=179, menuName=销售记录, url=/saleRecord/saleRecord, perms=saleRecord:saleRecord, icon=layui-icon-check-circle, type=0, orderNum=1, createTime=null, modifyTime=Fri Feb 05 10:16:21 CST 2021)\"', '192.168.3.2', '2021-02-05 10:16:21', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1022, 'MrBird', '修改角色', 60, 'cc.mrbird.febs.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=1, roleName=系统管理员, remark=系统管理员，拥有所有操作权限 ^_^, createTime=null, modifyTime=Fri Feb 05 10:23:42 CST 2021, menuIds=1,3,12,160,161,11,13,4,162,14,15,16,5,163,17,18,19,6,164,21,20,22,2,8,23,10,24,170,136,171,172,127,128,129,131,175,101,102,103,104,105,106,107,108,173,109,174,110,137,138,165,139,166,115,132,133,135,134,126,159,116,117,119,120,121,122,123,118,125,169,167,168,178,179,180)\"', '192.168.3.2', '2021-02-05 10:23:43', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1023, 'MrBird', '修改菜单/按钮', 53, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=180, parentId=179, menuName=销售记录, url=/saleRecord, perms=saleRecord:saleRecord, icon=layui-icon-check-circle, type=0, orderNum=1, createTime=null, modifyTime=Fri Feb 05 10:27:33 CST 2021)\"', '192.168.3.2', '2021-02-05 10:27:34', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1024, 'MrBird', '修改菜单/按钮', 80, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=180, parentId=179, menuName=销售记录, url=/saleRecord, perms=febs:saleRecord:saleRecord, icon=layui-icon-check-circle, type=0, orderNum=1, createTime=null, modifyTime=Fri Feb 05 10:36:00 CST 2021)\"', '192.168.3.2', '2021-02-05 10:36:01', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1025, 'MrBird', '修改菜单/按钮', 21, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=180, parentId=179, menuName=销售记录, url=febs/saleRecord, perms=febs:saleRecord:saleRecord, icon=layui-icon-check-circle, type=0, orderNum=1, createTime=null, modifyTime=Fri Feb 05 10:36:36 CST 2021)\"', '192.168.3.2', '2021-02-05 10:36:37', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1026, 'MrBird', '修改菜单/按钮', 17, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=180, parentId=179, menuName=销售记录, url=gen/febs/saleRecord, perms=febs:saleRecord:saleRecord, icon=layui-icon-check-circle, type=0, orderNum=1, createTime=null, modifyTime=Fri Feb 05 10:46:56 CST 2021)\"', '192.168.3.2', '2021-02-05 10:46:56', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1027, 'MrBird', '修改菜单/按钮', 16, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=180, parentId=179, menuName=销售记录, url=/saleRecord, perms=febs:saleRecord:saleRecord, icon=layui-icon-check-circle, type=0, orderNum=1, createTime=null, modifyTime=Fri Feb 05 10:48:03 CST 2021)\"', '192.168.3.2', '2021-02-05 10:48:04', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1028, 'MrBird', '修改菜单/按钮', 152, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=180, parentId=179, menuName=销售记录, url=febs/saleRecord, perms=febs:saleRecord:saleRecord, icon=layui-icon-check-circle, type=0, orderNum=1, createTime=null, modifyTime=Fri Feb 05 10:50:37 CST 2021)\"', '192.168.3.2', '2021-02-05 10:50:37', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1029, 'MrBird', '修改菜单/按钮', 98, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=180, parentId=179, menuName=销售记录, url=generator/generator, perms=febs:saleRecord:saleRecord, icon=layui-icon-check-circle, type=0, orderNum=1, createTime=null, modifyTime=Fri Feb 05 10:53:53 CST 2021)\"', '192.168.3.2', '2021-02-05 10:53:53', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1030, 'MrBird', '修改菜单/按钮', 20, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=180, parentId=179, menuName=销售记录, url=saleRecord/saleRecord, perms=febs:saleRecord:saleRecord, icon=layui-icon-check-circle, type=0, orderNum=1, createTime=null, modifyTime=Fri Feb 05 10:54:59 CST 2021)\"', '192.168.3.2', '2021-02-05 10:54:59', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1031, 'MrBird', '修改菜单/按钮', 21, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=180, parentId=179, menuName=销售记录, url=gen/saleRecord, perms=febs:saleRecord:saleRecord, icon=layui-icon-check-circle, type=0, orderNum=1, createTime=null, modifyTime=Fri Feb 05 10:57:18 CST 2021)\"', '192.168.3.2', '2021-02-05 10:57:18', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1032, 'MrBird', '修改菜单/按钮', 119, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=180, parentId=179, menuName=销售记录, url=saleRecord/saleRecord, perms=saleRecord:view, icon=layui-icon-check-circle, type=0, orderNum=1, createTime=null, modifyTime=Fri Feb 05 11:01:25 CST 2021)\"', '192.168.3.2', '2021-02-05 11:01:25', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1033, 'MrBird', '修改菜单/按钮', 112, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=180, parentId=179, menuName=销售记录, url=/saleRecord, perms=saleRecord:view, icon=layui-icon-check-circle, type=0, orderNum=1, createTime=null, modifyTime=Fri Feb 05 11:04:40 CST 2021)\"', '192.168.3.2', '2021-02-05 11:04:40', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1034, 'MrBird', '修改角色', 97, 'cc.mrbird.febs.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=1, roleName=系统管理员, remark=系统管理员，拥有所有操作权限 ^_^, createTime=null, modifyTime=Fri Feb 05 11:05:01 CST 2021, menuIds=1,3,12,160,161,11,13,4,162,14,15,16,5,163,17,18,19,6,164,21,20,22,2,8,23,10,24,170,136,171,172,127,128,129,131,175,101,102,103,104,105,106,107,108,173,109,174,110,137,138,165,139,166,115,132,133,135,134,126,159,116,117,119,120,121,122,123,118,125,169,167,168,178,179,180)\"', '192.168.3.2', '2021-02-05 11:05:02', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1035, 'MrBird', '修改菜单/按钮', 25, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=180, parentId=179, menuName=销售记录, url=/saleRecord, perms=febs:saleRecord:saleRecord, icon=layui-icon-check-circle, type=0, orderNum=1, createTime=null, modifyTime=Fri Feb 05 11:05:34 CST 2021)\"', '192.168.3.2', '2021-02-05 11:05:35', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1036, 'MrBird', '新增菜单/按钮', 18, 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=181, parentId=179, menuName=商品类型, url=, perms=, icon=layui-icon-Dollar, type=0, orderNum=null, createTime=Fri Feb 05 14:57:39 CST 2021, modifyTime=null)\"', '192.168.3.2', '2021-02-05 14:57:40', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1037, 'MrBird', '修改角色', 102, 'cc.mrbird.febs.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=1, roleName=系统管理员, remark=系统管理员，拥有所有操作权限 ^_^, createTime=null, modifyTime=Fri Feb 05 15:44:38 CST 2021, menuIds=1,3,12,160,161,11,13,4,162,14,15,16,5,163,17,18,19,6,164,21,20,22,2,8,23,10,170,24,136,171,172,127,128,129,131,175,101,102,103,104,105,106,107,108,173,109,110,174,137,138,165,139,166,115,132,133,135,134,126,159,116,117,119,120,121,122,123,118,125,167,168,169,178,179,181,180)\"', '192.168.3.2', '2021-02-05 15:44:38', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1038, 'MrBird', '修改菜单/按钮', 46, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=180, parentId=179, menuName=销售记录, url=/saleRecord, perms=saleRecord:list, icon=layui-icon-check-circle, type=0, orderNum=1, createTime=null, modifyTime=Fri Feb 05 15:51:00 CST 2021)\"', '192.168.3.2', '2021-02-05 15:51:00', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1039, 'MrBird', '新增菜单/按钮', 26, 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=182, parentId=180, menuName=新增销售, url=null, perms=category:add, icon=null, type=1, orderNum=null, createTime=Fri Feb 05 15:59:36 CST 2021, modifyTime=null)\"', '192.168.3.2', '2021-02-05 15:59:36', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1040, 'MrBird', '修改菜单/按钮', 39, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=182, parentId=180, menuName=新增销售, url=null, perms=saleRecord:add, icon=null, type=1, orderNum=null, createTime=null, modifyTime=Fri Feb 05 16:00:26 CST 2021)\"', '192.168.3.2', '2021-02-05 16:00:26', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1041, 'MrBird', '新增菜单/按钮', 9, 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=183, parentId=180, menuName=删除记录, url=null, perms=saleRecord:delete, icon=null, type=1, orderNum=null, createTime=Fri Feb 05 16:01:01 CST 2021, modifyTime=null)\"', '192.168.3.2', '2021-02-05 16:01:01', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1042, 'MrBird', '新增菜单/按钮', 12, 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=184, parentId=180, menuName=导出Excel, url=null, perms=saleRecord:export, icon=null, type=1, orderNum=null, createTime=Fri Feb 05 16:01:48 CST 2021, modifyTime=null)\"', '192.168.3.2', '2021-02-05 16:01:48', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1043, 'MrBird', '新增菜单/按钮', 13, 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=185, parentId=180, menuName=修改销售记录, url=null, perms=saleRecord:update, icon=null, type=1, orderNum=null, createTime=Fri Feb 05 16:02:21 CST 2021, modifyTime=null)\"', '192.168.3.2', '2021-02-05 16:02:22', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1044, 'MrBird', '修改角色', 81, 'cc.mrbird.febs.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=1, roleName=系统管理员, remark=系统管理员，拥有所有操作权限 ^_^, createTime=null, modifyTime=Fri Feb 05 16:02:33 CST 2021, menuIds=1,3,12,160,161,11,13,4,162,14,15,16,5,163,17,18,19,6,164,21,20,22,2,8,23,10,170,24,136,171,172,127,128,129,131,175,101,102,103,104,105,106,107,108,173,109,110,174,137,138,165,139,166,115,132,133,135,134,126,159,116,117,119,120,121,122,123,118,125,167,168,169,178,179,181,180)\"', '192.168.3.2', '2021-02-05 16:02:34', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1045, 'MrBird', '修改角色', 104, 'cc.mrbird.febs.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=1, roleName=系统管理员, remark=系统管理员，拥有所有操作权限 ^_^, createTime=null, modifyTime=Fri Feb 05 16:14:08 CST 2021, menuIds=1,3,13,160,161,11,12,4,162,14,15,16,5,163,17,18,19,6,164,20,21,22,2,8,23,10,24,170,136,171,172,127,128,129,131,175,101,102,103,104,105,106,107,108,173,109,110,174,137,138,165,139,166,115,132,133,135,134,126,159,116,117,119,120,121,122,123,118,125,167,168,169,178,179,181,180,182,183,184,185)\"', '192.168.3.2', '2021-02-05 16:14:08', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1046, 'MrBird', '新增菜单/按钮', 30, 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=186, parentId=181, menuName=添加商品类型, url=null, perms=category:add, icon=null, type=1, orderNum=null, createTime=Sat Feb 06 18:45:01 CST 2021, modifyTime=null)\"', '192.168.3.2', '2021-02-06 18:45:01', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1047, 'MrBird', '修改菜单/按钮', 75, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=181, parentId=179, menuName=商品类型, url=, perms=category:list, icon=layui-icon-Dollar, type=0, orderNum=null, createTime=null, modifyTime=Sat Feb 06 18:45:18 CST 2021)\"', '192.168.3.2', '2021-02-06 18:45:18', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1048, 'MrBird', '修改菜单/按钮', 36, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=181, parentId=179, menuName=商品类型, url=, perms=category:list, icon=layui-icon-Dollar, type=0, orderNum=1, createTime=null, modifyTime=Sat Feb 06 18:45:26 CST 2021)\"', '192.168.3.2', '2021-02-06 18:45:27', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1049, 'MrBird', '修改菜单/按钮', 26, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=181, parentId=179, menuName=商品类型, url=, perms=category:list, icon=layui-icon-Dollar, type=0, orderNum=2, createTime=null, modifyTime=Sat Feb 06 18:45:29 CST 2021)\"', '192.168.3.2', '2021-02-06 18:45:30', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1050, 'MrBird', '新增SaleRecord', 24, 'cc.mrbird.febs.gen.controller.SaleRecordController.addSaleRecord()', ' saleRecord: SaleRecord(amount=23, categoryId=1, categoryName=test, collectionDate=Sat Feb 06 20:29:20 CST 2021, createTime=Sat Feb 06 20:29:20 CST 2021, creatorId=1, creatorName=MrBird, id=1, price=1, totalBalance=23, remark=)', '192.168.3.2', '2021-02-06 20:29:21', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1051, 'MrBird', '修改菜单/按钮', 55, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=181, parentId=179, menuName=商品类型, url=category, perms=category:list, icon=layui-icon-Dollar, type=0, orderNum=2, createTime=null, modifyTime=Sat Feb 06 22:04:15 CST 2021)\"', '192.168.3.2', '2021-02-06 22:04:16', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1052, 'MrBird', '修改菜单/按钮', 69, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=181, parentId=179, menuName=商品类型, url=/category, perms=category:list, icon=layui-icon-Dollar, type=0, orderNum=2, createTime=null, modifyTime=Sat Feb 06 22:06:02 CST 2021)\"', '192.168.3.2', '2021-02-06 22:06:02', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1053, 'MrBird', '修改菜单/按钮', 39, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=181, parentId=179, menuName=商品类型, url=/saleRecord, perms=category:list, icon=layui-icon-Dollar, type=0, orderNum=2, createTime=null, modifyTime=Sat Feb 06 22:07:39 CST 2021)\"', '192.168.3.2', '2021-02-06 22:07:39', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1054, 'MrBird', '修改角色', 88, 'cc.mrbird.febs.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=1, roleName=系统管理员, remark=系统管理员，拥有所有操作权限 ^_^, createTime=null, modifyTime=Sat Feb 06 22:08:08 CST 2021, menuIds=1,3,13,160,161,11,12,4,162,14,15,16,5,163,17,18,19,6,164,20,21,22,2,8,23,10,24,170,136,171,172,127,128,129,131,175,101,102,103,104,105,106,107,108,173,109,110,174,137,138,165,139,166,115,132,133,135,134,126,159,116,117,119,120,121,122,123,118,125,167,168,169,178,179,180,182,183,184,185,181,186)\"', '192.168.3.2', '2021-02-06 22:08:09', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1055, 'MrBird', '修改菜单/按钮', 23, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=181, parentId=179, menuName=商品类型, url=/category, perms=category:list, icon=layui-icon-Dollar, type=0, orderNum=2, createTime=null, modifyTime=Sat Feb 06 22:10:01 CST 2021)\"', '192.168.3.2', '2021-02-06 22:10:02', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1056, 'MrBird', '新增菜单/按钮', 13, 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=187, parentId=186, menuName=删除商品类型, url=null, perms=category:delete, icon=null, type=1, orderNum=null, createTime=Sun Feb 07 08:56:58 CST 2021, modifyTime=null)\"', '192.168.3.2', '2021-02-07 08:56:58', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1057, 'MrBird', '新增菜单/按钮', 15, 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=188, parentId=181, menuName=导出商品类型, url=null, perms=category:export, icon=null, type=1, orderNum=null, createTime=Sun Feb 07 08:57:20 CST 2021, modifyTime=null)\"', '192.168.3.2', '2021-02-07 08:57:20', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1058, 'MrBird', '修改角色', 67, 'cc.mrbird.febs.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=1, roleName=系统管理员, remark=系统管理员，拥有所有操作权限 ^_^, createTime=null, modifyTime=Sun Feb 07 08:57:41 CST 2021, menuIds=1,3,13,161,11,12,160,4,162,14,15,16,5,163,17,18,19,6,164,20,21,22,2,8,23,10,24,170,136,171,172,127,128,129,131,175,101,102,103,104,105,106,107,108,173,109,110,174,137,138,165,139,166,115,132,133,135,134,126,159,116,117,119,120,121,122,123,118,125,167,168,169,178,179,180,182,183,184,185,181,186,187,188)\"', '192.168.3.2', '2021-02-07 08:57:42', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1059, 'MrBird', '修改菜单/按钮', 18, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=187, parentId=181, menuName=删除商品类型, url=null, perms=category:delete, icon=null, type=1, orderNum=null, createTime=null, modifyTime=Sun Feb 07 08:57:54 CST 2021)\"', '192.168.3.2', '2021-02-07 08:57:54', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1060, 'MrBird', '修改角色', 38, 'cc.mrbird.febs.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=1, roleName=系统管理员, remark=系统管理员，拥有所有操作权限 ^_^, createTime=null, modifyTime=Sun Feb 07 08:58:15 CST 2021, menuIds=1,3,13,161,11,12,160,4,162,14,15,16,5,163,17,18,19,6,164,20,21,22,2,8,23,10,24,170,136,171,172,127,128,129,131,175,101,102,103,104,105,106,107,108,173,109,110,174,137,138,165,139,166,115,132,133,135,134,126,159,116,117,119,120,121,122,123,118,125,167,168,169,178,179,180,182,183,184,185,181,186,187,188)\"', '192.168.3.2', '2021-02-07 08:58:16', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1061, 'MrBird', '新增Category', 26, 'cc.mrbird.febs.gen.controller.CategoryController.addCategory()', ' category: Category(createTime=Sun Feb 07 09:04:58 CST 2021, creatorId=1, creatorName=MrBird, id=2, modifierId=null, modifierName=null, modifyTime=null, name=2, price=3)', '192.168.3.2', '2021-02-07 09:04:59', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1062, 'MrBird', '新增Category', 50, 'cc.mrbird.febs.gen.controller.CategoryController.addCategory()', ' category: Category(createTime=Sun Feb 07 09:07:03 CST 2021, creatorId=1, creatorName=MrBird, id=3, modifierId=null, modifierName=null, modifyTime=null, name=白菜, price=20, categoryCode=000001)', '192.168.3.2', '2021-02-07 09:07:03', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1063, 'MrBird', '新增SaleRecord', 27, 'cc.mrbird.febs.gen.controller.SaleRecordController.addSaleRecord()', ' saleRecord: SaleRecord(amount=0.5, categoryId=3, categoryName=白菜, collectionDate=Sun Feb 07 09:08:40 CST 2021, createTime=Sun Feb 07 09:08:40 CST 2021, creatorId=1, creatorName=MrBird, id=2, price=20, totalBalance=10, remark=白菜20)', '192.168.3.2', '2021-02-07 09:08:41', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1064, 'MrBird', '修改菜单/按钮', 51, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=181, parentId=179, menuName=商品类型, url=gen/category, perms=category:list, icon=layui-icon-Dollar, type=0, orderNum=2, createTime=null, modifyTime=Sun Feb 07 09:22:31 CST 2021)\"', '192.168.3.2', '2021-02-07 09:22:31', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1065, 'MrBird', '修改菜单/按钮', 18, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=180, parentId=179, menuName=销售记录, url=gen/saleRecord, perms=saleRecord:list, icon=layui-icon-check-circle, type=0, orderNum=1, createTime=null, modifyTime=Sun Feb 07 09:22:36 CST 2021)\"', '192.168.3.2', '2021-02-07 09:22:37', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1066, 'MrBird', '修改菜单/按钮', 88, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=180, parentId=179, menuName=销售记录, url=saleRecord, perms=saleRecord:list, icon=layui-icon-check-circle, type=0, orderNum=1, createTime=null, modifyTime=Sun Feb 07 09:27:19 CST 2021)\"', '192.168.3.2', '2021-02-07 09:27:20', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1067, 'MrBird', '修改菜单/按钮', 20, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=181, parentId=179, menuName=商品类型, url=category, perms=category:list, icon=layui-icon-Dollar, type=0, orderNum=2, createTime=null, modifyTime=Sun Feb 07 09:27:26 CST 2021)\"', '192.168.3.2', '2021-02-07 09:27:27', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1068, 'MrBird', '修改菜单/按钮', 52, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=180, parentId=179, menuName=销售记录, url=/saleRecord, perms=saleRecord:list, icon=layui-icon-check-circle, type=0, orderNum=1, createTime=null, modifyTime=Sun Feb 07 09:29:29 CST 2021)\"', '192.168.3.2', '2021-02-07 09:29:30', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1069, 'MrBird', '修改菜单/按钮', 22, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=181, parentId=179, menuName=商品类型, url=/category, perms=category:list, icon=layui-icon-Dollar, type=0, orderNum=2, createTime=null, modifyTime=Sun Feb 07 09:29:35 CST 2021)\"', '192.168.3.2', '2021-02-07 09:29:36', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1070, 'MrBird', '新增菜单/按钮', 29, 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=189, parentId=181, menuName=修改商品类型, url=null, perms=category:update, icon=null, type=1, orderNum=null, createTime=Sun Feb 07 10:33:23 CST 2021, modifyTime=null)\"', '192.168.3.2', '2021-02-07 10:33:23', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1071, 'MrBird', '修改角色', 88, 'cc.mrbird.febs.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=1, roleName=系统管理员, remark=系统管理员，拥有所有操作权限 ^_^, createTime=null, modifyTime=Sun Feb 07 10:33:30 CST 2021, menuIds=1,3,13,161,11,12,160,4,162,14,15,16,5,163,17,18,19,6,164,20,21,22,2,8,23,10,24,170,136,171,172,127,128,129,131,175,101,102,103,104,105,106,107,108,173,109,110,174,137,138,165,139,166,115,132,133,135,134,126,159,116,117,119,120,121,122,123,118,125,167,168,169,178,179,180,182,183,184,185,181,186,187,188,189)\"', '192.168.3.2', '2021-02-07 10:33:31', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1072, 'MrBird', '修改Category', 28, 'cc.mrbird.febs.gen.controller.CategoryController.updateCategory()', ' category: Category(createTime=null, creatorId=null, creatorName=null, id=3, modifierId=null, modifierName=null, modifyTime=null, name=白菜, price=201, categoryCode=000001)', '192.168.3.2', '2021-02-07 10:37:07', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1073, 'MrBird', '修改Category', 18, 'cc.mrbird.febs.gen.controller.CategoryController.updateCategory()', ' category: Category(createTime=null, creatorId=null, creatorName=null, id=3, modifierId=null, modifierName=null, modifyTime=null, name=白菜, price=201, categoryCode=000002)', '192.168.3.2', '2021-02-07 10:37:58', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1074, 'MrBird', '修改Category', 16, 'cc.mrbird.febs.gen.controller.CategoryController.updateCategory()', ' category: Category(createTime=null, creatorId=null, creatorName=null, id=3, modifierId=null, modifierName=null, modifyTime=null, name=白菜, price=201, categoryCode=000003)', '192.168.3.2', '2021-02-07 10:38:34', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1075, 'MrBird', '修改Category', 18, 'cc.mrbird.febs.gen.controller.CategoryController.updateCategory()', ' category: Category(createTime=null, creatorId=null, creatorName=null, id=3, modifierId=null, modifierName=null, modifyTime=null, name=白菜, price=202, categoryCode=000003)', '192.168.3.2', '2021-02-07 10:38:47', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1076, 'MrBird', '修改Category', 14, 'cc.mrbird.febs.gen.controller.CategoryController.updateCategory()', ' category: Category(createTime=null, creatorId=null, creatorName=null, id=3, modifierId=null, modifierName=null, modifyTime=null, name=白菜, price=202, categoryCode=000004)', '192.168.3.2', '2021-02-07 10:40:22', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1077, 'MrBird', '修改Category', 15, 'cc.mrbird.febs.gen.controller.CategoryController.updateCategory()', ' category: Category(createTime=null, creatorId=null, creatorName=null, id=2, modifierId=null, modifierName=null, modifyTime=null, name=2, price=3, categoryCode=123)', '192.168.3.2', '2021-02-07 10:53:58', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1078, 'MrBird', '修改Category', 23, 'cc.mrbird.febs.gen.controller.CategoryController.updateCategory()', ' category: Category(createTime=null, creatorId=null, creatorName=null, id=2, modifierId=null, modifierName=null, modifyTime=null, name=2, price=3, categoryCode=1234)', '192.168.3.2', '2021-02-07 10:54:30', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1079, 'MrBird', '修改Category', 12, 'cc.mrbird.febs.gen.controller.CategoryController.updateCategory()', ' category: Category(createTime=null, creatorId=null, creatorName=null, id=3, modifierId=null, modifierName=null, modifyTime=null, name=白菜, price=202, categoryCode=000003)', '192.168.3.2', '2021-02-07 10:55:16', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1080, 'MrBird', '修改Category', 12, 'cc.mrbird.febs.gen.controller.CategoryController.updateCategory()', ' category: Category(createTime=null, creatorId=null, creatorName=null, id=3, modifierId=null, modifierName=null, modifyTime=null, name=白菜, price=202, categoryCode=000002)', '192.168.3.2', '2021-02-07 10:55:23', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1081, 'MrBird', '修改Category', 10, 'cc.mrbird.febs.gen.controller.CategoryController.updateCategory()', ' category: Category(createTime=null, creatorId=null, creatorName=null, id=2, modifierId=null, modifierName=null, modifyTime=null, name=2, price=3, categoryCode=123)', '192.168.3.2', '2021-02-07 10:56:22', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1082, 'MrBird', '修改Category', 17, 'cc.mrbird.febs.gen.controller.CategoryController.updateCategory()', ' category: Category(createTime=null, creatorId=null, creatorName=null, id=3, modifierId=null, modifierName=null, modifyTime=null, name=白菜, price=2022, categoryCode=000002)', '192.168.3.2', '2021-02-07 10:57:41', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1083, 'MrBird', '修改Category', 14, 'cc.mrbird.febs.gen.controller.CategoryController.updateCategory()', ' category: Category(createTime=null, creatorId=null, creatorName=null, id=3, modifierId=null, modifierName=null, modifyTime=null, name=白菜, price=202, categoryCode=000002)', '192.168.3.2', '2021-02-07 10:59:16', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1084, 'MrBird', '修改Category', 14, 'cc.mrbird.febs.gen.controller.CategoryController.updateCategory()', ' category: Category(createTime=null, creatorId=null, creatorName=null, id=3, modifierId=null, modifierName=null, modifyTime=null, name=白菜, price=2021, categoryCode=000002)', '192.168.3.2', '2021-02-07 11:01:09', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1085, 'MrBird', '修改Category', 13, 'cc.mrbird.febs.gen.controller.CategoryController.updateCategory()', ' category: Category(createTime=null, creatorId=null, creatorName=null, id=3, modifierId=null, modifierName=null, modifyTime=null, name=白菜, price=202, categoryCode=000002)', '192.168.3.2', '2021-02-07 11:05:59', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1086, 'MrBird', '修改Category', 15, 'cc.mrbird.febs.gen.controller.CategoryController.updateCategory()', ' category: Category(createTime=null, creatorId=null, creatorName=null, id=2, modifierId=null, modifierName=null, modifyTime=null, name=2, price=32, categoryCode=123)', '192.168.3.2', '2021-02-07 11:07:03', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1087, 'MrBird', '修改Category', 13, 'cc.mrbird.febs.gen.controller.CategoryController.updateCategory()', ' category: Category(createTime=null, creatorId=null, creatorName=null, id=2, modifierId=null, modifierName=null, modifyTime=null, name=2, price=322, categoryCode=123)', '192.168.3.2', '2021-02-07 11:08:31', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1088, 'MrBird', '修改Category', 30, 'cc.mrbird.febs.gen.controller.CategoryController.updateCategory()', ' category: Category(createTime=null, creatorId=null, creatorName=null, id=2, modifierId=null, modifierName=null, modifyTime=null, name=2, price=3222, categoryCode=123)', '192.168.3.2', '2021-02-07 11:08:35', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1089, 'MrBird', '删除Category', 21, 'cc.mrbird.febs.gen.controller.CategoryController.deleteCategory()', ' category: Category(createTime=null, creatorId=null, creatorName=null, id=2, modifierId=null, modifierName=null, modifyTime=null, name=null, price=null, categoryCode=null)', '192.168.3.2', '2021-02-07 11:22:12', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1090, 'MrBird', '修改Category', 759, 'cc.mrbird.febs.gen.controller.CategoryController.export()', ' queryRequest: \"QueryRequest(pageSize=10, pageNum=1, field=createTime, order=null)\" category: \"Category(createTime=null, creatorId=null, creatorName=null, id=null, modifierId=null, modifierName=null, modifyTime=null, name=, price=null, categoryCode=)\" response: org.apache.shiro.web.servlet.ShiroHttpServletResponse@10b187a1', '192.168.3.2', '2021-02-07 11:47:41', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1091, 'MrBird', '新增SaleRecord', 31, 'cc.mrbird.febs.gen.controller.SaleRecordController.addSaleRecord()', ' saleRecord: \"SaleRecord(amount=2, categoryId=3, categoryName=白菜, collectionDate=Mon Feb 08 21:46:53 CST 2021, createTime=Mon Feb 08 21:46:53 CST 2021, creatorId=1, creatorName=MrBird, id=3, price=202, totalBalance=404, remark=22)\"', '192.168.3.2', '2021-02-08 21:46:54', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1092, 'MrBird', '新增SaleRecord', 17, 'cc.mrbird.febs.gen.controller.SaleRecordController.addSaleRecord()', ' saleRecord: \"SaleRecord(amount=23, categoryId=3, categoryName=白菜, collectionDate=Mon Feb 08 21:48:31 CST 2021, createTime=Mon Feb 08 21:48:31 CST 2021, creatorId=1, creatorName=MrBird, id=4, price=202, totalBalance=4646, remark=2)\"', '192.168.3.2', '2021-02-08 21:48:31', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1093, 'MrBird', '删除SaleRecord', 2072, 'cc.mrbird.febs.gen.controller.SaleRecordController.deleteSaleRecord()', ' saleRecord: \"SaleRecord(amount=null, categoryId=null, categoryName=null, collectionDate=null, createTime=null, creatorId=null, creatorName=null, id=1, price=null, totalBalance=null, remark=null)\"', '192.168.3.2', '2021-02-08 21:57:48', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1094, 'MrBird', '修改SaleRecord', 26, 'cc.mrbird.febs.gen.controller.SaleRecordController.updateSaleRecord()', ' saleRecord: \"SaleRecord(amount=0.5, categoryId=null, categoryName=白菜, collectionDate=null, createTime=null, creatorId=null, creatorName=null, id=3, price=20, totalBalance=10, remark=白菜20)\"', '192.168.3.2', '2021-02-08 22:20:40', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1095, 'MrBird', '修改SaleRecord', 11, 'cc.mrbird.febs.gen.controller.SaleRecordController.updateSaleRecord()', ' saleRecord: \"SaleRecord(amount=0.5, categoryId=null, categoryName=白菜, collectionDate=null, createTime=null, creatorId=null, creatorName=null, id=3, price=20, totalBalance=10, remark=白菜20)\"', '192.168.3.2', '2021-02-08 22:21:11', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1096, 'MrBird', '修改SaleRecord', 14, 'cc.mrbird.febs.gen.controller.SaleRecordController.updateSaleRecord()', ' saleRecord: \"SaleRecord(amount=2, categoryId=null, categoryName=白菜, collectionDate=null, createTime=null, creatorId=null, creatorName=null, id=3, price=20, totalBalance=40, remark=白菜20)\"', '192.168.3.2', '2021-02-08 22:21:14', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1097, 'MrBird', '修改SaleRecord', 14, 'cc.mrbird.febs.gen.controller.SaleRecordController.updateSaleRecord()', ' saleRecord: \"SaleRecord(amount=2, categoryId=null, categoryName=白菜, collectionDate=null, createTime=null, creatorId=null, creatorName=null, id=3, price=20, totalBalance=40, remark=白菜20)\"', '192.168.3.2', '2021-02-08 22:21:24', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1098, 'MrBird', '修改SaleRecord', 7, 'cc.mrbird.febs.gen.controller.SaleRecordController.updateSaleRecord()', ' saleRecord: \"SaleRecord(amount=2, categoryId=null, categoryName=白菜, collectionDate=null, createTime=null, creatorId=null, creatorName=null, id=3, price=20, totalBalance=40, remark=白菜20)\"', '192.168.3.2', '2021-02-08 22:22:11', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1099, 'MrBird', '修改SaleRecord', 50022, 'cc.mrbird.febs.gen.controller.SaleRecordController.updateSaleRecord()', ' saleRecord: \"SaleRecord(amount=2, categoryId=null, categoryName=白菜, collectionDate=null, createTime=null, creatorId=null, creatorName=null, id=3, price=20, totalBalance=40, remark=白菜20)\"', '192.168.3.2', '2021-02-08 22:23:47', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1100, 'MrBird', '修改SaleRecord', 18650, 'cc.mrbird.febs.gen.controller.SaleRecordController.updateSaleRecord()', ' saleRecord: \"SaleRecord(amount=0.5, categoryId=null, categoryName=白菜, collectionDate=null, createTime=Mon Feb 08 22:25:08 CST 2021, creatorId=1, creatorName=null, id=2, price=20, totalBalance=10, remark=白菜20)\"', '192.168.3.2', '2021-02-08 22:25:27', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1101, 'MrBird', '修改SaleRecord', 1986, 'cc.mrbird.febs.gen.controller.SaleRecordController.updateSaleRecord()', ' saleRecord: \"SaleRecord(amount=0.5, categoryId=null, categoryName=白菜, collectionDate=null, createTime=Mon Feb 08 22:25:25 CST 2021, creatorId=1, creatorName=null, id=2, price=20, totalBalance=10, remark=白菜20)\"', '192.168.3.2', '2021-02-08 22:25:27', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1102, 'MrBird', '修改SaleRecord', 24, 'cc.mrbird.febs.gen.controller.SaleRecordController.updateSaleRecord()', ' saleRecord: \"SaleRecord(amount=0.5, categoryId=null, categoryName=白菜, collectionDate=null, createTime=Mon Feb 08 22:25:27 CST 2021, creatorId=1, creatorName=null, id=2, price=20, totalBalance=10, remark=白菜20)\"', '192.168.3.2', '2021-02-08 22:25:27', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1103, 'MrBird', '修改SaleRecord', 29695, 'cc.mrbird.febs.gen.controller.SaleRecordController.updateSaleRecord()', ' saleRecord: \"SaleRecord(amount=0.5, categoryId=null, categoryName=白菜, collectionDate=null, createTime=Mon Feb 08 22:25:40 CST 2021, creatorId=1, creatorName=null, id=2, price=20, totalBalance=10, remark=白菜20)\"', '192.168.3.2', '2021-02-08 22:26:10', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1104, 'MrBird', '修改SaleRecord', 18, 'cc.mrbird.febs.gen.controller.SaleRecordController.updateSaleRecord()', ' saleRecord: \"SaleRecord(amount=2, categoryId=null, categoryName=白菜, collectionDate=null, createTime=Mon Feb 08 22:27:05 CST 2021, creatorId=1, creatorName=null, id=2, price=20, totalBalance=40, remark=白菜20)\"', '192.168.3.2', '2021-02-08 22:27:06', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1105, 'MrBird', '修改SaleRecord', 13, 'cc.mrbird.febs.gen.controller.SaleRecordController.updateSaleRecord()', ' saleRecord: \"SaleRecord(amount=3, categoryId=null, categoryName=白菜, collectionDate=null, createTime=Mon Feb 08 22:27:12 CST 2021, creatorId=1, creatorName=null, id=2, price=20, totalBalance=60, remark=白菜20)\"', '192.168.3.2', '2021-02-08 22:27:13', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1106, 'MrBird', '修改SaleRecord', 32, 'cc.mrbird.febs.gen.controller.SaleRecordController.updateSaleRecord()', ' saleRecord: \"SaleRecord(amount=3, categoryId=null, categoryName=白菜, collectionDate=null, createTime=Mon Feb 08 22:27:14 CST 2021, creatorId=1, creatorName=null, id=2, price=20, totalBalance=60, remark=白菜20)\"', '192.168.3.2', '2021-02-08 22:27:15', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1107, 'MrBird', '修改SaleRecord', 13, 'cc.mrbird.febs.gen.controller.SaleRecordController.updateSaleRecord()', ' saleRecord: \"SaleRecord(amount=1, categoryId=null, categoryName=白菜, collectionDate=null, createTime=Mon Feb 08 22:27:33 CST 2021, creatorId=1, creatorName=null, id=3, price=20, totalBalance=20, remark=白菜20)\"', '192.168.3.2', '2021-02-08 22:27:34', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1108, 'MrBird', '新增Category', 18, 'cc.mrbird.febs.gen.controller.CategoryController.addCategory()', ' category: \"Category(createTime=Tue Feb 09 08:43:06 CST 2021, creatorId=1, creatorName=MrBird, id=4, modifierId=null, modifierName=null, modifyTime=null, name=土豆, price=2, categoryCode=0000002)\"', '192.168.3.2', '2021-02-09 08:43:07', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1109, 'MrBird', '修改Category', 15, 'cc.mrbird.febs.gen.controller.CategoryController.updateCategory()', ' category: \"Category(createTime=null, creatorId=null, creatorName=null, id=4, modifierId=null, modifierName=null, modifyTime=null, name=土豆, price=2, categoryCode=000001)\"', '192.168.3.2', '2021-02-09 08:43:19', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1110, 'MrBird', '新增Category', 13, 'cc.mrbird.febs.gen.controller.CategoryController.addCategory()', ' category: \"Category(createTime=Tue Feb 09 08:43:30 CST 2021, creatorId=1, creatorName=MrBird, id=5, modifierId=null, modifierName=null, modifyTime=null, name=2, price=3, categoryCode=4)\"', '192.168.3.2', '2021-02-09 08:43:30', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1111, 'MrBird', '删除Category', 17, 'cc.mrbird.febs.gen.controller.CategoryController.deleteCategory()', ' category: \"Category(createTime=null, creatorId=null, creatorName=null, id=5, modifierId=null, modifierName=null, modifyTime=null, name=null, price=null, categoryCode=null)\"', '192.168.3.2', '2021-02-09 08:43:36', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1112, 'MrBird', '新增SaleRecord', 16, 'cc.mrbird.febs.gen.controller.SaleRecordController.addSaleRecord()', ' saleRecord: \"SaleRecord(amount=2, categoryId=4, categoryName=土豆, collectionDate=Tue Feb 09 08:43:55 CST 2021, createTime=Tue Feb 09 08:43:55 CST 2021, creatorId=1, creatorName=MrBird, id=5, price=2, totalBalance=4, remark=23)\"', '192.168.3.2', '2021-02-09 08:43:56', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1113, 'MrBird', '新增SaleRecord', 15, 'cc.mrbird.febs.gen.controller.SaleRecordController.addSaleRecord()', ' saleRecord: \"SaleRecord(amount=3, categoryId=4, categoryName=土豆, collectionDate=Tue Feb 09 08:44:05 CST 2021, createTime=Tue Feb 09 08:44:05 CST 2021, creatorId=1, creatorName=MrBird, id=6, price=2, totalBalance=6, remark=4)\"', '192.168.3.2', '2021-02-09 08:44:05', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1114, 'MrBird', '新增菜单/按钮', 15, 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=190, parentId=179, menuName=销售统计, url=null, perms=saleRecord:total:list, icon=null, type=1, orderNum=null, createTime=Tue Feb 09 09:25:52 CST 2021, modifyTime=null)\"', '192.168.3.2', '2021-02-09 09:25:53', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1115, 'MrBird', '删除菜单/按钮', 82, 'cc.mrbird.febs.system.controller.MenuController.deleteMenus()', ' menuIds: \"190\"', '192.168.3.2', '2021-02-09 09:31:01', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1116, 'MrBird', '新增菜单/按钮', 15, 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=191, parentId=179, menuName=销售统计, url=saleRecord/saleRecordTotal, perms=saleRecord:total:view, icon=layui-icon-border-outer, type=0, orderNum=3, createTime=Tue Feb 09 09:33:23 CST 2021, modifyTime=null)\"', '192.168.3.2', '2021-02-09 09:33:24', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1117, 'MrBird', '新增菜单/按钮', 10, 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=192, parentId=191, menuName=查询消费类型, url=null, perms=, icon=null, type=1, orderNum=null, createTime=Tue Feb 09 09:34:17 CST 2021, modifyTime=null)\"', '192.168.3.2', '2021-02-09 09:34:18', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1118, 'MrBird', '修改角色', 58, 'cc.mrbird.febs.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=1, roleName=系统管理员, remark=系统管理员，拥有所有操作权限 ^_^, createTime=null, modifyTime=Tue Feb 09 09:39:32 CST 2021, menuIds=1,3,13,161,11,12,160,4,162,14,15,16,5,163,17,18,19,6,164,20,21,22,2,8,23,10,24,170,136,171,172,127,128,129,131,175,101,102,103,104,105,106,107,108,173,109,110,174,137,138,165,139,166,115,132,133,135,134,126,159,116,117,119,120,121,122,123,118,125,167,168,169,178,179,180,182,183,184,185,181,186,187,188,189,191)\"', '192.168.3.2', '2021-02-09 09:39:32', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1119, 'MrBird', '修改菜单/按钮', 18, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=191, parentId=179, menuName=销售统计, url=saleRecord/saleRecordTotal, perms=saleRecord:total:list, icon=layui-icon-border-outer, type=0, orderNum=3, createTime=null, modifyTime=Tue Feb 09 09:46:23 CST 2021)\"', '192.168.3.2', '2021-02-09 09:46:24', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1120, 'MrBird', '修改菜单/按钮', 51, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=191, parentId=179, menuName=销售统计, url=/saleRecordTotal, perms=saleRecord:total:list, icon=layui-icon-border-outer, type=0, orderNum=3, createTime=null, modifyTime=Tue Feb 09 10:12:54 CST 2021)\"', '192.168.3.2', '2021-02-09 10:12:54', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1121, 'MrBird', '新增角色', 31, 'cc.mrbird.febs.system.controller.RoleController.addRole()', ' role: \"Role(roleId=81, roleName=用户账号, remark=, createTime=Tue Feb 09 10:46:42 CST 2021, modifyTime=null, menuIds=179,180,182,183,184,185,181,186,187,188,189,191,192)\"', '192.168.3.2', '2021-02-09 10:46:42', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1122, 'MrBird', '新增用户', 26, 'cc.mrbird.febs.system.controller.UserController.addUser()', ' user: \"User(userId=8, username=Angelo, password=0779669e29aeda988942b57e842d6310, deptId=6, email=, mobile=, status=1, createTime=Tue Feb 09 10:50:28 CST 2021, modifyTime=null, lastLoginTime=null, sex=2, avatar=default.jpg, theme=black, isTab=1, description=, deptName=null, createTimeFrom=null, createTimeTo=null, roleId=81, roleName=null, deptIds=, stringPermissions=null, roles=null)\"', '192.168.3.2', '2021-02-09 10:50:28', '内网IP|0|0|内网IP|内网IP');

-- ----------------------------
-- Table structure for t_login_log
-- ----------------------------
DROP TABLE IF EXISTS `t_login_log`;
CREATE TABLE `t_login_log`  (
  `ID` bigint(0) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `USERNAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `LOGIN_TIME` datetime(0) NOT NULL COMMENT '登录时间',
  `LOCATION` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录地点',
  `IP` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'IP地址',
  `SYSTEM` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作系统',
  `BROWSER` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '浏览器',
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `t_login_log_login_time`(`LOGIN_TIME`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 87 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '登录日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_login_log
-- ----------------------------
INSERT INTO `t_login_log` VALUES (70, 'mrbird', '2021-02-05 09:35:12', '内网IP|0|0|内网IP|内网IP', '192.168.3.2', 'Windows ', 'Chrome 86');
INSERT INTO `t_login_log` VALUES (71, 'mrbird', '2021-02-05 14:55:51', '内网IP|0|0|内网IP|内网IP', '192.168.3.2', 'Windows ', 'Chrome 86');
INSERT INTO `t_login_log` VALUES (72, 'mrbird', '2021-02-05 15:25:42', '内网IP|0|0|内网IP|内网IP', '192.168.3.2', 'Windows ', 'Chrome 86');
INSERT INTO `t_login_log` VALUES (73, 'mrbird', '2021-02-07 08:54:44', '内网IP|0|0|内网IP|内网IP', '192.168.3.2', 'Windows ', 'Chrome 86');
INSERT INTO `t_login_log` VALUES (74, 'mrbird', '2021-02-07 09:21:44', '内网IP|0|0|内网IP|内网IP', '192.168.3.2', 'Windows ', 'Chrome 86');
INSERT INTO `t_login_log` VALUES (75, 'mrbird', '2021-02-07 11:55:17', '内网IP|0|0|内网IP|内网IP', '192.168.3.2', 'Windows ', 'Chrome 86');
INSERT INTO `t_login_log` VALUES (76, 'mrbird', '2021-02-07 22:31:34', '内网IP|0|0|内网IP|内网IP', '192.168.3.2', 'Windows ', 'Chrome 86');
INSERT INTO `t_login_log` VALUES (77, 'mrbird', '2021-02-08 08:49:27', '内网IP|0|0|内网IP|内网IP', '192.168.3.2', 'Windows ', 'Chrome 86');
INSERT INTO `t_login_log` VALUES (78, 'mrbird', '2021-02-08 21:27:20', '内网IP|0|0|内网IP|内网IP', '192.168.3.2', 'Windows ', 'Chrome 86');
INSERT INTO `t_login_log` VALUES (79, 'mrbird', '2021-02-09 08:42:48', '内网IP|0|0|内网IP|内网IP', '192.168.3.2', 'Windows ', 'Chrome 86');
INSERT INTO `t_login_log` VALUES (80, 'Angelo', '2021-02-09 10:59:26', '内网IP|0|0|内网IP|内网IP', '192.168.3.2', 'Windows ', 'Chrome 86');
INSERT INTO `t_login_log` VALUES (81, 'mrbird', '2021-02-09 11:01:50', '内网IP|0|0|内网IP|内网IP', '192.168.3.2', 'Windows ', 'Chrome 86');
INSERT INTO `t_login_log` VALUES (82, 'Angelo', '2021-02-09 11:03:06', '内网IP|0|0|内网IP|内网IP', '192.168.3.2', 'Windows ', 'Chrome 86');
INSERT INTO `t_login_log` VALUES (83, 'Angelo', '2021-02-09 11:03:46', '内网IP|0|0|内网IP|内网IP', '192.168.3.2', 'Windows ', 'Chrome 86');
INSERT INTO `t_login_log` VALUES (84, 'Angelo', '2021-02-09 11:06:26', '内网IP|0|0|内网IP|内网IP', '192.168.3.2', 'Windows ', 'Chrome 86');
INSERT INTO `t_login_log` VALUES (85, 'mrbird', '2021-02-14 17:36:23', '内网IP|0|0|内网IP|内网IP', '192.168.3.2', 'Windows ', 'Chrome 86');
INSERT INTO `t_login_log` VALUES (86, 'Angelo', '2021-02-14 17:40:15', '内网IP|0|0|内网IP|内网IP', '192.168.3.2', 'Windows ', 'Chrome 86');

-- ----------------------------
-- Table structure for t_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_menu`;
CREATE TABLE `t_menu`  (
  `MENU_ID` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '菜单/按钮ID',
  `PARENT_ID` bigint(0) NOT NULL COMMENT '上级菜单ID',
  `MENU_NAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单/按钮名称',
  `URL` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单URL',
  `PERMS` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '权限标识',
  `ICON` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标',
  `TYPE` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类型 0菜单 1按钮',
  `ORDER_NUM` bigint(0) NULL DEFAULT NULL COMMENT '排序',
  `CREATE_TIME` datetime(0) NOT NULL COMMENT '创建时间',
  `MODIFY_TIME` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`MENU_ID`) USING BTREE,
  INDEX `t_menu_parent_id`(`PARENT_ID`) USING BTREE,
  INDEX `t_menu_menu_id`(`MENU_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 192 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_menu
-- ----------------------------
INSERT INTO `t_menu` VALUES (1, 0, '系统管理', '', '', 'layui-icon-setting', '0', 1, '2017-12-27 16:39:07', '2021-02-05 10:13:04');
INSERT INTO `t_menu` VALUES (2, 0, '系统监控', '', '', 'layui-icon-alert', '0', 2, '2017-12-27 16:45:51', '2019-06-13 11:20:40');
INSERT INTO `t_menu` VALUES (3, 1, '用户管理', '/system/user', 'user:view', '', '0', 1, '2017-12-27 16:47:13', '2019-12-04 16:46:50');
INSERT INTO `t_menu` VALUES (4, 1, '角色管理', '/system/role', 'role:view', '', '0', 2, '2017-12-27 16:48:09', '2019-06-13 08:57:19');
INSERT INTO `t_menu` VALUES (5, 1, '菜单管理', '/system/menu', 'menu:view', '', '0', 3, '2017-12-27 16:48:57', '2019-06-13 08:57:34');
INSERT INTO `t_menu` VALUES (6, 1, '部门管理', '/system/dept', 'dept:view', '', '0', 4, '2017-12-27 16:57:33', '2019-06-14 19:56:00');
INSERT INTO `t_menu` VALUES (8, 2, '在线用户', '/monitor/online', 'online:view', '', '0', 1, '2017-12-27 16:59:33', '2019-06-13 14:30:31');
INSERT INTO `t_menu` VALUES (10, 2, '系统日志', '/monitor/log', 'log:view', '', '0', 2, '2017-12-27 17:00:50', '2019-06-13 14:30:37');
INSERT INTO `t_menu` VALUES (11, 3, '新增用户', NULL, 'user:add', NULL, '1', NULL, '2017-12-27 17:02:58', NULL);
INSERT INTO `t_menu` VALUES (12, 3, '修改用户', NULL, 'user:update', NULL, '1', NULL, '2017-12-27 17:04:07', NULL);
INSERT INTO `t_menu` VALUES (13, 3, '删除用户', NULL, 'user:delete', NULL, '1', NULL, '2017-12-27 17:04:58', NULL);
INSERT INTO `t_menu` VALUES (14, 4, '新增角色', NULL, 'role:add', NULL, '1', NULL, '2017-12-27 17:06:38', NULL);
INSERT INTO `t_menu` VALUES (15, 4, '修改角色', NULL, 'role:update', NULL, '1', NULL, '2017-12-27 17:06:38', NULL);
INSERT INTO `t_menu` VALUES (16, 4, '删除角色', NULL, 'role:delete', NULL, '1', NULL, '2017-12-27 17:06:38', NULL);
INSERT INTO `t_menu` VALUES (17, 5, '新增菜单', NULL, 'menu:add', NULL, '1', NULL, '2017-12-27 17:08:02', NULL);
INSERT INTO `t_menu` VALUES (18, 5, '修改菜单', NULL, 'menu:update', NULL, '1', NULL, '2017-12-27 17:08:02', NULL);
INSERT INTO `t_menu` VALUES (19, 5, '删除菜单', NULL, 'menu:delete', NULL, '1', NULL, '2017-12-27 17:08:02', NULL);
INSERT INTO `t_menu` VALUES (20, 6, '新增部门', NULL, 'dept:add', NULL, '1', NULL, '2017-12-27 17:09:24', NULL);
INSERT INTO `t_menu` VALUES (21, 6, '修改部门', NULL, 'dept:update', NULL, '1', NULL, '2017-12-27 17:09:24', NULL);
INSERT INTO `t_menu` VALUES (22, 6, '删除部门', NULL, 'dept:delete', NULL, '1', NULL, '2017-12-27 17:09:24', NULL);
INSERT INTO `t_menu` VALUES (23, 8, '踢出用户', NULL, 'user:kickout', NULL, '1', NULL, '2017-12-27 17:11:13', NULL);
INSERT INTO `t_menu` VALUES (24, 10, '删除日志', NULL, 'log:delete', NULL, '1', NULL, '2017-12-27 17:11:45', '2019-06-06 05:56:40');
INSERT INTO `t_menu` VALUES (101, 0, '任务调度', NULL, NULL, 'layui-icon-time-circle', '0', 3, '2018-02-24 15:52:57', NULL);
INSERT INTO `t_menu` VALUES (102, 101, '定时任务', '/job/job', 'job:view', '', '0', 1, '2018-02-24 15:53:53', '2018-04-25 09:05:12');
INSERT INTO `t_menu` VALUES (103, 102, '新增任务', NULL, 'job:add', NULL, '1', NULL, '2018-02-24 15:55:10', NULL);
INSERT INTO `t_menu` VALUES (104, 102, '修改任务', NULL, 'job:update', NULL, '1', NULL, '2018-02-24 15:55:53', NULL);
INSERT INTO `t_menu` VALUES (105, 102, '删除任务', NULL, 'job:delete', NULL, '1', NULL, '2018-02-24 15:56:18', NULL);
INSERT INTO `t_menu` VALUES (106, 102, '暂停任务', NULL, 'job:pause', NULL, '1', NULL, '2018-02-24 15:57:08', NULL);
INSERT INTO `t_menu` VALUES (107, 102, '恢复任务', NULL, 'job:resume', NULL, '1', NULL, '2018-02-24 15:58:21', NULL);
INSERT INTO `t_menu` VALUES (108, 102, '立即执行任务', NULL, 'job:run', NULL, '1', NULL, '2018-02-24 15:59:45', NULL);
INSERT INTO `t_menu` VALUES (109, 101, '调度日志', '/job/log', 'job:log:view', '', '0', 2, '2018-02-24 16:00:45', '2019-06-09 02:48:19');
INSERT INTO `t_menu` VALUES (110, 109, '删除日志', NULL, 'job:log:delete', NULL, '1', NULL, '2018-02-24 16:01:21', NULL);
INSERT INTO `t_menu` VALUES (115, 0, '其他模块', NULL, NULL, 'layui-icon-gift', '0', 5, '2019-05-27 10:18:07', NULL);
INSERT INTO `t_menu` VALUES (116, 115, 'Apex图表', '', '', NULL, '0', 2, '2019-05-27 10:21:35', NULL);
INSERT INTO `t_menu` VALUES (117, 116, '线性图表', '/others/apex/line', 'apex:line:view', NULL, '0', 1, '2019-05-27 10:24:49', NULL);
INSERT INTO `t_menu` VALUES (118, 115, '高德地图', '/others/map', 'map:view', '', '0', 3, '2019-05-27 17:13:12', '2019-06-12 15:33:00');
INSERT INTO `t_menu` VALUES (119, 116, '面积图表', '/others/apex/area', 'apex:area:view', NULL, '0', 2, '2019-05-27 18:49:22', NULL);
INSERT INTO `t_menu` VALUES (120, 116, '柱形图表', '/others/apex/column', 'apex:column:view', NULL, '0', 3, '2019-05-27 18:51:33', NULL);
INSERT INTO `t_menu` VALUES (121, 116, '雷达图表', '/others/apex/radar', 'apex:radar:view', NULL, '0', 4, '2019-05-27 18:56:05', NULL);
INSERT INTO `t_menu` VALUES (122, 116, '条形图表', '/others/apex/bar', 'apex:bar:view', NULL, '0', 5, '2019-05-27 18:57:02', NULL);
INSERT INTO `t_menu` VALUES (123, 116, '混合图表', '/others/apex/mix', 'apex:mix:view', '', '0', 6, '2019-05-27 18:58:04', '2019-06-06 02:55:23');
INSERT INTO `t_menu` VALUES (125, 115, '导入导出', '/others/eximport', 'others:eximport:view', '', '0', 4, '2019-05-27 19:01:57', '2019-06-13 01:20:14');
INSERT INTO `t_menu` VALUES (126, 132, '系统图标', '/others/febs/icon', 'febs:icons:view', '', '0', 4, '2019-05-27 19:03:18', '2019-06-06 03:05:26');
INSERT INTO `t_menu` VALUES (127, 2, '请求追踪', '/monitor/httptrace', 'httptrace:view', '', '0', 6, '2019-05-27 19:06:38', '2019-06-13 14:36:43');
INSERT INTO `t_menu` VALUES (128, 2, '系统信息', NULL, NULL, NULL, '0', 7, '2019-05-27 19:08:23', NULL);
INSERT INTO `t_menu` VALUES (129, 128, 'JVM信息', '/monitor/jvm', 'jvm:view', '', '0', 1, '2019-05-27 19:08:50', '2019-06-13 14:36:51');
INSERT INTO `t_menu` VALUES (131, 128, '服务器信息', '/monitor/server', 'server:view', '', '0', 3, '2019-05-27 19:10:07', '2019-06-13 14:37:04');
INSERT INTO `t_menu` VALUES (132, 115, 'FEBS组件', '', '', NULL, '0', 1, '2019-05-27 19:13:54', NULL);
INSERT INTO `t_menu` VALUES (133, 132, '表单组件', '/others/febs/form', 'febs:form:view', NULL, '0', 1, '2019-05-27 19:14:45', NULL);
INSERT INTO `t_menu` VALUES (134, 132, 'FEBS工具', '/others/febs/tools', 'febs:tools:view', '', '0', 3, '2019-05-29 10:11:22', '2019-06-12 13:21:27');
INSERT INTO `t_menu` VALUES (135, 132, '表单组合', '/others/febs/form/group', 'febs:formgroup:view', NULL, '0', 2, '2019-05-29 10:16:19', NULL);
INSERT INTO `t_menu` VALUES (136, 2, '登录日志', '/monitor/loginlog', 'loginlog:view', '', '0', 3, '2019-05-29 15:56:15', '2019-06-13 14:35:56');
INSERT INTO `t_menu` VALUES (137, 0, '代码生成', '', NULL, 'layui-icon-verticalright', '0', 4, '2019-06-03 15:35:58', NULL);
INSERT INTO `t_menu` VALUES (138, 137, '生成配置', '/generator/configure', 'generator:configure:view', NULL, '0', 1, '2019-06-03 15:38:36', NULL);
INSERT INTO `t_menu` VALUES (139, 137, '代码生成', '/generator/generator', 'generator:view', '', '0', 2, '2019-06-03 15:39:15', '2019-06-13 14:31:38');
INSERT INTO `t_menu` VALUES (159, 132, '其他组件', '/others/febs/others', 'others:febs:others', '', '0', 5, '2019-06-12 07:51:08', '2019-06-12 07:51:40');
INSERT INTO `t_menu` VALUES (160, 3, '密码重置', NULL, 'user:password:reset', NULL, '1', NULL, '2019-06-13 08:40:13', NULL);
INSERT INTO `t_menu` VALUES (161, 3, '导出Excel', NULL, 'user:export', NULL, '1', NULL, '2019-06-13 08:40:34', NULL);
INSERT INTO `t_menu` VALUES (162, 4, '导出Excel', NULL, 'role:export', NULL, '1', NULL, '2019-06-13 14:29:00', '2019-06-13 14:29:11');
INSERT INTO `t_menu` VALUES (163, 5, '导出Excel', NULL, 'menu:export', NULL, '1', NULL, '2019-06-13 14:29:32', NULL);
INSERT INTO `t_menu` VALUES (164, 6, '导出Excel', NULL, 'dept:export', NULL, '1', NULL, '2019-06-13 14:29:59', NULL);
INSERT INTO `t_menu` VALUES (165, 138, '修改配置', NULL, 'generator:configure:update', NULL, '1', NULL, '2019-06-13 14:32:09', '2019-06-13 14:32:20');
INSERT INTO `t_menu` VALUES (166, 139, '生成代码', NULL, 'generator:generate', NULL, '1', NULL, '2019-06-13 14:32:51', NULL);
INSERT INTO `t_menu` VALUES (167, 125, '模板下载', NULL, 'eximport:template', NULL, '1', NULL, '2019-06-13 14:33:37', NULL);
INSERT INTO `t_menu` VALUES (168, 125, '导出Excel', NULL, 'eximport:export', NULL, '1', NULL, '2019-06-13 14:33:57', NULL);
INSERT INTO `t_menu` VALUES (169, 125, '导入Excel', NULL, 'eximport:import', NULL, '1', NULL, '2019-06-13 14:34:19', NULL);
INSERT INTO `t_menu` VALUES (170, 10, '导出Excel', NULL, 'log:export', NULL, '1', NULL, '2019-06-13 14:34:55', NULL);
INSERT INTO `t_menu` VALUES (171, 136, '删除日志', NULL, 'loginlog:delete', NULL, '1', NULL, '2019-06-13 14:35:27', '2019-06-13 14:36:08');
INSERT INTO `t_menu` VALUES (172, 136, '导出Excel', NULL, 'loginlog:export', NULL, '1', NULL, '2019-06-13 14:36:26', NULL);
INSERT INTO `t_menu` VALUES (173, 102, '导出Excel', NULL, 'job:export', NULL, '1', NULL, '2019-06-13 14:37:25', NULL);
INSERT INTO `t_menu` VALUES (174, 109, '导出Excel', NULL, 'job:log:export', NULL, '1', NULL, '2019-06-13 14:37:46', '2019-06-13 14:38:02');
INSERT INTO `t_menu` VALUES (175, 2, 'Swagger文档', '/monitor/swagger', 'swagger:view', '', '0', 8, '2019-08-18 17:25:36', '2019-08-18 17:25:59');
INSERT INTO `t_menu` VALUES (178, 115, '数据权限', '/others/datapermission', 'others:datapermission', '', '0', 5, '2020-04-29 09:34:25', NULL);
INSERT INTO `t_menu` VALUES (179, 0, '商品管理', '', '', 'layui-icon-trophy', '0', 6, '2021-02-05 10:12:40', '2021-02-05 10:13:55');
INSERT INTO `t_menu` VALUES (180, 179, '销售记录', '/saleRecord', 'saleRecord:list', 'layui-icon-check-circle', '0', 1, '2021-02-05 10:15:05', '2021-02-07 09:29:30');
INSERT INTO `t_menu` VALUES (181, 179, '商品类型', '/category', 'category:list', 'layui-icon-Dollar', '0', 2, '2021-02-05 14:57:40', '2021-02-07 09:29:36');
INSERT INTO `t_menu` VALUES (182, 180, '新增销售', NULL, 'saleRecord:add', NULL, '1', NULL, '2021-02-05 15:59:36', '2021-02-05 16:00:26');
INSERT INTO `t_menu` VALUES (183, 180, '删除记录', NULL, 'saleRecord:delete', NULL, '1', NULL, '2021-02-05 16:01:01', NULL);
INSERT INTO `t_menu` VALUES (184, 180, '导出Excel', NULL, 'saleRecord:export', NULL, '1', NULL, '2021-02-05 16:01:48', NULL);
INSERT INTO `t_menu` VALUES (185, 180, '修改销售记录', NULL, 'saleRecord:update', NULL, '1', NULL, '2021-02-05 16:02:22', NULL);
INSERT INTO `t_menu` VALUES (186, 181, '添加商品类型', NULL, 'category:add', NULL, '1', NULL, '2021-02-06 18:45:01', NULL);
INSERT INTO `t_menu` VALUES (187, 181, '删除商品类型', NULL, 'category:delete', NULL, '1', NULL, '2021-02-07 08:56:58', '2021-02-07 08:57:54');
INSERT INTO `t_menu` VALUES (188, 181, '导出商品类型', NULL, 'category:export', NULL, '1', NULL, '2021-02-07 08:57:20', NULL);
INSERT INTO `t_menu` VALUES (189, 181, '修改商品类型', NULL, 'category:update', NULL, '1', NULL, '2021-02-07 10:33:23', NULL);
INSERT INTO `t_menu` VALUES (191, 179, '销售统计', '/saleRecordTotal', 'saleRecord:total:list', 'layui-icon-border-outer', '0', 3, '2021-02-09 09:33:24', '2021-02-09 10:12:54');
INSERT INTO `t_menu` VALUES (192, 191, '查询消费类型', NULL, '', NULL, '1', NULL, '2021-02-09 09:34:18', NULL);

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role`  (
  `ROLE_ID` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `ROLE_NAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `REMARK` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色描述',
  `CREATE_TIME` datetime(0) NOT NULL COMMENT '创建时间',
  `MODIFY_TIME` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`ROLE_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 81 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES (1, '系统管理员', '系统管理员，拥有所有操作权限 ^_^', '2019-06-14 16:23:11', '2021-02-09 09:39:32');
INSERT INTO `t_role` VALUES (2, '注册账户', '注册账户，拥有查看，新增权限（新增用户除外）和导出Excel权限', '2019-06-14 16:00:15', '2019-08-18 17:36:02');
INSERT INTO `t_role` VALUES (77, 'Redis监控员', '负责Redis模块', '2019-06-14 20:49:22', NULL);
INSERT INTO `t_role` VALUES (78, '系统监控员', '负责整个系统监控模块', '2019-06-14 20:50:07', NULL);
INSERT INTO `t_role` VALUES (79, '跑批人员', '负责任务调度跑批模块', '2019-06-14 20:51:02', NULL);
INSERT INTO `t_role` VALUES (80, '开发人员', '拥有代码生成模块的权限', '2019-06-14 20:51:26', NULL);
INSERT INTO `t_role` VALUES (81, '用户账号', '', '2021-02-09 10:46:42', NULL);

-- ----------------------------
-- Table structure for t_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_role_menu`;
CREATE TABLE `t_role_menu`  (
  `ROLE_ID` bigint(0) NOT NULL COMMENT '角色ID',
  `MENU_ID` bigint(0) NOT NULL COMMENT '菜单/按钮ID',
  INDEX `t_role_menu_menu_id`(`MENU_ID`) USING BTREE,
  INDEX `t_role_menu_role_id`(`ROLE_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_role_menu
-- ----------------------------
INSERT INTO `t_role_menu` VALUES (77, 2);
INSERT INTO `t_role_menu` VALUES (78, 2);
INSERT INTO `t_role_menu` VALUES (78, 8);
INSERT INTO `t_role_menu` VALUES (78, 23);
INSERT INTO `t_role_menu` VALUES (78, 10);
INSERT INTO `t_role_menu` VALUES (78, 24);
INSERT INTO `t_role_menu` VALUES (78, 170);
INSERT INTO `t_role_menu` VALUES (78, 136);
INSERT INTO `t_role_menu` VALUES (78, 171);
INSERT INTO `t_role_menu` VALUES (78, 172);
INSERT INTO `t_role_menu` VALUES (78, 127);
INSERT INTO `t_role_menu` VALUES (78, 128);
INSERT INTO `t_role_menu` VALUES (78, 129);
INSERT INTO `t_role_menu` VALUES (78, 131);
INSERT INTO `t_role_menu` VALUES (79, 101);
INSERT INTO `t_role_menu` VALUES (79, 102);
INSERT INTO `t_role_menu` VALUES (79, 103);
INSERT INTO `t_role_menu` VALUES (79, 104);
INSERT INTO `t_role_menu` VALUES (79, 105);
INSERT INTO `t_role_menu` VALUES (79, 106);
INSERT INTO `t_role_menu` VALUES (79, 107);
INSERT INTO `t_role_menu` VALUES (79, 108);
INSERT INTO `t_role_menu` VALUES (79, 173);
INSERT INTO `t_role_menu` VALUES (79, 109);
INSERT INTO `t_role_menu` VALUES (79, 110);
INSERT INTO `t_role_menu` VALUES (79, 174);
INSERT INTO `t_role_menu` VALUES (80, 137);
INSERT INTO `t_role_menu` VALUES (80, 138);
INSERT INTO `t_role_menu` VALUES (80, 165);
INSERT INTO `t_role_menu` VALUES (80, 139);
INSERT INTO `t_role_menu` VALUES (80, 166);
INSERT INTO `t_role_menu` VALUES (2, 1);
INSERT INTO `t_role_menu` VALUES (2, 3);
INSERT INTO `t_role_menu` VALUES (2, 161);
INSERT INTO `t_role_menu` VALUES (2, 4);
INSERT INTO `t_role_menu` VALUES (2, 14);
INSERT INTO `t_role_menu` VALUES (2, 162);
INSERT INTO `t_role_menu` VALUES (2, 5);
INSERT INTO `t_role_menu` VALUES (2, 17);
INSERT INTO `t_role_menu` VALUES (2, 163);
INSERT INTO `t_role_menu` VALUES (2, 6);
INSERT INTO `t_role_menu` VALUES (2, 20);
INSERT INTO `t_role_menu` VALUES (2, 164);
INSERT INTO `t_role_menu` VALUES (2, 2);
INSERT INTO `t_role_menu` VALUES (2, 8);
INSERT INTO `t_role_menu` VALUES (2, 10);
INSERT INTO `t_role_menu` VALUES (2, 170);
INSERT INTO `t_role_menu` VALUES (2, 136);
INSERT INTO `t_role_menu` VALUES (2, 172);
INSERT INTO `t_role_menu` VALUES (2, 127);
INSERT INTO `t_role_menu` VALUES (2, 128);
INSERT INTO `t_role_menu` VALUES (2, 129);
INSERT INTO `t_role_menu` VALUES (2, 131);
INSERT INTO `t_role_menu` VALUES (2, 175);
INSERT INTO `t_role_menu` VALUES (2, 101);
INSERT INTO `t_role_menu` VALUES (2, 102);
INSERT INTO `t_role_menu` VALUES (2, 173);
INSERT INTO `t_role_menu` VALUES (2, 109);
INSERT INTO `t_role_menu` VALUES (2, 174);
INSERT INTO `t_role_menu` VALUES (2, 137);
INSERT INTO `t_role_menu` VALUES (2, 138);
INSERT INTO `t_role_menu` VALUES (2, 139);
INSERT INTO `t_role_menu` VALUES (2, 115);
INSERT INTO `t_role_menu` VALUES (2, 132);
INSERT INTO `t_role_menu` VALUES (2, 133);
INSERT INTO `t_role_menu` VALUES (2, 135);
INSERT INTO `t_role_menu` VALUES (2, 134);
INSERT INTO `t_role_menu` VALUES (2, 126);
INSERT INTO `t_role_menu` VALUES (2, 159);
INSERT INTO `t_role_menu` VALUES (2, 116);
INSERT INTO `t_role_menu` VALUES (2, 117);
INSERT INTO `t_role_menu` VALUES (2, 119);
INSERT INTO `t_role_menu` VALUES (2, 120);
INSERT INTO `t_role_menu` VALUES (2, 121);
INSERT INTO `t_role_menu` VALUES (2, 122);
INSERT INTO `t_role_menu` VALUES (2, 123);
INSERT INTO `t_role_menu` VALUES (2, 118);
INSERT INTO `t_role_menu` VALUES (2, 125);
INSERT INTO `t_role_menu` VALUES (2, 167);
INSERT INTO `t_role_menu` VALUES (2, 168);
INSERT INTO `t_role_menu` VALUES (2, 169);
INSERT INTO `t_role_menu` VALUES (2, 178);
INSERT INTO `t_role_menu` VALUES (1, 1);
INSERT INTO `t_role_menu` VALUES (1, 3);
INSERT INTO `t_role_menu` VALUES (1, 13);
INSERT INTO `t_role_menu` VALUES (1, 161);
INSERT INTO `t_role_menu` VALUES (1, 11);
INSERT INTO `t_role_menu` VALUES (1, 12);
INSERT INTO `t_role_menu` VALUES (1, 160);
INSERT INTO `t_role_menu` VALUES (1, 4);
INSERT INTO `t_role_menu` VALUES (1, 162);
INSERT INTO `t_role_menu` VALUES (1, 14);
INSERT INTO `t_role_menu` VALUES (1, 15);
INSERT INTO `t_role_menu` VALUES (1, 16);
INSERT INTO `t_role_menu` VALUES (1, 5);
INSERT INTO `t_role_menu` VALUES (1, 163);
INSERT INTO `t_role_menu` VALUES (1, 17);
INSERT INTO `t_role_menu` VALUES (1, 18);
INSERT INTO `t_role_menu` VALUES (1, 19);
INSERT INTO `t_role_menu` VALUES (1, 6);
INSERT INTO `t_role_menu` VALUES (1, 164);
INSERT INTO `t_role_menu` VALUES (1, 20);
INSERT INTO `t_role_menu` VALUES (1, 21);
INSERT INTO `t_role_menu` VALUES (1, 22);
INSERT INTO `t_role_menu` VALUES (1, 2);
INSERT INTO `t_role_menu` VALUES (1, 8);
INSERT INTO `t_role_menu` VALUES (1, 23);
INSERT INTO `t_role_menu` VALUES (1, 10);
INSERT INTO `t_role_menu` VALUES (1, 24);
INSERT INTO `t_role_menu` VALUES (1, 170);
INSERT INTO `t_role_menu` VALUES (1, 136);
INSERT INTO `t_role_menu` VALUES (1, 171);
INSERT INTO `t_role_menu` VALUES (1, 172);
INSERT INTO `t_role_menu` VALUES (1, 127);
INSERT INTO `t_role_menu` VALUES (1, 128);
INSERT INTO `t_role_menu` VALUES (1, 129);
INSERT INTO `t_role_menu` VALUES (1, 131);
INSERT INTO `t_role_menu` VALUES (1, 175);
INSERT INTO `t_role_menu` VALUES (1, 101);
INSERT INTO `t_role_menu` VALUES (1, 102);
INSERT INTO `t_role_menu` VALUES (1, 103);
INSERT INTO `t_role_menu` VALUES (1, 104);
INSERT INTO `t_role_menu` VALUES (1, 105);
INSERT INTO `t_role_menu` VALUES (1, 106);
INSERT INTO `t_role_menu` VALUES (1, 107);
INSERT INTO `t_role_menu` VALUES (1, 108);
INSERT INTO `t_role_menu` VALUES (1, 173);
INSERT INTO `t_role_menu` VALUES (1, 109);
INSERT INTO `t_role_menu` VALUES (1, 110);
INSERT INTO `t_role_menu` VALUES (1, 174);
INSERT INTO `t_role_menu` VALUES (1, 137);
INSERT INTO `t_role_menu` VALUES (1, 138);
INSERT INTO `t_role_menu` VALUES (1, 165);
INSERT INTO `t_role_menu` VALUES (1, 139);
INSERT INTO `t_role_menu` VALUES (1, 166);
INSERT INTO `t_role_menu` VALUES (1, 115);
INSERT INTO `t_role_menu` VALUES (1, 132);
INSERT INTO `t_role_menu` VALUES (1, 133);
INSERT INTO `t_role_menu` VALUES (1, 135);
INSERT INTO `t_role_menu` VALUES (1, 134);
INSERT INTO `t_role_menu` VALUES (1, 126);
INSERT INTO `t_role_menu` VALUES (1, 159);
INSERT INTO `t_role_menu` VALUES (1, 116);
INSERT INTO `t_role_menu` VALUES (1, 117);
INSERT INTO `t_role_menu` VALUES (1, 119);
INSERT INTO `t_role_menu` VALUES (1, 120);
INSERT INTO `t_role_menu` VALUES (1, 121);
INSERT INTO `t_role_menu` VALUES (1, 122);
INSERT INTO `t_role_menu` VALUES (1, 123);
INSERT INTO `t_role_menu` VALUES (1, 118);
INSERT INTO `t_role_menu` VALUES (1, 125);
INSERT INTO `t_role_menu` VALUES (1, 167);
INSERT INTO `t_role_menu` VALUES (1, 168);
INSERT INTO `t_role_menu` VALUES (1, 169);
INSERT INTO `t_role_menu` VALUES (1, 178);
INSERT INTO `t_role_menu` VALUES (1, 179);
INSERT INTO `t_role_menu` VALUES (1, 180);
INSERT INTO `t_role_menu` VALUES (1, 182);
INSERT INTO `t_role_menu` VALUES (1, 183);
INSERT INTO `t_role_menu` VALUES (1, 184);
INSERT INTO `t_role_menu` VALUES (1, 185);
INSERT INTO `t_role_menu` VALUES (1, 181);
INSERT INTO `t_role_menu` VALUES (1, 186);
INSERT INTO `t_role_menu` VALUES (1, 187);
INSERT INTO `t_role_menu` VALUES (1, 188);
INSERT INTO `t_role_menu` VALUES (1, 189);
INSERT INTO `t_role_menu` VALUES (1, 191);
INSERT INTO `t_role_menu` VALUES (81, 179);
INSERT INTO `t_role_menu` VALUES (81, 180);
INSERT INTO `t_role_menu` VALUES (81, 182);
INSERT INTO `t_role_menu` VALUES (81, 183);
INSERT INTO `t_role_menu` VALUES (81, 184);
INSERT INTO `t_role_menu` VALUES (81, 185);
INSERT INTO `t_role_menu` VALUES (81, 181);
INSERT INTO `t_role_menu` VALUES (81, 186);
INSERT INTO `t_role_menu` VALUES (81, 187);
INSERT INTO `t_role_menu` VALUES (81, 188);
INSERT INTO `t_role_menu` VALUES (81, 189);
INSERT INTO `t_role_menu` VALUES (81, 191);
INSERT INTO `t_role_menu` VALUES (81, 192);

-- ----------------------------
-- Table structure for t_sale_record
-- ----------------------------
DROP TABLE IF EXISTS `t_sale_record`;
CREATE TABLE `t_sale_record`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '数量',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '单价',
  `total_balance` decimal(10, 2) NULL DEFAULT NULL COMMENT '总价',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `creator_id` bigint(0) NULL DEFAULT NULL COMMENT '创建者ID',
  `creator_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建者名字',
  `collection_date` date NULL DEFAULT NULL COMMENT '统计日期',
  `category_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '商品名称',
  `category_id` bigint(0) NULL DEFAULT NULL COMMENT '商品ID',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_sale_record
-- ----------------------------
INSERT INTO `t_sale_record` VALUES (2, 3.00, 20.00, 60.00, '2021-02-08 22:27:15', 1, 'MrBird', '2021-02-07', '白菜', 3, '白菜20');
INSERT INTO `t_sale_record` VALUES (3, 1.00, 20.00, 20.00, '2021-02-08 22:27:34', 1, 'MrBird', '2021-02-08', '白菜', 3, '白菜20');
INSERT INTO `t_sale_record` VALUES (4, 23.00, 202.00, 4646.00, '2021-02-08 21:48:31', 1, 'MrBird', '2021-02-08', '白菜', 3, '2');
INSERT INTO `t_sale_record` VALUES (5, 2.00, 2.00, 4.00, '2021-02-09 08:43:56', 1, 'MrBird', '2021-02-09', '土豆', 4, '23');
INSERT INTO `t_sale_record` VALUES (6, 3.00, 2.00, 6.00, '2021-02-09 08:44:05', 1, 'MrBird', '2021-02-09', '土豆', 4, '4');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `USER_ID` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `USERNAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `PASSWORD` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `DEPT_ID` bigint(0) NULL DEFAULT NULL COMMENT '部门ID',
  `EMAIL` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `MOBILE` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `STATUS` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态 0锁定 1有效',
  `CREATE_TIME` datetime(0) NOT NULL COMMENT '创建时间',
  `MODIFY_TIME` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `LAST_LOGIN_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最近访问时间',
  `SSEX` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别 0男 1女 2保密',
  `IS_TAB` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否开启tab，0关闭 1开启',
  `THEME` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主题',
  `AVATAR` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `DESCRIPTION` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`USER_ID`) USING BTREE,
  INDEX `t_user_username`(`USERNAME`) USING BTREE,
  INDEX `t_user_mobile`(`MOBILE`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES (1, 'MrBird', 'cb62ad1497597283961545d608f80241', 1, 'mrbird@qq.com', '17788888888', '1', '2019-06-14 20:39:22', '2019-12-04 16:47:11', '2021-02-14 17:36:24', '0', '1', 'black', 'cnrhVkzwxjPwAaCfPbdc.png', '我是帅比作者。');
INSERT INTO `t_user` VALUES (2, 'Scott', '1d685729d113cfd03872f154939bee1c', 10, 'scott@gmail.com', '17722222222', '1', '2019-06-14 20:55:53', '2019-06-14 21:05:43', '2019-08-18 17:36:18', '0', '1', 'black', 'gaOngJwsRYRaVAuXXcmB.png', '我是scott。');
INSERT INTO `t_user` VALUES (3, 'Reina', '1461afff857c02afbfb768aa3771503d', 4, 'Reina@hotmail.com', '17711111111', '0', '2019-06-14 21:07:38', '2019-06-14 21:09:06', '2019-06-14 21:08:26', '1', '1', 'black', '5997fedcc7bd4cffbd350b40d1b5b987.jpg', '由于公款私用，已被封禁。');
INSERT INTO `t_user` VALUES (4, 'Micaela', '9f2daa2c7bed6870fcbb5b9a51d6300e', 10, 'Micaela@163.com', '17733333333', '1', '2019-06-14 21:10:13', '2019-06-14 21:11:26', '2019-06-14 21:10:37', '0', '0', 'white', '20180414165909.jpg', '我叫米克拉');
INSERT INTO `t_user` VALUES (5, 'Jana', '176679b77b3c3e352bd3b30ddc81083e', 8, 'Jana@126.com', '17744444444', '1', '2019-06-14 21:12:16', '2019-06-14 21:12:52', '2019-06-14 21:12:32', '1', '1', 'white', '20180414165821.jpg', '大家好，我叫简娜');
INSERT INTO `t_user` VALUES (6, 'Georgie', 'dffc683378cdaa015a0ee9554c532225', 3, 'Georgie@qq.com', '17766666666', '0', '2019-06-14 21:15:09', '2019-06-14 21:16:25', '2019-06-14 21:16:11', '2', '0', 'black', 'BiazfanxmamNRoxxVxka.png', '生产执行rm -rf *，账号封禁T T');
INSERT INTO `t_user` VALUES (7, 'Margot', '31379841b9f4bfde22b8b40471e9a6ce', 9, 'Margot@qq.com', '13444444444', '1', '2019-06-14 21:17:53', '2019-06-14 21:18:59', '2019-06-14 21:18:07', '1', '1', 'white', '20180414165834.jpg', '大家好我叫玛戈');
INSERT INTO `t_user` VALUES (8, 'Angelo', 'f08784871cfe7c0d6a021b0e3c86f090', 6, '', '', '1', '2021-02-09 10:50:28', '2021-02-09 11:07:03', '2021-02-14 17:40:16', '2', '0', 'white', 'default.jpg', '');

-- ----------------------------
-- Table structure for t_user_data_permission
-- ----------------------------
DROP TABLE IF EXISTS `t_user_data_permission`;
CREATE TABLE `t_user_data_permission`  (
  `USER_ID` bigint(0) NOT NULL,
  `DEPT_ID` bigint(0) NOT NULL,
  PRIMARY KEY (`USER_ID`, `DEPT_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户数据权限关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user_data_permission
-- ----------------------------
INSERT INTO `t_user_data_permission` VALUES (1, 1);
INSERT INTO `t_user_data_permission` VALUES (1, 2);
INSERT INTO `t_user_data_permission` VALUES (1, 3);
INSERT INTO `t_user_data_permission` VALUES (1, 4);
INSERT INTO `t_user_data_permission` VALUES (1, 5);
INSERT INTO `t_user_data_permission` VALUES (1, 6);
INSERT INTO `t_user_data_permission` VALUES (2, 1);
INSERT INTO `t_user_data_permission` VALUES (2, 2);
INSERT INTO `t_user_data_permission` VALUES (3, 4);
INSERT INTO `t_user_data_permission` VALUES (4, 5);

-- ----------------------------
-- Table structure for t_user_role
-- ----------------------------
DROP TABLE IF EXISTS `t_user_role`;
CREATE TABLE `t_user_role`  (
  `USER_ID` bigint(0) NOT NULL COMMENT '用户ID',
  `ROLE_ID` bigint(0) NOT NULL COMMENT '角色ID',
  INDEX `t_user_role_user_id`(`USER_ID`) USING BTREE,
  INDEX `t_user_role_role_id`(`ROLE_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user_role
-- ----------------------------
INSERT INTO `t_user_role` VALUES (1, 1);
INSERT INTO `t_user_role` VALUES (2, 2);
INSERT INTO `t_user_role` VALUES (3, 77);
INSERT INTO `t_user_role` VALUES (4, 78);
INSERT INTO `t_user_role` VALUES (5, 79);
INSERT INTO `t_user_role` VALUES (6, 80);
INSERT INTO `t_user_role` VALUES (7, 78);
INSERT INTO `t_user_role` VALUES (7, 79);
INSERT INTO `t_user_role` VALUES (7, 80);
INSERT INTO `t_user_role` VALUES (8, 81);

SET FOREIGN_KEY_CHECKS = 1;
