//go:generate go run github.com/99designs/gqlgen generate
package graph

import (
	"github.com/jackc/pgx/v5/pgxpool"
	"github.com/manojnegi/gql/db"
)

// This file will not be regenerated automatically.
//
// It serves as dependency injection for your app, add any dependencies you require here.

type Resolver struct {
	db      *pgxpool.Pool
	queries *db.Queries
}

// NewResolver creates a new resolver with database connection
func NewResolver(pool *pgxpool.Pool) *Resolver {
	return &Resolver{
		db:      pool,
		queries: db.New(pool),
	}
}
