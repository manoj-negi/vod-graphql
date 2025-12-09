CREATE TABLE notifications (
  id BIGSERIAL PRIMARY KEY,
  user_id BIGINT REFERENCES users(id) ON DELETE CASCADE,
  type VARCHAR(30),
  source_user_id BIGINT REFERENCES users(id),
  media_id BIGINT REFERENCES media(id),
  is_read BOOLEAN DEFAULT FALSE,
  created_at TIMESTAMP DEFAULT NOW()
);

CREATE INDEX idx_notifications_user ON notifications(user_id);
