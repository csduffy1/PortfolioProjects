SELECT * FROM `Excel Bikes`.`excel project dataset 2 copy`; -- select all data
SELECT 
    CASE 
        WHEN Gender = 'M' THEN 'Male'
        WHEN Gender = 'F' THEN 'Female'
        ELSE Gender
    END AS Gender_Converted,
    Gender
FROM `Excel Bikes`.`excel project dataset 2 copy`;  -- Create new column and insert Gender column variables as 'Male' & 'Female

UPDATE `Excel Bikes`.`excel project dataset 2 copy`
SET Gender = 
    CASE 
        WHEN Gender = 'M' THEN 'Male'
        WHEN Gender = 'F' THEN 'Female'
        ELSE Gender
    END;                                            -- Update Gender column using case function
ALTER TABLE `Excel Bikes`.`excel project dataset 2 copy`
DROP COLUMN Gender_Converted;                        -- Deleting the created column
SELECT 
    CASE 
        WHEN `Marital Status` = 'M' THEN 'Married'
        WHEN `Marital Status` = 'S' THEN 'Single'
        ELSE `Marital Status`
    END AS Marital_Status_Converted,              
FROM `Excel Bikes`.`excel project dataset 2 copy`;    -- Create new column and insert Marital Status column variables as 'Married' & 'Single'
UPDATE `Excel Bikes`.`excel project dataset 2 copy`
SET `Marital Status` = 
    CASE 
        WHEN `Marital Status` = 'M' THEN 'Married'
        WHEN `Marital Status` = 'S' THEN 'Single'
        ELSE `Marital Status`
    END;                                             -- Update Marital Status column using case statement

ALTER TABLE `Excel Bikes`.`excel project dataset 2 copy`
ADD COLUMN Age_Brackets VARCHAR(50);                    -- create new column

UPDATE `Excel Bikes`.`excel project dataset 2 copy`
SET Age_Brackets =
    CASE
        WHEN Age < 31 THEN 'Adolescent'
        WHEN Age >= 31 AND Age <= 54 THEN 'Middle Age'
        WHEN Age > 54 THEN 'Old'
        ELSE 'Unknown'  -- Or any default value if age is NULL or unexpected
    END;                                            -- Use Case function to set Parameters for different age brackets within new column. 
    




    


