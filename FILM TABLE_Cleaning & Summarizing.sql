# Checking for duplicate data

SELECT title,
	   release_year,
	   language_id,
	   rental_duration,
	   rental_rate,
	   length,
	   replacement_cost,
	   rating,
	   COUNT(*)
FROM film
GROUP BY title,
	     release_year,
		 language_id,
		 rental_duration,
		 rental_rate,
	     length,
	     replacement_cost,
	     rating
HAVING COUNT(*) > 1;

# Checking for non-uniform data in the “release_year” variable

SELECT DISTINCT release_year
FROM film
GROUP BY release_year
ORDER BY release_year

# Checking for non-uniform data in the “rating” variable

SELECT DISTINCT rating
FROM film
GROUP BY rating
ORDER BY rating

# Checking for non-uniform data in the “language_id” column

SELECT DISTINCT language_id
FROM film
GROUP BY language_id
ORDER BY language_id

# Checking for missing values in the “film_id” column

SELECT *
FROM film
WHERE film_id IS NULL

# Checking for missing values in the “title” column

SELECT *
FROM film
WHERE title IS NULL

# Checking for missing values in the “rating” column

SELECT *
FROM film
WHERE rating IS NULL

