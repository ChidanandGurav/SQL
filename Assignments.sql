
Create database Assignment

create Table Customer(
Customer_Id int primary key,
Custome_Name varchar(20),
Country varchar(20),
City varchar(10),
PostelCode int)

create table Product(
Prod_Id int primary key,
Customer_Id int,
constraint fk_prd foreign key (Customer_Id) references Customer ( Customer_Id),
Prod_Name varchar(50),
Prod_price int)

select * from Product

insert into Product values (100,1,'Pen',20)
insert into Product values (101,2,'Pencil',10)
insert into Product values (102,24,'TV',6000)
insert into Product values (103,5,'Pendrive',500)
insert into Product values (104,4,'Laptop',20000)
insert into Product values (105,25,'Phone',3000)


insert into Customer values(1,'Jons','UK','London',121111)
insert into Customer values(2,'Marry','UK','London',121111)
insert into Customer values(3,'Jonson','UK','Liverpool',121110)
insert into Customer values(4,'Tommy','Germany','Barlin',456321)
insert into Customer values(5,'Pandu','Norway','Oslo',325010)
insert into Customer values(6,'Maxwell','Austrelia','KewVictori',562310)
insert into Customer values(23,'Pandu','USA','Texas',325010)
insert into Customer values(24,'Ricky','France','Centre',203000)
insert into Customer values(25,'Polard','Germany','Barlin',456321)
insert into Customer values(26,'Sangakara','Shrilanka','Colambo',null)
insert into Customer (Customer_Id,Custome_Name,Country,City) values(27,'Mendis','Shrilanka','Colambo')
insert into Customer values(7,'Tony','Germany','Barlin',121110)


select * from Customer

select City from Customer

select Distinct City from Customer

select * from Customer where City='London'

select * from Customer where City not in('Barlin')

select * from Customer where Customer_Id = 23

select * from Customer where City = 'Barlin' and PostelCode = 121110

select * from Customer where City = 'Barlin' or City = 'London'

select * from Customer where PostelCode is null

select * from Customer where PostelCode is not null

update Customer set City='Oslo' where Country='Norway'

delete  from Customer where City='Colambo' and Customer_Id=26

select * from Customer where Country in('Norway' , 'France')

select * from Customer where Country Not in('Norway' , 'France')

select PostelCode as 'Pno' from Customer

select Custome_Name as 'Customers' from Customer

select * from Product where Prod_price Between 10 and 20

select * from Product where Prod_price not Between 10 and 20

select * from Customer order by City

select * from Customer order by City desc

select * from Customer order by Country,City

select min (Prod_Price) as 'min price' from Product

select max (Prod_Price) as 'max price' from Product

select avg (Prod_Price) as 'avg price' from Product

select sum (Prod_Price) as 'sum price' from Product

select * from Customer where City like 'a%'

select * from Customer where City like '%a'

select * from Customer where City like '%a%'

select * from Customer where City like '%[ab]%'

select * from Customer where City not like 'a%'

select count (Prod_Price) as 'total count' from Product where Prod_price = 20

select * from Customer where City like '_a'

select * from Customer where City like '[acs]%'

select * from Customer where City like '%[af]'

select * from Customer where City not like '[acf]'


------------------------------------------------------------------------------------------------------------------------


 -- Assignment--> 2

 create table EmployeeInfo(
 EmpId int primary key,
 EmpFname varchar(20),
 EmpLname varchar(20),
 Department varchar(20),
 Project varchar(10),
 EAddress varchar(20),
 DOB Date,
 Gender varchar(10))

insert into EmployeeInfo values(1,'Rohit','Gupta','Admin','P1','Delhi','1979/12/2','Male')
insert into EmployeeInfo values(2,'Rahul','Mahajan','Admin','P2','Mumbai','1986/10/10','Male')
insert into EmployeeInfo values(3,'Sonia','Banerjee','HR','P3','Pune','1983/6/5','Female')
insert into EmployeeInfo values(4,'Anikta','Kapoor','HR','P4','Chennai','1983/11/28','Female')
insert into EmployeeInfo values(5,'Swati','Garg','HR','P5','Delhi','1991/4/6','Female')


 select * from EmployeeInfo

 -----------------------------------------------

 create table EmployeePosition(
 EmpId int,
 constraint Fk_Ep foreign key (EmpId) references EmployeeInfo(EmpId),
 EmpPosition varchar(20),
 DateOfJoining date,
 Salary int)


insert into EmployeePosition values(1,'Executive','2020/4/1',75000)
insert into EmployeePosition values(2,'Manager','2020/4/3',50000)
insert into EmployeePosition values(3,'Manager','2020/4/2',150000)
insert into EmployeePosition values(2,'Officer','2020/4/2',90000)
insert into EmployeePosition values(1,'Manager','2020/4/3',300000)


select * from EmployeeInfo
 select * from EmployeePosition

 ---------------------------------------------------------------


--1.Create a query to generate the first records from the EmployeeInfo table.
 select top 1 * from EmployeeInfo

--2.Create a query to generate the last records from the EmployeeInfo table.
select  top 1 * from EmployeeInfo order by EmpId desc

--3.Create a query to fetch the third-highest salary from the EmpPosition table.
select * from EmployeePosition order by Salary desc 
offset 2 rows fetch next 1 row only

--4.Write a query to find duplicate records from a table.
select empid,count(empid) as 'count' from EmployeePosition 
	 group by empId
	 having count(empid)>1


--5.Create an SQL query to fetch EmpPostion and the total salary paid for each employee position.
select EmpPosition , sum (Salary) from EmployeePosition
group by EmpPosition

--6.find the employee who has max salary
select max (Salary) as 'Max Salary' from EmployeePosition

--7.find the employee who has max salary from HR department
select top 1 e1.*, p1.salary from EmployeeInfo e1
	   inner join EmployeePosition p1 on p1.empId=e1.empId
	   where e1.department='HR'
	   order by p1.salary desc


--8.find the age of each employee
select *, year(cast(GETDATE() as date))-year(cast(dob as date)) as 'Age' from EmployeeInfo


--9.display only female employee details
select * from EmployeeInfo where Gender = 'Female'

--10.display employee whos position is executive
select ei.EmpFname  from EmployeeInfo ei
inner join EmployeePosition ep
on ei.EmpId = ep.EmpId
where EmpPosition = 'executive'

--11.display count of employee in each city
select EAddress ,count(*) as 'cnt' from EmployeeInfo
group by EAddress




















































































































































































































































































































































































































































































































































































































































































































































































































































































































































