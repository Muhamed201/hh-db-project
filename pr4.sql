(
    SELECT 
        'vacancy' AS type,
        DATE_TRUNC('month', published_at) AS month,
        COUNT(*) AS total_count
    FROM vacancies
    GROUP BY 1, 2
    ORDER BY total_count DESC
    LIMIT 1
)
UNION ALL
(
    SELECT 
        'resume' AS type,
        DATE_TRUNC('month', published_at) AS month,
        COUNT(*) AS total_count
    FROM resumes
    GROUP BY 1, 2
    ORDER BY total_count DESC
    LIMIT 1
);