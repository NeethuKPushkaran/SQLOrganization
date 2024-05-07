CREATE DATABASE ORGANIZATION;
--SHOW DATABASES;
USE ORGANIZATION;

CREATE TABLE Worker(
	WORKER_ID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	FIRST_NAME CHAR(20),
	LAST_NAME CHAR(20),
	SALARY INT,
	JOINING_DATE DATETIME,
	DEPARTMENT CHAR(20)
);

INSERT INTO Worker (FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT)
VALUES
	('Monika', 'Arora', 100000, '2014-02-20 09:00:00', 'HR'),
	('Niharika', 'Verma', 80000, '2014-06-11 09:00:00', 'Admin'),
	('Vishal', 'Singhal', 300000, '2014-02-20 09:00:00', 'HR'),
	('Amitabh', 'Singh', 500000, '2014-02-20 09:00:00', 'Admin'),
	('Vivek', 'Bhati', 500000, '2014-06-11 09:00:00', 'Admin'),
	('Vipul', 'Diwan', 200000, '2014-01-20 09:00:00', 'Account'),
	('Satish', 'Kumar', 75000, '2014-01-20 09:00:00', 'Account'),
	('Geetika', 'Chowhan', 90000, '2014-04-11 09:00:00', 'Admin');


SELECT * FROM Worker;
DROP TABLE Worker;

CREATE TABLE Bonus(
	WORKER_REF_ID INT,
	BONUS_DATE DATETIME,
	BONUS_AMOUNT INT,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
	ON DELETE CASCADE
);

INSERT INTO Bonus (WORKER_REF_ID, BONUS_DATE, BONUS_AMOUNT)
VALUES
	(1, '2016-02-20 00:00:00', 5000),
	(2, '2016-06-11 00:00:00', 3000),
	(3, '2016-02-20 00:00:00', 4000),
	(1, '2016-02-20 00:00:00', 4500),
	(2, '2016-06-11 00:00:00', 3500);

SELECT * FROM Bonus;
DROP TABLE Bonus;

CREATE TABLE Title(
	WORKER_REF_ID INT,
	WORKER_TITLE CHAR(20),
	AFFECTED_FROM DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
	ON DELETE CASCADE
);

INSERT INTO Title(WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM)
VALUES
	(1, 'Manager', '2016-02-20 00:00:00'),
	(2, 'Executive', '2016-06-11 00:00:00'),
	(8, 'Executive', '2016-06-11 00:00:00'),
	(5, 'Manager', '2016-06-11 00:00:00'),
	(4, 'Asst. Manager', '2016-06-11 00:00:00'),
	(7, 'Executive', '2016-06-11 00:00:00'),
	(6, 'Lead', '2016-06-11 00:00:00'),
	(3, 'Lead', '2016-06-11 00:00:00');

SELECT * FROM Title;
DROP TABLE Title;

SELECT * FROM Worker;

--Q1 - query to fetch FIRST_NAME from Worker table using the alias name as WORKER_NAME

SELECT FIRST_NAME AS WORKER_NAME
FROM Worker;

--Q2 - query to fetch FIRST_NAME from Worker table in upper case

SELECT UPPER(FIRST_NAME) AS UPPERCASE_FIRST_NAME
FROM Worker;

--Q3 - query to fetch unique values of DEPARTMENT from Worker table

SELECT DISTINCT DEPARTMENT
FROM Worker;

--Q4 - query to print the first three characters of  FIRST_NAME from Worker table

SELECT LEFT(FIRST_NAME, 3) AS First_ThreeLetters
FROM Worker;

--Q5 - query to find the position of the alphabet (a) in the first name column "Amitabh" from Worker table.

SELECT CHARINDEX('a', 'Amitabh') AS First_position_of_a

--Q6 - query to print the FIRST_NAME from Worker table after removing white spaces from the right side

SELECT RTRIM(FIRST_NAME) as No_WhiteSpaceName
FROM Worker;

--Q7 - query to print the DEPARTMENT from Worker table after removing white spaces from the left side.

SELECT LTRIM(DEPARTMENT) AS No_LeftWhiteSpace
FROM Worker;

--Q8 - query that fetches the unique values of DEPARTMENT from Worker table and prints its length

SELECT DISTINCT DEPARTMENT AS UNIQUE_DEPARTMENT,
LEN(DEPARTMENT) AS DEPARTMENT_LENGTH	
FROM Worker;

--Q9 - Write an SQL query to print the FIRST_NAME from Worker table after replacing 'a' with 'A' 

SELECT REPLACE(FIRST_NAME, 'a', 'A') AS Replaced_name
FROM Worker;

--Q10 - Write an SQL query to print the FIRST_NAME and LAST_NAME from Worker table into a single column COMPLETE_NAME. A space char should separate them

SELECT CONCAT(FIRST_NAME, ' ', LAST_NAME) AS COMPLETE_NAME
FROM Worker;

--Q-11 - Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending. 

SELECT *
FROM Worker
ORDER BY FIRST_NAME ASC;

--Q-12 - Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending and DEPARTMENT Descending

SELECT *
FROM Worker
ORDER BY FIRST_NAME ASC, DEPARTMENT DESC;

SELECT *
FROM Worker
ORDER BY DEPARTMENT DESC;

--Q-13 - Write an SQL query to print details for Workers with the first name as "Vipul" and "Satish" from Worker table. 

SELECT *
FROM Worker
WHERE FIRST_NAME = 'Vipul' or FIRST_NAME = 'Satish';
--WHERE FIRST_NAME IN('Vipul', 'Satish');

