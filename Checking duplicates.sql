-- Summarizing film table data

SELECT MIN(rental_rate) AS minimum_rental_rate,
	   MAX(rental_rate) AS maximum_rental_rate,
	   AVG(rental_rate) AS average_rental_rate,
	   MIN(replacement_cost) AS minimum_replacement_cost,
	   MAX(replacement_cost) AS maximum_replacement_cost,
	   AVG(replacement_cost) AS average_replacement_cost,
	   MIN(rental_duration) AS minimum_rental_duration,
	   MAX(rental_duration) AS maximum_rental_duration,
	   AVG(rental_duration) AS average_rental_duration,
	   MIN(length) AS minimum_length,
	   MAX(length) AS maximum_length,
	   AVG(length) AS average_length,
	   MODE() WITHIN GROUP(ORDER BY release_year) AS mode_release_year,
	   MODE() WITHIN GROUP(ORDER BY rating) AS mode_rating,
	   MODE() WITHIN GROUP(ORDER BY language_id) AS mode_language_id,
	   MODE() WITHIN GROUP(ORDER BY special_features) AS mode_special_features,
	   MODE() WITHIN GROUP(ORDER BY last_update) AS mode_last_update
FROM film;