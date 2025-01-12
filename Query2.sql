
-- 1. List the top 3 and bottom 3 makers for the fiscal years 2023 and 2024 in 
-- terms of the number of 2-wheelers sold.


SELECT 
    fyq.fiscal_year,
    evm.maker,
    SUM(evm.electric_vehicles_sold) AS total_sales
FROM
    dim_date fyq
        JOIN
    electric_vehicle_sales_by_makers evm ON fyq.date = evm.date
WHERE
    evm.vehicle_category = '2-wheelers'
        AND fyq.fiscal_year IN (2023 , 2024)
GROUP BY fyq.fiscal_year , evm.maker
ORDER BY fyq.fiscal_year , total_sales DESC
LIMIT 3; 


SELECT 
    fyq.fiscal_year,
    evm.maker,
    SUM(evm.electric_vehicles_sold) AS total_sales
FROM
    dim_date fyq
        JOIN
    electric_vehicle_sales_by_makers  evm ON fyq.date = evm.date
WHERE
    evm.vehicle_category = '2-wheelers'
        AND fyq.fiscal_year IN (2023 , 2024)
GROUP BY fyq.fiscal_year , evm.maker
ORDER BY fyq.fiscal_year , total_sales DESC
LIMIT 3;











