-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         8.0.23 - MySQL Community Server - GPL
-- SO del servidor:              Win64
-- HeidiSQL Versión:             11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para es_extended
CREATE DATABASE IF NOT EXISTS `es_extended` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `es_extended`;

-- Volcando estructura para tabla es_extended.account_emailaddress
CREATE TABLE IF NOT EXISTS `account_emailaddress` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(254) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `account_emailaddress_user_id_2c513194_fk_auth_user_id` (`user_id`),
  CONSTRAINT `account_emailaddress_user_id_2c513194_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla es_extended.account_emailaddress: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `account_emailaddress` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_emailaddress` ENABLE KEYS */;

-- Volcando estructura para tabla es_extended.account_emailconfirmation
CREATE TABLE IF NOT EXISTS `account_emailconfirmation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `sent` datetime(6) DEFAULT NULL,
  `key` varchar(64) NOT NULL,
  `email_address_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`),
  KEY `account_emailconfirm_email_address_id_5b7f8c58_fk_account_e` (`email_address_id`),
  CONSTRAINT `account_emailconfirm_email_address_id_5b7f8c58_fk_account_e` FOREIGN KEY (`email_address_id`) REFERENCES `account_emailaddress` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla es_extended.account_emailconfirmation: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `account_emailconfirmation` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_emailconfirmation` ENABLE KEYS */;

-- Volcando estructura para tabla es_extended.addon_account
CREATE TABLE IF NOT EXISTS `addon_account` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla es_extended.addon_account: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `addon_account` DISABLE KEYS */;
INSERT INTO `addon_account` (`name`, `label`, `shared`) VALUES
	('society_cardealer', 'Concessionnaire', 1);
/*!40000 ALTER TABLE `addon_account` ENABLE KEYS */;

