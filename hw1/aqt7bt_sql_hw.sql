use world;

select Name from country where Continent = 'South America';
select Population from country where Name = 'Germany';
select Name from city where CountryCode = 'JPN';

select Name from country where Continent = 'Africa' order by Population desc limit 5;
select Name, LifeExpectancy from country where Population > 1000000 and Population < 5000000;
select name from country join countrylanguage on country.Code = countrylanguage.CountryCode where Language = 'French';

use Chinook_AutoIncrement;

select title from Album join Artist on Album.ArtistId = Artist.ArtistId where Name = 'AC/DC';
select FirstName, LastName, email from Customer where country = 'Brazil'; 
select Name from Playlist;

select count(Track.TrackId) from Track where Track.GenreId = (select Genre.GenreId from Genre where Genre.Name = 'Rock');
select FirstName, LastName from Employee where ReportsTo = (select EmployeeId from Employee where FirstName = 'Nancy' and LastName = 'Edwards'); 
select Customer.FirstName, Customer.LastName, sum(Invoice.Total) from Invoice join Customer on Invoice.CustomerId = Customer.CustomerId group by Invoice.CustomerId;

-- Building Database

create table Employees ( ID int not null, FirstName varchar(255), LastName varchar(255) not null, Age int, Role varchar(255), primary key (ID) ); 
create table Products ( ProductID int not null, Price float not null, ProductName varchar(255) not null, UnitsSold int, primary key (ProductID) ); 
create table Customers ( CustomerID int not null, C_FirstName varchar(255), C_LastName varchar(255) not null, PurchaseID int not null, Address varchar(255) not null, PhoneNumber varchar(255), primary key (CustomerID) ); 

insert into Products values (1, 5.50, 'Glowing Hairbrush', 400), (2, 10.99, 'Fancy Shampoo', 298), (3, 2.25, 'Pink Hair Clip', 567), (4, 9.75, 'Handheld Mirror', 156), (5, 7.77, 'Scissors', 321); 
insert into Employees values (1, 'John', 'Smith', 45, 'Manager'), (2, 'Betty', 'Harris', 36, 'Stylist'), (3, 'Sue', 'Roberts', 62, 'Stylist'), (4, 'Mark', 'Brown', 29, 'Maintenance'), (5, 'Sarah', 'Watson', 32, 'Accounting'); 
insert into Customers values (1, 'Jack', 'Hawthorne', 5, '420 Green Leaf Road', '2347658123'), (2, 'Miriam', 'Turner', 3, '69 Rosewood Drive', '3856120938'), (3, 'Mary', 'Williams', 4, '800 Atlantis Circle', '5730985571'), (4, 'Kristin', 'Baker', 3, '250 Little Creek Lane', '3459857123'), (5, 'Alice', 'Hopper', 2, '999 White Rabbit Hollow', '1983620074'); 

-- customers who purchased hair clips
select C_FirstName, C_LastName from Customers where PurchaseID = (select ProductID from Products where ProductName = 'Pink Hair Clip');

-- employees who are stylists
select FirstName, LastName from Employees where Role = 'Stylist';

-- products that have sold over 300 units
select ProductName from Products where UnitsSold > 300;
