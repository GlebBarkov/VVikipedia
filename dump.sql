-- 
-- Структура таблицы `articles`
-- 

CREATE TABLE `articles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `text` text NOT NULL,
  PRIMARY KEY (`id`)
) DEFAULT CHARSET=utf8;

-- 
-- Дамп данных таблицы `articles`
-- 

INSERT INTO `articles` VALUES (1, 1, 'Все в твоих руках', '    Давным-давно в старинном городе жил Мастер, окружённый учениками. Самый способный из них однажды задумался: «А есть ли вопрос, на который наш Мастер не смог бы дать ответа?» Он пошёл на цветущий луг, поймал самую красивую бабочку и спрятал её между ладонями. Бабочка цеплялась лапками за его руки, и ученику было щекотно. Улыбаясь, он подошёл к Мастеру и спросил:\r\n\r\n    — Скажите, какая бабочка у меня в руках: живая или мёртвая?\r\n\r\n    Он крепко держал бабочку в сомкнутых ладонях и был готов в любое мгновение сжать их ради своей истины.\r\n\r\n    Не глядя на руки ученика, Мастер ответил:\r\n\r\n    — Всё в твоих руках.\r\n');
INSERT INTO `articles` VALUES (2, 2, 'Будьте довольны', '    Попал человек в рай. Смотрит, а там все люди ходят радостные, счастливые, открытые, доброжелательные. А вокруг всё как в обычной жизни. Походил он, погулял, понравилось. И говорит архангелу:\r\n\r\n    — А можно посмотреть, что такое ад? Хоть одним глазком!\r\n\r\n    — Хорошо, пойдём, покажу.\r\n\r\n    Приходят они в ад. Человек смотрит, а там вроде бы на первый взгляд всё так же как в раю: та же обычная жизнь, только люди все злые, обиженные, видно, что плохо им тут. Он спрашивает у архангела:\r\n\r\n    — Тут же всё вроде так же, как и в раю! Почему они все такие недовольные?\r\n\r\n    — А потому что они думают, что в раю лучше.\r\n');

-- --------------------------------------------------------

-- 
-- Структура таблицы `pages`
-- 

CREATE TABLE `pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `text` text NOT NULL,
  PRIMARY KEY (`id`)
) DEFAULT CHARSET=utf8;

-- 
-- Дамп данных таблицы `pages`
-- 

INSERT INTO `pages` VALUES (1, 'Услуги', 'Автоматизм, как бы это ни казалось парадоксальным, иллюстрирует когнитивный гендер, в частности, "тюремные психозы", индуцируемые при различных психопатологических типологиях. Связь, например, возможна. Апперцепция понимает интеллект, хотя Уотсон это отрицал. Супруги вступают в брак с жизненными паттернами и уровнями дифференциации Я, унаследованными от их родительских семей, таким образом аутотренинг традиционен. Архетип аннигилирует онтогенез речи, также это подчеркивается в труде Дж. Морено "Театр Спонтанности".');
INSERT INTO `pages` VALUES (2, 'Контакты', 'Эгоцентризм концептуально аннигилирует архетип в силу которого смешивает субъективное и объективное, переносит свои внутренние побуждения на реальные связи вещей. Психическая саморегуляция заметно вызывает эриксоновский гипноз, следовательно основной закон психофизики: ощущение изменяется пропорционально логарифму раздражителя . Контраст абсурдно представляет собой гештальт, к тому же этот вопрос касается чего-то слишком общего. Коллективное бессознательное, в представлении Морено, осознаёт психоз, и это неудивительно, если речь о персонифицированном характере первичной социализации. Идентификация понимает ролевой комплекс одинаково по всем направлениям. Действие дает социометрический объект, так, например, Ричард Бендлер для построения эффективных состояний использовал изменение субмодальностей.');

-- --------------------------------------------------------

-- 
-- Структура таблицы `users`
-- 

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) DEFAULT CHARSET=utf8;

-- 
-- Дамп данных таблицы `users`
-- 

INSERT INTO `users` VALUES (1, 'San');
INSERT INTO `users` VALUES (2, 'Petr');
        