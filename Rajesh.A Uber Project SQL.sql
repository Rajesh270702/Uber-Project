use uber;
SELECT * FROM `rajesh.a uber project` LIMIT 0, 1000;
SELECT
    DATE(`Request timestamp`) AS requested_date,
    COUNT(*) AS total_rides
FROM `rajesh.a uber project`
GROUP BY requested_date
ORDER BY requested_date;
SELECT 
    `Pickup point` AS pickup_point,
    SUM(CASE 
            WHEN Status = 'Cancelled' OR Status = 'No Cars Available' THEN 1 
            ELSE 0 
        END) AS demand_gap,
    COUNT(*) AS total_requests,
    ROUND(
        SUM(CASE 
                WHEN Status = 'Cancelled' OR Status = 'No Cars Available' THEN 1 
                ELSE 0 
            END) * 100.0 / COUNT(*), 2
    ) AS demand_gap_percentage
FROM `rajesh.a uber project`
GROUP BY `Pickup point`
LIMIT 0, 1000;