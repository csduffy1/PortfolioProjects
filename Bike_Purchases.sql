SELECT * FROM `Excel Bikes`.`excel project dataset 2 copy`;
	-- Did people say yes or no more often to purchasing a bike?
SELECT 
    SUM(`Purchased Bike` = 'Yes') AS Purchased_Yes,
    SUM(`Purchased Bike` = 'No') AS Purchased_No
FROM `Excel Bikes`.`excel project dataset 2 copy`
WHERE `Purchased Bike` IN ('Yes', 'No');
	-- Do more males or females purchase bikes and what age bracket do they fall under?
SELECT 
    Age_Brackets, Gender,
    SUM(CASE WHEN `Purchased Bike` = 'Yes' THEN 1 ELSE 0 END) AS Purchased_Yes_Count,
    SUM(CASE WHEN `Purchased Bike` = 'No' THEN 1 ELSE 0 END) AS Purchased_No_Count
FROM `Excel Bikes`.`excel project dataset 2 copy`
WHERE `Purchased Bike` IN ('Yes', 'No')
GROUP BY Age_Brackets, Gender;  -- Most bikes are purchased by middle aged females and males.
	-- Does the customers marital status make a difference?
SELECT 
    Age_Brackets, Gender,`Marital Status`,
    SUM(CASE WHEN `Purchased Bike` = 'Yes' THEN 1 ELSE 0 END) AS Purchased_Yes_Count,
    SUM(CASE WHEN `Purchased Bike` = 'No' THEN 1 ELSE 0 END) AS Purchased_No_Count
FROM `Excel Bikes`.`excel project dataset 2 copy`
WHERE `Purchased Bike` IN ('Yes', 'No')
GROUP BY Age_Brackets, Gender, `Marital Status`; -- Middle aged married men say no to purchasing a bike more often than any other group. 
						-- Middle aged single male and female are more likely to purchase a bike. 
	-- What is the average income based off the education of the customer?                                               
SELECT Education, AVG(CAST(REPLACE(REPLACE(income, '$', ''), ',', '') AS UNSIGNED)) AS avg_income
FROM `Excel Bikes`.`excel project dataset 2 copy`
GROUP BY Education;	-- Graduate degrees make more money than any other group. 
	-- Does education and income make an impact on who purchased more bikes?
SELECT 
    Education,
    AVG(CAST(REPLACE(REPLACE(income, '$', ''), ',', '') AS UNSIGNED)) AS avg_income,
    SUM(CASE WHEN `Purchased Bike` = 'Yes' THEN 1 ELSE 0 END) AS Bike_Purchased_Yes,
    SUM(CASE WHEN `Purchased Bike` = 'No' THEN 1 ELSE 0 END) AS Bike_Purchased_No
FROM 
    `Excel Bikes`.`excel project dataset 2 copy`
GROUP BY 
    Education;  -- Bachelors degrees said yes to purchasing a bike more than any other group. 
				-- Partial High School has the lowest number of bikes purchased. 
                
-- After exploring the data I was able to figure out that the target audience for bike purchases are middle aged single male or female
-- that have a commute distance of 1 mile or less and a bachelors degree or Partial College education. This group has the highest
-- number of bike purchases or even considering a bike purchase. 

