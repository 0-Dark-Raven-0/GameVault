-- ============================================
-- GameVault
-- Sample data
-- MySQL 8.4.11
-- ============================================

USE gamevault;

-- 1. Games
INSERT INTO Games (game_id, game_title, year, developer) VALUES
(1, 'игра1', 2010, 'девелопер1'),
(2, 'игра2', 2024, 'девелопер2'),
(3, 'игра3', 2007, 'девелопер3'),
(4, 'игра4', 2010, 'девелопер2'),
(5, 'игра5', 2022, 'девелопер5');

-- 2. Genres
INSERT INTO Genres (genre_id, genre_name) VALUES
(1, 'Хоррор'),
(2, 'РПГ'),
(3, 'Экшн'),
(4, 'Шутер'),
(5, 'Стратегия'),
(6, 'Метроидвания'),
(7, 'Песочница');

-- 3. Platforms
INSERT INTO Platforms (platform_id, platform_name) VALUES
(1, 'ПК'),
(2, 'Нинтендо'),
(3, 'Плей Стейшен'),
(4, 'ИксБокс'),
(5, 'МакОС'),
(6, 'Линукс'),
(7, 'АйОС'),
(8, 'Андроид');

-- 4. Users
INSERT INTO Users (user_id, user_name) VALUES
(1, 'имя1'),
(2, 'имя2'),
(3, 'имя3'),
(4, 'имя4'),
(5, 'имя5');

-- 5. User_Library
INSERT INTO User_Library
(user_library_id, user_id, game_id, personal_rating, hours_of_playing) VALUES
(1, 2, 4, 9.3, 44),
(2, 3, 3, 4.8, 2),
(3, 4, 2, NULL, 1),
(4, 5, 1, 7.4, 12),
(5, 5, 3, NULL, 0),
(6, 3, 4, 8, 17),
(7, 4, 4, 7, 20);

-- 6. Game_Genres
INSERT INTO Game_Genres (game_id, genre_id) VALUES
(1, 3),
(1, 2),
(2, 3),
(2, 4),
(2, 5),
(3, 1),
(4, 6),
(5, 3),
(5, 2),
(5, 5);

-- 7. Game_Platforms
INSERT INTO Game_Platforms (game_id, platform_id) VALUES
(1, 1),
(1, 3),
(1, 4),
(1, 5),
(2, 1),
(2, 2),
(2, 3),
(2, 4),
(2, 8),
(3, 1),
(3, 2),
(3, 3),
(3, 4),
(4, 1),
(4, 5),
(4, 6),
(5, 1),
(5, 3),
(5, 4),
(5, 5),
(5, 6);
