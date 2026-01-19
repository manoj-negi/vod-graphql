-- Insert default roles
INSERT INTO roles (id, name, description) VALUES
(1, 'user', 'Regular user with basic permissions'),
(2, 'moderator', 'Moderator with content management permissions'),
(3, 'admin', 'Administrator with full system access')
ON CONFLICT (id) DO NOTHING;

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
SELECT 1, id FROM permissions WHERE name IN (
    'video.create', 'video.read', 'video.update', 'video.delete',
    'feedback.create', 'feedback.read', 'feedback.update', 'feedback.delete',
    'user.read', 'user.update', 'report.create'
)
ON CONFLICT DO NOTHING;

-- Moderator role permissions (includes all user permissions plus moderation)
INSERT INTO roles_n_permissions (role_id, permission_id)
SELECT 2, id FROM permissions WHERE name IN (
    'video.create', 'video.read', 'video.update', 'video.delete', 'video.moderate',
    'feedback.create', 'feedback.read', 'feedback.update', 'feedback.delete', 'feedback.moderate',
    'user.read', 'user.update', 'report.create', 'report.review'
)
ON CONFLICT DO NOTHING;

-- Admin role permissions (all permissions)
INSERT INTO roles_n_permissions (role_id, permission_id)
SELECT 3, id FROM permissions
ON CONFLICT DO NOTHING;
