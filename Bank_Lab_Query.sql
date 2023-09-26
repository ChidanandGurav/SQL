create database Bank1
use[Bank1]

-----------------------------------------------------------------------------------------------------------------------------------------
-- Table Name: Bank
----------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE Bank (
    bankid INT PRIMARY KEY,
    name VARCHAR(25),
    Address VARCHAR(25),
    city VARCHAR(25),
    state VARCHAR(25)
);

insert into bank(bankid,name,address,city,State)
            values(1,'Central Bank Of India','Vidhate Vasti','Aundh','Maharashtra'),
			       (2,'Bank of Maharashta','Shivaji Chowk','Shivaji Nagar','Maharashtra'),
				   (3,'Panjab National Bank','Ashok Nagar','Churu','Rajasthan'),
				   (4,'Bank of Badoda','Nil Kamal','Ahamdabad','Gujrat'),
				   (5,'State Bank of India','Bagathsingh Chowk','Amritsar','Panjab')

				   select * from Bank
------------------------------------------------------------------------------------------------------------------------------------------
-- Table Name:Customer
-----------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE Customer (
    cust_id INT PRIMARY KEY,
    bank_id INT,
    FOREIGN KEY (bank_id) REFERENCES Bank (bankid)
);
insert into Customer(cust_id,bank_id)
            values(101,1),
			       (102,2),
				   (103,2),
				   (104,3),
				   (105,2),
				   (106,5),
				   (107,4),
				   (108,3),
				   (109,3),
				   (110,1)
				   
				   select * from Customer
------------------------------------------------------------------------------------------------------------------------------------------
-- Table Name:Accounts
------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE Accounts (
    Acc_no INT PRIMARY KEY,
    cust_id INT,
    Acctype_id INT,
    Balance DECIMAL(10, 2), 
    FOREIGN KEY (cust_id) REFERENCES Customer (cust_id)
);
insert into Accounts(Acc_no,cust_id,AccType_id,Balance)
            values('12345',101,201,60000),
			      ('25364',102,203,10000),
				  ('34567',103,204,30000),
				  ('12343',104,205,15000),
				  ('64323',105,202,5000),
				  ('35567',106,201,6000),
				  ('65423',107,201,40000),
				  ('13564',108,202,6000),
				  ('14564',109,203,12000),
				  ('54322',110,204,23000),
				  ('44322',101,205,24000)

				  select * from Accounts

----------------------------------------------------------------------------------------------------------------------------------------
-- Table Name:Accounts
----------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE AccountType (
    acctype_id INT PRIMARY KEY,
    acctype VARCHAR(25)
);

insert into AccountType(AccType_id,AccType)
            Values(201,'Saving'),
			       (202,'Current'),
				    (203,'Salary Acc'),
					 (204,'NRI Acc'),
					  (205,'Fix Deposit')

					  select * from AccountType
------------------------------------------------------------------------------------------------------------------------------------------
-- Table Name:Transactions
------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE Transactions (
    transaction_id INT PRIMARY KEY,
    Acc_no INT,
	Cust_id int,
    amount DECIMAL(10, 2), -- Adjust the precision and scale as needed
    transaction_type varchar(10), -- 1 for debit, 2 for credit
    date DATE,
    FOREIGN KEY (Acc_no) REFERENCES Accounts (Acc_no),
	 FOREIGN KEY (Cust_id) REFERENCES Customer (Cust_id)
);
drop table Transactions

insert into Transactions(transaction_id,Acc_no,Cust_id,Amount,Transaction_type,date)
            Values(301,'12345',101,500,'Debit','2023-04-12'),
			       (302,'34567',103,10000,'Debit','2023-05-09'),
				   (303,'12345',101,5000,'Credit','2023-02-25'),
				   (304,'64323',105,1500,'Debit','2023-07-06'),
				   (305,'44322',101,3000,'Credit','2023-05-24'),
				   (306,'13564',108,7000,'Debit','2023-3-15'),
				   (307,'14564',109,15000,'Credit','2023-02-23'),
				   (308,'35567',106,25000,'Credit','2023-06-22'),
				   (309,'54322',110,1000,'Debit','2023-02-02'),
				   (310,'12345',101,9000,'Credit','2023-03-16')

				   select* from Transactions
