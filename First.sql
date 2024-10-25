CREATE DATABASE ORG;
SHOW DATABASES;

USE ORG;

CREATE TABLE Worker(
WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
FIRST_NAME CHAR(25),
LAST_NAME CHAR(25),
SALARY INT(15),
JOINING_DATE DATETIME,
DEPARTMENT CHAR(25)
);

INSERT INTO Worker
(WORKER_ID, FIRST_NAME,LAST_NAME,SALARY,JOINING_DATE,DEPARTMENT) VALUES
(001,'Monika','Arora', 100000,'14-02-20 10.00.00','HR'),
(002,'Oonika','Arora', 80000,'14-02-21 10.00.00','Admin'),
(003,'Tnika','Aroa', 10000,'14-03-20 10.04.00','HR'),
(004,'Parsh','Arora', 50000,'14-05-20 10:06:00','Admin'),
(005,'Ara','Arora', 50000,'14-05-20 10:06:00','Account'),
(006,'Aksh','Arora', 50000,'14-05-20 10:02:00','Admin'),
(007,'Harosh','Pora', 40000,'14-05-20 10:00:00','Account'),	
(008,'Harsh','Arora', 50000,'14-05-20 10.09.00','Admin');


SELECT * FROM Worker;
 

CREATE TABLE Bonus(
  WORKER_REF_ID  INT,
  BONUS_AMOUNT INT(10),
  BONUS_DATE DATETIME,
  FOREIGN KEY (WORKER_REF_ID)
        REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE 
);

INSERT INTO Bonus 
    (WORKER_REF_ID,BONUS_AMOUNT,BONUS_DATE) VALUES
    (001,5000,'16-02-20'),
    (002,3000,'16-06-11'),
    (003,4000,'16-02-20'),
    (001,4500,'16-02-20'),
    (002,3500,'16-06-11');
    
SELECT * FROM Bonus;

CREATE TABLE Title(
  WORKER_REF_ID INT ,
  WORKER_TITLE CHAR(25),
  AFFECTED_FROM DATETIME,
       FOREIGN KEY (WORKER_REF_ID)
       REFERENCES Worker(WORKER_ID)
       ON DELETE CASCADE
);

INSERT INTO Title
   (WORKER_REF_ID ,WORKER_TITLE,AFFECTED_FROM) VALUES
   (001,'Manager', '2016-02-20 00:00:00'),
   (002,'Executive', '2016-06-11 00:00:00'),
   (008,'Executive', '2016-02-20 00:00:00'),
   (005,'Manager', '2016-02-20 00:00:00'),
   (004,'Asst. Manager', '2016-02-20 00:00:00'),
   (007,'Executive', '2016-02-20 00:00:00'),
   (006,'Lead', '2016-02-20 00:00:00'),
   (003,'Lead', '2016-02-20 00:00:00');
   
   
SELECT * FROM Title;

SELECT FIRST_NAME, SALARY FROM Worker;

SELECT now();

-- for executing or -- 
SELECT * FROM Worker WHERE DEPARTMENT IN ('HR','Admin');

SELECT * FROM Worker WHERE DEPARTMENT NOT IN ('HR','Admin');

-- WILDCARD   %a ends with a a% starts with a _a% second character with a 
SELECT * FROM Worker WHERE last_name LIKE '%a';
SELECT * FROM Worker WHERE first_name LIKE '_a%';

-- sorting using orderby
select * from Worker Order by salary asc;


-- distinct keyword
select distinct first_name from Worker;

-- group by
select department, count(*) from worker group by department;

-- average salary 
select department, avg(salary) from worker group by department;

-- min salary 
select department, min(salary) from worker group by department;
select department, max(salary) from worker group by department;

-- total salary per department
select department, sum(salary) from worker group by department;

-- group by having 
select department, count(department) from worker group by department having count(department)>2;

create database temp;

use temp;

-- ==============================================
-- = Understanding UNIQUE AND CHECK constraints =
-- ============================================== 

create table account(
  id int primary key,
  name varchar(255) unique,
  balance int,
  CONSTRAINT acc_balance_chk CHECK(balance>1000)
  );
  
insert into account
   (id,name,balance) values 
   (1,'A',10000);
   
insert into account 
  (id,name,balance) values
   (2,'B',100);
   
select * from account;

-- understanding default constraint
create table account(
  id int primary key,
  name varchar(255) unique,
  balance int not null default 0
  );

insert into account 
   (id,name) values
     (1,'A');

insert into account 
   (id,name) values
     (2,'B');

select * from account;
 


-- ==============================================
--     ALTER COMMANDS TO ALTER TABLE IN DB     
-- ==============================================  
 
-- add new coloumn
alter table account add interest float not null default 0;

-- modify table data 
alter table account modify interest double not null default 0;

-- describing table it describe everything about table 
desc account;

-- change coloumn rename coloumn 
alter table account change column interest saving_interest float not null default 0;

-- drop column 
alter table account drop column saving_interest;

-- rename the  table name 
alter table account rename to account_details;

select * from account;






