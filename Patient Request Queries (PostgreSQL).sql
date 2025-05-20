SELECT 
    patient_id,
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
SELECT patient_id, COUNT(*) AS count
FROM patient_requests
GROUP BY patient_id
HAVING COUNT(*) > 1;


-- -- DATA CLEANING

-- Convert request_date and decision_date to date format
SELECT 
    patient_id,
    request_date::DATE AS req_date_parsed,
    decision_date::DATE AS dec_date_parsed
FROM patient_requests;

-- Validate approval_time_days with date difference
SELECT *
FROM patient_requests
WHERE approval_time_days != (decision_date::DATE - request_date::DATE);

-- Check for invalid age values      
SELECT *
FROM patient_requests
WHERE age < 25;


-- Check for negative approval times
SELECT *
FROM patient_requests
WHERE approval_time_days < 0;


-- -- ANALYSIS
-- What is the average time for approval?
SELECT 
    ROUND(AVG(approval_time_days), 2) AS avg_approval_time
FROM patient_requests
WHERE decision_status = 'Approved';

-- What % of cases were denied?
SELECT 
    ROUND(100.0 * COUNT(*) FILTER (WHERE decision_status = 'Denied') / COUNT(*), 2) AS percent_denied
FROM patient_requests;

-- How does approval time vary?
SELECT 
    procedure_code, 
    COUNT(*) AS total_cases,
    ROUND(AVG(approval_time_days), 2) AS avg_approval_time
FROM patient_requests
GROUP BY procedure_code; -- By procedure_code

SELECT 
    provider_type, 
    COUNT(*) AS total_cases,
    ROUND(AVG(approval_time_days), 2) AS avg_approval_time
FROM patient_requests
GROUP BY provider_type; -- By provider_type

-- What % of cases had prior conservative care?
SELECT 
    ROUND(100.0 * COUNT(*) FILTER (WHERE prior_conservative_care = 'Yes') / COUNT(*), 2) AS percent_with_conservative_care
FROM patient_requests;

-- % Without Conservative Care
SELECT 
    ROUND(100.0 * COUNT(*) FILTER (WHERE prior_conservative_care = 'No') / COUNT(*), 2) AS no_conservative_care_pct
FROM patient_requests;

-- Are patients without conservative care more likely to be denied?(Denial Rate by Prior Conservative Care)
SELECT 
    prior_conservative_care,
    ROUND(100.0 * COUNT(*) FILTER (WHERE decision_status = 'Denied') / COUNT(*), 2) AS denial_rate
FROM patient_requests
GROUP BY prior_conservative_care;
