-- Create fraud detection database
CREATE DATABASE fraud_detection_db;

-- Select the database
USE fraud_detection_db;

-- Create table for fraud transaction data
CREATE TABLE fraud_data (
    user_id INT,
    signup_time DATETIME,
    purchase_time DATETIME,
    purchase_value INT,
    device_id VARCHAR(50),
    source VARCHAR(50),
    browser VARCHAR(50),
    sex CHAR(1),
    age INT,
    ip_address BIGINT,
    class INT
);

-- Count total records in fraud_data table
SELECT COUNT(*) FROM fraud_data;

-- Display all tables in database
SHOW TABLES;

-- Count total records in imported fraud table
SELECT COUNT(*) FROM fraud;

-- Display structure of fraud table
DESCRIBE fraud;

-- Convert signup_time column into DATETIME format
ALTER TABLE fraud_data
MODIFY signup_time DATETIME;

-- Convert purchase_time column into DATETIME format
ALTER TABLE fraud_data
MODIFY purchase_time DATETIME;

-- Count fraud and non-fraud transactions
SELECT class,
       COUNT(*) AS total_transactions
FROM fraud
GROUP BY class;

-- Calculate percentage of fraud transactions
SELECT 
ROUND(
    (SUM(class) * 100.0) / COUNT(*),
    2
) AS fraud_percentage
FROM fraud;

-- Display highest transaction amounts
SELECT user_id,
       purchase_value,
       class
FROM fraud
ORDER BY purchase_value DESC
LIMIT 10;

-- Find highest purchase value in dataset
SELECT MAX(purchase_value) AS highest_purchase
FROM fraud;

-- Calculate average transaction amount
SELECT AVG(purchase_value) AS average_purchase_value
FROM fraud;

-- Count fraud cases by browser
SELECT browser,
       COUNT(*) AS fraud_cases
FROM fraud
WHERE class = 1
GROUP BY browser
ORDER BY fraud_cases DESC;

-- Analyze fraud cases by traffic source
SELECT source,
       COUNT(*) AS fraud_cases
FROM fraud
WHERE class = 1
GROUP BY source
ORDER BY fraud_cases DESC;

-- Count fraud cases based on gender
SELECT sex,
       COUNT(*) AS fraud_cases
FROM fraud
WHERE class = 1
GROUP BY sex;

-- Analyze fraud cases by age
SELECT age,
       COUNT(*) AS fraud_cases
FROM fraud
WHERE class = 1
GROUP BY age
ORDER BY fraud_cases DESC;

-- Detect users making purchases immediately after signup
SELECT user_id,
       signup_time,
       purchase_time,
TIMESTAMPDIFF(
    MINUTE,
    signup_time,
    purchase_time
) AS minutes_taken,
class
FROM fraud
ORDER BY minutes_taken ASC
LIMIT 20;

ALTER TABLE fraud
ADD signup_datetime DATETIME;

ALTER TABLE fraud
ADD purchase_datetime DATETIME;

SET SQL_SAFE_UPDATES = 0;
UPDATE fraud
SET signup_datetime =
STR_TO_DATE(
signup_time,
'%d-%m-%Y %H:%i'
);
UPDATE fraud
SET purchase_datetime =
STR_TO_DATE(
purchase_time,
'%d-%m-%Y %H:%i'
);

SELECT signup_time,
       signup_datetime,
       purchase_time,
       purchase_datetime
FROM fraud
LIMIT 5;


-- Detect extremely fast purchases after signup
SELECT user_id,
TIMESTAMPDIFF(
MINUTE,
signup_datetime,
purchase_datetime
) AS minutes_taken,
purchase_value,
class
FROM fraud
ORDER BY minutes_taken ASC
LIMIT 20;

-- Detect devices used by multiple users
SELECT device_id,
       COUNT(DISTINCT user_id) AS total_users
FROM fraud
GROUP BY device_id
HAVING total_users > 1
ORDER BY total_users DESC;

-- Detect suspicious IP addresses
SELECT ip_address,
       COUNT(*) AS fraud_cases
FROM fraud
WHERE class = 1
GROUP BY ip_address
ORDER BY fraud_cases DESC
LIMIT 20;

-- Categorize users into risk groups based on age
SELECT user_id,
       age,
CASE
    WHEN age < 25 THEN 'HIGH RISK'
    WHEN age BETWEEN 25 AND 40 THEN 'MEDIUM RISK'
    ELSE 'LOW RISK'
END AS risk_level
FROM fraud;

-- Create transaction risk levels using purchase value
SELECT user_id,
       purchase_value,
CASE
    WHEN purchase_value > 1000 THEN 'HIGH RISK'
    WHEN purchase_value > 500 THEN 'MEDIUM RISK'
    ELSE 'LOW RISK'
END AS transaction_risk
FROM fraud;

-- Analyze fraud activity by hour
SELECT 
HOUR(purchase_datetime) AS transaction_hour,
COUNT(*) AS fraud_cases
FROM fraud
WHERE class = 1
GROUP BY transaction_hour
ORDER BY fraud_cases DESC;

-- Detect fraud patterns based on browser and device
SELECT browser,
       device_id,
       COUNT(*) AS fraud_cases
FROM fraud
WHERE class = 1
GROUP BY browser, device_id
ORDER BY fraud_cases DESC
LIMIT 20;

-- Create a simple fraud risk scoring system
SELECT user_id, purchase_value, age,
       source, browser,
( CASE WHEN purchase_value > 1000 THEN 40
    ELSE 10 END
+
CASE WHEN age < 25 THEN 30
    ELSE 10 END
+
CASE WHEN source = 'Ads' THEN 20
    ELSE 5
END
) AS fraud_risk_score
FROM fraud
ORDER BY fraud_risk_score DESC
LIMIT 20;


-- Detect late night suspicious transactions
SELECT user_id,
       purchase_datetime,
       purchase_value,
       class
FROM fraud
WHERE HOUR(purchase_datetime)
BETWEEN 0 AND 4
ORDER BY purchase_value DESC;


