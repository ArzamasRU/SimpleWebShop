select distinct a.model as model1, b.model as model2, a.speed, a.ram
from pc as a, pc as b
where a.speed = b.speed 
and a.ram = b.ram 
and a.model > b.model
