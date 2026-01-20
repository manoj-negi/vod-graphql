-- Insert professions data
INSERT INTO professions (name, slug, category, description) VALUES
-- Technology
('Software Engineer', 'software-engineer', 'Technology', 'Develops and maintains software applications and systems'),
('Full Stack Developer', 'full-stack-developer', 'Technology', 'Works on both frontend and backend development'),
('Frontend Developer', 'frontend-developer', 'Technology', 'Specializes in user interface and client-side development'),
('Backend Developer', 'backend-developer', 'Technology', 'Focuses on server-side logic and database management'),
('Mobile App Developer', 'mobile-app-developer', 'Technology', 'Creates applications for iOS and Android platforms'),
('DevOps Engineer', 'devops-engineer', 'Technology', 'Manages deployment pipelines and infrastructure'),
('Data Scientist', 'data-scientist', 'Technology', 'Analyzes complex data and builds predictive models'),
('Machine Learning Engineer', 'ml-engineer', 'Technology', 'Develops AI and machine learning systems'),
('Cloud Architect', 'cloud-architect', 'Technology', 'Designs and implements cloud infrastructure solutions'),
('Cybersecurity Specialist', 'cybersecurity-specialist', 'Technology', 'Protects systems and data from security threats'),
('QA Engineer', 'qa-engineer', 'Technology', 'Ensures software quality through testing and automation'),
('Database Administrator', 'database-administrator', 'Technology', 'Manages and optimizes database systems'),
('System Administrator', 'system-administrator', 'Technology', 'Maintains and configures computer systems'),

-- Design
('UI/UX Designer', 'ui-ux-designer', 'Design', 'Creates user interfaces and experiences'),
('Graphic Designer', 'graphic-designer', 'Design', 'Designs visual content for various media'),
('Product Designer', 'product-designer', 'Design', 'Designs end-to-end product experiences'),
('Web Designer', 'web-designer', 'Design', 'Creates website layouts and visual elements'),
('Motion Graphics Designer', 'motion-graphics-designer', 'Design', 'Creates animated visual content'),
('3D Artist', '3d-artist', 'Design', 'Creates three-dimensional models and animations'),
('Illustrator', 'illustrator', 'Design', 'Creates original artwork and illustrations'),
('Brand Designer', 'brand-designer', 'Design', 'Develops brand identity and visual systems'),

-- Marketing
('Digital Marketing Specialist', 'digital-marketing-specialist', 'Marketing', 'Manages online marketing campaigns'),
('Content Marketing Manager', 'content-marketing-manager', 'Marketing', 'Creates and manages content strategy'),
('SEO Specialist', 'seo-specialist', 'Marketing', 'Optimizes websites for search engines'),
('Social Media Manager', 'social-media-manager', 'Marketing', 'Manages social media presence and campaigns'),
('Email Marketing Specialist', 'email-marketing-specialist', 'Marketing', 'Creates and manages email campaigns'),
('Growth Hacker', 'growth-hacker', 'Marketing', 'Drives rapid business growth through creative strategies'),
('Marketing Analyst', 'marketing-analyst', 'Marketing', 'Analyzes marketing data and performance'),
('Brand Manager', 'brand-manager', 'Marketing', 'Manages brand strategy and positioning'),

-- Business
('Product Manager', 'product-manager', 'Business', 'Manages product development and strategy'),
('Project Manager', 'project-manager', 'Business', 'Coordinates and manages project execution'),
('Business Analyst', 'business-analyst', 'Business', 'Analyzes business processes and requirements'),
('Operations Manager', 'operations-manager', 'Business', 'Oversees daily business operations'),
('HR Manager', 'hr-manager', 'Business', 'Manages human resources and talent'),

-- Healthcare
('Registered Nurse', 'registered-nurse', 'Healthcare', 'Provides patient care and medical support'),
('Physical Therapist', 'physical-therapist', 'Healthcare', 'Helps patients recover physical function'),
('Medical Assistant', 'medical-assistant', 'Healthcare', 'Supports healthcare providers in clinical settings'),
('Healthcare Administrator', 'healthcare-administrator', 'Healthcare', 'Manages healthcare facilities and operations'),
('Nutritionist', 'nutritionist', 'Healthcare', 'Provides dietary and nutrition guidance'),
('Mental Health Counselor', 'mental-health-counselor', 'Healthcare', 'Provides mental health support and therapy'),

-- Education
('Teacher', 'teacher', 'Education', 'Educates students in various subjects'),
('Online Instructor', 'online-instructor', 'Education', 'Teaches courses through online platforms'),
('Corporate Trainer', 'corporate-trainer', 'Education', 'Provides professional training to employees'),
('Education Consultant', 'education-consultant', 'Education', 'Advises on educational strategies and programs'),
('Curriculum Developer', 'curriculum-developer', 'Education', 'Designs educational content and programs'),

-- Creative
('Video Editor', 'video-editor', 'Creative', 'Edits and produces video content'),
('Photographer', 'photographer', 'Creative', 'Captures professional photographs'),
('Content Creator', 'content-creator', 'Creative', 'Creates engaging content across platforms'),
('Copywriter', 'copywriter', 'Creative', 'Writes compelling marketing and advertising copy'),
('Technical Writer', 'technical-writer', 'Creative', 'Creates technical documentation and guides'),
('Voice Over Artist', 'voice-over-artist', 'Creative', 'Provides voice recordings for various media'),
('Animator', 'animator', 'Creative', 'Creates animated content and characters'),

-- Engineering
('Mechanical Engineer', 'mechanical-engineer', 'Engineering', 'Designs and develops mechanical systems'),
('Electrical Engineer', 'electrical-engineer', 'Engineering', 'Works with electrical systems and components'),
('Civil Engineer', 'civil-engineer', 'Engineering', 'Designs infrastructure and construction projects'),
('Chemical Engineer', 'chemical-engineer', 'Engineering', 'Develops chemical processes and products'),
('Industrial Engineer', 'industrial-engineer', 'Engineering', 'Optimizes production and manufacturing processes'),
('Environmental Engineer', 'environmental-engineer', 'Engineering', 'Develops solutions for environmental challenges')
ON CONFLICT (slug) DO NOTHING;
