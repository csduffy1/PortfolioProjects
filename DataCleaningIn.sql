SELECT * FROM `Excel Bikes`.`excel project dataset 2 copy`;
SELECT 
    CASE 
        WHEN Gender = 'M' THEN 'Male'
        WHEN Gender = 'F' THEN 'Female'
        ELSE Gender
    END AS Gender_Converted,
    Gender
FROM `Excel Bikes`.`excel project dataset 2 copy`;

UPDATE `Excel Bikes`.`excel project dataset 2 copy`
SET Gender = 
    CASE 
        WHEN Gender = 'M' THEN 'Male'
        WHEN Gender = 'F' THEN 'Female'
        ELSE Gender
    END;
ALTER TABLE `Excel Bikes`.`excel project dataset 2 copy`
DROP COLUMN Gender_Converted;
SELECT 
    CASE 
        WHEN `Marital Status` = 'M' THEN 'Married'
        WHEN `Marital Status` = 'S' THEN 'Single'
        ELSE `Marital Status`
    END AS Marital_Status_Converted,
    `Marital Status`
FROM `Excel Bikes`.`excel project dataset 2 copy`;
UPDATE `Excel Bikes`.`excel project dataset 2 copy`
SET `Marital Status` = 
    CASE 
        WHEN `Marital Status` = 'M' THEN 'Married'
        WHEN `Marital Status` = 'S' THEN 'Single'
        ELSE `Marital Status`
    END;

ALTER TABLE `Excel Bikes`.`excel project dataset 2 copy`
ADD COLUMN Age_Brackets VARCHAR(50);

UPDATE `Excel Bikes`.`excel project dataset 2 copy`
SET Age_Brackets =
    CASE
        WHEN Age < 31 THEN 'Adolescent'
        WHEN Age >= 31 AND Age <= 54 THEN 'Middle Age'
        WHEN Age > 54 THEN 'Old'
        ELSE 'Unknown'  -- Or any default value if age is NULL or unexpected
    END;
    
SELECT 
    e1.`Marital Status` AS Marital_Status,
    e1.`Purchased Bike` AS Purchased_Bike,
    e1.`Home Owner` AS Home_Owner,
    e1.`Commute Distance` AS Commute_Distance
FROM `Excel Bikes`.`excel project dataset 2 copy` e1
JOIN `Excel Bikes`.`excel project dataset 2 copy` e2 ON e1.ID = e2.ID;



    


