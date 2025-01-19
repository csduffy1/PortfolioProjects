CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Gender VARCHAR(10),
    JoinDate DATE,
    Country VARCHAR(50),
    Age INT
);

INSERT INTO Customers (CustomerID, Name, Email, Gender, JoinDate, Country, Age)
VALUES
(1, 'John Doe', 'john.doe@email.com', 'Male', '2020-01-01', 'USA', 35),
(2, 'Jane Smith', 'jane@email.com', 'Female', '2019-06-15', 'UK', 29),
(3, 'Chris Johnson', 'chris@email.com', NULL, '2021-03-20', NULL, 40);

CREATE TABLE Transactions (
    TransactionID INT PRIMARY KEY,
    CustomerID INT,
    PurchaseDate DATE,
    Amount DECIMAL(10, 2),
    ProductCategory VARCHAR(50),
    PaymentMethod VARCHAR(20),
    Discount DECIMAL(5, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO Transactions (TransactionID, CustomerID, PurchaseDate, Amount, ProductCategory, PaymentMethod, Discount)
VALUES
(101, 1, '2024-01-01', 50.00, 'Electronics', 'Credit Card', 10.00),
(102, 2, '2024-01-02', 20.00, 'Books', 'Cash', 0.00),
(103, 1, '2024-01-03', -10.00, 'Clothing', 'Credit Card', 5.00);

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

