SELECT AVG(price) FROM (
	SELECT price FROM pc WHERE model IN
		(SELECT model FROM product WHERE maker = 'A' AND type='PC')
	UNION ALL
	SELECT price FROM laptop WHERE model IN
		(SELECT model FROM product WHERE maker = 'A' AND type='Laptop')
	) as prod
