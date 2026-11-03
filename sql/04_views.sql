-- ============================================
-- GameVault
-- Views
-- MySQL 8.4.11
-- ============================================

USE gamevault;

-- 1. GameVault_View
-- General overview of games, genres, and platforms

CREATE OR REPLACE VIEW GameVault_View AS
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
    g.developer;


-- 2. Game_Info
-- Games with their genres

CREATE OR REPLACE VIEW Game_Info AS
SELECT
    g.game_id,
    g.game_title,
    g.year,
    g.developer,
    gen.genre_name
FROM Games AS g
JOIN Game_Genres AS gg ON g.game_id = gg.game_id
JOIN Genres AS gen ON gg.genre_id = gen.genre_id;


-- 3. Game_Platform_Info
-- Games with their platforms

CREATE OR REPLACE VIEW Game_Platform_Info AS
SELECT
    g.game_id,
    g.game_title,
    g.year,
    g.developer,
    p.platform_name
FROM Games AS g
JOIN Game_Platforms AS gp ON g.game_id = gp.game_id
JOIN Platforms AS p ON gp.platform_id = p.platform_id;
