CREATE TABLE users (
  id BIGSERIAL PRIMARY KEY,
  full_name VARCHAR(150),
  username VARCHAR(100) UNIQUE NOT NULL,
  email VARCHAR(150) UNIQUE,
  contact_no VARCHAR(20),
  bio TEXT,
  avatar TEXT,
  is_verified BOOLEAN DEFAULT FALSE,
  created_at TIMESTAMP DEFAULT NOW(),
  country_code INT REFERENCES countries(code),
  role_id INT REFERENCES roles(id),
  timezone INT REFERENCES timezones(id)
);

CREATE INDEX idx_users_country ON users(country_code);
CREATE INDEX idx_users_role ON users(role_id);

ALTER TABLE users ADD COLUMN IF NOT EXISTS password_hash TEXT;