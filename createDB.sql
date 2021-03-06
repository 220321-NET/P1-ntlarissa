CREATE PROCEDURE dropAllTable
AS
	DROP TABLE Inventories, Orders, CustomerAddress, Products, Customers, Managers, StoreFront, Addresses
GO

CREATE PROCEDURE createAllTable
AS
CREATE TABLE Customers (
	customerID INT PRIMARY KEY IDENTITY(1, 1),
	customerFirstName VARCHAR(50) NOT NULL,
	customerLastName VARCHAR(50) NOT NULL,
	customerUserName VARCHAR(50) NOT NULL UNIQUE,
	customerPassword VARCHAR(70) NOT NULL
)
INSERT INTO Customers(customerFirstName, customerLastName, customerUserName, customerPassword) VALUES
('Lara', ' Tchani', 'l.tchani37@gmail.com', 'User1234');

CREATE TABLE Addresses (
	addressID INT PRIMARY KEY IDENTITY(1, 1),
	addressLine1 VARCHAR(50)  NULL,
	addressLine2 VARCHAR(50),
	addressCity VARCHAR(50)  NULL,
	addressState VARCHAR(50)  NULL,
	addressCountry VARCHAR(50)  NULL,
	addressZipCode VARCHAR(50)  NULL,
)
INSERT INTO Addresses(addressLine1, addressLine2, addressCity, addressState, addressCountry,addressZipCode) VALUES
('11160 VEIRS MILL RD', ' SUITE DPT4', 'Wheaton-Glenmont', 'MD','USA', '20902');

CREATE TABLE CustomerAddress (
	customerAddressID INT PRIMARY KEY IDENTITY(1, 1),
    modifiedDate DATETIME DEFAULT CURRENT_TIMESTAMP,
	addressID INT FOREIGN KEY REFERENCES Addresses(addressID) ON DELETE CASCADE,
	customerID INT FOREIGN KEY REFERENCES Customers(customerID) ON DELETE CASCADE,
)




CREATE TABLE StoreFront (
	storeID INT PRIMARY KEY IDENTITY(1, 1),
	storeName VARCHAR(50) NOT NULL,
	addressLine1 VARCHAR(50)  NULL,
	addressLine2 VARCHAR(50),
	addressCity VARCHAR(50)  NULL,
	addressState VARCHAR(50)  NULL,
	addressCountry VARCHAR(50)  NULL,
	addressZipCode VARCHAR(50)  NULL,
)

INSERT INTO StoreFront(storeName, addressLine1, addressLine2, addressCity, addressState, addressCountry,addressZipCode) VALUES
('Costco', '11160 VEIRS MILL RD', ' SUITE DPT4', 'Wheaton-Glenmont', 'MD','USA', '20902');
CREATE TABLE Products (
	productID INT PRIMARY KEY IDENTITY(1, 1),
	productQuantity FLOAT  NULL,
	productPrice FLOAT  NULL,
	productRef VARCHAR(max)  NULL,
	productName VARCHAR(50) NOT NULL,
	storeID INT FOREIGN KEY REFERENCES StoreFront(storeID),
)

CREATE TABLE Orders (
	orderID INT PRIMARY KEY IDENTITY(1, 1),
    orderDate DATETIME DEFAULT CURRENT_TIMESTAMP,
	quantity FLOAT  NULL,
	price FLOAT  NULL,
	total FLOAT  NULL,
	orderRef VARCHAR(50)  NULL,
	productRef VARCHAR(max)  NULL,
	productName VARCHAR(50) NOT NULL,
	productID INT FOREIGN KEY REFERENCES Products(productID) ON DELETE CASCADE,
	customerID INT FOREIGN KEY REFERENCES Customers(customerID) ON DELETE CASCADE,
)
CREATE TABLE Managers (
	managerID INT PRIMARY KEY IDENTITY(1, 1),
	managerFirstName VARCHAR(50) NOT NULL,
	managerLastName VARCHAR(50) NOT NULL,
	managerUserName VARCHAR(50) NOT NULL UNIQUE,
	managerPassword VARCHAR(70) NOT NULL,
	storeID INT FOREIGN KEY REFERENCES StoreFront(storeID) ON DELETE CASCADE,
)

INSERT INTO Managers(managerFirstName, managerLastName, managerUserName, managerPassword, storeID) VALUES
('Lara', ' Tchani', 'l.tchani37@gmail.com', 'Admin1234',1);

CREATE TABLE Inventories (
	inventoryID INT PRIMARY KEY IDENTITY(1, 1),
    inventoryDate DATETIME DEFAULT CURRENT_TIMESTAMP,
	quantity FLOAT  NULL,
	productID INT FOREIGN KEY REFERENCES Products(productID) ON DELETE CASCADE,
	managerID  INT FOREIGN KEY REFERENCES Managers(managerID ) ON DELETE CASCADE,
)

GO

 EXEC dropAllTable
 EXEC createAllTable


