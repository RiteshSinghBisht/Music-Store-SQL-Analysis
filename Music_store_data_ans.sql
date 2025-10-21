#Q1: Who is the senior most employee based on job title?

#Ans

with recursive emp_role as (
	select employee_id, first_name, last_name, title, reports_to
    from employee
    where employee_id = 1
    
    union all
    
    select e.employee_id, e.first_name, e.last_name, e.title, e.reports_to
    from employee as e
    join emp_role as b
    on e.employee_id = b.reports_to
)

select * 
from emp_role
where reports_to is null;



#Q2: Which countries have the most Invoices?

#Ans 
 
select billing_country,
	count(*) as count_of_invoices
from invoice
group by billing_country
order by count_of_invoices desc
limit 1;



#Q3: What are top 3 values of total invoice

#Ans

select distinct total as top_3_total_values 
from invoice
order by total desc
limit 3;



/*Q4: Which city has the best customers? We would like to throw a promotional Music Festival in the city we made the most money. 
Write a query that returns one city that has the highest sum of invoice totals.
Return both the city name & sum of all invoice totals */

#Ans

select billing_city, round(sum(total),2) as city_total 
from invoice
group by billing_city
order by city_total desc
limit 1;



/*Q5: Who is the best customer? The customer who has spent the most money will be declared the best customer. 
Write a query that returns the person who has spent the most money. */

#Ans

select a.customer_id, concat(a.first_name," ", a.last_name) as full_name, round(sum(b.total),2) as total_spending
from customer as a
join invoice as b
on a.customer_id = b.customer_id
group by a.customer_id, full_name
order by total_spending desc
limit 1;



/*Q6: Write query to return the email, first name, last name, & Genre of all Rock Music listeners. 
Return your list ordered alphabetically by email starting with A */

#Ans

select distinct a.email, a.first_name, a.last_name, "Rock" as Genre
from customer as a
join invoice as b on a.customer_id = b.customer_id
join invoice_line as c on b.invoice_id = c.invoice_id
where c.track_id in (
	select track.track_id
	from track
	join genre
	on track.genre_id = genre.genre_id
	where genre.name = "Rock"
    )
order by email;



/*Q6: Let's invite the artists who have written the most rock music in our dataset. 
Write a query that returns the Artist name and total track count of the top 10 rock bands */

#Ans

select artist.name, count(*) as total
from artist
join album on artist.artist_id = album.artist_id
join track on track.album_id = album.album_id
where genre_id in 
	(select track.genre_id
	from track
	join genre on track.genre_id = genre.genre_id
	where genre.name = "Rock")
group by  artist.name
order by total desc
limit 10;



/*Q7: Return all the track names that have a song length longer than the average song length. 
Return the Name and Milliseconds for each track. 
Order by the song length with the longest songs listed first. */

#Ans

select name, milliseconds
from(
select name, milliseconds,
	avg(milliseconds) over() as avg_time
from track) as new1
where milliseconds > avg_time
order by milliseconds desc;



/*Q8: Find how much amount spent by each customer on the most selling artist? Write a query to return customer name, 
artist name and total spent */

#Ans

with ultimate_table as (
	select a.artist_id, a.name as artist_name,
    sum(b.unit_price * b.quantity) as total_spending
    from artist as a
    join album as c on a.artist_id = c.artist_id
    join track as d on c.album_id = d.album_id
    join invoice_line as b on b.track_id = d.track_id
    group by 1,2 
    order by 3 desc
    limit 1
)
select concat(a.first_name," ", a.last_name) as full_name, bsa.artist_name,
	round(sum(b.unit_price * b.quantity),2) as total_spending
    from customer as a 
    join invoice as c on a.customer_id = c.customer_id
    join invoice_line as b on c.invoice_id = b.invoice_id
    join track as d on b.track_id = d.track_id
    join album as e on d.album_id = e.album_id
    join ultimate_table as bsa on e.artist_id = bsa.artist_id
    group by 1,2
    order by 3 desc;



/*Q9: We want to find out the most popular music Genre for each country. We determine the
most popular genre as the genre with the highest amount of purchases. Write a query
that returns each country along with the top Genre. For countries where the maximum
number of purchases is shared return all Genres */

#Ans

with all_data_tbl as (
	select count(b.quantity) as purchases,c.billing_country, e.name as name,e.genre_id as genre_id,
    row_number() over(partition by c.billing_country order by count(b.quantity) desc) as rank_1
    from invoice as c
    join invoice_line as b on c.invoice_id = b.invoice_id
    join track as d on b.track_id = d.track_id
    join genre as e on d.genre_id = e.genre_id
    group by 2,3,4
    order by 2, 1 desc
)
select purchases, billing_country, name as genre_name
from all_data_tbl
where rank_1 = 1;



/*Q10: Write a query that determines the customer that has spent the most on music for each
country. Write a query that returns the country along with the top customer and how
much they spent. For countries where the top amount spent is shared, provide all
customers who spent this amount */

#Ans


with ultimate_customer as (
	select a.customer_id, concat(a.first_name," ",a.last_name) as full_customer_name,a.country, sum(total) as total_spending,
    row_number() over(partition by a.country order by sum(total) desc) rankx
    from customer as a
    join invoice as b on a.customer_id = b.customer_id
    group by 1,2,3
    order by 3,4 desc
)

select customer_id, full_customer_name, country, total_spending
from ultimate_customer
where rankx = 1;


