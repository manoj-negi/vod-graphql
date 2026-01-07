-- Users Table
CREATE TABLE users (
    id BIGSERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    phone VARCHAR(20),
    password_hash VARCHAR(255) NOT NULL,
    role_id BIGINT DEFAULT 1 REFERENCES roles(id) ON DELETE SET NULL,
    profession_id BIGINT REFERENCES professions(id) ON DELETE SET NULL,
    display_name VARCHAR(100),
    bio TEXT,
    avatar_url VARCHAR(500),
    cover_image_url VARCHAR(500),
    is_verified BOOLEAN DEFAULT false,
    is_private BOOLEAN DEFAULT false,
    follower_count INTEGER DEFAULT 0,
    following_count INTEGER DEFAULT 0,
    total_likes_received BIGINT DEFAULT 0,
    total_views BIGINT DEFAULT 0,
    date_of_birth DATE,
    country_id BIGINT REFERENCES countries(id) ON DELETE SET NULL,
    timezone_id BIGINT REFERENCES timezones(id) ON DELETE SET NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW(),
    last_login_at TIMESTAMP
);

CREATE INDEX idx_users_username ON users(username);
CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_users_role_id ON users(role_id);
CREATE INDEX idx_users_profession_id ON users(profession_id);
CREATE INDEX idx_users_country_id ON users(country_id);
CREATE INDEX idx_users_timezone_id ON users(timezone_id);
