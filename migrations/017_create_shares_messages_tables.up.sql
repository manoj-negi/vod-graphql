-- Shares Table
CREATE TABLE shares (
    id UUID DEFAULT uuid_generate_v7() PRIMARY KEY,
    user_id UUID REFERENCES users(id) ON DELETE SET NULL,
    video_id UUID NOT NULL REFERENCES videos(id) ON DELETE CASCADE,
    platform VARCHAR(50),
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE INDEX idx_shares_video_created ON shares(video_id, created_at DESC);

-- Messages Table
CREATE TABLE messages (
    id UUID DEFAULT uuid_generate_v7() PRIMARY KEY,
    sender_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    receiver_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    content TEXT,
    video_id UUID REFERENCES videos(id) ON DELETE SET NULL,
    is_read BOOLEAN DEFAULT false,
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE INDEX idx_messages_sender_created ON messages(sender_id, created_at DESC);
CREATE INDEX idx_messages_receiver_created ON messages(receiver_id, created_at DESC);
CREATE INDEX idx_messages_conversation ON messages(sender_id, receiver_id, created_at DESC);
