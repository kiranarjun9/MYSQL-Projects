create database movie_db;
use movie_db;
select * from movie;
-- i. Write a SQL query to find when the movie 'American Beauty' released. Return movie release year.
select mov_title,mov_year from movie where mov_title='American Beauty';
-- ii. Write a SQL query to find those movies, which were released before 1998. Return movie title.
select mov_title,mov_year from movie where mov_year<'1998';
-- iii. Write a query where it should contain all the data of the movies which were released after 1995 and their movie duration was greater than 120.
select mov_year,mov_time from movie  where mov_year>1995 and mov_time>120;
-- iv. Write a query to determine the Top 7 movies which were released in United Kingdom. Sort the data in ascending order of the movie year.
select mov_title,mov_rel_country,mov_year from movie where mov_rel_country='UK' order by mov_year asc limit 7;
-- v. Set the language of movie language as 'Chinese' for the movie which has its existing language as Japanese and the movie year was 2001.
select mov_lang,mov_year from movie where mov_lang='japanese' and mov_year='2001';
update movie set mov_lang='chinese' where mov_lang='japanese' and mov_year=2001;
-- vi. Write a SQL query to find name of all the reviewers who rated the movie 'Slumdog Millionaire'.
select re.rev_id,r.rev_stars,m.mov_title from reviewer re inner join ratings r using(rev_id) inner join movie m using(mov_id) where m.mov_title='Slumdog Millionaire';
-- vii. Write a query which fetch the first name, last name & role played by the actor where output should all exclude Male actors.--
 select a.act_fname,a.act_lname,a.act_gender,c.role from actor a inner join cast c on a.act_id=c.act_id where act_gender='f';
-- viii. Write a SQL query to find the actors who played a role in the movie 'Annie Hall'. Fetch all the fields of actor table. (Hint: Use the IN operator).
select a.act_id,a.act_fname,a.act_lname,a.act_gender,c.role,m.mov_title from actor a inner join cast c using(act_id) inner join movie m using(mov_id) where m.mov_title in ('Annie Hall');
-- ix. Write a SQL query to find those movies that have been released in countries other than the United Kingdom. Return movie title, movie year, movie time, and date of release, releasing country.
select mov_title,mov_year,mov_time,mov_dt_rel,mov_rel_country from movie where not mov_rel_country='uk';
select * from genres;
-- x. Print genre title, maximum movie duration and the count the number of movies in each genre. (HINT: By using inner join)
select g.gen_title,max(m.mov_time) as max_movie_duration,count(m.mov_title) as movies_each_genres from genres g inner join movie_genres mg using (gen_id) inner join movie m using(mov_id) group by g.gen_title;
-- xi. Create a view which should contain the first name, last name, title of the movie & role played by particular actor.
create view Actor_Information as
(select a.act_fname,a.act_lname,m.mov_title,c.role from actor a inner join cast c using(act_id) inner join movie m using(mov_id));
select * from actor_information;
-- xii. Write a SQL query to find the movies with the lowest ratings
 select m.mov_title,r.rev_stars from movie m inner join ratings r using(mov_id) order by r.rev_stars asc;
