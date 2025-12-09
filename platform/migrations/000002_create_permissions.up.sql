CREATE TABLE permissions (
  id SERIAL PRIMARY KEY,
  permission VARCHAR(100) NOT NULL,
  role_id INT REFERENCES roles(id) ON DELETE CASCADE
);

CREATE INDEX idx_permissions_role ON permissions(role_id);