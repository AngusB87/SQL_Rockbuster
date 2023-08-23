-- Finding countries that have top 5 customers from top 10 cities using CTE

WITH top_customers (customer_id, first_name, last_name, city, country) AS
(SELECT A.customer_id, A.first_name, A.last_name, C.city, D.country,
SUM(E.amount) AS total_amount_paid
FROM customer A
	INNER JOIN address B ON A.address_id = B.address_id
	INNER JOIN city C ON B.city_id = C.city_id
	INNER JOIN country D ON C.country_id = D.country_id
	INNER JOIN payment E ON A.customer_id = E.customer_id
WHERE city IN ('Aurora','Atlixco','Xintai','Adoni','Dhule (Dhulia)','Kurashiki','Pingxiang','Sivas','Celaya','So Leopoldo')
GROUP BY A.customer_id, first_name, last_name, city, country
ORDER BY total_amount_paid DESC
LIMIT 5)
SELECT D.country,
COUNT(A.customer_id) AS all_customer_count, COUNT(top_customers) AS top_customer_count
FROM customer A
	INNER JOIN address B ON A.address_id = B.address_id
	INNER JOIN city C ON B.city_id = C.city_id
	INNER JOIN country D ON C.country_id = D.country_id
	LEFT JOIN top_customers ON A.customer_id = top_customers.customer_id
GROUP BY D.country
HAVING COUNT (top_customers) > 0
ORDER BY COUNT (top_customers) DESC;