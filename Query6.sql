-- 5 How do the EV sales and penetration rates in Delhi compare to 
-- Karnataka for 2024

SELECT 
    evs.state,
    SUM(evs.electric_vehicles_sold) AS total_ev_sales,
    SUM(evs.total_vehicles_sold) AS total_vehicle_sales,
    ROUND((SUM(evs.electric_vehicles_sold) / SUM(evs.total_vehicles_sold)) * 100, 2) AS penetration_rate
FROM 
    dim_date fyq
JOIN 
    electric_vehicle_sales_by_state evs ON fyq.date = evs.date
WHERE 
    fyq.fiscal_year = 2024
    AND evs.state IN ('Delhi', 'Karnataka')
GROUP BY 
    evs.state
ORDER BY 
    penetration_rate DESC;