
create database Moive

create table Moive_Table(
M_Id int primary key,
M_Name varchar(50),
Release_Year int,
Box_Off_Coll varchar(20))

create table Roles_Table(
Roll_Id int primary key,
Roll_Name varchar(50))

Create table Celebrity_Table(
C_Id int primary key,
C_Name varchar(20),
BirthDate varchar(30),
PH_No varchar(20),
EmailId varchar(20))

create table BollywoodData_Table(
BD_Id int primary key,
C_Id int,
Constraint Fk_c foreign key (C_Id) references Celebrity_Table (C_Id),
M_Id int,
Constraint Fk_m foreign key (M_Id) references Moive_Table (M_Id),
Roll_Id int,
Constraint Fk_r foreign key (Roll_Id) references Roles_Table (Roll_Id))
