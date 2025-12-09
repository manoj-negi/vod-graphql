CREATE TABLE category_media (
  id SERIAL PRIMARY KEY,
  category_id INT REFERENCES content_category(id) ON DELETE CASCADE,
  media_id BIGINT REFERENCES media(id) ON DELETE CASCADE
);

CREATE INDEX idx_category_media_media ON category_media(media_id);
