-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.
SELECT product.ProductName, category.CategoryName
FROM Category
JOIN Product
ON category.Id = product.CategoryId;

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.
SELECT [order].id, shipper.CompanyName
FROM Shipper
JOIN [Order]
ON [order].ShipVia = shipper.id
WHERE [order].OrderDate < '2012-08-09';

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.
SELECT product.ProductName, orderdetail.Quantity
FROM Product
JOIN OrderDetail ON orderdetail.ProductId = product.Id
JOIN [Order] ON [order].Id = orderdetail.OrderId
WHERE [order].Id = 10251
ORDER BY product.ProductName;


-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.
SELECT [order].id, [customer].CompanyName, [employee].LastName
FROM [order] 
JOIN [customer], [employee]
WHERE [customer].id = [order].CustomerId AND [order].EmployeeId = [employee].id
