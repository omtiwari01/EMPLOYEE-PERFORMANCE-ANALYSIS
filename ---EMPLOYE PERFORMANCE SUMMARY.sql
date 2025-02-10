---EMPLOYE PERFORMANCE SUMMARY
USE E_analysis;
SELECT region, performance_level, COUNT(*) AS employee_count
FROM employe
GROUP BY region, performance_level
ORDER BY region, performance_level;

CREATE TABLE employee_performance_summary (
    region VARCHAR(255),
    performance_level VARCHAR(255),
    employee_count INT
);

INSERT INTO employee_performance_summary (region, performance_level, employee_count)
SELECT region, performance_level, COUNT(*) AS employee_count
FROM employe
GROUP BY region, performance_level
ORDER BY region, performance_level;

SELECT * FROM employee_performance_summary;