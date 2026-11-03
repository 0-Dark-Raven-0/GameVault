-- ============================================
-- GameVault
-- Practice and analytical queries
-- MySQL 8.4.11
-- ============================================

USE gamevault;


-- ============================================
-- 1. BASIC SELECT QUERIES
-- ============================================

-- Display all games
SELECT * FROM Games;

-- Display games released after 2010
SELECT *
FROM Games
WHERE year > 2010;

-- Sort games by release year
SELECT *
FROM Games
ORDER BY year DESC;

-- Search for games by developer
SELECT *
FROM Games
WHERE developer = 'девелопер2';


-- ============================================
-- 2. AGGREGATE FUNCTIONS
-- ============================================

-- Count all games
SELECT COUNT(*) AS total_games
FROM Games;

-- Find the average release year
SELECT AVG(year) AS average_release_year
FROM Games;

-- Count games by developer
SELECT
    developer,
    COUNT(*) AS games_count
FROM Games
GROUP BY developer
ORDER BY games_count DESC;

-- Show developers with more than one game
SELECT
    developer,
    COUNT(*) AS games_count
FROM Games
GROUP BY developer
HAVING COUNT(*) > 1;


-- ============================================
-- 3. JOIN QUERIES
-- ============================================

-- Games and their genres
SELECT
    g.game_title,
    gen.genre_name
FROM Games AS g
JOIN Game_Genres AS gg ON g.game_id = gg.game_id
JOIN Genres AS gen ON gg.genre_id = gen.genre_id
ORDER BY g.game_title;

-- Games and their platforms
SELECT
    g.game_title,
    p.platform_name
FROM Games AS g
JOIN Game_Platforms AS gp ON g.game_id = gp.game_id
JOIN Platforms AS p ON gp.platform_id = p.platform_id
ORDER BY g.game_title;

-- Users and their game libraries
SELECT
    u.user_name,
    g.game_title,
    ul.personal_rating,
    ul.hours_of_playing
FROM Users AS u
LEFT JOIN User_Library AS ul ON u.user_id = ul.user_id
LEFT JOIN Games AS g ON ul.game_id = g.game_id
ORDER BY u.user_name;


-- ============================================
-- 4. SUBQUERIES
-- ============================================

-- Games released after the average release year
SELECT *
FROM Games
WHERE year > (
    SELECT AVG(year)
    FROM Games
);

-- Games available on platform with ID 2
SELECT *
FROM Games
WHERE game_id IN (
    SELECT game_id
    FROM Game_Platforms
    WHERE platform_id = 2
);

-- Games not available on platform with ID 2
SELECT *
FROM Games
WHERE game_id NOT IN (
    SELECT game_id
    FROM Game_Platforms
    WHERE platform_id = 2
);

-- Count users who own each game
SELECT
    g.game_title,
    (
        SELECT COUNT(*)
        FROM User_Library AS ul
        WHERE ul.game_id = g.game_id
    ) AS users_count
FROM Games AS g;


-- ============================================
-- 5. CASE EXPRESSIONS
-- ============================================

-- Categorize games by release year
SELECT
    game_title,
    year,
    CASE
        WHEN year < 2010 THEN 'Classic'
        WHEN year BETWEEN 2010 AND 2020 THEN 'Modern'
        ELSE 'Recent'
    END AS release_category
FROM Games;


-- ============================================
-- 6. UNION
-- ============================================

-- Combine game titles and developer names
SELECT game_title AS name
FROM Games

UNION

SELECT developer AS name
FROM Games;


-- ============================================
-- 7. FINAL ANALYTICAL QUERIES
-- ============================================

-- Query 1: Complete game catalog with genres and platforms

SELECT
    g.game_id,
    g.game_title,
    g.year,
    g.developer,
    GROUP_CONCAT(DISTINCT gen.genre_name ORDER BY gen.genre_name SEPARATOR ', ') AS genres,
    GROUP_CONCAT(DISTINCT p.platform_name ORDER BY p.platform_name SEPARATOR ', ') AS platforms
FROM Games AS g
LEFT JOIN Game_Genres AS gg ON g.game_id = gg.game_id
LEFT JOIN Genres AS gen ON gg.genre_id = gen.genre_id
LEFT JOIN Game_Platforms AS gp ON g.game_id = gp.game_id
LEFT JOIN Platforms AS p ON gp.platform_id = p.platform_id
GROUP BY
    g.game_id,
    g.game_title,
    g.year,
    g.developer
ORDER BY g.year DESC;


-- Query 2: User activity statistics

SELECT
    u.user_name,
    COALESCE(COUNT(g.game_id), 0) AS games_owned,
    COALESCE(SUM(ul.hours_of_playing), 0) AS total_hours,
    AVG(ul.personal_rating) AS avg_rating
FROM Users AS u
LEFT JOIN User_Library AS ul ON u.user_id = ul.user_id
LEFT JOIN Games AS g ON g.game_id = ul.game_id
GROUP BY u.user_id, u.user_name
ORDER BY total_hours DESC;


-- Query 3: Game popularity statistics

SELECT
    g.game_title AS title,
    COUNT(u.user_id) AS users_count,
    COALESCE(SUM(ul.hours_of_playing), 0) AS total_hours,
    AVG(ul.personal_rating) AS avg_rating
FROM Games AS g
LEFT JOIN User_Library AS ul ON g.game_id = ul.game_id
LEFT JOIN Users AS u ON u.user_id = ul.user_id
GROUP BY g.game_id, g.game_title
ORDER BY users_count DESC, total_hours DESC;


-- Query 4: Games with poor reputation

SELECT
    g.game_title AS title,
    COUNT(u.user_id) AS users_count,
    AVG(ul.personal_rating) AS avg_rating,
    COALESCE(SUM(ul.hours_of_playing), 0) AS total_hours
FROM User_Library AS ul
JOIN Games AS g ON g.game_id = ul.game_id
JOIN Users AS u ON u.user_id = ul.user_id
GROUP BY g.game_id, g.game_title
HAVING users_count >= 2 AND avg_rating < 7.0
ORDER BY avg_rating ASC;


-- Query 5: Game rating categories

SELECT
    g.game_title,
    COUNT(u.user_id) AS users_count,
    AVG(ul.personal_rating) AS avg_rating,
    COALESCE(SUM(ul.hours_of_playing), 0) AS total_hours,
    CASE
        WHEN AVG(ul.personal_rating) >= 9.0 THEN 'Excellent'
        WHEN AVG(ul.personal_rating) >= 7.0 THEN 'Good'
        WHEN AVG(ul.personal_rating) >= 5.0 THEN 'Average'
        WHEN AVG(ul.personal_rating) IS NULL THEN 'Not rated'
        ELSE 'Poor'
    END AS rating_category
FROM Games AS g
LEFT JOIN User_Library AS ul ON g.game_id = ul.game_id
LEFT JOIN Users AS u ON u.user_id = ul.user_id
GROUP BY g.game_id, g.game_title
ORDER BY avg_rating DESC;
