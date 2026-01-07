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

-- Insert skills data
INSERT INTO skills (name, slug, category, description) VALUES
-- Programming Languages
('JavaScript', 'javascript', 'Programming Language', 'Popular web programming language'),
('TypeScript', 'typescript', 'Programming Language', 'Typed superset of JavaScript'),
('Python', 'python', 'Programming Language', 'Versatile high-level programming language'),
('Go', 'go', 'Programming Language', 'Fast and efficient compiled language'),
('Java', 'java', 'Programming Language', 'Enterprise-grade object-oriented language'),
('C#', 'csharp', 'Programming Language', 'Microsoft .NET programming language'),
('C++', 'cpp', 'Programming Language', 'High-performance systems programming language'),
('PHP', 'php', 'Programming Language', 'Server-side scripting language'),
('Ruby', 'ruby', 'Programming Language', 'Dynamic object-oriented language'),
('Swift', 'swift', 'Programming Language', 'Apple iOS/macOS development language'),
('Kotlin', 'kotlin', 'Programming Language', 'Modern Android development language'),
('Rust', 'rust', 'Programming Language', 'Memory-safe systems programming language'),
('Scala', 'scala', 'Programming Language', 'Functional and object-oriented language'),
('R', 'r-language', 'Programming Language', 'Statistical computing language'),
('MATLAB', 'matlab', 'Programming Language', 'Numerical computing environment'),

-- Frameworks & Libraries
('React', 'react', 'Framework', 'JavaScript library for building UIs'),
('Vue.js', 'vuejs', 'Framework', 'Progressive JavaScript framework'),
('Angular', 'angular', 'Framework', 'TypeScript-based web framework'),
('Next.js', 'nextjs', 'Framework', 'React framework for production'),
('Nuxt.js', 'nuxtjs', 'Framework', 'Vue.js framework for SSR'),
('Node.js', 'nodejs', 'Framework', 'JavaScript runtime for server-side'),
('Express.js', 'expressjs', 'Framework', 'Minimal Node.js web framework'),
('Django', 'django', 'Framework', 'Python web framework'),
('Flask', 'flask', 'Framework', 'Lightweight Python web framework'),
('FastAPI', 'fastapi', 'Framework', 'Modern Python API framework'),
('Spring Boot', 'spring-boot', 'Framework', 'Java application framework'),
