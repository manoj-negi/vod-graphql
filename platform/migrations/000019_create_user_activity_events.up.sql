CREATE TABLE user_activity_events (
  id BIGSERIAL PRIMARY KEY,
  user_id BIGINT REFERENCES users(id) ON DELETE CASCADE,
  media_id BIGINT REFERENCES media(id) ON DELETE CASCADE,
  event_type VARCHAR(30),
  weight FLOAT,
  created_at TIMESTAMP DEFAULT NOW()
);

CREATE INDEX idx_activity_user ON user_activity_events(user_id);
