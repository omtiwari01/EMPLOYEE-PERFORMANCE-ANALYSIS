--- Recruitment performance analysis

USE E_analysis;
SELECT 
    recruitment_channel, 
    AVG(avg_training_score) AS avg_score,
    AVG(CAST(KPIs_met_more_than_80 AS FLOAT)) AS kpi_success_rate,
    AVG(CAST(awards_won AS FLOAT)) AS avg_awards,
    COUNT(employee_id) AS total_employees
FROM employe
GROUP BY recruitment_channel
ORDER BY avg_score DESC;

USE E_analysis;

CREATE TABLE recruitment_performance_analysis (
    recruitment_channel VARCHAR(255) PRIMARY KEY,
    avg_score FLOAT,
    kpi_success_rate FLOAT,
    avg_awards FLOAT,
    total_employees INT
);

INSERT INTO recruitment_performance_analysis (recruitment_channel, avg_score, kpi_success_rate, avg_awards, total_employees)
SELECT 
    recruitment_channel, 
    AVG(avg_training_score) AS avg_score,
    AVG(CAST(KPIs_met_more_than_80 AS FLOAT)) AS kpi_success_rate,
    AVG(CAST(awards_won AS FLOAT)) AS avg_awards,
    COUNT(employee_id) AS total_employees
FROM employe
GROUP BY recruitment_channel;



SELECT * FROM  recruitment_performance_analysis;