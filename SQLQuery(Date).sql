create database Customer
use Customer

create table Customer
(Id int primary key,
Name nvarchar(50) not null,
ODLimit float not null,
SStartDate date not null,
SEndDate date not null)


insert into Customer values (1,'sam', 59800,'12/12/2019','12/12/2024')
insert into Customer values (2,'raj', 67800,'02/20/2022','12/12/2025')
insert into Customer values (3,'ravi', 88800,'01/23/2023','12/12/2025')

--Date function

select GETDATE()
select DATEPART(day,GETDATE())
select DATEPART(month,getDate())
select DATEPART(year, getDate())
select DATEDIFF(year,'12/12/2000',getDate())
select DATEPART(month,SStartDate) from Customer
select DATEPART(month,SEndDate) as 'End Month', DatePart(year,SEndDate)  as 'End Year' from Customer

--create schemaName.function FunctionName

--(
--parametres)
--returns returnType
--as
--begin
--function Body
--end

create function fnFullName
(
@fn nvarchar(50),
@ln nvarchar(50)
)
returns nvarchar(101)
as
begin --{
return (select @fn + ' ' + @ln)
end --}

select dbo.fnFullName ('Raj', 'Kumar') as 'Full Name'

select Fname,Lname, dbo.fnFullName (fname,lname) as 'Full Employee Name' From Emps

--------------------------------------------------------------------------------------
create function BonusCalc
(@salfloat)
returns float
as
begin 
return (select @sal*0.15)
end 
select dbo.BonusCalc(50000)

select Fname,Lname,Salary,dbo.BonusCalc(Salary) as 'Bonus' From Employee

--create schema schemaName
create table Products
(PId int primary key,
PName nvarchar(50) not null,
Pprice float)

create schema Samsung

create table  Samsung.Products
(PId int primary key,
PName nvarchar(50) not null,
Pprice float)

insert into Samsung.Products values(1,'ac',42000)

create schema lg

create table lg.Products
(PId int primary key,
PName nvarchar(50) not null,
Pprice float)

insert into lg.Products values(1,'Washing Machine',23000)
insert into lg.Products values(2,'TV',45000)
insert into lg.Products values(10,'Mobile',34000)

create function lg.fnTax
(
@price float)
returns float
as
begin 
declare @tax float;
if(@price>=25000)
begin
select @tax = @price*0.18
end 
else
begin
select @tax = @price*0.10
end
return @tax;
end
select lg.fnTax(42000) as 'Tax'

select PId, PName,Pprice,lg.fnTax(PPrice) as 'GST' from lg.Products

select PId, PName,Pprice,lg.fnTax(PPrice) as 'GST' from Samsung.Products

-----------------------------------------------------------------------------------------------
drop table Products

create table Products
(PId int primary key,
PName nvarchar(50) not null,
Pprice float,
PCategory nvarchar (50) not null check (PCategory in('Clothing', 'Grooming' , 'Electronics', 'Other')))

insert into Products values (1,'Facewash',230,'Grooming')
insert into Products values (2,'TV',45000,'Electronic')
insert into Products values (12,'TV',34000,'Electronic')
insert into Products values (5,'Face cream',320,'Grooming')

select * from Products

select sum(Pprice) as 'Total Products Values' from Products
select sum(Pprice) as 'Sub Total',PCategory from Products group by PCategory