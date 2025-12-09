CREATE TABLE user_follows (
  follower_id BIGINT REFERENCES users(id) ON DELETE CASCADE,
  following_id BIGINT REFERENCES users(id) ON DELETE CASCADE,
  created_at TIMESTAMP DEFAULT NOW(),
  PRIMARY KEY (follower_id, following_id)
);

CREATE INDEX idx_follows_following ON user_follows(following_id);
