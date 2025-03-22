WITH CarAvgPositions AS (
    SELECT
        c.class AS car_class,
        r.car AS car_name,
        AVG(r.position) AS average_position,
        COUNT(r.race) AS race_count
    FROM Results r
    JOIN Cars ca ON r.car = ca.name
    JOIN Classes c ON ca.class = c.class
    GROUP BY c.class, r.car
)
SELECT
    cap.car_name,
    cap.car_class,
    cap.average_position,
    cap.race_count,
    c.country as car_country
FROM CarAvgPositions cap
JOIN Classes c ON cap.car_class = c.class
WHERE cap.average_position = (
    SELECT MIN(average_position) 
    FROM CarAvgPositions
)
ORDER BY cap.car_name
LIMIT 1;
