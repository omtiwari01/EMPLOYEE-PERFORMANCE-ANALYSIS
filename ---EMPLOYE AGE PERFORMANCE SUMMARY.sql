---EMPLOYE AGE PERFORMANCE SUMMARY
USE E_analysis;
SELECT 
    CASE 
        WHEN age < 25 THEN 'Below 25'
        WHEN age BETWEEN 25 AND 35 THEN '25-35'
        WHEN age BETWEEN 36 AND 45 THEN '36-45'
        ELSE 'Above 45'
    END AS age_group,
    performance_level, 
    COUNT(*) AS employee_count
FROM employe
GROUP BY 
    CASE 
        WHEN age < 25 THEN 'Below 25'
        WHEN age BETWEEN 25 AND 35 THEN '25-35'
        WHEN age BETWEEN 36 AND 45 THEN '36-45'
        ELSE 'Above 45'
    END,
    performance_level
ORDER BY age_group, performance_level;

CREATE TABLE employee_age_performance_summary (
    age_group VARCHAR(50),
    performance_level VARCHAR(255),
    employee_count INT
);

INSERT INTO employee_age_performance_summary (age_group, performance_level, employee_count)
SELECT 
    CASE 
        WHEN age < 25 THEN 'Below 25'
        WHEN age BETWEEN 25 AND 35 THEN '25-35'
        WHEN age BETWEEN 36 AND 45 THEN '36-45'
        ELSE 'Above 45'
    END AS age_group,
    performance_level, 
    COUNT(*) AS employee_count
FROM employe
GROUP BY 
    CASE 
        WHEN age < 25 THEN 'Below 25'
        WHEN age BETWEEN 25 AND 35 THEN '25-35'
        WHEN age BETWEEN 36 AND 45 THEN '36-45'
        ELSE 'Above 45'
    END,
    performance_level
ORDER BY age_group, performance_level;

SELECT * FROM employee_age_performance_summary;

