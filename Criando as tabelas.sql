create database DIO_ecommerce;

use DIO_ecommerce;

DROP TABLE IF EXISTS Inventory,ThridPartySeller,Products,Orders,Tracking,Payment,OrderDetails,Customers;

create table Inventory(
	idInventory INT primary key,
    idProduct INT,
	Name VARCHAR(50),
    Address VARCHAR(50),
    City VARCHAR(30),
    State VARCHAR(30),
    Postal_Code VARCHAR(30),
    Phone VARCHAR(30),
    Email VARCHAR(30)
    );
    
 create table ThridPartySeller(
	id3party INT primary key,
    idProduct INT,
	Company VARCHAR(50),
    Address VARCHAR(50),
    City VARCHAR(30),
    State VARCHAR(30),
    Postal_Code VARCHAR(30),
    Phone VARCHAR(30),
    Email VARCHAR(30)
);

create table Products(
	idProduct INT primary key,
	idInventory INT,
	id3party INT,
	category VARCHAR(50),
	Description VARCHAR(100),
    Size INT,
    Color varchar(25),
    Weight int,
	Price Decimal(8,2)    
);

create table Orders(
	idOrder INT primary key,
	idCustomer INT,
	idPayment int,
    idShipper INT,
	orderDate VARCHAR(50),
	shipDate VARCHAR(50),
	Freight Decimal(8,2)
);

create table OrderDetails(
    idOrderDetails INT primary key,
    idOrder Int,
	idProduct INT,
	idPayment int,
    idShipper INT,
	orderDate VARCHAR(50),
	shipDate VARCHAR(50),
	Price Decimal(8,2),
    Quantity INT,
    Size INT,
    Color VARCHAR(20),
    Total Decimal(8,2)
);



create table Payment(
	idPayment INT primary key,
	PaymentType VARCHAR(20),
    Allowed varchar(10)
);

create table Tracking(
	trackingCode VARCHAR(20) primary key,
	idOrder int,
    ShipperCompany VARCHAR(30),
	Status varchar(30),
    Phone VARCHAR(20)
);

create table Customers(
	idCustomer INT primary key,
	first_name VARCHAR(30) ,
	last_name VARCHAR(50),
	email VARCHAR(50),
	gender VARCHAR(30),
	address VARCHAR(50),
	city VARCHAR(30),
	state VARCHAR(30),
    postal_code VARCHAR(30),
	natural_person VARCHAR(30),
    Phone VARCHAR(30),
	credit_card VARCHAR(30),
    username VARCHAR(30),
    password VARCHAR(30)
);

#Acrescentando foreign keys
ALTER TABLE Inventory
ADD FOREIGN KEY (idProduct) REFERENCES Products(idProduct);

ALTER TABLE ThridPartySeller
ADD FOREIGN KEY (idProduct) REFERENCES Products(idProduct);

ALTER TABLE Products
ADD FOREIGN KEY (id3party) REFERENCES ThridPartySeller(id3party);

ALTER TABLE Products
ADD FOREIGN KEY (idInventory) REFERENCES Inventory(idInventory);

ALTER TABLE Products
ADD FOREIGN KEY (idInventory) REFERENCES Inventory(idInventory);

ALTER TABLE OrderDetails
ADD FOREIGN KEY (idOrder) REFERENCES Orders(idOrder);

ALTER TABLE OrderDetails
ADD FOREIGN KEY (idProduct) REFERENCES Products(idProduct);

ALTER TABLE Orders
ADD FOREIGN KEY (idCustomer) REFERENCES Customers(idCustomer);

ALTER TABLE Orders
ADD FOREIGN KEY (idPayment) REFERENCES Payment(idPayment);

ALTER TABLE Tracking
ADD FOREIGN KEY (idOrder) REFERENCES Orders(idOrder);


















