/* create database employee_db;
USE employee_db; */

/* 1. Overall Attrition Rate */
select round(count(case when STATUS='Terminated' then 1 end)*100.0/count(*),2) as Attrition_Rate
from employee_data;

/* 2. Retention Rate */
select round(count(case when STATUS!='Terminated' then 1 end)*100.0/count(*),2) as Retention_Rate
from employee_data;

/* 3. Average Tenure */
select round(avg(length_of_service),2) as Avg_Tenure_Years
from employee_data;

/* 4. Voluntary vs. Involuntary Terminations */
select case when termreason_desc like '%Resign%' then 'Voluntary' else 'InVoluntary' end as Termination_Type,
		count(*) as Total_Terminations
from employee_data
where STATUS='Terminated'
group by Termination_Type;

-- 5. Attrition by Department
select department_name, 
		count(case when STATUS='Terminated' then 1 end) as Terminated_Count,
        count(*) as Total_Employees, 
        round(count(case when STATUS='Terminated' then 1 end)*100.0/count(*),2) as Attrition_Rate
from employee_data
group by department_name
order by Attrition_Rate desc;

/* 6. Attrition by Age Group */
select case when age between 20 and 25 then '20-25'
			when age between 26 and 35 then '26-35'
            when age between 36 and 45 then '36-45'
            else '46+' end as Age_Group,
		count(case when STATUS='Terminated' then 1 end) as Terminated_Count,count(*) as Total_Employees, 
        round(count(case when STATUS='Terminated' then 1 end)*100.0/count(*),2) as Attrition_Rate
from employee_data
group by Age_Group
order by Attrition_Rate desc;

/* 7. Attrition by Tenure Bin */
select case when length_of_service between 0 and 5 then '0-5 Years'
			when length_of_service between 6 and 10 then '6-10 Years'
            when length_of_service between 11 and 15 then '11-15 years'
            else '15+' end as Tenure_Bin,
		count(case when STATUS='Terminated' then 1 end) as Terminated_Count,
        count(*) as Total_Employees, 
        round(count(case when STATUS='Terminated' then 1 end)*100.0/count(*),2) as Attrition_Rate
from employee_data
group by Tenure_Bin
order by Attrition_Rate desc;

/* 8. Attrition Trend Over Years */
select STATUS_YEAR,
		count(case when STATUS='Terminated' then 1 end) as Terminated_Count,
		count(*) as Total_Employees, 
		round(count(case when STATUS='Terminated' then 1 end)*100.0/count(*),2) as Attrition_Rate
from employee_data
group by STATUS_YEAR
order by STATUS_YEAR;

/* 9. Attrition by Business Unit */
select BUSINESS_UNIT,
		count(case when STATUS='Terminated' then 1 end) as Terminated_Count,
        count(*) as Total_Employees, 
        round(count(case when STATUS='Terminated' then 1 end)*100.0/count(*),2) as Attrition_Rate
from employee_data
group by BUSINESS_UNIT
order by Attrition_Rate desc;

/* 10.Top Termination Reasons*/
select termreason_desc,
		count(*) as Termination_Count
from employee_data
where STATUS='Terminated'
group by termreason_desc
order by Termination_Count desc
limit 5;

/* 11. Attrition Trend by Department Over Time */
select department_name,STATUS_YEAR,
		count(case when STATUS='Terminated' then 1 end) as Attrition_Rate
from employee_data
group by department_name,STATUS_YEAR
order by department_name,STATUS_YEAR;

/* 12. Attrition Rate by Gender & Business Unit */
select BUSINESS_UNIT,gender_full,
		count(case when STATUS='Terminated' then 1 end) as Attrition_Rate
from employee_data
group by BUSINESS_UNIT,gender_full;