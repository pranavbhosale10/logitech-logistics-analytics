CREATE DATABASE LogiTech_DB;

USE LogiTech_DB;

# Creating WarehouseOperations Table

CREATE TABLE WarehouseOperations (
    Warehouse_ID VARCHAR(20) PRIMARY KEY,
    Warehouse_Capacity_Units INT,
    Current_Inventory_Units INT,
    Inventory_Turnover_Ratio DECIMAL(5,2),
    Order_Fulfilment_Rate DECIMAL(5,2),
    Avg_Pick_Pack_Time_Min DECIMAL(5,2),
    Warehouse_Utilization_Percentage DECIMAL(5,2),
    Labour_Hours_Per_Day DECIMAL(6,2),
    Operational_Cost_Per_Day DECIMAL(10,2)
);

SELECT * FROM WarehouseOperations;

#Interpretations:
-- The WarehouseOperations table contains all key operational information required for warehouse performance analysis.
-- Warehouse_ID is defined as the primary key, ensuring each warehouse record is unique.
-- The table stores information related to capacity, inventory, fulfilment, utilization, labour, pick-pack time, and operational cost.
-- The data types are appropriately assigned, supporting accurate calculations and analysis.


# Data Quality Assessment

SELECT COUNT(*) AS Total_Warehouses
FROM WarehouseOperations;

DESCRIBE WarehouseOperations;

SELECT
SUM(CASE WHEN Warehouse_Capacity_Units IS NULL THEN 1 ELSE 0 END) AS Capacity_NULLs,

SUM(CASE WHEN Current_Inventory_Units IS NULL THEN 1 ELSE 0 END) AS Inventory_NULLs,

SUM(CASE WHEN Inventory_Turnover_Ratio IS NULL THEN 1 ELSE 0 END) AS Turnover_NULLs,

SUM(CASE WHEN Order_Fulfilment_Rate IS NULL THEN 1 ELSE 0 END) AS Fulfilment_NULLs,

SUM(CASE WHEN Avg_Pick_Pack_Time_Min IS NULL THEN 1 ELSE 0 END) AS PickPack_NULLs,

SUM(CASE WHEN Warehouse_Utilization_Percentage IS NULL THEN 1 ELSE 0 END) AS Utilization_NULLs,

SUM(CASE WHEN Labour_Hours_Per_Day IS NULL THEN 1 ELSE 0 END) AS Labour_NULLs,

SUM(CASE WHEN Operational_Cost_Per_Day IS NULL THEN 1 ELSE 0 END) AS Cost_NULLs

FROM WarehouseOperations;

# checking duplicates
SELECT
Warehouse_ID,
COUNT(*) AS Duplicate_Count
FROM WarehouseOperations
GROUP BY Warehouse_ID
HAVING COUNT(*) > 1;

# checking negative values

SELECT *
FROM WarehouseOperations
WHERE Warehouse_Capacity_Units < 0
OR Current_Inventory_Units < 0
OR Inventory_Turnover_Ratio < 0
OR Order_Fulfilment_Rate < 0
OR Avg_Pick_Pack_Time_Min < 0
OR Warehouse_Utilization_Percentage < 0
OR Labour_Hours_Per_Day < 0
OR Operational_Cost_Per_Day < 0;

# Validating Capacity
SELECT *
FROM WarehouseOperations
WHERE Current_Inventory_Units > Warehouse_Capacity_Units;

# Checking Warehouse Utilization Percentage
SELECT *
FROM WarehouseOperations
WHERE Warehouse_Utilization_Percentage > 100;

# Warehouse Capacity Overview

SELECT
    ROUND(AVG(Warehouse_Capacity_Units),2) AS Average_Capacity,
    MIN(Warehouse_Capacity_Units) AS Minimum_Capacity,
    MAX(Warehouse_Capacity_Units) AS Maximum_Capacity
FROM WarehouseOperations;

#Interpretation:
-- The average warehouse capacity is 14,335.32 units.
-- The minimum warehouse capacity is 156 units, while the maximum capacity reaches 134,299 units.
-- The large variation indicates the presence of warehouses operating at different scales.
-- Capacity planning should consider these differences when allocating inventory.

# Warehouse with highest capacity

