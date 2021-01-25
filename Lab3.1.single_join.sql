-- Lab 3.1 Single Joins --

-- In this lab, you will be using the Sakila database of movie rentals.
use sakila;

-- 1 List number of films per category.
select c.name, count(fc.film_id) as films_per_category 
from category as c
join film_category as fc
on c.category_id = fc.category_id
group by c.name
order by films_per_category asc;

-- 2 Display the first and last names, as well as the address, of each staff member.
select st.first_name, st.last_name, a.address
from staff as st
join address as a
on st.address_id = a.address_id;

-- 3 Display the total amount rung up by each staff member in August of 2005.
select st.staff_id, st.first_name, st.last_name, sum(p.amount), p.payment_date
from staff as st
join payment as p
on st.staff_id = p.staff_id
where date_format(convert(payment_date, date), '%Y-%M') = '2005-August'
group by staff_id;

-- 4 List each film and the number of actors who are listed for that film.
select f.film_id, f.title, count(fa.actor_id) as nr_of_actors
from film as f
join film_actor as fa
on f.film_id = fa.film_id
group by f.title;

-- 5 Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.
select c.customer_id, c.first_name, c.last_name, sum(p.amount) as total_amount_by_customer
from customer as c
join payment as p
on c.customer_id = p.payment_id
group by customer_id
order by c.last_name;
