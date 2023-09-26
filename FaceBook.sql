
create database FaceBook

create table FBUsers_Table(
U_Id int primary key,
U_name varchar(50),
EmailId varchar(20),
Ph_No varchar(20),
Total_Post int)

create table Post_Table(
P_Id int primary key,
U_Id int,
Constraint Fk_u foreign key (U_Id) references FBUsers_Table(U_Id),
Post_Content varchar(50),
Post_img Image,
Post_vid int)

create table Friendship_Table(
F_Id int primary key,
U_Id int,
Constraint Fk_fu foreign key (U_Id) references FBUsers_Table(U_Id),
FrdStatus_Code int,
Constraint Fk_fsc foreign key (FrdStatus_Code) references FriendshipStatus_Table(FrdStatus_Code))


create table FriendshipStatus_Table(
FrdStatus_Code int primary key,
FStatus varchar(50)) 



