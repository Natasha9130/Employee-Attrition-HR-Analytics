# Employee Attrition & HR Analytics Dashboard

I built this project to practice going from raw data to an actual business insight, using SQL Server and Power BI together. The goal was to figure out what's actually driving employees to leave the company, using a public HR dataset.

## The data

I used the IBM HR Analytics Employee Attrition dataset from Kaggle - 1,470 employee records with things like department, job role, income, tenure, overtime status, and whether they left or stayed.

## What I did

I loaded the CSV into SQL Server first. One thing I ran into early on: a couple of columns (Attrition and OverTime) got auto-detected as `bit` type instead of text, which would've broken my queries since I needed to match on "Yes"/"No" - so I changed those to nvarchar before importing.

From there I wrote a few SQL queries to look at attrition rate broken down by department, tenure, and overtime status. Once I had a feel for the numbers, I connected Power BI straight to the SQL Server database and built out a dashboard with some DAX measures (attrition rate %, average tenure, average income) plus a calculated column to group employees into tenure buckets (0-2 years, 2-5 years, etc.).

## What I found

- Overtime makes a big difference. Employees who worked overtime left at 31%, compared to just 10% for those who didn't. This was the clearest pattern in the whole dataset.
- New employees are way more likely to leave. Attrition is 35% in the first two years and drops all the way down to 8% for people who've been there 10+ years.
- Sales has the highest attrition by department, at 21% - noticeably higher than Research & Development (14%).
- Pay seems to matter too, but less dramatically. At every job level, people who left were earning a bit less on average than people who stayed - so it looks like a contributing factor, not the main driver.

## If I kept going

I'd want to build some kind of combined risk score using overtime, tenure, and job level together to flag employees who might be at risk of leaving. I'd also want to check whether the overtime effect is really about overtime itself, or whether it's just because overtime happens to be more common in Sales.

## Files in this repository

- `SQLQuery HRAnalytics.sql` - all the SQL queries
- `HR_Attrition_Dashboard.pbix` - the Power BI file
- `HR_Attrition_Dashboard.pbi.png` - a screenshot of the finished dashboard
- `Attrition_By_Department.sql.png`, `Attrition_By_Overtime_Status.sql.png`, `Attrition_By_Tenure_Bucket.sql.png`, `Overall_Attrition_Rate.sql.png`, `Average_monthly_income_of_leavers_vs._stayers` - Screenshots of the SQL codes
