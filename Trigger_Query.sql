
create database Tri_gger

use[Tri_gger]

create Table Employee(
id int primary key identity (1,1),
Ename varchar(20),
Email varchar(20),
Age int,
Salary int)

insert into Employee values ('Rohan','rk@gmail.com',25,20000)
insert into Employee values ('Akash','ak@gmail.com',24,25000)
insert into Employee values ('Smita','st@gmail.com',23,18000)
insert into Employee values ('Om','om@gmail.com',22,19000)
insert into Employee values ('Shree','sr@gmail.com',20,20000)
insert into Employee values ('Ram','rm@gmail.com',19,21000)
insert into Employee values ('Jay','jy@gmail.com',25,22000)

select * from Employee

--case expression
select Salary,
case
when Salary < 18000 and Salary >20000 then 'High Salary'
when Salary <15000 and Salary >18000 then 'Average'
else 'Salary Is Low'
end as 'Salary'
from Employee


--------------------------------------------------------------------------

create table EmployeeTrack(
id int primary key identity(1,1),
description varchar(255))

create trigger tr_Emp
on Employee after insert
as begin
declare @id int
declare @Ename varchar(20)
declare @Email varchar(20)
select @id=id,@Ename=Ename,@Email=Email from inserted

insert into EmployeeTrack values('new record with details'+cast(@id as varchar)+' name'+
@Ename+' email '+@Email+' date '+ cast( GETDATE() as varchar(20))+' added')
end

select * from Employee

insert into Employee values ('Chidanand','Chid@gmail.com',23,20500)

select * from EmployeeTrack
-------------------------------------------------------------------------------------------

Create trigger tr_Employee_delete
on Employee after delete
as begin
declare @id int
declare @Ename varchar(20)
declare @Email varchar(30)
select @id=id,@Ename=Ename,@Email=Email from deleted

insert into EmployeeTrack values('record with details'+cast(@id as varchar)+' name'+
@Ename+' email '+@Email+' date '+ cast( GETDATE() as varchar(20))+' removed')
end

delete  from Employee where id = 2

select * from Employee
select * from EmployeeTrack



-----------------------------------------------------------------------------------------------------

---SQL Expression

create table Product(
id int primary key identity(101,1),
Pname varchar(20),
Price int)

insert into Product values('Pen',50)
insert into Product values('Pencil',20)
insert into Product values('Laptop_HP',40000)
insert into Product values('Laptop_Dell',90000)
insert into Product values('Pendrive',400)
insert into Product values('Phone',22000)
insert into Product values('Book',100)

select* from Product

select Pname,Price,
case
  when Price >300 then 'Expensive'
  when Price <300 then 'not expensive'
  else 'average'
end as 'remark'
from Product

--------------------------------------------------------------------------------------------------


---Home Work-- Union and All Union

create table Customer(
id int ,
name varchar (30),
city varchar (30),
State varchar(30))

insert into Customer (id,name,city,State)values
(1,'suresh','Pune','MH'),
(2,'sandesh','Nagpur','MH'),
(3,'Akash','Pune','MH'),
(4,'Riya','Solapur','MH'),
(5,'Tanuja','Satara','MH')

create table Supplier (
id int,
name varchar(30),
city varchar (30),
State varchar (30))

insert into Customer (id,name,city,State)values
(1,'suresh','Pune','MH'),
(2,'sandesh','Nagpur','MH'),
(3,'Akash','Pune','MH'),
(4,'Riya','Solapur','MH'),
(5,'Tanuja','Satara','MH')

Select name,city,state from customer
Union
Select name,city,state from supplier


Select name,city,state from customer
Union all
Select name,city,state from supplier