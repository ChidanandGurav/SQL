
Create database AdoNet
use[AdoNet]

Create table Employee(
E_Id int primary key identity,
E_Name varchar(50),
Email varchar(50),
Age int,
Salary int,
D_id int,
constraint fk_did foreign key(D_id) references Department(D_id))

select * from Employee

create table Department(
D_id int primary key,
D_Name varchar(50))

insert into Department values(101 ,'HR')
insert into Department values(102 ,'Admin')
insert into Department values(103 ,'Testing')
insert into Department values(104 ,'Developement')
insert into Department values(105 ,'Trainee')

update Department set D_Name = 'Sales' where D_id = 105

select * from Department