SELECT DISTINCT Product.maker 
FROM Product where type = 'PC'
and Product.maker NOT IN (	SELECT maker 
 							FROM Product where type = 'laptop')