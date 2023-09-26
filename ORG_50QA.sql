
create database ORG

use [ORG]

create TABLE Worker(
WORKER_ID INT NOT NULL PRIMARY KEY,
FIRST_NAME CHAR(25),
LAST_NAME CHAR(25),
SALARY INT,
JOINING_DATE DATE,
DEPARTMENT CHAR(25));

INSERT INTO Worker 
	(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
		(001, 'Monika', 'Arora', 100000, '2014-02-20', 'HR'),
		(002, 'Niharika', 'Verma', 80000, '2014-06-11', 'Admin'),
		(003, 'Vishal', 'Singhal', 300000, '2014-02-20', 'HR'),
		(004, 'Amitabh', 'Singh', 500000, '2014-02-20', 'Admin'),
		(005, 'Vivek', 'Bhati', 500000, '2014-06-11', 'Admin'),
		(006, 'Vipul', 'Diwan', 200000, '2014-06-11 ', 'Account'),
		(007, 'Satish', 'Kumar', 75000, '2014-01-20 ', 'Account'),
		(008, 'Geetika', 'Chauhan', 90000, '2014-04-11', 'Admin');


Create TABLE Bonus (
	WORKER_REF_ID INT,
	BONUS_AMOUNT INT,
	BONUS_DATE DATE,
	FOREIGN KEY (WORKER_REF_ID)REFERENCES Worker(WORKER_ID)
    ON DELETE CASCADE);

INSERT INTO Bonus 
	(WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
		(001, 5000, '2016-02-20'),
		(002, 3000, '2016-06-11'),
		(003, 4000, '2016-02-20'),
		(001, 4500, '2016-02-20'),
		(002, 3500, '2016-06-11');


Create TABLE Title (
	WORKER_REF_ID INT,
	WORKER_TITLE CHAR(25),
	AFFECTED_FROM DATE,
	FOREIGN KEY (WORKER_REF_ID)REFERENCES Worker(WORKER_ID) ON DELETE CASCADE);

INSERT INTO Title 
	(WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
 (001, 'Manager', '2016-02-20'),
 (002, 'Executive', '2016-06-11'),
 (008, 'Executive', '2016-06-11'),
 (005, 'Manager', '2016-06-11'),
 (004, 'Asst. Manager', '2016-06-11'),
 (007, 'Executive', '2016-06-11'),
 (006, 'Lead', '2016-06-11'),
 (003, 'Lead', '2016-06-11');


 select * from Worker
 select * from Bonus
 select * from Title


 --Q-1. Write an SQL query to fetch “FIRST_NAME” from the Worker table using the alias name <WORKER_NAME>.
select FIRST_NAME as 'WORKER_NAME' from Worker
-----------------------------------------------------------------------------------------------------------

--Q-2. Write an SQL query to fetch “FIRST_NAME” from the Worker table in upper case.
select Upper (FIRST_NAME) from Worker
-------------------------------------------------------------------------------------------------------------

--Q-3. Write an SQL query to fetch unique values of DEPARTMENT from the Worker table.
select Distinct DEPARTMENT from Worker
----------------------------------------------------------------------------------------------------------------

--Q-4. Write an SQL query to print the first three characters of  FIRST_NAME from the Worker table.
Select substring(FIRST_NAME,1,3) from Worker
-------------------------------------------------------------------------------------------------------------------

--Q-5. Write an SQL query to find the position of the alphabet (‘a’) in the first name column ‘Amitabh’ from the Worker table.

---------------------------------------------------------------------------------------------------------------------------------

--Q-6.Write an SQL query to print the FIRST_NAME from the Worker table after removing white spaces from the right side.
Select RTRIM(FIRST_NAME) from Worker
--------------------------------------------------------------------------------------------------------------------------------

--Q-7. Write an SQL query to print the DEPARTMENT from the Worker table after removing white spaces from the left side.
select Ltrim (DEPARTMENT) From Worker
------------------------------------------------------------------------------------------------------------------------------

--Q-8. Write an SQL query that fetches the unique values of DEPARTMENT from the Worker table and prints its length.
select Distinct len(DEPARTMENT) from Worker
-------------------------------------------------------------------------------------------------------------------------------

--Q-9. Write an SQL query to print the FIRST_NAME from the Worker table after replacing ‘a’ with ‘A’.
select Replace (FIRST_NAME, 'a', 'A') from Worker
--------------------------------------------------------------------------------------------------------------------------------

--Q-10. Write an SQL query to print the FIRST_NAME and LAST_NAME from the Worker table into a single 
--column COMPLETE_NAME. A space char should separate them.
select Concat(FIRST_NAME,' ', LAST_NAME) as 'Complete Name' from Worker
---------------------------------------------------------------------------------------------------------------------------------

--Q-11. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending.
select * from Worker 
order by FIRST_NAME Desc
----------------------------------------------------------------------------------------------------------------------------------

--Q-12. Write an SQL query to print all Worker details from the Worker table 
--order by FIRST_NAME Ascending and DEPARTMENT Descending.
select * from Worker 
order by FIRST_NAME asc , DEPARTMENT desc
----------------------------------------------------------------------------------------------------------------------------------

--Q-13. Write an SQL query to print details for Workers with the first names “Vipul” and “Satish” from the Worker table.
select * from Worker where FIRST_NAME in ('Vipul' , 'Satish')
---------------------------------------------------------------------------------------------------------------------------------

--Q-14. Write an SQL query to print details of workers excluding first names, “Vipul” and “Satish” from the Worker table.
select * from Worker where FIRST_NAME not in ('Vipul' , 'Satish')
----------------------------------------------------------------------------------------------------------------------------

--Q-15. Write an SQL query to print details of Workers with DEPARTMENT name as “Admin”.
select * from Worker where DEPARTMENT = 'Admin'
-------------------------------------------------------------------------------------------------------------------------

--Q-16. Write an SQL query to print details of the Workers whose FIRST_NAME contains ‘a’.
select * from Worker where FIRST_NAME like '%a%'
-------------------------------------------------------------------------------------------------------------------------

--Q-17. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘a’.
select * from Worker where FIRST_NAME like '%a'
-------------------------------------------------------------------------------------------------------------------------

--Q-18. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets.
select * from Worker where FIRST_NAME like '_____h';
--------------------------------------------------------------------------------------------------------------------------

--Q-19. Write an SQL query to print details of the Workers whose SALARY lies between 100000 and 500000.
select * from Worker where SALARY between 100000 and 500000
---------------------------------------------------------------------------------------------------------------------------

--Q-20. Write an SQL query to print details of the Workers who joined in Feb’2014.
select * from Worker where year(JOINING_DATE) = 2014 and month(JOINING_DATE) = 2;
---------------------------------------------------------------------------------------------------------------------------

--Q-21. Write an SQL query to fetch the count of employees working in the department ‘Admin’.
select count(*) as 'Admin_Dept_Count' from Worker where DEPARTMENT = 'Admin'
------------------------------------------------------------------------------------------------------------------------------

--Q-22. Write an SQL query to fetch worker names with salaries >= 50000 and <= 100000.
select concat(FIRST_NAME,'',LAST_NAME) as 'Worker_name' , SALARY from Worker
where WORKER_ID in
(select WORKER_ID from Worker where SALARY >= 50000 and SALARY <= 100000)
-------------------------------------------------------------------------------------------------------------------------

--Q-23. Write an SQL query to fetch the no. of workers for each department in descending order.
select DEPARTMENT, count(WORKER_ID) as 'No.of worker' from Worker
group by DEPARTMENT
order by 'No.of worker' desc
-------------------------------------------------------------------------------------------------------------------------

--Q-24. Write an SQL query to print details of the Workers who are also Managers.
select w.FIRST_NAME ,t.WORKER_TITLE  from Worker w
inner join Title t
on t.WORKER_REF_ID = w.WORKER_ID
where t.WORKER_TITLE = 'Manager'
-------------------------------------------------------------------------------------------------------------------------------

--Q-25. Write an SQL query to fetch duplicate records having matching data in some fields of a table.
select WORKER_TITLE, AFFECTED_FROM , count(*)
from Title
group by WORKER_TITLE , AFFECTED_FROM
having count(*) > 1
-------------------------------------------------------------------------------------------------------------------------------

--Q-26. Write an SQL query to show only odd rows from a table.
SELECT * FROM Worker WHERE (WORKER_ID % 2) <> 0;
---------------------------------------------------------------------------------------------------------------------------------

--Q-27. Write an SQL query to show only even rows from a table.
SELECT * FROM Worker WHERE (WORKER_ID % 2) = 0;
---------------------------------------------------------------------------------------------------------------------------------

--Q-28. Write an SQL query to clone a new table from another table.

---------------------------------------------------------------------------------------------------------------------------------

--Q-29. Write an SQL query to fetch intersecting records of two tables.

-----------------------------------------------------------------------------------------------------------------------------------

--Q-30. Write an SQL query to show records from one table that another table does not have.

------------------------------------------------------------------------------------------------------------------------------------

--Q-31. Write an SQL query to show the current date and time.
select getdate()
---------------------------------------------------------------------------------------------------------------------------------	

--Q-32. Write an SQL query to show the top n (say 10) records of a table.
select top 10 * from Worker order by SALARY desc
--------------------------------------------------------------------------------------------------------------------------------

--Q-33. Write an SQL query to determine the nth (say n=5) highest salary from a table.

---------------------------------------------------------------------------------------------------------------------------------

--Q-34. Write an SQL query to determine the 5th highest salary without using the TOP or limit method.

---------------------------------------------------------------------------------------------------------------------------

--Q-35. Write an SQL query to fetch the list of employees with the same salary.
Select distinct W.WORKER_ID, W.FIRST_NAME, W.Salary 
from Worker W, Worker W1 
where W.Salary = W1.Salary 
and W.WORKER_ID != W1.WORKER_ID;
--------------------------------------------------------------------------------------------------------------------------------

--Q-36. Write an SQL query to show the second-highest salary from a table.
select * from Worker order by SALARY desc
offset 2 rows 
fetch next 1 row only
-------------------------------------------------------------------------------------------------------------------------

--Q-37. Write an SQL query to show one row twice in the results from a table.

---------------------------------------------------------------------------------------------------------------------------------

--Q-38. Write an SQL query to fetch intersecting records of two tables.

--------------------------------------------------------------------------------------------------------------------------

--Q-39. Write an SQL query to fetch the first 50% of records from a table.
select * from Worker
where WORKER_ID <= (select count(WORKER_ID) / 2 from Worker)
------------------------------------------------------------------------------------------------------------------------

--Q-40. Write an SQL query to fetch the departments that have less than five people in them.
select DEPARTMENT , count(WORKER_ID) as 'No of Worker' from Worker 
group by DEPARTMENT
having count(WORKER_ID) < 5
------------------------------------------------------------------------------------------------------------------------

--Q-41. Write an SQL query to show all departments along with the number of people in there.
select DEPARTMENT , count(*) from Worker
group by DEPARTMENT
--------------------------------------------------------------------------------------------------------------

--Q-42. Write an SQL query to show the last record from a table.
Select * from Worker where WORKER_ID = 
(SELECT max(WORKER_ID) from Worker)
--------------------------------------------------------------------------------------------------------------------------

--Q-43. Write an SQL query to fetch the first row of a table.
Select * from Worker where WORKER_ID =
(SELECT min(WORKER_ID) from Worker)
--------------------------------------------------------------------------------------------------------------------------------

--Q-44. Write an SQL query to fetch the last five records from a table.
select * from Worker  order by WORKER_ID desc
offset 5 rows
fetch next 3 rows only
-------------------------------------------------------------------------------------------------------------------------------

--Q-45. Write an SQL query to print the name of employees having the highest salary in each department.

---------------------------------------------------------------------------------------------------------------------------------------

--Q-46. Write an SQL query to fetch three max salaries from a table.
select top 3 * from Worker order by SALARY desc
----------------------------------------------------------------------------------------------------------------------------------

--Q-47. Write an SQL query to fetch three min salaries from a table.
select top 3 * from Worker order by SALARY Asc
-----------------------------------------------------------------------------------------------------------------------------

--Q-48. Write an SQL query to fetch nth max salaries from a table.

--------------------------------------------------------------------------------------------------------------------------

--Q-49. Write an SQL query to fetch departments along with the total salaries paid for each of them.
select DEPARTMENT , sum(SALARY) from Worker 
group  by DEPARTMENT
----------------------------------------------------------------------------------------------------------------------------------

--Q-50. Write an SQL query to fetch the names of workers who earn the highest salary.
select  FIRST_NAME , SALARY from Worker where SALARY = 
(select Max (SALARY) from Worker)
-------------------------------------------------------------------------------------------------------------------------------















