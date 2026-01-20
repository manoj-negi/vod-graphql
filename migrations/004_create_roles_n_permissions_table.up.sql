CREATE TABLE roles_n_permissions (
    role_id UUID REFERENCES roles(id) ON DELETE CASCADE,
    permission_id UUID REFERENCES permissions(id) ON DELETE CASCADE,
    created_at TIMESTAMP DEFAULT NOW(),
    PRIMARY KEY (role_id, permission_id)
);

CREATE INDEX idx_roles_n_permissions_role ON roles_n_permissions(role_id);
CREATE INDEX idx_roles_n_permissions_permission ON roles_n_permissions(permission_id);
