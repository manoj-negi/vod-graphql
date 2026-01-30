-- name: CreateCountry :one
INSERT INTO countries (
  code,
  code_alpha3,
  name,
  native_name,
  phone_code,
  currency_code,
  flag_emoji,
  is_active
) VALUES (
  $1, $2, $3, $4, $5, $6, $7, COALESCE($8, TRUE)
)
RETURNING id, code, code_alpha3, name, native_name, phone_code, currency_code, flag_emoji, is_active, created_at;

-- name: ListCountries :many
SELECT id, code, code_alpha3, name, native_name, phone_code, currency_code, flag_emoji, is_active, created_at
FROM countries
WHERE is_active = TRUE
ORDER BY name;

-- name: GetCountryByID :one
SELECT id, code, code_alpha3, name, native_name, phone_code, currency_code, flag_emoji, is_active, created_at
FROM countries
WHERE id = $1;

-- name: UpdateCountry :one
UPDATE countries
SET
  code = $2,
  code_alpha3 = $3,
  name = $4,
  native_name = $5,
  phone_code = $6,
  currency_code = $7,
  flag_emoji = $8,
  is_active = $9
WHERE id = $1
RETURNING id, code, code_alpha3, name, native_name, phone_code, currency_code, flag_emoji, is_active, created_at;

-- name: DeactivateCountry :exec
UPDATE countries
SET is_active = FALSE
WHERE id = $1;
