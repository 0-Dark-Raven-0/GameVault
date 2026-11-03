
-- ============================================
-- GameVault
-- Table creation
-- MySQL 8.4.11
-- ============================================

USE gamevault;

-- 1. Games
CREATE TABLE Games (
    game_id INT PRIMARY KEY,
    game_title VARCHAR(100) NOT NULL,
    year INT NOT NULL CHECK (year >= 1900),
    developer VARCHAR(50) NOT NULL
);

-- 2. Genres
CREATE TABLE Genres (
    genre_id INT PRIMARY KEY,
    genre_name VARCHAR(50) NOT NULL
);

-- 3. Platforms
CREATE TABLE Platforms (
    platform_id INT PRIMARY KEY,
    platform_name VARCHAR(50) NOT NULL
);

-- 4. Users
CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    user_name VARCHAR(50) NOT NULL,
    UNIQUE (user_name)
);

-- 5. Game_Genres
CREATE TABLE Game_Genres (
    game_id INT NOT NULL,
    genre_id INT NOT NULL,

    PRIMARY KEY (game_id, genre_id),

    CONSTRAINT fk_game_genres
        FOREIGN KEY (game_id)
        REFERENCES Games(game_id)
        ON DELETE CASCADE,

    CONSTRAINT fk_genre_genres
        FOREIGN KEY (genre_id)
        REFERENCES Genres(genre_id)
        ON DELETE CASCADE
);

-- 6. Game_Platforms
CREATE TABLE Game_Platforms (
    game_id INT NOT NULL,
    platform_id INT NOT NULL,

    PRIMARY KEY (game_id, platform_id),

    CONSTRAINT fk_game_platforms
        FOREIGN KEY (game_id)
        REFERENCES Games(game_id)
        ON DELETE CASCADE,

    CONSTRAINT fk_platform_platforms
        FOREIGN KEY (platform_id)
        REFERENCES Platforms(platform_id)
        ON DELETE CASCADE
);

-- 7. User_Library
CREATE TABLE User_Library (
    user_library_id INT PRIMARY KEY,
    user_id INT NOT NULL,
    game_id INT NOT NULL,
    personal_rating DECIMAL(3,1)
        CHECK (personal_rating >= 1.0 AND personal_rating <= 10.0),
    hours_of_playing INT NOT NULL DEFAULT 0
        CHECK (hours_of_playing >= 0),

    CONSTRAINT fk_user
        FOREIGN KEY (user_id)
        REFERENCES Users(user_id)
        ON DELETE CASCADE,

    CONSTRAINT fk_game
        FOREIGN KEY (game_id)
        REFERENCES Games(game_id)
        ON DELETE CASCADE,

    CONSTRAINT unique_user_game
        UNIQUE (user_id, game_id)
);
