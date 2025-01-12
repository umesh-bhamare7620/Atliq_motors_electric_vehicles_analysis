-- 8. What are the peak and low season months for EV sales based on the 
-- data from 2022 to 2024

SELECT 
    MONTH(fyq.date) AS month,
    SUM(evs.electric_vehicles_sold) AS total_sales
FROM 
    dim_date fyq
JOIN 
    electric_vehicle_sales_by_state evs ON fyq.date = evs.date
WHERE 
    fyq.fiscal_year IN (2022, 2023, 2024)
GROUP BY 
    MONTH(fyq.date)
ORDER BY 
    total_sales DESC;
