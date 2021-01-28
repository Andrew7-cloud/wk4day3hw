-- 1. List all customers who live in Texas (use JOINs)
select * from actor;
select * from address;
select * from category;
select * from city;
select * from country;
select * from customer;
select * from film;
select * from film_actor;
select * from film_category;
select * from inventory;
select * from language;
select * from payment;
select * from rental;
select * from staff;
select * from store;

--  Answer: None of the fields included state.

-- 2 2. Get all payments above $6.99 with the Customer's Full Name

select * from payment;
select * from customer;

select c.first_name,c.last_name, p.amount
from payment p
inner join customer c
on p.customer_id = c.customer_id 
where p.amount > 6.99;

-- 3. 3. Show all customers names who have made payments over $175(use subqueries)
-- nesting begins wih IN (
--  this code is above.  it returns customer_id, from payment, group by customer_id, having sum(amount) ? 175
SELECT first_name, last_name
FROM customer
WHERE customer_id IN (
	SELECT customer_id
	FROM payment
	GROUP BY customer_id
	HAVING SUM(amount) > 175
	ORDER BY SUM(amount) DESC);


--  I needed a break.
select c.customer_id, c.first_name, c.last_name,p.customer_id,p.amount
from customer c
inner join payment p
on c.customer_id = p.customer_id; 


SELECT customer_id
FROM payment
GROUP BY customer_id
HAVING SUM(amount) > 175
ORDER BY SUM(amount) DESC;


-- 4. List all customers that live in Nepal (use the city table)
--  there are no records with NEpal
select *
from city;

--5 Which staff member had the most transactions?

select * from staff;
select * from payment;


SELECT staff_id,max(staff_id)
FROM payment
GROUP BY staff_id
HAVING count (staff_id) > 0
ORDER BY count(staff_id) DESC;



select staff_id, count(staff_id)
from payment
group by staff_id;


-- inner join
--  on staff and payment tables of dvd_rental_jan2021 db
select * from staff;

select s.staff_id,s.first_name,s.last_name,p.amount
from staff s
inner join payment p
on s.staff_id = p.staff_id; 

--  on actor and film_actor tables of dvd_rental_jan2021 db
select * from actor;
select * from film_actor;

select a.actor_id, a.first_name, fa.film_id
from actor a
inner join film_actor fa
on a.actor_id = fa.actor_id


-- left join
--  on staff and payment tables of dvd_rental_jan2021 db
select * from staff;
select * from payment;

select s.staff_id,s.first_name,s.last_name,p.amount
from staff s
left join payment p
on s.staff_id = p.staff_id
where p.payment_date is not null and s.active = True;


--  on actor and film_actor tables of dvd_rental_jan2021 db
select * from actor;
select * from film_actor;

select a.actor_id, a.first_name, a.last_name,fa.actor_id, fa.film_id
from actor a
left join film_actor fa
on a.actor_id = fa.actor_id
where fa.film_id is not null;



-- right join
--  on staff and payment tables of dvd_rental_jan2021 db
select * from staff;
select * from payment;

select s.staff_id,s.first_name,s.last_name,p.amount
from staff s
right join payment p
on s.staff_id = p.staff_id
where p.payment_date is not null and s.active = True;


--  on actor and film_actor tables of dvd_rental_jan2021 db
select * from actor;
select * from film_actor;

select a.actor_id, a.first_name, a.last_name,fa.actor_id, fa.film_id
from actor a
right join film_actor fa
on a.actor_id = fa.actor_id
where fa.film_id is not null; 


-- full join
--on staff and payment tables of dvd_rental_jan2021 db

select s.staff_id,s.first_name,s.last_name,p.amount
from staff s
full join payment p
on s.staff_id = p.staff_id
where p.payment_date is not null and s.active = True;

--  on actor and film_actor tables of dvd_rental_jan2021 db
select * from actor;
select * from film_actor;

--  showing only selected fields from actor and film actor tables
select a.actor_id, a.first_name, a.last_name,fa.actor_id, fa.film_id, f.film_id, f.title
from actor a
-- actor_id in both actor and film_actor tables
full join film_actor fa
on a.actor_id = fa.actor_id
-- film_id in both film_actor and film tables
full join film f
on fa.film_id = f.film_id
where f.film_id = 1 and a.actor_id = 1;


-- subquery
select customer_id
from payment
group by customer_id
having sum(amount) > 175
order by customer_id;



select * from payment;

select customer_id
from payment
where customer_id IN(



)






