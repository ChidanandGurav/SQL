
create database Student01

create table Student(
RollNo int primary key,
Sname varchar(50),
Degree varchar(20),
BirthDate Date,
Course_id int,
Constraint fk_ci foreign key (Course_id) references Course (Course_id),
FeesPaid int,
Remark varchar(20),
IsPlaced varchar(20))

insert into Student values(1,'Ram','B.com','1999/12/14',101,5000,'Not Elegible','No Placeed')
insert into Student values(2,'Sham','B.sc','2000/6/28',102,10000,'Elegible','No Placeed')
insert into Student values(3,'Geeta','BCA','1998/4/30',103,8000,'Not Elegible','No Placeed')
insert into Student values(4,'Seeta','B.com','1996/10/2',102,5000,'Elegible','Placeed')
insert into Student values(5,'Om','Bsc.cs','2002/9/1',101,4500,'Elegible','No Placeed')
insert into Student values(6,'Shree','BTech.cs','2003/8/9',102,20000,'Not Elegible','Placeed')


Create table Course(
Course_id int primary key,
Course_name varchar(50),
Duration varchar(20),
TrainerId int,
Constraint fk_ti foreign key (TrainerId) references Trainer (TrainerId),
TotalFees int)

insert into  course values (101,'Java','6-Month',1,20000)
insert into  course values (102,'Python','3-Month',4,15000)
insert into  course values (103,'.Net','5-Month',2,12000)


create table Trainer(
TrainerId int primary key,
TrainerName varchar(20),
JoinDate Date,
Email varchar(30),
Experience_Year int)

insert into Trainer values(1,'Rahul','2019/10/20','rl@gmail.com',5)
insert into Trainer values(2,'Aniket','2017/9/8','an@gmail.com',7)
insert into Trainer values(3,'Omkar','2015/1/10','ok@gmail.com',2)
insert into Trainer values(4,'Ketaki','2020/2/22','kk@gmail.com',6)
insert into Trainer values(5,'Madhuri','2022/8/3','md@gmail.com',10)

select * from Trainer
select * from Course
select * from Student


--1. Show list of students. List contains roll no , student name , course name , trainer name 
--in order of course name and student name.
select s.Sname,c.Course_name from Student s
inner join Course c
on s.Course_id = c.Course_id
inner join Trainer t
on t.TrainerId = c.TrainerId
order by s.Sname,c.Course_name


--2. Show list of students who have pending fees more than 1000rs . List should have student name , 
--course name , balance fees . Show this list in descending order of balance fees.
select s.Sname,c.Course_name,c.TotalFees,s.FeesPaid,(c.TotalFees-s.FeesPaid) as 'Pending fees' from Student s
inner join Course c
on s.Course_id = c.Course_id
where(c.TotalFees - s.FeesPaid)>1000
order by s.FeesPaid

--3. Append letter ‘_spl’ to all batch ids of trainer ‘Deepa’.


--4. Update table student. Update ‘remark’ field. Remark should be ‘Eligible for exam’ if fees paid by student is more than 60%.
update Student set Remark = 'Eligible fro Exam' where FeesPaid > any 
(select TotalFees * 0.60 as '60% of fees' from Course)

--5. Create a index to make retrieval faster based on course name.
create Index aa_index on Course(Course_name)

--6. List name of course for which more than 2 students are enrolled.
select c.Course_name from Course c
 join Student s
on c.Course_id = s.Course_id
having count(s.Course_id)>=2

--7. List name of course for which maximum revenue was generated. ( max fee collection)
select c.Course_name , sum (s.FeesPaid) as 'Total' from Course c
inner join Student s on s.Course_id = c.Course_id
group by c.Course_name
order by Total desc

--8. Select name of student who are in same batch as ‘Atul’.


--9. Delete all students who are in course which is less than 2 months duration.
delete from Student where course_id in 
(select course_id from Course where Duration <= '3-Month')

--10. Delete all students for whom is placed is ‘yes’ and who have paid all the fees of their course.
delete from Student where Sname in 
(select s.Sname from Student s inner join Course c on s.Course_id = c.Course_id where s.FeesPaid = c.TotalFees)
and IsPlaced = 'Placed'

--11. Create a trigger to add student data in ex-student table if student is deleted from student table.


--12. Create a view which shows name of trainer and number of students he is training.
select TrainerName,count(*) from Trainer t inner join course c 
on c.TrainerId=t.TrainerId inner join Student on c.Course_id=c.Course_id group by trainername

--13. Show names of students who are more than 23 years old.
select Sname from Student
where year(cast(getdate() as date))-year(cast(BirthDate as date)) > 23


--14. Show names of students who have paid all the fees.
select s.Sname from Student s
inner join Course c on s.Course_id = c.Course_id
where (c.TotalFees - s.FeesPaid) = 0

--15. Write a procedure which accepts student id and returns his balance fees.