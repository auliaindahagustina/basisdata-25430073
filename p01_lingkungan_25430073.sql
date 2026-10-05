-- p01_lingkungan_25430073.sql

-- D.2 Memeriksa lingkungan MariaDB
SELECT VERSION(), CURRENT_USER();
SHOW DATABASES;
SELECT @@sql_mode;

-- D.3 Memeriksa akun root
SELECT User, Host FROM mysql.user WHERE User = 'root';

-- D.4 Membuat basis data dan akun kerja

CREATE DATABASE IF NOT EXISTS kopma_073
 CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

CREATE USER IF NOT EXISTS 'mhs_073'@'localhost' IDENTIFIED BY '<password_kerja>';

GRANT ALL PRIVILEGES ON kopma_073.* TO 'mhs_073'@'localhost';

SHOW GRANTS FOR 'mhs_073'@'localhost';

-- E.1 Membuat akun tamu

CREATE USER IF NOT EXISTS 'tamu_073'@'localhost' IDENTIFIED BY '<password_tamu>';

GRANT SELECT ON kopma_073.* TO 'tamu_073'@'localhost';