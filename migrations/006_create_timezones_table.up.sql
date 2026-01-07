-- Timezones Table
CREATE TABLE timezones (
    id BIGSERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL,
    display_name VARCHAR(150) NOT NULL,
    utc_offset VARCHAR(10) NOT NULL,
    utc_offset_minutes INTEGER NOT NULL,
    country_code VARCHAR(2),
    is_active BOOLEAN DEFAULT true,
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE INDEX idx_timezones_name ON timezones(name);
CREATE INDEX idx_timezones_country_code ON timezones(country_code);
