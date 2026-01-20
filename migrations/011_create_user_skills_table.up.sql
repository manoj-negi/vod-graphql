-- User Skills Junction Table
CREATE TABLE user_skills (
    user_id UUID REFERENCES users(id) ON DELETE CASCADE,
    skill_id UUID REFERENCES skills(id) ON DELETE CASCADE,
    proficiency_level proficiency_level_enum,
    years_of_experience INTEGER,
    is_primary BOOLEAN DEFAULT false,
    endorsement_count INTEGER DEFAULT 0,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW(),
    PRIMARY KEY (user_id, skill_id)
);

CREATE INDEX idx_user_skills_user ON user_skills(user_id);
CREATE INDEX idx_user_skills_skill_proficiency ON user_skills(skill_id, proficiency_level);
CREATE INDEX idx_user_skills_primary ON user_skills(user_id, is_primary);
