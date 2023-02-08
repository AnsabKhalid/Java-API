Create database [Assignment]
use Assignment;


CREATE TABLE Countries(
    Country_ID	    int NOT NULL,
    Country_Name	varchar(100),
    Region_ID       int NULL	
);

insert into Countries Values('1','Pakistan','25');

insert into Countries Values('2', 'Germany', '30');

insert into Countries Values('3', 'Jmaica', '35');

Select *from Countries;

CREATE TABLE Locations (
    Loc_ID        int NOT NULL,
	Loc_title     varchar(15) NOT NULL,
	min_salary    int,
	max_salary    int,
	column_ID     varchar(15)
);

insert into Locations Values('4', 'Samnabad', '20000', '50000');

insert into Locations Values('5', 'Ichra', '30000', '60000');

insert into Locations Values('6', 'Walton', '40000', '70000');

Select *from Locations;

ALTER TABLE Countries ADD City varchar(50) NULL;

ALTER TABLE Countries ADD Country_new_id int;

ALTER TABLE Countries ADD located varchar(50);

ALTER TABLE Locations ADD state_province char(50),
Region_ID int;

ALTER TABLE Locations ADD reg_id int;

alter table Locations DROP City; 

ALTER TABLE Locations DROP COLUMN region_id;

ALTER TABLE Locations DROP COLUMN column_ID;

ALTER TABLE Locations DROP Loc_ID;

TRUNCATE TABLE Locations;

TRUNCATE TABLE Countries;

DROP TABLE Locations;

DROP TABLE Countries;
