-- Professions Table
CREATE TABLE professions (
    id BIGSERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL,
    slug VARCHAR(100) UNIQUE NOT NULL,
    category VARCHAR(50),
    description TEXT,
    icon_url VARCHAR(500),
    user_count INTEGER DEFAULT 0,
    is_active BOOLEAN DEFAULT true,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

CREATE INDEX idx_professions_name ON professions(name);
CREATE INDEX idx_professions_slug ON professions(slug);
CREATE INDEX idx_professions_category ON professions(category);
CREATE INDEX idx_professions_user_count ON professions(user_count DESC);
