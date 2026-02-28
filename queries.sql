use hospital;

-- List all appointments with patient name and doctor name

SELECT 
    a.appointment_id,
    p.patient_name,
    d.doctor_name,
    a.appointment_date,
    a.status
FROM Appointments a
JOIN Patients p ON a.patient_id = p.patient_id
JOIN Doctors d ON a.doctor_id = d.doctor_id;

-- List doctors along with their department names
SELECT 
    d.doctor_name,
    d.specialization,
    dp.department_name
    FROM Doctors d
    JOIN Departments dp ON d.department_id=dp.department_id;
    
-- Patients with highest number of hospital visits
SELECT
	p.patient_name,
    p.age,
    p.gender,
    p.city,
    count(a.appointment_id) AS VISIT_COUNT
    FROM Patients p INNER JOIN appointments a
    ON p.patient_id=a.patient_id
    Group by p.patient_id, p.patient_name
    order by VISIT_COUNT DESC;
    
 -- City-wise patient count
  SELECT city,count(*) AS PATIENT_COUNT from patients group by city order by PATIENT_COUNT DESC;
  
  -- TOP 10 higest paying patient
  SELECT 
  p.patient_name,
  sum( b.total_amount) AS PAID_AMOUNT
  FROM patients p 
  JOIN billing b ON p.patient_id=b.patient_id
  Group by p.patient_name
  order by PAID_AMOUNT DESC
  LIMIT 10;

-- Departments with most doctors
SELECT 
d.department_name,
count(dc.doctor_id) AS Doctor_Count
from doctors dc
JOIN departments d ON dc.department_id=d.department_id
group by d.department_name
order by Doctor_count DESC;

-- check doctors with highest appoinments
SELECT 
     d.doctor_name,
     count(a.appointment_id) AS Appoinment_Count
     from doctors d
     JOIN appointments a 
     ON d.doctor_id=a.doctor_id
     group by d.doctor_name
     order by Appoinment_Count DESC;
     
-- Department-wise appointment demand
SELECT 
    dept.department_name,
    COUNT(a.appointment_id) AS appointment_count
FROM Appointments a
JOIN Doctors d ON a.doctor_id = d.doctor_id
JOIN Departments dept ON d.department_id = dept.department_id
GROUP BY dept.department_name
ORDER BY appointment_count DESC;
     
-- check how many days paitent admited in hospital
Select p.patient_name,
DATEDIFF(a.discharge_date,a.admission_date) AS Admited_Duration_Days
FROM patients p
JOIN admissions a ON p.patient_id=a.patient_id;

-- check wich most common tratment 
Select treatment_name,count(*) AS Treatment_count 
from treatments 
group by treatment_name 
order by Treatment_count DESC;

-- Most Precripted medicine

SELECT 
    m.medicine_name,
    SUM(p.quantity) AS total_quantity
FROM Prescriptions p
JOIN Medicines m ON p.medicine_id = m.medicine_id
GROUP BY m.medicine_name
ORDER BY total_quantity DESC
LIMIT 10;

-- Total revenu genrated by hospital
Select sum(total_amount) AS Total_REVENU from billing;

-- check monthly revenu
Select MONTHNAME(payment_date) AS MONTH,sum(total_amount) AS Total_Revenu from Billing group by MONTH order by MONTH;
