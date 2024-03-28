Select CustomerName, PostalCode, ProductName
From [order] as a inner join customer 
on a.customerid=Customer.CustomerID 
inner join products 
on a.productid=products.productid
where city<>'Toronto'
Order by CustomerName