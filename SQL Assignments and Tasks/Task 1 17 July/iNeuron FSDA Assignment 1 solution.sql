create database ineuron_sql_assignment1;

use ineuron_sql_assignment1;

/*Task 1 answer*/
/*below create table, insert and select query are just for validation purpose*/
create table shopping_history (
product varchar(30) not null,
quantity integer not null,
unit_price integer not null);

insert into shopping_history (product,quantity,unit_price) values ('milk',3,10);
insert into shopping_history (product,quantity,unit_price) values ('bread',7,3);
insert into shopping_history (product,quantity,unit_price) values ('bread',5,2);
commit;

select * from shopping_history;
/*This is the solution to task 1*/
select product,sum(quantity*unit_price) as total_price from shopping_history group by product order by product desc;

/*Task 2 answered*/
/*below create table, insert and select query are just for validation purpose*/
create table phones(
name varchar(20) not null unique,
phone_number integer not null unique
);

create table calls(
id integer not null,
caller integer not null,
callee integer not null,
duration integer not null,
unique(id)
);
/*insert and select statements for example 1 set up and so that i can execute the answer query and validate if i am getting the desired output*/
insert into phones values('Jack',1234);
insert into phones values('Lena',3333);
insert into phones values('Mark',9999);
insert into phones values('Anna',7582);
commit;
select * from phones;

insert into calls values(25,1234,7582,8);
insert into calls values(7,9999,7582,1);
insert into calls values(18,9999,3333,4);
insert into calls values(2,7582,3333,3);
insert into calls values(3,3333,1234,1);
insert into calls values(21,3333,1234,1);
commit;
select * from calls;

/*This is the solution to task 2*/
select p.name from phones p
inner join calls c on p.phone_number=c.caller or
p.phone_number=c.callee group by p.name having sum(c.duration)>=10 order by p.name;

/*Truncated the table to test solution query for example 2*/
truncate table phones; 
truncate table calls;

/*insert and select statements for example 2 set up and so that i can execute the answer query and validate if i am getting the desired output*/
insert into phones values('John',6365);
insert into phones values('Addison',4315);
insert into phones values('Kate',8003);
insert into phones values('Ginny',9831);
commit;
select * from phones;

insert into calls values(65,8003,9831,7);
insert into calls values(100,9831,8003,3);
insert into calls values(145,4315,9831,18);
commit;
select * from calls;

/*This is the solution to task 2*/
select p.name from phones p
inner join calls c on p.phone_number=c.caller or
p.phone_number=c.callee group by p.name having sum(c.duration)>=10 order by p.name;

/*Task 3 answer*/
create table transactions (
amount integer not null,
Date date not null);

/*insert and select statements for example 1 set up and so that i can execute the answer query and validate if i am getting the desired output*/

insert into transactions(amount,Date) values (1000,'2020-01-06');
insert into transactions(amount,Date) values (-10,'2020-01-14');
insert into transactions(amount,Date) values (-75,'2020-01-20');
insert into transactions(amount,Date) values (-5,'2020-01-25');
insert into transactions(amount,Date) values (-4,'2020-01-29');
insert into transactions(amount,Date) values (2000,'2020-03-10');
insert into transactions(amount,Date) values (-75,'2020-03-12');
insert into transactions(amount,Date) values (-20,'2020-03-15');
insert into transactions(amount,Date) values (40,'2020-03-15');
insert into transactions(amount,Date) values (-50,'2020-03-17');
insert into transactions(amount,Date) values (200,'2020-10-10');
insert into transactions(amount,Date) values (-200,'2020-10-10');
commit;

select * from transactions;

/*This is the solution to task 3*/
select sum(amount)-(5*(12-(select count(*) from (select Month(Date),count(1),sum(amount) from transactions where amount<0 group by Month(Date) 
having count(1)>=3 and sum(amount)<=-100) as DC))) as balance from transactions;

/*Truncated the table to test solution query for example 2*/
truncate table transactions; 

/*insert and select statements for example 2 set up and so that i can execute the answer query and validate if i am getting the desired output*/

insert into transactions(amount,Date) values (1,'2020-06-29');
insert into transactions(amount,Date) values (35,'2020-02-20');
insert into transactions(amount,Date) values (-50,'2020-02-03');
insert into transactions(amount,Date) values (-1,'2020-02-26');
insert into transactions(amount,Date) values (-200,'2020-08-01');
insert into transactions(amount,Date) values (-44,'2020-02-07');
insert into transactions(amount,Date) values (-5,'2020-02-25');
insert into transactions(amount,Date) values (1,'2020-06-29');
insert into transactions(amount,Date) values (1,'2020-06-29');
insert into transactions(amount,Date) values (-100,'2020-12-29');
insert into transactions(amount,Date) values (-100,'2020-12-30');
insert into transactions(amount,Date) values (-100,'2020-12-31');
commit;

select * from transactions;

/*This is the solution to task 3*/
select sum(amount)-(5*(12-(select count(*) from (select Month(Date),count(1),sum(amount) from transactions where amount<0 group by Month(Date) 
having count(1)>=3 and sum(amount)<=-100) as DC))) as balance from transactions;

/*Truncated the table to test solution query for example 3*/
truncate table transactions; 

/*insert and select statements for example 3 set up and so that i can execute the answer query and validate if i am getting the desired output*/

insert into transactions(amount,Date) values (6000,'2020-04-03');
insert into transactions(amount,Date) values (5000,'2020-04-02');
insert into transactions(amount,Date) values (4000,'2020-04-01');
insert into transactions(amount,Date) values (3000,'2020-03-01');
insert into transactions(amount,Date) values (2000,'2020-02-01');
insert into transactions(amount,Date) values (1000,'2020-01-01');
commit;

select * from transactions;

/*This is the solution to task 3*/
select sum(amount)-(5*(12-(select count(*) from (select Month(Date),count(1),sum(amount) from transactions where amount<0 group by Month(Date) 
having count(1)>=3 and sum(amount)<=-100) as DC))) as balance from transactions;

/*Truncated the table to test solution query for Retesting*/
truncate table transactions;