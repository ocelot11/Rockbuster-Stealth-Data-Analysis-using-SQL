# Checking for duplicate data

SELECT customer_id,
	   store_id,
	   first_name,
	   last_name,
	   email,
	   address_id,
	   activebool,
	   COUNT(*)
FROM customer
GROUP BY customer_id,
	     store_id,
	     first_name,
	     last_name,
	     email,
	     address_id,
	     activebool
HAVING COUNT(*) > 1;

# Checking for non-uniform data in the “customer_id” variable

SELECT DISTINCT customer_id
FROM customer
GROUP BY customer_id
ORDER BY customer_id ASC

# Checking for non-uniform data in the “store_id” variable

SELECT DISTINCT store_id
FROM customer
GROUP BY store_id
ORDER BY store_id

# Checking for missing values in the “active” column

SELECT *
FROM customer
WHERE active IS NULL

# Checking for missing values in the “address_id” column

SELECT *
FROM customer
WHERE address_id IS NULL

# Checking for missing values in the “store_id” column

SELECT *
FROM customer
WHERE store_id IS NULL
