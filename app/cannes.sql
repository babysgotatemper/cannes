-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Час створення: Трв 17 2017 р., 10:33
-- Версія сервера: 5.7.18-0ubuntu0.16.04.1
-- Версія PHP: 7.0.15-0ubuntu0.16.04.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База даних: `cannes`
--
CREATE DATABASE IF NOT EXISTS `cannes` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `cannes`;

-- --------------------------------------------------------

--
-- Структура таблиці `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `full_name` text,
  `first_name` text,
  `last_name` text,
  `email` text,
  `photo_url` text,
  `social_id` text,
  `profile_link` text,
  `profile_type` text,
  `vote_film` int(11) NOT NULL DEFAULT '0',
  `vote_actress` int(11) NOT NULL DEFAULT '0',
  `vote_actor` int(11) NOT NULL DEFAULT '0',
  `vote_regiser` int(11) NOT NULL DEFAULT '0',
  `vote_style` int(11) NOT NULL DEFAULT '0',
  `metadata` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `users`
--

TRUNCATE TABLE `users`;
--
-- Дамп даних таблиці `users`
--

INSERT INTO `users` (`id`, `full_name`, `first_name`, `last_name`, `email`, `photo_url`, `social_id`, `profile_link`, `profile_type`, `vote_film`, `vote_actress`, `vote_actor`, `vote_regiser`, `vote_style`, `metadata`) VALUES
(1, 'Андрій Клебан', 'Андрій', 'Клебан', 'VK does not provide this info', 'https://pp.userapi.com/c630619/v630619105/2f456/1sfETKOXxY0.jpg', '307178105', 'https://vk.com/307178105', 'VK', 0, 0, 0, 0, 0, '{"id":"307178105","first_name":"\\u0410\\u043d\\u0434\\u0440\\u0456\\u0439","last_name":"\\u041a\\u043b\\u0435\\u0431\\u0430\\u043d","sex":2,"screen_name":"id307178105","bdate":"21.10.1991","city":{"id":2106,"title":"\\u0406\\u0432\\u0430\\u043d\\u043e-\\u0424\\u0440\\u0430\\u043d\\u043a\\u0456\\u0432\\u0441\\u044c\\u043a"},"country":{"id":2,"title":"\\u0423\\u043a\\u0440\\u0430\\u0457\\u043d\\u0430"},"photo_max_orig":"https:\\/\\/pp.userapi.com\\/c630619\\/v630619105\\/2f456\\/1sfETKOXxY0.jpg","has_mobile":1}'),
(2, 'Андрій Клебан', 'Андрій', 'Клебан', 'VK does not provide this info', 'https://pp.userapi.com/c630619/v630619105/2f456/1sfETKOXxY0.jpg', '307178105', 'https://vk.com/307178105', 'VK', 0, 0, 0, 0, 0, '{"id":307178105,"first_name":"\\u0410\\u043d\\u0434\\u0440\\u0456\\u0439","last_name":"\\u041a\\u043b\\u0435\\u0431\\u0430\\u043d","sex":2,"screen_name":"id307178105","bdate":"21.10.1991","city":{"id":2106,"title":"\\u0406\\u0432\\u0430\\u043d\\u043e-\\u0424\\u0440\\u0430\\u043d\\u043a\\u0456\\u0432\\u0441\\u044c\\u043a"},"country":{"id":2,"title":"\\u0423\\u043a\\u0440\\u0430\\u0457\\u043d\\u0430"},"photo_max_orig":"https:\\/\\/pp.userapi.com\\/c630619\\/v630619105\\/2f456\\/1sfETKOXxY0.jpg","has_mobile":1}'),
(3, 'Andrew Kleban', 'Andrew', 'Kleban', 'klebanandrew@gmail.com', 'https://graph.facebook.com/1592964664340668/picture?type=large', '1592964664340668', 'https://www.facebook.com/app_scoped_user_id/1592964664340668/', 'FB', 0, 0, 0, 0, 0, '{"birthday":"10\\/21\\/1991","email":"klebanandrew@gmail.com","first_name":"Andrew","id":"1592964664340668","last_name":"Kleban","link":"https:\\/\\/www.facebook.com\\/app_scoped_user_id\\/1592964664340668\\/","locale":"uk_UA","name":"Andrew Kleban"}'),
(4, 'Андрій Клебан', 'Андрій', 'Клебан', 'VK does not provide this info', 'https://pp.userapi.com/c630619/v630619105/2f456/1sfETKOXxY0.jpg', '307178105', 'https://vk.com/307178105', 'VK', 0, 0, 0, 0, 0, '{"id":307178105,"first_name":"\\u0410\\u043d\\u0434\\u0440\\u0456\\u0439","last_name":"\\u041a\\u043b\\u0435\\u0431\\u0430\\u043d","sex":2,"screen_name":"id307178105","bdate":"21.10.1991","city":{"id":2106,"title":"\\u0406\\u0432\\u0430\\u043d\\u043e-\\u0424\\u0440\\u0430\\u043d\\u043a\\u0456\\u0432\\u0441\\u044c\\u043a"},"country":{"id":2,"title":"\\u0423\\u043a\\u0440\\u0430\\u0457\\u043d\\u0430"},"photo_max_orig":"https:\\/\\/pp.userapi.com\\/c630619\\/v630619105\\/2f456\\/1sfETKOXxY0.jpg","has_mobile":1}'),
(5, 'Андрій Клебан', 'Андрій', 'Клебан', 'VK does not provide this info', 'https://pp.userapi.com/c630619/v630619105/2f456/1sfETKOXxY0.jpg', '307178105', 'https://vk.com/307178105', 'VK', 0, 0, 0, 0, 0, '{"id":307178105,"first_name":"\\u0410\\u043d\\u0434\\u0440\\u0456\\u0439","last_name":"\\u041a\\u043b\\u0435\\u0431\\u0430\\u043d","sex":2,"screen_name":"id307178105","bdate":"21.10.1991","city":{"id":2106,"title":"\\u0406\\u0432\\u0430\\u043d\\u043e-\\u0424\\u0440\\u0430\\u043d\\u043a\\u0456\\u0432\\u0441\\u044c\\u043a"},"country":{"id":2,"title":"\\u0423\\u043a\\u0440\\u0430\\u0457\\u043d\\u0430"},"photo_max_orig":"https:\\/\\/pp.userapi.com\\/c630619\\/v630619105\\/2f456\\/1sfETKOXxY0.jpg","has_mobile":1}'),
(6, 'Андрій Клебан', 'Андрій', 'Клебан', 'VK does not provide this info', 'https://pp.userapi.com/c630619/v630619105/2f456/1sfETKOXxY0.jpg', '307178105', 'https://vk.com/307178105', 'VK', 0, 0, 0, 0, 0, '{"id":307178105,"first_name":"\\u0410\\u043d\\u0434\\u0440\\u0456\\u0439","last_name":"\\u041a\\u043b\\u0435\\u0431\\u0430\\u043d","sex":2,"screen_name":"id307178105","bdate":"21.10.1991","city":{"id":2106,"title":"\\u0406\\u0432\\u0430\\u043d\\u043e-\\u0424\\u0440\\u0430\\u043d\\u043a\\u0456\\u0432\\u0441\\u044c\\u043a"},"country":{"id":2,"title":"\\u0423\\u043a\\u0440\\u0430\\u0457\\u043d\\u0430"},"photo_max_orig":"https:\\/\\/pp.userapi.com\\/c630619\\/v630619105\\/2f456\\/1sfETKOXxY0.jpg","has_mobile":1}'),
(7, 'Андрій Клебан', 'Андрій', 'Клебан', 'VK does not provide this info', 'https://pp.userapi.com/c630619/v630619105/2f456/1sfETKOXxY0.jpg', '307178105', 'https://vk.com/307178105', 'VK', 2, 4, 5, 1, 3, '{"id":307178105,"first_name":"\\u0410\\u043d\\u0434\\u0440\\u0456\\u0439","last_name":"\\u041a\\u043b\\u0435\\u0431\\u0430\\u043d","sex":2,"screen_name":"id307178105","bdate":"21.10.1991","city":{"id":2106,"title":"\\u0406\\u0432\\u0430\\u043d\\u043e-\\u0424\\u0440\\u0430\\u043d\\u043a\\u0456\\u0432\\u0441\\u044c\\u043a"},"country":{"id":2,"title":"\\u0423\\u043a\\u0440\\u0430\\u0457\\u043d\\u0430"},"photo_max_orig":"https:\\/\\/pp.userapi.com\\/c630619\\/v630619105\\/2f456\\/1sfETKOXxY0.jpg","has_mobile":1}'),
(8, 'Андрій Клебан', 'Андрій', 'Клебан', 'VK does not provide this info', 'https://pp.userapi.com/c630619/v630619105/2f456/1sfETKOXxY0.jpg', '307178105', 'https://vk.com/307178105', 'VK', 4, 3, 2, 3, 3, '{"id":307178105,"first_name":"\\u0410\\u043d\\u0434\\u0440\\u0456\\u0439","last_name":"\\u041a\\u043b\\u0435\\u0431\\u0430\\u043d","sex":2,"screen_name":"id307178105","bdate":"21.10.1991","city":{"id":2106,"title":"\\u0406\\u0432\\u0430\\u043d\\u043e-\\u0424\\u0440\\u0430\\u043d\\u043a\\u0456\\u0432\\u0441\\u044c\\u043a"},"country":{"id":2,"title":"\\u0423\\u043a\\u0440\\u0430\\u0457\\u043d\\u0430"},"photo_max_orig":"https:\\/\\/pp.userapi.com\\/c630619\\/v630619105\\/2f456\\/1sfETKOXxY0.jpg","has_mobile":1}'),
(9, 'Андрій Клебан', 'Андрій', 'Клебан', 'VK does not provide this info', 'https://pp.userapi.com/c630619/v630619105/2f456/1sfETKOXxY0.jpg', '307178105', 'https://vk.com/307178105', 'VK', 0, 0, 0, 0, 0, '{"id":307178105,"first_name":"\\u0410\\u043d\\u0434\\u0440\\u0456\\u0439","last_name":"\\u041a\\u043b\\u0435\\u0431\\u0430\\u043d","sex":2,"screen_name":"id307178105","bdate":"21.10.1991","city":{"id":2106,"title":"\\u0406\\u0432\\u0430\\u043d\\u043e-\\u0424\\u0440\\u0430\\u043d\\u043a\\u0456\\u0432\\u0441\\u044c\\u043a"},"country":{"id":2,"title":"\\u0423\\u043a\\u0440\\u0430\\u0457\\u043d\\u0430"},"photo_max_orig":"https:\\/\\/pp.userapi.com\\/c630619\\/v630619105\\/2f456\\/1sfETKOXxY0.jpg","has_mobile":1}'),
(10, 'Андрій Клебан', 'Андрій', 'Клебан', 'VK does not provide this info', 'https://pp.userapi.com/c630619/v630619105/2f456/1sfETKOXxY0.jpg', '307178105', 'https://vk.com/307178105', 'VK', 3, 4, 5, 4, 2, '{"id":307178105,"first_name":"\\u0410\\u043d\\u0434\\u0440\\u0456\\u0439","last_name":"\\u041a\\u043b\\u0435\\u0431\\u0430\\u043d","sex":2,"screen_name":"id307178105","bdate":"21.10.1991","city":{"id":2106,"title":"\\u0406\\u0432\\u0430\\u043d\\u043e-\\u0424\\u0440\\u0430\\u043d\\u043a\\u0456\\u0432\\u0441\\u044c\\u043a"},"country":{"id":2,"title":"\\u0423\\u043a\\u0440\\u0430\\u0457\\u043d\\u0430"},"photo_max_orig":"https:\\/\\/pp.userapi.com\\/c630619\\/v630619105\\/2f456\\/1sfETKOXxY0.jpg","has_mobile":1}'),
(11, 'Андрій Клебан', 'Андрій', 'Клебан', 'VK does not provide this info', 'https://pp.userapi.com/c630619/v630619105/2f456/1sfETKOXxY0.jpg', '307178105', 'https://vk.com/307178105', 'VK', 4, 5, 2, 3, 3, '{"id":307178105,"first_name":"\\u0410\\u043d\\u0434\\u0440\\u0456\\u0439","last_name":"\\u041a\\u043b\\u0435\\u0431\\u0430\\u043d","sex":2,"screen_name":"id307178105","bdate":"21.10.1991","city":{"id":2106,"title":"\\u0406\\u0432\\u0430\\u043d\\u043e-\\u0424\\u0440\\u0430\\u043d\\u043a\\u0456\\u0432\\u0441\\u044c\\u043a"},"country":{"id":2,"title":"\\u0423\\u043a\\u0440\\u0430\\u0457\\u043d\\u0430"},"photo_max_orig":"https:\\/\\/pp.userapi.com\\/c630619\\/v630619105\\/2f456\\/1sfETKOXxY0.jpg","has_mobile":1}'),
(12, 'Андрій Клебан', 'Андрій', 'Клебан', 'VK does not provide this info', 'https://pp.userapi.com/c630619/v630619105/2f456/1sfETKOXxY0.jpg', '307178105', 'https://vk.com/307178105', 'VK', 0, 0, 0, 0, 0, '{"id":307178105,"first_name":"\\u0410\\u043d\\u0434\\u0440\\u0456\\u0439","last_name":"\\u041a\\u043b\\u0435\\u0431\\u0430\\u043d","sex":2,"screen_name":"id307178105","bdate":"21.10.1991","city":{"id":2106,"title":"\\u0406\\u0432\\u0430\\u043d\\u043e-\\u0424\\u0440\\u0430\\u043d\\u043a\\u0456\\u0432\\u0441\\u044c\\u043a"},"country":{"id":2,"title":"\\u0423\\u043a\\u0440\\u0430\\u0457\\u043d\\u0430"},"photo_max_orig":"https:\\/\\/pp.userapi.com\\/c630619\\/v630619105\\/2f456\\/1sfETKOXxY0.jpg","has_mobile":1}'),
(13, 'Андрій Клебан', 'Андрій', 'Клебан', 'VK does not provide this info', 'https://pp.userapi.com/c630619/v630619105/2f456/1sfETKOXxY0.jpg', '307178105', 'https://vk.com/307178105', 'VK', 4, 3, 2, 4, 4, '{"id":307178105,"first_name":"\\u0410\\u043d\\u0434\\u0440\\u0456\\u0439","last_name":"\\u041a\\u043b\\u0435\\u0431\\u0430\\u043d","sex":2,"screen_name":"id307178105","bdate":"21.10.1991","city":{"id":2106,"title":"\\u0406\\u0432\\u0430\\u043d\\u043e-\\u0424\\u0440\\u0430\\u043d\\u043a\\u0456\\u0432\\u0441\\u044c\\u043a"},"country":{"id":2,"title":"\\u0423\\u043a\\u0440\\u0430\\u0457\\u043d\\u0430"},"photo_max_orig":"https:\\/\\/pp.userapi.com\\/c630619\\/v630619105\\/2f456\\/1sfETKOXxY0.jpg","has_mobile":1}'),
(14, 'Андрій Клебан', 'Андрій', 'Клебан', 'VK does not provide this info', 'https://pp.userapi.com/c630619/v630619105/2f456/1sfETKOXxY0.jpg', '307178105', 'https://vk.com/307178105', 'VK', 0, 0, 0, 0, 0, '{"id":307178105,"first_name":"\\u0410\\u043d\\u0434\\u0440\\u0456\\u0439","last_name":"\\u041a\\u043b\\u0435\\u0431\\u0430\\u043d","sex":2,"screen_name":"id307178105","bdate":"21.10.1991","city":{"id":2106,"title":"\\u0406\\u0432\\u0430\\u043d\\u043e-\\u0424\\u0440\\u0430\\u043d\\u043a\\u0456\\u0432\\u0441\\u044c\\u043a"},"country":{"id":2,"title":"\\u0423\\u043a\\u0440\\u0430\\u0457\\u043d\\u0430"},"photo_max_orig":"https:\\/\\/pp.userapi.com\\/c630619\\/v630619105\\/2f456\\/1sfETKOXxY0.jpg","has_mobile":1}'),
(15, 'Андрій Клебан', 'Андрій', 'Клебан', 'VK does not provide this info', 'https://pp.userapi.com/c630619/v630619105/2f456/1sfETKOXxY0.jpg', '307178105', 'https://vk.com/307178105', 'VK', 0, 0, 0, 0, 0, '{"id":307178105,"first_name":"\\u0410\\u043d\\u0434\\u0440\\u0456\\u0439","last_name":"\\u041a\\u043b\\u0435\\u0431\\u0430\\u043d","sex":2,"screen_name":"id307178105","bdate":"21.10.1991","city":{"id":2106,"title":"\\u0406\\u0432\\u0430\\u043d\\u043e-\\u0424\\u0440\\u0430\\u043d\\u043a\\u0456\\u0432\\u0441\\u044c\\u043a"},"country":{"id":2,"title":"\\u0423\\u043a\\u0440\\u0430\\u0457\\u043d\\u0430"},"photo_max_orig":"https:\\/\\/pp.userapi.com\\/c630619\\/v630619105\\/2f456\\/1sfETKOXxY0.jpg","has_mobile":1}'),
(16, 'Андрій Клебан', 'Андрій', 'Клебан', 'VK does not provide this info', 'https://pp.userapi.com/c630619/v630619105/2f456/1sfETKOXxY0.jpg', '307178105', 'https://vk.com/307178105', 'VK', 0, 0, 0, 0, 0, '{"id":307178105,"first_name":"\\u0410\\u043d\\u0434\\u0440\\u0456\\u0439","last_name":"\\u041a\\u043b\\u0435\\u0431\\u0430\\u043d","sex":2,"screen_name":"id307178105","bdate":"21.10.1991","city":{"id":2106,"title":"\\u0406\\u0432\\u0430\\u043d\\u043e-\\u0424\\u0440\\u0430\\u043d\\u043a\\u0456\\u0432\\u0441\\u044c\\u043a"},"country":{"id":2,"title":"\\u0423\\u043a\\u0440\\u0430\\u0457\\u043d\\u0430"},"photo_max_orig":"https:\\/\\/pp.userapi.com\\/c630619\\/v630619105\\/2f456\\/1sfETKOXxY0.jpg","has_mobile":1}'),
(17, 'Андрій Клебан', 'Андрій', 'Клебан', 'VK does not provide this info', 'https://pp.userapi.com/c630619/v630619105/2f456/1sfETKOXxY0.jpg', '307178105', 'https://vk.com/307178105', 'VK', 0, 0, 0, 0, 0, '{"id":307178105,"first_name":"\\u0410\\u043d\\u0434\\u0440\\u0456\\u0439","last_name":"\\u041a\\u043b\\u0435\\u0431\\u0430\\u043d","sex":2,"screen_name":"id307178105","bdate":"21.10.1991","city":{"id":2106,"title":"\\u0406\\u0432\\u0430\\u043d\\u043e-\\u0424\\u0440\\u0430\\u043d\\u043a\\u0456\\u0432\\u0441\\u044c\\u043a"},"country":{"id":2,"title":"\\u0423\\u043a\\u0440\\u0430\\u0457\\u043d\\u0430"},"photo_max_orig":"https:\\/\\/pp.userapi.com\\/c630619\\/v630619105\\/2f456\\/1sfETKOXxY0.jpg","has_mobile":1}'),
(18, 'Андрій Клебан', 'Андрій', 'Клебан', 'VK does not provide this info', 'https://pp.userapi.com/c630619/v630619105/2f456/1sfETKOXxY0.jpg', '307178105', 'https://vk.com/307178105', 'VK', 0, 0, 0, 0, 0, '{"id":307178105,"first_name":"\\u0410\\u043d\\u0434\\u0440\\u0456\\u0439","last_name":"\\u041a\\u043b\\u0435\\u0431\\u0430\\u043d","sex":2,"screen_name":"id307178105","bdate":"21.10.1991","city":{"id":2106,"title":"\\u0406\\u0432\\u0430\\u043d\\u043e-\\u0424\\u0440\\u0430\\u043d\\u043a\\u0456\\u0432\\u0441\\u044c\\u043a"},"country":{"id":2,"title":"\\u0423\\u043a\\u0440\\u0430\\u0457\\u043d\\u0430"},"photo_max_orig":"https:\\/\\/pp.userapi.com\\/c630619\\/v630619105\\/2f456\\/1sfETKOXxY0.jpg","has_mobile":1}');

--
-- Індекси збережених таблиць
--

--
-- Індекси таблиці `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для збережених таблиць
--

--
-- AUTO_INCREMENT для таблиці `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
