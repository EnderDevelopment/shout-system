CREATE TABLE IF NOT EXISTS shout_logs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    player_id INT NOT NULL,
    player_name VARCHAR(50) NOT NULL,
    shout_time DATETIME NOT NULL,
    shout_message TEXT NOT NULL
);