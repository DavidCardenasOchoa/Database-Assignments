SELECT        [Order].OrderID, Customer.CustomerName, Products.ProductID, Products.ProductName, [Order].ShippingDate, [Order].Completed
FROM            Customer INNER JOIN
                         [Order] ON Customer.CustomerID = [Order].CustomerID INNER JOIN
                         Products ON [Order].ProductID = Products.ProductID
WHERE        ([Order].Completed <> 'yes')
ORDER BY [Order].OrderID