# MySQL_Basics

# MySQL

  

### Create database

  

```
create database SQL_Practice;
```
----

###  Create table

```
create table Students( ID int, Name varchar(20), Marks double, Course varchar(20), Fees int);
```

### Insert values
```
insert into Students values(101,'John',84,'BCom',25000);
```

### Show every column
```
select * from Students where ID in(101,105);
```

### Printing rows for specific range entered
```
select * from Students where ID between 103 and 107;
```

### Distinct (Does not include duplicate values shows only one copy of that value)
```
select distinct Name, Marks from Students;
```
### Alias (makes alias for our selected column,table for a short time)
```
select ID as StudentID from Students;
```

### Creating customers tables
```
create table Customers(CustomerID int, CustomerName varchar(20), City varchar(20), PinCode int, County varchar(20));
```

### Desc (Descritption of scehma)
```
desc Customers;
```
### Change column name
```
alter table Customers change County Country varchar(20);
```

### Concat
```
select CustomerID, CustomerName, concat(City, PinCode, Country) as Full_Add from Customers;
```

### Copy another table while creating new table
```
create table Customers2(select * from Customers);
```

### Creating orders table
```
create table Orders(OrderID int, OrderDate varchar(20), CustomerID int);
```

### Update values
```
update Orders set CustomerID= 116 where OrderID = 54566;
```

## JOINS

### INNER JOIN (Only prints the common CustomerID from both the tables)

```
select * from Customers inner join Orders where Customers.CustomerID=Orders.CustomerID;

OR

select * from Customers inner join Orders on Customers.CustomerID=Orders.CustomerID;
```
### Left Join(The LEFT JOIN keyword returns all records from the left table (table1), and the matched records from the right table (table2). The result is NULL from the right side, if there is no match.)
```
select * from Customers left join Orders on Customers.CustomerID= Orders.CustomerID;
```

### Right join(The RIGHT JOIN keyword returns all records from the right table (table2), and the matched records from the left table (table1). The result is NULL from the left side, when there is no match.)
```
select * from Customers right join Orders on Customers.CustomerID = Orders.CustomerID;
```

### Cross join
```
select * from Customers cross join Orders;
```
### Create table employees
```
create table Employees(EmpID int, EmpName varchar(20));
```
### insert multiple values in table
```
insert into Employees values(101, 'Dave'), (102, 'Frank'), (103,'Linus');
```
### add column
```
alter table Employees add column ManagerID int;
```

### Making Linus manager to Dave and Frank update values as specific rows
```
update Employees set ManagerID = 103 where EmpID in(101,102);
```

### self join (A self JOIN is a regular join, but the table is joined with itself.)
```
select e.EmpID, e.EmpName, m.EmpName from Employees e inner join Employees m where e.EmpID = m.EmpID;

OR

select Emp.EmpID, Emp.EmpName, Man.EmpName from Employees Emp inner join Employees Man where Emp.ManagerID =Man.EmpID;
```
## Constraints
### Creating Person Tables
```
create table Person(ID int not null, FName varchar(20) not null, LName varchar(20) not null, Age int);
```

### Inserting values into Person
#### Add into specific columns
```
insert into Person(ID, FName,LName) values(101,'John','Snow');

insert into Person(ID, FName) values(102,'John');

insert into Person(ID, FName) values(102,'John');

ERROR 1364 (HY000): Field 'LName' doesn't have a default value
```
#### because the LName is declared not null that's why we are getting this ERROR

### Truncate table (removing all the values)
```
truncate table Person;

select * from Person;

Empty set (0.00 sec)
```
### Changing the constraint of Age column to not null
```
alter table Person modify Age int not null;
```
### Adding unique key constraint while creating table

```
create table Person2(ID int , FName varchar(20) not null, LName varchar(20) not null, Age int, Email varchar(20), constraint Uni_ID unique(ID) );
```
### Adding constraint after creating a table
```
alter table Person2 add constraint Uni_Email unique(Email);
```

### Adding multiple columns in constraint
```
create table Person2(ID int , FName varchar(20) not null, LName varchar(20) not null, Age int, Email varchar(20), constraint Uni_ID unique(ID, Email) );
```

### Dropping constraint
```
alter table Person2 drop index Uni_ID;
alter table Person2 drop index Uni_Email;
```

### Create table person3
```
create table person3(ID int primary key, Fname varchar(20) not null, Lname varchar(20) not null, Age int);
````

### Inserting value in table
```
insert into Person3 values(101, 'User 1', 'Lname 1', 22);
```

### ID is primary key that's why it is not accepting duplicate values
```
insert into Person3 values(101, 'User 1', 'Lname 1', 22);

