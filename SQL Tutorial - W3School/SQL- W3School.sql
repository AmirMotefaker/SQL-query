-- W3School - Learn SQL
-- SQL (Structured Query Language) is a standard language for storing, manipulating and retrieving data in relational databases.
---------------------------------------
-- SELECT Syntax
SELECT column1, column2, ...
FROM table_name;

SELECT * FROM table_name;

-- SELECT Column Example
SELECT CustomerName, City FROM Customers;

SELECT * FROM Customers;

-----------------------------------------
-- SELECT DISTINCT Syntax
SELECT DISTINCT column1, column2, ...
FROM table_name;

-- SELECT Example Without DISTINCT
SELECT Country FROM Customers;

-- SELECT DISTINCT Examples
SELECT DISTINCT Country FROM Customers;

-- SQL statement lists the number of different (distinct) customer countries:
SELECT COUNT(DISTINCT Country) FROM Customers;

-----------------------------------------
-- WHERE Syntax
SELECT column1, column2, ...
FROM table_name
WHERE condition;

-- SQL statement selects all the customers from the country "Mexico", in the "Customers" table:
SELECT * FROM Customers
WHERE Country='Mexico';
-----------------------------------------
-- ORDER BY Syntax
SELECT column1, column2, ...
FROM table_name
ORDER BY column1, column2, ... ASC|DESC;

-- SQL statement selects all customers from the "Customers" table, sorted by the "Country" column:
SELECT * FROM Customers
ORDER BY Country;

-- SQL statement selects all customers from the "Customers" table, sorted DESCENDING by the "Country" column:
SELECT * FROM Customers
ORDER BY Country DESC;

-- ORDER BY Several Columns Example
-- The following SQL statement selects all customers from the "Customers" table, sorted by the "Country" and the "CustomerName" column.
-- This means that it orders by Country, but if some rows have the same Country, it orders them by CustomerName:
SELECT * FROM Customers
ORDER BY Country, CustomerName;

-- SQL statement selects all customers from the "Customers" table, sorted ascending by the "Country" and descending by the "CustomerName" column:
SELECT * FROM Customers
ORDER BY Country ASC, CustomerName DESC;

----------------------------------------
-- SQL requires single quotes around text values 
SELECT * FROM Customers
WHERE CustomerID=1;

--Operators in The WHERE Clause
-- =	      Equal	
-- >       	Greater than	
-- <	      Less than	
-- >=	      Greater than or equal	
-- <=	      Less than or equal	
-- <>     	Not equal. Note: In some versions of SQL this operator may be written as !=	
-- BETWEEN	Between a certain range	
-- LIKE   	Search for a pattern	
-- IN	      To specify multiple possible values for a column

------------------------------------------
-- AND Syntax
SELECT column1, column2, ...
FROM table_name
WHERE condition1 AND condition2 AND condition3 ...;

-- OR Syntax
SELECT column1, column2, ...
FROM table_name
WHERE condition1 OR condition2 OR condition3 ...;

-- NOT Syntax
SELECT column1, column2, ...
FROM table_name
WHERE NOT condition;

-- SQL statement selects all fields from "Customers" where country is "Germany" AND city is "Berlin":
SELECT * FROM Customers
WHERE Country='Germany' AND City='Berlin';

-- SQL statement selects all fields from "Customers" where city is "Berlin" OR "München":
SELECT * FROM Customers
WHERE City='Berlin' OR City='München';

-- SQL statement selects all fields from "Customers" where country is NOT "Germany":
SELECT * FROM Customers
WHERE NOT Country='Germany';

-- Combining AND, OR and NOT
-- SQL statement selects all fields from "Customers" where country is "Germany" AND city must be "Berlin" OR "München" (use parenthesis to form complex expressions):
SELECT * FROM Customers
WHERE Country='Germany' AND (City='Berlin' OR City='München');

-- SQL statement selects all fields from "Customers" where country is NOT "Germany" and NOT "USA":
SELECT * FROM Customers
WHERE NOT Country='Germany' AND NOT Country='USA';

--------------------------------------------------
-- INSERT INTO Syntax
-- 1. Specify both the column names and the values to be inserted:
INSERT INTO table_name (column1, column2, column3, ...)
VALUES (value1, value2, value3, ...);

