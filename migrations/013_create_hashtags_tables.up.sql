-- Hashtags Table
CREATE TABLE hashtags (
    id UUID DEFAULT uuid_generate_v7() PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL,
    use_count BIGINT DEFAULT 0,
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE INDEX idx_hashtags_name ON hashtags(name);
CREATE INDEX idx_hashtags_use_count ON hashtags(use_count DESC);

-- Video Hashtags Junction Table
CREATE TABLE video_hashtags (
    video_id UUID REFERENCES videos(id) ON DELETE CASCADE,
    hashtag_id UUID REFERENCES hashtags(id) ON DELETE CASCADE,
    created_at TIMESTAMP DEFAULT NOW(),
    PRIMARY KEY (video_id, hashtag_id)
);

CREATE INDEX idx_video_hashtags_hashtag_created ON video_hashtags(hashtag_id, created_at DESC);
