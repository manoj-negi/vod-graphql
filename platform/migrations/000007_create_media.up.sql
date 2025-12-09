CREATE TYPE video_type AS ENUM ('video', 'image', 'audio', 'document');

CREATE TABLE media (
  id BIGSERIAL PRIMARY KEY,
  user_id BIGINT REFERENCES users(id) ON DELETE CASCADE,
  path TEXT NOT NULL,
  type video_type NOT NULL,
  length INT,
  caption TEXT,
  privacy VARCHAR(20) DEFAULT 'public',
  status VARCHAR(20) DEFAULT 'processing',
  created_at TIMESTAMP DEFAULT NOW()
);

CREATE INDEX idx_media_user ON media(user_id);
CREATE INDEX idx_media_created ON media(created_at DESC);
