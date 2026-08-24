# Employee-Attrition-HR-Analytics
SQL Server + Power BI analysis of employee attrition drivers, using the IBM HR Analytics dataset
# Employee Attrition & HR Analytics Dashboard

## Business Problem
Employee turnover is costly — recruiting, onboarding, and lost productivity add up fast. This project
analyzes employee data to identify which factors are most strongly associated with attrition, so HR and
management can prioritize where to focus retention efforts.

## Data
Public dataset: **IBM HR Analytics Employee Attrition & Performance** (sourced from Kaggle), containing
1,470 employee records with demographic, job, and satisfaction attributes, including attrition status.

## Tools
- **SQL Server** — data storage, cleaning, and aggregation
- **Power BI** — data modeling, DAX measures, and interactive dashboard

## Process
1. **Data setup**: Imported the dataset into SQL Server using the Import Flat File wizard, reviewing and
   correcting auto-detected data types (e.g., changing `Attrition` and `OverTime` from `bit` to `nvarchar`
   to preserve their Yes/No text values for accurate filtering).
2. **SQL analysis**: Wrote aggregation queries to calculate attrition rate (%) overall and broken down by
   department, tenure bucket, and overtime status, using `CASE WHEN` bucketing and `GROUP BY`.
3. **Power BI modeling**: Connected Power BI directly to the SQL Server database (Import mode), built DAX
   measures (`Attrition Rate %`, `Avg Tenure`, `Avg Monthly Income`, etc.) and a calculated `TenureBucket`
   column using `SWITCH(TRUE(), ...)` logic.
4. **Dashboard**: Built an interactive report with KPI cards, three attrition-rate breakdown charts
   (OverTime, Tenure Bucket, Department), a fourth chart comparing average income by job level split by
   attrition, and slicers for Department, Gender, and Marital Status.

## Key Insights
- **Overtime is the strongest driver of attrition.** Employees working overtime left at a **31% rate**,
  more than 3x the rate of those who didn't (**10%**) — the clearest actionable signal in the data.
- **New employees are the highest flight risk.** Attrition is highest in the first 0-2 years (**35%**) and
  drops steadily with tenure, down to **8%** for employees with 10+ years at the company.
- **Sales has the highest departmental attrition** (**21%**), notably above Research & Development (**14%**)
  and Human Resources (**19%**).
- **Pay plays a modest supporting role.** At every job level, employees who left earned slightly less on
  average than those who stayed — suggesting compensation contributes to attrition risk, but isn't the
  primary driver on its own.

## What I'd Do Next
With more time, I'd build a combined risk score weighting overtime, tenure, and job level together to flag
high-risk employees proactively, and test whether the overtime effect holds after controlling for department
(is it really overtime, or is overtime just concentrated in Sales?).

## Files
- `attrition_analysis.sql` — full SQL query file (data setup + all aggregation queries)
- `HR_Attrition_Dashboard.pbix` — Power BI dashboard file
- `dashboard_screenshot.png` — full dashboard preview
