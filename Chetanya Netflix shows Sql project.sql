#Find the Top 10 Countries with the Most Shows:
SELECT country, COUNT(*) AS show_count
FROM netflix_shows
GROUP BY country
ORDER BY show_count DESC
LIMIT 10;


#Find Shows with Unique Titles:
SELECT title, COUNT(*) AS count FROM netflix_shows GROUP BY title HAVING COUNT(*) = 1;


#Find Movies Released in the Last 5 Years:
SELECT *
FROM netflix_shows
WHERE type = 'Movie' AND release_year >= YEAR(CURRENT_DATE) - 5;


#Count the Number of Movies and TV Shows Released Each Year:
SELECT release_year, 
       SUM(CASE WHEN type = 'Movie' THEN 1 ELSE 0 END) AS movie_count,
       SUM(CASE WHEN type = 'TV Show' THEN 1 ELSE 0 END) AS tv_show_count
FROM netflix_shows
GROUP BY release_year
ORDER BY release_year;


#Find the Top 5 Countries with the Most Movies:
SELECT country, COUNT(*) AS movie_count
FROM netflix_shows
WHERE type = 'Movie'
GROUP BY country
ORDER BY movie_count DESC
LIMIT 5;


#Find Shows with Titles Containing "&":
SELECT *
FROM netflix_shows
WHERE title LIKE '%&%';


#Find Shows with the Same Duration (e.g., 60 minutes):
SELECT duration, COUNT(*) AS count
FROM netflix_shows
GROUP BY duration
HAVING COUNT(*) > 1;


#Find top 5 Most Common First Word in Show Titles:
SELECT SUBSTRING_INDEX(title, ' ', 1) AS first_word, COUNT(*) AS word_count
FROM netflix_shows
GROUP BY first_word
ORDER BY word_count DESC
limit 5;


#Find Shows with Titles That Start with a Numeric Digit:
SELECT *
FROM netflix_shows
WHERE title REGEXP '^[0-9]';


#Find Shows with Titles in All Uppercase:
SELECT *
FROM netflix_shows
WHERE BINARY title = UPPER(title);


#Count the Number of Shows per Show Type:
SELECT type, COUNT(*) AS show_count FROM netflix_shows GROUP BY type;


#Filter by Country (e.g., India):
SELECT * FROM netflix_shows WHERE country = 'India';


#Average Release Year by Country:
SELECT country, AVG(release_year) AS avg_release_year FROM netflix_shows GROUP BY country;


#Find Top 10 Newest Show:
SELECT * FROM netflix_shows ORDER BY release_year DESC LIMIT 10;


#Find Top 5 Shows with Unique Titles:
SELECT title, COUNT(*) AS count FROM netflix_shows GROUP BY title HAVING COUNT(*) limit 5;


#Find Shows with the Same Title:
SELECT title, COUNT(*) AS count FROM netflix_shows GROUP BY title HAVING COUNT(*) > 1;


#Find Shows Released in a Specific Year Range (e.g., 2010-2020):
SELECT * FROM netflix_shows WHERE release_year BETWEEN 2010 AND 2020;


#Find Shows Released Before a Certain Year (e.g., before 2000):
SELECT * FROM netflix_shows WHERE release_year < 2000;


#Count the Number of Movies Released Each Year:
SELECT release_year, COUNT(*) AS movie_count FROM netflix_shows WHERE type = 'Movie' GROUP BY release_year;


#Find the Year with the Highest Number of Show Releases (Top 5):
SELECT release_year, COUNT(*) AS release_count
FROM netflix_shows
GROUP BY release_year
ORDER BY release_count DESC
LIMIT 5;


#Find Shows with Titles Containing Special Characters (e.g., "-"):
SELECT show_id, type, title, country, release_year, duration, listed_inside
FROM netflix_shows
WHERE title REGEXP '-';


#Find Shows with Titles That Contain Numbers and Letters:
SELECT show_id, type, title, country, release_year, duration, listed_inside
FROM netflix_shows
WHERE title REGEXP '[0-9]' AND title REGEXP '[A-Za-z]';


#Find Movies That Were Released in More than One Country:
SELECT show_id, type, title, release_year, duration, listed_inside, country
FROM netflix_shows
WHERE type = 'Movie'
AND show_id IN (
    SELECT show_id
    FROM netflix_shows
    WHERE type = 'Movie'
    GROUP BY show_id
    HAVING COUNT(DISTINCT country) > 1
);


#Calculate the Total Number of Shows Released Each Year, Grouped by Show Type:
SELECT release_year, type, COUNT(*) AS show_count
FROM netflix_shows
GROUP BY release_year, type;


#Find TV Shows with the Same Title But Different Release Years:
SELECT title, GROUP_CONCAT(DISTINCT release_year ORDER BY release_year ASC) AS release_years
FROM netflix_shows
WHERE type = 'TV Show'
GROUP BY title
HAVING COUNT(DISTINCT release_year) > 1;




















