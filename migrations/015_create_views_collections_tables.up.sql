-- Video Views Table
CREATE TABLE video_views (
    id BIGSERIAL PRIMARY KEY,
    user_id BIGINT REFERENCES users(id) ON DELETE SET NULL,
    video_id BIGINT NOT NULL REFERENCES videos(id) ON DELETE CASCADE,
    watch_duration INTEGER,
    is_completed BOOLEAN DEFAULT false,
    ip_address INET,
    user_agent TEXT,
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE INDEX idx_video_views_video_created ON video_views(video_id, created_at DESC);
CREATE INDEX idx_video_views_user_created ON video_views(user_id, created_at DESC);

-- Collections Table
CREATE TABLE collections (
    id BIGSERIAL PRIMARY KEY,
    user_id BIGINT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    is_private BOOLEAN DEFAULT false,
    video_count INTEGER DEFAULT 0,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

CREATE INDEX idx_collections_user_created ON collections(user_id, created_at DESC);

-- Saved Videos Table
CREATE TABLE saved_videos (
    user_id BIGINT REFERENCES users(id) ON DELETE CASCADE,
    video_id BIGINT REFERENCES videos(id) ON DELETE CASCADE,
    collection_id BIGINT REFERENCES collections(id) ON DELETE SET NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    PRIMARY KEY (user_id, video_id)
);

CREATE INDEX idx_saved_videos_user_created ON saved_videos(user_id, created_at DESC);
