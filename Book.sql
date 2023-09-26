
Create Database Book

create Table Author_Table(
Author_Id int primary key,
Author_Name varchar(20),
PH_No varchar(20),
Email varchar(20),
A_Address varchar(50),
City varchar(10))

insert into Author_Table (Author_Id,Author_Name,City) values (101,'Chetan Bhagat','Pune')
insert into Author_Table (Author_Id,Author_Name,City) values (102,'Balwant Gargi','Mumbai')
insert into Author_Table (Author_Id,Author_Name,City) values (103,'V.S. Naipaul','Benglore')
insert into Author_Table (Author_Id,Author_Name,City) values (104,'Satish Gujral','Gujrat')
insert into Author_Table (Author_Id,Author_Name,City) values (105,'Gita Mehta','Pune')

select * from Author_Table

----------------------------------------------------------------------------------------------------------------------
Create Table AwardMaster_Table(
AwardType_Id int primary  key,
Award_Name varchar(20),
Award_Price Decimal)

insert into AwardMaster_Table values (1,'Civilian Awards',20000)
insert into AwardMaster_Table values (2,'Military Awards',25000)
insert into AwardMaster_Table values (3,'Sports Awards',50000)
insert into AwardMaster_Table values (4,'Literary Awards',25000)

select * from AwardMaster_Table

---------------------------------------------------------------------------------------------
create Table Book_Table(
Book_Id int primary key,
Book_Name varchar(50),
Author_Id int,
constraint Fk_Au foreign key (Author_Id) references Author_Table (Author_Id),
Price int)

insert into Book_Table values(1001,'Kalhana',102,450)
insert into Book_Table values(1002,'Making India Awesome',101,500)
insert into Book_Table values(1003,'Half Girlfriend',101,800)
insert into Book_Table values(1004,'A Million Mutinies Now ',103,430)
insert into Book_Table values(1005,'A Brush with Life ',104,280)
insert into Book_Table values(1006,'A River Sutra ',105,1000)

select * from Book_Table

---------------------------------------------------------------------------------------------------------------

Create Table Award_Table(
Award_Id int primary key,
AwardType_Id int,
constraint Fk_At foreign key (AwardType_Id) references AwardMaster_Table (AwardType_Id),
Author_Id int,
constraint Fk_Aw foreign key (Author_Id) references Author_Table (Author_Id),
Book_Id int,
constraint Fk_bk foreign key (Book_Id) references Book_Table (Book_Id),
Yr int)

insert into Award_Table values (001 , 1 , 102 , 1001 , 2019)
insert into Award_Table values (002 , 2 , 101 , 1002 , 2020)
insert into Award_Table values (003 , 1 , 103 , 1003 , 2022)
insert into Award_Table values (004 , 3 , 104 , 1005 , 2023)
insert into Award_Table values (005 , 4 , 102 , 1001 , 1999)
insert into Award_Table values (006 , 3 , 105 , 1004 , 2015)

update Award_Table set Award_Id = 666 where Award_Id = 006

select * from Award_Table

------------------------------------------------------------------------------------------------


--1.Find the Book which is written by Chetan Bhagat
select b.Book_Name from Book_Table b 
inner join Author_Table a
on b.Author_Id = a.Author_Id
where a.Author_Name = 'Chetan Bhagat'


--2.find author name for Book 'A River Sutra'
select b.Book_Name, a.Author_Name from Author_Table a
inner join Book_Table b
on a.Author_Id = b.Author_Id
where b.Book_Name = 'A River Sutra'



--3.Find author name who got award in 1999
select a.Author_Name,aw.Yr from Author_Table a
inner join Award_Table aw
on a.Author_Id = aw.Author_Id
where aw.Yr = 1999


--4.find the book got an awards
select b.Book_Name from Book_Table b
inner join Award_Table a
on b.Book_Id = a.Book_Id


--5.Find out the author wise book count
select a.Author_Name,count(*)as 'Cnt' from Author_Table a
inner join Book_Table b
on a.Author_Id = b.Author_Id
group by a.Author_Name


--6.Find the Author name whos got only one award
select a.Author_Name ,count(aw.Award_Id)as 'cnt' from Author_Table a
inner join Award_Table aw
on a.Author_Id = aw.Author_Id
group by a.Author_Name
having count(aw.Award_Id) = 1


--7.Find the author name whos got 'Civilian Awards'
select a.Author_Name,am.Award_Name from Author_Table a
inner join Award_Table aw
on a.Author_Id = aw.Author_Id
inner join AwardMaster_Table am
on am.AwardType_Id = aw.AwardType_Id
where am.Award_Name = 'Civilian Awards'


--8.find the author who got award price more than 25000
select a.Author_Name , am.Award_Price from Author_Table a
inner join Award_Table aw
on a.Author_Id = aw.Author_Id
inner join AwardMaster_Table am
on aw.AwardType_Id = am.AwardType_Id
where Award_Price > 25000
--
select* from AwardMaster_Table
select* from Award_Table
select * from Author_Table


--9.Find author who got Maximum Awards
select top 1 a.Author_Name , Count(*) as 'Count' from Author_Table a
inner join Award_Table aw
on a.Author_Id = aw.Author_Id
group by a.Author_Name
order by Count(*) desc
