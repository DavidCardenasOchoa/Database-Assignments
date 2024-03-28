SELECT        Customer.City, [Order].CustomerID, Customer.CustomerName, Products.ProductID, Products.ProductName, Products.ProductCategory, Products.ProductColour, [Order].Quantity, Products.ListPrice
FROM            Customer INNER JOIN
                         [Order] ON Customer.CustomerID = [Order].CustomerID INNER JOIN
                         Products ON [Order].ProductID = Products.ProductID
WHERE        (Customer.City = 'London')
ORDER BY [Order].CustomerID