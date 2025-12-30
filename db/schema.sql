-- Schema used by sqlc for code generation.
-- Matches production database structure.

CREATE TABLE users (
    id BIGSERIAL PRIMARY KEY,
    full_name VARCHAR(150),
    username VARCHAR(100) NOT NULL UNIQUE,
    email VARCHAR(150) UNIQUE,
    contact_no VARCHAR(20),
    bio TEXT,
    avatar TEXT,
    is_verified BOOLEAN DEFAULT FALSE,
    password_hash TEXT,
    created_at TIMESTAMP DEFAULT NOW(),
    country_code INT,
    role_id INT,
    timezone INT
);

CREATE TABLE roles (
    id INT PRIMARY KEY,
    name TEXT NOT NULL UNIQUE,
    description TEXT,
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);
