-- create database Dp6tit

-- use[DP6Titans]

-- drop database DP6Titans

create Table Student1
(
RollNo int,
Name varchar(20),
Percentage numeric(6,2),
City varchar(10),
DOB date
)

--Modify the data type or size of data type
alter table Student1 alter column Name varchar(25)

--Add column to Existing Table
alter table Student1 add Country varchar(30)

--Remove column to Existing Table
alter table Student1 Drop column Country

--Rename column Name 
exec sp_rename 'Student.Name' , 'StudentName'

-----------------------------------------------------------------------------------

create table Employee0(
Emp_id int,
Name varchar(20),
salary int,
Department varchar(30))

alter table Employee0 alter column Name varchar(15) -- Modify data size
alter table Employee0 add Blood_Group varchar(5) -- Add column
alter table Employee0 drop column Blood_Group -- Remove column
exec sp_rename 'Employee0.Name' , 'Emp_Name' -- Rename Column name

alter table Employee0 add Age int
alter table Employee0 add constraint ch_age check (Age >=18) -- use check Constraint

exec sp_help Employee0

---------------------------------------------------------------------------------------------

--Not Null
create Table Employee1(
Name varchar(20) Not Null)

-----------------------------------------------------------------------------------------------

-- Unique
create Table Employee2(
Name varchar(20) Not Null,
Email varchar(30)unique)

--Alter Command
alter table Employee2 add Constraint un_Email Unique(Email)
--Remove
alter table Employee2 drop Constraint un_Email

exec sp_help Employee2

--------------------------------------------------------------------------------------------------
 
 -- Primary Key

 Create table Hotel(
 id int primary key,
 Name varchar(20))
 -- constraint pk_ht primary key(id)

 --Alter Command
 alter table hotel alter column id int not null
 alter table Hotel add constraint pk_ht primary key(id)

 ---------------------------------------------------------------------------------------------------

 --Foreign Key

 Create Table Dept(
 Did int,
 DpName varchar(20)
 Constraint pk_dp primary key(Did))

 create table Student0(
 id int primary key,
 Clg_Name varchar(50),
 Did int,
 Constraint fk_clgDept foreign key(Did) references Dept(Did))

 --Or

 --alter table Student0 add constraint fk_clgDept foreign key (did) references Dept(did)


 ----------------------------------------------------------------------------------------------------------

 --Check

 Create Table Bank(
 accno int,
 name varchar(50),
 Email varchar(20) unique,
 balance int,
 constraint pk_bk primary key(accno),
 constraint ck_bal check (balance>0))

 --Alter Command

-- alter table Bank add Email varchar(50) unique
-- alter table Bank add Constraint ck_bal check (balance>0)
-- alter table Bank drop Constraint ck_bal


exec sp_help Bank

-----------------------------------------------------------------------------------------------------

--Default

alter table Bank add Branch varchar(20)
alter table Bank add Constraint De_branch Default 'Warje' for Branch

--Remove command
--alter table Bank drop Constraint De_branch

----------------------------------------------------------------------------------------------------
 
 -- Index

-- Create unique index on Table_Name(id) --> Cluster Index

-- Create index on Table_Name(name, email) --> Non Cluster Index

----------------------------------------------------------------------------------------------

-- DML (Data Minipulation Langauge)
--Insert Values



create table Employee3(
Emp_id int primary key,
Emp_Name varchar(50),
Emp_EmailId varchar(20) unique,
Age int check (Age>=18),
Salary numeric(12,2))

select * from Employee3 -- * Indicate All column

insert into Employee3 values(1,'Abhishek','abhi@gmail.com',20,22000.23)
insert into Employee3 values(2,'Omkar','om1@gmail.com',24,22000.23)
insert into Employee3 values(3,'Ram','ram@gmail.com',22,22000.23)
insert into Employee3 values(4,'Shree','s123@gmail.com',29,22000.23)
insert into Employee3 values(5,'Om','ok@gmail.com',19,22000.23)
insert into Employee3 values(6,'Shubham','shub@gmail.com',30,22000.23)
insert into Employee3 values(7,'Pravin','pk@gmail.com',20,19000.23)
insert into Employee3 values(8,'Rahul','ral@gmail.com',24,18000.23)
insert into Employee3 values(9,'Suraj','raj@gmail.com',22,36000.23)
insert into Employee3 values(10,'Yog','yog@gmail.com',29,18000.23)
insert into Employee3 values(11,'Krish','krsh@gmail.com',19,42000.23)
insert into Employee3 values(12,'Seeta','sit@gmail.com',30,24000.23)
insert into Employee3 values(13,'Payal','py@gmail.com',35,35000.00)
insert into Employee3 values(14,'Riya','rk@gmail.com',18,12000.00)
insert into Employee3 values(15,'Tanuja','tk@gmail.com',35,32000.00)

--Update Value

update Employee3 set Salary=35000.25 where Emp_id=15

alter table Employee3 add  City varchar(20)
select * from Employee3

update Employee3 set City='Pune' where Emp_id in(1,3,5,9,15)
update Employee3 set City='Mumbai' where Emp_id in(2,4,14,6)

--Delete

-- Delete from Employee3 where Emp_id = 15


------------------------------------------------------------------------------------------------------

--DQL(Data Query Lamgague)

-- * indicates all columns
-- select query is to fetch the data
select Emp_Name ,Emp_EmailId from Employee3

-- alias to the column & to the table
select Emp_Name as 'Empname', Emp_EmailId as 'EmailId' from Employee3

select Emp.Emp_Name as 'Emp name',Emp.Emp_EmailId,Emp.Salary from 
Employee3 Emp

