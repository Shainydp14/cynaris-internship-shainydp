-- SQL Fundamentals — Week 1 | Day 2: Advanced Data Joins
-- Let's assume a gaming platform dataset with players and their match scores.
CREATE TABLE players (
    player_id INT PRIMARY KEY,
    username VARCHAR(50),
    country VARCHAR(50),
    referred_by_id INT -- Used for Self-Join
);

CREATE TABLE scores (
    score_id INT PRIMARY KEY,
    player_id INT,
    game_name VARCHAR(50),
    high_score INT
);
-- A. INNER JOIN: Returns only players who have logged a high score.
SELECT 
    p.player_id, 
    p.username, 
    s.game_name, 
    s.high_score
FROM players AS p
INNER JOIN scores AS s 
    ON p.player_id = s.player_id;

-- B. LEFT JOIN: Returns ALL players, even those who haven't played a game yet (high_score will be NULL).
SELECT 
    p.player_id, 
    p.username, 
    s.game_name, 
    s.high_score
FROM players AS p
LEFT JOIN scores AS s 
    ON p.player_id = s.player_id;

-- C. RIGHT JOIN: Returns ALL scores, even if the player profile was deleted (username will be NULL).
SELECT 
    p.player_id, 
    p.username, 
    s.game_name, 
    s.high_score
FROM players AS p
RIGHT JOIN scores AS s 
    ON p.player_id = s.player_id;

-- D. FULL OUTER JOIN: Returns all players and all scores, matching where possible.
SELECT 
    p.player_id, 
    p.username, 
    s.game_name, 
    s.high_score
FROM players AS p
FULL OUTER JOIN scores AS s 
    ON p.player_id = s.player_id;


-- 3. PRACTICAL TASK: EXPLAINING & FIXING DUPLICATE ROWS
-- PROBLEM: If a player has multiple high scores (e.g., in different games), 
-- joining the tables directly will repeat the player's info for every score row.
-- FIX: Use aggregation (GROUP BY) to collapse duplicates and find their highest overall score.

SELECT 
    p.player_id, 
    p.username, 
    MAX(s.high_score) AS maximum_overall_score
FROM players AS p
INNER JOIN scores AS s 
    ON p.player_id = s.player_id
GROUP BY p.player_id, p.username;


-- 4. PRACTICAL TASK: SELF-JOIN
-- Context: Finding pairs of players where one player referred another.
SELECT 
    new_player.username AS new_user,
    referrer.username AS referred_by_user,
    new_player.country
FROM players AS new_player
INNER JOIN players AS referrer 
    ON new_player.referred_by_id = referrer.player_id;
