SELECT model, price 
FROM PC where model in (select model from Product WHERE maker = 'B') 
UNION
SELECT model, price 
FROM Laptop where model in (select model from Product WHERE maker = 'B') 
UNION
SELECT model, price 
FROM Printer where model in (select model from Product WHERE maker = 'B')

--SELECT a.model, pc.price
--FROM (SELECT model from Product WHERE maker = 'B') AS a 
--join pc on pc.model = a.model
--UNION
--SELECT a.model, printer.price
--FROM (SELECT model from Product WHERE maker = 'B') AS a
--join printer on printer.model = a.model
--UNION
--SELECT a.model, laptop.price
--FROM (SELECT model from Product WHERE maker = 'B') AS a
--join laptop on laptop.model = a.model
--
--SELECT a.model, a.price 
--FROM (SELECT distinct model, price FROM PC 
-- UNION
-- SELECT distinct model, price FROM Laptop
-- UNION
-- SELECT distinct model, price FROM Printer
-- ) AS a JOIN 
-- Product p ON a.model = p.model
--WHERE p.maker = 'B'
--
--WITH models AS (SELECT model FROM Product where maker = 'B')
--SELECT distinct pc.model, pc.price
--FROM models as p JOIN pc ON pc.model = p.model
--union
--SELECT distinct l.model, l.price
--FROM models as p JOIN laptop as l ON l.model = p.model
--union
--SELECT distinct pr.model, pr.price
--FROM models as p JOIN printer as pr ON pr.model = p.model