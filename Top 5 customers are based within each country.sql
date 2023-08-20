# CTE

WITH top_5_customers AS
	(SELECT customer.customer_id AS Customer_ID, 
		   customer.first_name AS Customer_First_Name,
		   customer.last_name AS Customer_Last_Name,
		   country.country AS Country,
		   city.city AS City,
		   SUM(payment.amount) AS Total_Amount_Paid
	FROM customer
	INNER JOIN address ON customer.address_id = address.address_id
	INNER JOIN city ON address.city_id = city.city_id
	INNER JOIN country ON city.country_id = country.country_id
	INNER JOIN payment ON customer.customer_id = payment.customer_id
	WHERE city.city_id IN (42, 312, 401, 179, 197, 43, 307, 216, 339, 252)
	GROUP BY customer.customer_id, country.country, city.city
	ORDER BY Total_Amount_Paid DESC
	LIMIT 5)

SELECT country.country,
	   COUNT(DISTINCT customer.customer_id) AS all_customer_count,
	   COUNT(DISTINCT top_5_customers) AS top_customer_count
FROM customer
INNER JOIN address ON customer.address_id = address.address_id
INNER JOIN city ON address.city_id = city.city_id
INNER JOIN country ON city.country_id = country.country_id
LEFT JOIN top_5_customers ON customer.customer_id = top_5_customers.customer_id
GROUP BY country.country
HAVING COUNT(DISTINCT top_5_customers) > 0
ORDER BY top_customer_count DESC


# SUBQUERIES
	
SELECT country.country,
	   COUNT(DISTINCT customer.customer_id) AS all_customer_count,
	   COUNT(DISTINCT top_5_customers) AS top_customer_count
FROM customer
INNER JOIN address ON customer.address_id = address.address_id
INNER JOIN city ON address.city_id = city.city_id
INNER JOIN country ON city.country_id = country.country_id
LEFT JOIN
	   (SELECT customer.customer_id AS Customer_ID, 
	   		   customer.first_name AS Customer_First_Name,
		       customer.last_name AS Customer_Last_Name,
	  	       country.country AS Country,
	   		   city.city AS City,
			   SUM(payment.amount) AS Total_Amount_Paid
		FROM customer
		INNER JOIN address ON customer.address_id = address.address_id
		INNER JOIN city ON address.city_id = city.city_id
		INNER JOIN country ON city.country_id = country.country_id
		INNER JOIN payment ON customer.customer_id = payment.customer_id
		WHERE city.city_id IN (42, 312, 401, 179, 197, 43, 307, 216, 339, 252)
		GROUP BY customer.customer_id, country.country, city.city
		ORDER BY Total_Amount_Paid DESC
		LIMIT 5) AS top_5_customers 
		ON customer.customer_id = top_5_customers.customer_id
GROUP BY country.country
HAVING COUNT(DISTINCT top_5_customers) > 0
ORDER BY top_customer_count DESC
