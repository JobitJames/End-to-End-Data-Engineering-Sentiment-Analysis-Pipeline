# MovieLens 32M - End-to-End Data Engineering & Sentiment Analysis Pipeline

📌 Project Overview

This project is a complete, cloud-based data engineering pipeline built using the MovieLens 32M dataset. It demonstrates how to design, build, and visualize large-scale data workflows using Google Cloud technologies, with a final goal of delivering actionable insights through an interactive Looker Studio dashboard.

Alongside standard rating analytics, this project also includes sentiment analysis on user-generated movie tags, pushing the pipeline into NLP territory.

📦 Dataset Summary

Source: [MovieLens 32M](https://grouplens.org/datasets/movielens/)

| Feature        | Details               |
|----------------|-----------------------|
| **Users**      | 200,948               |
| **Movies**     | 87,585                |
| **Ratings**    | 32,000,204            |
| **Tags**       | 2,000,072             |
| **Time Period**| Jan 9, 1995 – Oct 12, 2023 |
| **Files Used** | ratings.csv, movies.csv, tags.csv |

All data is anonymized and does not contain any demographic or personally identifiable information.
---

🧱 Tech Stack

| Layer           | Tools / Technologies              |
|-----------------|-----------------------------------|
| **Data Storage**| Google Cloud Storage (GCS)        |
| **Data Warehouse** | Google BigQuery                |
| **Processing**  | SQL, Python, BigQuery Notebooks   |
| **Visualization** | Looker Studio                   |
| **NLP**         | TextBlob (for sentiment analysis) |

🗂️ Data Pipeline Architecture
<img src="images/architecture_s.jpg" width="1500">

## 🔄 ETL Pipeline Process

### Ingest:

- **Uploaded raw CSV files** to Google Cloud Storage bucket (`raw/` folder).
- **Created external tables** in BigQuery to link GCS files without duplication.

### Transform:

- **Converted UNIX timestamps** to human-readable dates.
- **Built normalized fact and dimension tables** in the `movielens_clean` dataset.
- **Aggregated sentiment scores** from user tags using **TextBlob** (via Python).

### Model:

- **Designed a clean star schema** for the dataset.
- **Created dashboard-ready views** such as `ratings_enriched` and `sentiment_enriched`.

### Visualize:

- **Connected Looker Studio** to BigQuery.
- **Built charts** for:
  - Top-rated movies
  - Rating trends over time
  - Genre-wise breakdowns
  - Sentiment-based rankings (positive/polarizing)


<img src="images/6674bdb3-19bd-4685-8c24-a1a5342c7cf7.svg" alt="Mermaid Chart" width="300">

🧠 Data Modeling (Star Schema)
<img src="images/schema.png" width="1500">

## 🟨 ratings_fact

| Column            | Description                                   |
|-------------------|-----------------------------------------------|
| user_id           | ID of the user                                |
| movie_id          | ID of the movie                               |
| rating            | Rating (0.5 to 5.0)                           |
| rating_timestamp  | When the rating was submitted                 |

## 🟩 movies_dim

| Column   | Description                                |
|----------|--------------------------------------------|
| movie_id | Unique movie ID                           |
| title    | Movie title with release year             |
| genres   | Pipe-separated genres (e.g. Drama|Action) |

## 🟦 date_dim

| Column    | Description               |
|-----------|---------------------------|
| date_id   | UUID or derived timestamp |
| full_date | YYYY-MM-DD format         |
| year      | Year                      |
| month     | Month                     |
| day       | Day                       |

## 🟧 tags_fact

| Column         | Description                                |
|----------------|--------------------------------------------|
| user_id        | User who submitted the tag                 |
| movie_id       | Movie associated with the tag             |
| tag_text       | Free-text tag content                     |
| tag_timestamp  | Timestamp of tag submission               |

## 🔍 tags_sentiment_summary

| Column          | Description                                  |
|-----------------|----------------------------------------------|
| movie_id        | Movie ID                                     |
| positive        | Count of positive tags                       |
| negative        | Count of negative tags                       |
| neutral         | Count of neutral tags                        |
| polarizing_score| Sum of positive + negative                   |

<img src="images/ratingsfact.png" width="1500">
<img src="images/moviesdim.png" width="1500">
<img src="images/date_dim.png" width="1500">
<img src="images/tags_fact.png" width="1500">
<img src="images/tags_summary.png" width="1500">


## 🎯 Goal: Sentiment Analysis on Movie Tags

### Data We’ll Use:
The **movielens_clean.tags_fact** table contains the following columns:

| Column        | Example            |
|---------------|--------------------|
| userId        | 234                |
| movieId       | 102                |
| tag_text      | "masterpiece"      |
| tag_timestamp | 2021-03-04         |

### 💡 Approach (BigQuery + Python Notebook)

**Extract Data from BigQuery**:
   - Use BigQuery to extract `tag_text` data from the `tags_fact` table for sentiment analysis.
   - Query the table for tags that are relevant or for a particular time period.

**Sentiment Analysis with Python**:
   - Use a Python Notebook to process the extracted tag text.
   - Leverage the **TextBlob** library (or another NLP tool) to analyze the sentiment of each tag text.
   - Classify the sentiment as **positive**, **negative**, or **neutral** based on the sentiment polarity score.

<img src="images/St1.png" width="1500">  
<img src="images/st2.png" width="1500">  
<img src="images/st3.png" width="1500">  





