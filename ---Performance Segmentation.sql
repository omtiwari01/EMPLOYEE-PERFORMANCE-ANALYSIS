---Performance Segmentation
ALTER TABLE employe ADD performance_level VARCHAR(10);


UPDATE employe
SET performance_level = 
    CASE 
        WHEN avg_training_score >= 80 THEN 'High'
        WHEN avg_training_score BETWEEN 50 AND 79 THEN 'Medium'
        ELSE 'Low'
    END;






