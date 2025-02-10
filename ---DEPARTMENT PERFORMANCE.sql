---DEPARTMENT PERFORMANCE
SELECT department, performance_level, COUNT(*) AS employee_count
FROM employe
GROUP BY department, performance_level
ORDER BY department, performance_level;

USE E_analysis;
CREATE TABLE department_performance (
    department VARCHAR(50),
    performance_level VARCHAR(10),
    employee_count INT
);

INSERT INTO department_performance (department, performance_level, employee_count)
SELECT department, performance_level, COUNT(*) AS employee_count
FROM employe
GROUP BY department, performance_level;

SELECT * FROM department_performance;