create database car_show_room;

use car_show_room;

create table Cars(
car_id int primary key auto_increment,
make varchar (50),
model varchar (50),
year int,
price decimal (10,2),
color varchar (30),
milleage int,
vin varchar (50) unique
);

select*from Cars;

insert into Cars
(car_id,  make, model, year,price,color, milleage, vin)
values
(1,'Toyota','Corolla',2024,200000,'white',0,'Vrk1223'),
(2,'Ford','Mustang',2022,500000,'Red', 0,'Brk1122'),
(3,'Suzuki','Swift',2007,300000,'Silver', 0,'Krh222'),
(4,'Audi','A4',2022,2000000,'Black', 0,'Wau456'),
(5,'Changan','CS75',2023,300000,'Blue',0,'Sak12223'),
(6,'Toyota','4Runner',2023,200000,'White', 0,'Ham0002222');

drop table if exists cars;

create table Custmer(
custmer_id int primary key auto_increment,
first_name varchar (50),
last_name varchar (50),
phone varchar (20),
email varchar(100),
adress varchar (255)
);

select*from Custmer;

insert	into Custmer
(custmer_id, first_name, last_name, phone, email, adress)
values
(1,'Hamza','Siddique', '923005065785','h33696200@gmai.com','Hasilpur'),
(2,'Ali','Talha', '923005065786','alitalha@gmai.com','Darawala'), 
(3,'Zeeshan','Bahtoo', '923005065787','zeeshanali@gmai.com','Bwp'), 
(4,'Hamza','Ameer', '923005065788','hamzaali@gmai.com','Hasilpur'), 
(5,'Fami','Ali', '923005065789','famiali@gmai.com','Bwp'),  
(6,'Adnan','Hussain', '923005065790','adnanali@gmai.com','Darawala');

select*from Saleperson;

create table Saleperson (
saleperson_id int primary key auto_increment,
first_name varchar (50),
last_name varchar (50),
phone varchar (20),
email varchar(100),
salary decimal (10,2)
);

insert	into Saleperson
(saleperson_id, first_name, last_name, phone, email, salary)
values
(1,'Hamza','Mehmood', '923005065685','hamzaali@gmai.com','20000'),
(2,'Ali','Talha', '923005065585','alitalha@gmai.com','30000'), 
(3,'Zeeshan','Ali', '923005065288','zeeshanali@gmai.com','10000'), 
(4,'Hamza','Numan', '923005065990','hamzaali@gmai.com','50000'), 
(5,'Fami','Boob', '923005065988','famiali@gmai.com','20000'),  
(6,'Adil','Hussain', '923005065700','adnanali@gmai.com','100');


create table Sales (
sale_id int primary key auto_increment,
car_id int,
custmer_id int,
saleperson_id int,
sale_date date,
sale_price decimal (10,2),
foreign key (car_id) references Cars (car_id),
foreign key (custmer_id) references Custmer (custmer_id),
foreign key (saleperson_id) references Saleperson (saleperson_id)
);


select*from Sales;

insert into Sales
(sale_id, car_id, custmer_id, saleperson_id, sale_date, sale_price)
values
(101, 6, 1,2, '2023-03-10', 200000),
(102, 1, 2,6, '2022-12-12', 500000),
(103, 3, 5,1, '2024-01-05', 100000),
(104, 5, 4,3, '2022-11-14', 2500000),
(105, 2, 6,4, '2024-07-8',3000000),
(106, 4, 3,5, '2023-09-20', 1200000);

create table Inventory(
car_id int,
quantity_in_stock int,
foreign key (car_id) references Cars(car_id)
);

select*from Inventory;

insert into Inventory
( car_id, quantity_in_stock)
values
(1,10),
(2,20),
(3,30),
(4,25),
(5,100),
(6,5);

create table ServiceRecords(
service_id int primary key,
car_id int,
service_date date,
service_description text,
service_cost decimal (10,2),
foreign key (car_id) references Cars(car_id)
);

select*from ServiceRecords;

insert into ServiceRecords
(service_id, car_id, service_date, service_description, service_cost)
values
(121,1,'2024-03-10','oil change', 2000),
(122,3,'2024-04-11','TIRE Replecment', 10000),
(123,5,'2023-11-11','Head light change', 50000),
(124,4,'2024-01-10','Wind sheet Replace', 2000),
(125,2,'2024-12-04','Paint Change', 120000),
(126,6,'2023-05-15','oil change', 2000);

select*
from Sales
where Saleperson_id =1;

select Custmer.first_name, Custmer last_name, Cars.make, Cars.model, Sales.sale_date,Sales.sale_price
From Sales
join Custmer on Sales.custmer_id=Customer.custmer_id
join Cars on sales.car_id= Cars.car_id;

select Cars.make, Cars.model, Inventorey.quantity_in_stock
from Inventory
join Cars on Inventory.car_id =Cars.car_id
where Cars.model = 'Corolla';
