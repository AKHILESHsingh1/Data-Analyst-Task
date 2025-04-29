show databases;

use  e_commerce_db;

#Extract monthname
select monthname(order_date) as MonthsName from orders group by monthname(order_date);
 
Alter table orders add column Month_Name varchar(25);
update orders set Month_Name = monthname(order_date);
select * from orders;

# By months
select month(o.order_date) as months,sum(p.amount) as Revneue from orders o 
inner join 
payments p 
on 
o.order_id=p.order_id 
group by month(order_date) 
order by months;

# By month Name 
#code 1: by monthname()
select monthname(o.order_date) as Month_Name,sum(p.amount) as Revneue from orders o 
inner join 
payments p 
on 
o.order_id=p.order_id 
group by monthname(order_date) ,month(order_date)
order by month(order_date);

#Code 2 by Month_Name Column
select o.Month_Name ,sum(p.amount) as Revneue from orders o 
inner join 
payments p 
on 
o.order_id=p.order_id 
group by o.Month_Name
order by Revneue desc;


# By Years
select year(o.order_date) as Years,sum(p.amount) as Revneue from orders o inner join payments p on o.order_id=p.order_id group by Year(order_date) order by Years;

#By Weekdays  Note: 0 = Monday, 1 = Tuesday, 2 = Wednesday, 3 = Thursday, 4 = Friday, 5 = Saturday, 6 = Sunday.
select weekday(o.order_date) as Weaks,sum(p.amount) as Revneue from orders o inner join payments p on o.order_id=p.order_id group by weekday(order_date) order by Weaks;

# Using Extract()
SELECT 
    EXTRACT(YEAR FROM o.order_date) AS order_year,
    EXTRACT(MONTH FROM o.order_date) AS order_month,
    SUM(p.amount) AS total_revenue,
    COUNT(DISTINCT o.order_id) AS total_orders
FROM orders o
inner join payments p
on p.order_id=o.order_id
GROUP BY order_year, order_month
ORDER BY order_year, order_month;

#without using Ectract()
select year(o.order_date) as Years, monthname(o.order_date) as Month_Name,sum(p.amount) as Revneue, count(distinct(o.order_id)) Total_order from orders o 
inner join payments p 
on o.order_id=p.order_id 
group by Year(o.order_date),monthname(o.order_date)
order by Years, Month_Name;