SELECT country.country, country.country_id, COUNT(customer.customer_id) AS number_of_customers
FROM customer
INNER JOIN address ON customer.address_id = address.address_id
INNER JOIN city ON address.city_id = city.city_id
INNER JOIN country ON city.country_id = country.country_id
GROUP BY country.country_id
ORDER BY number_of_customers DESC
LIMIT 10;
