CREATE database hospital;

use hospital;

CREATE TABLE Patients (
    patient_id INT PRIMARY KEY,
    patient_name VARCHAR(100),
    gender VARCHAR(10),
    age INT,
    phone VARCHAR(15),
    city VARCHAR(50)
);

LOAD DATA INFILE 'D:/SQL/Project/hospital/Patient.csv'
INTO TABLE Patients
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(patient_id, patient_name, gender, age, phone, city);

select * from Patients;
--------------------------------------------------------------------------
CREATE TABLE Doctors (
    doctor_id INT PRIMARY KEY,
    doctor_name VARCHAR(100),
    specialization VARCHAR(100),
    department_id INT,
    phone VARCHAR(15)
);

LOAD DATA INFILE 'D:/SQL/Project/hospital/Doctors.csv'
INTO TABLE Doctors
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(doctor_id, doctor_name,specialization, department_id, phone);

select * from Doctors;

select distinct department_id from Doctors;

UPDATE Doctors
SET department_id =
    CASE specialization
        WHEN 'Cardiology' THEN 1
        WHEN 'Neurology' THEN 2
        WHEN 'Orthopedics' THEN 3
        WHEN 'Dermatology' THEN 4
        WHEN 'Pediatrics' THEN 5
        WHEN 'General Medicine' THEN 6
    END;
SET SQL_SAFE_UPDATES = 0;
-------------------------------------------------------------------
CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100)
);
INSERT INTO Departments (department_id, department_name) VALUES
(1, 'Cardiology'),
(2, 'Neurology'),
(3, 'Orthopedics'),
(4, 'Dermatology'),
(5, 'Pediatrics'),
(6, 'General Medicine');

select * from departments;
--------------------------------------------------------------------------------
CREATE TABLE Appointments (
    appointment_id INT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    appointment_date DATE,
    status VARCHAR(20),
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
);
LOAD DATA INFILE 'D:/SQL/Project/hospital/Appointments.csv'
INTO TABLE Appointments
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(appointment_id,patient_id,doctor_id,appointment_date,status);

select * from Appointments;

-------------------------------------------------------------------------------------------
CREATE TABLE Admissions (
    admission_id INT PRIMARY KEY,
    patient_id INT,
    room_id INT,
    admission_date DATE,
    discharge_date DATE,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (room_id) REFERENCES Rooms(room_id)
);

LOAD DATA INFILE 'D:/SQL/Project/hospital/Admissions.csv'
INTO TABLE Admissions
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(admission_id,patient_id,room_id,admission_date,discharge_date);

select * from Admissions;

----------------------------------------------------------------------------------------
CREATE TABLE Rooms (
    room_id INT PRIMARY KEY,
    room_type VARCHAR(50),
    daily_charge DECIMAL(10,2),
    availability VARCHAR(20)
);
LOAD DATA INFILE 'D:/SQL/Project/hospital/Rooms.csv'
INTO TABLE Rooms
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(room_id,room_type,daily_charge,availability);

select * from rooms;

------------------------------------------------------------------------------------------
CREATE TABLE Treatments (
    treatment_id INT PRIMARY KEY,
    admission_id INT,
    treatment_name VARCHAR(100),
    treatment_cost DECIMAL(10,2),
    FOREIGN KEY (admission_id) REFERENCES Admissions(admission_id)
);

LOAD DATA INFILE 'D:/SQL/Project/hospital/Treatments.csv'
INTO TABLE Treatments
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(treatment_id,admission_id,treatment_name,treatment_cost);

select * from Treatments;
--------------------------------------------------------------------------------------------
CREATE TABLE Medicines (
    medicine_id INT PRIMARY KEY,
    medicine_name VARCHAR(100),
    price DECIMAL(10,2)
);

LOAD DATA INFILE 'D:/SQL/Project/hospital/Medicines.csv'
INTO TABLE Medicines
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(medicine_id,medicine_n,treatment_name,treatment_cost);
select * from Medicines;

desc Medicines;

select * from Medicines;

-------------------------------------------------------------------------------------------------
CREATE TABLE Prescriptions (
    prescription_id INT PRIMARY KEY,
    appointment_id INT,
    medicine_id INT,
    quantity INT,
    FOREIGN KEY (appointment_id) REFERENCES Appointments(appointment_id),
    FOREIGN KEY (medicine_id) REFERENCES Medicines(medicine_id)
);
LOAD DATA INFILE 'D:/SQL/Project/hospital/Prescriptions.csv'
INTO TABLE Prescriptions
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(prescription_id,appointment_id,medicine_id,quantity);


select * from Prescriptions;

--------------------------------------------------------------------------------------------------------
CREATE TABLE Billing (
    bill_id INT PRIMARY KEY,
    patient_id INT,
    total_amount DECIMAL(10,2),
    payment_status VARCHAR(20),
    payment_date DATE,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id)
);

LOAD DATA INFILE 'D:/SQL/Project/hospital/Billing.csv'
INTO TABLE Billing
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(bill_id,patient_id,total_amount,payment_status,payment_date);

select * from Billing;