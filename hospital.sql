create database hospital;
use hospital;

create table patients ( patient_id int primary key,
    first_name varchar(15) not null,
    last_name varchar(10) not null,
    dob date not null,
    gender varchar(10) not null,
    contact_no varchar(10) not null,
    address varchar(70),
    chronic_conditions varchar(70));


create table doctors ( doctor_id int primary key,
    first_name varchar(15) not null,
    last_name varchar(10) not null,
    specialization varchar(30) not null,
    contact_no varchar(10) not null);
    

create table admissions ( admission_id int primary key,
    patient_id int not null,
    admission_date date not null,
    discharge_date date,
    diagnosis varchar(70) not null,
    doctor_id int not null,
    room_no varchar(5),
    foreign key (patient_id) references patients(patient_id),
    foreign key (doctor_id) references doctors(doctor_id));
    
create table vitals ( vital_id int primary key,
    admission_id int not null,
    recorded_time timestamp not null,
    heart_rate int not null,
    blood_pressure varchar(10) not null,
    oxygen_level int not null,
    temperature decimal(5,2) not null,
    foreign key (admission_id) references admissions(admission_id));

create table treatments ( treatment_id int primary key,
    admission_id int not null,
    treatment_date date not null,
    procedures varchar(70),
    medication varchar(50) not null,
    dosage varchar(30),
    foreign key (admission_id) references admissions(admission_id));
    
create table readmission_risk ( risk_id int primary key,
    admission_id int not null,
    prediction_date date not null,
    risk_score decimal(5,2) not null,
    risk_level varchar(10) not null,
    foreign key (admission_id) references admissions(admission_id));


INSERT INTO patients VALUES (101, 'John', 'Doe', '1985-06-12', 'Male', '9876543210', '123 Main St', 'Diabetes, Hypertension'),
(102, 'Emily', 'Smith', '1992-08-25', 'Female', '8765432109', '456 Elm St', 'Asthma'),
(103, 'Robert', 'Johnson', '1975-03-30', 'Male', '7654321098', '789 Oak St', 'None'),
(104, 'Sarah', 'Williams', '1988-11-15', 'Female', '6543210987', '321 Pine St', 'Migraine'),
(105, 'Michael', 'Brown', '1965-09-22', 'Male', '5432109876', '654 Maple St', 'Arthritis'),
(106, 'Jennifer', 'Davis', '1972-04-05', 'Female', '4321098765', '987 Cedar St', 'Depression'),
(107, 'David', 'Miller', '1995-07-18', 'Male', '3210987654', '159 Birch St', 'None'),
(108, 'Jessica', 'Wilson', '1983-12-30', 'Female', '2109876543', '753 Spruce St', 'Diabetes'),
(109, 'Thomas', 'Moore', '1978-02-14', 'Male', '1098765432', '852 Willow St', 'Hypertension'),
(110, 'Amanda', 'Taylor', '1990-05-27', 'Female', '0987654321', '963 Aspen St', 'Anemia'),
(111, 'Christopher', 'Anderson', '1968-10-08', 'Male', '9876543211', '147 Redwood St', 'COPD'),
(112, 'Elizabeth', 'Thomas', '1974-01-19', 'Female', '8765432101', '258 Sequoia St', 'Osteoporosis'),
(113, 'Daniel', 'Jackson', '1987-06-23', 'Male', '7654321091', '369 Sycamore St', 'None'),
(114, 'Michelle', 'White', '1980-09-11', 'Female', '6543210981', '471 Magnolia St', 'Hypothyroidism'),
(115, 'Matthew', 'Harris', '1971-03-04', 'Male', '5432109871', '582 Dogwood St', 'High Cholesterol');

select * from patients;

INSERT INTO doctors VALUES (301, 'Alice', 'Carter', 'Pulmonologist', '5551234'),
(302, 'Mark', 'Wilson', 'Cardiologist', '5555678'),
(303, 'Emma', 'Davis', 'General Physician', '5559012'),
(304, 'James', 'Martinez', 'Neurologist', '5553456'),
(305, 'Sophia', 'Garcia', 'Endocrinologist', '5557890'),
(306, 'William', 'Lee', 'Orthopedic Surgeon', '5552345'),
(307, 'Olivia', 'Rodriguez', 'Psychiatrist', '5556789');

