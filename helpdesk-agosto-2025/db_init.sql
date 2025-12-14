CREATE DATABASE helpdesk_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE helpdesk_db;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    role ENUM('ADMIN', 'AGENT', 'USER') NOT NULL DEFAULT 'USER',
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE tickets (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    description TEXT NOT NULL,
    status ENUM('OPEN', 'IN_PROGRESS', 'RESOLVED') NOT NULL DEFAULT 'OPEN',
    priority ENUM('LOW', 'MEDIUM', 'HIGH') NOT NULL DEFAULT 'MEDIUM',
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    created_by INT NOT NULL,
    assigned_to INT NULL,
    CONSTRAINT fk_tickets_created_by FOREIGN KEY (created_by) REFERENCES users(id),
    CONSTRAINT fk_tickets_assigned_to FOREIGN KEY (assigned_to) REFERENCES users(id)
);

CREATE TABLE ticket_comments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    ticket_id INT NOT NULL,
    user_id INT NOT NULL,
    comment TEXT NOT NULL,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_comments_ticket FOREIGN KEY (ticket_id) REFERENCES tickets(id),
    CONSTRAINT fk_comments_user FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Insertar usuario admin con hash generado (EJEMPLO - usar hash real generado)
-- Hash para "adminpass": scrypt:32768:8:1$nM38k3BvbPTFdhrQ$60f605d5eae60c3817fab4b37b500b6627984fc69b1a5b4a24c1615087890e868b6f2e054508221b8731ef6765dce541eaf161165c3ae210c0a56bc54cf8d289
INSERT INTO users (name, email, password_hash, role)
VALUES ('Admin', 'admin@example.com', 'scrypt:32768:8:1$nM38k3BvbPTFdhrQ$60f605d5eae60c3817fab4b37b500b6627984fc69b1a5b4a24c1615087890e868b6f2e054508221b8731ef6765dce541eaf161165c3ae210c0a56bc54cf8d289', 'ADMIN');

INSERT INTO users (name, email, password_hash, role)
VALUES ('Agent', 'agent@example.com', 'pbkdf2:sha256:600000$VzRqCr1jWGZ6jfa7$613d7efcdc8d44e60d967846e7b8c0c3e89889a5ff0b4aeac8b86d2bdcfac01d', 'AGENT');

INSERT INTO users (name, email, password_hash, role)
VALUES ('User', 'user@example.com', 'pbkdf2:sha256:600000$MiombIB6COAGx7Yy$4a1c23dba2eccd1395db30fd31c3d62521bfd941b42bd9180ceae1c17270ca78', 'USER');

-- Crear usuario
CREATE USER IF NOT EXISTS 'helpdesk_user'@'localhost' IDENTIFIED BY 'helpdesk_password';

-- Otorgar privilegios
GRANT ALL PRIVILEGES ON helpdesk_db.* TO 'helpdesk_user'@'localhost';

-- Aplicar cambios
FLUSH PRIVILEGES;

-- Verificar
SELECT user, host FROM mysql.user WHERE user = 'helpdesk_user';