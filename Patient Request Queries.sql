SELECT patient_id,
       age,
       gender,
       diagnosis_code,
       procedure_code,
       provider_type,
       request_date,
       decision_date,
       approval_time_days,
       decision_status,
       prior_conservative_care
  FROM patient_requests;
  
-- -- DATA EXPLORATION

-- Check For Missing Values
SELECT *
FROM patient_requests
WHERE patient_id IS NULL
   OR age IS NULL
   OR gender IS NULL
   OR diagnosis_code IS NULL
   OR procedure_code IS NULL
   OR provider_type IS NULL
   OR request_date IS NULL
   OR decision_date IS NULL
   OR approval_time_days IS NULL
   OR decision_status IS NULL
   OR prior_conservative_care IS NULL;

-- Check For Duplicates
SELECT patient_id, COUNT(*)
FROM patient_requests
GROUP BY patient_id
HAVING COUNT(*) > 1;

-- -- DATA CLEANING

-- Convert request_date and decision_date to date format
SELECT 
  patient_id,
  DATE(request_date) AS req_date_parsed,
  DATE(decision_date) AS dec_date_parsed
FROM patient_requests;

-- Verify approval_time_days matches the actual date difference
SELECT *
FROM patient_requests
WHERE approval_time_days != 
      CAST(julianday(decision_date) - julianday(request_date) AS INTEGER);

-- Check for invalid values      
SELECT *
FROM patient_requests
WHERE age < 25;

--Approval time < 0
SELECT *
FROM patient_requests
WHERE approval_time_days < 0;

-- -- ANALYSIS
-- What is the average time for approval?
SELECT AVG(approval_time_days) AS avg_approval_time
FROM patient_requests
WHERE decision_status = 'Approved'; --  average time (in days) for approved cases only

-- What % of cases were denied?
SELECT 
  ROUND(100.0 * SUM(CASE WHEN decision_status = 'Denied' THEN 1 ELSE 0 END) / COUNT(*), 2) AS percent_denied
FROM patient_requests;

-- How does approval time vary?
SELECT procedure_code, 
       COUNT(*) AS total_cases,
       ROUND(AVG(approval_time_days), 2) AS avg_approval_time
FROM patient_requests
GROUP BY procedure_code; -- By procedure_code

SELECT provider_type, 
       COUNT(*) AS total_cases,
       ROUND(AVG(approval_time_days), 2) AS avg_approval_time
FROM patient_requests
GROUP BY provider_type; -- By provider_type

-- What % of cases had prior conservative care?
SELECT 
  ROUND(100.0 * SUM(CASE WHEN prior_conservative_care = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS percent_with_conservative_care
FROM patient_requests;

-- Are patients without conservative care more likely to be denied?
SELECT 
  prior_conservative_care,
  ROUND(100.0 * SUM(CASE WHEN decision_status = 'Denied' THEN 1 ELSE 0 END) / COUNT(*), 2) AS denial_rate
FROM patient_requests
GROUP BY prior_conservative_care;

-- % Without Conservative Care
SELECT 
  ROUND(100.0 * SUM(CASE WHEN prior_conservative_care = 'No' THEN 1 ELSE 0 END) / COUNT(*), 2) AS no_conservative_care_pct
FROM patient_requests;
