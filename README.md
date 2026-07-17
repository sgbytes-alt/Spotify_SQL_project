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

