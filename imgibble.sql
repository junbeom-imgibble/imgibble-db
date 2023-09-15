/*
 Navicat Premium Data Transfer

 Source Server         : DockerMysql
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : imgibble

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 28/03/2023 11:28:02
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for abused_members
-- ----------------------------
DROP TABLE IF EXISTS `abused_members`;
CREATE TABLE `abused_members` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `reason` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pass` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `try_count` int(10) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for asset_refs
-- ----------------------------
DROP TABLE IF EXISTS `asset_refs`;
CREATE TABLE `asset_refs` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `workspace_id` varbinary(255) NOT NULL,
  `channel_id` varbinary(255) NOT NULL,
  `filename` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `filename` (`filename`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for channels
-- ----------------------------
DROP TABLE IF EXISTS `channels`;
CREATE TABLE `channels` (
  `id` varbinary(16) NOT NULL DEFAULT '',
  `workspace_id` varbinary(16) NOT NULL DEFAULT '',
  `type` char(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'public' COMMENT '채널 타입 - public, private, …',
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `asset_count` int(11) unsigned NOT NULL DEFAULT '0',
  `auto_join` tinyint(1) NOT NULL DEFAULT '0' COMMENT '워크스페이스에 가입되면 자동으로 조인되는 채널여부',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `operating_by` varbinary(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `workspace_id` (`workspace_id`),
  FULLTEXT KEY `channels_title` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for channels_members
-- ----------------------------
DROP TABLE IF EXISTS `channels_members`;
CREATE TABLE `channels_members` (
  `channel_id` varbinary(16) NOT NULL DEFAULT '',
  `member_id` varbinary(16) NOT NULL DEFAULT '' COMMENT '채널의 멤버는 반드시 회원이어야 하고 워크스페이스의 멤버이어야 한다.',
  `author` tinyint(1) NOT NULL DEFAULT '0',
  `role` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `operating_by` varbinary(50) DEFAULT NULL,
  PRIMARY KEY (`channel_id`,`member_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for channels_members_notification_settings
-- ----------------------------
DROP TABLE IF EXISTS `channels_members_notification_settings`;
CREATE TABLE `channels_members_notification_settings` (
  `channel_id` varbinary(16) NOT NULL,
  `member_id` varbinary(16) NOT NULL,
  `email` tinyint(1) NOT NULL DEFAULT '1',
  `mobile_push` tinyint(1) NOT NULL DEFAULT '1',
  `browser_push` tinyint(1) NOT NULL DEFAULT '1',
  `operating_by` varbinary(50) DEFAULT NULL,
  UNIQUE KEY `channels_members_notification_idx` (`channel_id`,`member_id`) USING BTREE,
  KEY `channels_members_notification_idx2` (`channel_id`) USING BTREE,
  KEY `channels_members_notification_idx3` (`member_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for email_verifications
-- ----------------------------
DROP TABLE IF EXISTS `email_verifications`;
CREATE TABLE `email_verifications` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `verification_code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `verified` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `verified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `email_verification_code` (`verification_code`) USING BTREE,
  KEY `email_verification_email` (`email`,`verified`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=436 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for embed_channels
-- ----------------------------
DROP TABLE IF EXISTS `embed_channels`;
CREATE TABLE `embed_channels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `i_channel_id` varbinary(16) NOT NULL DEFAULT '',
  `i_workspace_id` varbinary(16) NOT NULL DEFAULT '',
  `e_channel_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `e_channel_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tool_name` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `language` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'kr',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `channel_id` (`i_channel_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for enterprise_admins
-- ----------------------------
DROP TABLE IF EXISTS `enterprise_admins`;
CREATE TABLE `enterprise_admins` (
  `id` varbinary(16) NOT NULL DEFAULT '',
  `company_id` varbinary(16) NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_idx_id` (`id`) USING BTREE,
  KEY `admin_idx_company_id` (`company_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for enterprise_companies
-- ----------------------------
DROP TABLE IF EXISTS `enterprise_companies`;
CREATE TABLE `enterprise_companies` (
  `id` varbinary(16) NOT NULL DEFAULT '',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deletable` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `company_idx_id` (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for enterprise_credentials
-- ----------------------------
DROP TABLE IF EXISTS `enterprise_credentials`;
CREATE TABLE `enterprise_credentials` (
  `id` varbinary(16) NOT NULL DEFAULT '',
  `company_id` varbinary(16) DEFAULT NULL,
  `api_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `credential_idx_id` (`id`) USING BTREE,
  KEY `credential_idx_company_id` (`company_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for enterprise_tokens
-- ----------------------------
DROP TABLE IF EXISTS `enterprise_tokens`;
CREATE TABLE `enterprise_tokens` (
  `id` varbinary(50) NOT NULL,
  `token` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for enterprise_users
-- ----------------------------
DROP TABLE IF EXISTS `enterprise_users`;
CREATE TABLE `enterprise_users` (
  `id` varbinary(255) NOT NULL DEFAULT '',
  `mid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nickname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `operating_by` varbinary(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `profile_color` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `profile_image` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `user_id` (`id`) USING BTREE,
  KEY `user_mid` (`mid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for enterprise_workspaces_settings
-- ----------------------------
DROP TABLE IF EXISTS `enterprise_workspaces_settings`;
CREATE TABLE `enterprise_workspaces_settings` (
  `workspace_id` varbinary(16) NOT NULL,
  `operating_by` varbinary(16) NOT NULL,
  `storage` float(50,2) NOT NULL,
  KEY `workspace_setting_id` (`workspace_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for ghost_members
-- ----------------------------
DROP TABLE IF EXISTS `ghost_members`;
CREATE TABLE `ghost_members` (
  `id` int(11) unsigned NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for members
-- ----------------------------
DROP TABLE IF EXISTS `members`;
CREATE TABLE `members` (
  `id` varbinary(16) NOT NULL DEFAULT '',
  `first_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `last_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `profile_image` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `nickname` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sso_auth_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sign_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'active, dispause, wirhdraw',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `last_login_at` timestamp NULL DEFAULT NULL,
  `last_accessed_at` timestamp NULL DEFAULT NULL,
  `last_accessed_ip` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `language` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'kr',
  `operating_by` varbinary(50) DEFAULT NULL,
  `profile_color` varchar(9) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `login_type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT 'email',
  `use_otp` tinyint(1) unsigned zerofill NOT NULL DEFAULT '0',
  `inflow_path` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `recommended_person` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `etc_inflow_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `members_sign_type` (`sign_type`),
  KEY `members_sso_auth_id` (`sso_auth_id`) USING BTREE,
  KEY `members_email` (`email`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for members_credentials
-- ----------------------------
DROP TABLE IF EXISTS `members_credentials`;
CREATE TABLE `members_credentials` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` varbinary(16) NOT NULL DEFAULT '',
  `login_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'email, google, facebook...',
  `sso_auth_id` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `member_id` (`member_id`),
  KEY `login_email` (`login_email`),
  KEY `sso_auth_id` (`sso_auth_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for payment_credits
-- ----------------------------
DROP TABLE IF EXISTS `payment_credits`;
CREATE TABLE `payment_credits` (
  `id` varbinary(16) NOT NULL,
  `workspace_id` varbinary(16) NOT NULL,
  `price` float(11,0) NOT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `private_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `memo` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `workspace_id` (`workspace_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for payment_daily_records
-- ----------------------------
DROP TABLE IF EXISTS `payment_daily_records`;
CREATE TABLE `payment_daily_records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `workspace_id` varbinary(16) NOT NULL,
  `plan` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `member_count` int(20) NOT NULL,
  `asset_storage` float(255,0) NOT NULL,
  `attached_file_storage` float(255,0) NOT NULL,
  `daily_price` float(255,0) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `payment_daily_records_idx_workspace_id` (`workspace_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for payment_deposits
-- ----------------------------
DROP TABLE IF EXISTS `payment_deposits`;
CREATE TABLE `payment_deposits` (
  `id` varbinary(16) NOT NULL,
  `workspace_id` varbinary(16) NOT NULL,
  `price` float(11,0) NOT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `memo` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `workspace_id` (`workspace_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for payment_history
-- ----------------------------
DROP TABLE IF EXISTS `payment_history`;
CREATE TABLE `payment_history` (
  `id` varbinary(16) NOT NULL,
  `workspace_id` varbinary(16) NOT NULL,
  `payment_method_id` varbinary(16) DEFAULT NULL,
  `plan` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mid` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` float(11,2) NOT NULL,
  `start_used_at` timestamp NULL DEFAULT NULL,
  `end_used_at` timestamp NULL DEFAULT NULL,
  `member_count` int(10) NOT NULL,
  `workspace_size` float(30,0) NOT NULL,
  `extended_storage` float(30,0) NOT NULL,
  `archiving_size` float(30,0) NOT NULL,
  `used_credit` float(30,0) NOT NULL,
  `used_deposit` float(30,0) NOT NULL,
  `card_price` float(30,2) NOT NULL,
  `deposit_tax` float(30,0) NOT NULL,
  `card_tax` float(30,0) NOT NULL,
  `payment_result` tinyint(1) NOT NULL,
  `pg_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_default_method` tinyint(1) NOT NULL,
  `auth_code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `transaction_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `billing_key` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_date` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_time` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `result_code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `result_message` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `card_number` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `card_code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `card_type` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `promotion_type` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `workspace_id` (`workspace_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for payment_methods
-- ----------------------------
DROP TABLE IF EXISTS `payment_methods`;
CREATE TABLE `payment_methods` (
  `id` binary(16) NOT NULL,
  `workspace_id` binary(16) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mid` varchar(50) NOT NULL,
  `transaction_id` varchar(255) NOT NULL,
  `billing_key` varchar(255) NOT NULL,
  `card_number` varchar(16) NOT NULL,
  `card_code` varchar(10) NOT NULL COMMENT '카드 발급사 코드',
  `card_type` varchar(10) NOT NULL COMMENT '신용카드, 체크카드, 기타',
  `is_default` tinyint(1) NOT NULL DEFAULT '0' COMMENT '기본 결제수단 여부',
  `is_corporation` tinyint(1) NOT NULL DEFAULT '0' COMMENT '법인카드 여부',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `payment_methods_workspace_id_idx` (`workspace_id`) USING BTREE,
  KEY `payment_methods_billing_key_idx` (`billing_key`) USING BTREE,
  KEY `payment_methods_wid_default_idx` (`workspace_id`,`is_default`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for payment_profiles
-- ----------------------------
DROP TABLE IF EXISTS `payment_profiles`;
CREATE TABLE `payment_profiles` (
  `id` binary(16) NOT NULL,
  `workspace_id` binary(16) NOT NULL,
  `name` varchar(20) NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tel` varchar(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `paymemnt_profiles_workspace_id_idx` (`workspace_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for promotion_histories
-- ----------------------------
DROP TABLE IF EXISTS `promotion_histories`;
CREATE TABLE `promotion_histories` (
  `id` int(16) NOT NULL AUTO_INCREMENT,
  `used_id` varbinary(16) NOT NULL DEFAULT '',
  `code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `credit` float(20,0) unsigned zerofill NOT NULL,
  `used_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `used_member_id` varbinary(16) NOT NULL,
  `used_workspace_id` varbinary(16) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `promotion_histories_used_id` (`used_id`) USING BTREE,
  KEY `promotion_histories` (`used_member_id`) USING BTREE,
  KEY `promotion_histories_used_workspace_id` (`used_workspace_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for promotions
-- ----------------------------
DROP TABLE IF EXISTS `promotions`;
CREATE TABLE `promotions` (
  `id` varbinary(16) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `private_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `memo` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `credit` float(10,0) unsigned zerofill NOT NULL,
  `code` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(30) NOT NULL,
  `infinity` tinyint(1) NOT NULL DEFAULT '0',
  `status` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `only_new_member` tinyint(1) NOT NULL DEFAULT '1',
  `enable_duplicate` tinyint(1) NOT NULL DEFAULT '0',
  `use_expiration_date` tinyint(1) NOT NULL DEFAULT '1',
  `expiration_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `promotions_code` (`code`) USING BTREE,
  UNIQUE KEY `promotion_id` (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `category` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for shared_links
-- ----------------------------
DROP TABLE IF EXISTS `shared_links`;
CREATE TABLE `shared_links` (
  `id` varbinary(16) NOT NULL DEFAULT '',
  `workspace_id` varbinary(16) NOT NULL DEFAULT '',
  `channel_id` varbinary(16) NOT NULL DEFAULT '',
  `title` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '공유 타이틀',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '설명',
  `link_url` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '링크 주소',
  `enable_feedback` tinyint(1) NOT NULL DEFAULT '0' COMMENT '피드백 가능 여부',
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '패스워드',
  `revoked` tinyint(1) NOT NULL DEFAULT '0' COMMENT '링크 폐지 여부',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `revoked_at` timestamp NULL DEFAULT NULL,
  `operating_by` varbinary(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `shared_links_channels_FK` (`channel_id`),
  KEY `shared_links_workspaces_FK` (`workspace_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for shared_links_assets
-- ----------------------------
DROP TABLE IF EXISTS `shared_links_assets`;
CREATE TABLE `shared_links_assets` (
  `shared_link_id` varbinary(16) NOT NULL DEFAULT '',
  `asset_id` varbinary(16) NOT NULL DEFAULT '',
  `operating_by` varbinary(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for workspaces
-- ----------------------------
DROP TABLE IF EXISTS `workspaces`;
CREATE TABLE `workspaces` (
  `id` varbinary(16) NOT NULL DEFAULT '',
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `type` char(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'personal' COMMENT 'free,personal, team',
  `icon_path` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `operating_by` varbinary(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `workspaces_idx_alias` (`alias`),
  KEY `workspace_idx_status` (`status`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='account';

-- ----------------------------
-- Table structure for workspaces_contracts
-- ----------------------------
DROP TABLE IF EXISTS `workspaces_contracts`;
CREATE TABLE `workspaces_contracts` (
  `workspace_id` varbinary(50) NOT NULL,
  `plan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trial_expiration_date` timestamp NULL DEFAULT NULL,
  `operating_by` varbinary(50) DEFAULT NULL,
  `contract_code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `next_payment_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`workspace_id`),
  UNIQUE KEY `workspace_id` (`workspace_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for workspaces_invitations
-- ----------------------------
DROP TABLE IF EXISTS `workspaces_invitations`;
CREATE TABLE `workspaces_invitations` (
  `id` binary(16) NOT NULL,
  `workspace_id` binary(16) NOT NULL,
  `sender_id` binary(16) NOT NULL,
  `member_id` binary(16) DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` mediumtext COLLATE utf8mb4_unicode_ci,
  `channels` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `operating_by` varbinary(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `workspace_invitation_1` (`workspace_id`,`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for workspaces_members
-- ----------------------------
DROP TABLE IF EXISTS `workspaces_members`;
CREATE TABLE `workspaces_members` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `workspace_id` varbinary(16) NOT NULL DEFAULT '',
  `member_id` varbinary(16) NOT NULL DEFAULT '',
  `role` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `operating_by` varbinary(50) DEFAULT NULL,
  `nickname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `profile_color` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `profile_image` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `last_accessed_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `workspace_id` (`workspace_id`),
  KEY `member_id` (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10174 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for workspaces_members_notification_settings
-- ----------------------------
DROP TABLE IF EXISTS `workspaces_members_notification_settings`;
CREATE TABLE `workspaces_members_notification_settings` (
  `workspace_id` varbinary(16) NOT NULL,
  `member_id` varbinary(16) NOT NULL,
  `email` tinyint(1) NOT NULL DEFAULT '1',
  `mobile_push` tinyint(1) NOT NULL DEFAULT '1',
  `browser_push` tinyint(1) NOT NULL DEFAULT '1',
  `email_type` enum('instant','batch') CHARACTER SET utf8 DEFAULT 'instant',
  `in_app_alarm` tinyint(1) NOT NULL,
  `operating_by` varbinary(50) DEFAULT NULL,
  `smart_alarm` tinyint(1) NOT NULL DEFAULT '1',
  UNIQUE KEY `workspaces_members_notidiction_idx` (`workspace_id`,`member_id`) USING BTREE,
  KEY `workspaces_members_notidiction_idx2` (`workspace_id`) USING BTREE,
  KEY `workspaces_members_notidiction_idx3` (`member_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for workspaces_meta_settings
-- ----------------------------
DROP TABLE IF EXISTS `workspaces_meta_settings`;
CREATE TABLE `workspaces_meta_settings` (
  `workspace_id` varbinary(16) NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `access_option` tinyint(5) DEFAULT '2',
  `access_domain` mediumtext COLLATE utf8mb4_unicode_ci,
  `operating_by` varbinary(50) DEFAULT NULL,
  `last_accessed_at` timestamp NULL DEFAULT NULL,
  `uploaded_count` int(11) DEFAULT NULL,
  `blocked_code` char(5) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'S000',
  PRIMARY KEY (`workspace_id`),
  UNIQUE KEY `workspace_id_UNIQUE` (`workspace_id`),
  KEY `last_accessed_at` (`last_accessed_at`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for workspaces_signup_requests
-- ----------------------------
DROP TABLE IF EXISTS `workspaces_signup_requests`;
CREATE TABLE `workspaces_signup_requests` (
  `id` binary(16) NOT NULL,
  `workspace_id` binary(16) NOT NULL,
  `member_id` binary(16) DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `operating_by` varbinary(50) DEFAULT NULL,
  `display_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

SET FOREIGN_KEY_CHECKS = 1;
