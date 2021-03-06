CREATE TABLE `role`
(
  `id`          BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `code`        VARCHAR(20)         NOT NULL COMMENT '唯一标识码',
  `name`        VARCHAR(100)        NOT NULL COMMENT '名称',
  `status`      bit(1)              NOT NULL DEFAULT 1 COMMENT '状态[0:未启用;1:启用]',
  `description` VARCHAR(255)        NOT NULL DEFAULT '' COMMENT '说明',
  `comment`     VARCHAR(255)        NULL COMMENT '备注',
  `create_time` datetime            NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `creator`     BIGINT(20) UNSIGNED NOT NULL DEFAULT 1 COMMENT '创建人',
  `modify_time` datetime            NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `modifier`    BIGINT(20) UNSIGNED NOT NULL DEFAULT 1 COMMENT '修改人',
  `delete_flag` bit(1)              NOT NULL DEFAULT 0 COMMENT '删除状态[0:未删除;1:已删除]',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_name` (`name`) USING BTREE,
  UNIQUE KEY `uk_code` (`code`) USING HASH,
  KEY `idx_create_time` (`create_time`) USING BTREE
) ENGINE = INNODB
  AUTO_INCREMENT = 100000 COMMENT = '角色信息';

CREATE TABLE `member`
(
  `id`                       BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username`                 VARCHAR(32)         NOT NULL COMMENT '用户名',
  `email`                    VARCHAR(50)         NOT NULL COMMENT '邮箱',
  `mobile`                   VARCHAR(20)         NOT NULL COMMENT '手机号',
  `password`                 VARCHAR(64)         NOT NULL COMMENT '密码',
  `enabled`                  bit(1)              NOT NULL DEFAULT 1 COMMENT '启用状态[0:未启用;1:启用]',
  `lock_status`              bit(1)              NOT NULL DEFAULT 0 COMMENT '锁定状态[0:未锁定;1:锁定]',
  `expired_date`             DATETIME            NOT NULL DEFAULT '9999-12-31 23:59:59' COMMENT '过期时间',
  `credentials_expired_date` DATETIME            NOT NULL DEFAULT '9999-12-31 23:59:59' COMMENT '凭证过期时间',
  `create_time`              datetime            NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `creator`                  BIGINT(20) UNSIGNED NOT NULL DEFAULT 1 COMMENT '创建人',
  `modify_time`              datetime            NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `modifier`                 BIGINT(20) UNSIGNED NOT NULL DEFAULT 1 COMMENT '修改人',
  `delete_flag`              bit(1)              NOT NULL DEFAULT 0 COMMENT '删除状态[0:未删除;1:已删除]',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_username` (`username`),
  UNIQUE KEY `uk_email` (`email`),
  UNIQUE KEY `uk_mobile` (`mobile`),
  KEY `idx_create_time` (`create_time`) USING BTREE
) ENGINE = INNODB
  AUTO_INCREMENT = 100000 COMMENT = '人员信息';

CREATE TABLE `member_detail`
(
  `id`                  BIGINT(20) UNSIGNED NOT NULL COMMENT '主键',
  `default_platform_id` BIGINT(20) UNSIGNED COMMENT '默认平台 id',
  `nick_name`           VARCHAR(64)         NOT NULL DEFAULT '' COMMENT '昵称',
  `name`                VARCHAR(20)         NOT NULL DEFAULT '' COMMENT '姓名',
  `birthday`            datetime            NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '出生日期',
  `description`         VARCHAR(255)        NOT NULL DEFAULT '' COMMENT '描述',
  `website`             VARCHAR(50)         NOT NULL DEFAULT '' COMMENT '主页',
  `avatar`              VARCHAR(255)        NOT NULL DEFAULT '' COMMENT '头像',
  `create_time`         datetime            NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `creator`             BIGINT(20) UNSIGNED NOT NULL DEFAULT 1 COMMENT '创建人',
  `modify_time`         datetime            NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `modifier`            BIGINT(20) UNSIGNED NOT NULL DEFAULT 1 COMMENT '修改人',
  `delete_flag`         bit(1)              NOT NULL DEFAULT 0 COMMENT '删除状态[0:未删除;1:已删除]',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_create_time` (`create_time`) USING BTREE
) ENGINE = INNODB COMMENT = '人员详细信息';

