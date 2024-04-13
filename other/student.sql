-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Фев 04 2024 г., 03:28
-- Версия сервера: 8.0.31
-- Версия PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `student`
--

-- --------------------------------------------------------

--
-- Структура таблицы `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_group_id_b120cbf9` (`group_id`),
  KEY `auth_group_permissions_permission_id_84c5c92e` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  KEY `auth_permission_content_type_id_2f476e4b` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `auth_permission`
--

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
(24, 'Can view session', 6, 'view_session');

-- --------------------------------------------------------

--
-- Структура таблицы `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$600000$aSPAyXklOEapkSOWe0or0Y$fBSiIV41H8vPnjcA0kofSqDFYDb7uLK5Sm23lvn2bzQ=', '2024-02-04 02:38:33.044840', 1, 'alisher', '', '', '', 1, 1, '2024-01-23 19:08:03.431046');

-- --------------------------------------------------------

--
-- Структура таблицы `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_user_id_6a12ed8b` (`user_id`),
  KEY `auth_user_groups_group_id_97559544` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_user_id_a95ead1b` (`user_id`),
  KEY `auth_user_user_permissions_permission_id_1fbb5f2c` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6` (`user_id`)
) ;

--
-- Дамп данных таблицы `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2024-01-24 02:56:54.816954', '4', 'Andijon viloyati', 1, '[{\"added\": {}}]', 10, 1),
(2, '2024-01-24 02:57:42.116833', '2', '02-2024-TJBAKT', 1, '[{\"added\": {}}]', 8, 1),
(3, '2024-01-24 03:00:30.745143', '2', 'Xolmatov', 1, '[{\"added\": {}}]', 7, 1),
(4, '2024-01-31 15:23:05.238040', '13', 'test', 1, '[{\"added\": {}}]', 11, 1),
(5, '2024-01-31 15:23:40.347520', '13', 'test222', 2, '[{\"changed\": {\"fields\": [\"Familiya Ismingiz\", \"Telefon\"]}}]', 11, 1),
(6, '2024-01-31 15:24:33.109366', '13', '123', 2, '[{\"changed\": {\"fields\": [\"Familiya Ismingiz\", \"Telefon\"]}}]', 11, 1),
(7, '2024-01-31 15:34:43.232472', '13', '123', 2, '[{\"changed\": {\"fields\": [\"Time\"]}}]', 11, 1),
(8, '2024-01-31 15:34:53.056773', '13', '123', 2, '[{\"changed\": {\"fields\": [\"Time\"]}}]', 11, 1),
(9, '2024-01-31 15:35:10.459055', '12', 'Alisher', 2, '[{\"changed\": {\"fields\": [\"Time\"]}}]', 11, 1),
(10, '2024-01-31 15:36:26.807382', '13', '123', 2, '[{\"changed\": {\"fields\": [\"Time\"]}}]', 11, 1),
(11, '2024-01-31 15:43:32.849319', '14', 'test', 1, '[{\"added\": {}}]', 11, 1),
(12, '2024-01-31 15:46:19.181847', '14', 'test123456', 2, '[{\"changed\": {\"fields\": [\"Time\"]}}]', 11, 1),
(13, '2024-01-31 15:47:03.969358', '14', 'test123456', 3, '', 11, 1),
(14, '2024-02-02 15:55:25.081858', '3', 'Ibragimova', 1, '[{\"added\": {}}]', 7, 1),
(15, '2024-02-04 02:41:09.099778', '5', 'Qashqadaryo viloyati', 1, '[{\"added\": {}}]', 10, 1),
(16, '2024-02-04 02:45:54.068484', '5', 'Abdullayev', 1, '[{\"added\": {}}]', 7, 1),
(17, '2024-02-04 02:57:25.469827', '5', 'Abdullayev', 2, '[{\"changed\": {\"fields\": [\"Fanlar\"]}}]', 7, 1),
(18, '2024-02-04 02:58:12.649222', '3', 'Ibragimova', 2, '[{\"changed\": {\"fields\": [\"Fanlar\"]}}]', 7, 1),
(19, '2024-02-04 02:59:00.592648', '1', 'Kudratov', 2, '[{\"changed\": {\"fields\": [\"Fanlar\"]}}]', 7, 1),
(20, '2024-02-04 03:00:27.411972', '2', 'Xolmatov', 2, '[{\"changed\": {\"fields\": [\"Fanlar\"]}}]', 7, 1),
(21, '2024-02-04 03:02:33.418804', '2', 'Xolmatov', 2, '[]', 7, 1),
(22, '2024-02-04 03:06:01.389830', '7', 'Geografiya', 1, '[{\"added\": {}}]', 12, 1),
(23, '2024-02-04 03:07:03.393961', '8', 'Informatika', 1, '[{\"added\": {}}]', 12, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(2, 'auth', 'permission'),
(3, 'auth', 'group'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(7, 'student', 'talaba'),
(8, 'student', 'guruh'),
(9, 'student', 'jinsi'),
(10, 'student', 'viloyatlar'),
(11, 'student', 'murojaat'),
(12, 'student', 'fanlar');

-- --------------------------------------------------------

--
-- Структура таблицы `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2024-01-23 18:55:54.062373'),
(2, 'auth', '0001_initial', '2024-01-23 18:55:55.205647'),
(3, 'admin', '0001_initial', '2024-01-23 18:55:55.536511'),
(4, 'admin', '0002_logentry_remove_auto_add', '2024-01-23 18:55:55.536511'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2024-01-23 18:55:55.560690'),
(6, 'contenttypes', '0002_remove_content_type_name', '2024-01-23 18:55:55.684522'),
(7, 'auth', '0002_alter_permission_name_max_length', '2024-01-23 18:55:55.769549'),
(8, 'auth', '0003_alter_user_email_max_length', '2024-01-23 18:55:55.854094'),
(9, 'auth', '0004_alter_user_username_opts', '2024-01-23 18:55:55.871749'),
(10, 'auth', '0005_alter_user_last_login_null', '2024-01-23 18:55:55.954509'),
(11, 'auth', '0006_require_contenttypes_0002', '2024-01-23 18:55:55.954509'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2024-01-23 18:55:55.970925'),
(13, 'auth', '0008_alter_user_username_max_length', '2024-01-23 18:55:56.056006'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2024-01-23 18:55:56.154516'),
(15, 'auth', '0010_alter_group_name_max_length', '2024-01-23 18:55:56.238102'),
(16, 'auth', '0011_update_proxy_permissions', '2024-01-23 18:55:56.250095'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2024-01-23 18:55:56.337056'),
(18, 'sessions', '0001_initial', '2024-01-23 18:55:56.415619');

-- --------------------------------------------------------

--
-- Структура таблицы `django_session`
--

DROP TABLE IF EXISTS `django_session`;
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `fanlar`
--

DROP TABLE IF EXISTS `fanlar`;
CREATE TABLE IF NOT EXISTS `fanlar` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fanlar_nomi` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `fanlar`
--

INSERT INTO `fanlar` (`id`, `fanlar_nomi`) VALUES
(1, 'Matematika'),
(2, 'Fizika'),
(3, 'Kimyo'),
(4, 'Tarix'),
(5, 'Adabiyot'),
(6, 'Chet tillari'),
(7, 'Geografiya'),
(8, 'Informatika');

-- --------------------------------------------------------

--
-- Структура таблицы `guruh`
--

DROP TABLE IF EXISTS `guruh`;
CREATE TABLE IF NOT EXISTS `guruh` (
  `id` int NOT NULL AUTO_INCREMENT,
  `guruh_raqami` varchar(100) NOT NULL,
  `guruh_rahbari` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `guruh`
--

INSERT INTO `guruh` (`id`, `guruh_raqami`, `guruh_rahbari`) VALUES
(1, '01-2024-NGI', 'Jamshid Normatov'),
(2, '02-2024-TJBAKT', 'Alisher Kudratov');

-- --------------------------------------------------------

--
-- Структура таблицы `jinsi`
--

DROP TABLE IF EXISTS `jinsi`;
CREATE TABLE IF NOT EXISTS `jinsi` (
  `id` int NOT NULL AUTO_INCREMENT,
  `jins` varchar(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `jinsi`
--

INSERT INTO `jinsi` (`id`, `jins`) VALUES
(1, 'Erkak'),
(2, 'Ayol');

-- --------------------------------------------------------

--
-- Структура таблицы `murojaat`
--

DROP TABLE IF EXISTS `murojaat`;
CREATE TABLE IF NOT EXISTS `murojaat` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fio` varchar(50) NOT NULL,
  `telefon` varchar(50) NOT NULL,
  `viloyat` int NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Yaratish (o''zgartirish) vaqti',
  PRIMARY KEY (`id`),
  KEY `viloyat` (`viloyat`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `murojaat`
--

INSERT INTO `murojaat` (`id`, `fio`, `telefon`, `viloyat`, `time`) VALUES
(15, 'Alisher', '+99890 332 00 00', 3, '2024-02-01 14:16:16'),
(16, 'Javlon', '+99890 332 31 31', 4, '2024-02-01 09:23:45'),
(17, 'Diyora', '+99890 332 31 77', 3, '2024-02-01 09:25:08'),
(18, 'Nargiza', '+99890 332 31 99', 2, '2024-02-01 09:26:08'),
(19, 'Nargiza', '+99890 332 31 31', 1, '2024-02-01 09:27:23'),
(20, 'Alisher', '+99890 332 31 77', 2, '2024-02-01 09:31:37'),
(21, 'Javlon', '+99890 332 31 10', 3, '2024-02-01 09:33:41'),
(22, 'Saodat Ibragimova', '95 200 01 01', 3, '2024-02-02 12:14:59');

-- --------------------------------------------------------

--
-- Структура таблицы `talaba`
--

DROP TABLE IF EXISTS `talaba`;
CREATE TABLE IF NOT EXISTS `talaba` (
  `id` int NOT NULL AUTO_INCREMENT,
  `familiya` varchar(50) NOT NULL,
  `ism` varchar(50) NOT NULL,
  `otasining_ismi` varchar(50) NOT NULL,
  `tavallud_kuni` date NOT NULL,
  `yashash_manzili` varchar(200) NOT NULL,
  `telefon_raqami` varchar(100) NOT NULL,
  `guruh` int NOT NULL,
  `jinsi` int NOT NULL,
  `viloyat` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `guruh` (`guruh`,`jinsi`,`viloyat`),
  KEY `jinsi` (`jinsi`),
  KEY `viloyat` (`viloyat`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `talaba`
--

INSERT INTO `talaba` (`id`, `familiya`, `ism`, `otasining_ismi`, `tavallud_kuni`, `yashash_manzili`, `telefon_raqami`, `guruh`, `jinsi`, `viloyat`) VALUES
(1, 'Kudratov', 'Alisher', 'Shuxratovich', '1989-06-30', 'Buxoro shahar, Mustaqillik ko\'chasi', '+998 90 635 44 33', 1, 1, 1),
(2, 'Xolmatov', 'Mirzabek', 'Abduvaliyevich', '2024-01-24', 'Pop tumani, Avloniy ko\'chasi', '+998 77 555 55 55', 2, 1, 4),
(3, 'Ibragimova', 'Sabohat', 'Bobir qizi', '1992-11-27', 'Pop tumani, Avloniy ko\'chasi', '+998 99 700 01 85', 2, 2, 1),
(5, 'Abdullayev', 'Kamol', 'Salimovich', '1992-02-04', 'Koson tumani', '+998 77 555 60 60', 1, 1, 5);

-- --------------------------------------------------------

--
-- Структура таблицы `talaba_fanlar`
--

DROP TABLE IF EXISTS `talaba_fanlar`;
CREATE TABLE IF NOT EXISTS `talaba_fanlar` (
  `talaba_id` int NOT NULL,
  `fanlar_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `talaba_fanlar`
--

INSERT INTO `talaba_fanlar` (`talaba_id`, `fanlar_id`) VALUES
(5, 1),
(5, 2),
(5, 5),
(5, 6),
(5, 3),
(5, 4),
(3, 2),
(3, 3),
(3, 6),
(1, 1),
(1, 2),
(1, 6),
(2, 5),
(2, 6);

-- --------------------------------------------------------

--
-- Структура таблицы `viloyatlar`
--

DROP TABLE IF EXISTS `viloyatlar`;
CREATE TABLE IF NOT EXISTS `viloyatlar` (
  `id` int NOT NULL AUTO_INCREMENT,
  `viloyat_nomi` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `viloyatlar`
--

INSERT INTO `viloyatlar` (`id`, `viloyat_nomi`) VALUES
(1, 'Buxoro viloyati'),
(2, 'Navoiy viloyati'),
(3, 'Samarqand viloyati'),
(4, 'Andijon viloyati'),
(5, 'Qashqadaryo viloyati');

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `talaba`
--
ALTER TABLE `talaba`
  ADD CONSTRAINT `talaba_ibfk_2` FOREIGN KEY (`jinsi`) REFERENCES `jinsi` (`id`),
  ADD CONSTRAINT `talaba_ibfk_3` FOREIGN KEY (`guruh`) REFERENCES `guruh` (`id`),
  ADD CONSTRAINT `talaba_ibfk_4` FOREIGN KEY (`viloyat`) REFERENCES `viloyatlar` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
