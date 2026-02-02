/* SCRIPT: 00_data_quality_checks.sql
OBJECTIVE: To validate data integrity before financial analysis.
WHY: To avoid reporting false revenue based on flawed data.
*/

-- 1. Check impossible dates (Appointments in the future or very old)
SELECT 
    appointment_date,
    COUNT(*) 
FROM citas_honda
WHERE appointment_date > CURRENT_DATE -- Service appointments of the future
OR appointment_date < '2020-01-01' -- Service quotes too old for this analysis
GROUP BY 1;

-- 2. Validate the consistency of "Billable Hours" (They cannot be negative or zero if there was a charge)
SELECT 
    COUNT(*) AS records_with_error
FROM citas_honda
WHERE billable_hours <= 0;

-- 3. Duplicate analysis (Same car at the same time with the same advisor?)
SELECT 
    advisor_name, 
    appointment_date, 
    car_model, 
    COUNT(*) 
FROM citas_honda
GROUP BY 1, 2, 3
HAVING COUNT(*) > 1;

-- 4. 
SELECT 
    COUNT(*) AS potential_bad_phones
FROM citas_honda
WHERE LENGTH(customer_phone) < 10 
AND customer_phone IS NOT NULL; 