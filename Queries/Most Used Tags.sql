SELECT LOWER(tag_text) AS tag, COUNT(*) AS frequency
FROM movielens_clean.tags_fact
GROUP BY tag
ORDER BY frequency DESC
LIMIT 8;
