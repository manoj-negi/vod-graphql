-- name: CreateUser :one
INSERT INTO users (
    username,
    email,
    phone,
    password_hash,
    role_id,
    profession_id,
    display_name,
    bio,
    avatar_url,
    cover_image_url,
    is_verified,
    is_private,
    follower_count,
    following_count,
    total_likes_received,
    total_views,
    date_of_birth,
    country_id,
    timezone_id
)
VALUES (
    $1,$2,$3,$4,$5,$6,$7,$8,$9,$10,
    $11,$12,$13,$14,$15,$16,$17,$18,$19
)
RETURNING
    id,
    username,
    email,
    phone,
    password_hash,
    role_id,
    profession_id,
    display_name,
    bio,
    avatar_url,
    cover_image_url,
    is_verified,
    is_private,
    follower_count,
    following_count,
    total_likes_received,
    total_views,
    date_of_birth,
    country_id,
    timezone_id,
    created_at,
    updated_at,
    last_login_at;

  -- name: GetUserById :one
  SELECT id, name, description, created_at, updated_at
  FROM roles WHERE id = $1;

  -- name: ListUsers :many
  SELECT id, name, description, created_at, updated_at
  FROM roles ORDER BY created_at DESC;

  -- name: UpdateUser :one
  UPDATE roles
  SET name = $2, description = $3, updated_at = $4
  WHERE id = $1
  RETURNING id, name, description, created_at, updated_at;

  -- name: DeleteUser :exec
  DELETE FROM roles WHERE id = $1;
-- name: GetUserById :one
SELECT
    id,
    username,
    email,
    phone,
    password_hash,
    role_id,
    profession_id,
    display_name,
    bio,
    avatar_url,
    cover_image_url,
    is_verified,
    is_private,
    follower_count,
    following_count,
    total_likes_received,
    total_views,
    date_of_birth,
    country_id,
    timezone_id,
    created_at,
    updated_at,
    last_login_at
FROM users
WHERE id = $1;

-- name: GetUserByUsername :one
SELECT
    id,
    username,
    email,
    password_hash,
    role_id,
    is_verified,
    created_at
FROM users
WHERE username = $1;

-- name: ListUsers :many
SELECT
    id,
    username,
    display_name,
    avatar_url,
    follower_count,
    following_count,
    is_verified,
    created_at
FROM users
ORDER BY created_at DESC;

-- name: UpdateUser :one
UPDATE users
SET
    display_name = $2,
    bio = $3,
    avatar_url = $4,
    cover_image_url = $5,
    updated_at = NOW()
WHERE id = $1
RETURNING
    id,
    username,
    display_name,
    bio,
    avatar_url,
    cover_image_url,
    updated_at;