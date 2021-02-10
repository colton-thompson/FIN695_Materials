SET sql_mode = 'ANSI';
USE sakila;

#How many staff work at Sakila?
#my solution 
SELECT distinct staff_id
FROM staff;

# prof solution
#SELECT *
#FROM staff;

#How many stores in the Sakila chain?
# my solution 
SELECT distinct store_id 
FROM store;

# prof solution
#SELECT     *
#FROM    store;

#How many DVDs in inventory at store 2?
SELECT inventory_id
FROM inventory
WHERE store_id = 2;

#SELECT *
#FROM inventory
#WHERE store_id = 2;

#How many unique films in inventory at store 2?
SELECT DISTINCT film_id
FROM inventory
WHERE store_id = 2;

#Which rental was returned most recently?
SELECT *
FROM rental
ORDER BY return_date DESC
LIMIT 1;

