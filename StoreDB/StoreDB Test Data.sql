USE StoreDB;
GO

--DECLARE VARIABLE STATES
DECLARE @ActiveId INT;
DECLARE @DeactivateId INT;
SELECT TOP 1 @ActiveId = Id FROM States WHERE State_Name = 'Activo';
SELECT TOP 1 @DeactivateId = Id FROM States WHERE State_Name = 'Desactivado';

--DELCARE VARIABLE CATEGORIES
DECLARE @JeansId INT;
DECLARE @ShirtId INT;
DECLARE @ShortId INT;
DECLARE @ShoesId INT;
DECLARE @GlassesId INT;
SELECT TOP 1 @JeansId = Id FROM Categories WHERE Categories_Name = 'Jeans';
SELECT TOP 1 @ShirtId = Id FROM Categories WHERE Categories_Name = 'Shirt';
SELECT TOP 1 @ShortId = Id FROM Categories WHERE Categories_Name = 'Short';
SELECT TOP 1 @ShoesId = Id FROM Categories WHERE Categories_Name = 'Shoes';
SELECT TOP 1 @GlassesId = Id FROM Categories WHERE Categories_Name = 'Glasses';

--DECLARE VARIABLE CUSTOMER
DECLARE @CustomerId1 INT, @CustomerId2 INT, @CustomerId3 INT;
SELECT TOP 1 @CustomerId1 = Id FROM Customer ORDER BY Id DESC;
SELECT TOP 1 @CustomerId2 = Id FROM Customer WHERE Id > @CustomerId1 ORDER BY Id DESC;
SELECT TOP 1 @CustomerId3 = Id FROM Customer WHERE Id > @CustomerId2 ORDER BY Id DESC;

--INSERT STATES 
IF NOT EXISTS (SELECT * FROM States WHERE State_Name = 'Activado')
BEGIN
	INSERT INTO States (State_Name) VALUES('Activado');
END

IF NOT EXISTS (SELECT * FROM States WHERE State_Name = 'Desactivado')
BEGIN
	INSERT INTO States (State_Name) VALUES('Desactivado');
END

--INSERT CATEGORIES 
IF NOT EXISTS (SELECT * FROM Categories WHERE Categories_Name = 'Jeans')
BEGIN
	INSERT INTO Categories(Categories_Name, StateID) VALUES('Jeans', 1);
END

IF NOT EXISTS (SELECT * FROM Categories WHERE Categories_Name = 'Shirt')
BEGIN
	INSERT INTO Categories(Categories_Name, StateID) VALUES('Shirt', 1);
END

IF NOT EXISTS (SELECT * FROM Categories WHERE Categories_Name = 'Short')
BEGIN
	INSERT INTO Categories(Categories_Name, StateID) VALUES('Short', 1);
END

IF NOT EXISTS (SELECT * FROM Categories WHERE Categories_Name = 'Shoes')
BEGIN
	INSERT INTO Categories(Categories_Name, StateID) VALUES('Shoes', 1);
END

IF NOT EXISTS (SELECT * FROM Categories WHERE Categories_Name = 'Glasses')
BEGIN
	INSERT INTO Categories(Categories_Name, StateID) VALUES('Glasses', 1);
END

-- INSERT PRODUCTS
IF NOT EXISTS (SELECT * FROM Products WHERE Product_Name = 'Camisa XL')
BEGIN
	INSERT INTO Products (Product_Name, Price, Quantity, StateID, CategoriesID) VALUES ('Camisa XL', 25.000, 2, 1, 8);
END

IF NOT EXISTS (SELECT * FROM Products WHERE Product_Name = 'Jeans 32')
BEGIN
	INSERT INTO Products (Product_Name, Price, Quantity, StateID, CategoriesID) VALUES ('Jeans 32', 25.000, 2, 2, 7);
END

IF NOT EXISTS (SELECT * FROM Products WHERE Product_Name = 'Lentes')
BEGIN
	INSERT INTO Products (Product_Name, Price, Quantity, StateID, CategoriesID) VALUES ('Lentes', 25.000, 2, 1, 11);
END

IF NOT EXISTS (SELECT * FROM Products WHERE Product_Name = 'Short 32')
BEGIN
	INSERT INTO Products (Product_Name, Price, Quantity, StateID, CategoriesID) VALUES ('Short 32', 25.000, 2, 2, 9);
END

IF NOT EXISTS (SELECT * FROM Products WHERE Product_Name = 'Zapato 40')
BEGIN
	INSERT INTO Products (Product_Name, Price, Quantity, StateID, CategoriesID) VALUES ('Zapato 40', 25.000, 2, 1, 10);
END

-- INSERT CUSTOMER

INSERT INTO Customer (Name, LastName, PhoneNumber, Country, State, City, Addres)
VALUES
  ('David', 'Rodriguez', '12345678', 'Costa Rica', 'Cartago', 'La Union', 'San Diego'),
  ('Katherine', 'Rodriguez', '12345678', 'Costa Rica', 'Cartago', 'La Union', 'San Diego'),
  ('Keylin', 'Rodriguez', '12345678', 'Costa Rica', 'Cartago', 'La Union', 'San Diego');