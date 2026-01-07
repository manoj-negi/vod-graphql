-- Roles and Permissions Junction Table
CREATE TABLE roles_n_permissions (
    role_id BIGINT REFERENCES roles(id) ON DELETE CASCADE,
    permission_id BIGINT REFERENCES permissions(id) ON DELETE CASCADE,
    created_at TIMESTAMP DEFAULT NOW(),
    PRIMARY KEY (role_id, permission_id)
);

CREATE INDEX idx_roles_n_permissions_role ON roles_n_permissions(role_id);
CREATE INDEX idx_roles_n_permissions_permission ON roles_n_permissions(permission_id);
