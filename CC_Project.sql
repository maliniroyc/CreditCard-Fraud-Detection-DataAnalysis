--Insert table

CREATE TABLE cc_data(
Time FLOAT NOT NULL,
V1 FLOAT NOT NULL,
V2 FLOAT NOT NULL,
V3 FLOAT NOT NULL,
V4 FLOAT NOT NULL,
V5 FLOAT NOT NULL,
V6 FLOAT NOT NULL,
V7 FLOAT NOT NULL,
V8 FLOAT NOT NULL,
V9 FLOAT NOT NULL,
V10 FLOAT NOT NULL,
V11 FLOAT NOT NULL,
V12 FLOAT NOT NULL,
V13 FLOAT NOT NULL,
V14 FLOAT NOT NULL,
V15 FLOAT NOT NULL,
V16 FLOAT NOT NULL,
V17 FLOAT NOT NULL,
V18 FLOAT NOT NULL,
V19 FLOAT NOT NULL,
V20 FLOAT NOT NULL,
V21 FLOAT NOT NULL,
V22 FLOAT NOT NULL,
V23 FLOAT NOT NULL,
V24 FLOAT NOT NULL,
V25 FLOAT NOT NULL,
V26 FLOAT NOT NULL,
V27 FLOAT NOT NULL,
V28 FLOAT NOT NULL,
Amount FLOAT NOT NULL,
Class INT NOT NULL);

--Import dataset
COPY cc_data(Time,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11,V12,V13,V14,V15,V16,V17,V18,V19,V20,V21,V22,V23,V24,V25,V26,V27,V28,Amount,Class)
FROM 'C:\\Users\\MALINI\\Desktop\\Fraud CC detection Project\\New Project\\creditcard.csv'
DELIMITER ','
CSV HEADER;


--SQL Profiling--

-- Total Records
SELECT COUNT(*) AS total_records FROM cc_data;

-- Data Types
SELECT column_name, data_type 
FROM information_schema.columns
WHERE table_name = 'cc_data';


-- Missing Values
SELECT 
  SUM(CASE WHEN time IS NULL THEN 1 ELSE 0 END) AS null_time,
  SUM(CASE WHEN amount IS NULL THEN 1 ELSE 0 END) AS null_amount,
  SUM(CASE WHEN class IS NULL THEN 1 ELSE 0 END) AS null_class
FROM cc_data;

-- Value Distribution for Class
SELECT class, COUNT(*) FROM cc_data GROUP BY class;

-- Value Distribution for Class by percent
SELECT class, COUNT(*) AS count,
       ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM cc_data), 4) AS percent
FROM cc_data
GROUP BY class
ORDER BY class;

-- Check ranges for outliers
SELECT 
    MIN(Time) AS min_time, MAX(Time) AS max_time,
    MIN(Amount) AS min_amount, MAX(Amount) AS max_amount
FROM cc_data;


-- Check min & max times (to understand duration coverage)
SELECT MIN(time) AS min_time, MAX(time) AS max_time FROM cc_data;


--Transaction amount statistics using min,max,amount

SELECT 
  MIN(amount) AS min_amount,
  MAX(amount) AS max_amount,
  AVG(amount) AS avg_amount,
  STDDEV(amount) AS std_amount
FROM cc_data;