SELECT
    Warehouse_ID,
    Warehouse_Capacity_Units
FROM WarehouseOperations
ORDER BY Warehouse_Capacity_Units DESC
LIMIT 1;

#Interpretation:
-- PLANT16 has the highest storage capacity with 134,299 units.
-- This warehouse is capable of handling significantly larger inventory volumes.
-- It can be considered a strategic warehouse for large-scale operations.
-- Proper utilization of this warehouse can improve logistics efficiency.

# Warehouse with lowest capacity

SELECT
    Warehouse_ID,
    Warehouse_Capacity_Units
FROM WarehouseOperations
ORDER BY Warehouse_Capacity_Units ASC
LIMIT 1;

#Interpretation:
-- PLANT19 has the smallest warehouse capacity of 156 units.
-- Such a warehouse is suitable for limited storage or specialized inventory.
-- Expansion or operational review may be required if demand increases.
-- Small-capacity warehouses should be allocated inventory carefully.

# Current Invetory Summary
SELECT
    ROUND(AVG(Current_Inventory_Units),2) AS Average_Inventory,
    MIN(Current_Inventory_Units) AS Minimum_Inventory,
    MAX(Current_Inventory_Units) AS Maximum_Inventory
FROM WarehouseOperations;

# Inventory Utilization Ratio

SELECT
    Warehouse_ID,
    Warehouse_Capacity_Units,
    Current_Inventory_Units,
    ROUND(
        (Current_Inventory_Units * 100.0) / Warehouse_Capacity_Units,
        2
    ) AS Calculated_Utilization_Percentage
FROM WarehouseOperations
ORDER BY Calculated_Utilization_Percentage DESC;

#Interpretation:
-- The average inventory level is 8,635.95 units.
-- Inventory ranges from 104 units to 69,792 units across warehouses.
-- Significant differences indicate varying warehouse responsibilities.
-- Inventory levels should be continuously monitored to avoid overstocking and stock shortages.

# Task 3: Analyse Warehouse Capacity Utilization

#Ranking Warehouses by utilization
SELECT
    Warehouse_ID,
    Warehouse_Utilization_Percentage
FROM WarehouseOperations
ORDER BY Warehouse_Utilization_Percentage DESC;

#Warehouses above 80% utilization should be monitored because they are approaching capacity.
SELECT
    Warehouse_ID,
    Warehouse_Utilization_Percentage
FROM WarehouseOperations
WHERE Warehouse_Utilization_Percentage >= 80
ORDER BY Warehouse_Utilization_Percentage DESC;

# Warehouses below 60% utilization are potentially underutilized
SELECT
    Warehouse_ID,
    Warehouse_Utilization_Percentage
FROM WarehouseOperations
WHERE Warehouse_Utilization_Percentage < 60
ORDER BY Warehouse_Utilization_Percentage;


#Categorize Warehouses (CASE Statement)
SELECT
    Warehouse_ID,
    Warehouse_Utilization_Percentage,

    CASE
        WHEN Warehouse_Utilization_Percentage >= 80 THEN 'High Utilization'
        WHEN Warehouse_Utilization_Percentage BETWEEN 60 AND 79.99 THEN 'Moderate Utilization'
        ELSE 'Low Utilization'
    END AS Utilization_Status

FROM WarehouseOperations
ORDER BY Warehouse_Utilization_Percentage DESC;

#Number of Warehouses by Category
SELECT

CASE
    WHEN Warehouse_Utilization_Percentage >=80 THEN 'High'
    WHEN Warehouse_Utilization_Percentage BETWEEN 60 AND 79.99 THEN 'Moderate'
    ELSE 'Low'
END AS Utilization_Category,

COUNT(*) AS Total_Warehouses

FROM WarehouseOperations

GROUP BY Utilization_Category;

# Average Utilization
SELECT

ROUND(AVG(Warehouse_Utilization_Percentage),2)
AS Average_Utilization

FROM WarehouseOperations;

#Interpretation
-- Warehouse utilization ranges from approximately 52% to 83%.
-- PLANT14 shows the highest utilization (82.50%), indicating efficient use of available capacity.
-- Some warehouses operate below 60% utilization, suggesting underutilized storage space.
-- Better inventory distribution can improve overall warehouse efficiency.

