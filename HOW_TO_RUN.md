## How to run the SQL queries (MySQL)
1. Create database and load an anonymized dataset into table `employee_data`. Example:```sql
CREATE DATABASE attrition_db;
USE attrition_db;
-- Create table schema (example; adjust to your CSV columns)
CREATE TABLE employee_data (
  EmployeeID INT,
  recorddate_key DATE,
  birthdate_key DATE,
  orighiredate_key DATE,
  terminationdate_key DATE,
  age INT,
  length_of_service INT,
  city_name VARCHAR(100),
  department_name VARCHAR(100),
  job_title VARCHAR(200),
  store_name VARCHAR(200),
  gender_short VARCHAR(10),
  gender_full VARCHAR(20),
  termreason_desc VARCHAR(200),
  termtype_desc VARCHAR(50),
  STATUS_YEAR INT,
  STATUS VARCHAR(50),
  BUSINESS_UNIT VARCHAR(50)
);

2. Import CSV into employee_data (MySQL CLI or Workbench). Example (MySQL CLI):
mysql -u <user> -p attrition_db
# inside MySQL
LOAD DATA INFILE '/path/to/yourfile.csv'
INTO TABLE employee_data
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

3. Run queries:
mysql -u <user> -p attrition_db < EmpAttritionQueries.sql
