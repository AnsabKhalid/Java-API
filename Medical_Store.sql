Create database [Medical]
use Medical;

CREATE TABLE Company(
   Company_ID	   varchar(20) Primary key,
   Company_Name    varchar(50) NOT NULL,
   Contact         varchar(15) NOT NULL,
   Locations       varchar(50) NOT NULL
);

CREATE TABLE Medicine(
   Medicine_ID     varchar(20) Primary key,
   Medicine_Name   varchar(30) NOT NULL,
   Company_ID      varchar(20) foreign key references Company(Company_ID),
   Price           float NOT NULL,
   Manufacturing   date NOT NULL,
   Expiry          date NOT NULL
);

CREATE TABLE Employee(
   Employee_ID     varchar(20) Primary key,
   Employee_Name   varchar(30) NOT NULL,
   Contact         varchar(20) NOT NULL,
   Salary          int check(Salary > 5000),
   Addresss        varchar(40) NOT NULL
);

CREATE TABLE Sales(
   Medicine_ID    varchar(20)  foreign key references Medicine(Medicine_ID),
   Sale_Date      date NOT NULL,
   Employee_ID    varchar(20)  foreign key references Employee(Employee_ID),
   Quantity       int NOT NULL,
   Price          FLOAT NOT NULL
);

CREATE TABLE Login(
   Username       varchar(20) NOT NULL,
   Pass           varchar(20) NOT NULL,
   Employee_ID    varchar(20)  foreign key references Employee(Employee_ID)
);

CREATE TABLE Customer(
   Customer_ID    varchar(20) Primary key,
   Customer_Name  varchar(30) NOT NULL,
   Medicine_ID    varchar(20)  foreign key references  Medicine(Medicine_ID),
   Quantity       int NOT NULL,
   Price          float NOT NULL
);

CREATE TABLE Bill(
   Customer_ID   varchar(20)  foreign key references Customer(Customer_ID),
   Medicine_Name varchar(30) NOT NULL,
   Price         float NOT NULL
);

CREATE TABLE Dealer(
   Dealer_ID   varchar(20) primary key,
   Dealer_Name varchar(30) NOT NULL,
   Company_ID  varchar(20) foreign key references Company(Company_ID)
);

CREATE TABLE Purchase(
   Product_ID   varchar(20) Primary key,
   Dealer_ID    varchar(20) foreign key references Dealer(Dealer_ID),
   Medicine_ID  varchar(20) foreign key references Medicine(Medicine_ID),
   Purchase_Date  Date NOT NULL,
   Quantity     int NOT NULL,
   Price        float NOT NULL
);

CREATE TABLE Stock(
   Product_ID   varchar(20) foreign key references Purchase(Product_ID),
   Quantity_Left  int NOT NULL
);

insert into [Company] 
values ('DEF10', 'Medicare', '03234675786', 'Lahore'),
('ASD20', 'Medlife', '03335467890', 'Karachi'),
('QWS32', 'PiCare', '03232456345', 'Islamabad')

insert into [Medicine]
values ('A10', 'Concor', 'DEF10', '278', '2020-06-26', '2021-06-26'),
('B14', 'Rotec50', 'ASD20', '343', '2020-03-14', '2022-05-24'),
('CD3', 'Sustac', 'QWS32', '432', '2020-07-15', '2021-08-15')

insert into [Employee]
values ('2341', 'Shahzad', '03234563785', '20000', 'Samnabad'),
('2342', 'Kamran', '03267896546', '25000', 'Rajgarh'),
('2343', 'Shaheer', '03364456738', '14000', 'Islampura')

insert into [Sales] 
values ('B14', '2020-07-09', '2343', '18', '1011.33'),
('A10', '2021-03-15', '2341', '17', '824.68'),
('CD3', '2020-12-17', '2342', '20', '1732')

insert into [Login]
values ('Clinix.323', 'CLINIX4534Med', '2343'),
('Clinix.323', 'CLINIX4534Med', '2341'),
('Clinix.323', 'CLINIX4534Med', '2342')

insert into [Customer]
values ('Ar012', 'Arman', 'B14', '15', '1343.78'),
('Um043', 'Umer', 'A10', '23', '6798.32'),
('Na022', 'Nabeel', 'CD3', '19', '2365.87')

insert into [Bill]
values ('Um043', 'Sustac', '2365.87'),
('Na022', 'Rotec50', '1343.78'),
('Ar012', 'Concor', '6798.32')

insert into [Dealer] 
values ('Ka22', 'Kashif', 'ASD20'),
('Al42', 'Ali', 'QWS32'),
('Sa33', 'Saqib', 'DEF10')

insert into [Purchase]
values ('Hr78', 'Al42', 'B14', '2020-08-25', '45', '66760.77'),
('Xa55', 'Sa33', 'CD3', '2019-06-16', '34', '77878.98'),
('Wa23', 'Ka22', 'A10', '2018-12-25', '49', '96099.43')

insert into [Stock]
values ('Wa23', '18'),
('Hr78', '15'),
('Xa55', '17')

Select *from Company;
Select *from Medicine;
Select *from Employee;
Select *from Sales;
Select *from Login;
Select *from Customer;
Select *from Bill;
Select *from Dealer;
select *from Purchase;
Select *from Stock;

TRUNCATE TABLE Company;
TRUNCATE TABLE Medicine;
TRUNCATE TABLE Employee;
TRUNCATE TABLE Sales;
TRUNCATE TABLE Login;
TRUNCATE TABLE Customer;
TRUNCATE TABLE Bill;
TRUNCATE TABLE Dealer;
TRUNCATE TABLE Purchase;
TRUNCATE TABLE Stock;

DROP TABLE Company;
DROP TABLE Medicine;
DROP TABLE Employee;
DROP TABLE Sales;
DROP TABLE Login;
DROP TABLE Customer;
DROP TABLE Bill;
DROP TABLE Dealer;
DROP TABLE Purchase;
DROP TABLE Stock;