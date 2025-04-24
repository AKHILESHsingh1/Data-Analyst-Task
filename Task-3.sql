show databases;
use e_commerce_db;

show tables;

select * from customer;
select * from order_items;
select * from orders;
select * from payments;
select * from products;


alter table  order_items drop column unit_price;

select * from products where category = "Fashion";

select * from products where category="Fashion" order by price desc;
# group by top 5 categroy by revenue
select category,sum(price) as revenue from products group by category order by sum(price) desc limit 5;

#inner join 
select p.name,p.category,p.price,oi.quantity ,(p.price* oi.quantity) as Total_sales from  products p inner join order_items  oi on p.product_ID=oi.product_id;  

# left join
 select *  from orders o left join payments p on o.order_id= p.order_id;
 
 # right join
select * from customer c right join orders o on c.ID=o.customer_id;

#sub Query
select * from customer where ID in (select o.customer_id from orders o join payments p on o.order_id=p.order_id where amount >=900) ;

# Aggregate function Sum and Avg
select sum(amount) as Total_revenue from payments;
select avg(price) as Average_product_price  from products;

# trend analysis by year
select sum(p.price*oi.quantity) as Total_revenue ,year(o.order_date) as years from products as p inner join order_items as oi on p.product_id = oi.product_id
inner join orders o on oi.order_id =o.order_id group by year(o.order_date) ;

