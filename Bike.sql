
create database Bike

create table Model(
Mid int primary key,
Mname varchar(25),
Cost int)

insert into Model values(1,'MT150',200000)
insert into Model values(2,'Spander',85000)
insert into Model values(3,'Pulser125',95000)
insert into Model values(4,'Activa',105000)
insert into Model values(5,'Jupiter',90000)

select * from Model


create table Customer(
Cid int primary key,
fname varchar(20),
Lname varchar(20),
Mno varchar(20),
Gender varchar(10),
Email varchar(25))

insert into Customer values (100,'Rahul','Patil','8965421378','Male','rp@gmail.com')
insert into Customer values (101,'Palash','More','9632541278','Male','pm@gmail.com')
insert into Customer values (102,'Vishal','Bendre','9745214562','Male','vb@gmail.com')
insert into Customer values (103,'Revati','Gurav','9482107753','Female','rg@gmail.com')
insert into Customer values (104,'Payal','Patil','7565423658','Female','pp@gmail.com')

select * from Customer

Create table Payment_Mode(
Payid int primary key,
Pay_Type varchar(20))

insert into Payment_Mode values (11,'Online')
insert into Payment_Mode values (22,'Cash')
insert into Payment_Mode values (33,'Cheque')

select * from Payment_Mode

create table FeedBack_Rating(
Rid int primary key,
Rating varchar(25))

insert into Feedback_Rating values(1001,'Excellent')
insert into Feedback_Rating values(1002,'Good')
insert into Feedback_Rating values(1003,'Average')
insert into Feedback_Rating values(1004,'Bad')
insert into Feedback_Rating values(1005,'Complaint')

select * from FeedBack_Rating

create table Purchase(
Pid int primary key,
Cid int,
constraint Fk_cust foreign key(Cid) references Customer(Cid),
Mid int,
constraint Fk_Model foreign key(Mid) references Model(Mid),
Booking_Amt int,
Payid int,
constraint Fk_Pay foreign key(Payid) references Payment_Mode(Payid),
Pdate varchar(25),
Rid int,
constraint Fk_Rate foreign key(Rid) references FeedBack_Rating(Rid))

alter table Purchase alter column Pdate Date

insert into  Purchase values(50 , 100 , 1 , 5000 , 11 ,'2020/09/28' , 1001)
insert into  Purchase values(51 , 101 , 2 , 7000 , 22 ,'2023/08/15' , 1002)
insert into  Purchase values(52 , 102 , 4 , 50000 , 11 ,'2022/09/10' , 1004)
insert into  Purchase values(53 , 103 , 3 , 10000 , 33 ,'2020/07/07' , 1005)
insert into  Purchase values(54 , 104 , 5 , 2000 , 22 ,'2023/06/9' , 1003)
insert into  Purchase values(55 , 102 , 5 , 25000 , 11 ,'2021/08/30' , 1002)
insert into  Purchase values(56 , 100 , 2 , 1000 , 11 ,'2022/10/10' , 1004)

select * from Purchase

select * from Model
select * from Customer
select * from Payment_Mode
select * from FeedBack_Rating
select * from Purchase


--1.WAQ to get the balance amount for customers who made cash payment 
select (m.Cost-p.Booking_Amt) as 'Balance Amt' from Model m
inner join Purchase p
on m.Mid=p.Mid
inner join Customer c
on c.Cid=p.Cid
inner join Payment_Mode pm            
on pm.Payid = p.Payid
where pm.Pay_Type = 'Cash'

--2.Delete all the records of customer who have paid complete amount as that of bike cost.
delete from Customer where Cid in (
select c.Cid from Customer c
inner join Purchase p
on p.Cid = c.Cid
inner join Model m
on p.Mid = m.Mid
where (m.Cost - p.Booking_Amt) = 0)


--3.Create an index to have faster retrival of data on the basis of booking_amount.
create Index idx_BookingAmt on Purchase(Booking_Amt)

--4.WAQ to change payment mode to cash for ‘activa5g’ purchased by customer with id 100.
update Purchase set Payid = 11
where Mid = '1' and Cid = 100

--5.Map where key is modelName and value is arraylist of ids of customers who purchased that model.

--6.Create a stored procedure to get the full name of customer whose cust_id is provided as input.

--7.WAQ to get the number of complaints registered for model Pulser125.
select count(*) as 'Complaint count' 
from Purchase p
inner join FeedBack_Rating f 
on p.Rid = f.Rid
where f.Rating = 'Complaint' and p.Mid = 3

--8.WAQ to get all customer names who haven’t given ratings yet.
select c.fname from Customer c
inner join Purchase p
on c.Cid = p.Cid
inner join FeedBack_Rating fr
on fr.Rid = p.Rid
where Rating = null

--9.Delete all complaint records from purchase. 
delete from Purchase where Rid = (
select Rid from FeedBack_Rating where Rating = 'Complaint')

--10.Update ratings given by Mr Palash from good to excellent.
update Purchase set Rid=(select rid from FeedBack_Rating where Rating='Excellent') where 
cid=(select cid from Customer where fname='Palash');

--11.Reduce cost of all bikes for which rating is bad by 10%. --(Wrong)
update Model set Cost = (Cost-(Cost*0.1)) where Mid = (
select Mid from Purchase where Rid = 1004)


--12.Write a to display highest selling model along with name and count 
select top 1  m.Mname,count(p.Mid) as 'Count' from Model m
inner join Purchase p
on m.Mid=p.Mid
group by m.Mname
order by count(p.Mid) desc