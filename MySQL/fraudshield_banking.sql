SELECT * FROM fraudshield_banking.`fraudshield_banking_data_clean_!`;

-- Which transaction type has the most fraud?

SELECT Transaction_Type,
       COUNT(*) AS Fraud_Cases
FROM fraudshield_banking.`fraudshield_banking_data_clean_!`
WHERE Fraud_Label = 'Fraud'
GROUP BY Transaction_Type
ORDER BY Fraud_Cases DESC;

-- Which merchant category has the most fraud?

SELECT Merchant_Category, COUNT(*) AS Fraud_Cases
FROM fraudshield_banking.`fraudshield_banking_data_clean_!`
WHERE Fraud_Label = 'Fraud'
GROUP BY Merchant_Category
ORDER BY Fraud_Cases DESC;


-- Which locations have the most fraud?

SELECT Transaction_Location, COUNT(*) AS Fraud_Cases
FROM fraudshield_banking.`fraudshield_banking_data_clean_!`
WHERE Fraud_Label = 'Fraud'
GROUP BY Transaction_Location
ORDER BY Fraud_Cases DESC
LIMIT 10;


-- Are new merchants linked to fraud?

SELECT Is_New_Merchant, COUNT(*) AS Fraud_Cases
FROM fraudshield_banking.`fraudshield_banking_data_clean_!`
WHERE Fraud_Label = 'Fraud'
GROUP BY Is_New_Merchant;


-- Does unusual transaction time relate to fraud?

SELECT Unusual_Time_Transaction, COUNT(*) AS Fraud_Cases
FROM fraudshield_banking.`fraudshield_banking_data_clean_!`
WHERE Fraud_Label = 'Fraud'
GROUP BY Unusual_Time_Transaction;


-- Which customers repeatedly commit fraud?

SELECT Customer_ID, COUNT(*) AS Fraud_Cases
FROM fraudshield_banking.`fraudshield_banking_data_clean_!`
WHERE Fraud_Label = 'Fraud'
GROUP BY Customer_ID
HAVING COUNT(*) > 1
ORDER BY Fraud_Cases DESC;


-- Which card type has more fraud?

SELECT Card_Type, COUNT(*) AS Fraud_Cases
FROM fraudshield_banking.`fraudshield_banking_data_clean_!`
WHERE Fraud_Label = 'Fraud'
GROUP BY Card_Type
ORDER BY Fraud_Cases DESC;


-- Which customers have the most failed transactions? 

SELECT Customer_ID, SUM(Failed_Transaction_Count) AS Failed_Transactions
FROM fraudshield_banking.`fraudshield_banking_data_clean_!`
GROUP BY Customer_ID
ORDER BY Failed_Transactions DESC
LIMIT 10;


-- What percentage of transactions are fraudulent?

SELECT ROUND(100 * AVG(Fraud_Label = 'Fraud'), 2) AS Fraud_Rate
FROM fraudshield_banking.`fraudshield_banking_data_clean_!`;

