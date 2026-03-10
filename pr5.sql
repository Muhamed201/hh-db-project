SELECT 
    v.id, 
    v.title
FROM vacancies v
JOIN responses r ON v.id = r.vacancy_id
WHERE r.applied_at <= v.published_at + INTERVAL '7 days'
GROUP BY v.id, v.title
HAVING COUNT(r.id) > 5;
