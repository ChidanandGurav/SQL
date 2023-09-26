
create table Student_Table(
Stud_id int primary key,
Stude_Name varchar(50),
City varchar(20))

insert into Student_Table values(1,'Ram','Pune')
insert into Student_Table values(2,'Sham','Mumbai')
insert into Student_Table values(3,'Sita','Pune')
insert into Student_Table values(4,'Gita','Nashik')



Create table Subject_Table(
Sub_id int primary key,
SubName varchar(20),
Max_mark int,
Pass_Mark int)

insert into Subject_Table values(101,'Maths',100,40)
insert into Subject_Table values(102,'Maths',100,40)
insert into Subject_Table values(103,'Maths',50,15)
insert into Subject_Table values(104,'Maths',50,15)



Create table Exam_Table(
Stud_id int,
constraint fk_std foreign key (Stud_id) references Student_Table(Stud_id),
Sub_id int,
constraint fk_sub foreign key (Sub_id) references Subject_Table(Sub_id),
Mark int)

insert into Exam_Table values(1,101,100)
insert into Exam_Table values(1,102,85)
insert into Exam_Table values(1,103,40)
insert into Exam_Table values(1,104,45)
insert into Exam_Table values(2,101,35)
insert into Exam_Table values(2,102,55)
insert into Exam_Table values(2,103,25)
insert into Exam_Table values(3,101,95)
insert into Exam_Table values(3,102,87)
insert into Exam_Table values(3,103,45)
insert into Exam_Table values(3,104,42)


select * from Subject_Table
select * from Student_Table
select * from Exam_Table

--find the total marks of each Student
select Stud_id , count(Mark) as 'Count' from Exam_Table
group by Stud_id

--find the total marks of each Student
select Stud_id , sum(Mark) as 'Sum' from Exam_Table
group by Stud_id

