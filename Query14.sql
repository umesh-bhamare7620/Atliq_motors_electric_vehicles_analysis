-- 5. Which state of India is ideal to start the manufacturing unit? (Based on 
-- subsidies provided, ease of doing business, stability in governance etc.

SELECT 
    evss.state, 
    SUM(evss.electric_vehicles_sold) AS total_ev_sales, 
    SUM(evss.total_vehicles_sold) AS total_vehicles, 
    ROUND((SUM(evss.electric_vehicles_sold) / SUM(evss.total_vehicles_sold)) * 100, 2) AS ev_penetration_rate
FROM 
    electric_vehicle_sales_by_state evss
GROUP BY 
    evss.state
ORDER BY 
    ev_penetration_rate DESC, total_ev_sales DESC;

SELECT 
    evss.state, 
    evss.vehicle_category, 
    SUM(evss.electric_vehicles_sold) AS total_ev_sales
FROM 
    electric_vehicle_sales_by_state evss
GROUP BY 
    evss.state, 
    evss.vehicle_category
ORDER BY 
    total_ev_sales DESC;
