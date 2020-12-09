# Host: 127.0.0.1  (Version 8.0.22)
# Date: 2020-12-09 01:39:13
# Generator: MySQL-Front 6.0  (Build 2.20)


#
# Structure for table "items"
#

DROP TABLE IF EXISTS `items`;
CREATE TABLE `items` (
  `name` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `weight` int NOT NULL DEFAULT '1',
  `limit` int NOT NULL DEFAULT '10',
  `rare` tinyint NOT NULL DEFAULT '0',
  `can_remove` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

#
# Data for table "items"
#


#
# Structure for table "job_grades"
#

DROP TABLE IF EXISTS `job_grades`;
CREATE TABLE `job_grades` (
  `id` int NOT NULL AUTO_INCREMENT,
  `job_name` varchar(50) DEFAULT NULL,
  `grade` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `salary` int NOT NULL,
  `skin_male` longtext NOT NULL,
  `skin_female` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

#
# Data for table "job_grades"
#

INSERT INTO `job_grades` VALUES (1,'unemployed',0,'unemployed','Unemployed',50,'{}','{}');

#
# Structure for table "jobs"
#

DROP TABLE IF EXISTS `jobs`;
CREATE TABLE `jobs` (
  `name` varchar(50) NOT NULL,
  `label` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

#
# Data for table "jobs"
#

INSERT INTO `jobs` VALUES ('unemployed','Unemployed');

#
# Structure for table "users"
#

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `identifier` varchar(60) NOT NULL,
  `license` varchar(60) DEFAULT NULL,
  `accounts` longtext,
  `group` varchar(50) DEFAULT 'user',
  `inventory` longtext,
  `job` varchar(20) DEFAULT 'unemployed',
  `job_grade` int DEFAULT '0',
  `loadout` longtext,
  `position` varchar(255) DEFAULT '{"x":-269.4,"y":-955.3,"z":31.2,"heading":205.8}',
  `firstname` varchar(16) DEFAULT NULL,
  `lastname` varchar(16) DEFAULT NULL,
  `dateofbirth` varchar(10) DEFAULT NULL,
  `sex` varchar(1) DEFAULT NULL,
  `height` int DEFAULT NULL,
  `skin` longtext,
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

#
# Data for table "users"
#

INSERT INTO `users` VALUES ('steam:110000115ce7da9','','{\"bank\":10000,\"black_money\":0,\"money\":0}','superadmin','[]','unemployed',0,'[]','{\"z\":31.2,\"heading\":205.8,\"x\":-269.4,\"y\":-955.3}','Jose','Garcia','11/28/2003','m',96,'{\"bracelets_2\":0,\"pants_2\":0,\"moles_1\":0,\"chain_2\":0,\"hair_color_1\":29,\"hair_1\":21,\"arms_2\":0,\"bodyb_1\":0,\"mask_1\":0,\"hair_2\":0,\"makeup_4\":0,\"chest_3\":0,\"sex\":0,\"shoes_2\":0,\"bproof_1\":0,\"mask_2\":0,\"bodyb_2\":0,\"helmet_1\":-1,\"complexion_2\":0,\"tshirt_1\":0,\"helmet_2\":0,\"ears_1\":-1,\"glasses_2\":0,\"makeup_1\":0,\"complexion_1\":0,\"chest_2\":0,\"blush_3\":0,\"blemishes_2\":0,\"eye_color\":0,\"eyebrows_1\":0,\"blush_1\":0,\"shoes_1\":0,\"bags_2\":0,\"lipstick_4\":0,\"makeup_2\":0,\"face\":0,\"beard_2\":0,\"lipstick_1\":0,\"decals_2\":0,\"watches_1\":-1,\"beard_1\":0,\"arms\":0,\"tshirt_2\":0,\"beard_3\":0,\"eyebrows_2\":0,\"pants_1\":0,\"glasses_1\":0,\"hair_color_2\":0,\"moles_2\":0,\"torso_2\":0,\"eyebrows_4\":0,\"bproof_2\":0,\"bracelets_1\":-1,\"bags_1\":0,\"decals_1\":0,\"age_2\":0,\"watches_2\":0,\"sun_2\":0,\"age_1\":0,\"blemishes_1\":0,\"sun_1\":0,\"makeup_3\":0,\"chain_1\":0,\"lipstick_2\":0,\"skin\":0,\"blush_2\":0,\"eyebrows_3\":0,\"chest_1\":0,\"beard_4\":0,\"torso_1\":0,\"lipstick_3\":0,\"ears_2\":0}');
