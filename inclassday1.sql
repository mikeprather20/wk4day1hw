-- INTRO TO SQL, SELECT ALL FROM actor TABLE
SELECT *
FROM actor;

-- Query for the first name and last NAME
SELECT first_name, last_name
FROM actor;

-- Be more specific.. look for a first name which equals  "Nick"
--using the WHERE clause
SELECT last_name
FROM actor
WHERE first_name = 'Nick';

-- Query being specific again using the "LIKE" clause

SELECT last_name
FROM actor
WHERE first_name LIKE 'Nick';

-- USE LIKE CLAUSE AND WILD CARD (%)
-- get all J names..
SELECT first_name, last_name
FROM actor
WHERE first_name LIKE 'J%';

-- SINGLE CHARACTER WILD CARD ( _ )
SELECT first_name, actor_id
FROM actor
WHERE first_name LIKE 'K___';

--Query for all first names that start with K has 2 letters, then anything goes
SELECT first_name
FROM actor
WHERE first_name LIKE 'k__%';

-- COMPARING OPERATORS
-- > Greater Than
-- < Less Than
-- >= <=
-- THIS IS DIFFERENT: NOT EQUAL TO <>


SELECT *
FROM payment;

-- QUERY WHERE AMOUNTS PAID GREATER THAN $10
SELECT customer_id, amount
FROM payment
WHERE amount > 10;


--QUERY FOR PAYMENTS BETWEEN $10-15
SELECT customer_id, amount
FROM payment
WHERE amount BETWEEN 10.99 AND 14.99

-- LETS order the payments by amount
-- ASC FOR ASCENDING (DEFAULT)
-- DESC FROM DESCENDING
SELECT customer_id, amount, payment_date
FROM payment
WHERE amount > 10
ORDER BY amount DESC;

--LETS order the payments by date
SELECT customer_id, amount
FROM payment
WHERE amount > 10
ORDER BY payment_date DESC;


-- QUERY ALL PAYMENTS NOT EQUAL TO 10.99
SELECT customer_id, amount
FROM payment
WHERE amount <> 10.99
ORDER BY amount;

-- SQL AGGREGATIONS => SUM(), AVG(), COUNT(), MIN(), MAX()

--Query to display the sum of amount greater than or equal to 5.99
SELECT SUM(amount)
FROM payment
WHERE amount >= 5.99;

--Query to display the average of the amount paid great or equal to 5.99
SELECT AVG(amount)
FROM payment
WHERE amount >= 5.99;

--Count up how many amounts paid over or equal to 5.99
SELECT COUNT(amount)
FROM payment
WHERE amount >= 5.99;

-- Query to display the count of DISTINCT amounts paid
--how many unique names/gets rid of dupes
SELECT COUNT(DISTINCT amount)
FROM payment
WHERE amount >= 5.99;

--Query the min amount paid   V-makes an alias down there
SELECT MIN(amount) AS min_amount_paid_greater_than_zero
FROM payment
WHERE amount >= 0;

--Query the max amount paid
SELECT MAX(amount) as most_money_paid
FROM payment;

-- GROUP BY DEMONSTRATION (this works with aggregators)
SELECT amount
FROM payment
WHERE amount = 7.99;

SELECT customer_id
FROM payment;

SELECT customer_id, COUNT(amount)
FROM payment
WHERE amount = 7.99
GROUP BY customer_id;

SELECT customer_id, SUM(amount)
FROM payment
GROUP BY customer_id
ORDER BY SUM(amount) DESC
--- extra ***LIMIT 10
--- extra ***OFFSET 1;

--Add more specificity to the Aggregated result
-- HAVING Clause

SELECT customer_id, SUM(amount)
FROM payment
GROUP BY customer_id
HAVING SUM(amount) < 1000
ORDER BY SUM(amount) DESC
LIMIT 10;

--Query to display the customer_id that showers up more than 1 time group by their email
SELECT * FROM customer;

SELECT COUNT(customer_id), email
FROM customer
WHERE email LIKE 'j__.w%'
GROUP BY email
HAVING COUNT(customer_id) > 0;
--------------------------------------------------------

SELECT last_name, store_id
FROM customer
WHERE last_name LIKE '%es' AND store_id = 1;

SELECT last_name
FROM actor
WHERE last_name = 'Wahlberg';

SELECT COUNT(amount)
FROM payment
WHERE amount BETWEEN 3.99 AND 5.99;

SELECT film_id, COUNT(film_id)
FROM inventory
GROUP BY film_id
ORDER BY COUNT(film_id) DESC
LIMIT 1;

SELECT title, film_id
FROM film
WHERE film_id = 200;

SELECT last_name
FROM customer
WHERE last_name = 'William';

SELECT DISTINCT(staff_id), COUNT(rental_id)
FROM rental
GROUP BY staff_id
ORDER BY COUNT(rental_ID);

SELECT COUNT( DISTINCT district)
FROM address;

SELECT DISTINCT film_id, COUNT(actor_id)
FROM film_actor
GROUP BY film_id
ORDER BY COUNT(actor_id) DESC;

SELECT DISTINCT rating
FROM film;

SELECT actor_id
FROM film_actor;

--payment amounts that had a number of rentals over 250
--with cust. ids between 380 and 430 (use group by and having >250)

SELECT amount, COUNT(rental_id) > 250, customer_id BETWEEN 380 AND 430
FROM payment
GROUP BY amount, customer_id
HAVING COUNT(rental_id) > 250



SELECT customer_id, SUM(amount)
FROM payment
WHERE amount BETWEEN 10.99 AND 14.99
WHERE last_name LIKE '%es' AND store_id = 1;
GROUP BY customer_id
HAVING SUM(amount) < 1000
ORDER BY SUM(amount) DESC;