--Q-14. Write an SQL query to print details of workers excluding first names, "Vipul" and "Satish" from Worker table.

SELECT *
FROM Worker
WHERE FIRST_NAME NOT IN ('Vipul', 'Satish');

--Q-15. Write an SQL query to print details of Workers with DEPARTMENT name as "Admin"

SELECT *
FROM Worker
WHERE DEPARTMENT = 'Admin';

--Q-16. Write an SQL query to print details of the Workers whose FIRST_NAME contains 'a'. 

SELECT *
FROM Worker
WHERE FIRST_NAME LIKE '%a%';

--Q-17. Write an SQL query to print details of the Workers whose FIRST_NAME ends with 'a'. 

SELECT *
FROM Worker
WHERE FIRST_NAME LIKE '%a';

--Q-18. Write an SQL query to print details of the Workers whose FIRST_NAME ends with 'h' and contains six alphabets.

SELECT *
FROM Worker
WHERE FIRST_NAME LIKE '_____h';

--Q-19. Write an SQL query to print details of the Workers whose SALARY lies between 100000 and 500000.

SELECT *
FROM Worker
WHERE SALARY BETWEEN 100000 AND 500000;

--Q-20. Write an SQL query to print details of the Workers who have joined in Feb 2014.

SELECT *
FROM Worker
WHERE MONTH(JOINING_DATE) = 2 AND YEAR(JOINING_DATE) = 2014;

--Q-21. Write an SQL query to fetch the count of employees working in the department 'Admin'.

SELECT COUNT(*) AS EMPLOYEE_COUNT
FROM Worker
WHERE DEPARTMENT = 'Admin';

--Q-22. Write an SQL query to fetch worker names with salaries >= 50000 and <= 100000.

SELECT FIRST_NAME, LAST_NAME
FROM Worker
WHERE SALARY >= 50000 AND SALARY <= 100000;

--Q-23. Write an SQL query to fetch the no. of workers for each department in the descending order. 

SELECT DEPARTMENT, COUNT(*) AS DEPARTMENT_COUNT
FROM Worker
GROUP BY DEPARTMENT
ORDER BY DEPARTMENT_COUNT DESC;

--Q-24. Write an SQL query to print details of the Workers who are also Managers.

SELECT *
FROM Worker W
INNER JOIN Title T ON W.WORKER_ID = T.WORKER_REF_ID
WHERE T.WORKER_TITLE = 'Manager';

--Q-25. Write an SQL query to fetch duplicate records having matching data in some fields of a table.

SELECT JOINING_DATE, DEPARTMENT, COUNT(*) AS DUPLICATION
FROM Worker
GROUP BY JOINING_DATE, DEPARTMENT
HAVING COUNT(*) > 1;

--Q-26. Write an SQL query to show only odd rows from a table.

SELECT *
FROM Worker
WHERE (WORKER_ID % 2) != 0;

--Q-27. Write an SQL query to show only even rows from a table. 

SELECT *
FROM Worker
WHERE (WORKER_ID % 2) = 0;

--Q-28. Write an SQL query to clone a new table from another table.



--Q-29. Write an SQL query to fetch intersecting records of two tables.

SELECT Worker.FIRST_NAME, Worker.LAST_NAME, Worker.SALARY, Worker.DEPARTMENT, Bonus.BONUS_AMOUNT
FROM Worker
INNER JOIN Bonus
ON Worker.WORKER_ID = Bonus.WORKER_REF_ID;


--Q-30. Write an SQL query to show records from one table that another table does not have.

SELECT *
FROM Worker W
LEFT JOIN Bonus B ON W.WORKER_ID = B.WORKER_REF_ID
WHERE B.WORKER_REF_ID = NULL;

--Q-31. Write an SQL query to show the current date and time.

SELECT (GETDATE());

--Q-32. Write an SQL query to show the top n (say 10) records of a table.

SELECT TOP (2) *
FROM Worker;

--Q-33. Write an SQL query to determine the nth (say n=5) highest salary from a table.

SELECT *
FROM (
  SELECT salary, ROW_NUMBER() OVER (ORDER BY salary DESC) AS row_num
  FROM Worker
) AS ranked_salaries
WHERE row_num = 5;


--Q-34. Write an SQL query to determine the 5th highest salary without using TOP or limit method.

SELECT *
FROM (
  SELECT salary, ROW_NUMBER() OVER (ORDER BY salary DESC) AS row_num
  FROM Worker
) AS ranked_salaries
WHERE row_num = 5;

--Q-35. Write an SQL query to fetch the list of employees with the same salary.


--Q-36. Write an SQL query to show the second highest salary from a table.


--Q-37. Write an SQL query to show one row twice in results from a table.


--Q-38. Write an SQL query to fetch intersecting records of two tables.


--Q-39. Write an SQL query to fetch the first 50% records from a table.


--Q-40. Write an SQL query to fetch the departments that have less than five people in it.




--Q-41. Write an SQL query to show all departments along with the number of people in there.


--Q-42. Write an SQL query to show the last record from a table.


--Q-43. Write an SQL query to fetch the first row of a table.


--Q-44. Write an SQL query to fetch the last five records from a table.


--Q-45. Write an SQL query to print the name of employees having the highest salary in each department.


--Q-46. Write an SQL query to fetch three max salaries from a table.


--Q-47. Write an SQL query to fetch three min salaries from a table.


--Q-48. Write an SQL query to fetch nth max salaries from a table.


--Q-49. Write an SQL query to fetch departments along with the total salaries paid for each of them.


--Q-50. Write an SQL query to fetch the names of workers who earn the highest salary.