----------------------------------------------------------------------------------------------------------------------------------------
-- Table Name:Customer_Master
----------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE Customer_Master (
    Cust_id INT,
    bank_id INT,
    cname VARCHAR(25),
    contact VARCHAR(25),
    age INT,
    pan_no VARCHAR(25),
    PRIMARY KEY (Cust_id, bank_id),
    FOREIGN KEY (Cust_id) REFERENCES Customer (cust_id),
    FOREIGN KEY (bank_id) REFERENCES Bank (bankid)
);

insert into  Customer_Master(Cust_id,bank_id,cname,contact,age,pan_no)
              values(101,1,'vishwanath',1223455,26,'AECPW1123E'),
			         (102,3,'Sagar',1223344,25,'BEhs677E'),
					 (103,2,'Reshma',8477499,35,'AE234123E'),
					 (104,4,'vaibhav',1223455,26,'AECPW333')
 
 -----------------------------------------------------------------------------------------------------------------------------------------
 select * from Bank
 select * from Customer
 select * from Accounts
 select * from Transactions
 select * from AccountType
 select * from Customer_Master


 -- Queries
 --------------------------------------------------------------------------------------------------------------------------------------------
-- 1. Find the number of accounts in the saving account.
SELECT COUNT(*) AS num_saving_accounts
FROM Accounts
WHERE Acctype_id = (SELECT acctype_id FROM AccountType WHERE acctype = 'saving')
-----------------------------------------------------------------------------------------------------------------------------------------------
-- 2. Display all bank names, customer names, and cities in ascending order of bank name and descending order of city name.
SELECT B.name AS bank_name, CM.cname AS customer_name, B.city
FROM Bank B
JOIN Customer C ON B.bankid = C.bank_id
JOIN Customer_Master CM ON C.cust_id = CM.Cust_id
ORDER BY B.name ASC, B.city DESC;
-----------------------------------------------------------------------------------------------------------------------------------------------
-- 3. Find the customer who has performed the maximum number of transactions.
SELECT top 1 C.cust_id, CM.cname AS customer_name, COUNT(T.transaction_id) AS num_transactions
FROM Customer C
JOIN Transactions T ON C.cust_id = T.Cust_id
JOIN Customer_Master CM ON C.cust_id = CM.Cust_id
GROUP BY C.cust_id, CM.cname
ORDER BY num_transactions DESC

-------------------------------------------------------------------------------------------------------------------------------------------------
-- 4. Find the customers whose balance is greater than the average balance of saving accounts.
SELECT CM.cust_id, CM.cname AS customer_name, A.Balance
FROM Customer C
JOIN Customer_Master CM ON C.cust_id = CM.Cust_id
JOIN Accounts A ON C.cust_id = A.cust_id
WHERE A.Acctype_id = (SELECT acctype_id FROM AccountType WHERE acctype = 'saving')
  AND A.Balance > (SELECT AVG(Balance) FROM Accounts WHERE Acctype_id = (SELECT acctype_id FROM AccountType WHERE acctype = 'saving'))
---------------------------------------------------------------------------------------------------------------------------------------------------
-- 5. Find the amount and name of the customer whose Acc_no is 12345.
SELECT CM.cname AS customer_name, T.amount
FROM Transactions T
JOIN Accounts A ON T.Acc_no = A.Acc_no
JOIN Customer C ON A.cust_id = C.cust_id
JOIN Customer_Master CM ON C.cust_id = CM.Cust_id
WHERE T.Acc_no = 12345
----------------------------------------------------------------------------------------------------------------------------------------------------
-- 6. Display the customer name and contact of customers whose account type is 'saving' ordered by descending order of customer name.
SELECT CM.cname AS customer_name, CM.contact
FROM Customer C
JOIN Accounts A ON C.cust_id = A.cust_id
JOIN Customer_Master CM ON C.cust_id = CM.Cust_id
WHERE A.Acctype_id = (SELECT acctype_id FROM AccountType WHERE acctype = 'saving')
ORDER BY CM.cname DESC
-----------------------------------------------------------------------------------------------------------------------------------------------------
-- 7. Display bank name and the total balance of all customers in that bank for all banks in descending order of balance.
select B.name AS bank_name, SUM(A.Balance) AS total_balance
FROM Bank B
JOIN Customer C ON B.bankid = C.bank_id
JOIN Accounts A ON C.cust_id = A.cust_id
GROUP BY B.name
ORDER BY total_balance DESC

------------------------------------------------------------------------------------------------------------------------------------------------------