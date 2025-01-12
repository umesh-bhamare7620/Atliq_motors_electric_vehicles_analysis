-- 7. List down the top 10 states that had the highest compounded annual 
-- growth rate (CAGR) from 2022 to 2024 in total vehicles sold

SELECT 
    evs.state,
    SUM(CASE WHEN fyq.fiscal_year = 2022 THEN evs.total_vehicles_sold ELSE 0 END) AS sales_2022,
    SUM(CASE WHEN fyq.fiscal_year = 2024 THEN evs.total_vehicles_sold ELSE 0 END) AS sales_2024,
    ROUND(
        (POW(SUM(CASE WHEN fyq.fiscal_year = 2024 THEN evs.total_vehicles_sold ELSE 0 END) / 
        SUM(CASE WHEN fyq.fiscal_year = 2022 THEN evs.total_vehicles_sold ELSE 0 END), 1/2) - 1) * 100, 2) AS CAGR
FROM 
    dim_date fyq
JOIN 
    electric_vehicle_sales_by_state evs ON fyq.date = evs.date
WHERE 
    fyq.fiscal_year IN (2022, 2024)
GROUP BY 
    evs.state
ORDER BY 
    CAGR DESC
LIMIT 10;
