(
    SELECT 
        'vacancy' AS type,
        DATE_TRUNC('month', published_at) AS month,
        COUNT(*) AS total_count
    FROM vacancies
    GROUP BY DATE_TRUNC('month', published_at)
    ORDER BY total_count DESC
    LIMIT 1
)
-- не знаю цифрами меньше писать, хотя понимаю, что наверно не понятно будет для остальных
UNION ALL
(
    SELECT 
        'resume' AS type,
        DATE_TRUNC('month', published_at) AS month,
        COUNT(*) AS total_count
    FROM resumes
    GROUP BY DATE_TRUNC('month', published_at)
    ORDER BY total_count DESC
    LIMIT 1
);