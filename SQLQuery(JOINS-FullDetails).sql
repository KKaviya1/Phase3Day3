create database joins
use joins

create table Depts
(DId int primary key,
DName nvarchar(50) not null unique)

insert into Depts values (1,'App-Development'),
(2,'Web-Development'),
(3,'HR'),
(4,'Account'),
(5,'Agile-Scrum')

select * from Depts order by DId

create table Emps
(Id int primary key,
Fname nvarchar(50) not null,
Lname nvarchar(50) not null,
Designation nvarchar(50),
Salary float,
DId int)

insert into Emps values (1,'Preethi','Shankar','Developer',63000.20,2)
insert into Emps values (2,'Sakthi','Priya','Developer',53000.20,1)
insert into Emps values (3,'Priya','Shankar','Developer',23000.20,2)

insert into Emps(Id,Fname,Lname,Salary) values (5,'Hari','Doss',53200.20)
insert into Emps values (12,'Keerthi','Vasan','Developer',36000.20,2)
insert into Emps(Id,Fname,Lname,Designation,Salary) values (5,'Hari','Doss','Manager',53200.20)
insert into Emps values (15,'Ganesh','Kumar','HR',69000.20,2)

select * from Emps
select * from Depts

-------------------------------------------------------------------
--join
--inner join
--outer join: left outer,right outer,full outer
--self join
--cross join
-- select tableName1.ColumnName, table2.column Name......... from table1 join table2 on table1.commonColumn= table2.commoncolumn

select * from Emps join Depts on Emps.DId=depts.DId
--or
select * from Emps e join Depts d on e.DId=d.DId

select e.Fname,d.DName from Emps e join Depts d on e.DId=d.DId

--Alter the title or topic of the  table name
select e.Id,e.Fname+'' +e.Lname 'full Name', d.DName 'Departments', d.DId,e.salary,e.Designation from emps e join Depts d on e.DId=d.Did

------------------------------------------------
use joins
select * from Emps order by Id
select * from Depts order by DId

--outer join: left outer,right outer,full outer
--left outer join

select e.Id, e.Fname,e.Lname,d.DId, e.Salary, e.Designation,d.DName 'Department' from Emps e left outer join Depts d on e.DId=d.DId

--right outer join
select e.Id, e.Fname,e.Lname,d.DId, e.Salary, e.Designation,d.DName 'Department' from Emps e right outer join Depts d on e.DId=d.DId

--Full outer join
select e.Id, e.Fname,e.Lname,d.DId, e.Salary, e.Designation,d.DName 'Department' from Emps e full outer join Depts d on e.DId=d.DId

--Cross Join
Create Table Sizes
(SId int Primary Key,
Size nvarchar(50) not null unique)

Create Table Colors
(CId int Primary Key,
Color nvarchar(50) not null unique)

Insert into sizes values(1,'short'),(2,'Medium'),(3,'Large')
Insert into Colors Values(1,'Blue'),(2,'Green'),(3,'White'),(4,'Pink')

select Color,Size from sizes cross join colors


--Self Join

Create Table Employee (Id int Primary Key,
Fname nvarchar(50) not null,
Lname nvarchar(50) not null,
ManagerId int)

Insert into Employee(Id,Fname,Lname) values (1,'Sam','Dicosta')
Insert into Employee(Id,Fname,Lname) values (5,'Raj','M')
Insert into Employee(Id,Fname,Lname) values (2,'Mukesh','K')
Insert into Employee values (3,'Niraj','Kumar',1)
Insert into Employee values (4,'Varun','Sharma',5)
Insert into Employee values (6,'Vipinn','Singh',1)
Insert into Employee values (8,'Gagan','Kumar',2)
Insert into Employee values (9,'Gaurav','Kumar',2)
Insert into Employee values (10,'Rohit','V',1)

Select e.Id,e.Fname+' '+e.Lname 'Employee Name',e1.Fname+' '+e1.Lname 'Manager Name'
From Employee e 
Join Employee e1
on e.ManagerId=e1.Id
Select * from Employee e1 Join Employee e2 on e1.ManagerId=e2.Id

Select e1.Fname+' '+e1.Lname 'EmployeeName',e2.Fname+' '+e2.Lname as 'Manager Name'
From Employee e1
Join Employee e2
on e1.ManagerId=e2.Id order by e1.ManagerId

--build in function
--Aggregate Function
Select * from Emps
Select Sum(Salary) as 'Total Salary' from Emps
Select Avg(Salary) as 'Average Salary' From Emps
Select Max(Salary) as 'Maximum Salary' From Emps
Select Min(Salary) as 'Minimum Salary' From Emps

--string
select upper('India')
select lower('InDiA')
select left('India',2)
select right('India',3)
select ltrim('		India			')
select rtrim('			India          ')
select trim('	India  ')
select upper (fname), upper(lname) from Employee

--find out initial of employee from employee table
--inital sam Dicosta:-> S.D

select  upper (left(fname,1)) + '.' + upper(left(lname,1)) from Employee

-----------------------------------------------------------------------------------
create function BonusCalc
(@sal float)
returns float
as
begin 
return (select @sal*0.15)
end 
select dbo.BonusCalc(50000)

select Fname,Lname,Salary,dbo.BonusCalc(Salary) as 'Bonus' From Employee
