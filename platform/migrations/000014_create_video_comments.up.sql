CREATE TABLE video_comments (
  id BIGSERIAL PRIMARY KEY,
  media_id BIGINT REFERENCES media(id) ON DELETE CASCADE,
  user_id BIGINT REFERENCES users(id) ON DELETE CASCADE,
  text TEXT,
  created_at TIMESTAMP DEFAULT NOW()
);

CREATE INDEX idx_comments_media ON video_comments(media_id);
