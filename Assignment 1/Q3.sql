SELECT CustomerName, ProductName 
FROM [order] AS A INNER JOIN Customer 
ON A.CustomerID=Customer.CustomerID
INNER JOIN Products ON A.ProductID=Products.ProductID
Inner join Review ON A.ReviewID=review.ReviewID
Where Rating=4