-- Volcando estructura para tabla es_extended.addon_account_data
CREATE TABLE IF NOT EXISTS `addon_account_data` (
  `id` int NOT NULL AUTO_INCREMENT,
  `account_name` varchar(100) DEFAULT NULL,
  `money` int NOT NULL,
  `owner` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_addon_account_data_account_name_owner` (`account_name`,`owner`),
  KEY `index_addon_account_data_account_name` (`account_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla es_extended.addon_account_data: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `addon_account_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `addon_account_data` ENABLE KEYS */;

-- Volcando estructura para tabla es_extended.addon_inventory
CREATE TABLE IF NOT EXISTS `addon_inventory` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla es_extended.addon_inventory: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `addon_inventory` DISABLE KEYS */;
INSERT INTO `addon_inventory` (`name`, `label`, `shared`) VALUES
	('society_cardealer', 'Concesionnaire', 1);
/*!40000 ALTER TABLE `addon_inventory` ENABLE KEYS */;

-- Volcando estructura para tabla es_extended.addon_inventory_items
CREATE TABLE IF NOT EXISTS `addon_inventory_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `inventory_name` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `count` int NOT NULL,
  `owner` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_addon_inventory_items_inventory_name_name` (`inventory_name`,`name`),
  KEY `index_addon_inventory_items_inventory_name_name_owner` (`inventory_name`,`name`,`owner`),
  KEY `index_addon_inventory_inventory_name` (`inventory_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla es_extended.addon_inventory_items: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `addon_inventory_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `addon_inventory_items` ENABLE KEYS */;

-- Volcando estructura para tabla es_extended.auth_group
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla es_extended.auth_group: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;

-- Volcando estructura para tabla es_extended.auth_group_permissions
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla es_extended.auth_group_permissions: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;

-- Volcando estructura para tabla es_extended.auth_permission
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla es_extended.auth_permission: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
	(1, 'Can add log entry', 1, 'add_logentry'),
	(2, 'Can change log entry', 1, 'change_logentry'),
	(3, 'Can delete log entry', 1, 'delete_logentry'),
	(4, 'Can view log entry', 1, 'view_logentry'),
	(5, 'Can add permission', 2, 'add_permission'),
	(6, 'Can change permission', 2, 'change_permission'),
	(7, 'Can delete permission', 2, 'delete_permission'),
	(8, 'Can view permission', 2, 'view_permission'),
	(9, 'Can add group', 3, 'add_group'),
	(10, 'Can change group', 3, 'change_group'),
	(11, 'Can delete group', 3, 'delete_group'),
	(12, 'Can view group', 3, 'view_group'),
	(13, 'Can add user', 4, 'add_user'),
	(14, 'Can change user', 4, 'change_user'),
	(15, 'Can delete user', 4, 'delete_user'),
	(16, 'Can view user', 4, 'view_user'),
	(17, 'Can add content type', 5, 'add_contenttype'),
	(18, 'Can change content type', 5, 'change_contenttype'),
	(19, 'Can delete content type', 5, 'delete_contenttype'),
	(20, 'Can view content type', 5, 'view_contenttype'),
	(21, 'Can add session', 6, 'add_session'),
	(22, 'Can change session', 6, 'change_session'),
	(23, 'Can delete session', 6, 'delete_session'),
	(24, 'Can view session', 6, 'view_session'),
	(25, 'Can add site', 7, 'add_site'),
	(26, 'Can change site', 7, 'change_site'),
	(27, 'Can delete site', 7, 'delete_site'),
	(28, 'Can view site', 7, 'view_site'),
	(29, 'Can add Categoría', 8, 'add_category'),
	(30, 'Can change Categoría', 8, 'change_category'),
	(31, 'Can delete Categoría', 8, 'delete_category'),
	(32, 'Can view Categoría', 8, 'view_category'),
	(33, 'Can add Artículo', 9, 'add_article'),
	(34, 'Can change Artículo', 9, 'change_article'),
	(35, 'Can delete Artículo', 9, 'delete_article'),
	(36, 'Can view Artículo', 9, 'view_article'),
	(37, 'Can add email address', 10, 'add_emailaddress'),
	(38, 'Can change email address', 10, 'change_emailaddress'),
	(39, 'Can delete email address', 10, 'delete_emailaddress'),
	(40, 'Can view email address', 10, 'view_emailaddress'),
	(41, 'Can add email confirmation', 11, 'add_emailconfirmation'),
	(42, 'Can change email confirmation', 11, 'change_emailconfirmation'),
	(43, 'Can delete email confirmation', 11, 'delete_emailconfirmation'),
	(44, 'Can view email confirmation', 11, 'view_emailconfirmation'),
	(45, 'Can add social account', 12, 'add_socialaccount'),
	(46, 'Can change social account', 12, 'change_socialaccount'),
	(47, 'Can delete social account', 12, 'delete_socialaccount'),
	(48, 'Can view social account', 12, 'view_socialaccount'),
	(49, 'Can add social application', 13, 'add_socialapp'),
	(50, 'Can change social application', 13, 'change_socialapp'),
	(51, 'Can delete social application', 13, 'delete_socialapp'),
	(52, 'Can view social application', 13, 'view_socialapp'),
	(53, 'Can add social application token', 14, 'add_socialtoken'),
	(54, 'Can change social application token', 14, 'change_socialtoken'),
	(55, 'Can delete social application token', 14, 'delete_socialtoken'),
	(56, 'Can view social application token', 14, 'view_socialtoken'),
	(57, 'Can add open id nonce', 15, 'add_openidnonce'),
	(58, 'Can change open id nonce', 15, 'change_openidnonce'),
	(59, 'Can delete open id nonce', 15, 'delete_openidnonce'),
	(60, 'Can view open id nonce', 15, 'view_openidnonce'),
	(61, 'Can add open id store', 16, 'add_openidstore'),
	(62, 'Can change open id store', 16, 'change_openidstore'),
	(63, 'Can delete open id store', 16, 'delete_openidstore'),
	(64, 'Can view open id store', 16, 'view_openidstore'),
	(65, 'Can add user', 17, 'add_user'),
	(66, 'Can change user', 17, 'change_user'),
	(67, 'Can delete user', 17, 'delete_user'),
	(68, 'Can view user', 17, 'view_user'),
	(69, 'Can add user fivem', 18, 'add_userfivem'),
	(70, 'Can change user fivem', 18, 'change_userfivem'),
	(71, 'Can delete user fivem', 18, 'delete_userfivem'),
	(72, 'Can view user fivem', 18, 'view_userfivem'),
	(73, 'Can add fivem', 19, 'add_fivem'),
	(74, 'Can change fivem', 19, 'change_fivem'),
	(75, 'Can delete fivem', 19, 'delete_fivem'),
	(76, 'Can view fivem', 19, 'view_fivem'),
	(77, 'Can add fivm', 20, 'add_fivm'),
	(78, 'Can change fivm', 20, 'change_fivm'),
	(79, 'Can delete fivm', 20, 'delete_fivm'),
	(80, 'Can view fivm', 20, 'view_fivm'),
	(81, 'Can add fiv', 21, 'add_fiv'),
	(82, 'Can change fiv', 21, 'change_fiv'),
	(83, 'Can delete fiv', 21, 'delete_fiv'),
	(84, 'Can view fiv', 21, 'view_fiv'),
	(85, 'Can add five', 22, 'add_five'),
	(86, 'Can change five', 22, 'change_five'),
	(87, 'Can delete five', 22, 'delete_five'),
	(88, 'Can view five', 22, 'view_five'),
	(89, 'Can add five user', 23, 'add_fiveuser'),
	(90, 'Can change five user', 23, 'change_fiveuser'),
	(91, 'Can delete five user', 23, 'delete_fiveuser'),
	(92, 'Can view five user', 23, 'view_fiveuser'),
	(93, 'Can add user fivem', 24, 'add_userfivem'),
	(94, 'Can change user fivem', 24, 'change_userfivem'),
	(95, 'Can delete user fivem', 24, 'delete_userfivem'),
	(96, 'Can view user fivem', 24, 'view_userfivem'),
	(97, 'Can add Whitelist', 25, 'add_userwhitelist'),
	(98, 'Can change Whitelist', 25, 'change_userwhitelist'),
	(99, 'Can delete Whitelist', 25, 'delete_userwhitelist'),
	(100, 'Can view Whitelist', 25, 'view_userwhitelist');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;

-- Volcando estructura para tabla es_extended.auth_user
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla es_extended.auth_user: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
	(1, 'pbkdf2_sha256$216000$gPtlMxFjfsCm$SWGWuMMdNaTdtzmdMCUIlgDc9QjIoS5fV2bfutjrmZM=', '2021-03-07 23:06:56.000000', 1, 'admin', 'Jose', 'Martinez', 'jose.mc.2004@gmail.com', 1, 0, '2021-03-07 20:19:39.000000'),
	(12, 'pbkdf2_sha256$216000$vq6LgNb5YinY$oV9PELiwvwv0BCirIzn/00vlXRF/GH9JW3bBwOBYDpw=', '2021-03-08 12:24:28.000000', 1, 'Beniszkee', 'Jose Manuel', 'Martinez Camacho', 'jose.mc.2004@gmail.com', 1, 1, '2021-03-08 12:24:28.000000');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;

-- Volcando estructura para tabla es_extended.auth_user_groups
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla es_extended.auth_user_groups: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;

-- Volcando estructura para tabla es_extended.auth_user_user_permissions
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla es_extended.auth_user_user_permissions: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;

-- Volcando estructura para tabla es_extended.billing
CREATE TABLE IF NOT EXISTS `billing` (
  `id` int NOT NULL AUTO_INCREMENT,
  `identifier` varchar(40) NOT NULL,
  `sender` varchar(40) NOT NULL,
  `target_type` varchar(50) NOT NULL,
  `target` varchar(40) NOT NULL,
  `label` varchar(255) NOT NULL,
  `amount` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla es_extended.billing: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `billing` DISABLE KEYS */;
/*!40000 ALTER TABLE `billing` ENABLE KEYS */;

-- Volcando estructura para tabla es_extended.blog_article
CREATE TABLE IF NOT EXISTS `blog_article` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(150) NOT NULL,
  `image` varchar(100) NOT NULL,
  `content` longtext NOT NULL,
  `visible` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `slug` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `blog_article_slug_c3fca16d_uniq` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla es_extended.blog_article: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `blog_article` DISABLE KEYS */;
INSERT INTO `blog_article` (`id`, `title`, `image`, `content`, `visible`, `created_at`, `updated_at`, `slug`) VALUES
	(1, '¿Cómo jugar a Odisea RP? - NO BORRAR', 'null', '<h2>&iquest;Qu&eacute; es Lorem Ipsum?</h2>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno est&aacute;ndar de las industrias desde el a&ntilde;o 1500, cuando un impresor (N. del T. persona que se dedica a la imprenta) desconocido us&oacute; una galer&iacute;a de textos y los mezcl&oacute; de tal manera que logr&oacute; hacer un libro de textos especimen. No s&oacute;lo sobrevivi&oacute; 500 a&ntilde;os, sino que tambien ingres&oacute; como texto de relleno en documentos electr&oacute;nicos, quedando esencialmente igual al original. Fue popularizado en los 60s con la creaci&oacute;n de las hojas &quot;Letraset&quot;, las cuales contenian pasajes de Lorem Ipsum, y m&aacute;s recientemente con software de autoedici&oacute;n, como por ejemplo Aldus PageMaker, el cual incluye versiones de Lorem Ipsum.</p>\r\n\r\n<h2>&iquest;Por qu&eacute; lo usamos?</h2>\r\n\r\n<p>Es un hecho establecido hace demasiado tiempo que un lector se distraer&aacute; con el contenido del texto de un sitio mientras que mira su dise&ntilde;o. El punto de usar Lorem Ipsum es que tiene una distribuci&oacute;n m&aacute;s o menos normal de las letras, al contrario de usar textos como por ejemplo &quot;Contenido aqu&iacute;, contenido aqu&iacute;&quot;. Estos textos hacen parecerlo un espa&ntilde;ol que se puede leer. Muchos paquetes de autoedici&oacute;n y editores de p&aacute;ginas web usan el Lorem Ipsum como su texto por defecto, y al hacer una b&uacute;squeda de &quot;Lorem Ipsum&quot; va a dar por resultado muchos sitios web que usan este texto si se encuentran en estado de desarrollo. Muchas versiones han evolucionado a trav&eacute;s de los a&ntilde;os, algunas veces por accidente, otras veces a prop&oacute;sito (por ejemplo insert&aacute;ndole humor y cosas por el estilo).</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>&iquest;De d&oacute;nde viene?</h2>\r\n\r\n<p>Al contrario del pensamiento popular, el texto de Lorem Ipsum no es simplemente texto aleatorio. Tiene sus raices en una pieza cl&acute;sica de la literatura del Latin, que data del a&ntilde;o 45 antes de Cristo, haciendo que este adquiera mas de 2000 a&ntilde;os de antiguedad. Richard McClintock, un profesor de Latin de la Universidad de Hampden-Sydney en Virginia, encontr&oacute; una de las palabras m&aacute;s oscuras de la lengua del lat&iacute;n, &quot;consecteur&quot;, en un pasaje de Lorem Ipsum, y al seguir leyendo distintos textos del lat&iacute;n, descubri&oacute; la fuente indudable. Lorem Ipsum viene de las secciones 1.10.32 y 1.10.33 de &quot;de Finnibus Bonorum et Malorum&quot; (Los Extremos del Bien y El Mal) por Cicero, escrito en el a&ntilde;o 45 antes de Cristo. Este libro es un tratado de teor&iacute;a de &eacute;ticas, muy popular durante el Renacimiento. La primera linea del Lorem Ipsum, &quot;Lorem ipsum dolor sit amet..&quot;, viene de una linea en la secci&oacute;n 1.10.32</p>\r\n\r\n<p>El trozo de texto est&aacute;ndar de Lorem Ipsum usado desde el a&ntilde;o 1500 es reproducido debajo para aquellos interesados. Las secciones 1.10.32 y 1.10.33 de &quot;de Finibus Bonorum et Malorum&quot; por Cicero son tambi&eacute;n reproducidas en su forma original exacta, acompa&ntilde;adas por versiones en Ingl&eacute;s de la traducci&oacute;n realizada en 1914 por H. Rackham.</p>', 0, '2021-03-08 12:34:03.810693', '2021-03-07 20:24:15.631858', 'tutorial-de-como-jugar'),
	(2, 'Sobre Nosotros - NO BORRAR', 'null', '<h2>&iquest;Qu&eacute; es Lorem Ipsum?</h2>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno est&aacute;ndar de las industrias desde el a&ntilde;o 1500, cuando un impresor (N. del T. persona que se dedica a la imprenta) desconocido us&oacute; una galer&iacute;a de textos y los mezcl&oacute; de tal manera que logr&oacute; hacer un libro de textos especimen. No s&oacute;lo sobrevivi&oacute; 500 a&ntilde;os, sino que tambien ingres&oacute; como texto de relleno en documentos electr&oacute;nicos, quedando esencialmente igual al original. Fue popularizado en los 60s con la creaci&oacute;n de las hojas &quot;Letraset&quot;, las cuales contenian pasajes de Lorem Ipsum, y m&aacute;s recientemente con software de autoedici&oacute;n, como por ejemplo Aldus PageMaker, el cual incluye versiones de Lorem Ipsum.</p>\r\n\r\n<h2>&iquest;Por qu&eacute; lo usamos?</h2>\r\n\r\n<p>Es un hecho establecido hace demasiado tiempo que un lector se distraer&aacute; con el contenido del texto de un sitio mientras que mira su dise&ntilde;o. El punto de usar Lorem Ipsum es que tiene una distribuci&oacute;n m&aacute;s o menos normal de las letras, al contrario de usar textos como por ejemplo &quot;Contenido aqu&iacute;, contenido aqu&iacute;&quot;. Estos textos hacen parecerlo un espa&ntilde;ol que se puede leer. Muchos paquetes de autoedici&oacute;n y editores de p&aacute;ginas web usan el Lorem Ipsum como su texto por defecto, y al hacer una b&uacute;squeda de &quot;Lorem Ipsum&quot; va a dar por resultado muchos sitios web que usan este texto si se encuentran en estado de desarrollo. Muchas versiones han evolucionado a trav&eacute;s de los a&ntilde;os, algunas veces por accidente, otras veces a prop&oacute;sito (por ejemplo insert&aacute;ndole humor y cosas por el estilo).</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>&iquest;De d&oacute;nde viene?</h2>\r\n\r\n<p>Al contrario del pensamiento popular, el texto de Lorem Ipsum no es simplemente texto aleatorio. Tiene sus raices en una pieza cl&acute;sica de la literatura del Latin, que data del a&ntilde;o 45 antes de Cristo, haciendo que este adquiera mas de 2000 a&ntilde;os de antiguedad. Richard McClintock, un profesor de Latin de la Universidad de Hampden-Sydney en Virginia, encontr&oacute; una de las palabras m&aacute;s oscuras de la lengua del lat&iacute;n, &quot;consecteur&quot;, en un pasaje de Lorem Ipsum, y al seguir leyendo distintos textos del lat&iacute;n, descubri&oacute; la fuente indudable. Lorem Ipsum viene de las secciones 1.10.32 y 1.10.33 de &quot;de Finnibus Bonorum et Malorum&quot; (Los Extremos del Bien y El Mal) por Cicero, escrito en el a&ntilde;o 45 antes de Cristo. Este libro es un tratado de teor&iacute;a de &eacute;ticas, muy popular durante el Renacimiento. La primera linea del Lorem Ipsum, &quot;Lorem ipsum dolor sit amet..&quot;, viene de una linea en la secci&oacute;n 1.10.32</p>\r\n\r\n<p>El trozo de texto est&aacute;ndar de Lorem Ipsum usado desde el a&ntilde;o 1500 es reproducido debajo para aquellos interesados. Las secciones 1.10.32 y 1.10.33 de &quot;de Finibus Bonorum et Malorum&quot; por Cicero son tambi&eacute;n reproducidas en su forma original exacta, acompa&ntilde;adas por versiones en Ingl&eacute;s de la traducci&oacute;n realizada en 1914 por H. Rackham.</p>', 0, '2021-03-07 20:24:35.937498', '2021-03-07 20:24:35.937498', 'sobre-nosotros'),
	(3, 'Bienvenido a Odisea RP', 'articles/login.PNG', '<h2>&iquest;Qu&eacute; es Lorem Ipsum?</h2>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno est&aacute;ndar de las industrias desde el a&ntilde;o 1500, cuando un impresor (N. del T. persona que se dedica a la imprenta) desconocido us&oacute; una galer&iacute;a de textos y los mezcl&oacute; de tal manera que logr&oacute; hacer un libro de textos especimen. No s&oacute;lo sobrevivi&oacute; 500 a&ntilde;os, sino que tambien ingres&oacute; como texto de relleno en documentos electr&oacute;nicos, quedando esencialmente igual al original. Fue popularizado en los 60s con la creaci&oacute;n de las hojas &quot;Letraset&quot;, las cuales contenian pasajes de Lorem Ipsum, y m&aacute;s recientemente con software de autoedici&oacute;n, como por ejemplo Aldus PageMaker, el cual incluye versiones de Lorem Ipsum.</p>\r\n\r\n<h2>&iquest;Por qu&eacute; lo usamos?</h2>\r\n\r\n<p>Es un hecho establecido hace demasiado tiempo que un lector se distraer&aacute; con el contenido del texto de un sitio mientras que mira su dise&ntilde;o. El punto de usar Lorem Ipsum es que tiene una distribuci&oacute;n m&aacute;s o menos normal de las letras, al contrario de usar textos como por ejemplo &quot;Contenido aqu&iacute;, contenido aqu&iacute;&quot;. Estos textos hacen parecerlo un espa&ntilde;ol que se puede leer. Muchos paquetes de autoedici&oacute;n y editores de p&aacute;ginas web usan el Lorem Ipsum como su texto por defecto, y al hacer una b&uacute;squeda de &quot;Lorem Ipsum&quot; va a dar por resultado muchos sitios web que usan este texto si se encuentran en estado de desarrollo. Muchas versiones han evolucionado a trav&eacute;s de los a&ntilde;os, algunas veces por accidente, otras veces a prop&oacute;sito (por ejemplo insert&aacute;ndole humor y cosas por el estilo).</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>&iquest;De d&oacute;nde viene?</h2>\r\n\r\n<p>Al contrario del pensamiento popular, el texto de Lorem Ipsum no es simplemente texto aleatorio. Tiene sus raices en una pieza cl&acute;sica de la literatura del Latin, que data del a&ntilde;o 45 antes de Cristo, haciendo que este adquiera mas de 2000 a&ntilde;os de antiguedad. Richard McClintock, un profesor de Latin de la Universidad de Hampden-Sydney en Virginia, encontr&oacute; una de las palabras m&aacute;s oscuras de la lengua del lat&iacute;n, &quot;consecteur&quot;, en un pasaje de Lorem Ipsum, y al seguir leyendo distintos textos del lat&iacute;n, descubri&oacute; la fuente indudable. Lorem Ipsum viene de las secciones 1.10.32 y 1.10.33 de &quot;de Finnibus Bonorum et Malorum&quot; (Los Extremos del Bien y El Mal) por Cicero, escrito en el a&ntilde;o 45 antes de Cristo. Este libro es un tratado de teor&iacute;a de &eacute;ticas, muy popular durante el Renacimiento. La primera linea del Lorem Ipsum, &quot;Lorem ipsum dolor sit amet..&quot;, viene de una linea en la secci&oacute;n 1.10.32</p>\r\n\r\n<p>El trozo de texto est&aacute;ndar de Lorem Ipsum usado desde el a&ntilde;o 1500 es reproducido debajo para aquellos interesados. Las secciones 1.10.32 y 1.10.33 de &quot;de Finibus Bonorum et Malorum&quot; por Cicero son tambi&eacute;n reproducidas en su forma original exacta, acompa&ntilde;adas por versiones en Ingl&eacute;s de la traducci&oacute;n realizada en 1914 por H. Rackham.</p>', 1, '2021-03-08 12:42:30.687696', '2021-03-07 20:25:43.497900', 'bienvenido-odisea-rp');
/*!40000 ALTER TABLE `blog_article` ENABLE KEYS */;

-- Volcando estructura para tabla es_extended.blog_article_categories
CREATE TABLE IF NOT EXISTS `blog_article_categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `article_id` int NOT NULL,
  `category_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `blog_article_categories_article_id_category_id_386f3009_uniq` (`article_id`,`category_id`),
  KEY `blog_article_categories_category_id_1ce80de0_fk_blog_category_id` (`category_id`),
  CONSTRAINT `blog_article_categories_article_id_a381b6b5_fk_blog_article_id` FOREIGN KEY (`article_id`) REFERENCES `blog_article` (`id`),
  CONSTRAINT `blog_article_categories_category_id_1ce80de0_fk_blog_category_id` FOREIGN KEY (`category_id`) REFERENCES `blog_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla es_extended.blog_article_categories: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `blog_article_categories` DISABLE KEYS */;
INSERT INTO `blog_article_categories` (`id`, `article_id`, `category_id`) VALUES
	(1, 3, 1);
/*!40000 ALTER TABLE `blog_article_categories` ENABLE KEYS */;

-- Volcando estructura para tabla es_extended.blog_category
CREATE TABLE IF NOT EXISTS `blog_category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla es_extended.blog_category: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `blog_category` DISABLE KEYS */;
INSERT INTO `blog_category` (`id`, `name`, `created_at`) VALUES
	(1, 'Noticias', '2021-03-07 20:23:17.196275');
/*!40000 ALTER TABLE `blog_category` ENABLE KEYS */;

-- Volcando estructura para tabla es_extended.cardealer_vehicles
CREATE TABLE IF NOT EXISTS `cardealer_vehicles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `vehicle` varchar(255) NOT NULL,
  `price` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla es_extended.cardealer_vehicles: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `cardealer_vehicles` DISABLE KEYS */;
/*!40000 ALTER TABLE `cardealer_vehicles` ENABLE KEYS */;

-- Volcando estructura para tabla es_extended.django_admin_log
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla es_extended.django_admin_log: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
	(1, '2021-03-07 20:20:26.992594', '1', 'http://localhost:8000/', 2, '[{"changed": {"fields": ["Domain name", "Display name"]}}]', 7, 1),
	(2, '2021-03-07 20:20:57.753219', '1', 'Odisea RP', 1, '[{"added": {}}]', 13, 1),
	(3, '2021-03-07 20:22:03.437259', '1', '76561198318390863', 3, '', 12, 1),
	(4, '2021-03-07 20:22:54.273493', '2', '76561198318390863', 3, '', 4, 1),
	(5, '2021-03-07 20:23:17.197272', '1', 'Noticias', 1, '[{"added": {}}]', 8, 1),
	(6, '2021-03-07 20:24:15.643825', '1', 'Tutorial de Como Jugar - NO BORRAR - Privado', 1, '[{"added": {}}]', 9, 1),
	(7, '2021-03-07 20:24:35.943482', '2', 'Sobre Nosotros - NO BORRAR - Privado', 1, '[{"added": {}}]', 9, 1),
	(8, '2021-03-07 20:24:42.118130', '1', 'Tutorial de Como Jugar - NO BORRAR - Privado', 2, '[{"changed": {"fields": ["Slug"]}}]', 9, 1),
	(9, '2021-03-07 20:25:43.561729', '3', 'Bienvenido a Odisea RP - Público', 1, '[{"added": {}}]', 9, 1),
	(10, '2021-03-07 23:21:41.776169', 'steam:110000115588e4f', 'Jose Martinez - Usuario (steam:110000115588e4f)', 2, '[{"changed": {"fields": ["Solbeta"]}}]', 24, 1),
	(11, '2021-03-07 23:23:04.514956', 'steam:110000115588e4f', 'Jose Manuel Martinez - Usuario (steam:110000115588e4f)', 2, '[{"changed": {"fields": ["Firstname"]}}]', 24, 1),
	(12, '2021-03-07 23:23:16.313668', 'steam:110000115588e4f', 'Jose Manuel Martinez - Usuario (steam:110000115588e4f)', 2, '[{"changed": {"fields": ["Beta", "Solbeta"]}}]', 24, 1),
	(13, '2021-03-07 23:24:00.921884', 'steam:110000115588e4f', 'Jose Manuel Martinez - Usuario (steam:110000115588e4f)', 2, '[{"changed": {"fields": ["Solbeta"]}}]', 24, 1),
	(14, '2021-03-07 23:24:08.711240', 'steam:110000115588e4f', 'Jose Manuel Martinez - Usuario (steam:110000115588e4f)', 2, '[{"changed": {"fields": ["Beta"]}}]', 24, 1),
	(15, '2021-03-07 23:25:08.408035', 'steam:110000115588e4f', 'Jose Manuel Martinez - Administrador (steam:110000115588e4f)', 2, '[{"changed": {"fields": ["Group"]}}]', 24, 1),
	(16, '2021-03-07 23:25:18.192574', 'steam:110000115588e4f', 'Jose Manuel Martinez - CEO (steam:110000115588e4f)', 2, '[{"changed": {"fields": ["Group"]}}]', 24, 1),
	(17, '2021-03-07 23:27:41.523981', 'steam:110000115588e4f', 'Jose Manuel Martinez - CEO (steam:110000115588e4f)', 2, '[{"changed": {"fields": ["Position"]}}]', 24, 1),
	(18, '2021-03-07 23:38:21.723473', 'steam:110000115588e4f', 'UserFivem object (steam:110000115588e4f)', 2, '[{"changed": {"fields": ["Solicitud Beta"]}}]', 24, 1),
	(19, '2021-03-07 23:38:30.507150', 'steam:110000115588e4f', 'UserFivem object (steam:110000115588e4f)', 2, '[{"changed": {"fields": ["Solicitud Beta"]}}]', 24, 1),
	(20, '2021-03-08 00:25:47.575848', 'steam:110000115588e4f', 'Jose Martinez - CEO (steam:110000115588e4f)', 2, '[{"changed": {"fields": ["Solicitud Beta"]}}]', 24, 1),
	(21, '2021-03-08 00:38:59.417095', 'steam:110000115588e4f', 'Jose Martinez - CEO (steam:110000115588e4f)', 2, '[{"changed": {"fields": ["Solicitud Beta"]}}]', 24, 1),
	(22, '2021-03-08 00:39:13.608455', 'steam:110000115588e4f', 'Jose Martinez - CEO (steam:110000115588e4f)', 2, '[{"changed": {"fields": ["Solicitud Beta"]}}]', 24, 1),
	(23, '2021-03-08 00:44:38.211754', 'steam:110000115588e4f', 'Jose Martinez - CEO (steam:110000115588e4f)', 2, '[{"changed": {"fields": ["Solicitud Beta"]}}]', 24, 1),
	(24, '2021-03-08 00:46:31.817190', 'steam:110000115588e4f', 'Jose Martinez - CEO (steam:110000115588e4f)', 2, '[{"changed": {"fields": ["Solicitud Beta", "Correo Electr\\u00f3nico", "Apellidos"]}}]', 24, 1),
	(25, '2021-03-08 00:52:42.009979', 'steam:110000115588e4f', 'Jose Martinez - CEO (steam:110000115588e4f)', 2, '[{"changed": {"fields": ["Solicitud Beta"]}}]', 24, 1),
	(26, '2021-03-08 00:53:42.604910', 'steam:110000115588e4f', 'Jose Martinez - CEO (steam:110000115588e4f)', 2, '[{"changed": {"fields": ["Solicitud Beta"]}}]', 24, 1),
	(27, '2021-03-08 00:59:53.632139', 'steam:110000115588e4f', 'Jose Martinez - CEO (steam:110000115588e4f)', 2, '[{"changed": {"fields": ["Solicitud Beta", "Fecha de Nacimiento"]}}]', 24, 1),
	(28, '2021-03-08 01:00:20.359097', 'steam:110000115588e4f', 'Jose Martinez - CEO (steam:110000115588e4f)', 2, '[{"changed": {"fields": ["Solicitud Beta", "Fecha de Nacimiento"]}}]', 24, 1),
	(29, '2021-03-08 01:01:16.103521', 'steam:110000115588e4f', 'Jose Martinez - CEO (steam:110000115588e4f)', 2, '[{"changed": {"fields": ["Solicitud Beta", "Fecha de Nacimiento"]}}]', 24, 1),
	(30, '2021-03-08 01:01:59.132796', 'steam:110000115588e4f', 'Jose Martinez - CEO (steam:110000115588e4f)', 2, '[{"changed": {"fields": ["Solicitud Beta", "Fecha de Nacimiento"]}}]', 24, 1),
	(31, '2021-03-08 01:03:12.026729', 'steam:110000115588e4f', 'Jose Martinez - CEO (steam:110000115588e4f)', 2, '[{"changed": {"fields": ["Solicitud Beta", "Fecha de Nacimiento"]}}]', 24, 1),
	(32, '2021-03-08 01:04:46.894229', 'steam:110000115588e4f', 'Jose Martinez - CEO (steam:110000115588e4f)', 2, '[{"changed": {"fields": ["Solicitud Beta", "Fecha de Nacimiento"]}}]', 24, 1),
	(33, '2021-03-08 01:05:16.624746', 'steam:110000115588e4f', 'Jose Martinez - CEO (steam:110000115588e4f)', 2, '[{"changed": {"fields": ["Solicitud Beta", "Fecha de Nacimiento"]}}]', 24, 1),
	(34, '2021-03-08 01:06:00.409618', 'steam:110000115588e4f', 'Jose Martinez - CEO (steam:110000115588e4f)', 2, '[{"changed": {"fields": ["Solicitud Beta", "Fecha de Nacimiento"]}}]', 24, 1),
	(35, '2021-03-08 01:06:52.521915', 'steam:110000115588e4f', 'Jose Martinez - CEO (steam:110000115588e4f)', 2, '[{"changed": {"fields": ["Solicitud Beta", "Fecha de Nacimiento"]}}]', 24, 1),
	(36, '2021-03-08 01:07:49.515021', 'steam:110000115588e4f', 'Jose Martinez - CEO (steam:110000115588e4f)', 2, '[{"changed": {"fields": ["Solicitud Beta", "Fecha de Nacimiento"]}}]', 24, 1),
	(37, '2021-03-08 01:08:17.108194', 'steam:110000115588e4f', 'Jose Martinez - CEO (steam:110000115588e4f)', 2, '[{"changed": {"fields": ["Solicitud Beta", "Fecha de Nacimiento"]}}]', 24, 1),
	(38, '2021-03-08 01:10:17.604718', 'steam:110000115588e4f', 'Jose Martinez - CEO (steam:110000115588e4f)', 2, '[{"changed": {"fields": ["Solicitud Beta", "Fecha de Nacimiento"]}}]', 24, 1),
	(39, '2021-03-08 01:10:48.177535', 'steam:110000115588e4f', 'Jose Martinez - CEO (steam:110000115588e4f)', 2, '[{"changed": {"fields": ["Solicitud Beta", "Fecha de Nacimiento"]}}]', 24, 1),
	(40, '2021-03-08 01:11:17.427358', 'steam:110000115588e4f', 'Jose Martinez - CEO (steam:110000115588e4f)', 2, '[{"changed": {"fields": ["Solicitud Beta", "Fecha de Nacimiento"]}}]', 24, 1),
	(41, '2021-03-08 01:11:56.330563', 'steam:110000115588e4f', 'Jose Martinez - CEO (steam:110000115588e4f)', 2, '[{"changed": {"fields": ["Solicitud Beta", "Fecha de Nacimiento"]}}]', 24, 1),
	(42, '2021-03-08 01:12:21.561088', 'steam:110000115588e4f', 'Jose Martinez - CEO (steam:110000115588e4f)', 2, '[{"changed": {"fields": ["Solicitud Beta", "Fecha de Nacimiento"]}}]', 24, 1),
	(43, '2021-03-08 01:22:36.418240', 'steam:110000115588e4f', 'Jose Martinez - CEO (steam:110000115588e4f)', 2, '[{"changed": {"fields": ["Solicitud Beta", "Fecha de Nacimiento"]}}]', 24, 1),
	(44, '2021-03-08 01:23:14.663141', 'steam:110000115588e4f', 'Jose Martinez - CEO (steam:110000115588e4f)', 2, '[{"changed": {"fields": ["Solicitud Beta", "Fecha de Nacimiento"]}}]', 24, 1),
	(45, '2021-03-08 01:24:42.104434', 'steam:110000115588e4f', 'Jose Martinez - CEO (steam:110000115588e4f)', 2, '[{"changed": {"fields": ["Solicitud Beta", "Correo Electr\\u00f3nico", "Fecha de Nacimiento"]}}]', 24, 1),
	(46, '2021-03-08 01:25:41.712549', 'steam:110000115588e4f', 'Jose Martinez - CEO (steam:110000115588e4f)', 2, '[{"changed": {"fields": ["Solicitud Beta", "Fecha de Nacimiento"]}}]', 24, 1),
	(47, '2021-03-08 01:31:58.380575', 'steam:110000115588e4f', 'Jose Martinez - CEO (steam:110000115588e4f)', 2, '[{"changed": {"fields": ["Solicitud Beta", "Fecha de Nacimiento"]}}]', 24, 1),
	(48, '2021-03-08 01:32:35.002380', 'steam:110000115588e4f', 'Jose Martinez - CEO (steam:110000115588e4f)', 2, '[{"changed": {"fields": ["Solicitud Beta", "Fecha de Nacimiento"]}}]', 24, 1),
	(49, '2021-03-08 01:33:20.628699', 'steam:110000115588e4f', 'Jose Martinez - CEO (steam:110000115588e4f)', 2, '[{"changed": {"fields": ["Solicitud Beta", "Correo Electr\\u00f3nico", "Nombre", "Apellidos", "Fecha de Nacimiento"]}}]', 24, 1),
	(50, '2021-03-08 01:35:08.950924', 'steam:110000115588e4f', 'Jose Martinez - CEO (steam:110000115588e4f)', 2, '[]', 24, 1),
	(51, '2021-03-08 01:37:07.326521', 'steam:110000115588e4f', 'Jose Martinez - CEO (steam:110000115588e4f)', 2, '[{"changed": {"fields": ["Solicitud Beta", "Correo Electr\\u00f3nico", "Nombre", "Apellidos", "Fecha de Nacimiento"]}}]', 24, 1),
	(52, '2021-03-08 01:38:21.313958', 'steam:110000115588e4f', 'Jose Martinez - CEO (steam:110000115588e4f)', 2, '[{"changed": {"fields": ["Solicitud Beta", "Correo Electr\\u00f3nico", "Nombre", "Apellidos", "Fecha de Nacimiento"]}}]', 24, 1),
	(53, '2021-03-08 01:40:46.387438', 'steam:110000115588e4f', 'Jose Martinez - CEO (steam:110000115588e4f)', 2, '[{"changed": {"fields": ["Solicitud Beta", "Fecha de Nacimiento"]}}]', 24, 1),
	(54, '2021-03-08 10:32:24.640253', 'steam:110000115588e4f', 'Jose Martinez - CEO (steam:110000115588e4f)', 2, '[{"changed": {"fields": ["Solicitud Beta"]}}]', 24, 1),
	(55, '2021-03-08 10:51:45.347040', '1', 'steam:110000115588e4f', 1, '[{"added": {}}]', 25, 1),
	(56, '2021-03-08 10:51:58.517831', '1', 'steam:110000115588e4f', 2, '[{"changed": {"fields": ["Aprobado"]}}]', 25, 1),
	(57, '2021-03-08 10:52:04.807019', 'steam:110000115588e4f', 'Jose Martinez - CEO (steam:110000115588e4f)', 2, '[{"changed": {"fields": ["Whitelisted"]}}]', 24, 1),
	(58, '2021-03-08 10:54:31.668422', '1', 'steam:110000115588e4f', 3, '', 25, 1),
	(61, '2021-03-08 12:27:07.825673', '1', '¿Cómo jugar a Odisea RP? - NO BORRAR - Privado', 2, '[{"changed": {"fields": ["T\\u00edtulo"]}}]', 9, 12),
	(62, '2021-03-08 12:34:03.811691', '1', '¿Cómo jugar a Odisea RP? - NO BORRAR - Privado', 2, '[]', 9, 12),
	(63, '2021-03-08 12:35:19.818507', 'steam:110000115588e4f', 'Jose Martinez - Usuario (steam:110000115588e4f)', 2, '[{"changed": {"fields": ["Beta Tester"]}}]', 24, 12),
	(64, '2021-03-08 12:41:22.823902', '12', 'Beniszkee', 2, '[{"changed": {"fields": ["First name", "Last name", "Email address"]}}]', 4, 12),
	(65, '2021-03-08 12:41:33.561721', '12', 'Beniszkee', 2, '[{"changed": {"fields": ["password"]}}]', 4, 12),
	(66, '2021-03-08 12:42:30.688692', '3', 'Bienvenido a Odisea RP - Público', 2, '[{"changed": {"fields": ["Im\\u00e1gen"]}}]', 9, 12);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;

-- Volcando estructura para tabla es_extended.django_content_type
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla es_extended.django_content_type: ~25 rows (aproximadamente)
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
	(10, 'account', 'emailaddress'),
	(11, 'account', 'emailconfirmation'),
	(1, 'admin', 'logentry'),
	(3, 'auth', 'group'),
	(2, 'auth', 'permission'),
	(4, 'auth', 'user'),
	(24, 'backfivem', 'userfivem'),
	(25, 'backfivem', 'userwhitelist'),
	(9, 'blog', 'article'),
	(8, 'blog', 'category'),
	(5, 'contenttypes', 'contenttype'),
	(21, 'main', 'fiv'),
	(22, 'main', 'five'),
	(19, 'main', 'fivem'),
	(23, 'main', 'fiveuser'),
	(20, 'main', 'fivm'),
	(17, 'main', 'user'),
	(18, 'main', 'userfivem'),
	(15, 'openid', 'openidnonce'),
	(16, 'openid', 'openidstore'),
	(6, 'sessions', 'session'),
	(7, 'sites', 'site'),
	(12, 'socialaccount', 'socialaccount'),
	(13, 'socialaccount', 'socialapp'),
	(14, 'socialaccount', 'socialtoken');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;

-- Volcando estructura para tabla es_extended.django_migrations
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla es_extended.django_migrations: ~62 rows (aproximadamente)
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
	(1, 'contenttypes', '0001_initial', '2021-03-07 20:12:42.334812'),
	(2, 'auth', '0001_initial', '2021-03-07 20:12:43.468330'),
	(3, 'account', '0001_initial', '2021-03-07 20:12:49.160219'),
	(4, 'account', '0002_email_max_length', '2021-03-07 20:12:50.734534'),
	(5, 'admin', '0001_initial', '2021-03-07 20:12:50.935997'),
	(6, 'admin', '0002_logentry_remove_auto_add', '2021-03-07 20:12:52.787575'),
	(7, 'admin', '0003_logentry_add_action_flag_choices', '2021-03-07 20:12:52.820488'),
	(8, 'contenttypes', '0002_remove_content_type_name', '2021-03-07 20:12:53.392982'),
	(9, 'auth', '0002_alter_permission_name_max_length', '2021-03-07 20:12:54.116048'),
	(10, 'auth', '0003_alter_user_email_max_length', '2021-03-07 20:12:54.200822'),
	(11, 'auth', '0004_alter_user_username_opts', '2021-03-07 20:12:54.297565'),
	(12, 'auth', '0005_alter_user_last_login_null', '2021-03-07 20:12:55.259015'),
	(13, 'auth', '0006_require_contenttypes_0002', '2021-03-07 20:12:55.384680'),
	(14, 'auth', '0007_alter_validators_add_error_messages', '2021-03-07 20:12:55.433549'),
	(15, 'auth', '0008_alter_user_username_max_length', '2021-03-07 20:12:55.637517'),
	(16, 'auth', '0009_alter_user_last_name_max_length', '2021-03-07 20:12:56.083827'),
	(17, 'auth', '0010_alter_group_name_max_length', '2021-03-07 20:12:56.258865'),
	(18, 'auth', '0011_update_proxy_permissions', '2021-03-07 20:12:56.390525'),
	(19, 'auth', '0012_alter_user_first_name_max_length', '2021-03-07 20:12:56.467320'),
	(20, 'blog', '0001_initial', '2021-03-07 20:12:57.442220'),
	(21, 'blog', '0002_auto_20210305_1754', '2021-03-07 20:13:00.951915'),
	(22, 'blog', '0003_delete_articlesincategory', '2021-03-07 20:13:05.605087'),
	(23, 'blog', '0004_article_slug', '2021-03-07 20:13:05.841458'),
	(24, 'blog', '0005_auto_20210306_1753', '2021-03-07 20:13:06.050896'),
	(25, 'blog', '0006_auto_20210306_1823', '2021-03-07 20:13:06.619895'),
	(26, 'openid', '0001_initial', '2021-03-07 20:13:07.046267'),
	(27, 'sessions', '0001_initial', '2021-03-07 20:13:07.341477'),
	(28, 'sites', '0001_initial', '2021-03-07 20:13:08.216669'),
	(29, 'sites', '0002_alter_domain_unique', '2021-03-07 20:13:08.448567'),
	(30, 'socialaccount', '0001_initial', '2021-03-07 20:13:10.467715'),
	(31, 'socialaccount', '0002_token_max_lengths', '2021-03-07 20:13:15.932704'),
	(32, 'socialaccount', '0003_extra_data_default_dict', '2021-03-07 20:13:15.980576'),
	(33, 'socialaccount', '0004_socialaccount_beta', '2021-03-07 20:13:16.127184'),
	(34, 'socialaccount', '0005_socialaccount_identificador', '2021-03-07 20:13:16.207474'),
	(35, 'socialaccount', '0006_auto_20210307_1608', '2021-03-07 20:13:17.222311'),
	(36, 'socialaccount', '0007_auto_20210307_1748', '2021-03-07 20:13:17.299107'),
	(37, 'socialaccount', '0008_socialaccount_solbeta', '2021-03-07 20:13:17.459678'),
	(38, 'main', '0001_initial', '2021-03-07 20:48:28.162578'),
	(39, 'main', '0002_auto_20210307_2153', '2021-03-07 20:53:53.622500'),
	(40, 'main', '0003_auto_20210307_2200', '2021-03-07 21:00:56.602314'),
	(41, 'main', '0004_auto_20210307_2219', '2021-03-07 21:21:31.116929'),
	(42, 'main', '0005_delete_myusers', '2021-03-07 21:21:31.143857'),
	(43, 'main', '0006_user', '2021-03-07 21:23:25.144047'),
	(44, 'main', '0007_auto_20210307_2256', '2021-03-07 22:01:38.329536'),
	(45, 'main', '0008_auto_20210307_2257', '2021-03-07 22:04:19.765508'),
	(46, 'main', '0009_auto_20210307_2257', '2021-03-07 22:10:50.469680'),
	(47, 'main', '0010_auto_20210307_2258', '2021-03-07 22:10:50.630253'),
	(48, 'main', '0011_remove_userfivem_userid', '2021-03-07 22:10:50.728493'),
	(49, 'main', '0012_userfivem_iduser', '2021-03-07 22:10:51.743818'),
	(50, 'main', '0013_auto_20210307_2306', '2021-03-07 22:10:52.643913'),
	(51, 'main', '0014_auto_20210307_2309', '2021-03-07 22:18:20.020302'),
	(52, 'main', '0002_auto_20210307_2328', '2021-03-07 22:28:36.187040'),
	(53, 'backfivem', '0001_initial', '2021-03-07 22:45:23.238768'),
	(54, 'backfivem', '0002_auto_20210307_2347', '2021-03-07 22:47:41.330756'),
	(55, 'backfivem', '0003_auto_20210307_2348', '2021-03-07 22:48:38.224382'),
	(56, 'backfivem', '0004_auto_20210308_0000', '2021-03-07 23:00:56.643353'),
	(57, 'backfivem', '0005_auto_20210308_0010', '2021-03-07 23:10:17.118085'),
	(58, 'backfivem', '0006_auto_20210308_0019', '2021-03-07 23:19:22.300622'),
	(59, 'backfivem', '0007_auto_20210308_0022', '2021-03-07 23:22:47.737343'),
	(60, 'backfivem', '0008_auto_20210308_1146', '2021-03-08 10:48:39.457368'),
	(61, 'backfivem', '0009_remove_userfivem_whitelisted', '2021-03-08 12:32:06.631811'),
	(62, 'blog', '0007_auto_20210308_1333', '2021-03-08 12:33:34.631696');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;

-- Volcando estructura para tabla es_extended.django_session
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla es_extended.django_session: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
	('mfywzm85sb81ompfmi1x8hkyjznm3jcd', '.eJydVEuPmzoY_S9s20UwclsqdZFwAwkB0oGAgasKGZsZIAas4ZVQ9b_XnsxkdNVVbzbEcHz8nQf8VLIrplWf9cXzVJGiz7KOF21FM9K1_dgUz5nyVXlaB5E2b9e3n-Galj6nCPLUgDBBPidXOCQIlimIrmw_nxAyzzj2TmlsA4w8dkLmmCDKCA9OzGg2bAfCw352ieaXpPV53tBHGtu92Fvinb8iO_eTc9UXakVljrwpR6qaN2xVBLDOwWrKtQ0T67PA28XtrP-7f0_EzLRhdRofwzgNXEPzGNE8ngP4iEEEJWessTK12BLLZ23KExAtsapPxIpGjPzHBOgj0aJB6H2UnDHwVNLaLG-DsN6Ur7iH8R23HyWfWIM0PghM9F1igtC_e-YjeCaWziXHGT7wp9TXmVG5RuP1CWJDKs7FKAhP3Xy4aYiusRZdcztwbVCu6G6zHKsvk_CYJUgVutWBiszo7iznGBzwlqHe54DynAvtsQ_FHNJLTqBPhZb2xc9_usnRPIH3Fqe5Zz-m8cOUxNEKG1-uTr2e3uZgluUa1mVKgNnHQPi8_eQawCvzRhc-iOuWbV_utdEiddwyPIbVfg6kL8S6lEWk81R4Qi3WYCQ4t1BN2qhynr59Uz4qf9SU4X7Ihu5ctK-F_TCv74W13gsrjIALRSojFZTFqXMtlcV0zfAFY_vmPWQzb_w5B2yk9n-Ke0jApcSCIzXFkLZ_rNd8kcHJArwWsf2bIjrgMqXiHFloumNzGukqadjCTBDWBu3ozp9vYW5YornjfV8DGTX0ksZ-5yz70TX01zkOYZLM-9zS6wRd3oriiEBGoZ_LYILwVh4ae1LH7UWGwb7e2NKXObdMKMMTnqwwSrnkPL0H0HekwgwT0o3tkPUDHgrl678_Ff7cic9IL0Jg3VPVSiQRWYm1-IvHocw4fsaNBCi_Pir-8nmdjGv16IyO8uPXb8qtj5U:1lJFGX:zOFWzBRkksNm8Eqkjfw7Igh7Hy-Rcq29WEWoYzQ40lQ', '2021-03-22 12:45:41.203783'),
	('mxpxvfjo12tvk7y1mc4m2o81tzkd61xx', '.eJxVjMEOgyAQRP-Fc0Nk3YXSW_0RsywYSQ0mFU5N_73aeGiP82bmvdTIrc5j29JzzFHdlAF1-YWB5ZHK0fCyHFizyNpK1d_NWW_6vqdUahaueS3D-fpTzbzNuwcoIRF6MAhse-dSSN5CDCjBkdir9972EAm6KJM3hITWBGekm9hBp94ftfI7Yg:1lJFCX:x2HoFBB8o4sK-XhbD-SDsTXHQrINM08bS_bs1sAYDZ4', '2021-03-22 12:41:33.719300'),
	('w8tjw1gxmikps4j1ffbtuiq4ktkej4ct', 'eyJhY2NvdW50X3ZlcmlmaWVkX2VtYWlsIjpudWxsLCJhY2NvdW50X3VzZXIiOiI4In0:1lJE1W:j1nZyTyuog1qMFx_RBWDlSaysQgJsnTrzXLW0BepvCM', '2021-03-22 11:26:06.300205');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;

-- Volcando estructura para tabla es_extended.django_site
CREATE TABLE IF NOT EXISTS `django_site` (
  `id` int NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_site_domain_a2e37b91_uniq` (`domain`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla es_extended.django_site: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;
INSERT INTO `django_site` (`id`, `domain`, `name`) VALUES
	(1, 'http://localhost:8000/', 'Odisea RP');
/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;

-- Volcando estructura para tabla es_extended.items
CREATE TABLE IF NOT EXISTS `items` (
  `name` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `weight` int NOT NULL DEFAULT '1',
  `limit` int NOT NULL DEFAULT '10',
  `rare` tinyint NOT NULL DEFAULT '0',
  `can_remove` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla es_extended.items: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`) VALUES
	('bread', 'Pain', 1, 10, 0, 1),
	('water', 'Eau', 1, 10, 0, 1);
/*!40000 ALTER TABLE `items` ENABLE KEYS */;

-- Volcando estructura para tabla es_extended.jobs
CREATE TABLE IF NOT EXISTS `jobs` (
  `name` varchar(50) NOT NULL,
  `label` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla es_extended.jobs: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
INSERT INTO `jobs` (`name`, `label`) VALUES
	('cardealer', 'Concessionnaire'),
	('unemployed', 'Unemployed');
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;

-- Volcando estructura para tabla es_extended.job_grades
CREATE TABLE IF NOT EXISTS `job_grades` (
  `id` int NOT NULL AUTO_INCREMENT,
  `job_name` varchar(50) DEFAULT NULL,
  `grade` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `salary` int NOT NULL,
  `skin_male` longtext NOT NULL,
  `skin_female` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla es_extended.job_grades: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `job_grades` DISABLE KEYS */;
INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
	(1, 'unemployed', 0, 'unemployed', 'Unemployed', 50, '{}', '{}'),
	(2, 'cardealer', 0, 'recruit', 'Recrue', 10, '{}', '{}'),
	(3, 'cardealer', 1, 'novice', 'Novice', 25, '{}', '{}'),
	(4, 'cardealer', 2, 'experienced', 'Experimente', 40, '{}', '{}'),
	(5, 'cardealer', 3, 'boss', 'Patron', 0, '{}', '{}');
/*!40000 ALTER TABLE `job_grades` ENABLE KEYS */;

-- Volcando estructura para tabla es_extended.openid_openidnonce
CREATE TABLE IF NOT EXISTS `openid_openidnonce` (
  `id` int NOT NULL AUTO_INCREMENT,
  `server_url` varchar(255) NOT NULL,
  `timestamp` int NOT NULL,
  `salt` varchar(255) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla es_extended.openid_openidnonce: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `openid_openidnonce` DISABLE KEYS */;
INSERT INTO `openid_openidnonce` (`id`, `server_url`, `timestamp`, `salt`, `date_created`) VALUES
	(1, 'https://steamcommunity.com/openid/login', 1615148044, '+vlItAcSusarwb0wW4oIJ2+yHBo=', '2021-03-07 20:14:05.648836'),
	(2, 'https://steamcommunity.com/openid/login', 1615148120, 'tPU2V9PdDB4ayDFoOE5U43a4JSE=', '2021-03-07 20:15:21.039438'),
	(3, 'https://steamcommunity.com/openid/login', 1615148246, 'V/2pKxwioJv1/dy5Rm8GQ+afO2g=', '2021-03-07 20:17:27.191591'),
	(4, 'https://steamcommunity.com/openid/login', 1615148488, 'Cmvt69jlrX/x6HYIO/DwsKkObf4=', '2021-03-07 20:21:28.935655'),
	(5, 'https://steamcommunity.com/openid/login', 1615148535, 'oOvLHLV6V3Z/pR+YcO8HAJIH74Y=', '2021-03-07 20:22:15.928171'),
	(6, 'https://steamcommunity.com/openid/login', 1615158415, 'LYQdz4LAbEVY+S70ZRuYTlJtAhI=', '2021-03-07 23:06:56.287109'),
	(7, 'https://steamcommunity.com/openid/login', 1615201270, 'vu1w315w2iKL7Je2CYDCS9fENfQ=', '2021-03-08 11:01:12.009355'),
	(8, 'https://steamcommunity.com/openid/login', 1615201340, 'SivqT6Lwnfc79JcMwi8xkuFIT5w=', '2021-03-08 11:02:21.585886'),
	(9, 'https://steamcommunity.com/openid/login', 1615201879, 'KwybhMX/jBmtVl1TU837dEvWeRM=', '2021-03-08 11:11:20.974700'),
	(10, 'https://steamcommunity.com/openid/login', 1615202053, 'SqE86azJVgzJOkRWza5YM+6NV8U=', '2021-03-08 11:14:14.983377'),
	(11, 'https://steamcommunity.com/openid/login', 1615202294, 'ooReRuW8+PhC2AVnbIWUn/57RKw=', '2021-03-08 11:18:15.963801'),
	(12, 'https://steamcommunity.com/openid/login', 1615202764, 'ovN0XoKb+WiCEGA+rUWCW0rNHCE=', '2021-03-08 11:26:05.879331'),
	(13, 'https://steamcommunity.com/openid/login', 1615202810, 'abC//525ItiYTrtAmcD3wigiq5w=', '2021-03-08 11:26:52.700169'),
	(14, 'https://steamcommunity.com/openid/login', 1615203817, 'Bm/PEiD2H3DDt0hklsnunYvOt0k=', '2021-03-08 11:43:39.001846'),
	(15, 'https://steamcommunity.com/openid/login', 1615205833, 'UalzsaxPgoV7n7eABIB1BwUN344=', '2021-03-08 12:17:14.839787'),
	(16, 'https://steamcommunity.com/openid/login', 1615206220, 'Ikt6jTXUSEVu/tG3W8zCv3zuSYc=', '2021-03-08 12:23:41.926421'),
	(17, 'https://steamcommunity.com/openid/login', 1615206267, '8VMz9MPrUtCcAzLe5KzrApIv1qQ=', '2021-03-08 12:24:28.128960');
/*!40000 ALTER TABLE `openid_openidnonce` ENABLE KEYS */;

-- Volcando estructura para tabla es_extended.openid_openidstore
CREATE TABLE IF NOT EXISTS `openid_openidstore` (
  `id` int NOT NULL AUTO_INCREMENT,
  `server_url` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `secret` longtext NOT NULL,
  `issued` int NOT NULL,
  `lifetime` int NOT NULL,
  `assoc_type` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla es_extended.openid_openidstore: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `openid_openidstore` DISABLE KEYS */;
/*!40000 ALTER TABLE `openid_openidstore` ENABLE KEYS */;

-- Volcando estructura para tabla es_extended.owned_vehicles
CREATE TABLE IF NOT EXISTS `owned_vehicles` (
  `vehicle` longtext NOT NULL,
  `owner` varchar(60) NOT NULL,
  `stored` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'State of the vehicle',
  `garage_name` varchar(50) NOT NULL DEFAULT 'Garage_Centre',
  `pound` tinyint(1) NOT NULL DEFAULT '0',
  `vehiclename` varchar(50) DEFAULT NULL,
  `plate` varchar(50) NOT NULL,
  `type` varchar(10) NOT NULL DEFAULT 'car',
  `job` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`plate`),
  KEY `vehsowned` (`owner`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla es_extended.owned_vehicles: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `owned_vehicles` DISABLE KEYS */;
/*!40000 ALTER TABLE `owned_vehicles` ENABLE KEYS */;

-- Volcando estructura para tabla es_extended.rented_vehicles
CREATE TABLE IF NOT EXISTS `rented_vehicles` (
  `vehicle` varchar(60) NOT NULL,
  `plate` varchar(12) NOT NULL,
  `player_name` varchar(255) NOT NULL,
  `base_price` int NOT NULL,
  `rent_price` int NOT NULL,
  `owner` varchar(22) NOT NULL,
  PRIMARY KEY (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla es_extended.rented_vehicles: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `rented_vehicles` DISABLE KEYS */;
/*!40000 ALTER TABLE `rented_vehicles` ENABLE KEYS */;

-- Volcando estructura para tabla es_extended.shops
CREATE TABLE IF NOT EXISTS `shops` (
  `id` int NOT NULL AUTO_INCREMENT,
  `store` varchar(100) NOT NULL,
  `item` varchar(100) NOT NULL,
  `price` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla es_extended.shops: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `shops` DISABLE KEYS */;
INSERT INTO `shops` (`id`, `store`, `item`, `price`) VALUES
	(1, 'TwentyFourSeven', 'bread', 30),
	(2, 'TwentyFourSeven', 'water', 15),
	(3, 'RobsLiquor', 'bread', 30),
	(4, 'RobsLiquor', 'water', 15),
	(5, 'LTDgasoline', 'bread', 30),
	(6, 'LTDgasoline', 'water', 15);
/*!40000 ALTER TABLE `shops` ENABLE KEYS */;

-- Volcando estructura para tabla es_extended.socialaccount_socialaccount
CREATE TABLE IF NOT EXISTS `socialaccount_socialaccount` (
  `id` int NOT NULL AUTO_INCREMENT,
  `provider` varchar(30) NOT NULL,
  `uid` varchar(191) NOT NULL,
  `last_login` datetime(6) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `extra_data` longtext NOT NULL,
  `user_id` int NOT NULL,
  `beta` tinyint(1) NOT NULL,
  `identifier` varchar(550) DEFAULT NULL,
  `Solbeta` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialaccount_provider_uid_fc810c6e_uniq` (`provider`,`uid`),
  KEY `socialaccount_socialaccount_user_id_8146e70c_fk_auth_user_id` (`user_id`),
  CONSTRAINT `socialaccount_socialaccount_user_id_8146e70c_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla es_extended.socialaccount_socialaccount: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `socialaccount_socialaccount` DISABLE KEYS */;
INSERT INTO `socialaccount_socialaccount` (`id`, `provider`, `uid`, `last_login`, `date_joined`, `extra_data`, `user_id`, `beta`, `identifier`, `Solbeta`) VALUES
	(11, 'steam', '76561198318390863', '2021-03-08 12:24:28.740328', '2021-03-08 12:24:28.489995', '{"steamid": "76561198318390863", "communityvisibilitystate": 3, "profilestate": 1, "personaname": "\\u272a Beniszkee", "commentpermission": 1, "profileurl": "https://steamcommunity.com/id/Beniszkee/", "avatar": "https://steamcdn-a.akamaihd.net/steamcommunity/public/images/avatars/e2/e2e5fcddf34fd608357e26f4fca4e9a30e0d0d12.jpg", "avatarmedium": "https://steamcdn-a.akamaihd.net/steamcommunity/public/images/avatars/e2/e2e5fcddf34fd608357e26f4fca4e9a30e0d0d12_medium.jpg", "avatarfull": "https://steamcdn-a.akamaihd.net/steamcommunity/public/images/avatars/e2/e2e5fcddf34fd608357e26f4fca4e9a30e0d0d12_full.jpg", "avatarhash": "e2e5fcddf34fd608357e26f4fca4e9a30e0d0d12", "lastlogoff": 1615167883, "personastate": 0, "realname": "Error 204", "primaryclanid": "103582791439274710", "timecreated": 1468260686, "personastateflags": 0}', 12, 0, 'Grabado', 0);
/*!40000 ALTER TABLE `socialaccount_socialaccount` ENABLE KEYS */;

-- Volcando estructura para tabla es_extended.socialaccount_socialapp
CREATE TABLE IF NOT EXISTS `socialaccount_socialapp` (
  `id` int NOT NULL AUTO_INCREMENT,
  `provider` varchar(30) NOT NULL,
  `name` varchar(40) NOT NULL,
  `client_id` varchar(191) NOT NULL,
  `secret` varchar(191) NOT NULL,
  `key` varchar(191) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla es_extended.socialaccount_socialapp: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `socialaccount_socialapp` DISABLE KEYS */;
INSERT INTO `socialaccount_socialapp` (`id`, `provider`, `name`, `client_id`, `secret`, `key`) VALUES
	(1, 'steam', 'Odisea RP', '353282C1DF6846F4B98F7F7D17BE99DE', '353282C1DF6846F4B98F7F7D17BE99DE', '');
/*!40000 ALTER TABLE `socialaccount_socialapp` ENABLE KEYS */;

-- Volcando estructura para tabla es_extended.socialaccount_socialapp_sites
CREATE TABLE IF NOT EXISTS `socialaccount_socialapp_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `socialapp_id` int NOT NULL,
  `site_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialapp_sites_socialapp_id_site_id_71a9a768_uniq` (`socialapp_id`,`site_id`),
  KEY `socialaccount_socialapp_sites_site_id_2579dee5_fk_django_site_id` (`site_id`),
  CONSTRAINT `socialaccount_social_socialapp_id_97fb6e7d_fk_socialacc` FOREIGN KEY (`socialapp_id`) REFERENCES `socialaccount_socialapp` (`id`),
  CONSTRAINT `socialaccount_socialapp_sites_site_id_2579dee5_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla es_extended.socialaccount_socialapp_sites: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `socialaccount_socialapp_sites` DISABLE KEYS */;
INSERT INTO `socialaccount_socialapp_sites` (`id`, `socialapp_id`, `site_id`) VALUES
	(1, 1, 1);
/*!40000 ALTER TABLE `socialaccount_socialapp_sites` ENABLE KEYS */;

-- Volcando estructura para tabla es_extended.socialaccount_socialtoken
CREATE TABLE IF NOT EXISTS `socialaccount_socialtoken` (
  `id` int NOT NULL AUTO_INCREMENT,
  `token` longtext NOT NULL,
  `token_secret` longtext NOT NULL,
  `expires_at` datetime(6) DEFAULT NULL,
  `account_id` int NOT NULL,
  `app_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialtoken_app_id_account_id_fca4e0ac_uniq` (`app_id`,`account_id`),
  KEY `socialaccount_social_account_id_951f210e_fk_socialacc` (`account_id`),
  CONSTRAINT `socialaccount_social_account_id_951f210e_fk_socialacc` FOREIGN KEY (`account_id`) REFERENCES `socialaccount_socialaccount` (`id`),
  CONSTRAINT `socialaccount_social_app_id_636a42d7_fk_socialacc` FOREIGN KEY (`app_id`) REFERENCES `socialaccount_socialapp` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla es_extended.socialaccount_socialtoken: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `socialaccount_socialtoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `socialaccount_socialtoken` ENABLE KEYS */;

-- Volcando estructura para tabla es_extended.society_moneywash
CREATE TABLE IF NOT EXISTS `society_moneywash` (
  `id` int NOT NULL AUTO_INCREMENT,
  `identifier` varchar(60) NOT NULL,
  `society` varchar(60) NOT NULL,
  `amount` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla es_extended.society_moneywash: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `society_moneywash` DISABLE KEYS */;
/*!40000 ALTER TABLE `society_moneywash` ENABLE KEYS */;

-- Volcando estructura para tabla es_extended.users
CREATE TABLE IF NOT EXISTS `users` (
  `identifier` varchar(255) NOT NULL,
  `license` varchar(60) DEFAULT NULL,
  `iduser` varchar(50) NOT NULL,
  `accounts` longtext,
  `group` varchar(50) NOT NULL,
  `inventory` longtext,
  `job` varchar(20) NOT NULL,
  `job_grade` int DEFAULT NULL,
  `loadout` longtext,
  `position` varchar(255) NOT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `dateofbirth` varchar(50) DEFAULT NULL,
  `sex` varchar(1) DEFAULT NULL,
  `height` int DEFAULT NULL,
  `skin` longtext,
  `status` longtext,
  `isDead` int DEFAULT NULL,
  `beta` tinyint(1) NOT NULL,
  `Solbeta` tinyint(1) NOT NULL,
  `useremail` varchar(254) DEFAULT NULL,
  `discord` varchar(100) DEFAULT NULL,
  `ipUser` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla es_extended.users: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`identifier`, `license`, `iduser`, `accounts`, `group`, `inventory`, `job`, `job_grade`, `loadout`, `position`, `firstname`, `lastname`, `dateofbirth`, `sex`, `height`, `skin`, `status`, `isDead`, `beta`, `Solbeta`, `useremail`, `discord`, `ipUser`) VALUES
	('steam:110000115588e4f', NULL, '12', '', 'user', '', 'unemployed', 0, NULL, '{\'x\': -269.4, \'y\': -955.3, \'z\': 31.2, \'heading\': 205.8}', 'Jose', 'Martinez', '1999-08-22', 'M', 160, '', '', 0, 1, 1, 'jose.mc.2004@gmail.com', NULL, NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Volcando estructura para tabla es_extended.user_whitelist
CREATE TABLE IF NOT EXISTS `user_whitelist` (
  `id` int NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) NOT NULL,
  `whitelisted` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla es_extended.user_whitelist: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `user_whitelist` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_whitelist` ENABLE KEYS */;

-- Volcando estructura para tabla es_extended.vehicles
CREATE TABLE IF NOT EXISTS `vehicles` (
  `name` varchar(60) NOT NULL,
  `model` varchar(60) NOT NULL,
  `price` int NOT NULL,
  `category` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`model`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla es_extended.vehicles: ~240 rows (aproximadamente)
/*!40000 ALTER TABLE `vehicles` DISABLE KEYS */;
/*!40000 ALTER TABLE `vehicles` ENABLE KEYS */;

-- Volcando estructura para tabla es_extended.vehicle_categories
CREATE TABLE IF NOT EXISTS `vehicle_categories` (
  `name` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla es_extended.vehicle_categories: ~11 rows (aproximadamente)
/*!40000 ALTER TABLE `vehicle_categories` DISABLE KEYS */;
INSERT INTO `vehicle_categories` (`name`, `label`) VALUES
	('compacts', 'Compacts'),
	('coupes', 'CoupÃ©s'),
	('motorcycles', 'Motos'),
	('muscle', 'Muscle'),
	('offroad', 'Off Road'),
	('sedans', 'Sedans'),
	('sports', 'Sports'),
	('sportsclassics', 'Sports Classics'),
	('super', 'Super'),
	('suvs', 'SUVs'),
	('vans', 'Vans');
/*!40000 ALTER TABLE `vehicle_categories` ENABLE KEYS */;

-- Volcando estructura para tabla es_extended.vehicle_sold
CREATE TABLE IF NOT EXISTS `vehicle_sold` (
  `client` varchar(50) NOT NULL,
  `model` varchar(50) NOT NULL,
  `plate` varchar(50) NOT NULL,
  `soldby` varchar(50) NOT NULL,
  `date` varchar(50) NOT NULL,
  PRIMARY KEY (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla es_extended.vehicle_sold: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `vehicle_sold` DISABLE KEYS */;
/*!40000 ALTER TABLE `vehicle_sold` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
