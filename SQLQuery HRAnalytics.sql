
--Overall attrition rate:

SELECT
	COUNT(*) AS TotalEmployees,
	SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS AttritionCount,
	CAST(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS FLOAT) / COUNT(*) *100 AS AttritionRatePct
FROM dbo.Employees;


--Attrition by department:

SELECT
	Department,
	COUNT(*) AS TotalEmployees,
	SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS AttritionCount,
	CAST(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS FLOAT) / COUNT(*) *100 AS AttritionRatePct
FROM dbo.Employees
GROUP BY Department
ORDER BY AttritionRatePct DESC; 


--Attrition by tenure bucket

SELECT 
    CASE 
        WHEN YearsAtCompany < 2 THEN '0-2 years'
        WHEN YearsAtCompany BETWEEN 2 AND 5 THEN '2-5 years'
        WHEN YearsAtCompany BETWEEN 6 AND 10 THEN '6-10 years'
        ELSE '10+ years'
    END AS TenureBucket,
    COUNT(*) AS TotalEmployees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS AttritionCount,
    CAST(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS FLOAT) / COUNT(*) * 100 AS AttritionRatePct
FROM Employees
GROUP BY 
    CASE 
        WHEN YearsAtCompany < 2 THEN '0-2 years'
        WHEN YearsAtCompany BETWEEN 2 AND 5 THEN '2-5 years'
        WHEN YearsAtCompany BETWEEN 6 AND 10 THEN '6-10 years'
        ELSE '10+ years'
    END
ORDER BY AttritionRatePct DESC;


--Attrition by overtime status

SELECT 
    OverTime,
    COUNT(*) AS TotalEmployees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS AttritionCount,
    CAST(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS FLOAT) / COUNT(*) * 100 AS AttritionRatePct
FROM Employees
GROUP BY OverTime;


--Average monthly income of leavers vs. stayers by job role:

SELECT 
    JobRole,
    Attrition,
    AVG(MonthlyIncome) AS AvgMonthlyIncome,
    COUNT(*) AS EmployeeCount
FROM Employees
GROUP BY JobRole, Attrition
ORDER BY JobRole, Attrition;