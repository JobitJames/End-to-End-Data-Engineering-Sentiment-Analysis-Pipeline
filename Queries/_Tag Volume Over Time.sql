SELECT d.year, d.month, COUNT(*) AS total_tags
FROM movielens_clean.tags_fact t
JOIN movielens_clean.date_dim d ON DATE(t.tag_timestamp) = DATE(d.review_datetime)
GROUP BY d.year, d.month
ORDER BY d.year, d.month;
