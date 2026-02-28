# 🏥 Hospital Management System (MySQL)

## 📌 Project Overview
The Hospital Management System is a relational database project built using MySQL to efficiently manage hospital operations including patients, doctors, appointments, and billing records. This project demonstrates strong database design, normalization, and business-focused SQL analytics.

## 🛠️ Tech Stack
- MySQL
- SQL
- Relational Database Design
- CSV Data Import
- ER Modeling

## 🗄️ Database Design
The system is designed using normalized relational tables (up to 3NF) to ensure:
- Data integrity
- Reduced redundancy
- Proper relationships using Primary and Foreign Keys

### Core Tables
- Patients
- Doctors
- Appointments
- Billing
- Departments
- Admissions
- Prescriptions
- Rooms
- Treatments

## 📂 Project Structure
```
Hospital-Management-System-MySQL/
├── README.md
├── schema.sql
├── queries.sql
├── ERD_Diagram.png
└── Data/
    ├── patients.csv
    ├── doctors.csv
    ├── appointments.csv
    └── billing.csv
```

## 📥 Data Import
CSV files are stored inside the `Data/` folder and imported using MySQL Workbench Import Wizard or `LOAD DATA INFILE`.

```sql
LOAD DATA INFILE 'patients.csv'
INTO TABLE Patients
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
```

## 📊 Key SQL Concepts Used
- CREATE TABLE with Constraints
- Primary Key & Foreign Key
- INNER JOIN, LEFT JOIN
- GROUP BY, HAVING
- Aggregate Functions (SUM, COUNT, AVG)
- Subqueries
- Indexing
- Query Optimization

## 📈 Analytical Queries
- Total revenue generated per month
- Number of appointments per doctor
- Department-wise patient count
- Top revenue-generating patients
- Daily appointment trends
- Billing summary analysis

## 🚀 How to Run the Project
1. Open MySQL Workbench
2. Execute `schema.sql` to create database and tables
3. Import CSV files from the `Data/` folder
4. Run queries from `queries.sql`

## 🎯 Project Objective
To design a structured hospital database system and generate meaningful operational and financial insights using SQL.

## ⭐ Skills Demonstrated
- Database Design & Normalization
- SQL Query Writing
- Data Modeling
- Business Reporting
- Analytical Thinking

---
👨‍💻 Developed by Sourabh Patil
📊 Data Analyst | SQL | Excel | Power BI | Python

📧 Email: patilsourabh1432@email.com
🔗 LinkedIn: https://www.linkedin.com/in/sourabh-patil-ab01433a0
💻 GitHub: https://github.com/sourabh1432