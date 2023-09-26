
create table Employee(
EmpId int primary key,
EName varchar(20),
Salary numeric(12,2),
Dept_Name varchar(20),
Gender varchar(10),
E_Location varchar(25),
Designation varchar(20),
Age int)

insert into Employee values(100,'Rahul',20000.23,'Production','Male','Warje','Trainee',20)
insert into Employee values(101,'Omkar',21000.00,'Sale','Male','Karvenagar','Junior SaleMan',22)
insert into Employee values(102,'Vishal',23000.33,'HR','Male','Hadapsar','Recruter',25)
insert into Employee values(103,'Payal',24000.25,'IT','Female','Wagholi','Testing',20)
insert into Employee values(104,'Neeta',20000.23,'IT','Female','Katraj','jr.Developer',21)
insert into Employee values(105,'Shree',20000.23,'Production','Male','SNDT','Manager',30)
insert into Employee values(106,'Ram',50000.23,'IT','Male','Mumbai','Manager',50000)
insert into Employee values(107,'Esha',450000.23,'Production','Female','SNDT','Manager',40)
insert into Employee values(108,'Ram',55000.23,'Production','Male','SNDT','TeamLeader',45)


update Employee set Age = 50 where EmpId = 106
update Employee set Salary = 45000.23 where EmpId = 107



select * from Employee

select * from Employee where Salary > 25000 and Salary < 50000

select * from Employee where EName like 'n%'

select count (Dept_Name) as 'dept' from Employee

select max (Salary) as 'Salary' from Employee

select Gender , count (*) from Employee group by Gender

select * from Employee where E_Location = 'SNDT' or Salary > 40000

update Employee set Designation = 'Manager' where Salary > 50000

delete from Employee  where Age > 45 and Salary > 40000

select * from Employee where EName like '%e%'

select EmpId,Ename,Salary , Salary+(Salary * 0.12) as 'pf' from Employee -- pf calculate


---------------------------------------------------------------------------------------------------------------

create table Employee1(
Emp_id int primary key,
EName varchar(20),
salary int,
Dept_id int,
Constraint Fk_D foreign key (Dept_id) references Department1(Dept_id))

select * from Employee1

insert into Employee1 values (1,'Rohan',15000,101)
insert into Employee1 values (2,'Omakr',18000,102)
insert into Employee1 values (3,'Reema',22000,103)
insert into Employee1 values (4,'Shubham',13000,101)
insert into Employee1 values (5,'Shree',15000,103)
insert into Employee1 values (6,'Tommy',25000,101)
insert into Employee1 values (7,'Ricky',35000,104)
insert into Employee1 values (8,'Om',18000,102)
insert into Employee1 values (9,'Poonam',30000,105)
insert into Employee1 values (10,'Suraj',25000,102)
insert into Employee1 values (11,'Shree',28000,null)

alter table Employee1 add ManagerId int
update Employee1 set ManagerId = 5 where Emp_Id in (1,2,3,4)
update Employee1 set ManagerId = 11 where Emp_Id in (6,7,8,9,10)
update Employee1 set  EName='Aniket' where Emp_id = 11




create table Department1(
Dept_id int primary key,
Dept_Name varchar(50),
City varchar(10))

select * from Department1

insert into Department1 values (101,'HR','Pune')
insert into Department1 values (102,'Admin','Mumbai')
insert into Department1 values (103,'Development','Benglore')
insert into Department1 values (104,'Testing','Mumbai')
insert into Department1 values (105,'Sales','Pune')
insert into Department1 val9ues (106,'Trainee','Pune')
insert into Department1 values (107,'Marketing','Benglore')



--find the department for Employee poonam
select e.EName, d.Dept_Name from Employee1 e 
inner join Department1 d 
on e.Dept_id = d.Dept_id
where e.EName = 'Omkar'

--find salary for emp who is works in admin department
select e.salary,d.Dept_Name from Employee1 e
inner join Department1 d
on e.Dept_id = d.Dept_id
where d.Dept_Name = 'Admin'

--find the no of Employee from each department
select d.Dept_Name, count(Emp_id) as 'total count' from Employee1 e
inner join Department1 d on e.Dept_id = d.Dept_id group by d.Dept_Name

--Find Department name  whos salary greater than 20000
select e.EName,d.Dept_Name,e.salary from Employee1 e
inner join Department1 d
on e.Dept_id = d.Dept_id
where e.salary > 20000

--Find the Employee name whos is working in pune and department hr
select e.EName,d.Dept_Name from Employee1 e 
inner join Department1 d
on e.Dept_id = d.Dept_id
where City = 'Pune' and d.Dept_Name='HR'

--Find Employee name , salary whos is not working in Department HR
select e.Ename,e.salary,d.Dept_Name from Employee1 e
inner join Department1 d
on e.Dept_id = d.Dept_id
where Dept_Name not like 'HR'

