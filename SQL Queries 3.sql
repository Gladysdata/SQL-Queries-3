USE sakila;

#1
SELECT COUNT(DISTINCT last_name)
FROM actor
WHERE last_name IS NOT NULL;

#2
SELECT COUNT(DISTINCT(language_id)) FROM film;

#3
SELECT COUNT(rating) AS PG_13_movies FROM film
WHERE rating = 'PG-13';

#4
SELECT title, length, release_year FROM film
WHERE release_year = 2006
ORDER BY length ASC
LIMIT 10;

#5
SELECT  DATEDIFF(MAX(rental_date), MIN(rental_date))
FROM rental;

#6
SELECT *, DATE_FORMAT(substring(rental_date, 1,10), "%M") as rental_date_month, DATE_FORMAT(substring(rental_date, 1, 10), "%W") as rental_date_weekday
FROM rental LIMIT 20;

#7
SELECT  *, 
CASE
	WHEN (DAYNAME(rental_date) = "Saturday" OR DAYNAME(rental_date) = "Sunday" ) THEN "weekend"
	ELSE "workday"
    END as day_type
from rental
LIMIT 20;

#8
SELECT COUNT(DISTINCT(rental_id)) AS number_of_rentals FROM rental
WHERE rental_date LIKE '2006-02%';