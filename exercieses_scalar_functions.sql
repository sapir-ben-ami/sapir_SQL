/*
Exercise: From the Employees table, display:
          1. Last name concatenated with its length.
          2. First name concatenated with its length.
          3. Last name reversed, with the first 
             letter uppercase and the rest lowercase.
          Filter for employees who have a manager 
          (based on the ReportsTo column).
*/

SELECT EmployeeID,
		CONCAT(FirstName, ', len of first name is: ', LEN(FirstName)) AS 'FirstName',
		CONCAT(LastName, ', len of last name is: ', LEN(LastName)) AS 'LastName',
		UPPER(SUBSTRING(REVERSE(LastName),1,1)) + LOWER(SUBSTRING((REVERSE(LastName)),2,LEN(LastName))) AS 'ReversedLastName2',
		ReportsTo
FROM Employees
WHERE ReportsTo IS NOT NULL


/*
Exercise: From the Products table, display:
          1. A column named "PRODUCT" containing 
             ProductID and SupplierID combined 
             with the word ' AND ' between them 
          2. A column named "FULL PRICE" with 
             UnitPrice multiplied by 1.165, 
             rounded down to the nearest integer.
          Filter to show only products where 
          the new price is greater than 40.
*/

SELECT ProductID, 
		SupplierID,
		CONCAT('ProductID: ', ProductID, ' and SupplierID: ',SupplierID) AS 'ProductAndSupplier',
		UnitPrice AS 'OriginalUnitPrice',
		FLOOR(UnitPrice*1.165) AS 'NewPrice'
FROM Products
WHERE FLOOR(UnitPrice*1.165) > 40
ORDER BY FLOOR(UnitPrice*1.165)


/*
Exercise: From the Employees table, display the 
          last names in uppercase and the 
          birth dates in YY/MM/DD format. 
          Filter for employees whose last name 
          starts with 'K' or 'D'. 
          Use the SUBSTRING function in the 
          WHERE clause instead of the LIKE operator.
*/

SELECT FirstName + ' ' + LastName AS 'FullName',
		Upper(LastName) AS 'LastNmae',
		SUBSTRING(LastName,1,1) AS 'FirstLetterOfLastName',
		BirthDate AS 'OriginalBirthDate',
		CONCAT(DAY(BirthDate), '/',  MONTH(BirthDate),  '/',  YEAR(BirthDate)) AS 'NewBirthDay'
FROM Employees 
WHERE SUBSTRING(LastName,1,1) IN ('K', 'D')


/*
Exercise: Shipping must occur within 45 days of 
          the order date. For each product, 
          display how many days remain until 
          the mandatory shipping deadline.
*/

SELECT OrderID, CustomerID, OrderDate,ShippedDate,
		DATEADD(DD, 45, OrderDate) AS 'LastDayToSupplay',
		DATEDIFF(DD, OrderDate, ShippedDate) AS 'NumOfPassedDays',
		45-(DATEDIFF(DD, OrderDate, ShippedDate)) AS 'NumLeftDaysToSupplay'
FROM Orders
ORDER BY 45-(DATEDIFF(DD, OrderDate, ShippedDate)) 


/*
Exercise: Display the employee's first name, last name, and a generated username.
          The username should consist of the first 3 letters of the first name 
          followed by the last letter of the last name. 
          The last letter must be uppercase, 
		  and all other letters must be lowercase.
*/

SELECT FirstName, LastName, 
		LOWER(SUBSTRING(FirstName,1,3))+UPPER(SUBSTRING(REVERSE(LastName),1,1)) AS 'Password'
FROM Employees


/*
Exercise: Display the product name, and in an 
          additional column, display the product 
          name again with every '?' character 
          replaced by an empty string (or space).
*/


SELECT ProductID, ProductName,
		REPLACE(ProductName, '?', '-') AS 'ProductNameWithout?'
FROM Products


/*
Exercise: From the Employees table, display the 
          employee's first name, the day of 
          the week they started working 
          (e.g., Sunday, Monday), and the 
          year they started working.
*/

 SELECT EmployeeID,
		FirstName + ' ' + LastName AS 'FullName',
		HireDate,
		day(HireDate) AS 'HireDay',
		MONTH(HireDate) AS 'HireMonth',
		YEAR(HireDate) AS 'HireYear'
 FROM Employees


/*
Exercise: From the Employees table, display the 
          employee's first name and their age.
*/

SELECT EmployeeID, 
		FirstName + ' ' + LastName AS 'FullName',
		BirthDate,
		DATEDIFF(YYYY, BirthDate, GETDATE()) AS 'Age'
FROM Employees
ORDER BY Age DESC


/*
Exercise: Display the category name, the category description, and the position 
          of the character 'e' within the description, starting the search 
          4 characters from the beginning.
*/ 

SELECT CategoryID, CategoryName, Description, 
		CHARINDEX('i', Description, 4) AS 'E_Place_In_First_4_Letters'
FROM Categories


/*
Exercise: Display the employee's first 
name from the Employees table, and in an additional column, 
show the position of the letter 'a' within their name.
*/

SELECT FirstName, CHARINDEX('a', FirstName) AS 'APlaceInFirstName'
FROM Employees


/*
Exercise: Display the first name in lowercase and the last name in uppercase 
          from the Employees table for employees whose ID is between 3 and 7.
*/

SELECT UPPER(FirstName) + ' ' + LOWER(LastName) AS 'FullName'
FROM Employees
WHERE EmployeeID BETWEEN 3 AND 5

/* 
   Task: Display the first word of the product name from the products table.
   Objective: Practice string manipulation and identifying delimiters within a column.
*/

SELECT SUBSTRING(ProductName, 0, CHARINDEX(' ',ProductName + ' ')) AS 'FirstWordInProductName',
		CHARINDEX(' ',ProductName) AS 'SubPlace',
		ProductName
FROM Products
