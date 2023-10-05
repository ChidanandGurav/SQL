
use [AdoNet]

create table Product(
Pid int primary key identity,
Pname varchar(50),
Price int,
Cid int,
constraint Fk_Cid foreign key(Cid) references Category(Cid))


create table Category(
Cid int primary key,
Cname varchar(20))

insert into Category values (1,'Mobile')
insert into Category values (2,'Laptop')
insert into Category values (3,'Cloths')
insert into Category values (4,'Electronics')

select * from Category
select * from Product
