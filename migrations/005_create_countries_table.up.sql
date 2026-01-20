-- Countries Table
CREATE TABLE countries (
    id UUID DEFAULT uuid_generate_v7() PRIMARY KEY,
    code VARCHAR(2) UNIQUE NOT NULL,
    code_alpha3 VARCHAR(3) UNIQUE NOT NULL,
    name VARCHAR(100) NOT NULL,
    native_name VARCHAR(100),
    phone_code VARCHAR(10),
    currency_code VARCHAR(3),
    flag_emoji VARCHAR(10),
    is_active BOOLEAN DEFAULT true,
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE INDEX idx_countries_code ON countries(code);
CREATE INDEX idx_countries_name ON countries(name);
