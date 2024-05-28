USE StoreDB;
GO

DECLARE @ActiveId INT;
SELECT TOP 1 @ActiveId = Id FROM States WHERE Name = 'Activo';

DECLARE @DeactivateId INT;
SELECT TOP 1 @DeactivateId = Id FROM States WHERE Name = 'Desactivado';

DECLARE @JeansId INT;
SELECT TOP 1 @JeansId = Id FROM Categories WHERE Name = 'Jeans';

DECLARE @ShirtId INT;
SELECT TOP 1 @ShirtId = Id FROM Categories WHERE Name = 'Shirt';

DECLARE @ShortId INT;
SELECT TOP 1 @ShortId = Id FROM Categories WHERE Name = 'Short';

DECLARE @ShoesId INT;
SELECT TOP 1 @ShoesId = Id FROM Categories WHERE Name = 'Shoes';

DECLARE @GlassesId INT;
SELECT TOP 1 @GlassessId = Id FROM Categories WHERE Name = 'Glasses';

-- INSERT PRODUCTS
BEGIN
	INSERT INTO Products (Product_Name, Price, Quantity, StateID, CategoriesID) VALUES ('Camisa XL', '25.000', '2', @ActiveId, @ShirtId);
END

BEGIN
	INSERT INTO Products (Product_Name, Price, Quantity, StateID, CategoriesID) VALUES ('Jeans 32', '25.000', '2', @DeactivateId, @JeansId);
END

BEGIN
	INSERT INTO Products (Product_Name, Price, Quantity, StateID, CategoriesID) VALUES ('Lentes', '25.000', '2', @ActiveId, @GlassesId);
END

BEGIN
	INSERT INTO Products (Product_Name, Price, Quantity, StateID, CategoriesID) VALUES ('Short 32', '25.000', '2', @DeactivateId, @ShortId);
END

BEGIN
	INSERT INTO Products (Product_Name, Price, Quantity, StateID, CategoriesID) VALUES ('Zapato 40', '25.000', '2', @ActiveId, @ShoesId);
END