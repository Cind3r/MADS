-- 1. Find all suppliers who supply a beverage (category).
SELECT sup.CompanyName, sup.SupplierID, c.CategoryName FROM Suppliers sup
INNER JOIN Products p ON p.SupplierID  = sup.SupplierID
INNER JOIN Categories c  ON p.CategoryID = c.CategoryID
WHERE c.CategoryName = 'Beverages'
GROUP BY sup.SupplierID;


-- 2. Find suppliers (print supplier companyname and region) who supplied both condiments and confections (categories).
SELECT sup.SupplierID, sup.CompanyName, sup.Region FROM Suppliers sup
INNER JOIN Products p ON p.SupplierID  = sup.SupplierID
INNER JOIN Categories c  ON p.CategoryID = c.CategoryID
WHERE c.CategoryName = 'Condiments' OR c.CategoryName = 'Confections'
GROUP BY sup.SupplierID
HAVING COUNT(DISTINCT c.CategoryID) > 1;


-- 3. Find all orders (print only orderId, orderdate, Product Name) by customer “Piccolo und mehr” through the employee named  “Michael Suyama”.
SELECT ord.OrderID, ord.OrderDate, p.ProductName FROM Orders ord
INNER JOIN "Order Details" od ON ord.OrderID = od.OrderID
INNER JOIN  Customers c ON c.CustomerID = ord.CustomerID
INNER JOIN Products p ON p.ProductID = od.ProductID
INNER JOIN Employees e on e.EmployeeID = ord.EmployeeID
WHERE c.CompanyName = "Piccolo und mehr" AND e.FirstName ='Michael' AND e.LastName = "Suyama";


-- 4. Count the number of shipments handled by each shipping company. What if you group by year?

SELECT COUNT(OrderID) as NumOrders, o.ShipVia, s.CompanyName FROM Orders o
INNER JOIN Shippers s on s.ShipperID = o.ShipVia
GROUP BY o.ShipVia;


SELECT COUNT(OrderID) as NumOrders, o.ShipVia, s.CompanyName, strftime('%Y', o.OrderDate) AS year FROM Orders o
INNER JOIN Shippers s on s.ShipperID = o.ShipVia
GROUP BY o.ShipVia, year
ORDER BY year, o.ShipVia;

.schema