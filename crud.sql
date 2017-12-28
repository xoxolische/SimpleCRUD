-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Дек 28 2017 г., 20:29
-- Версия сервера: 5.7.19
-- Версия PHP: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `crud`
--

-- --------------------------------------------------------

--
-- Структура таблицы `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
CREATE TABLE IF NOT EXISTS `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `hibernate_sequence`
--

INSERT INTO `hibernate_sequence` (`next_val`) VALUES
(137);

-- --------------------------------------------------------

--
-- Структура таблицы `notes`
--

DROP TABLE IF EXISTS `notes`;
CREATE TABLE IF NOT EXISTS `notes` (
  `id` bigint(20) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `last_edited` datetime DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `notes`
--

INSERT INTO `notes` (`id`, `create_date`, `last_edited`, `text`) VALUES
(123, '2017-12-28 22:27:51', '2017-12-28 22:27:51', 'test1'),
(124, '2017-12-28 22:27:57', '2017-12-28 22:27:57', 'test2'),
(125, '2017-12-28 22:28:01', '2017-12-28 22:28:01', 'test3'),
(126, '2017-12-28 22:28:05', '2017-12-28 22:28:05', 'test4'),
(127, '2017-12-28 22:28:12', '2017-12-28 22:28:12', 'test5'),
(128, '2017-12-28 22:28:22', '2017-12-28 22:28:22', 'test7'),
(129, '2017-12-28 22:28:27', '2017-12-28 22:28:27', 'test8'),
(130, '2017-12-28 22:28:32', '2017-12-28 22:28:32', 'test9'),
(131, '2017-12-28 22:28:37', '2017-12-28 22:28:37', 'test10'),
(132, '2017-12-28 22:28:44', '2017-12-28 22:28:44', 'test11'),
(133, '2017-12-28 22:28:49', '2017-12-28 22:28:49', 'test12'),
(134, '2017-12-28 22:28:59', '2017-12-28 22:28:59', 'test13'),
(135, '2017-12-28 22:29:02', '2017-12-28 22:29:02', 'test14'),
(136, '2017-12-28 22:29:07', '2017-12-28 22:29:07', 'test15');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
