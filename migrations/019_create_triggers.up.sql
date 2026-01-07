-- Function to update follower/following counts
CREATE OR REPLACE FUNCTION update_follow_counts()
RETURNS TRIGGER AS $$
BEGIN
    IF TG_OP = 'INSERT' THEN
        UPDATE users SET following_count = following_count + 1 WHERE id = NEW.follower_id;
        UPDATE users SET follower_count = follower_count + 1 WHERE id = NEW.following_id;
    ELSIF TG_OP = 'DELETE' THEN
        UPDATE users SET following_count = following_count - 1 WHERE id = OLD.follower_id;
        UPDATE users SET follower_count = follower_count - 1 WHERE id = OLD.following_id;
    END IF;
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER follow_counts_trigger
AFTER INSERT OR DELETE ON follows
FOR EACH ROW EXECUTE FUNCTION update_follow_counts();

-- Function to update video like counts
CREATE OR REPLACE FUNCTION update_video_like_count()
RETURNS TRIGGER AS $$
BEGIN
    IF TG_OP = 'INSERT' THEN
        UPDATE videos SET like_count = like_count + 1 WHERE id = NEW.video_id;
        UPDATE users SET total_likes_received = total_likes_received + 1 
        WHERE id = (SELECT user_id FROM videos WHERE id = NEW.video_id);
    ELSIF TG_OP = 'DELETE' THEN
        UPDATE videos SET like_count = like_count - 1 WHERE id = OLD.video_id;
        UPDATE users SET total_likes_received = total_likes_received - 1 
        WHERE id = (SELECT user_id FROM videos WHERE id = OLD.video_id);
    END IF;
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER video_like_count_trigger
AFTER INSERT OR DELETE ON likes
FOR EACH ROW EXECUTE FUNCTION update_video_like_count();
