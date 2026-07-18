# Spotify_SQL_project

![](https://github.com/sgbytes-alt/Spotify_SQL_project/blob/main/spotify%20logo...jpg)

## Overview

This project analyzes a Spotify dataset using SQL to extract meaningful insights and solve business-oriented problems. It demonstrates SQL concepts including data normalization, data cleaning, exploratory data analysis (EDA), aggregations, window functions, Common Table Expressions (CTEs), query optimization, and advanced SQL queries. The repository contains the dataset, SQL scripts, business questions, solutions, and key findings.

```sql
create table spotify (
	Artist varchar(1000),
	Track varchar(1000),
	Album varchar(1000),
	Album_type varchar(1000),
	Danceability float,
	Energy float,
	Loudness float,
	Speechiness float,
	Acousticness float,
	Instrumentalness float,
	Liveness float,
	Valence float,
	Tempo float,
	Duration_min float,
	Title varchar(1000),
	Channel varchar(1000),
	Views float,
	Likes bigint,
	Comments bigint,
	Licensed boolean,
	official_video boolean,
	Stream bigint,
	EnergyLiveness float,
	most_playedon varchar(1000)
	);
```

## Objectives

- Analyze the Spotify dataset to uncover meaningful insights about tracks, artists, albums, and audio features.
- Explore music trends using SQL by performing data retrieval, filtering, aggregation, and analytical queries.
- Apply SQL concepts such as data normalization, Common Table Expressions (CTEs), window functions, subqueries, and joins to solve business-oriented problems.
- Evaluate track performance using metrics such as streams, views, likes, comments, and audio characteristics.
- Optimize SQL query performance using indexing techniques and query execution analysis.

## Dataset

- Dataset Link: [Spotify dataset](https://www.kaggle.com/datasets/sanjanchaudhari/spotify-dataset)

## Business Problems

### Easy Level

1. Retrieve the names of all tracks that have more than 1 billion streams.
2. List all albums along with their respective artists.
3. 3.Get the total number of comments for tracks where licensed = TRUE.
4. Find all tracks that belong to the album type single.
5. Count the total number of tracks by each artist.
   
### Medium Level
6. Calculate the average danceability of tracks in each album.
7. Find the top 5 tracks with the highest energy values.
8. List all tracks along with their views and likes where official_video = TRUE.
9. For each album, calculate the total views of all associated tracks.
10. Retrieve the track names that have been streamed on Spotify more than YouTube.

### Advanced Level
11. Find the top 3 most-viewed tracks for each artist using window functions.
12. Write a query to find tracks where the liveness score is above the average.
13. Use a WITH clause to calculate the difference between the highest and lowest energy values for tracks in each album.
14. Find tracks where the energy-to-liveness ratio is greater than 1.2.
15. Calculate the cumulative sum of likes for tracks ordered by the number of views, using window functions.

The complete SQL solutions are available in [`spotify_solutions.sql`](https://github.com/sgbytes-alt/Spotify_SQL_project/blob/main/spotify_solutions.sql)

## Query Optimization

To evaluate and improve query performance, an initial performance analysis was conducted using PostgreSQL's `EXPLAIN` statement.
The query retrieved tracks based on the artist column, and the execution plan provided the following performance metrics:

- Execution Time: 7 ms  Planning Time: 0.17 ms
The execution plan helped identify how PostgreSQL processed the query before any optimization techniques were applied.
- Execution Plan Before Optimization:

![]()

