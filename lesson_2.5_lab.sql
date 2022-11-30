USE sakila;

-- Select all the actors with the first name ‘Scarlett’.

SELECT * 
FROM actor 
WHERE first_name='Scarlett';

-- How many films (movies) are available for rent and how many films have been rented?

SELECT COUNT(DISTINCT(rental_id)) AS 'num_films_available'
FROM rental 
WHERE return_date IS NULL;

-- OR --

SELECT COUNT(DISTINCT(film_id)) AS 'num_films_available'
FROM film;

-- What are the shortest and longest movie duration? Name the values max_duration and min_duration.
SELECT MAX(length) AS 'max_duration',
MIN(length) AS 'min_duration'
FROM film;

-- What's the average movie duration expressed in format (hours, minutes)?
SELECT CONCAT(FLOOR(AVG(length)/60),'h',' ',FLOOR(AVG(length)%60),'m') AS 'formatted_average_duration',
ROUND(AVG(length),2) AS 'average_duration'
FROM film;

-- How many distinct (different) actors' last names are there?
SELECT COUNT(DISTINCT(last_name)) AS 'distinct_last_names'
FROM actor;

-- Since how many days has the company been operating (check DATEDIFF() function)?
SELECT DATEDIFF(MAX(rental_date),MIN(rental_date)) AS 'days_of_operation'
FROM rental;

-- Show rental info with additional columns month and weekday. Get 20 results.
SELECT *,
DATE_FORMAT(rental_date, "%M") AS 'month_of_rental',
DATE_FORMAT(rental_date, "%a") AS 'weekday_of_rental'
FROM rental
LIMIT 20;

-- Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
SELECT *,
CASE
WHEN DATE_FORMAT(rental_date, "%a") IN ('Mon','Tue','Wed','Thu','Fri') THEN 'workday'
WHEN DATE_FORMAT(rental_date, "%a") IN ('Sat','Sun') THEN 'weekend'
ELSE 'invalid day'
END AS 'type_of_day'
FROM rental;

-- Get release years.
SELECT DISTINCT(release_year) 
FROM film;

-- Get all films with ARMAGEDDON in the title.
SELECT * 
FROM film 
WHERE title LIKE '%ARMAGEDDON%';

-- Get all films which title ends with APOLLO.
SELECT * 
FROM film 
WHERE title LIKE '%APOLLO';

-- Get 10 OF the longest films.
SELECT * 
FROM film 
ORDER BY length DESC LIMIT 10;

-- How many films include Behind the Scenes content?
SELECT COUNT(film_id) AS 'num_films'
FROM film 
WHERE special_features LIKE '%Behind the Scenes%';