/* 
Queries for Week 3
by Whitney Conner
last updated 2.6.2021
*/
# Why do we use ANSI? So that our code is more compatible with
# other SQL vendor implementations
SET sql_mode = 'ANSI';

#Connect to a schema
USE sakila;

/*---------- # 1 SELECT ---------------------------*/

# The basics
# First, select all rows using the asterick (*)
SELECT * FROM category;

# Select only the unique store ids from the store table
# This is how I figure out how to filter for a value... what values might exist.
SELECT DISTINCT store_id
FROM store;

# Note those lines were written on one line... highlight them and use the format painter.
# What happens?


/*---------- # 2 WHERE ---------------------------*/
# pull the list of film ids with their rating and rental_rate, only for films rated 'G'
SELECT film_id, rating, rental_rate
FROM film
WHERE rating = 'G' 
;

/* add a filter to pull only films that rent for $0.99 */
SELECT film_id, title, `description`, rental_rate
FROM film
#### ADD HERE ####
;
/* which clause do you need? */
/* is the value for rental_rate numeric or text? text values need single quotes around them. numbers do not */
/*if you're not sure, try select distinct rental_rate from film; to see what the possible values are */

/*---------- # 3 GROUP BY ---------------------------*/
# When you GROUP BY, every field in the SELECT statement must either by aggregated (e.g., SUM, COUNT)
# Or, appear in the GROUP BY clause.
# Why? Because group by groups... so if you add something to the SELECT that's not in the groups, 
# SQL doesn't know what to do with it (except count or sum it)

# how many records are returned? why?
SELECT amount
FROM payment
;
# how many records are returned? why?
SELECT DISTINCT amount
FROM payment
;
# how many records are returned? why?
SELECT amount
FROM payment
GROUP BY amount
;

#debugging 101
# what's wrong with this statement?
SELECT staff_id, amount
FROM payment
GROUP BY amount
;

#pull the combinations of rental rates and replacement costs in the film table, only for those films that are rated PG-13
SELECT rental_rate, replacement_cost
FROM film
#### ADD HERE ####
#### ADD HERE ####
;

/*---------- # 4 HAVING ---------------------------*/
# this is an example, but we'll cover this more next week
# when we talk about functions...
# recall that HAVING requires a GROUP BY to be with it

#Pull a list of categories for which sakila has over 70 films based on the film_category table
SELECT category_id, count(*)
FROM film_category
GROUP BY category_id
HAVING count(*) > 70
;

#You're turn: 
# Pull a list of districts and postal_codes that have more than 1 associated addresses, based on the address table
# Hint - use count(*) to find the # of associated addresses. We'll learn more about 
# aggregate functions like count next week...


/* why can't the filter be applied using a where clause?
because the filter is not based on an individual addresses, it's the addresses in a group of districts and postal_codes...
/* more later...*/

/*---------- # 5 ORDER BY ---------------------------*/
# pull the unique combinations of G rated films, grouped by ratings and rental_rates from the film table and sort by rating then rental_rate
# (A to Z and low to high)
SELECT rating, rental_rate
FROM film
WHERE rating = 'G' 
GROUP BY rating, rental_rate
ORDER BY rating, rental_rate
;

# reverse the sort order for rating (Z to A)
SELECT rating, rental_rate
FROM film
WHERE rating = 'G' 
GROUP BY rating, rental_rate
#### ADD HERE ####
;

/*---------- # 6 LIMIT ---------------------------*/
# a good way to preview data in a table!
# only pull the first 4 records from the last query...
# Where do you add it?



/*---------- # 7 Rename some columns with the alias (AS) ---------------------------*/
# Note that column names (using AS) should go in backticks (show up in red) if they have a space
# in them (e.g., `Movie Rating`)
# While text strings go in single quotes and show up in orange (e.g., 'G' or 'PG')
# This query renames both the rating and rental_rate columns
SELECT rating AS `Movie Rating`, rental_rate AS Price
FROM film
WHERE rating = 'G' 
GROUP BY rating, rental_rate
ORDER BY rating desc, rental_rate
;
# SELECT title and length in this query. Rename the length field to run_time.
SELECT #### ADD HERE ####
FROM film
WHERE rating = 'G'
ORDER BY length desc 
;

/*---------- # 8 Debugging code continued ---------------------------*/
# What's wrong with this?
SELECT customer_id, first_name, last_name
FROM customer
WHERE firstname = 'MARY'
;

# What's wrong with this?
SELECT film_id, title, `description`, rental_rate
FROM film
WHERE rental_rate >'$0.99'
;

# What's wrong with this?
SELECT film_id, title length
FROM film
;

# ALSO WATCH FOR LIMITING RESULTS... it's good practice while testing, 
# but could mess up your results if you need to pull back everything.


/*---------- YOUR TURN ---------------------------*/
/* Try to answer these  questions using the employees schema */
USE employees;

/* 1. How many unique job titles exist in the company? */


/* 2. When was the first female employee hired?*/


/* 3. Pull the list of salaries over $150,000. Include employee number, salary and to/from date in the result */
/* Sort the results by to_date (high to low) and then by salary (high to low) */

    
/* 4. Bonus - Write a query to pull the list of last names shared by over 200 employees */    

