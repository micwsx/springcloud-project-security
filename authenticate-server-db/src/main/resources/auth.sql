-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: auth
-- ------------------------------------------------------
-- Server version	5.7.12

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
-- Current Database: `auth`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `auth` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `auth`;

--
-- Table structure for table `clientdetails`
--

DROP TABLE IF EXISTS `clientdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientdetails` (
  `appId` varchar(128) NOT NULL,
  `resourceIds` varchar(128) DEFAULT NULL,
  `appSecret` varchar(128) DEFAULT NULL,
  `scope` varchar(128) DEFAULT NULL,
  `grantTypes` varchar(128) DEFAULT NULL,
  `redirectUrl` varchar(128) DEFAULT NULL,
  `authorities` varchar(128) DEFAULT NULL,
  `access_token_validity` int(11) DEFAULT NULL,
  `refresh_token_validity` int(11) DEFAULT NULL,
  `additionalInformation` varchar(4096) DEFAULT NULL,
  `autoApproveScopes` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`appId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientdetails`
--

LOCK TABLES `clientdetails` WRITE;
/*!40000 ALTER TABLE `clientdetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `clientdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_access_token`
--

DROP TABLE IF EXISTS `oauth_access_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_access_token` (
  `token_id` varchar(128) DEFAULT NULL COMMENT 'è¯¥å­—æ®µçš„å€¼æ˜¯å°†access_tokençš„å€¼é€šè¿‡MD5åŠ å¯†åå­˜å‚¨',
  `token` blob COMMENT 'å­˜å‚¨OAuth2AccessToken.javaå¯¹è±¡åºåˆ—åŒ–åçš„äºŒè¿›åˆ¶æ•°æ®ï¼Œæ˜¯çœŸå®çš„AccessTokençš„æ•°æ®å€¼',
  `authentication_id` varchar(128) NOT NULL COMMENT 'å”¯ä¸€æ€§ï¼Œæ ¹æ®å½“å‰username(è‹¥æœ‰),client_idä¸scopeé€šè¿‡md5åŠ å¯†ç”Ÿæˆçš„ã€‚å…·ä½“å®ç°DefaultClientKeyGenerator.java',
  `user_name` varchar(128) DEFAULT NULL COMMENT 'ç™»å½•æ—¶ç”¨æˆ·åï¼Œè‹¥å®¢æˆ·ç«¯æ²¡æœ‰ç”¨æˆ·å(å¦‚grant_type="client_credentials"),åˆ™è¯¥å€¼ç­‰äºclient_id',
  `client_id` varchar(128) DEFAULT NULL COMMENT 'å®¢æˆ·ç«¯id',
  `authentication` blob COMMENT 'å­˜å‚¨OAuth2Authentication.javaå¯¹è±¡åºåˆ—åŒ–åçš„äºŒè¿›åˆ¶æ•°æ®',
  `refresh_token` varchar(128) DEFAULT NULL COMMENT 'å­—æ®µå€¼æ˜¯refresh_tokenå€¼é€šè¿‡MD5åŠ å¯†åå­˜å‚¨çš„',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'åˆ›å»ºæ—¶é—´',
  PRIMARY KEY (`authentication_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='å­˜æ”¾access tokenç­‰ï¼Œä¸»è¦æ“ä½œç±»ä¸ºJdbcTokenStoreã€‚';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_access_token`
--

LOCK TABLES `oauth_access_token` WRITE;
/*!40000 ALTER TABLE `oauth_access_token` DISABLE KEYS */;
INSERT INTO `oauth_access_token` VALUES ('8dbefe7470c52c08d93b34c7b8f4201d','¬\í\0sr\0Corg.springframework.security.oauth2.common.DefaultOAuth2AccessToken²6$ú\Î\0L\0additionalInformationt\0Ljava/util/Map;L\0\nexpirationt\0Ljava/util/Date;L\0refreshTokent\0?Lorg/springframework/security/oauth2/common/OAuth2RefreshToken;L\0scopet\0Ljava/util/Set;L\0	tokenTypet\0Ljava/lang/String;L\0valueq\0~\0xpsr\0java.util.Collections$EmptyMapY6…Z\Ü\ç\Ğ\0\0xpsr\0java.util.DatehjKYt\0\0xpw\0\0tuş yxsr\0Lorg.springframework.security.oauth2.common.DefaultExpiringOAuth2RefreshToken/\ßGc\ĞÉ·\0L\0\nexpirationq\0~\0xr\0Dorg.springframework.security.oauth2.common.DefaultOAuth2RefreshTokens\á\ncT\Ô^\0L\0valueq\0~\0xpt\0$00e2cbe0-0600-4db8-a1f3-ea8b1846bffdsq\0~\0	w\0\0tx\çAwxsr\0%java.util.Collections$UnmodifiableSet€’Ñ›€U\0\0xr\0,java.util.Collections$UnmodifiableCollectionB\0€\Ë^÷\0L\0ct\0Ljava/util/Collection;xpsr\0java.util.LinkedHashSet\Øl\×Z•\İ*\0\0xr\0java.util.HashSetºD…•–¸·4\0\0xpw\0\0\0?@\0\0\0\0\0t\0allxt\0bearert\0$db973cd0-5f78-4d1d-985a-7216c57cc46a','3fa5d5bf6877b61b97be9b37221406ef','jack','clientDemoApp','¬\í\0sr\0Aorg.springframework.security.oauth2.provider.OAuth2Authentication½@bR\0L\0\rstoredRequestt\0<Lorg/springframework/security/oauth2/provider/OAuth2Request;L\0userAuthenticationt\02Lorg/springframework/security/core/Authentication;xr\0Gorg.springframework.security.authentication.AbstractAuthenticationTokenÓª(~nGd\0Z\0\rauthenticatedL\0authoritiest\0Ljava/util/Collection;L\0detailst\0Ljava/lang/Object;xp\0sr\0&java.util.Collections$UnmodifiableListü%1µ\ì\0L\0listt\0Ljava/util/List;xr\0,java.util.Collections$UnmodifiableCollectionB\0€\Ë^÷\0L\0cq\0~\0xpsr\0java.util.ArrayListx\Ò™\Ça\0I\0sizexp\0\0\0w\0\0\0sr\0Borg.springframework.security.core.authority.SimpleGrantedAuthority\0\0\0\0\0\0\0L\0rolet\0Ljava/lang/String;xpt\0\nROLE_ADMINxq\0~\0psr\0:org.springframework.security.oauth2.provider.OAuth2Request\0\0\0\0\0\0\0\0Z\0approvedL\0authoritiesq\0~\0L\0\nextensionst\0Ljava/util/Map;L\0redirectUriq\0~\0L\0refresht\0;Lorg/springframework/security/oauth2/provider/TokenRequest;L\0resourceIdst\0Ljava/util/Set;L\0\rresponseTypesq\0~\0xr\08org.springframework.security.oauth2.provider.BaseRequest6(z>£qi½\0L\0clientIdq\0~\0L\0requestParametersq\0~\0L\0scopeq\0~\0xpt\0\rclientDemoAppsr\0%java.util.Collections$UnmodifiableMapñ¥¨ştõB\0L\0mq\0~\0xpsr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\ngrant_typet\0passwordt\0scopet\0allt\0usernamet\0jackxsr\0%java.util.Collections$UnmodifiableSet€’Ñ›€U\0\0xq\0~\0	sr\0java.util.LinkedHashSet\Øl\×Z•\İ*\0\0xr\0java.util.HashSetºD…•–¸·4\0\0xpw\0\0\0?@\0\0\0\0\0q\0~\0xsq\0~\0%w\0\0\0?@\0\0\0\0\0sq\0~\0\rt\0	ROLE_USERsq\0~\0\rt\0\nROLE_ADMINxsq\0~\0\Z?@\0\0\0\0\0\0w\0\0\0\0\0\0\0xppsq\0~\0%w\0\0\0?@\0\0\0\0\0t\0\rclientDemoAppxsq\0~\0%w\0\0\0?@\0\0\0\0\0\0xsr\0Oorg.springframework.security.authentication.UsernamePasswordAuthenticationToken\0\0\0\0\0\0\0L\0credentialsq\0~\0L\0	principalq\0~\0xq\0~\0sq\0~\0sq\0~\0\0\0\0w\0\0\0q\0~\0xq\0~\03sr\0java.util.LinkedHashMap4ÀN\\lÀû\0Z\0accessOrderxq\0~\0\Z?@\0\0\0\0\0w\0\0\0\0\0\0q\0~\0q\0~\0q\0~\0q\0~\0q\0~\0 q\0~\0!x\0psr\02org.springframework.security.core.userdetails.User\0\0\0\0\0\0\0Z\0accountNonExpiredZ\0accountNonLockedZ\0credentialsNonExpiredZ\0enabledL\0authoritiesq\0~\0L\0passwordq\0~\0L\0usernameq\0~\0xpsq\0~\0\"sr\0java.util.TreeSetİ˜P“•\í‡[\0\0xpsr\0Forg.springframework.security.core.userdetails.User$AuthorityComparator\0\0\0\0\0\0\0\0xpw\0\0\0q\0~\0xpt\0jack','368a1fa271558d307d161c3317a998d7','2020-09-10 10:51:28'),('74ede8f730ffd1021cac289fe2414c33','¬\í\0sr\0Corg.springframework.security.oauth2.common.DefaultOAuth2AccessToken²6$ú\Î\0L\0additionalInformationt\0Ljava/util/Map;L\0\nexpirationt\0Ljava/util/Date;L\0refreshTokent\0?Lorg/springframework/security/oauth2/common/OAuth2RefreshToken;L\0scopet\0Ljava/util/Set;L\0	tokenTypet\0Ljava/lang/String;L\0valueq\0~\0xpsr\0java.util.Collections$EmptyMapY6…Z\Ü\ç\Ğ\0\0xpsr\0java.util.DatehjKYt\0\0xpw\0\0tuû¯xsr\0Lorg.springframework.security.oauth2.common.DefaultExpiringOAuth2RefreshToken/\ßGc\ĞÉ·\0L\0\nexpirationq\0~\0xr\0Dorg.springframework.security.oauth2.common.DefaultOAuth2RefreshTokens\á\ncT\Ô^\0L\0valueq\0~\0xpt\0$cd2e1e21-2a5e-4f56-afe7-30a0c2a66117sq\0~\0	w\0\0txã§«xsr\0%java.util.Collections$UnmodifiableSet€’Ñ›€U\0\0xr\0,java.util.Collections$UnmodifiableCollectionB\0€\Ë^÷\0L\0ct\0Ljava/util/Collection;xpsr\0java.util.LinkedHashSet\Øl\×Z•\İ*\0\0xr\0java.util.HashSetºD…•–¸·4\0\0xpw\0\0\0?@\0\0\0\0\0t\0allxt\0bearert\0$a317efee-62f0-4d9e-82b5-05675fbac216','4dfbd4ab3ccc5a483bd7f7682116a930','michael','clientDemoApp','¬\í\0sr\0Aorg.springframework.security.oauth2.provider.OAuth2Authentication½@bR\0L\0\rstoredRequestt\0<Lorg/springframework/security/oauth2/provider/OAuth2Request;L\0userAuthenticationt\02Lorg/springframework/security/core/Authentication;xr\0Gorg.springframework.security.authentication.AbstractAuthenticationTokenÓª(~nGd\0Z\0\rauthenticatedL\0authoritiest\0Ljava/util/Collection;L\0detailst\0Ljava/lang/Object;xp\0sr\0&java.util.Collections$UnmodifiableListü%1µ\ì\0L\0listt\0Ljava/util/List;xr\0,java.util.Collections$UnmodifiableCollectionB\0€\Ë^÷\0L\0cq\0~\0xpsr\0java.util.ArrayListx\Ò™\Ça\0I\0sizexp\0\0\0w\0\0\0sr\0Borg.springframework.security.core.authority.SimpleGrantedAuthority\0\0\0\0\0\0\0L\0rolet\0Ljava/lang/String;xpt\0\nROLE_ADMINxq\0~\0psr\0:org.springframework.security.oauth2.provider.OAuth2Request\0\0\0\0\0\0\0\0Z\0approvedL\0authoritiesq\0~\0L\0\nextensionst\0Ljava/util/Map;L\0redirectUriq\0~\0L\0refresht\0;Lorg/springframework/security/oauth2/provider/TokenRequest;L\0resourceIdst\0Ljava/util/Set;L\0\rresponseTypesq\0~\0xr\08org.springframework.security.oauth2.provider.BaseRequest6(z>£qi½\0L\0clientIdq\0~\0L\0requestParametersq\0~\0L\0scopeq\0~\0xpt\0\rclientDemoAppsr\0%java.util.Collections$UnmodifiableMapñ¥¨ştõB\0L\0mq\0~\0xpsr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\ngrant_typet\0passwordt\0scopet\0allt\0usernamet\0michaelxsr\0%java.util.Collections$UnmodifiableSet€’Ñ›€U\0\0xq\0~\0	sr\0java.util.LinkedHashSet\Øl\×Z•\İ*\0\0xr\0java.util.HashSetºD…•–¸·4\0\0xpw\0\0\0?@\0\0\0\0\0q\0~\0xsq\0~\0%w\0\0\0?@\0\0\0\0\0sq\0~\0\rt\0	ROLE_USERsq\0~\0\rt\0\nROLE_ADMINxsq\0~\0\Z?@\0\0\0\0\0\0w\0\0\0\0\0\0\0xppsq\0~\0%w\0\0\0?@\0\0\0\0\0t\0\rclientDemoAppxsq\0~\0%w\0\0\0?@\0\0\0\0\0\0xsr\0Oorg.springframework.security.authentication.UsernamePasswordAuthenticationToken\0\0\0\0\0\0\0L\0credentialsq\0~\0L\0	principalq\0~\0xq\0~\0sq\0~\0sq\0~\0\0\0\0w\0\0\0q\0~\0xq\0~\03sr\0java.util.LinkedHashMap4ÀN\\lÀû\0Z\0accessOrderxq\0~\0\Z?@\0\0\0\0\0w\0\0\0\0\0\0q\0~\0q\0~\0q\0~\0q\0~\0q\0~\0 q\0~\0!x\0psr\02org.springframework.security.core.userdetails.User\0\0\0\0\0\0\0Z\0accountNonExpiredZ\0accountNonLockedZ\0credentialsNonExpiredZ\0enabledL\0authoritiesq\0~\0L\0passwordq\0~\0L\0usernameq\0~\0xpsq\0~\0\"sr\0java.util.TreeSetİ˜P“•\í‡[\0\0xpsr\0Forg.springframework.security.core.userdetails.User$AuthorityComparator\0\0\0\0\0\0\0\0xpw\0\0\0q\0~\0xpt\0michael','696d3a385d2ec120a45f2b2f57ba3585','2020-09-10 10:46:59'),('6052af82056be28e1989d3c8f0036353','¬\í\0sr\0Corg.springframework.security.oauth2.common.DefaultOAuth2AccessToken²6$ú\Î\0L\0additionalInformationt\0Ljava/util/Map;L\0\nexpirationt\0Ljava/util/Date;L\0refreshTokent\0?Lorg/springframework/security/oauth2/common/OAuth2RefreshToken;L\0scopet\0Ljava/util/Set;L\0	tokenTypet\0Ljava/lang/String;L\0valueq\0~\0xpsr\0java.util.Collections$EmptyMapY6…Z\Ü\ç\Ğ\0\0xpsr\0java.util.DatehjKYt\0\0xpw\0\0t›c/xsr\0Lorg.springframework.security.oauth2.common.DefaultExpiringOAuth2RefreshToken/\ßGc\ĞÉ·\0L\0\nexpirationq\0~\0xr\0Dorg.springframework.security.oauth2.common.DefaultOAuth2RefreshTokens\á\ncT\Ô^\0L\0valueq\0~\0xpt\0$07c0ed8f-5a4d-4a39-84f1-58cefd25c4d7sq\0~\0	w\0\0t\ì+xsr\0%java.util.Collections$UnmodifiableSet€’Ñ›€U\0\0xr\0,java.util.Collections$UnmodifiableCollectionB\0€\Ë^÷\0L\0ct\0Ljava/util/Collection;xpsr\0java.util.LinkedHashSet\Øl\×Z•\İ*\0\0xr\0java.util.HashSetºD…•–¸·4\0\0xpw\0\0\0?@\0\0\0\0\0t\0allxt\0bearert\0$60652022-62b6-4bbe-b4f0-a461bf8a9d73','6a89205e8b52cf780efaa21b44f591af',NULL,'clientDemoApp','¬\í\0sr\0Aorg.springframework.security.oauth2.provider.OAuth2Authentication½@bR\0L\0\rstoredRequestt\0<Lorg/springframework/security/oauth2/provider/OAuth2Request;L\0userAuthenticationt\02Lorg/springframework/security/core/Authentication;xr\0Gorg.springframework.security.authentication.AbstractAuthenticationTokenÓª(~nGd\0Z\0\rauthenticatedL\0authoritiest\0Ljava/util/Collection;L\0detailst\0Ljava/lang/Object;xp\0sr\0&java.util.Collections$UnmodifiableListü%1µ\ì\0L\0listt\0Ljava/util/List;xr\0,java.util.Collections$UnmodifiableCollectionB\0€\Ë^÷\0L\0cq\0~\0xpsr\0java.util.ArrayListx\Ò™\Ça\0I\0sizexp\0\0\0w\0\0\0sr\0Borg.springframework.security.core.authority.SimpleGrantedAuthority\0\0\0\0\0\0\0L\0rolet\0Ljava/lang/String;xpt\0	ROLE_USERsq\0~\0\rt\0\nROLE_ADMINxq\0~\0psr\0:org.springframework.security.oauth2.provider.OAuth2Request\0\0\0\0\0\0\0\0Z\0approvedL\0authoritiesq\0~\0L\0\nextensionst\0Ljava/util/Map;L\0redirectUriq\0~\0L\0refresht\0;Lorg/springframework/security/oauth2/provider/TokenRequest;L\0resourceIdst\0Ljava/util/Set;L\0\rresponseTypesq\0~\0xr\08org.springframework.security.oauth2.provider.BaseRequest6(z>£qi½\0L\0clientIdq\0~\0L\0requestParametersq\0~\0L\0scopeq\0~\0xpt\0\rclientDemoAppsr\0%java.util.Collections$UnmodifiableMapñ¥¨ştõB\0L\0mq\0~\0xpsr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\ngrant_typet\0client_credentialst\0scopet\0allxsr\0%java.util.Collections$UnmodifiableSet€’Ñ›€U\0\0xq\0~\0	sr\0java.util.LinkedHashSet\Øl\×Z•\İ*\0\0xr\0java.util.HashSetºD…•–¸·4\0\0xpw\0\0\0?@\0\0\0\0\0q\0~\0!xsq\0~\0%w\0\0\0?@\0\0\0\0\0q\0~\0q\0~\0xsq\0~\0?@\0\0\0\0\0\0w\0\0\0\0\0\0\0xppsq\0~\0%w\0\0\0?@\0\0\0\0\0t\0\rclientDemoAppxsq\0~\0%w\0\0\0?@\0\0\0\0\0\0xp','f4a7818378b58915a0e2bc5851642077','2020-09-17 15:22:12');
/*!40000 ALTER TABLE `oauth_access_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_approvals`
--

DROP TABLE IF EXISTS `oauth_approvals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_approvals` (
  `userId` varchar(128) DEFAULT NULL,
  `clientId` varchar(128) DEFAULT NULL,
  `scope` varchar(128) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `expiresAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lastModifiedAt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='å­˜æ”¾ç”¨æˆ·æˆæƒclientçš„ä¿¡æ¯ï¼Œå³å½“clientçš„grant typeæ”¯æŒauthorization_codeæ—¶æ‰æœ‰è®°å½•ã€‚ä¸»è¦æ“ä½œç±»ä¸ºJdbcApprovalStoreã€‚';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_approvals`
--

LOCK TABLES `oauth_approvals` WRITE;
/*!40000 ALTER TABLE `oauth_approvals` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_approvals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_client_details`
--

DROP TABLE IF EXISTS `oauth_client_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_client_details` (
  `client_id` varchar(128) NOT NULL COMMENT 'ç”¨äºå”¯ä¸€æ ‡è¯†æ¯ä¸€ä¸ªå®¢æˆ·ç«¯;æ³¨å†Œæ—¶å¿…é¡»å¡«å†™(ä¹Ÿå¯ç”±æœåŠ¡å™¨è‡ªåŠ¨ç”Ÿæˆ),å¯¹äºä¸åŒçš„grant_type,è¯¥å­—æ®µå¿…é¡»çš„ä¹Ÿæœ‰å«appKey',
  `resource_ids` varchar(128) DEFAULT NULL COMMENT 'å®¢æˆ·ç«¯æ‰€èƒ½è®¿é—®çš„èµ„æºid,å¤šä¸ªèµ„æºæ—¶ç”¨é€—å·åˆ†éš”',
  `client_secret` varchar(128) DEFAULT NULL COMMENT 'ç”¨äºæŒ‡å®šå®¢æˆ·ç«¯(client)è®¿é—®å¯†åŒ™ï¼Œæ³¨å†Œæ—¶å¿…å¡«(æˆ–æœåŠ¡å™¨ç”Ÿæˆ)åˆç§°appSecret',
  `scope` varchar(128) DEFAULT NULL COMMENT 'æŒ‡å®šå®¢æˆ·ç«¯ç”³è¯·æƒé™èŒƒå›´,å¯é€‰å€¼read,write,trustï¼Œå¤šä¸ªä½¿ç”¨é€—å·åˆ†éš”',
  `authorized_grant_types` varchar(128) DEFAULT NULL COMMENT 'æŒ‡å®šå®¢æˆ·ç«¯æ”¯æŒgrant_type,å¯é€‰å€¼authorization_code,password,refresh_token,implicit,client_credentials,é€šè¿‡æœåŠ¡å™¨æŒ‡å®šï¼Œè€Œä¸æ˜¯ç”³è¯·è€…å»é€‰æ‹©çš„ã€‚æœ€å¸¸ç”¨çš„grant_typeç»„åˆæœ‰:authorization_code,refresh_token(é’ˆå¯¹æµè§ˆå™¨è®¿é—®çš„å®¢æˆ·ç«¯)ï¼Œpassword,refresh_token(ç§»åŠ¨è®¾å¤‡çš„å®¢æˆ·ç«¯),implicitä¸client_credentialsåœ¨å®é™…ä¸­å¾ˆå°‘ä½¿ç”¨',
  `web_server_redirect_uri` varchar(128) DEFAULT NULL COMMENT 'å®¢æˆ·ç«¯é‡å†™å‘URI,å¯ç©ºï¼Œå½“grant_typeä¸ºauthorization_codeæˆ–implicitï¼Œåœ¨oauthæµç¨‹ä¸­ä¼šæ£€æŸ¥ä¸æ³¨å†Œæ—¶å¡«å†™çš„redirect_uriæ˜¯å¦ä¸€è‡´ã€‚authorization_codeæ—¶ï¼Œè·å–codeæ˜¯redirect_uriä¸æ­¤å€¼æ˜¯å¦ä¸€è‡´ï¼›implicitæ—¶é€šè¿‡redirect_uriçš„hashå€¼æ¥ä¼ é€’access_token,ç„¶åå®¢æˆ·ç«¯é€šè¿‡jsç­‰ä»hashå€¼ä¸­å–åˆ°access_tokenå€¼',
  `authorities` varchar(128) DEFAULT NULL COMMENT 'Spring Securityæƒé™å€¼ï¼Œå¯é€‰ã€‚è‹¥å¤šä¸ªå€¼ç”¨é€—å·åˆ†éš”ã€‚å¦‚ROLE_UNITY,ROLE_USER.æ ¹æ®grant_typeè®¾ç½®ï¼Œå¦‚æœæ˜¯authorization_codeæˆ–passwordï¼Œåˆ™è¯¥å­—æ®µå¯éœ€è¦è®¾ç½®å€¼ï¼Œå› ä¸ºç”¨æˆ·(è¯·æ±‚å¸¦æœ‰username,password)åœ¨æœåŠ¡ç«¯æ‰€æ‹¥æœ‰è¦å¨¶æ¥åˆ¤æ–­æ˜¯å¦æœ‰æƒé™è®¿é—®å¯¹åº”API;å¦‚æœä¸éœ€è¦ç”¨æˆ·ä¿¡æ¯(implicitï¼Œclient_credentials)ï¼Œåˆ™å¿…é¡»è®¾ç½®å¯¹åº”çš„æƒé™å€¼ï¼Œå› ä¸ºæœåŠ¡ç«¯æ ¹æ®æ­¤å­—æ®µå€¼åˆ¤æ–­æ˜¯å¦æœ‰æƒé™è®¿é—®API',
  `access_token_validity` int(11) DEFAULT NULL COMMENT 'tokenæœ‰æ•ˆæ—¶é—´(ç§’)ï¼Œé»˜è®¤60*60*12=12å°æ—¶ï¼Œå³Jsonä¸­çš„expires_in',
  `refresh_token_validity` int(11) DEFAULT NULL COMMENT 'refresh_tokenæœ‰æ•ˆæ—¶é—´(ç§’)é»˜è®¤60*60*24*30=30å¤©,è‹¥grant_typeä¸­æ²¡æœ‰refresh_token,åˆ™ä¸ç”¨å…³å¿ƒè¯¥å­—æ®µ',
  `additional_information` varchar(4096) DEFAULT NULL COMMENT 'é¢„ç•™å­—æ®µï¼Œå¯ç©ºï¼Œæ²¡æœ‰å®é™…ä½¿ç”¨ï¼Œä¸€èˆ¬ç”¨äºå­˜å‚¨å®¢æˆ·ç«¯å›½å®¶ï¼Œåœ°åŒºï¼Œæ³¨å†Œæ—¶IPç­‰ã€‚æœ‰å€¼å¿…é¡»jsonæ ¼å¼å¦‚ï¼š{"country":"CN"}',
  `autoapprove` varchar(128) DEFAULT NULL COMMENT 'é»˜è®¤false.å¯é€‰true,false,read,write.è¯¥å­—æ®µåªé€‚ç”¨äºgrant_typeä¸ºauthorization_codeï¼Œå½“ç”¨æˆ·ç™»å½•æˆåŠŸå,è‹¥è¯¥å€¼ä¸ºtrueæˆ–æ”¯æŒscopeå€¼ï¼Œåˆ™ä¼šè·¯è¿‡ç”¨æˆ·approvedé¡µé¢ï¼Œç›´æ¥æˆæƒ',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'åˆ›å»ºæ—¶é—´',
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='å­˜æ”¾clientä¿¡æ¯ï¼Œä¸»è¦æ“ä½œç±»ä¸ºJdbcClientDetailsService';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_client_details`
--

LOCK TABLES `oauth_client_details` WRITE;
/*!40000 ALTER TABLE `oauth_client_details` DISABLE KEYS */;
INSERT INTO `oauth_client_details` VALUES ('clientDemoApp','clientDemoApp','{bcrypt}$2a$10$pRQeyiFdmIbJAL/aYobSoOwwdVk/74K75tZOQBl5665r7pv0d0kHC','all, read, write, get_user_info','authorization_code,refresh_token,implicit,client_credentials,password','https://www.baidu.com','ROLE_USER,ROLE_ADMIN',1200,50000,NULL,'false',NULL);
/*!40000 ALTER TABLE `oauth_client_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_client_token`
--

DROP TABLE IF EXISTS `oauth_client_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_client_token` (
  `token_id` varchar(128) DEFAULT NULL COMMENT 'ä»æœåŠ¡å™¨è·å–åˆ°æ—¶çš„access_tokenå€¼',
  `token` blob COMMENT 'äºŒè¿›åˆ¶å­—æ®µï¼Œå­˜å‚¨æ•°æ®æ˜¯OAuth2AccessToken.javaå¯¹è±¡åºåˆ—åŒ–åçš„äºŒè¿›åˆ¶æ•°æ®',
  `authentication_id` varchar(128) NOT NULL COMMENT 'å”¯ä¸€æ€§ï¼Œæ ¹æ®å½“å‰username(è‹¥æœ‰),client_idä¸scopeé€šè¿‡md5åŠ å¯†ç”Ÿæˆçš„ã€‚å…·ä½“å®ç°DefaultClientKeyGenerator.java',
  `user_name` varchar(128) DEFAULT NULL COMMENT 'ç™»å½•æ—¶çš„ç”¨æˆ·å',
  `client_id` varchar(128) DEFAULT NULL COMMENT 'å®¢æˆ·ç«¯id',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'åˆ›å»ºæ—¶é—´',
  PRIMARY KEY (`authentication_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='å­˜æ”¾clientçš„Tokenä¿¡æ¯ã€‚å³é€šè¿‡client_credentialsæˆæƒæ–¹å¼è·å¾—çš„Tokenã€‚ä¸»è¦æ“ä½œç±»ä¸ºJdbcClientTokenServicesã€‚';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_client_token`
--

LOCK TABLES `oauth_client_token` WRITE;
/*!40000 ALTER TABLE `oauth_client_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_client_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_code`
--

DROP TABLE IF EXISTS `oauth_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_code` (
  `code` varchar(128) DEFAULT NULL COMMENT 'å­˜å‚¨æœåŠ¡ç«¯ç”Ÿæˆçš„codeå€¼(æœªåŠ å¯†)',
  `authentication` blob COMMENT 'å­˜å‚¨AuthorizationRequestHolder.javaå¯¹è±¡åºåˆ—åŒ–äºŒè¿›åˆ¶å€¼',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'åˆ›å»ºæ—¶é—´'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='å­˜æ”¾æˆæƒç ï¼ˆAuthorization Codeï¼‰ï¼Œå³å½“clientçš„grant typeæ”¯æŒauthorization_codeæ—¶æ‰æœ‰è®°å½•ã€‚ä¸»è¦æ“ä½œç±»ä¸ºJdbcAuthorizationCodeServicesã€‚';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_code`
--

LOCK TABLES `oauth_code` WRITE;
/*!40000 ALTER TABLE `oauth_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_refresh_token`
--

DROP TABLE IF EXISTS `oauth_refresh_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_refresh_token` (
  `token_id` varchar(128) DEFAULT NULL COMMENT 'refresh_tokenå€¼MD5åŠ å¯†åå­˜å‚¨',
  `token` blob COMMENT 'OAuth2RefreshToken.javaå¯¹è±¡åºåˆ—åŒ–åäºŒè¿›åˆ¶æ•°æ®',
  `authentication` blob COMMENT 'OAuth2Authentication.javaå¯¹è±¡åˆ—åŒ–åäºŒè¿›åˆ¶æ•°æ®',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'åˆ›å»ºæ—¶é—´'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='è·Ÿoath_access_tokenè¡¨ç±»ä¼¼ï¼Œå½“clientçš„grant typeæ”¯æŒrefresh tokenæ—¶æ‰æœ‰è®°å½•ã€‚ä¸»è¦æ“ä½œç±»ä¸ºJdbcTokenStoreã€‚';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_refresh_token`
--

LOCK TABLES `oauth_refresh_token` WRITE;
/*!40000 ALTER TABLE `oauth_refresh_token` DISABLE KEYS */;
INSERT INTO `oauth_refresh_token` VALUES ('210dfd2ec80a4d5b3183f71a39878c98','¬\í\0sr\0Lorg.springframework.security.oauth2.common.DefaultExpiringOAuth2RefreshToken/\ßGc\ĞÉ·\0L\0\nexpirationt\0Ljava/util/Date;xr\0Dorg.springframework.security.oauth2.common.DefaultOAuth2RefreshTokens\á\ncT\Ô^\0L\0valuet\0Ljava/lang/String;xpt«eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOlsiY2xpZW50RGVtb0FwcCJdLCJ1c2VyX25hbWUiOiJtaWNoYWVsIiwic2NvcGUiOlsiYWxsIl0sImF0aSI6ImY5NTBlMzI3LTI1NDQtNDhmYi1hZmE0LTA1NTJkZThhZTk3YiIsImV4cCI6MTU5OTU5NTM1MywiYXV0aG9yaXRpZXMiOlsiUk9MRV9BRE1JTiJdLCJqdGkiOiI2OGU1YTExMi0wOGQyLTRiYzQtOGQ4OS1mYTM0ODBiYjE3YmIiLCJjbGllbnRfaWQiOiJjbGllbnREZW1vQXBwIn0.Fs7sHXxHHMOsf_Y175SpXOfBIhTNFPYnoNhvHJOou7OBU2pHH6DrbQfVM6iPPKxWg-AsBhLL6NN8F5mU-jpDB2L0pEaCQdsTsuVGWYwYu2TAic62iCJn96U13MBYUz8GgPAK5sxhKnmGfS2mL5r5sb15YflBzdBM1Y2cGa8ZtQ6wAJOlOV7IuyACPfvlET6OfcgtXunO26u_afxOH0nB9Tqip0SchHBGiqEXW8rqjMNlmlYjM0eERoxh-j_28oc7FqC1APiTRm6JGNO4pYfjocCyX1gtDI7nnLTFSjLikOuEZzJVmIpDCLM2bWV41IxCD86PyuwQdXUrNTWFIof9Agsr\0java.util.DatehjKYt\0\0xpw\0\0toP£x','¬\í\0sr\0Aorg.springframework.security.oauth2.provider.OAuth2Authentication½@bR\0L\0\rstoredRequestt\0<Lorg/springframework/security/oauth2/provider/OAuth2Request;L\0userAuthenticationt\02Lorg/springframework/security/core/Authentication;xr\0Gorg.springframework.security.authentication.AbstractAuthenticationTokenÓª(~nGd\0Z\0\rauthenticatedL\0authoritiest\0Ljava/util/Collection;L\0detailst\0Ljava/lang/Object;xp\0sr\0&java.util.Collections$UnmodifiableListü%1µ\ì\0L\0listt\0Ljava/util/List;xr\0,java.util.Collections$UnmodifiableCollectionB\0€\Ë^÷\0L\0cq\0~\0xpsr\0java.util.ArrayListx\Ò™\Ça\0I\0sizexp\0\0\0w\0\0\0sr\0Borg.springframework.security.core.authority.SimpleGrantedAuthority\0\0\0\0\0\0\0L\0rolet\0Ljava/lang/String;xpt\0\nROLE_ADMINxq\0~\0psr\0:org.springframework.security.oauth2.provider.OAuth2Request\0\0\0\0\0\0\0\0Z\0approvedL\0authoritiesq\0~\0L\0\nextensionst\0Ljava/util/Map;L\0redirectUriq\0~\0L\0refresht\0;Lorg/springframework/security/oauth2/provider/TokenRequest;L\0resourceIdst\0Ljava/util/Set;L\0\rresponseTypesq\0~\0xr\08org.springframework.security.oauth2.provider.BaseRequest6(z>£qi½\0L\0clientIdq\0~\0L\0requestParametersq\0~\0L\0scopeq\0~\0xpt\0\rclientDemoAppsr\0%java.util.Collections$UnmodifiableMapñ¥¨ştõB\0L\0mq\0~\0xpsr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0codet\0tHLLiQt\0\ngrant_typet\0authorization_codet\0scopet\0allt\0\rresponse_typet\0codet\0redirect_urit\0https://www.baidu.comt\0statet\0123456t\0	client_idq\0~\0xsr\0%java.util.Collections$UnmodifiableSet€’Ñ›€U\0\0xq\0~\0	sr\0java.util.LinkedHashSet\Øl\×Z•\İ*\0\0xr\0java.util.HashSetºD…•–¸·4\0\0xpw\0\0\0?@\0\0\0\0\0t\0allxsq\0~\0,w\0\0\0?@\0\0\0\0\0sq\0~\0\rt\0	ROLE_USERsq\0~\0\rt\0\nROLE_ADMINxsq\0~\0\Z?@\0\0\0\0\0\0w\0\0\0\0\0\0\0xt\0https://www.baidu.compsq\0~\0,w\0\0\0?@\0\0\0\0\0t\0\rclientDemoAppxsq\0~\0,w\0\0\0?@\0\0\0\0\0q\0~\0#xsr\0Oorg.springframework.security.authentication.UsernamePasswordAuthenticationToken\0\0\0\0\0\0\0L\0credentialsq\0~\0L\0	principalq\0~\0xq\0~\0sq\0~\0sq\0~\0\0\0\0w\0\0\0q\0~\0xq\0~\0<sr\0Horg.springframework.security.web.authentication.WebAuthenticationDetails\0\0\0\0\0\0\0L\0\rremoteAddressq\0~\0L\0	sessionIdq\0~\0xpt\00:0:0:0:0:0:0:1t\0 49C3C34AADD0DAE0A025A79BB8023946psr\02org.springframework.security.core.userdetails.User\0\0\0\0\0\0\0Z\0accountNonExpiredZ\0accountNonLockedZ\0credentialsNonExpiredZ\0enabledL\0authoritiesq\0~\0L\0passwordq\0~\0L\0usernameq\0~\0xpsq\0~\0)sr\0java.util.TreeSetİ˜P“•\í‡[\0\0xpsr\0Forg.springframework.security.core.userdetails.User$AuthorityComparator\0\0\0\0\0\0\0\0xpw\0\0\0q\0~\0xpt\0michael','2020-09-08 14:10:18'),('696d3a385d2ec120a45f2b2f57ba3585','¬\í\0sr\0Lorg.springframework.security.oauth2.common.DefaultExpiringOAuth2RefreshToken/\ßGc\ĞÉ·\0L\0\nexpirationt\0Ljava/util/Date;xr\0Dorg.springframework.security.oauth2.common.DefaultOAuth2RefreshTokens\á\ncT\Ô^\0L\0valuet\0Ljava/lang/String;xpt\0$cd2e1e21-2a5e-4f56-afe7-30a0c2a66117sr\0java.util.DatehjKYt\0\0xpw\0\0txã§«x','¬\í\0sr\0Aorg.springframework.security.oauth2.provider.OAuth2Authentication½@bR\0L\0\rstoredRequestt\0<Lorg/springframework/security/oauth2/provider/OAuth2Request;L\0userAuthenticationt\02Lorg/springframework/security/core/Authentication;xr\0Gorg.springframework.security.authentication.AbstractAuthenticationTokenÓª(~nGd\0Z\0\rauthenticatedL\0authoritiest\0Ljava/util/Collection;L\0detailst\0Ljava/lang/Object;xp\0sr\0&java.util.Collections$UnmodifiableListü%1µ\ì\0L\0listt\0Ljava/util/List;xr\0,java.util.Collections$UnmodifiableCollectionB\0€\Ë^÷\0L\0cq\0~\0xpsr\0java.util.ArrayListx\Ò™\Ça\0I\0sizexp\0\0\0w\0\0\0sr\0Borg.springframework.security.core.authority.SimpleGrantedAuthority\0\0\0\0\0\0\0L\0rolet\0Ljava/lang/String;xpt\0\nROLE_ADMINxq\0~\0psr\0:org.springframework.security.oauth2.provider.OAuth2Request\0\0\0\0\0\0\0\0Z\0approvedL\0authoritiesq\0~\0L\0\nextensionst\0Ljava/util/Map;L\0redirectUriq\0~\0L\0refresht\0;Lorg/springframework/security/oauth2/provider/TokenRequest;L\0resourceIdst\0Ljava/util/Set;L\0\rresponseTypesq\0~\0xr\08org.springframework.security.oauth2.provider.BaseRequest6(z>£qi½\0L\0clientIdq\0~\0L\0requestParametersq\0~\0L\0scopeq\0~\0xpt\0\rclientDemoAppsr\0%java.util.Collections$UnmodifiableMapñ¥¨ştõB\0L\0mq\0~\0xpsr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\ngrant_typet\0passwordt\0scopet\0allt\0usernamet\0michaelxsr\0%java.util.Collections$UnmodifiableSet€’Ñ›€U\0\0xq\0~\0	sr\0java.util.LinkedHashSet\Øl\×Z•\İ*\0\0xr\0java.util.HashSetºD…•–¸·4\0\0xpw\0\0\0?@\0\0\0\0\0q\0~\0xsq\0~\0%w\0\0\0?@\0\0\0\0\0sq\0~\0\rt\0	ROLE_USERsq\0~\0\rt\0\nROLE_ADMINxsq\0~\0\Z?@\0\0\0\0\0\0w\0\0\0\0\0\0\0xppsq\0~\0%w\0\0\0?@\0\0\0\0\0t\0\rclientDemoAppxsq\0~\0%w\0\0\0?@\0\0\0\0\0\0xsr\0Oorg.springframework.security.authentication.UsernamePasswordAuthenticationToken\0\0\0\0\0\0\0L\0credentialsq\0~\0L\0	principalq\0~\0xq\0~\0sq\0~\0sq\0~\0\0\0\0w\0\0\0q\0~\0xq\0~\03sr\0java.util.LinkedHashMap4ÀN\\lÀû\0Z\0accessOrderxq\0~\0\Z?@\0\0\0\0\0w\0\0\0\0\0\0q\0~\0q\0~\0q\0~\0q\0~\0q\0~\0 q\0~\0!x\0psr\02org.springframework.security.core.userdetails.User\0\0\0\0\0\0\0Z\0accountNonExpiredZ\0accountNonLockedZ\0credentialsNonExpiredZ\0enabledL\0authoritiesq\0~\0L\0passwordq\0~\0L\0usernameq\0~\0xpsq\0~\0\"sr\0java.util.TreeSetİ˜P“•\í‡[\0\0xpsr\0Forg.springframework.security.core.userdetails.User$AuthorityComparator\0\0\0\0\0\0\0\0xpw\0\0\0q\0~\0xpt\0michael','2020-09-10 10:46:59'),('368a1fa271558d307d161c3317a998d7','¬\í\0sr\0Lorg.springframework.security.oauth2.common.DefaultExpiringOAuth2RefreshToken/\ßGc\ĞÉ·\0L\0\nexpirationt\0Ljava/util/Date;xr\0Dorg.springframework.security.oauth2.common.DefaultOAuth2RefreshTokens\á\ncT\Ô^\0L\0valuet\0Ljava/lang/String;xpt\0$00e2cbe0-0600-4db8-a1f3-ea8b1846bffdsr\0java.util.DatehjKYt\0\0xpw\0\0tx\çAwx','¬\í\0sr\0Aorg.springframework.security.oauth2.provider.OAuth2Authentication½@bR\0L\0\rstoredRequestt\0<Lorg/springframework/security/oauth2/provider/OAuth2Request;L\0userAuthenticationt\02Lorg/springframework/security/core/Authentication;xr\0Gorg.springframework.security.authentication.AbstractAuthenticationTokenÓª(~nGd\0Z\0\rauthenticatedL\0authoritiest\0Ljava/util/Collection;L\0detailst\0Ljava/lang/Object;xp\0sr\0&java.util.Collections$UnmodifiableListü%1µ\ì\0L\0listt\0Ljava/util/List;xr\0,java.util.Collections$UnmodifiableCollectionB\0€\Ë^÷\0L\0cq\0~\0xpsr\0java.util.ArrayListx\Ò™\Ça\0I\0sizexp\0\0\0w\0\0\0sr\0Borg.springframework.security.core.authority.SimpleGrantedAuthority\0\0\0\0\0\0\0L\0rolet\0Ljava/lang/String;xpt\0\nROLE_ADMINxq\0~\0psr\0:org.springframework.security.oauth2.provider.OAuth2Request\0\0\0\0\0\0\0\0Z\0approvedL\0authoritiesq\0~\0L\0\nextensionst\0Ljava/util/Map;L\0redirectUriq\0~\0L\0refresht\0;Lorg/springframework/security/oauth2/provider/TokenRequest;L\0resourceIdst\0Ljava/util/Set;L\0\rresponseTypesq\0~\0xr\08org.springframework.security.oauth2.provider.BaseRequest6(z>£qi½\0L\0clientIdq\0~\0L\0requestParametersq\0~\0L\0scopeq\0~\0xpt\0\rclientDemoAppsr\0%java.util.Collections$UnmodifiableMapñ¥¨ştõB\0L\0mq\0~\0xpsr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\ngrant_typet\0passwordt\0scopet\0allt\0usernamet\0jackxsr\0%java.util.Collections$UnmodifiableSet€’Ñ›€U\0\0xq\0~\0	sr\0java.util.LinkedHashSet\Øl\×Z•\İ*\0\0xr\0java.util.HashSetºD…•–¸·4\0\0xpw\0\0\0?@\0\0\0\0\0q\0~\0xsq\0~\0%w\0\0\0?@\0\0\0\0\0sq\0~\0\rt\0	ROLE_USERsq\0~\0\rt\0\nROLE_ADMINxsq\0~\0\Z?@\0\0\0\0\0\0w\0\0\0\0\0\0\0xppsq\0~\0%w\0\0\0?@\0\0\0\0\0t\0\rclientDemoAppxsq\0~\0%w\0\0\0?@\0\0\0\0\0\0xsr\0Oorg.springframework.security.authentication.UsernamePasswordAuthenticationToken\0\0\0\0\0\0\0L\0credentialsq\0~\0L\0	principalq\0~\0xq\0~\0sq\0~\0sq\0~\0\0\0\0w\0\0\0q\0~\0xq\0~\03sr\0java.util.LinkedHashMap4ÀN\\lÀû\0Z\0accessOrderxq\0~\0\Z?@\0\0\0\0\0w\0\0\0\0\0\0q\0~\0q\0~\0q\0~\0q\0~\0q\0~\0 q\0~\0!x\0psr\02org.springframework.security.core.userdetails.User\0\0\0\0\0\0\0Z\0accountNonExpiredZ\0accountNonLockedZ\0credentialsNonExpiredZ\0enabledL\0authoritiesq\0~\0L\0passwordq\0~\0L\0usernameq\0~\0xpsq\0~\0\"sr\0java.util.TreeSetİ˜P“•\í‡[\0\0xpsr\0Forg.springframework.security.core.userdetails.User$AuthorityComparator\0\0\0\0\0\0\0\0xpw\0\0\0q\0~\0xpt\0jack','2020-09-10 10:50:55'),('469c28327a42419c45c6957609a07e0a','¬\í\0sr\0Lorg.springframework.security.oauth2.common.DefaultExpiringOAuth2RefreshToken/\ßGc\ĞÉ·\0L\0\nexpirationt\0Ljava/util/Date;xr\0Dorg.springframework.security.oauth2.common.DefaultOAuth2RefreshTokens\á\ncT\Ô^\0L\0valuet\0Ljava/lang/String;xpt\0$e71645d6-a3d5-40cc-82ee-b5b324e23e5fsr\0java.util.DatehjKYt\0\0xpw\0\0t˜úŠ¢x','¬\í\0sr\0Aorg.springframework.security.oauth2.provider.OAuth2Authentication½@bR\0L\0\rstoredRequestt\0<Lorg/springframework/security/oauth2/provider/OAuth2Request;L\0userAuthenticationt\02Lorg/springframework/security/core/Authentication;xr\0Gorg.springframework.security.authentication.AbstractAuthenticationTokenÓª(~nGd\0Z\0\rauthenticatedL\0authoritiest\0Ljava/util/Collection;L\0detailst\0Ljava/lang/Object;xp\0sr\0&java.util.Collections$UnmodifiableListü%1µ\ì\0L\0listt\0Ljava/util/List;xr\0,java.util.Collections$UnmodifiableCollectionB\0€\Ë^÷\0L\0cq\0~\0xpsr\0java.util.ArrayListx\Ò™\Ça\0I\0sizexp\0\0\0w\0\0\0sr\0Borg.springframework.security.core.authority.SimpleGrantedAuthority\0\0\0\0\0\0\0L\0rolet\0Ljava/lang/String;xpt\0	ROLE_USERsq\0~\0\rt\0\nROLE_ADMINxq\0~\0psr\0:org.springframework.security.oauth2.provider.OAuth2Request\0\0\0\0\0\0\0\0Z\0approvedL\0authoritiesq\0~\0L\0\nextensionst\0Ljava/util/Map;L\0redirectUriq\0~\0L\0refresht\0;Lorg/springframework/security/oauth2/provider/TokenRequest;L\0resourceIdst\0Ljava/util/Set;L\0\rresponseTypesq\0~\0xr\08org.springframework.security.oauth2.provider.BaseRequest6(z>£qi½\0L\0clientIdq\0~\0L\0requestParametersq\0~\0L\0scopeq\0~\0xpt\0\rclientDemoAppsr\0%java.util.Collections$UnmodifiableMapñ¥¨ştõB\0L\0mq\0~\0xpsr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\ngrant_typet\0client_credentialst\0	client_idt\0\rclientDemoAppt\0scopet\0allxsr\0%java.util.Collections$UnmodifiableSet€’Ñ›€U\0\0xq\0~\0	sr\0java.util.LinkedHashSet\Øl\×Z•\İ*\0\0xr\0java.util.HashSetºD…•–¸·4\0\0xpw\0\0\0?@\0\0\0\0\0q\0~\0#xsq\0~\0\'w\0\0\0?@\0\0\0\0\0q\0~\0q\0~\0xsq\0~\0?@\0\0\0\0\0\0w\0\0\0\0\0\0\0xppsq\0~\0\'w\0\0\0?@\0\0\0\0\0t\0\rclientDemoAppxsq\0~\0\'w\0\0\0?@\0\0\0\0\0\0xp','2020-09-16 16:57:22'),('f885520f6c372ef2d502a2488695e3db','¬\í\0sr\0Lorg.springframework.security.oauth2.common.DefaultExpiringOAuth2RefreshToken/\ßGc\ĞÉ·\0L\0\nexpirationt\0Ljava/util/Date;xr\0Dorg.springframework.security.oauth2.common.DefaultOAuth2RefreshTokens\á\ncT\Ô^\0L\0valuet\0Ljava/lang/String;xpt\0$53160324-f9ee-4f08-9b56-7c89ff352a02sr\0java.util.DatehjKYt\0\0xpw\0\0tˆ\Zx','¬\í\0sr\0Aorg.springframework.security.oauth2.provider.OAuth2Authentication½@bR\0L\0\rstoredRequestt\0<Lorg/springframework/security/oauth2/provider/OAuth2Request;L\0userAuthenticationt\02Lorg/springframework/security/core/Authentication;xr\0Gorg.springframework.security.authentication.AbstractAuthenticationTokenÓª(~nGd\0Z\0\rauthenticatedL\0authoritiest\0Ljava/util/Collection;L\0detailst\0Ljava/lang/Object;xp\0sr\0&java.util.Collections$UnmodifiableListü%1µ\ì\0L\0listt\0Ljava/util/List;xr\0,java.util.Collections$UnmodifiableCollectionB\0€\Ë^÷\0L\0cq\0~\0xpsr\0java.util.ArrayListx\Ò™\Ça\0I\0sizexp\0\0\0w\0\0\0sr\0Borg.springframework.security.core.authority.SimpleGrantedAuthority\0\0\0\0\0\0\0L\0rolet\0Ljava/lang/String;xpt\0	ROLE_USERsq\0~\0\rt\0\nROLE_ADMINxq\0~\0psr\0:org.springframework.security.oauth2.provider.OAuth2Request\0\0\0\0\0\0\0\0Z\0approvedL\0authoritiesq\0~\0L\0\nextensionst\0Ljava/util/Map;L\0redirectUriq\0~\0L\0refresht\0;Lorg/springframework/security/oauth2/provider/TokenRequest;L\0resourceIdst\0Ljava/util/Set;L\0\rresponseTypesq\0~\0xr\08org.springframework.security.oauth2.provider.BaseRequest6(z>£qi½\0L\0clientIdq\0~\0L\0requestParametersq\0~\0L\0scopeq\0~\0xpt\0\rclientDemoAppsr\0%java.util.Collections$UnmodifiableMapñ¥¨ştõB\0L\0mq\0~\0xpsr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\ngrant_typet\0client_credentialst\0	client_idt\0\rclientDemoAppt\0scopet\0allxsr\0%java.util.Collections$UnmodifiableSet€’Ñ›€U\0\0xq\0~\0	sr\0java.util.LinkedHashSet\Øl\×Z•\İ*\0\0xr\0java.util.HashSetºD…•–¸·4\0\0xpw\0\0\0?@\0\0\0\0\0q\0~\0#xsq\0~\0\'w\0\0\0?@\0\0\0\0\0q\0~\0q\0~\0xsq\0~\0?@\0\0\0\0\0\0w\0\0\0\0\0\0\0xppsq\0~\0\'w\0\0\0?@\0\0\0\0\0t\0\rclientDemoAppxsq\0~\0\'w\0\0\0?@\0\0\0\0\0\0xp','2020-09-17 13:29:20'),('f4a7818378b58915a0e2bc5851642077','¬\í\0sr\0Lorg.springframework.security.oauth2.common.DefaultExpiringOAuth2RefreshToken/\ßGc\ĞÉ·\0L\0\nexpirationt\0Ljava/util/Date;xr\0Dorg.springframework.security.oauth2.common.DefaultOAuth2RefreshTokens\á\ncT\Ô^\0L\0valuet\0Ljava/lang/String;xpt\0$07c0ed8f-5a4d-4a39-84f1-58cefd25c4d7sr\0java.util.DatehjKYt\0\0xpw\0\0t\ì+x','¬\í\0sr\0Aorg.springframework.security.oauth2.provider.OAuth2Authentication½@bR\0L\0\rstoredRequestt\0<Lorg/springframework/security/oauth2/provider/OAuth2Request;L\0userAuthenticationt\02Lorg/springframework/security/core/Authentication;xr\0Gorg.springframework.security.authentication.AbstractAuthenticationTokenÓª(~nGd\0Z\0\rauthenticatedL\0authoritiest\0Ljava/util/Collection;L\0detailst\0Ljava/lang/Object;xp\0sr\0&java.util.Collections$UnmodifiableListü%1µ\ì\0L\0listt\0Ljava/util/List;xr\0,java.util.Collections$UnmodifiableCollectionB\0€\Ë^÷\0L\0cq\0~\0xpsr\0java.util.ArrayListx\Ò™\Ça\0I\0sizexp\0\0\0w\0\0\0sr\0Borg.springframework.security.core.authority.SimpleGrantedAuthority\0\0\0\0\0\0\0L\0rolet\0Ljava/lang/String;xpt\0	ROLE_USERsq\0~\0\rt\0\nROLE_ADMINxq\0~\0psr\0:org.springframework.security.oauth2.provider.OAuth2Request\0\0\0\0\0\0\0\0Z\0approvedL\0authoritiesq\0~\0L\0\nextensionst\0Ljava/util/Map;L\0redirectUriq\0~\0L\0refresht\0;Lorg/springframework/security/oauth2/provider/TokenRequest;L\0resourceIdst\0Ljava/util/Set;L\0\rresponseTypesq\0~\0xr\08org.springframework.security.oauth2.provider.BaseRequest6(z>£qi½\0L\0clientIdq\0~\0L\0requestParametersq\0~\0L\0scopeq\0~\0xpt\0\rclientDemoAppsr\0%java.util.Collections$UnmodifiableMapñ¥¨ştõB\0L\0mq\0~\0xpsr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\ngrant_typet\0client_credentialst\0	client_idt\0\rclientDemoAppt\0scopet\0allxsr\0%java.util.Collections$UnmodifiableSet€’Ñ›€U\0\0xq\0~\0	sr\0java.util.LinkedHashSet\Øl\×Z•\İ*\0\0xr\0java.util.HashSetºD…•–¸·4\0\0xpw\0\0\0?@\0\0\0\0\0q\0~\0#xsq\0~\0\'w\0\0\0?@\0\0\0\0\0q\0~\0q\0~\0xsq\0~\0?@\0\0\0\0\0\0w\0\0\0\0\0\0\0xppsq\0~\0\'w\0\0\0?@\0\0\0\0\0t\0\rclientDemoAppxsq\0~\0\'w\0\0\0?@\0\0\0\0\0\0xp','2020-09-17 15:22:04');
/*!40000 ALTER TABLE `oauth_refresh_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'ROLE_ADMIN'),(2,'ROLE_USER');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `password` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_sb8bbouer5wak8vyiiy4pf2bx` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'{bcrypt}$2a$10$I/EsyTRZzJmyeUvhnGH0KeUP8Gal3A5XfDvGI02hGRGr8D/AWY6uu','michael'),(10,'{bcrypt}$2a$10$I/EsyTRZzJmyeUvhnGH0KeUP8Gal3A5XfDvGI02hGRGr8D/AWY6uu','jack');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_role` (
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  KEY `FKa68196081fvovjhkek5m97n3y` (`role_id`),
  KEY `FK859n2jvi8ivhui0rl0esws6o` (`user_id`),
  CONSTRAINT `FK859n2jvi8ivhui0rl0esws6o` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FKa68196081fvovjhkek5m97n3y` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (10,2),(1,1);
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-09-25 17:19:47
