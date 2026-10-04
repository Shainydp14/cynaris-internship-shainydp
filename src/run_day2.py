# src/run_day2.py
import sqlite3
import sys

print(f"Python {sys.version}\n")
print("--- Step 1: Creating Tables ---")

connection = sqlite3.connect(":memory:")
cursor = connection.cursor()

# 1. Table Definitions (4 columns each)
cursor.execute(
    """
    CREATE TABLE players (
        player_id INT PRIMARY KEY,
        username VARCHAR(50),
        country VARCHAR(50),
        referred_by_id INT
    );
"""
)

cursor.execute(
    """
    CREATE TABLE scores (
        score_id INT PRIMARY KEY,
        player_id INT,
        game_name VARCHAR(50),
        high_score INT
    );
"""
)

print("--- Step 2: Seeding Mock Data ---")

# 2. Mock Data (4 explicit values per row to match schemas perfectly)
players_data = [
    (1, "Alice", "India", None),
    (2, "Bob", "USA", 1),  # Referred by Alice
    (3, "Charlie", "UK", 1),  # Referred by Alice
    (4, "Diana", "Canada", None),  # Has no scores yet
]

scores_data = [
    (101, 1, "Tetris", 950),
    (
        102,
        1,
        "Pacman",
        1200,
    ),  # Alice has two scores (Causes duplicate rows if not aggregated!)
    (103, 2, "Tetris", 840),
    (104, 3, "Pacman", 1100),
]

cursor.executemany("INSERT INTO players VALUES (?, ?, ?, ?)", players_data)
cursor.executemany("INSERT INTO scores VALUES (?, ?, ?, ?)", scores_data)
connection.commit()


# Helper function to print SQL results nicely
def run_and_print(title, query):
    print(f"\n⚡ {title}:")
    try:
        cursor.execute(query)
        rows = cursor.fetchall()
        headers = [description[0] for description in cursor.description]
        print(" | ".join(headers))
        print("-" * 60)
        for row in rows:
            print(" | ".join(str(val) for val in row))
    except Exception as e:
        print(f"Error executing query: {e}")


# --- DEMONSTRATING THE TASKS ---

# A. INNER JOIN
run_and_print(
    "INNER JOIN (Only players with scores)",
    """
    SELECT p.username, s.game_name, s.high_score
    FROM players AS p
    INNER JOIN scores AS s ON p.player_id = s.player_id;
""",
)

# B. LEFT JOIN
run_and_print(
    "LEFT JOIN (All players, even Diana who has no scores)",
    """
    SELECT p.username, s.game_name, s.high_score
    FROM players AS p
    LEFT JOIN scores AS s ON p.player_id = s.player_id;
""",
)

# C. FIXING DUPLICATE ROWS (Using MAX and GROUP BY)
run_and_print(
    "FIXING DUPLICATES (Collapsing Alice's entries into her highest score)",
    """
    SELECT p.username, MAX(s.high_score) AS maximum_overall_score
    FROM players AS p
    INNER JOIN scores AS s ON p.player_id = s.player_id
    GROUP BY p.player_id, p.username;
""",
)

# D. SELF-JOIN
run_and_print(
    "SELF-JOIN (Finding who referred whom)",
    """
    SELECT new_player.username AS new_user, referrer.username AS referred_by_user
    FROM players AS new_player
    INNER JOIN players AS referrer ON new_player.referred_by_id = referrer.player_id;
""",
)

connection.close()
