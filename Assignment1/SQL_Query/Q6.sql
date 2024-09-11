SELECT        InStock, Cost, ProductCategory, ProductName
FROM            Products
WHERE        (InStock <> 'yes')
ORDER BY ProductName