#Business Insight:
-- Management should consider transferring inventory from highly utilized warehouses to underutilized warehouses to balance capacity usage.

# Task4: Labour Productivity & Fulfilment Analysis
-- Which warehouses consume the highest labour hours? 

SELECT
    Warehouse_ID,
    Labour_Hours_Per_Day
FROM WarehouseOperations
ORDER BY Labour_Hours_Per_Day DESC;

-- What is the average labour requirement across all warehouses? 
SELECT
ROUND(AVG(Labour_Hours_Per_Day),2)
AS Average_Labour_Hours
FROM WarehouseOperations;

-- Highest Labour Warehouse
SELECT
Warehouse_ID,
Labour_Hours_Per_Day
FROM WarehouseOperations
ORDER BY Labour_Hours_Per_Day DESC
LIMIT 1;

#Interpretation:
-- PLANT16 records the highest labour requirement at 139 labour hours per day.
-- Other warehouses such as PLANT01, PLANT13, PLANT03, and PLANT14 also require relatively high labour.
-- High labour consumption may indicate increased operational workload or lower process efficiency.
-- Labour utilization should be optimized to reduce operational costs.

#Business Insight:
-- Warehouse managers should evaluate automation opportunities and workflow improvements for high-labour warehouses.

-- Lowest Labour Warehouse
SELECT
Warehouse_ID,
Labour_Hours_Per_Day
FROM WarehouseOperations
ORDER BY Labour_Hours_Per_Day ASC
LIMIT 1;

-- Which warehouses require more labour than the company average?
SELECT
Warehouse_ID,
Labour_Hours_Per_Day
FROM WarehouseOperations
WHERE Labour_Hours_Per_Day >
(
SELECT AVG(Labour_Hours_Per_Day)
FROM WarehouseOperations
)
ORDER BY Labour_Hours_Per_Day DESC;

-- Analyse Order fulfilment
SELECT
Warehouse_ID,
Order_Fulfilment_Rate
FROM WarehouseOperations
ORDER BY Order_Fulfilment_Rate DESC;

-- Analyse Warehouses with Excellent Fulfilment

SELECT
Warehouse_ID,
Order_Fulfilment_Rate
FROM WarehouseOperations
WHERE Order_Fulfilment_Rate >=95
ORDER BY Order_Fulfilment_Rate DESC;

-- Fulfilment Performance Category (CASE)
SELECT

Warehouse_ID,

Order_Fulfilment_Rate,

CASE

WHEN Order_Fulfilment_Rate >=95
THEN 'Excellent'

WHEN Order_Fulfilment_Rate BETWEEN 85 AND 94.99
THEN 'Good'

ELSE 'Needs Improvement'

END AS Performance_Status

FROM WarehouseOperations

ORDER BY Order_Fulfilment_Rate DESC;

-- Count Warehouses by Fulfilment Category
SELECT

CASE

WHEN Order_Fulfilment_Rate >=95
THEN 'Excellent'

WHEN Order_Fulfilment_Rate BETWEEN 85 AND 94.99
THEN 'Good'

ELSE 'Needs Improvement'

END AS Performance,

COUNT(*) AS Total_Warehouses

FROM WarehouseOperations

GROUP BY Performance;

#Interpretation:
-- Most warehouses achieve an Excellent fulfilment rating with fulfilment rates close to 100%.
-- Only PLANT08 falls under the Needs Improvement category with a fulfilment rate of 82.19%.
-- High fulfilment performance indicates an efficient order processing system.
-- Underperforming warehouses should be investigated to identify operational bottlenecks.

-- Compare Labour vs Fulfilment
 SELECT

Warehouse_ID,

Labour_Hours_Per_Day,

Order_Fulfilment_Rate

FROM WarehouseOperations

ORDER BY Labour_Hours_Per_Day DESC;

-- best-performing warehouses using SQL View
CREATE VIEW High_Performance_Warehouses AS

SELECT

Warehouse_ID,
Warehouse_Utilization_Percentage,
Order_Fulfilment_Rate,
Labour_Hours_Per_Day

FROM WarehouseOperations

