SELECT maker, count(model)
FROM Product where type = 'pc'
GROUP BY maker having count(model) >= 3