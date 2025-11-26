# Database Migrations

This directory contains SQL migration files for database schema management.

## Migration Files

Migrations follow the naming convention: `{version}_{name}.{up|down}.sql`

- **Up migrations** (`.up.sql`): Apply schema changes
- **Down migrations** (`.down.sql`): Rollback schema changes

## Current Migrations

1. **000001_create_users_table**: Creates the users table with basic fields
2. **000002_create_todos_table**: Creates the todos table with foreign key to users

## Using Migrations

### Option 1: Using golang-migrate CLI

Install golang-migrate:
```bash
brew install golang-migrate
# or
go install -tags 'postgres' github.com/golang-migrate/migrate/v4/cmd/migrate@latest
```

Run migrations:
```bash
# Apply all pending migrations
migrate -path ./migrations -database "postgres://user:password@localhost/dbname?sslmode=disable" up

# Rollback last migration
migrate -path ./migrations -database "postgres://user:password@localhost/dbname?sslmode=disable" down 1

# Check migration version
migrate -path ./migrations -database "postgres://user:password@localhost/dbname?sslmode=disable" version
```

### Option 2: Using migrate in Go code

Add to your dependencies:
```bash
go get -u github.com/golang-migrate/migrate/v4
go get -u github.com/golang-migrate/migrate/v4/database/postgres
go get -u github.com/golang-migrate/migrate/v4/source/file
```

Example usage in Go:
```go
import (
    "github.com/golang-migrate/migrate/v4"
    _ "github.com/golang-migrate/migrate/v4/database/postgres"
    _ "github.com/golang-migrate/migrate/v4/source/file"
)

func runMigrations(databaseURL string) error {
    m, err := migrate.New(
        "file://migrations",
        databaseURL,
    )
    if err != nil {
        return err
    }
    defer m.Close()
    
    if err := m.Up(); err != nil && err != migrate.ErrNoChange {
        return err
    }
    return nil
}
```

## Creating New Migrations

1. Create two files:
   - `{next_version}_{description}.up.sql` - Migration to apply
   - `{next_version}_{description}.down.sql` - Migration to rollback

2. Example:
   ```bash
   touch migrations/000003_add_user_avatar.up.sql
   touch migrations/000003_add_user_avatar.down.sql
   ```

3. Always test both up and down migrations!

## Notes

- Migrations are versioned sequentially
- Always include both `.up.sql` and `.down.sql` files
- Test migrations on a development database first
- Never modify existing migration files after they've been applied to production