select * from doctors;

INSERT INTO admissions VALUES (2001, 101, '2025-02-10', '2025-02-15', 'Pneumonia', 301, 'A102'),
(2002, 102, '2025-02-18', NULL, 'Severe Asthma Attack', 302, 'B210'),
(2003, 103, '2025-01-20', '2025-01-25', 'Hypertension', 303, 'C305'),
(2004, 104, '2025-03-05', '2025-03-08', 'Migraine with Aura', 304, 'D412'),
(2005, 105, '2025-03-12', '2025-03-18', 'Knee Replacement', 306, 'E107'),
(2006, 106, '2025-01-15', '2025-01-20', 'Major Depressive Episode', 307, 'F209'),
(2007, 107, '2025-02-22', '2025-02-24', 'Appendicitis', 303, 'G301'),
(2008, 108, '2025-03-01', NULL, 'Diabetic Ketoacidosis', 305, 'H105'),
(2009, 109, '2025-01-10', '2025-01-15', 'Hypertensive Crisis', 302, 'I203'),
(2010, 110, '2025-02-05', '2025-02-09', 'Severe Anemia', 303, 'J304');

select * from admissions;

INSERT INTO vitals VALUES (5001, 2001, '2025-02-10 08:30:00', 80, '120/80', 98, 98.6),
(5002, 2001, '2025-02-11 10:15:00', 85, '130/85', 96, 99.2),
(5003, 2002, '2025-02-18 09:00:00', 95, '140/90', 92, 100.1),
(5004, 2003, '2025-01-20 14:30:00', 78, '150/95', 97, 98.4),
(5005, 2004, '2025-03-05 11:20:00', 82, '125/82', 99, 98.9),
(5006, 2005, '2025-03-12 16:45:00', 88, '135/88', 96, 99.5),
(5007, 2006, '2025-01-15 10:10:00', 72, '118/75', 98, 97.8),
(5008, 2007, '2025-02-22 09:30:00', 102, '145/90', 94, 101.2),
(5009, 2008, '2025-03-01 13:15:00', 92, '155/100', 91, 100.5),
(5010, 2009, '2025-01-10 08:45:00', 85, '160/105', 93, 99.8);

select * from vitals;

INSERT INTO treatments VALUES (7001, 2001, '2025-02-11', 'Oxygen Therapy', 'Amoxicillin', '500mg 2x daily'),
(7002, 2002, '2025-02-19', 'Nebulization', 'Prednisone', '10mg 1x daily'),
(7003, 2003, '2025-01-22', 'Blood Pressure Monitoring', 'Metoprolol', '50mg 1x daily'),
(7004, 2004, '2025-03-06', 'MRI Scan', 'Sumatriptan', '50mg as needed'),
(7005, 2005, '2025-03-13', 'Knee Surgery', 'Oxycodone', '5mg every 6 hours'),
(7006, 2006, '2025-01-16', 'Psychotherapy', 'Sertraline', '50mg 1x daily'),
(7007, 2007, '2025-02-22', 'Appendectomy', 'Cefazolin', '1g IV every 8 hours'),
(7008, 2008, '2025-03-02', 'Insulin Drip', 'Regular Insulin', '5 units/hour'),
(7009, 2009, '2025-01-11', 'IV Hydralazine', 'Hydralazine', '10mg every 4 hours'),
(7010, 2010, '2025-02-06', 'Blood Transfusion', 'Ferrous Sulfate', '325mg 3x daily');

select * from treatments;

INSERT INTO readmission_risk VALUES (9001, 2001, '2025-02-14', 0.75, 'High'),
(9002, 2002, '2025-02-19', 0.85, 'High'),
(9003, 2003, '2025-01-24', 0.40, 'Medium'),
(9004, 2004, '2025-03-07', 0.25, 'Low'),
(9005, 2005, '2025-03-17', 0.55, 'Medium'),
(9006, 2006, '2025-01-19', 0.65, 'High'),
(9007, 2007, '2025-02-23', 0.30, 'Medium'),
(9008, 2008, '2025-03-03', 0.80, 'High'),
(9009, 2009, '2025-01-14', 0.45, 'Medium'),
(9010, 2010, '2025-02-08', 0.35, 'Medium');

select * from readmission_risk;
