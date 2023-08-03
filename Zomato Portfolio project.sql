create database Zomato;
use Zomato;

create table golduser_signup(userid integer, gold_signup_date date);
insert into golduser_signup(userid, gold_signup_date)values(1,'2022-09-22'), (3,'2022/04/21');
select * from golduser_signup;

create table users(userid integer, signup_date date);
insert into users(userid, signup_date) values(1, '2020-02-09'), (2, '2021-1-15'), (3,'2020-04-11');
select * from users;

create table sales(userid integer, Create_date date, produt_id integer);
insert into sales(userid, create_date, produt_id) values
(1,'2020-4-19',2), 
(3,'2022-12-18',1), 
(1,'2022-10-23',2),
(1,'2021-03-19',3),
(3,'2019-12-20',2),
(1,'2019-11-09',1),
(1,'2019-05-20',3),
(2,'2020-09-24',1),
(1,'2020-03-11',2),
(1,'2019-03-11',1),
(3,'2019-11-10',1),
(3,'2020-12-07',2),
(3,'2019-12-15',2),
(2,'2020-11-08',2),
(2,'2021-09-10',3);
select * from Sales;

create table product(product_id integer, Product_name varchar(20), Price integer);
drop table if exists product;
insert into product(product_id, product_name, price) values(1, 'p1', 980), (2,'p2',870),(3,'p3',330);
select * from product;
select * from sales;
select * from golduser_signup;
select * from users;


#1. What is total amt each customer spend on zomato?
select a.userid,sum(b.price) total_amt_sales from sales a inner join product b on a.produt_id=b.product_id group by userid;

#2. How many days each customer visit zomato?
select a.userid, count(s.userid) Total_days_visited from sales s inner join users a on a.userid=s.userid group by userid;
select userid, count(distinct create_date) Total_days_visited from sales group by userid;

#3 what was the first product purchase by the customer?
select * from
 (select *, rank()over (partition by userid order by create_date) as ranking from sales) a where ranking =1;
 
 #4. what is the most purchase item in the menu and how many time its purchased by all customers?
 select userid, count(produt_id) as cnt from sales where produt_id in (select produt_id from sales group by produt_id order by count(produt_id) desc) group by userid;
 
 #5. witch item is most poluler for each customer?
 select userid, produt_id, count(produt_id) from sales group by userid;
