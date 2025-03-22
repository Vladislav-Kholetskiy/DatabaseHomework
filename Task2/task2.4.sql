WITH ClassAvgPositions AS (
    SELECT
        c.class AS car_class,
        AVG(r.position) AS avg_class_position
    FROM Results r
    JOIN Cars ca ON r.car = ca.name
    JOIN Classes c ON ca.class = c.class
    GROUP BY c.class
    HAVING COUNT(DISTINCT ca.name) >= 2
),
CarAvgPositions AS (
    SELECT
        c.class AS car_class,
        ca.name AS car_name,
        AVG(r.position) AS average_position,
        COUNT(r.race) AS race_count,
        cl.country
    FROM Results r
    JOIN Cars ca ON r.car = ca.name
    JOIN Classes c ON ca.class = c.class
    JOIN Classes cl ON c.class = cl.class
    GROUP BY c.class, ca.name, cl.country
)
SELECT
    cap.car_name,
    cap.car_class,
    cap.average_position,
    cap.race_count,
    cap.country as car_country
FROM CarAvgPositions cap
JOIN ClassAvgPositions cap_total ON cap.car_class = cap_total.car_class
WHERE cap.average_position < cap_total.avg_class_position
ORDER BY cap.car_class, cap.average_position;
