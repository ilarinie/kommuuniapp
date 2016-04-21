-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Palvelin: localhost
-- Luontiaika: 21.04.2016 klo 20:07
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
-- Vedos taulusta `ostos`
--

INSERT INTO `purchases` (`id`, `user_id`, `price`, `description`, `created_at`, `updated_at`) VALUES
(39, 3, 350.00, 'Vuokravakuus', '2016-02-21 15:49:45', '2016-02-21 15:49:45'),
(40, 3, 206.00, 'Vuokra helmikuun lopulta', '2016-02-22 18:52:56', '2016-02-22 18:52:56'),
(41, 1, 10.00, 'Patterit palohälyttimiin', '2016-02-26 18:19:35', '2016-02-26 18:19:35'),
(42, 1, 15.00, 'Assorted groceries', '2016-02-26 18:21:08', '2016-02-26 18:21:08'),
(43, 1, 199.00, 'Pöydän', '2016-02-29 09:12:31', '2016-02-29 09:12:31'),
(44, 2, 5.00, 'Vessapaperi', '2016-03-04 15:46:31', '2016-03-04 15:46:31'),
(46, 2, 5.00, 'Talouspaperi', '2016-03-04 15:47:07', '2016-03-04 15:47:08'),
(47, 3, 25.00, 'Allaskaappi', '2016-03-07 10:34:23', '2016-03-07 10:34:23'),
(48, 3, 2.00, 'Talouspaperi ja vessapaperia', '2016-03-07 10:34:43', '2016-03-07 10:34:43'),
(49, 1, 78.00, '2x kallax + sohvapöytä', '2016-03-09 18:02:21', '2016-03-09 18:02:21'),
(50, 2, 87.00, 'Peili, tanko, matto, roskis, pullopussi yms', '2016-03-13 18:02:47', '2016-03-13 18:02:47'),
(51, 2, 11.00, 'leuanvetotanko', '2016-03-15 11:13:46', '2016-03-15 11:13:46'),
(52, 3, -248.00, 'Tasaussuoritus, maksaja Tommi saaja Monni', '2016-03-24 09:28:58', '2016-03-24 09:28:58'),
(53, 4, 248.00, 'Tasaussuoritus, maksaja Tommi saaja Monni', '2016-03-24 09:28:58', '2016-03-24 09:28:58'),
(54, 2, 10.00, 'Yövaloja', '2016-03-26 17:36:49', '2016-03-26 17:36:49'),
(55, 2, 12.00, 'Tabletit ruokapöytään ', '2016-03-26 17:37:05', '2016-03-26 17:37:05'),
(56, 2, 11.00, 'Vessapaperi ja talouspaperi', '2016-03-28 14:55:11', '2016-03-28 14:55:11'),
(57, 1, 7.00, 'vessapaperia', '2016-03-28 15:07:33', '2016-03-28 15:07:33'),
(58, 2, 5.00, 'Ovimatto eteiseen', '2016-04-10 15:18:39', '2016-04-10 15:18:39'),
(59, 2, 39.00, 'Vessan hylly', '2016-04-10 15:19:23', '2016-04-10 15:19:23'),
(60, 2, 58.00, 'Kylpyhuoneen hyllyt ', '2016-04-10 15:19:51', '2016-04-10 15:19:51');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
