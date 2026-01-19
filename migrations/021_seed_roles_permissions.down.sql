-- Remove role-permission mappings
DELETE FROM roles_n_permissions;

-- Remove permissions
DELETE FROM permissions;

-- Remove roles
DELETE FROM roles WHERE id IN (1, 2, 3);