select Emp.* from Employee3 Emp

-- select with where clause 
-- where clause check for match data

-- get the data whose id is 1
select * from Employee3 where Emp_id=1

-- fetch the data of emp whose age is < 28
select * from Employee3 where Age <28

select * from Employee3 where Age <>34 and Age<>26


--Using Distinct--
Select distinct City from Employee3


-- Using AND & OR
select * from Employee3 where Salary < 28000 and Age > 25
select * from Employee3 where City ='Pune' or City = 'Mumbai'


-- Using Between

Select * from Employee3 where Salary between 21000 and 28000


-- Using In & Not In
select * from Employee3 where Emp_id in (1,4,3,9)
select * from Employee3 where City in ('Pune')

select * from Employee3 where Emp_id not in (1,4,3,9)
select * from Employee3 where City not in ('Pune')

---------------------------------------------------------------------------------------------

--Example01

--Create table product Id,Name,Price,Company
--Insert 10 records
--Write below select quries
--1.Display all records
--2.Display products whose price is < 2000
--3.Display products whose company name is LG
--4.Display products whose price is between 2000 to 5000
--5.Display unique company name 
--6.Display products whose company is dell & hp




Create Table Product(
prdId int primary key,
prdName varchar(50),
prdPrice int,
prdCompany varchar(50))

insert into Product values (1, 'Pen',20,'Cello')
insert into Product values (2, 'Pencil',10,'Nataraj')
insert into Product values (3, 'Laptop',35000,'HP')
insert into Product values (4, 'Laptop',40000,'Dell')
insert into Product values (5, 'Bag',3000,'Skybag')
insert into Product values (6, 'laptop',50000,'Asus')
insert into Product values (7, 'Tv',5000,'LG')
insert into Product values (8, 'Laptop',33000,'HP')
insert into Product values (9, 'Laptop',25000,'Dell')
insert into Product values (10, 'Tv',13000,'LG')

--Display all records
select * from Product

--Display products whose price is < 2000
select * from Product where prdPrice < 2000

--Display products whose company name is LG
select * from Product where prdCompany ='LG'

--Display products whose price is between 2000 to 5000
select * from Product where prdPrice between 2000 and 5000

--Display unique company name 
select distinct prdCompany from Product 

--Display products whose company is dell & hp
select * from Product where prdCompany in ('Dell' , 'HP')



-------------------------------------------------------------------------------------------------------

-----------------------like clause in SQL--------------------------

--start with l end with any letters
select * from Product where prdName like 'l%' 
select * from Product where prdName not like 'l%' 

-- start with any letters end with l
select * from Product where prdName like '%l'
select * from Product where prdName not like '%l'


--start and end with any letter, name contains l
select * from Product where prdName like '%l%'
select * from Product where prdName not like '%l%'


-- name end with p or n or l 
select * from Product where prdName like '%[pnl]'
select * from Product where prdName not like '%[pnl]'

select * from Product where prdName like '%[pnl]%'
select * from Product where prdName not like '%[pnl]%'



-- range  [h-l]
select * from Product where prdName like '[h-l]%'
select * from Product where prdName not like '[h-l]%'


-- underscore is used to define specific letters
-- match the exact count of letters
select * from Product where prdName like 'T_'
select * from Product where prdName not like 'T_'

select * from Product where prdName like '__n'
select * from Product where prdName not like '__n'

select * from Product where prdName like '__p___'
select * from Product where prdName not like '__p___'


--------------------------------------------------------------------------------------------------

--Order by --
select * from Product order by prdName -- Asencding
select * from Product order by prdName desc -- Desending

select * from Product order by prdId -- Asencding
select * from Product order by prdId desc -- Desending

-------------------------------------------------------------------------------------
-- Top--

-- first 5 records
select top 5 * from Product order by prdPrice

-- display 3 emp with highest to lowest salary
select top 5 * from Product order by prdPrice desc

-- display emp who have highest in the table
select top 1 * from Product order by prdPrice desc

--display emp who have lowest in the table
select top 1 * from Product order by prdPrice

-- percentage
select top 40 percent * from Product

-- ties  --> match data based on column that we specify in order by
select top 3 with ties * from Product order by prdPrice desc



--------- Fetch & Offset  -------------------

-- display  3rd highest Price in he table 
select * from Product order by prdPrice desc
offset 2 rows
fetch next 1 rows only

--display  3rd, 4th highest price in he table 
select * from Product order by prdPrice desc
offset 2 rows
fetch next 2 rows only

-------------------------------------------------------------------------------------------------

--Aggregate Function in sql (sum,min,max,count,avg)

select max(prdPrice) as 'max Price' from Product

select min(prdPrice) as 'min Price' from Product

select avg(prdPrice) as 'avg Price' from Product

select sum(prdPrice) as 'sum Price' from Product

select count(prdId) as 'total count' from Product

select count(prdCompany) as 'total count' from Product
select count(distinct prdCompany) as 'total count' from Product

--find total count with null records count(*)
select count(*) as 'total count' from Product

-------------------------------------------------------------------------------------------------------

--Views in SQL

create view Max_Price as
select max(prdPrice) as 'max Price' from Product

select * from  Max_Price

--------------
create view Min_Ptice as
select min(prdPrice) as 'min Price' from Product

select * from Min_Ptice
drop view Min_Ptice

-----------------------------------------


--- IDENTITY IN SQL


create table Product0
(
id int primary key identity(101,4),
name varchar(20),
price int
)

insert into Product0 values('Pencil',20)	
insert into Product0 values('Pen',50)
insert into Product0 values('Pendrive',500)

--------------------------------------------------------------------------------------------------------------























  



