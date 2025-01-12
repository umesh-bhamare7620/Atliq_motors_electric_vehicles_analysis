-- 6. Your top 3 recommendations for AtliQ Motors

SELECT 
    evss.state, 
    SUM(evss.electric_vehicles_sold) AS total_ev_sales, 
    SUM(evss.total_vehicles_sold) AS total_vehicles, 
    ROUND((SUM(evss.electric_vehicles_sold) / SUM(evss.total_vehicles_sold)) * 100, 2) AS ev_penetration_rate
FROM 
    electric_vehicle_sales_by_state evss
GROUP BY 
    evss.state
ORDER BY 
    ev_penetration_rate DESC, total_ev_sales DESC
LIMIT 3;

