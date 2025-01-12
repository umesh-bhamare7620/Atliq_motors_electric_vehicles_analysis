-- 1. What are the primary reasons for customers choosing 4-wheeler EVs in 
-- 2023 and 2024 (cost savings, environmental concerns, government 
-- incentives)

SELECT 
    evs.state,
    SUM(CASE WHEN evs.vehicle_category = '4-wheelers' THEN evs.electric_vehicles_sold ELSE 0 END) AS sales_2024,
    (SUM(CASE WHEN evs.vehicle_category = '4-wheelers' THEN evs.electric_vehicles_sold ELSE 0 END) * 85000) AS fuel_savings_2024
FROM 
    electric_vehicle_sales_by_state evs
JOIN 
    dim_date fyq ON fyq.date = evs.date
WHERE 
    fyq.fiscal_year IN (2023, 2024)
GROUP BY 
    evs.state
ORDER BY 
    fuel_savings_2024 DESC;
