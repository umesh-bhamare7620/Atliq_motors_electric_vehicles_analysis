-- 6 List down the compounded annual growth rate (CAGR) in 4-wheeler 
-- units for the top 5 makers from 2022 to 2024

SELECT 
    evs.maker,
    SUM(CASE WHEN fyq.fiscal_year = 2022 THEN evs.electric_vehicles_sold ELSE 0 END) AS sales_2022,
    SUM(CASE WHEN fyq.fiscal_year = 2024 THEN evs.electric_vehicles_sold ELSE 0 END) AS sales_2024,
    ROUND(
        (POW(SUM(CASE WHEN fyq.fiscal_year = 2024 THEN evs.electric_vehicles_sold ELSE 0 END) / 
        SUM(CASE WHEN fyq.fiscal_year = 2022 THEN evs.electric_vehicles_sold ELSE 0 END), 1/2) - 1) * 100, 2) AS CAGR
FROM 
    dim_date fyq
JOIN 
    electric_vehicle_sales_by_makers evs ON fyq.date = evs.date
WHERE 
    evs.vehicle_category = '4-wheeler'
    AND fyq.fiscal_year IN (2022, 2024)
GROUP BY 
    evs.maker
ORDER BY 
    CAGR DESC
LIMIT 5;