
create table Employee(
Emp_id int primary key,
EName varchar(20),
Dept_id int,
Constraint Fk_D foreign key (Dept_id) references Department(Dept_id),
Age int,
City varchar(50),
salary int)

create table Department(
Dept_id int primary key,
Dept_Name varchar(50))

select * from Employee

insert into Employee values (1,'Rohan',101,21,'Pune',15000)
insert into Employee values (2,'Omakr',102,22,'Mumbai',18000)
insert into Employee values (3,'Reema',103,18,'Benglore',22000)
insert into Employee values (4,'Shubham',101,25,'Pune',13000)
insert into Employee values (5,'Shree',103,23,'Mumbai',15000)
insert into Employee values (6,'Tommy',101,21,'Benglore',25000)
insert into Employee values (7,'Ricky',104,22,'Pune',35000)
insert into Employee values (8,'Om',102,28,'Mumbai',18000)
insert into Employee values (9,'Poonam',105,23,'Benglore',30000)
insert into Employee values (10,'Suraj',102,19,'Pune',25000)

update Employee set Salary = 25000 where Emp_id = 10

select * from Department

insert into Department values (101,'HR')
insert into Department values (102,'Admin')
insert into Department values (103,'Development')
insert into Department values (104,'Testing')
insert into Department values (105,'Sales')


--Inner Join
select e.*,d.Dept_name
from Employee e 
inner join Department d on d.Dept_id = e.Dept_id

select e.*,d.Dept_name
from Employee e 
left join Department d on d.Dept_id = e.Dept_id

select e.*,d.Dept_name
from Employee e 
right join Department d on d.Dept_id = e.Dept_id

---------------------------------------------------------------------------------------------------------------------


-- Cross join

create table Color_Table(
C_Id int primary key,
C_Name varchar (10))

insert into Color_Table values(1,'Red')
insert into Color_Table values(2,'Blue')
insert into Color_Table values(3,'Orange')
insert into Color_Table values(4,'Yellow')
insert into Color_Table values(5,'Pink')
insert into Color_Table values(6,'Black')

select * from Color_Table


create table Sizes_Table(
S_Id int primary key,
Size varchar(50))

insert into Sizes_Table values(100,'S')
insert into Sizes_Table values(101,'M')
insert into Sizes_Table values(102,'L')
insert into Sizes_Table values(103,'XL')
insert into Sizes_Table values(104,'XXL')

select * from Sizes_Table

select * from Color_Table cross join Sizes_Table 

-------------------------------------------------------------------------------------------------------------------

--Group by---
-- display dept wise sum salary
select Dept_id, sum(salary) from Employee
group by Dept_id

-- display count of emp in each dept
-- summary of dept
--select Emp_id,Dept_id from Employee
select Dept_id,count(Emp_id)as 'count' from  employee 
group by Dept_id


-- display dept wise avg salary
select Dept_id, avg(salary) from Employee
group by  Dept_id

--display count of emp in each city
select City,count(Emp_id) as'count' from Employee
group by City

------------------------------------------ Assignment 1 ---------------------------------------

create table User_Table(
U_Id int primary key,
U_Name varchar(50),
Email varchar(40))

insert into User_Table values(1,'Sandesh','sanddy@gmail.com')
insert into User_Table values(2,'Amol','Ak@gmail.com')
insert into User_Table values(3,'Suraj','suraj@gmail.com')

select * from User_Table


create table Product_table(
P_Id int primary key,
P_Name varchar(20),
P_Price int)

insert into Product_table values (101,'Pen',30)
insert into Product_table values (102,'Pencil',20)
insert into Product_table values (103,'Laptop',35000)
insert into Product_table values (104,'Phone',15000)
insert into Product_table values (105,'Headphone',850)
insert into Product_table values (106,'Bottle',150)

select * from Product_table


create table order_Table(
O_Id int primary key,
P_Id int,
Constraint Fk_P foreign key (P_Id) references Product_table(P_Id),
U_Id int,
Constraint Fk_U foreign key (U_Id) references User_Table(U_Id),
Quantity int)

insert into order_Table values (001,101,1,200)
insert into order_Table values (002,102,3,150)
insert into order_Table values (003,103,2,10)
insert into order_Table values (004,104,3,5)
insert into order_Table values (005,105,1,35)
insert into order_Table values (006,106,2,20)

select * from order_Table

--Dispay number of order Placed by each User
select U_Id, count (O_Id) as 'count' from order_Table
group by U_Id

--Having By
select U_Id, count(O_Id) from order_Table
group by U_Id
having count(O_Id)>1
 

 -------------------------------------------------------------------------------------

---Assignment 2 -----------

--Asume you have table for student with their course name 
--(Student) --> sid,sname,coursename,fees

--Display Count of student in each course
select coursename , count(sid) from Student
group by coursename

--display count of student for C# course
select coursename , count(sid) from Student
where coursename = 'C#'
group by coursename

--Display course and count student but count of student > 10
select coursename,count(sid) from Student
group by coursename
having count(sid)>10

--Display sum of fees for each course
select coursename,sum(fees) as 'Total fess' from Student
group by coursename

--Display count of student in each course, stud count less  than 15 and display in Desending order
select coursename , count(sid) as 'count' from Student
group by coursename
having by count(sid)<15
order by count(sid) desc

--------------------------------------------------------------------------------------------------------------------

