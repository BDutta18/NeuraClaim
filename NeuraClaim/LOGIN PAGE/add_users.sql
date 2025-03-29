
USE insurance_db;


CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


INSERT INTO users (email, password) VALUES
('rajesh.kumar89@gmail.com', 'Pass@123'),
('neha.sharma45@gmail.com', 'qwerty789'),
('vikram.singh007@gmail.com', '654321987'),
('anjali.verma12@gmail.com', 'Secure@56'),
('rohit.pandey2024@gmail.com', 'mypass!90'),
('priya.chopra88@gmail.com', 'Abcd@2023'),
('arjun.malhotra55@gmail.com', '1a2b3c4D'),
('sneha.mehta99@gmail.com', 'ZxcVbn@12'),
('devansh.rana21@gmail.com', 'Rana#5678'),
('kavita.bansal76@gmail.com', '987xyzABC');

CREATE INDEX idx_email ON users(email);

