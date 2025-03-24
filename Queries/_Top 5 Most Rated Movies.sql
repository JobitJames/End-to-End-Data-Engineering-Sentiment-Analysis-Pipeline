SELECT m.title, COUNT(*) AS total_ratings
FROM movielens_clean.ratings_fact r
JOIN movielens_clean.movies_dim m ON r.movieId = m.movieId
GROUP BY m.title
ORDER BY total_ratings DESC
LIMIT 5;
