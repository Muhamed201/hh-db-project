INSERT INTO areas (name)
SELECT 'Region ' || i FROM generate_series(1, 50) AS i;

INSERT INTO specializations (name)
SELECT 'Specialization ' || i FROM generate_series(1, 20) AS i;

INSERT INTO employers (name, area_id)
SELECT 'Employer ' || i, (random() * 49 + 1)::int
FROM generate_series(1, 500) AS i;

INSERT INTO candidates (first_name, last_name, email)
SELECT 
    'FirstName' || i, 
    'LastName' || i, 
    'user' || i || '@example.com'
FROM generate_series(1, 50000) AS i;

INSERT INTO vacancies (title, description, area_id, employer_id, specialization_id, compensation_from, compensation_to, published_at)
SELECT 
    'Vacancy ' || i,
    'Description for vacancy ' || i,
    (random() * 49 + 1)::int,
    (random() * 499 + 1)::int,
    (random() * 19 + 1)::int,
    (random() * 40000 + 30000)::int,
    (random() * 60000 + 80000)::int,
    NOW() - (random() * INTERVAL '180 days')
FROM generate_series(1, 10000) AS i;

INSERT INTO resumes (candidate_id, title, specialization_id, area_id, compensation_expected, published_at)
SELECT 
    (random() * 49999 + 1)::int,
    'Resume ' || i,
    (random() * 19 + 1)::int,
    (random() * 49 + 1)::int,
    (random() * 100000 + 40000)::int,
    NOW() - (random() * INTERVAL '180 days')
FROM generate_series(1, 100000) AS i;

INSERT INTO responses (vacancy_id, resume_id, applied_at)
SELECT 
    v.id,
    (random() * 99999 + 1)::int,
    v.published_at + (random() * INTERVAL '30 days')
FROM vacancies v
CROSS JOIN generate_series(1, (random() * 20 + 1)::int)
WHERE random() < 0.7;