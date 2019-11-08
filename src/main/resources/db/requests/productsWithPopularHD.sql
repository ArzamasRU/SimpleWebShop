SELECT *
FROM PC, product  
WHERE pc.model = product.model
and	EXISTS (SELECT * FROM PC buff_pc
        	WHERE buff_pc.hd = pc.hd 
        	AND buff_pc.code <> pc.code)