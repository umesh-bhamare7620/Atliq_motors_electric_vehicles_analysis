
-- 4. Who should be the brand ambassador if AtliQ Motors launches their 
-- EV/Hybrid vehicles in India and why?

SELECT 
    evss.vehicle_category, 
    SUM(evss.electric_vehicles_sold) AS total_sold
FROM 
    electric_vehicle_sales_by_state evss
GROUP BY 
    evss.vehicle_category
ORDER BY 
    total_sold DESC;
