SELECT vehicle.maker, motorcycle.model 
FROM vehicle 
JOIN motorcycle ON vehicle.model = motorcycle.model
WHERE motorcycle.horsepower > 150
AND motorcycle.price <= 20000
and motorcycle.type = 'Sport'
order by motorcycle.horsepower desc;
