---Tenure performance analysis

USE E_analysis;
SELECT 
    length_of_service, 
    AVG(avg_training_score) AS avg_score,
    AVG(CAST(KPIs_met_more_than_80 AS FLOAT)) AS kpi_success_rate,
    AVG(CAST(awards_won AS FLOAT)) AS avg_awards
FROM employe
GROUP BY length_of_service
ORDER BY length_of_service;

USE E_analysis;

CREATE TABLE tenure_performance_analysis (
    length_of_service INT PRIMARY KEY,
    avg_score FLOAT,
    kpi_success_rate FLOAT,
    avg_awards FLOAT
);

INSERT INTO tenure_performance_analysis (length_of_service, avg_score, kpi_success_rate, avg_awards)
SELECT 
    length_of_service, 
    AVG(avg_training_score) AS avg_score,
    AVG(CAST(KPIs_met_more_than_80 AS FLOAT)) AS kpi_success_rate,
    AVG(CAST(awards_won AS FLOAT)) AS avg_awards
FROM employe
GROUP BY length_of_service
ORDER BY length_of_service;

SELECT * FROM tenure_performance_analysis;