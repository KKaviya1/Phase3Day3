create database Exercise
use Exercise

--***Part 01***--

create table CompanyInfo(
CId int primary key,
CName nvarchar(50) not null
)

create table ProductInfo(
PId int primary key,
PName nvarchar(50) not null,
PPrice float,
PMDate  Date not null,
CId int foreign key references CompanyInfo
)

insert into CompanyInfo(CId,CName)values (1,'Samsung'),
(2,'HP'),
(3,'Apple'),
(4,'Dell'),
(5,'Toshiba'),
(6,'Redmi')

insert into ProductInfo(PId,PName,PPrice,PMDate,CId) values (101,'Laptop',55000.90,'12/12/2023',1),
(102,'Laptop',35000.90,'12/12/2012',2),
(103,'Mobile',15000.90,'12/03/2012',2),
(104,'Laptop',135000.90,'12/12/2012',3),
(105,'Mobile',65000.90,'12/12/2012',3),
(106,'Laptop',35000.90,'12/01/2012',5),
(107,'Mobile',35000.90,'12/01/2012',5),
(108,'Earpod',1000.90,'12/01/2022',3),
(109,'Laptop',85000.90,'12/12/2021',6),
(110,'Mobile',50000.70,'12/12/2020',1)


select C.CName as CompanyName,P.PId,P.PName as ProductName,P.PPrice,P.PMDate from CompanyInfo C join ProductInfo P on C.CId = P.CId

select P.PName as ProductName , C.CName as CompanyName from ProductInfo P join CompanyInfo C on 
P.CId = C.CId

select C.CName as CompanyName,P.PId, P.PName as ProductName ,P.PPrice,P.PMDate from CompanyInfo
C cross join ProductInfo P


--***Part 02***--

create table Products(PId int primary key,PQ int ,PPrice float,
Discount Decimal(6,2))

insert into Products(PId,PQ,PPrice,Discount) values
(100,5,2200.50,12.10),
(101,10,30000.90,20.30),
(102,15,76000.60,30.00)

select * from Products

create function fnDiscvalue(
@Price float ,
@Discount float
)
returns float
as 
begin
declare @DiscountedValue float;
set @DiscountedValue = @Price - (@Price * (@Discount/100.0))
return @DiscountedValue
end

select PId,PPrice Price,Discount,dbo.fnDiscvalue(PPrice,Discount) as 'Price After Discount' from Products