CREATE TABLE `member_role`
(
  `id`          BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `member_id`   BIGINT(20) UNSIGNED NOT NULL COMMENT '人员 id',
  `role_id`     BIGINT(20) UNSIGNED NOT NULL COMMENT '角色 id',
  `status`      bit(1)              NOT NULL DEFAULT 1 COMMENT '状态[0:未启用;1:启用]',
  `create_time` datetime            NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `creator`     BIGINT(20) UNSIGNED NOT NULL DEFAULT 1 COMMENT '创建人',
  `modify_time` datetime            NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `modifier`    BIGINT(20) UNSIGNED NOT NULL DEFAULT 1 COMMENT '修改人',
  `delete_flag` bit(1)              NOT NULL DEFAULT 0 COMMENT '删除状态[0:未删除;1:已删除]',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_member_role` (`member_id`, `role_id`) USING BTREE,
  KEY `idx_create_time` (`create_time`) USING BTREE
) ENGINE = INNODB
  AUTO_INCREMENT = 100000 COMMENT = '人员角色信息';


CREATE TABLE `platform`
(
  `id`              BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name`            VARCHAR(100)        NOT NULL COMMENT '名称',
  `originator`      BIGINT(20) UNSIGNED NOT NULL COMMENT '发起人',
  `originator_name` VARCHAR(20)         NOT NULL COMMENT '发起人名称',
  `status`          INTEGER(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态[0:禁用;1:审核中;2:启用]',
  `comment`         VARCHAR(255)        NULL COMMENT '备注',
  `create_time`     datetime            NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `creator`         BIGINT(20) UNSIGNED NOT NULL DEFAULT 1 COMMENT '创建人',
  `modify_time`     datetime            NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `modifier`        BIGINT(20) UNSIGNED NOT NULL DEFAULT 1 COMMENT '修改人',
  `delete_flag`     bit(1)              NOT NULL DEFAULT 0 COMMENT '删除状态[0:未删除;1:已删除]',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_name` (`name`) USING BTREE,
  KEY `idx_create_time` (`create_time`) USING BTREE
) ENGINE = INNODB
  AUTO_INCREMENT = 100000 COMMENT = '平台信息';

CREATE TABLE `platform_organization`
(
  `id`          BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `platform_id` BIGINT(20) UNSIGNED NOT NULL COMMENT '平台',
  `parent_id`   BIGINT(20) UNSIGNED NOT NULL COMMENT '父级节点',
  `name`        VARCHAR(100)        NOT NULL COMMENT '名称',
  `level`       INTEGER(4)          NOT NULL DEFAULT 1 COMMENT '层级',
  `comment`     VARCHAR(255)        NULL COMMENT '备注',
  `create_time` datetime            NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `creator`     BIGINT(20) UNSIGNED NOT NULL DEFAULT 1 COMMENT '创建人',
  `modify_time` datetime            NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `modifier`    BIGINT(20) UNSIGNED NOT NULL DEFAULT 1 COMMENT '修改人',
  `delete_flag` bit(1)              NOT NULL DEFAULT 0 COMMENT '删除状态[0:未删除;1:已删除]',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_platform_name` (`platform_id`, `name`) USING BTREE,
  KEY `idx_create_time` (`create_time`) USING BTREE
) ENGINE = INNODB
  AUTO_INCREMENT = 100000 COMMENT = '平台组织架构信息';

CREATE TABLE `platform_job`
(
  `id`          BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `platform_id` BIGINT(20) UNSIGNED NOT NULL COMMENT '平台',
  `level`       VARCHAR(100)        NOT NULL COMMENT '职级',
  `title`       VARCHAR(100)        NOT NULL COMMENT '职称',
  `comment`     VARCHAR(255)        NULL COMMENT '备注',
  `create_time` datetime            NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `creator`     BIGINT(20) UNSIGNED NOT NULL DEFAULT 1 COMMENT '创建人',
  `modify_time` datetime            NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `modifier`    BIGINT(20) UNSIGNED NOT NULL DEFAULT 1 COMMENT '修改人',
  `delete_flag` bit(1)              NOT NULL DEFAULT 0 COMMENT '删除状态[0:未删除;1:已删除]',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_platform_title` (`platform_id`, `title`) USING BTREE,
  KEY `idx_create_time` (`create_time`) USING BTREE
) ENGINE = INNODB
  AUTO_INCREMENT = 100000 COMMENT = '平台岗位信息';

CREATE TABLE `platform_member`
(
  `id`                       BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `platform_id`              BIGINT(20) UNSIGNED NOT NULL COMMENT '平台',
  `platform_organization_id` BIGINT(20) UNSIGNED NOT NULL COMMENT '平台组织架构',
  `member_id`                BIGINT(20) UNSIGNED NOT NULL COMMENT '人员',
  `name`                     VARCHAR(20)         NOT NULL DEFAULT '' COMMENT '姓名',
  `email`                    VARCHAR(50)         NOT NULL COMMENT '邮箱',
  `platform_job_id`          BIGINT(20) UNSIGNED COMMENT '平台岗位',
  `employee_number`          VARCHAR(32)         NULL COMMENT ' 工号',
  `entry_date`               datetime            NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '入职日期',
  `comment`                  VARCHAR(255)        NULL COMMENT '备注',
  `create_time`              datetime            NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `creator`                  BIGINT(20) UNSIGNED NOT NULL DEFAULT 1 COMMENT '创建人',
  `modify_time`              datetime            NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `modifier`                 BIGINT(20) UNSIGNED NOT NULL DEFAULT 1 COMMENT '修改人',
  `delete_flag`              bit(1)              NOT NULL DEFAULT 0 COMMENT '删除状态[0:未删除;1:已删除]',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_platform_member` (`platform_id`, `member_id`) USING BTREE,
  UNIQUE KEY `uk_platform_email` (`platform_id`, `email`) USING BTREE,
  KEY `idx_member_id` (`member_id`) USING BTREE,
  KEY `idx_create_time` (`create_time`) USING BTREE
) ENGINE = INNODB
  AUTO_INCREMENT = 100000 COMMENT = '平台员工信息';

CREATE TABLE `platform_member_role`
(
  `id`                 BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `platform_member_id` BIGINT(20) UNSIGNED NOT NULL COMMENT '平台员工 id',
  `role_id`            BIGINT(20) UNSIGNED NOT NULL COMMENT '角色',
  `create_time`        datetime            NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `creator`            BIGINT(20) UNSIGNED NOT NULL DEFAULT 1 COMMENT '创建人',
  `modify_time`        datetime            NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `modifier`           BIGINT(20) UNSIGNED NOT NULL DEFAULT 1 COMMENT '修改人',
  `delete_flag`        bit(1)              NOT NULL DEFAULT 0 COMMENT '删除状态[0:未删除;1:已删除]',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_platform_member_role` (`platform_member_id`, `role_id`) USING BTREE,
  KEY `idx_create_time` (`create_time`) USING BTREE
) ENGINE = INNODB
  AUTO_INCREMENT = 100000 COMMENT = '平台员工角色信息';

INSERT INTO `member` (`id`, `username`, `email`, `mobile`, `password`, `enabled`, `lock_status`, `expired_date`,
                      `credentials_expired_date`, `create_time`, `creator`, `modify_time`, `modifier`, `delete_flag`)
VALUES (1, 'admin', 'admin@life-lab.onaliyun.com', '10000000000', '000000', 1, 0, '9999-12-31 23:59:59',
        '9999-12-31 23:59:59', '2018-10-01 00:00:00', 1, '2018-11-26 14:44:15', 1, 0);

INSERT INTO `member_detail`
(`id`, `default_platform_id`, `nick_name`, `name`, `birthday`, `description`, `website`, `avatar`,
 `create_time`, `creator`, `modify_time`, `modifier`, `delete_flag`)

VALUES (1, null, '系统管理员', '系统管理员', '1970-01-01 00:00:00', '', '', '',
        '1970-01-01 00:00:00', 1, '1970-01-01 00:00:00', 1, b'0');


INSERT INTO `member` (`id`, `username`, `email`, `mobile`, `password`, `enabled`, `lock_status`, `expired_date`,
                      `credentials_expired_date`, `create_time`, `creator`, `modify_time`, `modifier`, `delete_flag`)
VALUES (100000, 'liweichao', 'liweichao@life-lab.onaliyun.com', '18395202205', '000000', 1, 0, '9999-12-31 23:59:59',
        '9999-12-31 23:59:59', '2018-10-01 00:00:00', 1, '2018-11-26 14:44:15', 1, 0);

INSERT INTO `member_detail`
(`id`, `default_platform_id`, `nick_name`, `name`, `birthday`, `description`, `website`, `avatar`,
 `create_time`, `creator`, `modify_time`, `modifier`, `delete_flag`)

VALUES (100000, null, '风再起时', '李伟超', '1992-01-02 00:00:00', '', '', '',
        '2018-11-03 18:31:53', 1, '2018-11-26 14:55:50', 1, b'0');