--Find the Employee who has not assign dept
select e.Ename from Employee1 e
left join Department1 d
on e.Dept_id = d.Dept_id
where d.Dept_Name is null


--find the employee who is working in HR department
select e.EName, d.Dept_Name from Employee1 e 
inner join Department1 d 
on e.Dept_id = d.Dept_id
where d.Dept_Name = 'HR'

--inner join
select e.Emp_id, e.EName, d.Dept_Name  from Employee1 e 
inner join Department1 d 
on e.Dept_id = d.Dept_id

--left join
select e.Emp_id,e.EName, d.Dept_Name from Employee1 e 
left join Department1 d 
on e.Dept_id = d.Dept_id

--right join
select e.Emp_id,e.EName, d.Dept_Name from Employee1 e 
right join Department1 d 
on e.Dept_id = d.Dept_id

--full join
select e.Emp_id,e.EName, d.Dept_Name from Employee1 e 
full join Department1 d 
on e.Dept_id = d.Dept_id


--self join
select e1.EName 'Employee', e2.EName as 'Manager'
from Employee1 e1 , Employee1 e2
where e1.ManagerId = e2.Emp_id

select e1.EName as 'earn high',e1.salary , e2.EName as 'earn less',e2.salary
from Employee1 e1, Employee1 e2
where e1.salary >e2.salary

-----------------------SubQuery--
--Display the EMployee details who has Max salary in EMployee table
select * from Employee1 where salary = (select max (salary) from Employee1)

--display emp details who work in HR dept
select *from Employee1 where Dept_id = 
(select Dept_id from Department1 where Dept_Name = 'HR')

--Display EMployee Details who has less salary than Rohan
select * from Employee1 where salary <
(select salary from employee1 where EName = 'Rohan')

--Display the Employee details who has less salary the avg salary of all Employee
select * from Employee1 where Salary <
(select avg(salary) from Employee1)

 
--Display the Employee From Development Department Who has Salary the avg salary of admin department
select * from Employee1 where salary <(
select avg(salary) from Employee where Dept_id = 
(select Dept_id from Department1 where Dept_Name = 'Admin')
and Dept_id=(select Dept_id from Department1 where Dept_Name = 'Development'))

--Display the Employee Details whos has 2nd highest Salary 
select * from Employee1 where salary = (
select max (salary) from Employee1 where salary <>
(select max(salary) from Employee1))


--Update With Subquery 
update Employee1 set salary = salary + 2000 where Dept_id in (
select Dept_id from Department1 where Dept_Name = 'HR')

--Delete with SubQuery
delete from Employee1 where Dept_id in (
select Dept_id from Department1 where Dept_Name = 'Admin'

---------------------------------------------------------------------------------------------


create table Country_Table(
C_id int primary key,
C_Name varchar(20))

insert into Country_Table values(91,'India')
insert into Country_Table values(1,'USA')
insert into Country_Table values(44,'Uk')
insert into Country_Table values(86,'Chaina')
insert into Country_Table values(52,'Mexico')

select * from Country_Table

create table State_Table(
S_id int primary key,
S_Name varchar(20),
C_id int,
constraint Fk_c foreign key (C_id) references Country_Table(C_id))

insert into State_Table values(1,'Karnataka',91)
insert into State_Table values(2,'Maharastra',91)
insert into State_Table values(3,'Texas',1)
insert into State_Table values(4,'England',44)
insert into State_Table values(5,'Hainan',86)

select * from State_Table


create table City_Table(
Ct_id int primary key,
City_Name varchar(50),
S_id int,
constraint Fk_s foreign key (S_id) references State_Table(S_id))

insert into City_Table values(100,'New york',3)
insert into City_Table values(101,'London',4)
insert into City_Table values(102,'Hong Kong',5)
insert into City_Table values(103,'Pune',2)
insert into City_Table values(104,'Belgaum',1)
insert into City_Table values(105,'Benglore',1)

select * from City_Table

--Find country who state is maharastra
select c.C_Name,s.S_Name from Country_Table c 
inner join  State_Table s
on c.C_id = s.C_id
where s.S_Name = 'Maharastra'

--find country id,country name  state maharastra and city is pune
select c.C_id , c.C_Name,s.S_Name,ct.City_Name from Country_Table c
inner join State_Table s
on c.C_id = s.C_id
inner join City_Table ct 
on ct.S_id = s.S_id
where s.S_Name = 'Maharastra' and ct.City_Name = 'Pune'

--find the state from country USA
select s.S_Name from State_Table s 
inner join Country_Table c
on s.C_id = c.C_id
where c.C_Name = 'USA'

--find City  name form the country India
select ct.City_Name from City_Table ct
inner join State_Table s
on ct.S_id = s.S_id
inner join Country_Table c
on c.C_id = s.C_id
where c.C_Name = 'India'


