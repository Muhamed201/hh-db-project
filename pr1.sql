CREATE TABLE areas (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE specializations (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE employers (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    area_id INTEGER REFERENCES areas(id)
);

CREATE TABLE candidates (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(150) UNIQUE
);

CREATE TABLE vacancies (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    area_id INTEGER REFERENCES areas(id),
    employer_id INTEGER REFERENCES employers(id),
    specialization_id INTEGER REFERENCES specializations(id),
    compensation_from INTEGER,
    compensation_to INTEGER,
    published_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE resumes (
    id SERIAL PRIMARY KEY,
    candidate_id INTEGER REFERENCES candidates(id),
    title VARCHAR(255) NOT NULL,
    specialization_id INTEGER REFERENCES specializations(id),
    area_id INTEGER REFERENCES areas(id),
    compensation_expected INTEGER,
    published_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE responses (
    id SERIAL PRIMARY KEY,
    vacancy_id INTEGER REFERENCES vacancies(id),
    resume_id INTEGER REFERENCES resumes(id),
    applied_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);