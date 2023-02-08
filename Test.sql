Create database test
use test

create table bike(
    motor       varchar(255),
	Model	    varchar(255),
    OwnerName	varchar(255),
    Color	    varchar(255),
    Year        varchar(255)
);

insert into bike Values('Honda','CD 70','Muhammad Ali','Black','2020');

insert into bike Values('Yamaha','YBR','Michael Scott','Black','2021');

insert into bike Values('Honda','CD 125','Walter White','Blue','2014');

insert into bike Values('Suzuki','150cc','jake peralta','Red','2020');

insert into bike Values('Kawasaki','250','Mike Tyson','Green','2019');


create table car(
    motor       varchar(255),
	Model	    varchar(255),
    OwnerName	varchar(255),
    Color	    varchar(255),
    Year        varchar(255)
);

insert into car Values('Honda','Civic','Michael Scofield','Black','2020');

insert into car Values('Lamborghini','Gallardo','Chandler Bing','Gray','2021');

insert into car Values('Suzuki','Cultus','Barry Alan','Black','2020');

insert into car Values('lamborgini','Elemento','Charles','Black','2020');

insert into car Values('BMW','920','Sparrow','Blue','2020');

select *from bike
union
select *from car

select motor,OwnerName from car
union
select motor,OwnerName from bike;

select Model,Color,Year from bike
union
select Model,Color,Year from car;

select distinct motor,Color from bike where Year = '2020'
union
select distinct motor,Color from car where Year ='2020';

select distinct Model from bike where motor = 'Honda'
union
select distinct Model from car where motor = 'Honda';

select top 1 *from bike;

select top 3 *from bike; 

select *from car
except
select *from car where motor = 'Honda';

select *from car
intersect
select *from bike;

select count(motor) as 'number of car',motor
from car
group by motor
having count(motor)>0;

select count(*) from car where Color = 'Black';

select count(*) from car where Year = '2020';

select MIN(Year) from car;

select *from bike;

select MIN(Year) from bike;

select MAX(Year) from car;
