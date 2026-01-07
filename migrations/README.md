# Database Migrations Guide

## Overview

This directory contains all database migrations for the Professional Video Platform using [golang-migrate](https://github.com/golang-migrate/migrate).

## Migration Files

Total: **24 migrations** (48 files - each with `.up.sql` and `.down.sql`)

### Migration Order

1. **001_create_enum_types** - PostgreSQL enum types
2. **002_create_roles_table** - User roles (employee, employer, admin)
3. **003_create_permissions_table** - Granular permissions
4. **004_create_roles_n_permissions_table** - Role-permission mapping
5. **005_create_countries_table** - Countries with ISO codes
6. **006_create_timezones_table** - IANA timezones
7. **007_create_professions_table** - User professions
8. **008_create_skills_table** - Technical and soft skills
9. **009_create_users_table** - Core users table
10. **010_create_user_skills_table** - User-skill mapping
11. **011_create_videos_table** - Professional video content
12. **012_create_hashtags_tables** - Hashtags and video-hashtag mapping
13. **013_create_follows_likes_tables** - Social interactions
14. **014_create_feedback_table** - Employer reviews
15. **015_create_views_collections_tables** - Analytics and bookmarks
16. **016_create_shares_messages_tables** - Sharing and messaging
17. **017_create_notifications_reports_blocks_tables** - Moderation
18. **018_create_trending_devices_analytics_tables** - Discovery and tracking
19. **019_create_triggers** - Database triggers for auto-updates

### Seed Data Migrations

20. **020_seed_roles_permissions** - Default roles, permissions, and mappings
21. **021_seed_countries** - 50 countries with metadata
22. **022_seed_timezones** - 60+ IANA timezones
23. **023_seed_professions** - 68 professions across 8 categories
24. **024_seed_skills** - 110+ skills across 8 categories

## Setup

### Install golang-migrate

```bash
# macOS
brew install golang-migrate

# Linux
curl -L https://github.com/golang-migrate/migrate/releases/download/v4.17.0/migrate.linux-amd64.tar.gz | tar xvz
sudo mv migrate /usr/local/bin/

# Or using Go
go install -tags 'postgres' github.com/golang-migrate/migrate/v4/cmd/migrate@latest
```

### Database Connection

Set your database URL:

```bash
export DATABASE_URL="postgresql://username:password@localhost:5432/professional_video_platform?sslmode=disable"
```

## Running Migrations

### Migrate Up (Apply all migrations)

```bash
migrate -database ${DATABASE_URL} -path migrations up
```

### Migrate Down (Rollback all migrations)

```bash
migrate -database ${DATABASE_URL} -path migrations down
```

### Migrate to Specific Version

```bash
# Migrate up to version 5
migrate -database ${DATABASE_URL} -path migrations goto 5

# Migrate up by 1 version
migrate -database ${DATABASE_URL} -path migrations up 1

# Migrate down by 1 version
migrate -database ${DATABASE_URL} -path migrations down 1
```

### Check Migration Version

```bash
migrate -database ${DATABASE_URL} -path migrations version
```

### Force Version (if migrations are stuck)

```bash
# Force to version 5 (use with caution!)
migrate -database ${DATABASE_URL} -path migrations force 5
```

## Migration Structure

Each migration consists of two files:

- **`NNNNNN_description.up.sql`** - Applies the migration
- **`NNNNNN_description.down.sql`** - Rolls back the migration

## Enum Types

The following PostgreSQL enum types are created:

- `device_type_enum`: 'ios', 'android', 'web'
- `proficiency_level_enum`: 'Beginner', 'Intermediate', 'Advanced', 'Expert'
- `report_status_enum`: 'pending', 'reviewed', 'action_taken', 'dismissed'
- `notification_type_enum`: 'like', 'feedback', 'follow', 'mention', 'message', 'video_upload'
- `target_type_enum`: 'video', 'feedback', 'user'

## Database Triggers

Two automatic triggers are created:

1. **`update_follow_counts()`** - Updates follower/following counts on users table
2. **`update_video_like_count()`** - Updates like counts on videos and users tables

## Tables Created (29 total)

### RBAC & Reference Tables
- roles
- permissions
- roles_n_permissions
- countries (50+ countries)
- timezones (60+ timezones)
- professions (68 professions)
- skills (110+ skills)

### Core Tables
- users
- user_skills
- videos

### Social Features
- hashtags
- video_hashtags
- follows
- likes
- feedback

### Supporting Tables
- video_views
- collections
- saved_videos
- shares
- messages
- notifications
- reports
- blocks
- trending_videos
- user_devices
- analytics_events

## Best Practices

1. **Always test migrations locally first**
2. **Backup your database before running migrations in production**
3. **Review both up and down migrations before applying**
4. **Use transactions where possible** (golang-migrate does this automatically)
5. **Never modify existing migration files** - create new ones instead
6. **Keep migrations small and focused** - one logical change per migration

## Creating New Migrations

```bash
migrate create -ext sql -dir migrations -seq description_of_migration
```

This creates:
- `NNNNNN_description_of_migration.up.sql`
- `NNNNNN_description_of_migration.down.sql`

## Troubleshooting

### Dirty Database State

If migrations fail mid-way:

```bash
# Check current version
migrate -database ${DATABASE_URL} -path migrations version

# Force to last known good version
migrate -database ${DATABASE_URL} -path migrations force <version>

# Then retry
migrate -database ${DATABASE_URL} -path migrations up
```

### Migration Conflicts

If you have conflicts:

1. Roll back to a clean state: `migrate down`
2. Fix the conflicting migration files
3. Re-apply: `migrate up`

## Integration with Go Application

Add to your `main.go` or initialization code:

```go
import (
    "database/sql"
    "github.com/golang-migrate/migrate/v4"
    "github.com/golang-migrate/migrate/v4/database/postgres"
    _ "github.com/golang-migrate/migrate/v4/source/file"
    _ "github.com/lib/pq"
)

func runMigrations(db *sql.DB) error {
    driver, err := postgres.WithInstance(db, &postgres.Config{})
    if err != nil {
        return err
    }
    
    m, err := migrate.NewWithDatabaseInstance(
        "file://migrations",
        "postgres",
        driver,
    )
    if err != nil {
        return err
    }
    
    if err := m.Up(); err != nil && err != migrate.ErrNoChange {
        return err
    }
    
    return nil
}
```

## Makefile Commands

Add these to your `Makefile`:

```makefile
migrate-up:
	migrate -database ${DATABASE_URL} -path migrations up

migrate-down:
	migrate -database ${DATABASE_URL} -path migrations down

migrate-create:
	migrate create -ext sql -dir migrations -seq $(name)

migrate-version:
	migrate -database ${DATABASE_URL} -path migrations version

migrate-force:
	migrate -database ${DATABASE_URL} -path migrations force $(version)
```

Usage:
```bash
make migrate-up
make migrate-down
make migrate-create name=add_new_field
make migrate-version
make migrate-force version=5
```

## Notes

- All migrations are idempotent where possible
- Foreign key constraints use `ON DELETE CASCADE` or `ON DELETE SET NULL` appropriately
- Indexes are created for all foreign keys and frequently queried columns
- Timestamps use PostgreSQL's `TIMESTAMP` type with `DEFAULT NOW()`
- All tables use `BIGSERIAL` for primary keys for scalability

---

**Last Updated**: January 7, 2026  
**Total Migrations**: 24 (19 schema + 5 seed data)  
**Total Tables**: 29  
**Database**: PostgreSQL 14+
