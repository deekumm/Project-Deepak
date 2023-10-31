CREATE TABLE sales_sample (
    Product_Id INTEGER,
    Region VARCHAR(50),
    Date DATE,
    Sales_Amount NUMERIC
);
INSERT INTO sales_sample 
VALUES
    (201, 'East', '2023-01-01', 3213),
    (202, 'Central', '2023-01-01', 3352),
    (201, 'North', '2023-01-02', 1250),
    (205, 'West', '2023-01-02', 6002),
    (204, 'East', '2023-01-02', 850),
    (205, 'North', '2023-01-02', 1100),
    (201, 'Central', '2023-01-03', 950),
    (204, 'South', '2023-01-03', 1150175),
    (202, 'West', '2023-01-03', 32025),
    (205, 'South', '2023-01-03', 102190);
-- DrillDown
SELECT Region, Product_Id, Date, SUM(Sales_Amount) AS Total_Sales
FROM sales_sample
GROUP BY Region, Product_Id, Date
ORDER BY Region, Product_Id, Date;
--Roll Up
SELECT Product_Id, Region, SUM(Sales_Amount) AS Total_Sales
FROM sales_sample
GROUP BY Product_Id, Region
ORDER BY Product_Id, Region;
--Cube
SELECT Product_Id, Region, Date, SUM(Sales_Amount) AS Total_Sales
FROM sales_sample
GROUP BY CUBE (Product_Id, Region, Date)
ORDER BY Product_Id, Region, Date;
--slice
SELECT Region, Date, SUM(Sales_Amount) AS Total_Sales
FROM sales_sample
WHERE Region = 'East'
GROUP BY Region, Date
ORDER BY Date;
--Dice
SELECT Product_Id, Region, Date, SUM(Sales_Amount) AS Total_Sales
FROM sales_sample
WHERE (Product_Id =201 OR Product_Id = 202) AND (Region = 'East' OR Region = 'West')
GROUP BY Product_Id, Region, Date
ORDER BY Product_Id, Region, Date;




