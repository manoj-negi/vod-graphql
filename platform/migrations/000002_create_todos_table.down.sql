-- Drop todos table and its indexes
DROP INDEX IF EXISTS idx_todos_created_at;
DROP INDEX IF EXISTS idx_todos_done;
DROP INDEX IF EXISTS idx_todos_user_id;
DROP TABLE IF EXISTS todos;

