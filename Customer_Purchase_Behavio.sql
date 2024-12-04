--Remove Duplicates
DELETE FROM Transactions
WHERE TransactionID IN (
    SELECT TransactionID
    FROM (
        SELECT TransactionID, ROW_NUMBER() OVER (PARTITION BY CustomerID, PurchaseDate, Amount ORDER BY TransactionID) AS RowNum
        FROM Transactions
    ) AS Temp
    WHERE RowNum > 1
);

-- Replace Missing Values
UPDATE Customers
SET Country = 'Unknown'
WHERE Country IS NULL;

-- Fix inconsistent entries in the Gender column:
UPDATE Customers
SET Gender = CASE 
    WHEN LOWER(Gender) IN ('m', 'male') THEN 'Male'
    WHEN LOWER(Gender) IN ('f', 'female') THEN 'Female'
    ELSE 'Unknown'
END;

--Delete rows with negative amounts:
DELETE FROM Transactions
WHERE Amount < 0;

--Total Revenue by Product Category
SELECT ProductCategory, SUM(Amount) AS TotalRevenue
FROM Transactions
GROUP BY ProductCategory
ORDER BY TotalRevenue DESC;

--Monthly Revenue Trend
SELECT DATE_TRUNC('month', PurchaseDate) AS Month, SUM(Amount) AS MonthlyRevenue
FROM Transactions
GROUP BY DATE_TRUNC('month', PurchaseDate)
ORDER BY Month;

-- Top 5 Customers by Spending
SELECT c.CustomerID, c.Name, SUM(t.Amount) AS TotalSpending
FROM Customers c
JOIN Transactions t ON c.CustomerID = t.CustomerID
GROUP BY c.CustomerID, c.Name
ORDER BY TotalSpending DESC
LIMIT 5;

-- Purchase Distribution by Gender
SELECT c.Gender, COUNT(t.TransactionID) AS NumberOfPurchases, SUM(t.Amount) AS TotalSpent
FROM Customers c
JOIN Transactions t ON c.CustomerID = t.CustomerID
GROUP BY c.Gender;

-- Most Popular Product Categories
SELECT ProductCategory, COUNT(*) AS TotalPurchases
FROM Transactions
GROUP BY ProductCategory
ORDER BY TotalPurchases DESC;

