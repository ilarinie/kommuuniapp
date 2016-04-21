-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Palvelin: localhost
-- Luontiaika: 21.04.2016 klo 20:08
-- Palvelimen versio: 5.5.47-0ubuntu0.14.04.1
-- PHP:n versio: 5.5.9-1ubuntu4.14



/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Tietokanta: `choredb`
--

--
-- Vedos taulusta `chores`
--

INSERT INTO `chores` (`id`, `name`, `priority`, `created_at`, `updated_at`, `reward`) VALUES
(10, 'Tiskikoneen tyhjennys', 44, '2016-02-10 20:14:05', '2016-03-10 09:39:01', 10),
(11, 'Pullojen palautus', 168, '2016-02-25 11:34:46', '2016-02-25 11:36:55', 10),
(12, 'Pikkuvessan siivous', 168, '2016-02-25 11:35:11', '2016-02-25 11:35:11', 50),
(13, 'Kylpyhuoneen siivous', 168, '2016-02-25 11:35:35', '2016-02-25 11:35:35', 100),
(14, 'Imurointi', 168, '2016-02-25 11:35:50', '2016-02-25 11:35:50', 300),
(15, 'Keittiön siivous', 72, '2016-02-25 11:36:24', '2016-02-25 11:36:24', 50),
(16, 'Roskien vienti', 24, '2016-02-25 11:46:37', '2016-02-25 11:46:37', 20);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
