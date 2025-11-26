-- name: CreateUser :one
INSERT INTO users (id, name, email, created_at, updated_at)
VALUES ($1, $2, $3, $4, $5)
RETURNING id, name, email, created_at, updated_at;

-- name: GetUserByID :one
SELECT id, name, email, created_at, updated_at
FROM users
WHERE id = $1;

-- name: GetUserByEmail :one
SELECT id, name, email, created_at, updated_at
FROM users
WHERE email = $1;

-- name: ListUsers :many
SELECT id, name, email, created_at, updated_at
FROM users
ORDER BY created_at DESC;

-- name: UpdateUser :one
UPDATE users
SET name = $2, email = $3, updated_at = $4
WHERE id = $1
RETURNING id, name, email, created_at, updated_at;

-- name: DeleteUser :exec
DELETE FROM users
WHERE id = $1;

