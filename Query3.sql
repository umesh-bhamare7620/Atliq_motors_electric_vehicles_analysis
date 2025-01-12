-- 2. Identify the top 5 states with the highest penetration rate in 2-wheeler 
-- and 4-wheeler EV sales in FY 2024.


SELECT 
    evs.state,
    evs.vehicle_category,
    ROUND(SUM(evs.electric_vehicles_sold) / SUM(evs.total_vehicles_sold) * 100, 2) AS penetration_rate
FROM 
    dim_date fyq
JOIN 
    electric_vehicle_sales_by_state evs ON fyq.date = evs.date
WHERE 
    fyq.fiscal_year = (2024)
    AND evs.vehicle_category IN ('2-wheelers', '4-wheeler')
GROUP BY 
    evs.state, evs.vehicle_category
ORDER BY 
    penetration_rate DESC
LIMIT 5;