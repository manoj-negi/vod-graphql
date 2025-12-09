CREATE TABLE video_shares (
  user_id BIGINT REFERENCES users(id) ON DELETE CASCADE,
  media_id BIGINT REFERENCES media(id) ON DELETE CASCADE,
  platform VARCHAR(50),
  created_at TIMESTAMP DEFAULT NOW(),
  PRIMARY KEY (user_id, media_id)
);
