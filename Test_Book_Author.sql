
-------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE Author (
    id INT PRIMARY KEY,
    name VARCHAR(30),
    birth_year INT,
    death_year INT
)

 insert into Author values
                (1,'Marcella Cole',1983,null),
				 (2,'Lisa Mullins',1891,1950),
				  (3,'Dennis Stokes',1935,1994),
				   (4,'Randolph Vasquez',1957,2004),
				    (5,'Daniel Branson',1965,1990)

					select * from Author
----------------------------------------------------------------------------------------------------------------------------------------------

-- Create table 2: Book
CREATE TABLE Book (
    id INT PRIMARY KEY,
    author_id INT,
    title VARCHAR(25),
    publish_year INT,
    publishing_house VARCHAR(25),
    rating DECIMAL(3, 2)
);

insert into Book values
                 (1,null,'Souless girl',2008,'Golden Albertors',4.3),
				 (2,null,'Weak Heart',1980,'Dimond Inc',3.8),
				 (3,4,'Faith of light',1995,'white Cloud Press',4.3),
				 (4,null,'Memory Of Hope',2000,'Rutis Enterprises',2.7),
				 (5,6,'Worrier of wind',2005,'Maverick',4.6)
                       
                select* from Book
-------------------------------------------------------------------------------------------------------------------------------------------------
-- Create table 3: Adaptation
CREATE TABLE Adaptation (
    book_id INT PRIMARY KEY,
    type VARCHAR(255),
    title VARCHAR(255),
    release_year INT,
    rating DECIMAL(3, 2)
);

insert into Adaptation values
           (1,'Movie','Gone with the wovels the begining',2008,3),
		    (3,'Movie','Companions of Tomorrow',2001,4.2),
			 (5,'Movie','Homeless Warrior',2008,4),
			  (2,'Movie','Blacksmith with silver',2014,4.3),
			   (4,'Movie','Patrons and beares',2004,3.2)
			   select * from Adaptation
----------------------------------------------------------------------------------------------------------------------------------------------
-- Create table 4: Book_review
CREATE TABLE Book_review (
    book_id INT,
    review TEXT,
    author VARCHAR(255)
);

insert into Book_review values(1,'An incredible book','sylvia jones'),
                               (1,'Greate although it has some flaws','Jessica Parker'),
							   (2,'Dennis Stockes Takes the reader for a ride full of emotions','Thomas grees'),
							   (3,'Incredible craftsmanship  of the author','Martin freeman'),
							   (4,'Not the best book by this author','jude falth'),
							   (5,'Claudia johnson at her best','joe Marqiz'),
							   (6,'I cannot recall more Captivating plot','Alexader Durham')

							   select * from Book_review
--=================================================================================================================

-- Q1. List All Books and Their Authors

SELECT name,title, publish_year
FROM author
JOIN book
  ON author.id = book.author_id;
--==================================================================================================================

-- Q2. List Authors and Books Published After 2005

SELECT
  name,
  title,
  publish_year
FROM author
JOIN book
  ON author.id = book.author_id
WHERE publish_year > 2005;
--==================================================================================================================
-- Q3. Show Books Adapted Within 4 Years and Rated Lower Than the Adaptation

SELECT
  book.title AS book_title,
  adaptation.title AS adaptation_title,
  book.publish_year,
  adaptation.release_year
FROM book
JOIN adaptation
  ON book.id = adaptation.book_id
WHERE adaptation.release_year - book.publish_year <= 4
  AND book.rating < adaptation.rating;
--====================================================================================================================

-- Q4. Show All Books and Their Adaptations (If Any)

SELECT
  book.title,
  adaptation.title,
  adaptation.release_year
FROM book
LEFT JOIN adaptation
  ON book.id = adaptation.book_id;
--=====================================================================================================================

-- Q5. Show All Books with Their Reviews (If Any)

SELECT
  book.title,
  book_review.review,
  book_review.author
FROM book_review
RIGHT JOIN book
  ON book.id = book_review.book_id;
--=====================================================================================================================


