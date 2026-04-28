-- Step 1: Count employees by attrition status
SELECT 
    attrition,
    COUNT(*) AS total_employees
FROM hr_data
GROUP BY attrition;

-- Step 2: Calculate overall attrition rate
SELECT 
    ROUND(
        SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS attrition_rate_percent
FROM hr_data;

-- Step 3: Count attrition by department
SELECT 
    department,
    attrition,
    COUNT(*) AS total_employees
FROM hr_data
GROUP BY department, attrition
ORDER BY department, attrition;

-- Step 4: Calculate attrition rate by department
SELECT 
    department,
    ROUND(
        SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS attrition_rate_percent
FROM hr_data
GROUP BY department
ORDER BY attrition_rate_percent DESC;

-- Step 5: Compare average monthly income by attrition status
SELECT 
    attrition,
    ROUND(AVG(monthly_income), 2) AS avg_monthly_income
FROM hr_data
GROUP BY attrition;

-- Step 6: Average salary by department and attrition
SELECT 
    department,
    attrition,
    ROUND(AVG(monthly_income), 2) AS avg_monthly_income
FROM hr_data
GROUP BY department, attrition
ORDER BY department, attrition;

-- Step 7: Attrition count by work-life balance rating
SELECT 
    work_life_balance,
    attrition,
    COUNT(*) AS total_employees
FROM hr_data
GROUP BY work_life_balance, attrition
ORDER BY work_life_balance, attrition;

-- Step 8: Calculate attrition rate by work-life balance
SELECT 
    work_life_balance,
    ROUND(
        SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS attrition_rate_percent
FROM hr_data
GROUP BY work_life_balance
ORDER BY work_life_balance;

-- Step 9: Calculate attrition rate by job satisfaction
SELECT 
    job_satisfaction,
    ROUND(
        SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS attrition_rate_percent
FROM hr_data
GROUP BY job_satisfaction
ORDER BY job_satisfaction;

-- Step 10: Attrition rate by years at company
SELECT 
    years_at_company,
    ROUND(
        SUM(CASE WHEN attrition='Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS attrition_rate_percent
FROM hr_data
GROUP BY years_at_company
ORDER BY years_at_company;

-- Step 11: Attrition rate by tenure group
SELECT 
    CASE 
        WHEN years_at_company <= 2 THEN '0-2 Years'
        WHEN years_at_company <= 5 THEN '3-5 Years'
        WHEN years_at_company <= 10 THEN '6-10 Years'
        ELSE '10+ Years'
    END AS tenure_group,
    
    ROUND(
        SUM(CASE WHEN attrition='Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS attrition_rate_percent

FROM hr_data
GROUP BY tenure_group
ORDER BY attrition_rate_percent DESC;