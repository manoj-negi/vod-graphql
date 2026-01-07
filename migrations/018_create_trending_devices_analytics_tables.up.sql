-- Trending Videos Table
CREATE TABLE trending_videos (
    video_id BIGINT REFERENCES videos(id) ON DELETE CASCADE,
    score DECIMAL(10, 2) NOT NULL,
    rank INTEGER,
    category VARCHAR(50),
    country VARCHAR(2),
    calculated_at TIMESTAMP DEFAULT NOW(),
    PRIMARY KEY (video_id, category, country)
);

CREATE INDEX idx_trending_videos_ranking ON trending_videos(category, country, rank);

-- User Devices Table
CREATE TABLE user_devices (
    id BIGSERIAL PRIMARY KEY,
    user_id BIGINT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    device_token VARCHAR(500) NOT NULL,
    device_type device_type_enum,
    is_active BOOLEAN DEFAULT true,
    created_at TIMESTAMP DEFAULT NOW(),
    last_used_at TIMESTAMP DEFAULT NOW()
);

CREATE INDEX idx_user_devices_user_active ON user_devices(user_id, is_active);

-- Analytics Events Table
CREATE TABLE analytics_events (
    id BIGSERIAL PRIMARY KEY,
    user_id BIGINT REFERENCES users(id) ON DELETE SET NULL,
    event_type VARCHAR(100) NOT NULL,
    video_id BIGINT REFERENCES videos(id) ON DELETE SET NULL,
    properties JSONB,
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE INDEX idx_analytics_events_type_created ON analytics_events(event_type, created_at DESC);
CREATE INDEX idx_analytics_events_user_created ON analytics_events(user_id, created_at DESC);
