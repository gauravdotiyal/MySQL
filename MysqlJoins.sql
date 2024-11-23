-- Sql Learning Joins

create table project(
 id integer primary key,
 emp_id integer,
 name varchar(24),
 client_id integer
);
insert into project (id,emp_id,name,client_id) values
  (1,1,'A',3),
  (2,2,'B',1),
  (3,3,'C',5);

insert into project (id,emp_id,name,client_id) 
values(4,3,'D',2),
       (5,3,'C',4);

select * from project;

create table employee(
id integer primary key,
fname varchar(25),
lname varchar(24),
age integer,
email varchar(24),
phone integer,
city varchar(24)
);

insert into employee(id,fname,lname,age,email,phone,city) values
 (1,'aman','proto',21,'gmail.com',223,'Delhi'),
 (2,'Kaan','Naray',21,'gmail.com',223,'kio'),
 (3,'Ram','BD',21,'gmail.com',223,'Mumbai'),
 (4,'maran','Hermit',21,'gmail.com',223,'Dun'),
 (5,'ans','Pandy',21,'gmail.com',223,'UP');
 
select * from employee;

create table client(
id integer primary key ,
name varchar(23),
age integer,
email varchar(24),
phoneno integer,
city varchar(24),
emp_id integer
);

insert into client (id,name,age,email,phoneno,city,emp_id) values
(1,'Max',47,'hotmail.com',232,'Delhi',3),
(2,'Matx',47,'hotmail.com',232,'Delhi',3),
(3,'Rax',47,'hotmail.com',232,'Delhi',1),
(4,'simran',47,'hotmail.com',232,'Delhi',5),
(5,'RTax',47,'hotmail.com',232,'Delhi',2);


select * from client;


-- Inner Join 
-- Enlist all employee id name along with the project allocated to them
select e.id,e.fname,e.lname,p.id,
p.name from employee as e inner join project as p on e.id=p.emp_id;

-- using join without using join keyword
select e.id,e.fname,e.lname,p.id,p.name from employee as e, project as p where e.id=p.emp_id;

-- Fetch out all the employee ids and their contact details who have been 
-- working from mumbai with client name working in Delhi
select e.id,e.email,e.phone,c.name from employee as e inner join client as c on e.id=c.emp_id
where e.city='Mumbai' and c.city='Delhi';

-- Left join
-- Fetch out each project allocated to employee  
select * from employee as e 
left join project as p on e.id = p.emp_id;

-- Right join 
-- list out all the projects with the employee name and their respective email id
-- select * from project  as p right join employee as e on p.emp_id=e.id;
select p.id,p.name,e.fname,e.lname,	e.email from employee as e 
right join project as p 
on e.id=p.emp_id;

-- cross join
-- list out all the combination for the employee's name and project that can exist
select e.fname,e.lname,p.id,p.name from employee as e cross join project as p;
select p.id,p.name,e.fname,e.lname from project as p cross join employee as e;