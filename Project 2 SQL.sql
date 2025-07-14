create database HR_database;
use HR_database;

-- Average Attrition Rate for All Departments KPI_1
SELECT 
    h.Department,
    AVG(CASE WHEN h.Attrition = 'Yes' THEN 1 ELSE 0 END) * 100 AS AvgAttritionRate
FROM 
    Hr_1 h
JOIN 
    Hr_2 d ON h.EmployeeNumber = d.EmployeeID
GROUP BY 
    h.Department;
    
-- Average Hourly Rate of Male Research Scientists KPI_2

SELECT 
    AVG(h.HourlyRate) AS AvgHourlyRate_MaleResearchScientist
FROM 
    HR_1 h
JOIN 
    HR_2 d ON h.EmployeeNumber = d.Employeeid
WHERE 
    h.Gender = 'Male' AND h.JobRole = 'Research Scientist';
    
 --   Attrition Rate vs Monthly Income KPI_3
SELECT 
    h.JobRole,
    AVG(d.MonthlyIncome) AS AvgMonthlyIncome,
    AVG(CASE WHEN h.Attrition = 'Yes' THEN 1 ELSE 0 END) * 100 AS AttritionRatePercent
FROM 
    HR_1 h
JOIN 
    HR_2 d ON h.EmployeeNumber = d.EmployeeID
GROUP BY 
h.JobRole
ORDER BY 
    h.JobRole;

-- Average Working Years for Each Department KPI_4
SELECT 
    h.Department,
    AVG(d.TotalWorkingYears) AS AvgWorkingYears
FROM 
    HR_1 h
JOIN 
    HR_2 d ON h.EmployeeNumber = d.EmployeeID
GROUP BY 
    h.Department;

-- storeprocedure KPI_5
CALL GetMonthlyIncomeVsAttritionByJobRoleByDept('human resources');


 -- Job Role vs Work-Life Balance KPI_6
SELECT 
    h.JobRole,
    AVG(d.WorkLifeBalance) AS AvgWorkLifeBalance
FROM 
    HR_1 h
JOIN 
    HR_2 d ON h.EmployeeNumber = d.EmployeeID
GROUP BY 
    h.JobRole;


-- Attrition Rate vs Years Since Last Promotion KPI_7
SELECT 
    h.department,
    AVG(CASE WHEN h.Attrition = 'Yes' THEN 1 ELSE 0 END) * 100 AS AvgAttritionRate,
    AVG(d.YearsSinceLastPromotion) AS AvgYearsSinceLastPromotion
FROM 
    HR_1 h
JOIN 
    HR_2 d ON h.EmployeeNumber = d.EmployeeID
GROUP BY 
    h.department;




