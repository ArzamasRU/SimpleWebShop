WITH a as (
Select model, price from pc
union
Select model, price from laptop
union
Select model, price from printer),
mp as (select max(price) as max_price from a)
Select * from a
where price =  (select max_price from mp)

--WITH model AS (
--	SELECT DISTINCT a.model, a.price
--	FROM (	SELECT price, model
--			FROM PC
--			WHERE price = (SELECT MAX(price) FROM PC)
--			UNION
--			SELECT price, model
--			FROM Laptop 
--			WHERE price = (SELECT MAX(price) FROM Laptop)
--			UNION
--			SELECT price, model
--			FROM Printer
--			WHERE price = (SELECT MAX(price) FROM Printer))
--	AS a)
--SELECT model AS max_model
--FROM model
--WHERE price >= ALL (SELECT MAX(price) FROM PC
--					UNION ALL
--					SELECT MAX(price) FROM Laptop
--					UNION ALL
--					SELECT MAX(price) FROM Printer)
--
--WITH a as (
--Select model, max(price) as max_price from pc group by model
--having max(price) in (select max(price) from pc)
--union
--Select model, max(price) as max_price from laptop group by model
--having max(price) in (select max(price) from laptop)
--union
--Select model, max(price) as max_price from printer group by model
--having max(price) in (select max(price) from printer)),
--b as (
--Select model, max(max_price) as max_price from a group by model
--having max(max_price) in (select max(max_price) from a))
--select model from b
