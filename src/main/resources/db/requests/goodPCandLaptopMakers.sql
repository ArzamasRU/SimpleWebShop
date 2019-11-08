select distinct product.maker
from product 
where exists(	select * from laptop, product as p
			where laptop.model = p.model 
			and p.type = 'Laptop'
			and p.maker = product.maker
			and laptop.speed >= 750)
and exists(	select * from pc, product as p
			where pc.model = p.model 
			and p.type = 'pc'
			and p.maker = product.maker
			and pc.speed >= 750)

--select distinct product.maker
--from product, pc
--where product.model = pc.model
--and product.type = 'PC'
--and pc.speed >= 750
--and exists(	select * from laptop, product as p
--			where p.model = laptop.model
--			and p.type = 'Laptop'
--			and p.maker = product.maker
--			and laptop.speed >= 750)
			
	
