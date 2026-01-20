-- Insert default roles
INSERT INTO roles (name, description) VALUES
('user', 'Regular user with basic permissions'),
('moderator', 'Moderator with content management permissions'),
('admin', 'Administrator with full system access')
ON CONFLICT (name) DO NOTHING;

-- Insert default permissions
INSERT INTO permissions (name, description, resource, action) VALUES
('video.create', 'Create videos', 'video', 'create'),
('video.read', 'View videos', 'video', 'read'),
('video.update', 'Update own videos', 'video', 'update'),
('video.delete', 'Delete own videos', 'video', 'delete'),
('video.moderate', 'Moderate any video', 'video', 'moderate'),
('feedback.create', 'Create feedback/reviews', 'feedback', 'create'),
('feedback.read', 'View feedback/reviews', 'feedback', 'read'),
('feedback.update', 'Update own feedback', 'feedback', 'update'),
('feedback.delete', 'Delete own feedback', 'feedback', 'delete'),
('feedback.moderate', 'Moderate any feedback', 'feedback', 'moderate'),
('user.read', 'View user profiles', 'user', 'read'),
('user.update', 'Update own profile', 'user', 'update'),
('user.manage', 'Manage user accounts', 'user', 'manage'),
('report.create', 'Create reports', 'report', 'create'),
('report.review', 'Review reports', 'report', 'review')
ON CONFLICT (name) DO NOTHING;

-- Assign permissions to roles
-- User role permissions
INSERT INTO roles_n_permissions (role_id, permission_id)
SELECT r.id, p.id
FROM roles r
JOIN permissions p ON p.name IN (
    'video.create', 'video.read', 'video.update', 'video.delete',
    'feedback.create', 'feedback.read', 'feedback.update', 'feedback.delete',
    'user.read', 'user.update', 'report.create'
)
WHERE r.name = 'user'
ON CONFLICT DO NOTHING;

-- Moderator role permissions (includes all user permissions plus moderation)
INSERT INTO roles_n_permissions (role_id, permission_id)
SELECT r.id, p.id
FROM roles r
JOIN permissions p ON p.name IN (
    'video.create', 'video.read', 'video.update', 'video.delete', 'video.moderate',
    'feedback.create', 'feedback.read', 'feedback.update', 'feedback.delete', 'feedback.moderate',
    'user.read', 'user.update', 'report.create', 'report.review'
)
WHERE r.name = 'moderator'
ON CONFLICT DO NOTHING;

-- Admin role permissions (all permissions)
INSERT INTO roles_n_permissions (role_id, permission_id)
SELECT r.id, p.id
FROM roles r
JOIN permissions p ON TRUE
WHERE r.name = 'admin'
ON CONFLICT DO NOTHING;
