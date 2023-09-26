
create database Store_Procedure

create table Employee(
Emp_id int primary key,
Emp_Name varchar(50),
Emp_EmailId varchar(20) unique,
Age int check (Age>=18),
Salary numeric(12,2))



select * from Employee 

insert into Employee values(1,'Abhishek','abhi@gmail.com',20,22000.23)
insert into Employee values(2,'Omkar','om1@gmail.com',24,22000.23)
insert into Employee values(3,'Ram','ram@gmail.com',22,22000.23)
insert into Employee values(4,'Shree','s123@gmail.com',29,22000.23)
insert into Employee values(5,'Om','ok@gmail.com',19,22000.23)
insert into Employee values(6,'Shubham','shub@gmail.com',30,22000.23)
insert into Employee values(7,'Pravin','pk@gmail.com',20,19000.23)
insert into Employee values(8,'Rahul','ral@gmail.com',24,18000.23)
insert into Employee values(9,'Suraj','raj@gmail.com',22,36000.23)
insert into Employee values(10,'Yog','yog@gmail.com',29,18000.23)


--create proc Proc_Name
--as 
--begin 
--------Query
--return
--end

-----With parameters
create proc sp_EmpList
as begin 
select * from Employee
return
end

exec sp_EmpList

-------------------------------------------------------------------------------------------------------

----DML---
--Insert

create proc sp_Insert_Emp(
@Emp_id int,
@Emp_Name varchar(20),
@Emp_EmailId varchar(20),
@Age int,
@Salary numeric(12,2))

as begin
insert into Employee values(@Emp_id, @Emp_Name, @Emp_EmailId, @Age, @Salary)
return end

exec sp_Insert_Emp
@Emp_id = 11,
@Emp_Name = 'Reshma',
@Emp_EmailId = 'rhm@gmail.com',
@Age=25,
@Salary = 25000.23

exec sp_Insert_Emp
@Emp_id = 12,
@Emp_Name = 'Reshma',
@Emp_EmailId = 'rhm@gmail.com',
@Age=25,
@Salary = 25000.23

exec sp_EmpList

-------------------------------------------------------------------------------------------------------------------------------

--Update

create proc SP_Update_Emp(
@Emp_id int,
@Emp_Name varchar(20),
@Emp_EmailId varchar(20),
@Age int,
@Salary numeric(12,2))

as begin 
update Employee set 
Emp_Name = @Emp_Name , Emp_EmailId = @Emp_EmailId , Age = @Age , Salary = @Salary
where Emp_id = @Emp_id
return 
end

exec SP_Update_Emp
@Emp_id = 11,
@Emp_Name = 'Nath',
@Emp_EmailId = 'nt@gmail.com',
@Age=23,
@Salary = 25500.23

exec sp_EmpList

----------------------------------------------------------------------------------------------------------------------------------

--Delete

create Proc Sp_Delete_Emp(
@Emp_id int)
as begin
delete from Employee where Emp_id = @Emp_id
return
end

Exec Sp_Delete_Emp
@Emp_id = 12

exec sp_EmpList

------------------------------------------------------------------------------------------------------------------------------


-- User Difined Function i SQL

create function Addition(@a int, @b int)
returns int
as begin
--Declare variable in sql
declare @c int
--Code the Exc
set @c=@a+@b
return @c
end

select dbo.Addition(10,20) as 'Sum'

-----------------------------------------------------------------------------

--Scalar Function
create function GetEmpName(@Emp_id int)
returns varchar(50)
as begin
return (select Emp_Name from Employee where Emp_id = @Emp_id)
end

select dbo.GetEmpName (1) as 'Emp Name'

--------------------------------------------------------------------------------------

--Multivalue Function
create function GetEmpByDept(@did int)
returns table
as
return (select * from Employee where did=@did)

select * from dbo.GetEmpByDept(103)

-----------------------------------------------------------------------------------------------

--create a function to accept the product price and give 10% discount and return 
--and returns the discount price

create function GetDiscount(@price int)
returns decimal
as begin
declare @dis decimal
set @dis=@price-(0.10*@price)
return @dis
end

select dbo.GetDiscount(800) as 'Dis_Price'
--using given Table price
select price , dbo.GetDiscount(price) as 'Dis_Price' from Product

-----------------------------------------------------------------------------------------