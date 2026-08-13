-- =========================================================
-- FraudShield Banking Analytics Project
-- MySQL Analysis
-- =========================================================

-- Select database
USE fraudshield_banking;

-- =========================================================
-- 1. Dataset Overview
-- =========================================================

SELECT *
FROM fraudshield_banking_data_clean_
LIMIT 10;

-- =========================================================
-- 2. Total Number of Transactions
-- =========================================================

SELECT
    COUNT(*) AS Total_Transactions
FROM fraudshield_banking_data_clean_;

-- =========================================================
-- 3. Fraud Analysis
-- =========================================================

-- Fraud analysis queries will be added here.

-- =========================================================
-- 4. Fraud by Transaction Type
-- =========================================================

SELECT
    Transaction_Type,
    COUNT(*) AS Transaction_Count
FROM fraudshield_banking_data_clean_
GROUP BY Transaction_Type
ORDER BY Transaction_Count DESC;

-- =========================================================
-- 5. Fraud by Merchant Category
-- =========================================================

SELECT
    Merchant_Category,
    COUNT(*) AS Transaction_Count
FROM fraudshield_banking_data_clean_
GROUP BY Merchant_Category
ORDER BY Transaction_Count DESC;

-- =========================================================
-- 6. Transaction Amount Analysis
-- =========================================================

SELECT
    ROUND(SUM(`Transaction_Amount(inMillion)`), 2) AS Total_Transaction_Value,
    ROUND(AVG(`Transaction_Amount(inMillion)`), 2) AS Average_Transaction_Value,
    ROUND(MAX(`Transaction_Amount(inMillion)`), 2) AS Maximum_Transaction_Value
FROM fraudshield_banking_data_clean_;

-- =========================================================
-- 7. Transactions by Location
-- =========================================================

SELECT
    Transaction_Location,
    COUNT(*) AS Transaction_Count
FROM fraudshield_banking_data_clean_
GROUP BY Transaction_Location
ORDER BY Transaction_Count DESC;

-- =========================================================
-- 8. High-Value Transactions
-- =========================================================

SELECT
    Transaction_ID,
    Customer_ID,
    `Transaction_Amount(inMillion)`,
    Transaction_Type,
    Merchant_Category,
    Transaction_Location
FROM fraudshield_banking_data_clean_
ORDER BY `Transaction_Amount(inMillion)` DESC
LIMIT 10;
