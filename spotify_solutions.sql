-- Advanced SQL Project -- Spotify Datasets

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

	select * from spotify;

-- EDA

	select count(*) from spotify;
	
	select count(distinct artist) from spotify;
	
	select count(Album_type ) from spotify;
	
	select max(Duration_min) from spotify;
	
	select min(Duration_min) from spotify;

	select * from spotify 
	where Duration_min = 0;

	delete from spotify 
	where Duration_min = 0;

-----------------------------------------
-- Data Analysis Questions - Easy Level
-----------------------------------------

--1. Retrieve the names of all tracks that have more than 1 billion streams.

	select track, stream from spotify
	where stream > 1000000000;
	
--2. List all albums along with their respective artists.

	select distinct album, artist from spotify
	order by 1;
	
--3. Get the total number of comments for tracks where licensed = TRUE.

	select sum(comments) total_comments from spotify
	where licensed = TRUE;

--4. Find all tracks that belong to the album type single.

	select track from spotify
	where album_type ilike '%single%';

--5. Count the total number of tracks by each artist.

	select artist, count(track) from spotify
	group by artist;

-----------------------------------------
-- Data Analysis Questions - Medium Level
-----------------------------------------

--6. Calculate the average danceability of tracks in each album.

	select album, avg(danceability) from spotify
	group by 1
	order by 2 desc;

--7. Find the top 5 tracks with the highest energy values.

	select track, 
	max(energy) from spotify
	group by track
	order by 2 desc
	limit 5;

--8. List all tracks along with their views and likes where official_video = TRUE.

	select track, views, likes from spotify
	where official_video = TRUE;

--9. For each album, calculate the total views of all associated tracks.

	select album, sum(views)
	from spotify
	group by 1
	order by 2 desc;

--10. Retrieve the track names that have been streamed on Spotify more than YouTube.
	
	with cte as
	(select track, 
	coalesce(sum(case when most_playedon ilike '%youtube%' then stream end),0) as youtube,
	coalesce(sum(case when most_playedon ilike '%spotify%' then stream end),0) as spotify
	from spotify
	group by 1)
	select track, youtube ,spotify from cte 
	where youtube < spotify
	and youtube != 0;

--------------------------------------------
-- Data Analysis Questions - Advanced Level
--------------------------------------------

--11. Find the top 3 most-viewed tracks for each artist using window functions.

	with cte as(
	select artist, track, sum(views) views,
	dense_rank() over(partition by artist order by sum(views) desc) rank
	from spotify
	group by 1,2)
	select artist, track, views from cte
	where rank<=3;
	
--12. Write a query to find tracks where the liveness score is above the average.
	
	with cte as
	(select track, artist, liveness, 
	(select sum(liveness)/count(track) from spotify) avg 
	from spotify
	group by 1,2,3)
	select track, liveness, artist from cte
	where liveness > avg;

--13. Use a WITH clause to calculate the difference between the highest and lowest energy values for tracks in each album.

	with cte as (
	select album, max(energy) highest_energy, 
	min(energy) lowest_energy
	from spotify
	group by 1) 
	select album, highest_energy - lowest_energy as diference
	from cte
	order by 2 desc;

--14. Find tracks where the energy-to-liveness ratio is greater than 1.2.

	select track, energy, liveness, energy/liveness from spotify
	where energy/liveness > 1.2;

--15. Calculate the cumulative sum of likes for tracks ordered by the number of views, using window functions.

	with cte as(
	select track, views, likes ,sum(likes) over( order by views desc) cum_sum
	from spotify
	group by 1,2,3)
	select track, cum_sum from cte;
	
	
	
	
	
