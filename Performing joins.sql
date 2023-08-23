-- Using joins to find top 5 customers within top 10 cities

SELECT A.first_name AS customer_first_name, A.last_name AS customer_last_name, A.customer_id, D.country, city,
SUM(E.amount) AS total_amount_paid
FROM customer A
INNER JOIN address B ON A.address_id = B.address_id
INNER JOIN city C ON B.city_id = C.city_id
INNER JOIN country D ON C.country_id = D.country_id
INNER JOIN payment E ON A.customer_id = E.customer_id
WHERE city IN ('Aurora','Atlixco','Xintai','Adoni','Dhule (Dhulia)','Kurashiki','Pingxiang','Sivas','Celaya','So Leopoldo')
GROUP BY country, city, A.customer_id, customer_first_name, customer_last_name
ORDER BY total_amount_paid DESC
LIMIT 5;