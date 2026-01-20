-- Roles Table
CREATE TABLE roles (
    id UUID DEFAULT uuid_generate_v7() PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL,
    description TEXT,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

CREATE INDEX idx_roles_name ON roles(name);
