-- Feedback Table (Employer Reviews)
CREATE TABLE feedback (
    id UUID DEFAULT uuid_generate_v7() PRIMARY KEY,
    user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    video_id UUID NOT NULL REFERENCES videos(id) ON DELETE CASCADE,
    parent_feedback_id UUID REFERENCES feedback(id) ON DELETE CASCADE,
    content TEXT NOT NULL,
    rating INTEGER CHECK (rating >= 1 AND rating <= 5),
    like_count INTEGER DEFAULT 0,
    reply_count INTEGER DEFAULT 0,
    is_pinned BOOLEAN DEFAULT false,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

CREATE INDEX idx_feedback_video_created ON feedback(video_id, created_at DESC);
CREATE INDEX idx_feedback_user_created ON feedback(user_id, created_at DESC);
CREATE INDEX idx_feedback_parent_created ON feedback(parent_feedback_id, created_at DESC);
CREATE INDEX idx_feedback_rating ON feedback(rating DESC);
