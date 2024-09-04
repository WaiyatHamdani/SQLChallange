/* Challenge: Korean Idol Database
Scenario: You are working for a K-pop fan website and have a database that stores information about various Korean idols. 
The database includes information about their group, debut year, and popularity ranking. You need to write SQL queries to retrieve and manipulate data for reports and analysis.

Tables:
Idols
idol_id (INT, Primary Key)
name (VARCHAR)
gender (VARCHAR)
birth_year (INT)
debut_year (INT)
group_id (INT, Foreign Key to Groups table)

Groups
group_id (INT, Primary Key)
group_name (VARCHAR)
debut_year (INT)

Popularity
idol_id (INT, Foreign Key to Idols table)
ranking_year (INT)
popularity_rank (INT)

 */

drop table if exists Idols;
drop table if exists Groups;
drop table if exists Popularity;


create table Idols(
idol_id int primary key,
name varchar(50),
gender varchar(25),
birth_year int,
debut_year int,
group_id int
);

create table Groups(
group_id INT primary key,
group_name VARCHAR(50),
debut_year INT
);

create table Popularity(
idol_id INT, 
ranking_year INT,
popularity_rank INT,
constraint FK_idol_id foreign key(idol_id) references Idols(idol_id)
);

-- Idols Table
INSERT INTO Idols (idol_id, name, gender, birth_year, debut_year, group_id) VALUES
(1, 'Jimin', 'Male', 1995, 2013, 1),
(2, 'Lisa', 'Female', 1997, 2016, 2),
(3, 'V', 'Male', 1995, 2013, 1),
(4, 'Jennie', 'Female', 1996, 2016, 2);

-- Groups Table
INSERT INTO Groups (group_id, group_name, debut_year) VALUES
(1, 'BTS', 2013),
(2, 'BLACKPINK', 2016);

-- Popularity Table
INSERT INTO Popularity (idol_id, ranking_year, popularity_rank) VALUES
(1, 2023, 1),
(2, 2023, 3),
(3, 2023, 2),
(4, 2023, 4);




--Task 1: Write a query to retrieve the most popular male idols , sorted by their popularity rank.
select * from Idols i join popularity p 
on i.idol_id = p.idol_id 
where gender = 'Male'
order by popularity_rank asc;

--Task 2: Write a query to find all idols who debuted before the age of 19, along with their group name and debut year.
select * from Idols where debut_year - birth_year < 19; 

--Task 3: Write a query to find the  popularity rank for each group in the 2023. Display the group name along with their average rank.
select * from Idols i join Popularity p
on i.idol_id  = p.idol_id 
where ranking_year = '2023'
order by popularity_rank asc
