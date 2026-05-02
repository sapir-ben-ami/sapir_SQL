/*
EXERCISE: Advanced Filtering with Logic Groups and Range Exclusion
From the 'Products' table, display the Product ID and Product Name for products that:
1. Have a Supplier ID of 8, 16, or 21 OR have a Unit Price less than 10.
2. In all cases, only include products where the Units In Stock is greater than 0 
   and NOT between 10 and 100.
Sort the results by Unit Price in ascending order.
*/

SELECT ProductID, ProductName, SupplierID, UnitPrice, 
		UnitsInStock, UnitsOnOrder, UnitsInStock-UnitsOnOrder AS 'UnitsLeft'
FROM Products
WHERE UnitsInStock-UnitsOnOrder > 0
		AND UnitsInStock-UnitsOnOrder NOT BETWEEN 10 AND 100
		AND (SupplierID IN (8,16,21) 
				OR  (UnitPrice<10))
ORDER BY UnitPrice 


/*
EXERCISE: Complex Filtering with String Lists and Date Arithmetic
From the 'Orders' table, display the Order ID, Employee ID, Order Date, 
Required Date, and Ship Name for orders that meet ALL following criteria:
1. The Employee ID is 7.
2. The Ship Name is one of the following: 'QUICK-Stop', 'Du monde entier', or 'Eastern Connection'.
3. The difference between the Required Date and the Order Date is greater than 20 days.
*/

SELECT OrderID, CustomerID, EmployeeID, ShipName, 
		OrderDate, RequiredDate, DATEDIFF(DD, OrderDate, RequiredDate) AS 'DiffDays'
FROM Orders
WHERE EmployeeID = 7
		AND ShipName IN ('QUICK-Stop', 'Du monde entier', 'Eastern Connection')
		AND DATEDIFF(DD, OrderDate, RequiredDate) > 20


/*
EXERCISE: Complex Filtering with OR Logic
From the 'Employees' table, display the Employee ID, Full Name, Birth Date, and Country
for employees who meet at least one of the following criteria:
1. Their Last Name contains the letter 'K' or 'D'.
2. They were born in the year 1963.
*/

SELECT EmployeeID,
		FirstName + ' ' + LastName AS 'FullName',
		BirthDate,
		Country
FROM Employees
WHERE YEAR(BirthDate) = '1963'
		OR ((LastName LIKE '%K%')
			OR (LastName LIKE '%D%'))
ORDER BY BirthDate ASC, FirstName DESC


/*
EXERCISE: Filtering with Multiple Conditions (AND/OR)
From the 'Products' table, display the Product Name, Unit Price, and Supplier ID
for products that meet both criteria:
1. The price is greater than 30.
2. The Supplier ID is either 1 or 3.
*/

SELECT ProductID, ProductName, UnitPrice, SupplierID
FROM Products
WHERE UnitPrice > 30
	AND SupplierID IN (1,3)
ORDER BY SupplierID ASC, UnitPrice DESC


/*
EXERCISE: Complex Filtering with Patterns and NULLs
From the 'Customers' table, display the Customer ID, Company Name, Country, 
Phone, and Region for all customers who meet both criteria:
1. Their country starts with the letters 'F', 'M', or 'G'.
2. Their Region is NULL.
*/

SELECT CustomerID, CompanyName, Country, Region, Phone
FROM Customers
WHERE Region IS NULL
	AND ((Country LIKE 'G%') 
		OR (Country LIKE 'F%')
		OR (Country LIKE 'M%'))
ORDER BY Country ASC, Phone DESC


/*
EXERCISE: Date Range Filtering and Multi-Level Sorting
From the 'Orders' table, display the Order ID, Customer ID, and Employee ID
for all orders placed between April and May 1997.
Sort the results by Order Date in ascending order, 
with a secondary sort by Customer ID in descending order.
*/

SELECT OrderID, CustomerID, EmployeeID, OrderDate
FROM Orders 
WHERE OrderDate BETWEEN '1997-04-01' AND '1997-05-31'
ORDER BY OrderDate ASC, CustomerID DESC


/*
EXERCISE: Pattern Matching - Specific Character Position
From the 'Products' table, display the Product Name and Category ID
for all products where the letter 'a' is the second-to-last character in the name.
*/

SELECT *
FROM Products
WHERE ProductName LIKE '%a_'


/*
EXERCISE: Pattern Matching - Ending Characters
From the 'Customers' table, display the Company Name and Country 
for all companies whose name ends with the letter 'a'.
*/

SELECT CustomerID, CompanyName, Country
FROM Customers
WHERE CompanyName LIKE '%a'


/*
EXERCISE: Pattern Matching with LIKE
From the 'Categories' table, display all details for categories 
that contain the letter 'o' in their name.
*/

SELECT *
FROM Categories
WHERE CategoryName LIKE '%o%'


/*
EXERCISE: Date Filtering
From the 'Orders' table, display the Order ID, Order Date, and Required Date
for all orders where the Required Date is after October 1996.
*/

SELECT OrderID,
		CustomerID,
		EmployeeID,
		OrderDate,
		RequiredDate
FROM Orders
WHERE RequiredDate > '1996-11-01'
ORDER BY RequiredDate


/*
EXERCISE: Top N Results
From the 'Products' table, display the Product Name and Unit Price 
for the top 3 most expensive products.
*/

SELECT TOP 3 ProductID, ProductName, UnitPrice
FROM Products
ORDER BY UnitPrice DESC


/* 
EXERCISE: Working with NULL Values
From the 'Employees' table, display the First Name and Region for
Employees who do not have a Region assigned.
*/

SELECT EmployeeID, 
		FirstName + ' ' + LastName AS 'FullName',
		Region
FROM Employees
WHERE Region IS NULL


/*
EXERCISE: Filtering and Sorting
From the 'Products' table, display the Product ID, Product Name, and Unit Price
for all products with a price greater than 20.
Sort the results by Unit Price in ascending order.
*/

SELECT ProductID, ProductName, UnitPrice
FROM Products
WHERE UnitPrice > 20
ORDER BY UnitPrice


/*
EXERCISE: Filtering with Multiple Values
From the 'Employees' table, display the Employee ID, First Name, and Last Name 
for employees whose Employee ID is 1, 2, or 5.
*/

SELECT EmployeeID, 
		LastName + ' ' + FirstName AS 'FullName'
FROM Employees
WHERE EmployeeID IN (1, 2, 5)


/*
EXERCISE: Filtering with Excluded Values and Sorting
From the 'Products' table, display the Product ID, Product Name, and Category ID
for all products whose Category ID is NOT 1, 2, or 7.
Sort the results by Category ID in ascending order.
*/
 
SELECT ProductID, ProductName, CategoryID
FROM Products
WHERE CategoryID NOT IN (1,2,7)
ORDER BY CategoryID
