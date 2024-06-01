-- 1.Write a query to display for each store its store ID, city, and country.
select store_id,city_id,country from sakila.address
join sakila.store using (address_id)
join sakila.city using(city_id)
join sakila.country using (country_id)
group by store_id



-- 2.Write a query to display how much business, in dollars, each store brought in.
select store_id,sum(amount) from sakila.store
join sakila.staff using (store_id)
join sakila.payment using (staff_id)
group by store_id

-- 3.What is the average running time of films by category?
select name,avg(length) from sakila.film
join sakila.film_category using (film_id)
join sakila.category using (category_id)
group by name



-- 4.Which film categories are longest?
select name,avg(length) as avg_time from sakila.film
join sakila.film_category using (film_id)
join sakila.category using (category_id)
group by name
order by avg(length) desc
limit 3

-- 5. Display the most frequently rented movies in descending order.
select film_id, title,count(inventory_id)as rented from sakila.film
join sakila.inventory using (film_id)
join sakila.rental using (inventory_id)
group by film_id, title
order by rented desc
limit 5

-- 6.List the top five genres in gross revenue in descending order.
select category_id, name,sum(amount)from sakila.film_category
join sakila.category using (category_id)
join sakila.inventory using (film_id)
join sakila.rental using (inventory_id)
join sakila.payment using (rental_id)
group by category_id, name
order by sum(amount) desc
limit 5

-- 7.Is "Academy Dinosaur" available for rent from Store 1?
select store_id,title,count(inventory_id) as rented from sakila.film
join sakila.inventory using(film_id)
join sakila.rental using (inventory_id)
where title='Academy Dinosaur' and store_id=1
group by store_id, title