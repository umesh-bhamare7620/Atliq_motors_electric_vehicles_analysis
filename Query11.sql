-- 2 How do government incentives and subsidies impact the adoption rates 
-- of 2-wheelers and 4-wheelers? Which states in India provided most 
-- subsidies

SELECT 
    evss.state, 
    evss.vehicle_category, 
    SUM(evss.electric_vehicles_sold) AS total_sold
FROM 
    electric_vehicle_sales_by_state evss
GROUP BY 
    evss.state, 
    evss.vehicle_category
ORDER BY 
    total_sold DESC;

SELECT 
    evss.state, 
    (SUM(evss.electric_vehicles_sold) / SUM(evss.total_vehicles_sold)) * 100 AS penetration_rate
FROM 
    electric_vehicle_sales_by_state evss
GROUP BY 
    evss.state
ORDER BY 
    penetration_rate DESC
LIMIT 5;
