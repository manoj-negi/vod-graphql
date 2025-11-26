-- name: CreateTodo :one
INSERT INTO todos (id, text, done, user_id, created_at, updated_at)
VALUES ($1, $2, $3, $4, $5, $6)
RETURNING id, text, done, user_id, created_at, updated_at;

-- name: GetTodoByID :one
SELECT id, text, done, user_id, created_at, updated_at
FROM todos
WHERE id = $1;

-- name: ListTodos :many
SELECT id, text, done, user_id, created_at, updated_at
FROM todos
ORDER BY created_at DESC;

-- name: ListTodosByUser :many
SELECT id, text, done, user_id, created_at, updated_at
FROM todos
WHERE user_id = $1
ORDER BY created_at DESC;

-- name: UpdateTodo :one
UPDATE todos
SET text = $2, done = $3, updated_at = $4
WHERE id = $1
RETURNING id, text, done, user_id, created_at, updated_at;

-- name: DeleteTodo :exec
DELETE FROM todos
WHERE id = $1;


