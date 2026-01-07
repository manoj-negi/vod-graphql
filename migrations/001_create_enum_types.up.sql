-- Create ENUM types
CREATE TYPE device_type_enum AS ENUM ('ios', 'android', 'web');
CREATE TYPE proficiency_level_enum AS ENUM ('Beginner', 'Intermediate', 'Advanced', 'Expert');
CREATE TYPE report_status_enum AS ENUM ('pending', 'reviewed', 'action_taken', 'dismissed');
CREATE TYPE notification_type_enum AS ENUM ('like', 'feedback', 'follow', 'mention', 'message', 'video_upload');
CREATE TYPE target_type_enum AS ENUM ('video', 'feedback', 'user');
