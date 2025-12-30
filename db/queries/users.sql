-- name: CreateUser :one
INSERT INTO users (full_name, username, email, password_hash)
VALUES ($1, $2, $3, $4)
RETURNING id, full_name, username, email, password_hash, created_at;

-- name: GetUserByID :one
SELECT id, full_name, username, email, password_hash, created_at
FROM users
WHERE id = $1;

-- name: GetUserByEmail :one
SELECT id, full_name, username, email, password_hash, created_at
FROM users
WHERE email = $1;

-- name: SignUpUser :one
INSERT INTO users (full_name, username, email, password_hash)
VALUES ($1, $2, $3, $4)
RETURNING id, full_name, username, email, created_at;

-- name: ListUsers :many
SELECT id, full_name, username, email, password_hash, created_at
FROM users
ORDER BY created_at DESC;

-- name: UpdateUser :one
UPDATE users
SET full_name = $2, email = $3
WHERE id = $1
RETURNING id, full_name, username, email, password_hash, created_at;

-- name: DeleteUser :exec
DELETE FROM users
WHERE id = $1;

