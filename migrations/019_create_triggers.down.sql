DROP TRIGGER IF EXISTS video_like_count_trigger ON likes;
DROP FUNCTION IF EXISTS update_video_like_count();

DROP TRIGGER IF EXISTS follow_counts_trigger ON follows;
DROP FUNCTION IF EXISTS update_follow_counts();
