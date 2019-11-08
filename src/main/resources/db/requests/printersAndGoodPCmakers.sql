--select distinct product.maker
--from product, pc
--where product.type = 'PC'
--and product.model = pc.model
--and pc.ram = (select min(ram) from pc)
--and pc.speed = (select max(speed) from pc 
--				where ram = (select min(ram) from pc))
--and exists(	select * from product p
--			where p.type = 'Printer'
--			and p.maker = product.maker)
			
with pr_makers as (	select distinct maker from product
					where type = 'Printer'),
makers_models as (	select distinct maker, model from product
					where maker in (select maker from pr_makers)
					and type = 'pc'),
min_ram_models as (	select maker, pc.model, speed 
					from pc, makers_models
					where pc.model = makers_models.model
					and ram = (	select min(ram) from pc, makers_models
								where pc.model = makers_models.model))
select distinct maker from min_ram_models 
where speed = (select max(speed) from min_ram_models)

