--1. How many actors are there with the last name ‘Wahlberg’?

--Answer = 2 actors.

SELECT last_name
FROM actor
WHERE last_name = 'Wahlberg';

--2. How many payments were made between $3.99 and $5.99?

--answer = 4764 payments made.

SELECT COUNT(amount)
FROM payment
WHERE amount BETWEEN 3.99 AND 5.99;

--3. What film does the store have the most of? (search in inventory)

--answer = film id #200 (Curtain Videotape) with a total count of 9.

SELECT film_id, COUNT(film_id)
FROM inventory
GROUP BY film_id
ORDER BY COUNT(film_id) DESC

SELECT title, film_id
FROM film
WHERE film_id = 200;

--4. How many customers have the last name ‘William’?

--answer = 0 customers.

SELECT last_name
FROM customer
WHERE last_name = 'William';

--5. What store employee (get the id) sold the most rentals?

--answer = staff id #1 (Mike Hillyer) @ 8040 sold.

SELECT DISTINCT(staff_id), COUNT(rental_id)
FROM rental
GROUP BY staff_id
ORDER BY COUNT(rental_ID);

SELECT staff_id, first_name, last_name
FROM staff

--6. How many different district names are there?

--answer =378 differnent district names.

SELECT COUNT( DISTINCT district)
FROM address;

--7. What film has the most actors in it? (use film_actor table and get film_id)

--answer = film #508 (Lambs Cincinatti) has 16 actors

SELECT DISTINCT film_id, COUNT(actor_id)
FROM film_actor
GROUP BY film_id
ORDER BY COUNT(actor_id) DESC

SELECT title, film_id
FROM film
WHERE film_id = 508;

--8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)

--answer = 13 customers.

SELECT last_name, store_id
FROM customer
WHERE last_name LIKE '%es' AND store_id = 1;

--9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers
--   with ids between 380 and 430? (use group by and having > 250)

--answer = 0

SELECT amount, COUNT(rental_id) > 250, customer_id BETWEEN 380 AND 430
FROM payment
GROUP BY amount, customer_id
HAVING COUNT(rental_id) > 250;

--10. Within the film table, how many rating categories are there? And what rating has the most
--    movies total?

--answer = 5 rating categories, PG-13 has the most movies at a count of 223.

SELECT DISTINCT rating, COUNT(film_id)
FROM film
GROUP BY rating
ORDER BY COUNT(film_id) DESC;
