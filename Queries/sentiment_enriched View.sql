CREATE OR REPLACE VIEW movielens_clean.sentiment_enriched AS
SELECT
  s.movieId,
  m.title,
  m.genres,
  IFNULL(s.positive, 0) AS positive_tags,
  IFNULL(s.negative, 0) AS negative_tags,
  IFNULL(s.neutral, 0) AS neutral_tags,
  (IFNULL(s.positive, 0) + IFNULL(s.negative, 0)) AS polarizing_score
FROM
  movielens_clean.tags_sentiment_summary s
JOIN
  movielens_clean.movies_dim m ON s.movieId = m.movieId;
