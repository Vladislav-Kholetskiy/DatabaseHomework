select vehicle.maker, vehicle.model, car.horsepower, car.engine_capacity, vehicle.type as vehicle_type
from vehicle
join car on vehicle.model = car.model
where vehicle.type = 'Car'
and car.horsepower > 150
and car.engine_capacity < 3
and car.price < 35000

union 

select vehicle.maker, vehicle.model, motorcycle.horsepower, motorcycle.engine_capacity, vehicle.type as vehicle_type
from vehicle
join motorcycle on vehicle.model = motorcycle.model
where vehicle.type = 'Motorcycle'
and motorcycle.horsepower > 150
and motorcycle.engine_capacity < 1.5
and motorcycle.price < 20000

UNION 

select vehicle.maker, vehicle.model, NULL AS horsepower, NULL AS engine_capacity, vehicle.type as vehicle_type
from vehicle
join bicycle on vehicle.model = bicycle.model
where vehicle.type = 'Bicycle'
and bicycle.gear_count > 18
and bicycle.price < 4000

ORDER BY horsepower desc nulls last;