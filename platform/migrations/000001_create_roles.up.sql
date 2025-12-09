-- Create roles table
CREATE TABLE IF NOT EXISTS roles (
    id SERIAL PRIMARY KEY,
    role_name VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create index on role_name for faster lookups
CREATE INDEX IF NOT EXISTS idx_roles_role_name ON roles(role_name);

-- Create index on created_at for sorting
CREATE INDEX IF NOT EXISTS idx_roles_created_at ON roles(created_at);

