--•	SELECT: Retrieve all columns from the Doctor table
SELECT *
FROM Doctor

--•	ORDER BY: List patients in the Patient table in ascending order of their ages.
SELECT *
FROM Patient
ORDER BY Age ASC

--•	OFFSET FETCH: Retrieve the first 10 patients from the Patient table, starting from the 5th record
SELECT *
FROM Patient
ORDER BY UR_number
OFFSET 4 ROWS 
FETCH NEXT 10 ROWS ONLY

--•	SELECT TOP: Retrieve the top 5 doctors from the Doctor table.
SELECT Top 5 *
from Doctor

--•	SELECT DISTINCT: Get a list of unique address from the Patient table.
SELECT Distinct Address 
from Patient

--•	WHERE: Retrieve patients from the Patient table who are aged 25.
SELECT *
from Patient
WHERE Age = 25

--•	NULL: Retrieve patients from the Patient table whose email is not provided.
SELECT *
FROM Patient
WHERE Email IS NULL

--•	AND: Retrieve doctors from the Doctor table who have experience greater than 5 years and specialize in 'Cardiology'.
SELECT *
FROM Doctor
WHERE experience_years > 5 
AND specialty = 'Cardiology'

--•	IN: Retrieve doctors from the Doctor table whose speciality is either 'Dermatology' or 'Oncology'.
SELECT *
FROM Doctor
WHERE specialty IN ('Dermatology','Oncology')

--•	BETWEEN: Retrieve patients from the Patient table whose ages are between 18 and 30.
SELECT *
from Patient
WHERE Age BETWEEN 18 and 30

--•	LIKE: Retrieve doctors from the Doctor table whose names start with 'Dr.'.
SELECT *
FROM Doctor
WHERE Name LIKE 'dr.%'

--•	Column & Table Aliases: Select the name and email of doctors, aliasing them as 'DoctorName' and 'DoctorEmail'.
SELECT Name as 'DoctorName' ,Email as 'DoctorEmail'
FROm Doctor

--•	Joins: Retrieve all prescriptions with corresponding patient names.
SELECT *
FROM Prescription pr 
Join Patient pa
on pa.UR_number = pr.UR_number

--•	GROUP BY: Retrieve the count of patients grouped by their cities.
SELECT Address, COUNT(*) 
FROM Patient
GROUP BY Address

--•	HAVING: Retrieve cities with more than 3 patients.
SELECT Address, COUNT(*) 
FROM Patient
GROUP BY Address
HAVING  COUNT(Address)  > 3

--•	UNION: Retrieve a combined list of doctors and patients
SELECT *
FROM Doctor
UNION ALL
SELECT *
FROM Patient

--•	Common Table Expression (CTE): Retrieve patients along with their doctors using a CTE.
WITH cte_patent_doctor (Patient_Name,Doctor_Name)
AS(
SELECT p.Name ,
 d.Name
FROM Patient p
JOIN Doctor d
on p.UR_number = d.UR_number
)
SELECT *
FROM cte_patent_doctor

--•	INSERT: Insert a new doctor into the Doctor table.
INSERT into Doctor (Name,specialty,Email,Phone,experience_years) Values('John doe','Dermatology','email@exampel.com',10101010101,4)

--•	INSERT Multiple Rows: Insert multiple patients into the Patient table.
INSERT INTO Patient (Name,Age,Address,Email,Phone,Medicare_card_number) 
VALUES ('john doe borther',34,'cairo 29st','anotheremail@exampel.com',202020202,null),
('john doe cousin',26,'Alex 4st','AnotherAnotheremail@exampel.com',2444420202, 4731318)

--•	UPDATE: Update the phone number of a doctor.
UPDATE Doctor
SET Phone = 4884482002
WHERE Doctor_ID = 1

--•	UPDATE JOIN: Update the city of patients who have a prescription from a specific doctor.
UPDATE Patient
SET Address = 'NY'
FROM Patient p
JOIN Doctor d
ON d.UR_number = p.UR_number
WHERE d.Doctor_ID = 1

--•	DELETE: Delete a patient from the Patient table
DELETE 
From Patient
WHERE UR_number = 1

--•	Transaction: Insert a new doctor and a patient, ensuring both operations succeed or fail together.
BEGIN TRANSACTION;
INSERT INTO Doctor (Name,specialty,Email,Phone,experience_years) Values('John doe friend','Cardiology','emailaclark@exampel.com',74747472722,8)
INSERT INTO Patient (Name,Age,Address,Email,Phone,Medicare_card_number) 
VALUES ('john doe son',15,'delta 39st','anotheremailano@exampel.com',222357222202, 41333333)
COMMIT;

--•	View: Create a view that combines patient and doctor information for easy access.
CREATE VIEW Pationt_and_doctor_info
AS
SELECT p.Name as 'patient name' ,d.Name as 'doctor name'
FROM Patient p
JOIN Doctor d
on p.UR_number = d.UR_number

--•	Index: Create an index on the 'phone' column of the Patient table to improve search performance.
CREATE INDEX phone_index
ON Patient (phone)

--•	Backup: Perform a backup of the entire database to ensure data safety.
BACKUP DATABASE Barwon_Health
TO DISK = 'D:\\IDK'

