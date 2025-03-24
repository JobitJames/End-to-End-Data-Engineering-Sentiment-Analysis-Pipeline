CREATE OR REPLACE TABLE movielens_clean.ratings_fact AS
SELECT
  userId,
  movieId,
  rating,
  TIMESTAMP_SECONDS(CAST(timestamp AS INT64)) AS rating_timestamp
FROM
  movielens_raw.ratings;

