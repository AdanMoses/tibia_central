CREATE DATABASE tibia_app;

CREATE TABLE users(userID SERIAL PRIMARY KEY, character_name TEXT, email TEXT, password_digest TEXT);
