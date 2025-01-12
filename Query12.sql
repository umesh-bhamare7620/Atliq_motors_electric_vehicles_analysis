-- 3 How does the availability of charging stations infrastructure correlate 
-- with the EV sales and penetration rates in the top 5 states

WITH TopStates AS (
    SELECT 
        state,
        SUM(electric_vehicles_sold) AS total_evs_sold
    FROM 
        electric_vehicle_sales_by_state
    GROUP BY 
        state
    ORDER BY 
        total_evs_sold DESC
    LIMIT 5
)
SELECT 
    evss.state,
    COUNT(DISTINCT evss.vehicle_category) AS estimated_charging_stations,
    SUM(evss.electric_vehicles_sold) AS total_evs_sold,
    ROUND((SUM(evss.electric_vehicles_sold) / SUM(evss.total_vehicles_sold)) * 100, 2) AS penetration_rate
FROM 
    electric_vehicle_sales_by_state evss
WHERE 
    evss.state IN (SELECT state FROM TopStates)
GROUP BY 
    evss.state
ORDER BY 
    total_evs_sold DESC;
