CREATE OR REPLACE VIEW movielens_clean.tags_summary AS
SELECT
  movieId,
  COUNT(*) AS tag_count,
  ARRAY_AGG(DISTINCT tag_text LIMIT 10) AS top_tags
FROM
  movielens_clean.tags_fact
GROUP BY
  movieId;
