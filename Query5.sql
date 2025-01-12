-- 4. What are the quarterly trends based on sales volume for the top 5 EV 
-- makers (4-wheelers) from 2022 to 2024?

-- Step 1: Identify Top 5 EV Makers by Sales Volume for 4-wheelers
WITH top_makers AS (
    SELECT 
        evm.maker, 
        SUM(evm.electric_vehicles_sold) AS total_sales
    FROM 
        dim_date fyq
    JOIN 
        electric_vehicle_sales_by_makers evm ON fyq.date = evm.date
    WHERE 
        evm.vehicle_category = '4-wheelers'
        AND fyq.fiscal_year BETWEEN 2022 AND 2024
    GROUP BY 
        evm.maker
    ORDER BY 
        total_sales DESC
    LIMIT 5
)

-- Step 2: Retrieve Quarterly Sales Data for Top 5 Makers
SELECT 
    fyq.fiscal_year,
    fyq.quarter,
    evm.maker,
    SUM(evm.electric_vehicles_sold) AS sales_volume
FROM 
    dim_date fyq
JOIN 
    electric_vehicle_sales_by_makers evm ON fyq.date = evm.date
WHERE 
    evm.vehicle_category = '4-wheelers'
    AND fyq.fiscal_year BETWEEN 2022 AND 2024
    AND evm.maker IN (SELECT maker FROM top_makers) -- Filter for top makers
GROUP BY 
    fyq.fiscal_year, fyq.quarter, evm.maker
ORDER BY 
    fyq.fiscal_year, fyq.quarter, sales_volume DESC;