-- 2. If you are adding values for all the columns of the table, you do not need to specify the column names in the SQL query. 
-- However, make sure the order of the values is in the same order as the columns in the table. Here, the INSERT INTO syntax would be as follows:
INSERT INTO table_name
VALUES (value1, value2, value3, ...);

-- SQL statement inserts a new record in the "Customers" table:
INSERT INTO Customers (CustomerName, ContactName, Address, City, PostalCode, Country)
VALUES ('Cardinal', 'Tom B. Erichsen', 'Skagen 21', 'Stavanger', '4006', 'Norway');


-- Insert Data Only in Specified Columns
-- SQL statement will insert a new record, but only insert data in the "CustomerName", "City", and "Country" columns (CustomerID will be updated automatically):
INSERT INTO Customers (CustomerName, City, Country)
VALUES ('Cardinal', 'Stavanger', 'Norway');

-----------------------------------------------------
-- SQL NULL Values
-- IS NULL Syntax
SELECT column_names
FROM table_name
WHERE column_name IS NULL;

-- IS NOT NULL Syntax
SELECT column_names
FROM table_name
WHERE column_name IS NOT NULL;

-- The IS NULL Operator
-- SQL lists all customers with a NULL value in the "Address" field:
SELECT CustomerName, ContactName, Address
FROM Customers
WHERE Address IS NULL;

-- Tip: Always use IS NULL to look for NULL values.

-- The IS NOT NULL Operator
-- SQL lists all customers with a value in the "Address" field:
SELECT CustomerName, ContactName, Address
FROM Customers
WHERE Address IS NOT NULL;
-----------------------------------------------------
-- SQL UPDATE Statement
-- UPDATE Syntax
UPDATE table_name
SET column1 = value1, column2 = value2, ...
WHERE condition;

-- SQL statement updates the first customer (CustomerID = 1) with a new contact person and a new city.
UPDATE Customers
SET ContactName = 'Alfred Schmidt', City= 'Frankfurt'
WHERE CustomerID = 1;

-- UPDATE Multiple Records
-- SQL statement will update the ContactName to "Juan" for all records where country is "Mexico":
UPDATE Customers
SET ContactName='Juan'
WHERE Country='Mexico';

-- Update Warning!
-- Be careful when updating records. If you omit the WHERE clause, ALL records will be updated!
UPDATE Customers
SET ContactName='Juan';

-------------------------------------------------
-- SQL DELETE Statement
-- DELETE Syntax
DELETE FROM table_name WHERE condition;

-- SQL statement deletes the customer "Alfreds Futterkiste" from the "Customers" table:
DELETE FROM Customers WHERE CustomerName='Alfreds Futterkiste';

-- Delete All Records
DELETE FROM table_name;
-- SQL statement deletes all rows in the "Customers" table, without deleting the table:
DELETE FROM Customers;
-------------------------------------------------
-- The SQL SELECT TOP Clause

-- SQL Server / MS Access Syntax:
SELECT TOP number|percent column_name(s)
FROM table_name
WHERE condition;

-- MySQL Syntax:
SELECT column_name(s)
FROM table_name
WHERE condition
LIMIT number;

-- SQL statement selects the first three records from the "Customers" table (for SQL Server/MS Access):
SELECT TOP 3 * FROM Customers;
-- SQL statement shows the equivalent example for MySQL:
SELECT * FROM Customers
LIMIT 3;


-- SQL TOP PERCENT Example
-- SQL statement selects the first 50% of the records from the "Customers" table (for SQL Server/MS Access):
SELECT TOP 50 PERCENT * FROM Customers;

-- ADD a WHERE CLAUSE
-- SQL statement selects the first three records from the "Customers" table, where the country is "Germany" (for SQL Server/MS Access):
SELECT TOP 3 * FROM Customers
WHERE Country='Germany';

-- SQL statement shows the equivalent example for MySQL:
SELECT * FROM Customers
WHERE Country='Germany'
LIMIT 3;

-------------------------------------------
-- The SQL MIN() and MAX() Functions
-- MIN() Syntax
SELECT MIN(column_name)
FROM table_name
WHERE condition;

-- MAX() Syntax
SELECT MAX(column_name)
FROM table_name
WHERE condition;

