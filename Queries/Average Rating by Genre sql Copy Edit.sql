SELECT genre, AVG(r.rating) AS avg_rating
FROM movielens_clean.ratings_fact r
JOIN movielens_clean.movies_dim m ON r.movieId = m.movieId,
UNNEST(SPLIT(m.genres, '|')) AS genre
GROUP BY genre
ORDER BY avg_rating DESC;
