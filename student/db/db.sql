CREATE DATABASE student;
USE student;
CREATE TABLE student (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    surname TEXT NOT NULL,
    name TEXT NOT NULL,
    patronymic TEXT NOT NULL,
    phone TEXT,
    telegram TEXT,
    email TEXT,
    git TEXT,
    birth_date DATE NOT NULL
);
ALTER TABLE student AUTO_INCREMENT = 1;