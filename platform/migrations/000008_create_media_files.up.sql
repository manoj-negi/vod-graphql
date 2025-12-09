CREATE TABLE media_files (
  id BIGSERIAL PRIMARY KEY,
  media_id BIGINT REFERENCES media(id) ON DELETE CASCADE,
  quality VARCHAR(20),
  file_url TEXT,
  size BIGINT
);

CREATE INDEX idx_media_files_media ON media_files(media_id);
