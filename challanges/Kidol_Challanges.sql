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
drop table if exists Popularity;
drop table if exists Groups;
drop table if exists Idols;



--create table task
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
(1, 'Eunha', 'Female', 1997, 2015, 1),
(2, 'Sowon', 'Female', 1995, 2015, 1),
(3, 'SinB', 'Female', 1998, 2015, 1),
(4, 'Umji', 'Female', 1998, 2015, 1),
(5, 'Soyeon', 'Female', 1998, 2018, 2),
(6, 'Miyeon', 'Female', 1997, 2018, 2),
(7, 'Minnie', 'Female', 1997, 2018, 2),
(8, 'Yuqi', 'Female', 1999, 2018, 2),
(9, 'Shuhua', 'Female', 2000, 2018, 2),
(10, 'Minji', 'Female', 2004, 2022, 3),
(11, 'Hanni', 'Female', 2004, 2022, 3),
(12, 'Danielle', 'Female', 2005, 2022, 3),
(13, 'Haerin', 'Female', 2006, 2022, 3),
(14, 'Hyein', 'Female', 2008, 2022, 3);

INSERT INTO Idols (idol_id, name, gender, birth_year, debut_year, group_id) VALUES
(15, 'Jimin', 'Male', 1995, 2013, 4),
(16, 'V', 'Male', 1995, 2013, 4);

-- Groups Table
INSERT INTO Groups (group_id, group_name, debut_year) VALUES
(1, 'VIVIZ', 2015),
(2, '(G)I-DLE', 2018),
(3, 'NewJeans', 2022);

INSERT INTO Groups (group_id, group_name, debut_year) values (4,'BTS',2013);

-- Popularity Table
INSERT INTO Popularity (idol_id, ranking_year, popularity_rank) VALUES
(1, 2023, 5),
(2, 2023, 7),
(3, 2023, 6),
(4, 2023, 8),
(5, 2023, 1),
(6, 2023, 3),
(7, 2023, 4),
(8, 2023, 2),
(9, 2023, 9),
(10, 2023, 1),
(11, 2023, 2),
(12, 2023, 3),
(13, 2023, 4),
(14, 2023, 5);

INSERT INTO Popularity (idol_id, ranking_year, popularity_rank) values (15, 2023, 5),(16, 2023, 8);


--Task 1: Write a query to retrieve the most popular male idols , sorted by their popularity rank.
select * from Idols i join popularity p 
on i.idol_id = p.idol_id 
where gender = 'Male'
order by popularity_rank asc;

--Task 2: Write a query to find all idols who debuted before the age of 18, along with their group name and debut year.
select * from Idols where debut_year - birth_year < 18; 

--Task 3: Write a query to find the  popularity rank 2 for each group in the 2023. Display the group name along with their average rank.
select * from Idols i join Popularity p
on i.idol_id  = p.idol_id 
where ranking_year = '2023' and popularity_rank = '2'
order by popularity_rank asc

-- Task 4: Find Groups That Have All Members Born After 2000 Write a query to list groups where all members were born after the year 2000.
SELECT 
    name,
    CASE 
        WHEN birth_year < 2000 THEN 'Before 2000'
        ELSE 'After 2000'
    END AS category
FROM Idols;



--task 5: Longest Serving Idol Write a query to find the idol who has been active the longest since their debut year. Show their name
select name ,(extract(year from CURRENT_DATE) - debut_year) as howlong from idols;
