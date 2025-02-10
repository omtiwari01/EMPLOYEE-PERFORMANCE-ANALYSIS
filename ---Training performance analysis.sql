---Training performance analysis
USE E_analysis;


SELECT 
    no_of_trainings, 
    AVG(avg_training_score) AS avg_score,
    AVG(CAST(KPIs_met_more_than_80 AS FLOAT)) AS kpi_success_rate,
    AVG(CAST(awards_won AS FLOAT)) AS avg_awards
FROM employe
GROUP BY no_of_trainings
ORDER BY no_of_trainings;

USE E_analysis;

CREATE TABLE training_performance_analysis (
    no_of_trainings INT PRIMARY KEY,
    avg_score FLOAT,
    kpi_success_rate FLOAT,
    avg_awards FLOAT
);

INSERT INTO training_performance_analysis (no_of_trainings, avg_score, kpi_success_rate, avg_awards)
SELECT 
    no_of_trainings, 
    AVG(avg_training_score) AS avg_score,
    AVG(CAST(KPIs_met_more_than_80 AS FLOAT)) AS kpi_success_rate,
    AVG(CAST(awards_won AS FLOAT)) AS avg_awards
FROM employe
GROUP BY no_of_trainings;


SELECT * FROM training_performance_analysis;