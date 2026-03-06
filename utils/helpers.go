package utils

import (
	"time"

	"github.com/google/uuid"
	"github.com/jackc/pgx/v5/pgtype"
)

func BoolPtr(s string) *bool {
	if s == "" {
		return nil
	}
	b := s == "true"
	return &b
}

// StringPtr converts a string to a string pointer.
// Returns nil if the string is empty.
func StringPtr(s string) *string {
	if s == "" {
		return nil
	}
	return &s
}
func PgUUIDFromPtr(id *uuid.UUID) pgtype.UUID {
	if id == nil {
		return pgtype.UUID{Valid: false}
	}

	return pgtype.UUID{
		Bytes: *id,
		Valid: true,
	}
}

func PgUUIDPtr(u pgtype.UUID) *uuid.UUID {
	if !u.Valid {
		return nil
	}

	id := uuid.UUID(u.Bytes)
	return &id
}

// PgTextFromPtr converts a *string to pgtype.Text.
// Returns an invalid pgtype.Text if the pointer is nil.
func PgTextFromPtr(p *string) pgtype.Text {
	if p == nil {
		return pgtype.Text{Valid: false}
	}
	return pgtype.Text{String: *p, Valid: true}
}

// PgTextPtr converts a pgtype.Text to a string pointer.
// Returns nil if the Text is not valid.
func PgTextPtr(t pgtype.Text) *string {
	if !t.Valid {
		return nil
	}
	return &t.String
}

// PgTextToPtr is an alias for PgTextPtr for readability.
func PgTextToPtr(t pgtype.Text) *string {
	return PgTextPtr(t)
}

// PgTimestamptzPtrRFC3339 converts a pgtype.Timestamptz to an RFC3339 formatted string pointer.
// Returns nil if the Timestamptz is not valid.
func PgTimestamptzPtrRFC3339(ts pgtype.Timestamptz) *string {
	if !ts.Valid {
		return nil
	}
	s := ts.Time.Format(time.RFC3339)
	return &s
}

// PgTimestampPtrRFC3339 converts a pgtype.Timestamp to an RFC3339 formatted string pointer.
// Returns nil if the Timestamp is not valid.
func PgTimestampPtrRFC3339(ts pgtype.Timestamp) *string {
	if !ts.Valid {
		return nil
	}
	s := ts.Time.Format(time.RFC3339)
	return &s
}

// PgTimestampPtrString converts a pgtype.Timestamp to a string pointer.
// Returns nil if the Timestamp is not valid.
func PgTimestampPtrString(ts pgtype.Timestamp) *string {
	if !ts.Valid {
		return nil
	}
	s := ts.Time.Format(time.RFC3339)
	return &s
}

// PgUUIDToUUID converts a pgtype.UUID to a uuid.UUID.
// Returns uuid.Nil if the UUID is not valid.
func PgUUIDToUUID(u pgtype.UUID) uuid.UUID {
	if !u.Valid {
		return uuid.Nil
	}
	return u.Bytes
}
