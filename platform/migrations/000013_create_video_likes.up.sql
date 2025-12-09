CREATE TABLE video_likes (
  user_id BIGINT REFERENCES users(id) ON DELETE CASCADE,
  media_id BIGINT REFERENCES media(id) ON DELETE CASCADE,
  created_at TIMESTAMP DEFAULT NOW(),
  PRIMARY KEY (user_id, media_id)
);
