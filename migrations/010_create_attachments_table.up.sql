-- Attachments Table (for user documents like CV, certificates, etc.)
CREATE TABLE attachments (
    id UUID DEFAULT uuid_generate_v7() PRIMARY KEY,
    user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    title VARCHAR(255) NOT NULL,
    path VARCHAR(500) NOT NULL,
    expiry_date TIMESTAMP,
    type attachment_type_enum NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

CREATE INDEX idx_attachments_user_id ON attachments(user_id);
CREATE INDEX idx_attachments_expiry_date ON attachments(expiry_date);
