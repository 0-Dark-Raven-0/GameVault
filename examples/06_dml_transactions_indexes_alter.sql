-- ============================================
-- GameVault
-- DML, Transactions, Indexes and ALTER TABLE
-- MySQL 8.4.11
-- ============================================

USE gamevault;

-- IMPORTANT:
-- This file contains educational examples.
-- Do not execute the entire file at once.
-- Some commands modify or delete data and change table structures.
-- Run individual examples only on a test database.


-- ============================================
-- 1. UPDATE
-- ============================================

-- Change a game's developer
-- UPDATE Games
-- SET developer = 'New Developer'
-- WHERE game_id = 1;

-- Update a user's playtime
-- UPDATE User_Library
-- SET hours_of_playing = 50
-- WHERE user_library_id = 1;

-- Increase all playtime values by 1 hour
-- UPDATE User_Library
-- SET hours_of_playing = hours_of_playing + 1;


-- ============================================
-- 2. DELETE
-- ============================================

-- Delete a specific library entry
-- DELETE FROM User_Library
-- WHERE user_library_id = 1;

-- Delete a game
-- WARNING: ON DELETE CASCADE also deletes related records.
-- DELETE FROM Games
-- WHERE game_id = 5;


-- ============================================
-- 3. TRANSACTIONS
-- ============================================

-- Start a transaction
-- START TRANSACTION;

-- UPDATE User_Library
-- SET hours_of_playing = 100
-- WHERE user_library_id = 1;

-- Save changes permanently
-- COMMIT;

-- Undo changes made in the current transaction
-- ROLLBACK;


-- ============================================
-- 4. SAVEPOINT
-- ============================================

-- START TRANSACTION;

-- UPDATE User_Library
-- SET hours_of_playing = 30
-- WHERE user_library_id = 1;

-- SAVEPOINT before_second_update;

-- UPDATE User_Library
-- SET hours_of_playing = 60
-- WHERE user_library_id = 2;

-- Return to the savepoint
-- ROLLBACK TO SAVEPOINT before_second_update;

-- COMMIT;


-- ============================================
-- 5. INDEXES
-- ============================================

-- Create an index on release year
-- CREATE INDEX idx_games_year
-- ON Games(year);

-- Create a composite index on developer and year
-- CREATE INDEX idx_developer_year
-- ON Games(developer, year);

-- Display indexes
-- SHOW INDEX FROM Games;

-- Remove an index
-- DROP INDEX idx_games_year ON Games;


-- ============================================
-- 6. EXPLAIN
-- ============================================

-- Display the query execution plan
-- EXPLAIN
-- SELECT *
-- FROM Games
-- WHERE year > 2010;

-- Analyze actual query execution
-- EXPLAIN ANALYZE
-- SELECT *
-- FROM Games
-- WHERE year > 2010;


-- ============================================
-- 7. ALTER TABLE
-- ============================================

-- Add a new column
-- ALTER TABLE Games
-- ADD COLUMN release_date DATE;

-- Rename a column
-- ALTER TABLE Games
-- RENAME COLUMN release_date TO game_release_date;

-- Change a column's data type
-- ALTER TABLE Games
-- MODIFY COLUMN developer VARCHAR(100) NOT NULL;

-- Remove a column
-- ALTER TABLE Games
-- DROP COLUMN game_release_date;


-- ============================================
-- 8. CHECK CONSTRAINTS
-- ============================================

-- Add a CHECK constraint
-- ALTER TABLE Games
-- ADD CONSTRAINT chk_game_year
-- CHECK (year >= 1900);

-- Remove a CHECK constraint
-- ALTER TABLE Games
-- DROP CHECK chk_game_year;
