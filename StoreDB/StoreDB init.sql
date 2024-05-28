IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'StoreDB')
BEGIN
	CREATE DATABASE StoreDB;
END
GO

USE StoreDB;
GO

-- CREATE PRODUCTS
IF NOT EXISTS (SELECT * FROM sys.sysobjects WHERE name = 'Products' and xtype = 'U')
BEGIN
	CREATE TABLE Products (
		Product_Id INT IDENTITY (1,1) NOT NULL,
		Product_Name VARCHAR(50) NOT NULL,
		Price DECIMAL(10,2) NOT NULL,
		Quantity SMALLINT NOT NULL,
		StateID INT NOT NULL,
		CategoriesID INT NOT NULL,
		CONSTRAINT PKProduct PRIMARY KEY (Product_Id),
		CONSTRAINT FKProductStateId FOREIGN KEY (StateID) REFERENCES States(Id),
		CONSTRAINT FKProductCategoryID FOREIGN KEY (CategoriesID) REFERENCES Categories(Id)
	)
END
GO

-- CREATE CATEGORIES
IF NOT EXISTS (SELECT * FROM sys.sysobjects WHERE name = 'Categories' and xtype = 'U')
BEGIN
	CREATE TABLE Categories (
	Id INT IDENTITY (1,1) NOT NULL,
	Categories_Name VARCHAR(50) NOT NULL,
	StateID INT NOT NULL,
	CONSTRAINT PKCategories PRIMARY KEY (Id),
	CONSTRAINT PKStateCategories FOREIGN KEY (StateID) REFERENCES States (Id)
	)
END
GO

-- CREATE STATES
IF NOT EXISTS (SELECT * FROM sys.sysobjects WHERE name = 'States' and xtype = 'U')
BEGIN
	CREATE TABLE States (
		Id INT IDENTITY (1,1) NOT NULL,
		State_Name VARCHAR(50) NOT NULL,
		CONSTRAINT PKState PRIMARY KEY (Id)
	)
END
GO

-- CREATE CUSTOMER
IF NOT EXISTS (SELECT * FROM sys.sysobjects WHERE name = 'Customer' and xtype = 'U')
BEGIN
	CREATE TABLE Customer (
		Id INT IDENTITY (1,1) NOT NULL, 
		Name VARCHAR(50) NOT NULL,
		LastName VARCHAR(50) NOT NULL,
		PhoneNumber INT NOT NULL,
		Country VARCHAR(50) NOT NULL,
		State VARCHAR (50) NOT NULL,
		City VARCHAR(50) NOT NULL,
		Addres VARCHAR (50) NOT NULL,
		CONSTRAINT PKCustomerId PRIMARY KEY (Id)
	)
END
GO 

-- CREATE Completed Orders
IF NOT EXISTS (SELECT * FROM sys.sysobjects WHERE name = 'Orders' and xtype = 'U')
BEGIN
	CREATE TABLE Orders (
		Id INT IDENTITY (1,1) NOT NULL,
		Purchase_Order NVARCHAR(20) NOT NULL,
		Date DATETIME2(7) NOT NULL,
		Product_Id INT NOT NULL,
		Customer_Id INT NOT NULL,
		CONSTRAINT PKOrdersId PRIMARY KEY (Id),
		CONSTRAINT UXPurchaseOrder UNIQUE (Purchase_Order),
		CONSTRAINT FKProductOrderId FOREIGN KEY (Product_Id) REFERENCES Products(Product_Id),
		CONSTRAINT FKCustomerOrderId FOREIGN KEY (Customer_Id) REFERENCES Customer(Id)
	)
END
GO

CREATE TRIGGER GenerateOrder
ON Orders
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Orders
    SET Purchase_Order = FORMAT(i.Date, 'yyyyMMdd') + CAST(i.Customer_Id AS NVARCHAR(10))
    FROM inserted i
    WHERE Orders.Id = i.Id;
END;