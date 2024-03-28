SELECT        Customer.CustomerName, [Order].TotalPrice
FROM            Customer INNER JOIN
                         [Order] ON Customer.CustomerID = [Order].CustomerID
WHERE        ([Order].TotalPrice < 200)
ORDER BY [Order].TotalPrice DESC