-- SQL statement finds the price of the cheapest product:
SELECT MIN(Price) AS SmallestPrice
FROM Products;

-- SQL statement finds the price of the most expensive product:
SELECT MAX(Price) AS LargestPrice
FROM Products;


-- The SQL COUNT(), AVG() and SUM() Functions
-- COUNT() Syntax
SELECT COUNT(column_name)
FROM table_name
WHERE condition;

-- The AVG() function returns the average value of a numeric column. 
-- AVG() Syntax
SELECT AVG(column_name)
FROM table_name
WHERE condition;

-- The SUM() function returns the total sum of a numeric column. 
-- SUM() Syntax
SELECT SUM(column_name)
FROM table_name
WHERE condition;

-- SQL statement finds the number of products:
SELECT COUNT(ProductID)
FROM Products;

-- SQL statement finds the average price of all products:
SELECT AVG(Price)
FROM Products;


-- SQL statement finds the sum of the "Quantity" fields in the "OrderDetails" table:
SELECT SUM(Quantity)
FROM OrderDetails;
-----------------------------------------------
-- The SQL LIKE Operator
-- LIKE Syntax
SELECT column1, column2, ...
FROM table_name
WHERE columnN LIKE pattern;

-- SQL statement selects all customers with a CustomerName starting with "a":
SELECT * FROM Customers
WHERE CustomerName LIKE 'a%';

-- SQL statement selects all customers with a CustomerName ending with "a":
SELECT * FROM Customers
WHERE CustomerName LIKE '%a';

-- SQL statement selects all customers with a CustomerName that have "or" in any position:
SELECT * FROM Customers
WHERE CustomerName LIKE '%or%';

-- SQL statement selects all customers with a CustomerName that have "r" in the second position:
SELECT * FROM Customers
WHERE CustomerName LIKE '_r%';

-- SQL statement selects all customers with a CustomerName that starts with "a" and are at least 3 characters in length:
SELECT * FROM Customers
WHERE CustomerName LIKE 'a__%';

-- SQL statement selects all customers with a ContactName that starts with "a" and ends with "o":
SELECT * FROM Customers
WHERE ContactName LIKE 'a%o';

-- SQL statement selects all customers with a CustomerName that does NOT start with "a":
SELECT * FROM Customers
WHERE CustomerName NOT LIKE 'a%';
---------------------------------------------
-- SQL Wildcard Characters
-- Using the % Wildcard
-- SQL statement selects all customers with a City starting with "ber":
SELECT * FROM Customers
WHERE City LIKE 'ber%';

-- SQL statement selects all customers with a City containing the pattern "es": 
SELECT * FROM Customers
WHERE City LIKE '%es%';


-- Using the _ Wildcard
-- SQL statement selects all customers with a City starting with any character, followed by "ondon":
SELECT * FROM Customers
WHERE City LIKE '_ondon';

-- SQL statement selects all customers with a City starting with "L", followed by any character, followed by "n", followed by any character, followed by "on":
SELECT * FROM Customers
WHERE City LIKE 'L_n_on';


-- Using the [charlist] Wildcard
-- SQL statement selects all customers with a City starting with "b", "s", or "p":
SELECT * FROM Customers
WHERE City LIKE '[bsp]%';

-- SQL statement selects all customers with a City starting with "a", "b", or "c":
SELECT * FROM Customers
WHERE City LIKE '[a-c]%';

-- Using the [!charlist] Wildcard
-- SQL statements select all customers with a City NOT starting with "b", "s", or "p":
SELECT * FROM Customers
WHERE City LIKE '[!bsp]%';

-- OR:

SELECT * FROM Customers
WHERE City NOT LIKE '[bsp]%';
-------------------------------------------
-- SQL IN Operator

-- IN Syntax
SELECT column_name(s)
FROM table_name
WHERE column_name IN (value1, value2, ...);

-- or:

SELECT column_name(s)
FROM table_name
WHERE column_name IN (SELECT STATEMENT);

-- SQL statement selects all customers that are located in "Germany", "France" or "UK":
SELECT * FROM Customers
WHERE Country IN ('Germany', 'France', 'UK');

-- SQL statement selects all customers that are NOT located in "Germany", "France" or "UK":
SELECT * FROM Customers
WHERE Country NOT IN ('Germany', 'France', 'UK');

