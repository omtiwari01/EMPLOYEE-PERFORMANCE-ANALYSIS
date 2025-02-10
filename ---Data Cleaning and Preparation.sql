

 ---Data Cleaning and Preparation
 USE E_analysis;
 UPDATE employe
 SET previous_year_rating = 0 WHERE previous_year_rating IS NULL;

 SELECT * FROM employe WHERE employee_id IS NULL OR department IS NULL OR region IS NULL OR education IS NULL OR
gender IS NULL OR	recruitment_channel IS NULL OR no_of_trainings IS NULL OR age IS NULL OR	previous_year_rating IS NULL OR
length_of_service IS NULL OR KPIs_met_more_than_80 IS NULL OR awards_won IS NULL OR	avg_training_score is NULL;

UPDATE employe
SET education = 'Bachelors' WHERE education IS NULL;

---CHECKING DUBLICATE RECORDS
SELECT employee_id, COUNT(*) AS duplicate_count
FROM employe
GROUP BY employee_id
HAVING COUNT(*) > 1;

---DELETING DUBLICATE RECORDS
WITH CTE AS (
    SELECT *, 
           ROW_NUMBER() OVER (PARTITION BY employee_id ORDER BY employee_id) AS row_num
    FROM employe
)
DELETE FROM CTE WHERE row_num > 1;

---Standardize Column Values
USE E_analysis;
UPDATE employe
SET education = UPPER(LEFT(education, 1)) + LOWER(SUBSTRING(education, 2, LEN(education)))
WHERE education IS NOT NULL;


UPDATE employe
SET gender = 'Male' 
WHERE gender IN ('M', 'male');

UPDATE employe
SET gender = 'Female' 
WHERE gender IN ('F', 'female');


UPDATE employe
SET department = UPPER(LEFT(department, 1)) + LOWER(SUBSTRING(department, 2, LEN(department)))
WHERE department IS NOT NULL;

UPDATE employe
SET region = UPPER(LEFT(region, 1)) + LOWER(SUBSTRING(region, 2, LEN(region)))
WHERE region IS NOT NULL;




