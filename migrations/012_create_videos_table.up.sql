-- Videos Table
CREATE TABLE videos (
    id UUID DEFAULT uuid_generate_v7() PRIMARY KEY,
    user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    video_url VARCHAR(500) NOT NULL,
    thumbnail_url VARCHAR(500),
    duration INTEGER NOT NULL,
    caption TEXT,
    view_count BIGINT DEFAULT 0,
    like_count INTEGER DEFAULT 0,
    feedback_count INTEGER DEFAULT 0,
    share_count INTEGER DEFAULT 0,
    save_count INTEGER DEFAULT 0,
    width INTEGER,
    height INTEGER,
    file_size BIGINT,
    is_public BOOLEAN DEFAULT true,
    allows_feedback BOOLEAN DEFAULT true,
    allows_duet BOOLEAN DEFAULT true,
    allows_stitch BOOLEAN DEFAULT true,
    is_monetized BOOLEAN DEFAULT false,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

CREATE INDEX idx_videos_user_created ON videos(user_id, created_at DESC);
CREATE INDEX idx_videos_created_at ON videos(created_at DESC);
CREATE INDEX idx_videos_view_count ON videos(view_count DESC);
