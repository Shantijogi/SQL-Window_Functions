Create database Practice_sql;
use practice_sql;
drop table employee;

Create table EMPLOYEE (
EMPLOYEE_ID int, 
NAME VARCHAR(20), 
SALARY int);

INSERT INTO EMPLOYEE(EMPLOYEE_ID,NAME,SALARY) VALUES(100,'Jennifer',4400);
INSERT INTO EMPLOYEE(EMPLOYEE_ID,NAME,SALARY) VALUES(100,'Jennifer',4400);
INSERT INTO EMPLOYEE(EMPLOYEE_ID,NAME,SALARY) VALUES(101,'Michael',13000);
INSERT INTO EMPLOYEE(EMPLOYEE_ID,NAME,SALARY) VALUES(101,'Michael',13000);
INSERT INTO EMPLOYEE(EMPLOYEE_ID,NAME,SALARY) VALUES(101,'Michael',13000);
INSERT INTO EMPLOYEE(EMPLOYEE_ID,NAME,SALARY) VALUES(102,'Pat',6000);
INSERT INTO EMPLOYEE(EMPLOYEE_ID,NAME,SALARY) VALUES(102,'Pat',6000);
INSERT INTO EMPLOYEE(EMPLOYEE_ID,NAME,SALARY) VALUES(103,'Den',11000);

Select * From employee;
----------------------------------------------------------------------------------
# 1. How to select UNIQUE records from a table using a SQL Query?

# Method - 1
select employee_id, name, salary from employee
group by employee_id, name, salary;
-----------------------------------------------------------------------------------
# Method - 2

select employee_id, name, salary, row_number() Over(order by employee_id) from employee
Group by employee_id, name, salary;
-----------------------------------------------------
select employee_id, name, salary 
from (
	select employee_id, name, salary, 
	row_number() Over(partition by employee_id, name, salary order by employee_id) as row_num from employee) as rnum
where row_num=1;
-----------------------------------------------------------
with row_num as ( SELECT 
 EMPLOYEE_ID, 
 NAME, 
 SALARY, 
 ROW_NUMBER() OVER(PARTITION BY EMPLOYEE_ID,NAME,SALARY ORDER BY 
EMPLOYEE_ID) rnum
 FROM EMPLOYEE)
select EMPLOYEE_ID, NAME, SALARY
from row_num WHERE RNUM = 1;
-------------------------------------------------------------------------
alter table employee add rowid int auto_increment unique;

select * from employee;
--------------------------------------------------------------------------
## 2. How to delete DUPLICATE records from a table using a SQL Query?

delete from employee where rowid in (select rowid from (select *, row_number() over(partition by employee_id,name, salary order by employee_id) as rn
from  employee) as temp 
where rn >1
);
select * from employee;
select count(*) from employee;
----------------------------------------------------------------------
CREATE TABLE Departments(
 Department_ID int,
 Department_Name varchar(50)
);
INSERT INTO DEPARTMENTS VALUES('10','Administration');
INSERT INTO DEPARTMENTS VALUES('20','Marketing');
INSERT INTO DEPARTMENTS VALUES('30','Purchasing');
INSERT INTO DEPARTMENTS VALUES('40','Human Resources');
INSERT INTO DEPARTMENTS VALUES('50','Shipping');
INSERT INTO DEPARTMENTS VALUES('60','IT');
INSERT INTO DEPARTMENTS VALUES('70','Public Relations');
INSERT INTO DEPARTMENTS VALUES('80','Sales');
---------------------------------------------------------------------------------

###3. How to read first 5 records from a table using a SQL query?
SELECT * FROM departments 
ORDER BY department_id ASC 
LIMIT 5;
--------------------------------------------------------------------
## 4. how to read LAST 5 records from a table using a SQL query?
SELECT * FROM departments 
ORDER BY department_id DESC 
LIMIT 5;
----------------------------------------------------------------------
CREATE TABLE Employees(
EMPLOYEE_ID int, 
NAME VARCHAR(20), 
SALARY int
 );
 
INSERT INTO EMPLOYEES(EMPLOYEE_ID,NAME,SALARY) VALUES(100,'Jennifer',4400);
INSERT INTO EMPLOYEES(EMPLOYEE_ID,NAME,SALARY) VALUES(101,'Michael',13000);
INSERT INTO EMPLOYEES(EMPLOYEE_ID,NAME,SALARY) VALUES(102,'Pat',6000);
INSERT INTO EMPLOYEES(EMPLOYEE_ID,NAME,SALARY) VALUES(103,'Den', 11000);
INSERT INTO EMPLOYEES(EMPLOYEE_ID,NAME,SALARY) VALUES(104,'Alexander',3100);
INSERT INTO EMPLOYEES(EMPLOYEE_ID,NAME,SALARY) VALUES(105,'Shelli',2900);
INSERT INTO EMPLOYEES(EMPLOYEE_ID,NAME,SALARY) VALUES(106,'Sigal',2800);
INSERT INTO EMPLOYEES(EMPLOYEE_ID,NAME,SALARY) VALUES(107,'Guy',2600);
INSERT INTO EMPLOYEES(EMPLOYEE_ID,NAME,SALARY) VALUES(108,'Karen',2500);
-----------------------------------------------------------------------------
## 5. How to find the employee with second MAX Salary using a SQL Query?

select * from employees
order by salary desc
limit 1 offset 1;
-----------------------------
select * from employees
where salary < (select max(salary) from employees) 
order by salary desc limit 1;
-----------------------------
select * from (select *, 
		dense_rank() over(order by salary desc)as rnk
from employees) as temp
where rnk = 2;
-----------------------------------
##6. How to find the employee with third MAX Salary using a SQL query without using Analytic Functions?
select * from employees
order by salary desc
limit 1 offset 2;
------------------
select * from (select *, 
		dense_rank() over(order by salary desc)as rnk
from employees) as temp
where rnk = 3;






