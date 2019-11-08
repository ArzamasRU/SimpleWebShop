select distinct p.maker, pr.price 
from Product as p, printer as pr
where p.model = pr.model 
and pr.color = 'y'
and pr.price = (SELECT MIN(price) FROM Printer where color = 'y')