-- SQL statement selects all customers that are from the same countries as the suppliers:
SELECT * FROM Customers
WHERE Country IN (SELECT Country FROM Suppliers);

------------------------------------------
-- SQL BETWEEN Operator 
-- The BETWEEN operator selects values within a given range. The values can be numbers, text, or dates.
-- The BETWEEN operator is inclusive: begin and end values are included. 

-- BETWEEN Syntax
SELECT column_name(s)
FROM table_name
WHERE column_name BETWEEN value1 AND value2;

-- SQL statement selects all products with a price between 10 and 20:
SELECT * FROM Products
WHERE Price BETWEEN 10 AND 20;


-- NOT BETWEEN
-- To display the products outside the range of the previous example, use NOT BETWEEN:
SELECT * FROM Products
WHERE Price NOT BETWEEN 10 AND 20;

--BETWEEN with IN Example
-- SQL statement selects all products with a price between 10 and 20. In addition; do not show products with a CategoryID of 1,2, or 3:
SELECT * FROM Products
WHERE Price BETWEEN 10 AND 20
AND CategoryID NOT IN (1,2,3);

-- BETWEEN Text Values
-- SQL statement selects all products with a ProductName between Carnarvon Tigers and Mozzarella di Giovanni:
SELECT * FROM Products
WHERE ProductName BETWEEN 'Carnarvon Tigers' AND 'Mozzarella di Giovanni'
ORDER BY ProductName;

-- SQL statement selects all products with a ProductName between Carnarvon Tigers and Chef Anton's Cajun Seasoning:
SELECT * FROM Products
WHERE ProductName BETWEEN "Carnarvon Tigers" AND "Chef Anton's Cajun Seasoning"
ORDER BY ProductName;

-- NOT BETWEEN Text Values
-- SQL statement selects all products with a ProductName not between Carnarvon Tigers and Mozzarella di Giovanni:
SELECT * FROM Products
WHERE ProductName NOT BETWEEN 'Carnarvon Tigers' AND 'Mozzarella di Giovanni'
ORDER BY ProductName;

-- BETWEEN Dates
-- SQL statement selects all orders with an OrderDate between '01-July-1996' and '31-July-1996':
SELECT * FROM Orders
WHERE OrderDate BETWEEN #07/01/1996# AND #07/31/1996#;
--OR:
SELECT * FROM Orders
WHERE OrderDate BETWEEN '1996-07-01' AND '1996-07-31';

----------------------------------------------------
-- SQL Aliases
-- Alias Column Syntax
SELECT column_name AS alias_name
FROM table_name;

-- Alias Table Syntax
SELECT column_name(s)
FROM table_name AS alias_name;

--Alias for Columns Examples
-- SQL statement creates two aliases, one for the CustomerID column and one for the CustomerName column:
SELECT CustomerID AS ID, CustomerName AS Customer
FROM Customers;

-- SQL statement creates two aliases, one for the CustomerName column and one for the ContactName column. Note: It requires double quotation marks or square brackets if the alias name contains spaces:
SELECT CustomerName AS Customer, ContactName AS [Contact Person]
FROM Customers;

-- SQL statement creates an alias named "Address" that combine four columns (Address, PostalCode, City and Country):
SELECT CustomerName, Address + ', ' + PostalCode + ' ' + City + ', ' + Country AS Address
FROM Customers;


-- SQL statement above to work in MySQL use the following:
SELECT CustomerName, CONCAT(Address,', ',PostalCode,', ',City,', ',Country) AS Address
FROM Customers;


--Alias for Tables Example
-- SQL statement selects all the orders from the customer with CustomerID=4 (Around the Horn). We use the "Customers" and "Orders" tables, and give them the table aliases of "c" and "o" respectively (Here we use aliases to make the SQL shorter):
SELECT o.OrderID, o.OrderDate, c.CustomerName
FROM Customers AS c, Orders AS o
WHERE c.CustomerName='Around the Horn' AND c.CustomerID=o.CustomerID;

-- SQL statement is the same as above, but without aliases:
SELECT Orders.OrderID, Orders.OrderDate, Customers.CustomerName
FROM Customers, Orders
WHERE Customers.CustomerName='Around the Horn' AND Customers.CustomerID=Orders.CustomerID;
