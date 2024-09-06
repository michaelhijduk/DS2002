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
