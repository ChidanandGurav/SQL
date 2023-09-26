?
create Database Doctor


create table province(
 province_id char(2) primary key,
 province_name varchar(30))
insert into province(province_id,province_name)
             values('MH','Maharashtra'),
			       ('RJ','Rajsthan'),
				   ('AP','Andhra Pradesh'),
				   ('AS','Assam'),
				   ('BH','Bihar')
select* from province

-----------------------------------------------------------------------------

create table Doctor(
doctor_id int primary key,
First_name varchar(25),
Last_name varchar(25),
Speciality varchar(25))

INSERT INTO Doctor (doctor_id, First_name, Last_name, Speciality)
VALUES
    (1, 'Dr.Vishwa', 'Waghmare', 'Cardiologist'),
    (2, 'Dr.Diksha', 'Thakur', 'Pediatrician'),
    (3, 'Dr.Soham', 'Deshmukh', 'Orthopedic Surgeon')

	select * from Doctor

-------------------------------------------------------------------------------------

create table Patients(
 Patient_id int primary key,
 First_name varchar(25),
 Last_name varchar(25),
 gender char(1),
 Birth_date date,
 City varchar(25),
 province_id char(2),
 Allergies varchar(25),
 Height decimal(3,0),
 Weight decimal(4,0),
foreign key (province_id) references  province(province_id))

INSERT INTO Patients (Patient_id, First_name, Last_name, gender, Birth_date, City, province_id, Allergies, Height, Weight)
VALUES
    (101, 'Varsha', 'Desai', 'F', '2020-05-15', 'Pune', 'MH', 'Penicillin', 160, 130),
    (102, 'Shubham ', 'Verma', 'M', '1985-03-20', 'Pali', 'RJ', NULL, 175, 180),
    (103, 'Mohini', 'Pal', 'F', '2001-07-10', 'SujanGad', 'BH', 'Gluten', 155, 120),
    (104, 'Arush', 'Kakade', 'M', '2010-01-30', 'Mumbai', 'MH', NULL, 190, 200),
    (105, 'Arunita', 'Kanjilal', 'F', '2022-09-18', 'Ooty', 'AS', 'Lactose', 165, 140),
    (106, 'Falak', 'Shah', 'F', '1995-11-25', 'Deogad', 'AP', 'Peanuts', 180, 160),
	(107, 'Ankur', 'Choudhari', 'M', '2020-11-25', 'Churu', 'RJ', 'Asthama', 190, 180),
	(108, 'Prajakta', 'Mali', 'F', '2015-12-30', 'Mirrot', 'BH', 'Rhinits', 185, 155),
	(109, 'Mukesh', 'Dhdave', 'M', '1992-11-21', 'Solapur', 'MH', 'Morphine', 195, 130),
	(110, 'Adil', 'Khan', 'M', '1995-11-25', 'Mysore', 'AP', 'Sinusitis', 160, 160)

	select * from Patients

-----------------------------------------------------------------------------------------------------------------------------

create table Admissions(
Patient_id int,
Doctor_id int,
Admission_date date,
Discharge_date date,
Diagnosis varchar(20),
foreign key (Patient_id)references Patients(Patient_id),
foreign key (doctor_id)references Doctor(doctor_id))

INSERT INTO Admissions (Patient_id, Doctor_id, Admission_date, Discharge_date, Diagnosis)VALUES
    (101, 1, '2023-01-10', '2023-01-20', 'Heart Disease'),
    (102, 2, '2023-02-05', '2023-02-15', 'Flu'),
    (103, 1, '2023-03-15', '2023-03-25', 'Fractured Arm'),
    (104, 3, '2023-04-20', '2023-05-01', 'Appendicitis'),
    (105, 2, '2023-05-10', '2023-05-20', 'Allergic Reaction'),
    (106, 1, '2023-06-05', '2023-06-15', 'Broken Leg'),
	(107, 3, '2023-05-05', '2023-06-20', 'Heart vovl Disease'),
	(108, 2, '2023-05-10', '2023-05-15', 'Headache'),
	(109, 3, '2023-06-07', '2023-06-20', 'Kidny stone'),
	(110, 1, '2023-10-02', '2023-10-25', 'Heart Disease')

	select * from Admissions

---------------------------------------------------------------------------------------------------------------

--1. Show the first name, last name and gender of patients who’s gender is ‘M’.
select  First_name,Last_name,gender 
from Patients where gender='M'
-----------------------------------------------------------------------------------------

--2. Show the first name  last name of patients who does not have any allergies
select First_name,Last_name , gender
from Patients where Allergies is null
----------------------------------------------------------------------------------------

--3. Show the patients details that start with letter ‘M’
select * from Patients where First_name like 'M%'
-------------------------------------------------------------------------------------------------------
--4. Show the patients details that height range 160 to 180
select * from Patients
where Height in(160,180)

--------------------------------------------------------------------------------------------------------
--5. Update the patient table for the allergies column. Replace ‘NKA’ where allergies is null
update Patients 
set Allergies='NKA'
where Allergies is null
---------------------------------------------------------------------------------------------------------
--6. Show how many patients have birth year is 2020
select  count (*) as count
from Patients	
where Year (Birth_date)=2020
----------------------------------------------------------------------------------------------------------
--7. Show the patients details who have greatest height
select * from Patients
where Height=(select max(Height)from Patients)
-----------------------------------------------------------------------------------------------------------
--8. Show the total amount of male patients and the total amount of female patients in the patients table.
select gender,count(*)as count
from Patients
group by gender
------------------------------------------------------------------------------------------------------------
--9. Show first and last name, allergies from patients which have allergies to either
--Penicillin or Morphine. Show results ordered ascending by allergies then by first_name then by last_name.
select First_name,Last_name,Allergies
from Patients
where Allergies in ('Penicillin','Morphine')
order by Allergies asc,First_name asc,Last_name asc
------------------------------------------------------------------------------------------------------------
--10. Show first_name, last_name, and the total number of admissions attended for each doctor.
--Every admission has been attended by a doctor.
SELECT D.First_name, D.Last_name, COUNT(A.Patient_id) AS Total_Admissions
FROM Doctor D
JOIN Admissions A ON D.doctor_id = A.Doctor_id
GROUP BY D.doctor_id, D.First_name, D.Last_name
-------------------------------------------------------------------------------------------------------------


--11. For every admission, display the patients full name, their admission diagnosis, and
--their doctor's full name who diagnosed their problem.
select concat(P.First_name, ' ', P.Last_name) as Patient_Name,
       A.Diagnosis as Admission_Diagnosis,
       concat(D.First_name, ' ', D.Last_name) as Doctor_Name
from Admissions A
JOIN Patients P on A.Patient_id = P.Patient_id
JOIN Doctor D on A.Doctor_id = D.doctor_id
----------------------------------------------------------------------------------------------------------------
