-- 1. List all customers who live in Texas
-- No customers live in Texas

SELECT first_name, last_name
FROM customer
INNER JOIN city
ON city.city_id = customer.customer_id
WHERE city = 'Texas';



-- 2. Get all payments above $6.99 with customer's full name
-- There are 8106 payments above $6.99

SELECT first_name, last_name
FROM customer
INNER JOIN payment
ON payment.customer_id = customer.customer_id
WHERE amount > 6.99;



-- 3. Show all customers names who have made payments 
-- over $175
-- 421 customers made payments over $175

SELECT first_name, last_name
FROM customer
WHERE customer_id in (
    SELECT customer_id
    FROM payment
    GROUP BY customer_id
    HAVING SUM(amount) > 175
    ORDER BY SUM(amount) DESC
);



-- 4. List all customers that live in Nepal
-- Nicholas Barfield

SELECT first_name, last_name
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id
INNER JOIN city
ON city.city_id = address.city_id
INNER JOIN country
ON country.country_id = city.city_id
WHERE country = 'Nepal';



-- 5. Which staff member had the most transactions?
-- Jon Stephens

SELECT first_name, last_name
FROM staff
INNER JOIN payment
ON staff.staff_id = payment.staff_id
WHERE amount > 320;



-- 6. How many movies of each rating are there?

SELECT rating
FROM film
INNER JOIN film_category
ON film.film_id = film_category.category_id;



-- 7. Show all customers who have made a single payment
-- above $6.99
-- 598 customers made a single payment above $6.99

SELECT first_name, last_name
FROM customer
WHERE customer_id in (
    SELECT customer_id
    FROM payment
    GROUP BY customer_id
    HAVING SUM(amount) > 6.99
    ORDER BY SUM(amount) DESC
);



-- 8. How many free rentals did our stores give away?
-- 0 free rentals were given away

SELECT amount
FROM payment
INNER JOIN rental
ON payment.rental_id = rental.rental_id
WHERE amount = 0;