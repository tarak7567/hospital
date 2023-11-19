/*
	Instructions: Build SQL Queries for each SCREEN designed in your Balsamiq project.
	You must include one or more SELECT, INSERT, UPDATE, or DELETE queries where appropriate in your design.
	These queries will be re-executed/verified in your Physical Design restored from your .bak file. 


	Student Name: Taraka sai srinatha reddy Vanukuri
	Date: 10-28-2022
	Assignment: Assignment 1- Hospital 
	Description of Assignment: In this assignment, you will be creating “Physical” design using Microsoft SQL Server based on 
requirements from a “Logical” ERD design.
*/

-- SCREEN 1 SQL Queries
-- As the Patient gives his details his unique Patient_Number gets generated in screen 1

Declare @Patient_Number As varchar(20)
set @Patient_Number = 'P3130'
select dbo.Patient.Patient_First_Name, dbo.Patient.Patient_Last_Name, dbo.Patient.Age,dbo.Patient.Patient_Number from dbo.Patient
where dbo.Patient.Patient_Number = @Patient_Number



-- SCREEN 2 SQL Queries
--After getting the Patient_Number now the patient selects a doctor based on his degree,after selection of degree the patient gets to know Doctor name, Department, Telephone and Bacup doctor.
Declare @Degree_Type AS varchar(100)
set @Degree_Type = 'Doctor of cancer'

select dbo.Doctor.Doctor_First_Name,dbo.Doctor.Doctor_Last_Name,dbo.Department.Department_Number,dbo.Doctor.Telephone,dbo.Degree.Degree_Type,dbo.Doctor.Backup_Doctor
from (( dbo.Doctor
Inner Join dbo.Department ON dbo.Doctor.Department_Number = dbo.Department.Department_Number)
Inner join dbo.Degree ON dbo.Doctor.Doctor_Number = dbo.Degree.Doctor_Number)
where dbo.Degree.Degree_Type = @Degree_Type



-- SCREEN3 # SQL Queries
-- After getting to know the doctor details the patient consults the doctor, based on doctor's advice the patient now selects Operation_Name and it generates Date, Operation room nuber, Duration, start time, end time, Doctor number and cost.

Declare @Operation_Name AS varchar(50)
set @Operation_Name = 'Cholecystectomy' 

Select dbo.Operation.Date,dbo.Operation.Operating_Room_No,dbo.Operation.Start_Time,dbo.Operation.End_Time,dbo.Operation_Type.Duration,dbo.Operation.Doctor_Number,dbo.Operation_Type.Cost
from dbo.Operation
Inner Join dbo.Operation_Type ON dbo.Operation.Operation_Name = dbo.Operation_Type.Operation_Name
where dbo.Operation.Operation_Name = @Operation_Name




-- SCREEN4 # SQL Queries
--After the operation now the patient selects his insurance company based on which he gets to know the claim number, diagnosis details and amount covered.

Declare @Company_Name As varchar(100)
set @Company_Name = 'Independence Health Group'

Select dbo.Claim.Claim_Number,dbo.Claim.Patient_Number,dbo.Claim.Diagnosis,dbo.Claim.Amount
from dbo.Claim
Inner join dbo.Insurance_Company ON dbo.Claim.Company_Name = dbo.Insurance_Company.Company_Name
where dbo.Claim.Company_Name = @Company_Name