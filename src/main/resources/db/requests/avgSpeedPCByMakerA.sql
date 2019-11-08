select AVG(speed) from pc 
where pc.model in (select model from product as p where p.maker = 'A')