
create database Country

create table Country_Table(
C_Id int primary key,
C_Name varchar(50))

Create table Format_Table(
F_id int primary key,
F_Name varchar(50))

create table BatsMan_Table(
P_Id int primary key,
P_Name varchar(20),
Age int,
C_Id int,
constraint Fk_bc foreign key (C_Id) references Country_Table(C_Id),
Total_Runs int,
T_50s int,
T_100s int,
PlayerGrade varchar(5))

create table BF_Mapping_Table(
Id int primary key,
P_Id int,
constraint Fk_p foreign key (P_Id) references BatsMan_Table(P_Id),
F_Id int,
constraint Fk_Mt foreign key (F_Id) references Format_Table(F_Id))

