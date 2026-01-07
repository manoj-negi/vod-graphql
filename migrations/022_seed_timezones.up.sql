INSERT INTO timezones (name, display_name, utc_offset, utc_offset_minutes, country_code) VALUES
-- Americas
('America/New_York', 'Eastern Time (US & Canada)', '-05:00', -300, 'US'),
('America/Chicago', 'Central Time (US & Canada)', '-06:00', -360, 'US'),
('America/Denver', 'Mountain Time (US & Canada)', '-07:00', -420, 'US'),
('America/Los_Angeles', 'Pacific Time (US & Canada)', '-08:00', -480, 'US'),
('America/Anchorage', 'Alaska', '-09:00', -540, 'US'),
('Pacific/Honolulu', 'Hawaii', '-10:00', -600, 'US'),
('America/Toronto', 'Eastern Time (Canada)', '-05:00', -300, 'CA'),
('America/Vancouver', 'Pacific Time (Canada)', '-08:00', -480, 'CA'),
('America/Mexico_City', 'Mexico City', '-06:00', -360, 'MX'),
('America/Sao_Paulo', 'Brasilia', '-03:00', -180, 'BR'),
('America/Buenos_Aires', 'Buenos Aires', '-03:00', -180, 'AR'),
('America/Santiago', 'Santiago', '-04:00', -240, 'CL'),
('America/Bogota', 'Bogota', '-05:00', -300, 'CO'),
('America/Lima', 'Lima', '-05:00', -300, 'PE'),

-- Europe
('Europe/London', 'London', '+00:00', 0, 'GB'),
('Europe/Paris', 'Paris', '+01:00', 60, 'FR'),
('Europe/Berlin', 'Berlin', '+01:00', 60, 'DE'),
('Europe/Rome', 'Rome', '+01:00', 60, 'IT'),
('Europe/Madrid', 'Madrid', '+01:00', 60, 'ES'),
('Europe/Amsterdam', 'Amsterdam', '+01:00', 60, 'NL'),
('Europe/Brussels', 'Brussels', '+01:00', 60, 'BE'),
('Europe/Stockholm', 'Stockholm', '+01:00', 60, 'SE'),
('Europe/Oslo', 'Oslo', '+01:00', 60, 'NO'),
('Europe/Copenhagen', 'Copenhagen', '+01:00', 60, 'DK'),
('Europe/Helsinki', 'Helsinki', '+02:00', 120, 'FI'),
('Europe/Athens', 'Athens', '+02:00', 120, 'GR'),
('Europe/Istanbul', 'Istanbul', '+03:00', 180, 'TR'),
('Europe/Moscow', 'Moscow', '+03:00', 180, 'RU'),
('Europe/Zurich', 'Zurich', '+01:00', 60, 'CH'),
('Europe/Vienna', 'Vienna', '+01:00', 60, 'AT'),
('Europe/Warsaw', 'Warsaw', '+01:00', 60, 'PL'),
('Europe/Prague', 'Prague', '+01:00', 60, 'CZ'),
('Europe/Lisbon', 'Lisbon', '+00:00', 0, 'PT'),
('Europe/Dublin', 'Dublin', '+00:00', 0, 'IE'),

-- Asia & Pacific
('Asia/Dubai', 'Dubai', '+04:00', 240, 'AE'),
('Asia/Kolkata', 'India Standard Time', '+05:30', 330, 'IN'),
('Asia/Singapore', 'Singapore', '+08:00', 480, 'SG'),
('Asia/Hong_Kong', 'Hong Kong', '+08:00', 480, 'HK'),
('Asia/Tokyo', 'Tokyo', '+09:00', 540, 'JP'),
('Asia/Seoul', 'Seoul', '+09:00', 540, 'KR'),
('Asia/Shanghai', 'Beijing', '+08:00', 480, 'CN'),
('Asia/Bangkok', 'Bangkok', '+07:00', 420, 'TH'),
('Asia/Jakarta', 'Jakarta', '+07:00', 420, 'ID'),
('Asia/Manila', 'Manila', '+08:00', 480, 'PH'),
('Asia/Kuala_Lumpur', 'Kuala Lumpur', '+08:00', 480, 'MY'),
('Asia/Karachi', 'Karachi', '+05:00', 300, 'PK'),
('Asia/Dhaka', 'Dhaka', '+06:00', 360, 'BD'),
('Asia/Ho_Chi_Minh', 'Hanoi', '+07:00', 420, 'VN'),
('Asia/Taipei', 'Taipei', '+08:00', 480, 'TW'),
('Asia/Jerusalem', 'Jerusalem', '+02:00', 120, 'IL'),
('Asia/Riyadh', 'Riyadh', '+03:00', 180, 'SA'),
('Australia/Sydney', 'Sydney', '+10:00', 600, 'AU'),
('Australia/Melbourne', 'Melbourne', '+10:00', 600, 'AU'),
('Australia/Perth', 'Perth', '+08:00', 480, 'AU'),
('Pacific/Auckland', 'Auckland', '+12:00', 720, 'NZ'),

-- Africa
('Africa/Cairo', 'Cairo', '+02:00', 120, 'EG'),
('Africa/Johannesburg', 'Johannesburg', '+02:00', 120, 'ZA'),
('Africa/Lagos', 'Lagos', '+01:00', 60, 'NG'),

-- UTC
('UTC', 'Coordinated Universal Time', '+00:00', 0, NULL)
ON CONFLICT (name) DO NOTHING;

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
