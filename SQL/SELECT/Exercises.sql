-- ============================================================
-- SQL SELECT Exercises - JRDatabase6 (Northwind)
-- Tables available: Customers, Orders, [Order Details], Products,
--                   Employees, Categories, Suppliers, Shippers,
--                   Territories, Region, EmployeeTerritories
-- ============================================================


-- == LEVEL 1: Basic SELECT ==

-- Exercise 1
-- Retrieve all columns from the Customers table.
SELECT
    *
FROM
    dbo.Customers

-- Exercise 2
-- Retrieve only the ProductName, UnitPrice and UnitsInStock
-- columns from the Products table.
SELECT
    ProductName,
    UnitPrice,
    UnitsInStock
FROM
    dbo.Products

-- Exercise 3
-- Show the top 10 rows from the Orders table.
SELECT
    TOP 10
    *
FROM
    dbo.Orders

-- Exercise 4
-- List every unique Country from the Customers table
-- (no duplicates).
-- Hint: DISTINCT
SELECT DISTINCT
    Country
FROM
    dbo.Customers

-- == LEVEL 2: Filtering with WHERE ==

-- Exercise 5
-- Find all Customers located in Germany.
SELECT
    *
FROM
    dbo.Customers
WHERE   
    Country='Germany'

-- Exercise 6
-- Find all Products that cost more than 20.00.
SELECT
    *
FROM
    dbo.Products
WHERE   
    UnitPrice>20

-- Exercise 7
-- Find all Orders placed after 1st January 1997.
-- Column: OrderDate
SELECT
    *
FROM
    dbo.Orders
WHERE
    OrderDate>'1997-01-01'

-- Exercise 8
-- Find all Products where UnitsInStock is 0
-- (i.e. currently out of stock).
SELECT
    *
FROM
    dbo.Products
WHERE
    UnitsInStock=0

-- Exercise 9
-- Find all Customers whose Country is either 'France' or 'Spain'.
-- Hint: IN
SELECT
    *
FROM
    dbo.Customers
WHERE
    Country
IN
    ('France', 'Spain')

-- Exercise 10
-- Find all Products whose ProductName starts with the letter 'C'.
-- Hint: LIKE
SELECT
    *
FROM
    dbo.Products
WHERE
    ProductName LIKE 'C%'


-- == LEVEL 3: Sorting ==

-- Exercise 11
-- List all Suppliers ordered alphabetically by CompanyName.


-- Exercise 12
-- List all Products ordered by UnitPrice from most to least expensive.
-- Hint: DESC


-- Exercise 13
-- List the top 5 most expensive Products (ProductName and UnitPrice only).


-- == LEVEL 4: Combining filters and sorting ==

-- Exercise 14
-- Find all Products in CategoryID 1, ordered by UnitPrice ascending.


-- Exercise 15
-- Show the 3 most recently placed Orders (OrderID, CustomerID, OrderDate).
-- Hint: ORDER BY OrderDate DESC + TOP


-- Exercise 16
-- List Employees (FirstName, LastName, City) who are based in London,
-- sorted by LastName.


-- == LEVEL 5: Aggregation ==

-- Exercise 17
-- Count how many Customers there are in total.
-- Hint: COUNT(*)


-- Exercise 18
-- Find the average UnitPrice of all Products.
-- Hint: AVG


-- Exercise 19
-- Find the total number of Orders placed by each CustomerID.
-- Show CustomerID and the count, ordered by count descending.
-- Hint: GROUP BY, COUNT, ORDER BY


-- Exercise 20
-- Find the average UnitPrice per CategoryID.
-- Only include categories where the average price is above 25.00.
-- Hint: GROUP BY, AVG, HAVING


-- ============================================================
-- ANSWERS - scroll down only after attempting each exercise!
-- ============================================================
-- Ex 1:  SELECT * FROM dbo.Customers
-- Ex 2:  SELECT ProductName, UnitPrice, UnitsInStock FROM dbo.Products
-- Ex 3:  SELECT TOP 10 * FROM dbo.Orders
-- Ex 4:  SELECT DISTINCT Country FROM dbo.Customers
-- Ex 5:  SELECT * FROM dbo.Customers WHERE Country = 'Germany'
-- Ex 6:  SELECT * FROM dbo.Products WHERE UnitPrice > 20.00
-- Ex 7:  SELECT * FROM dbo.Orders WHERE OrderDate > '1997-01-01'
-- Ex 8:  SELECT * FROM dbo.Products WHERE UnitsInStock = 0
-- Ex 9:  SELECT * FROM dbo.Customers WHERE Country IN ('France', 'Spain')
-- Ex 10: SELECT * FROM dbo.Products WHERE ProductName LIKE 'C%'
-- Ex 11: SELECT * FROM dbo.Suppliers ORDER BY CompanyName ASC
-- Ex 12: SELECT * FROM dbo.Products ORDER BY UnitPrice DESC
-- Ex 13: SELECT TOP 5 ProductName, UnitPrice FROM dbo.Products ORDER BY UnitPrice DESC
-- Ex 14: SELECT * FROM dbo.Products WHERE CategoryID = 1 ORDER BY UnitPrice ASC
-- Ex 15: SELECT TOP 3 OrderID, CustomerID, OrderDate FROM dbo.Orders ORDER BY OrderDate DESC
-- Ex 16: SELECT FirstName, LastName, City FROM dbo.Employees WHERE City = 'London' ORDER BY LastName
-- Ex 17: SELECT COUNT(*) AS TotalCustomers FROM dbo.Customers
-- Ex 18: SELECT AVG(UnitPrice) AS AveragePrice FROM dbo.Products
-- Ex 19: SELECT CustomerID, COUNT(*) AS OrderCount FROM dbo.Orders GROUP BY CustomerID ORDER BY OrderCount DESC
-- Ex 20: SELECT CategoryID, AVG(UnitPrice) AS AvgPrice FROM dbo.Products GROUP BY CategoryID HAVING AVG(UnitPrice) > 25.00
