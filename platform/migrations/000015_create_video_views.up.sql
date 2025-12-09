CREATE TABLE video_views (
  id BIGSERIAL PRIMARY KEY,
  user_id BIGINT REFERENCES users(id) ON DELETE CASCADE,
  media_id BIGINT REFERENCES media(id) ON DELETE CASCADE,
  watch_time INT,
  created_at TIMESTAMP DEFAULT NOW()
);

CREATE INDEX idx_views_media ON video_views(media_id);