ERROR 1062 (23000): Duplicate entry '101' for key 'person3.PRIMARY'
```
### Drop primary key
```
alter table Person3 drop primary key;
```
### Adding primary key while creating table
```
create table Person4(ID int, Fname varchar(20),Lname varchar(20), Age int, Email varchar(20),constraint Pk_ID_Email primary key(ID, Email));
```

### Dropping primary key
```
alter table Person4 drop primary key;
```

### Add primary key constraint after creating table
```
alter table Person4 add constraint Pk_ID_Email primary key(ID,Email);
```

### Taking references from other tables(foreign key)
```
create table OrdersNew(OrderID int primary key, OrderName varchar(20),ID int, constraint foreign key FK_Person4(ID) references Person4(ID));
```
### Creating new table
```
create table OrdersNew2(OrderID int primary key, OrderName varchar(20) not null);
```

### Addling column ID
```
alter table OrdersNew2 add column ID int;
```

### Addling foreign key
```
alter table OrdersNew2 add constraint foreign key fk_ID(ID) references OrdersNew(ID);
```

### Default values while creating table
```
create table Cities(CityID int primary key, CityName varchar(20) default 'Mumbai', PinCode int);
```

### Adding values without default column , it will by default add Mumbai as a city
```
insert into Cities(CityID, PinCode) values(101, 400060);
```

### Dropping default values
```
alter table Cities alter cityname drop default;
```

### Changing default values
```
alter table cities alter Cityname set default 'Delhi';
```

### Union
#### Union between two tables (Shows common values between two table's columns without duplicate values)
``` 
select City from Customers2 union select City from Suppliers;
```

### Union all between two tables (Shows common values between two table's columns with all duplicate values)
```
select City from Customers2 union all select City from Suppliers;
```

## Order by clause
#### Order by(Ascending order)
```
select * from Students order by marks;
```

#### Order by desc(Descending order)
```
select * from Students order by marks desc;
```
### Max method
```
select max(marks) from Students;
```

### Min method
```
select min(marks) from Students;
```

### Avg method
```
select avg(marks) from Students;
```

### Count method 
```
select count(marks) from Students;
```

### limit (limits the output till specified no. entered)
```
select marks from Students limit 1;
```

### Second highest makrs in Students table
```
select max(marks) from Students where marks < (select max(marks) from Students);
```

### Second lowest makrs in Students table
```
select min(marks) from Students where marks > (select min(marks) from Students);
```

### Auto increment
```
create table Customers3(ID int primary key auto_increment, CustomerName varchar(20), Age int);
```
### Auto increment (Starts from 1)
#### Auto increment (Starts from 1)
```
insert into Customers3(CustomerName, Age) values('Customer 1', 22);
insert into Customers3(CustomerName, Age) values('Customer 2', 23);
```

#### Auto increment (Starts from the number we have specified)
```
insert into Customers3 values(1001, 'Customer 1', 32);
Query OK, 1 row affected (0.01 sec)

insert into Customers3 values(1002, 'Customer 2', 43);
Query OK, 1 row affected (0.01 sec)

insert into Customers3(CustomerName,Age) values('Customer 3', 32);
Query OK, 1 row affected (0.01 sec)
```

### Uppercase
```
select ucase(CustomerName) from Customers3;
```

### lowercase
```
select lcase(CustomerName) from Customers3;
```
### Mid() from a specific indexes
```
select mid(CustomerName,2,2) from Customers3;
```

### Mid using with a String
```
select mid('1234567',2,4);
```

### Length method
```
select * from Students;
```
### Using with column
```
select length(Name) as Name_length from Students;
```
### Using wih specific row
```
select length(Name) as Name_Length from Students where ID = 104;
```

### Length using string
```
select length('12345678');
```

### Round method
```
select round(232.44);
```
#### Round till given index
```
select round(232.44345, 4);
```

### Now method(Returns current date and time)
```
select now();
```

## Functions

#### Function without any parameters

```
delimiter $ --Setting delimiter
create function new2()
returns double
begin
return 3.14;
end;
$
```
#### Using function
``` 
select new2();$
```

### Show functions
```
show function status where db ='sql_practice'
```

### Method with 2 parameters
```
create function Addition1(num1 int, num2 int)
returns double
begin
declare num3 int;
set num3 = num1+ num2;
return num3;
end;
$
```

### 

#### Using function with two parameters
```
select Addition1(33,55); $
```

#### Conditional function
```
create function isEven(num int)
returns varchar(40)
begin
if(num%2=0) then
return 'Entered number is even';
else
return 'Entered number is odd';
end if;
end;
$
```
#### Using conditional statements
```
select isEven1(44);
```

### Delete function
```
drop function new2;
```

### Procedure
#### (Procedure for inserting values in the table)
```
create procedure Person3Insert(A int, B varchar(20), C varchar(20), D int)
begin
insert into Person3(ID, Fname, Lname, Age) values(A,B,C,D);
end;
$
```

#### Using insert procedure
```
call Person3insert(102, 'User 2', 'Lname 2', 24);
```

#### (Procedure for deleting rows int table)
```
create procedure Person3Delete(id1 int)
begin
delete from Person3 where ID =id1;
end;
$
```

#### (Procedure for updating rows)
```
create procedure Person3Update(i1 int, c1 varchar(20))
begin
update Person3 set Fname =c1 where ID = i1;
end;
$
```

## Triggers
#### Create 2 classes TriggerTest and TriggerTest_Backup
```
create table TriggerTest(ID int, Name varchar(20), Age int);$
create table TriggerTest_backup as(select * from TriggerTest);$
```
#### Creating triggers

#### Trigger on insert
```
create trigger TriggerTestIn
after
insert on TriggerTest
for each row
begin
insert into TriggerTest_backup values(new.ID, new.Name, new.Age);
end;
$
```

#### Trigger to update table
```
create trigger TriggerTestUp

after
update on TriggerTest
for each row
begin
insert into TriggerTest_Backup values(new.ID, new.Name, new.Age);
end;
$
```

#### Drop tiggers
```
drop trigger TriggerTestUP;
```

