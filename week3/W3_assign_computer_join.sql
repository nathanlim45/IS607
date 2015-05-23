--Check the cpu of each laptop model using the foreign key
SELECT model.name, cpu.model, cpu.speed, cpu.brand, cpu.price AS "CPU price" FROM model 
INNER JOIN cpu ON model.cpu_id=cpu.cpu_id;

--Check the brand and os of each laptop model using the foreign key
SELECT model.name, l.name AS "company", l.country, os.name AS "OperationSystem"
FROM model INNER JOIN laptop_brand l ON model.brand_id=l.brand_id 
INNER JOIN os ON model.os_id=os.os_id