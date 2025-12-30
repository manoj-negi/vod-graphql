  -- name: CreateRole :one
  INSERT INTO roles (id, name, description, created_at, updated_at)
  VALUES ($1, $2, $3, $4, $5)
  RETURNING id, name, description, created_at, updated_at;

  -- name: GetRoleByID :one
  SELECT id, name, description, created_at, updated_at
  FROM roles WHERE id = $1;

  -- name: ListRoles :many
  SELECT id, name, description, created_at, updated_at
  FROM roles ORDER BY created_at DESC;

  -- name: UpdateRole :one
  UPDATE roles
  SET name = $2, description = $3, updated_at = $4
  WHERE id = $1
  RETURNING id, name, description, created_at, updated_at;

  -- name: DeleteRole :exec
  DELETE FROM roles WHERE id = $1;