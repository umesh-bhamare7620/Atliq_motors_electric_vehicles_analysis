-- 3. List the states with negative penetration (decline) in EV sales from 2022 
-- to 2024

SELECT  
    sales_comparison.state, 
    sales_comparison.vehicle_category, 
    (sales_comparison.sales_2024 - sales_comparison.sales_2022) AS sales_difference, 
    ROUND(((sales_comparison.sales_2024 - sales_comparison.sales_2022) / sales_comparison.sales_2022) * 100, 2) AS percentage_change
FROM 
    (SELECT  
         evs.state, 
         evs.vehicle_category, 
         SUM(CASE WHEN fyq.fiscal_year = 2022 THEN evs.electric_vehicles_sold ELSE 0 END) AS sales_2022, 
         SUM(CASE WHEN fyq.fiscal_year = 2024 THEN evs.electric_vehicles_sold ELSE 0 END) AS sales_2024
     FROM 
         dim_date fyq 
     JOIN 
         electric_vehicle_sales_by_state evs ON fyq.date = evs.date 
     WHERE 
         fyq.fiscal_year IN (2022, 2024) 
     GROUP BY 
         evs.state, evs.vehicle_category
    ) AS sales_comparison
WHERE 
    sales_comparison.sales_2024 < sales_comparison.sales_2022
ORDER BY 
    percentage_change ASC 
LIMIT 0, 200;