WHERE Warehouse_Utilization_Percentage >=75
AND Order_Fulfilment_Rate >=95;

SELECT * FROM High_Performance_Warehouses;

# Task 5: Study Pick-Pack Time

-- What is the average, minimum, and maximum pick-pack time across all warehouses?
SELECT
    ROUND(AVG(Avg_Pick_Pack_Time_Min),2) AS Average_PickPack_Time,
    MIN(Avg_Pick_Pack_Time_Min) AS Minimum_PickPack_Time,
    MAX(Avg_Pick_Pack_Time_Min) AS Maximum_PickPack_Time
FROM WarehouseOperations;

#Interpretation:
-- Several warehouses are classified as Average, while others fall into the Needs Improvement category.
-- Warehouses with pick-pack times above 25 minutes require process optimization.
-- Longer pick-pack times may negatively impact delivery speed and customer satisfaction.
-- Improving warehouse layout and employee workflow can reduce processing time.

#Business Insight:
-- Reducing pick-pack time can improve warehouse productivity and enhance overall logistics performance.

-- Fastest Warehouse
SELECT
    Warehouse_ID,
    Avg_Pick_Pack_Time_Min
FROM WarehouseOperations
ORDER BY Avg_Pick_Pack_Time_Min ASC
LIMIT 1;

-- Slowest Warehouse
SELECT
    Warehouse_ID,
    Avg_Pick_Pack_Time_Min
FROM WarehouseOperations
ORDER BY Avg_Pick_Pack_Time_Min DESC
LIMIT 1;

#Interpretation:
-- The identified warehouses have pick-pack times above the organizational average.
-- These warehouses also exhibit relatively higher labour requirements in several cases.
-- High processing times indicate opportunities for operational improvement.


-- Which warehouses have pick-pack times above the company average?
SELECT
    Warehouse_ID,
    Avg_Pick_Pack_Time_Min
FROM WarehouseOperations
WHERE Avg_Pick_Pack_Time_Min >
(
    SELECT AVG(Avg_Pick_Pack_Time_Min)
    FROM WarehouseOperations
)
ORDER BY Avg_Pick_Pack_Time_Min DESC;

-- Pick-Pack Performance Category (CASE)
SELECT
    Warehouse_ID,
    Avg_Pick_Pack_Time_Min,

    CASE
        WHEN Avg_Pick_Pack_Time_Min <= 15 THEN 'Excellent'
        WHEN Avg_Pick_Pack_Time_Min BETWEEN 15.01 AND 25 THEN 'Average'
        ELSE 'Needs Improvement'
    END AS PickPack_Performance

FROM WarehouseOperations
ORDER BY Avg_Pick_Pack_Time_Min;

-- Which performance categories contain more than two warehouses?

SELECT

CASE
    WHEN Avg_Pick_Pack_Time_Min <=15 THEN 'Excellent'
    WHEN Avg_Pick_Pack_Time_Min BETWEEN 15.01 AND 25 THEN 'Average'
    ELSE 'Needs Improvement'
END AS Performance,

COUNT(*) AS Total_Warehouses

FROM WarehouseOperations
GROUP BY Performance
HAVING COUNT(*) > 2;

-- Warehouse managers frequently review slow-performing warehouses.
CREATE VIEW Slow_Warehouses AS

SELECT
    Warehouse_ID,
    Avg_Pick_Pack_Time_Min,
    Labour_Hours_Per_Day,
    Order_Fulfilment_Rate

FROM WarehouseOperations

WHERE Avg_Pick_Pack_Time_Min >
(
    SELECT AVG(Avg_Pick_Pack_Time_Min)
    FROM WarehouseOperations
);

SELECT * FROM Slow_Warehouses;


#Business Recommendations

-- Improve utilization of underused warehouses by redistributing inventory.
-- Investigate high-labour warehouses to optimize workforce allocation.
-- Reduce pick-pack time through warehouse layout optimization and automation.
-- Continuously monitor fulfilment performance to maintain customer satisfaction.
-- Allocate inventory based on warehouse capacity to improve storage efficiency.
-- Conduct periodic warehouse performance reviews using operational KPIs.
-- Focus improvement initiatives on warehouses identified as "Needs Improvement."