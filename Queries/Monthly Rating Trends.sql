SELECT d.year, d.month, COUNT(*) AS total_ratings
FROM movielens_clean.ratings_fact r
JOIN movielens_clean.date_dim d ON DATE(r.rating_timestamp) = DATE(d.review_datetime)
GROUP BY d.year, d.month
ORDER BY d.year, d.month;
