SELECT DISTINCT Product.maker, Product.model, Product.type
FROM Product INNER JOIN Laptop 
on Laptop.model = Product.model AND Laptop.hd >= 10;

--SELECT DISTINCT Product.maker, Product.model, Product.type
--FROM Product, Laptop 
--where Laptop.model = Product.model AND Laptop.hd >= 10;
--
--SELECT DISTINCT Product.maker, Product.model, Product.type 
--FROM Product where Product.model in 
--(select model from laptop where Laptop.hd >= 10);