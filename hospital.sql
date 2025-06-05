CREATE DATABASE HOSPITALS;
CREATE TABLE Patients (
    PatientID INT PRIMARY KEY,
    Name VARCHAR(255),
    DateOfBirth DATE,
    Gender CHAR(1),
    Address VARCHAR(255)
);
CREATE TABLE Doctors (
    DoctorID INT PRIMARY KEY,
    Name VARCHAR(255),
    Specializations VARCHAR(255),
    PhoneNumber VARCHAR(15),
    Qualifications VARCHAR(255)
);
CREATE TABLE Appointments (
    AppointmentID INT PRIMARY KEY,
    PatientID INT,
    DoctorID INT,
    AppointmentDateTime DATETIME,
    Notes TEXT,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);
CREATE TABLE MedicalRecords (
    RecordID INT PRIMARY KEY,
    PatientID INT,
    DoctorID INT,
    RecordDate DATE,
    Diagnosis TEXT,
    Treatment TEXT,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(255)
);
CREATE TABLE NURSES(
NurseID INT PRIMARY KEY,
name VARCHAR(255),
DepartmentID INT,
phonenumber VARCHAR(15),
FOREIGN KEY (DepartmentID)REFERENCES Departments(DepartmentID)
);
CREATE TABLE Medication(
medID VARCHAR(255),
MEDTYPE VARCHAR(255),
MAD_DESC VARCHAR(255),
MED_BILLS VARCHAR(255),
MED_NAME VARCHAR(255)
);
-- Insert 10 values into Patients table
INSERT INTO Patients (PatientID, Name, DateOfBirth, Gender, Address)
VALUES 
    (1, 'JB', '1990-01-01', 'M', '123 Main St'),
    (2, 'Jane ', '1985-05-15', 'F', '456 Oak St'),
    (3, 'Bob ', '1978-08-20', 'M', '789 Pine St'),
    (4, 'Alice ', '1995-03-10', 'F', '101 Elm St'),
    (5, 'Charlie ', '1980-11-25', 'M', '202 Maple St'),
    (6, 'Emily ', '1992-07-12', 'F', '303 Cedar St'),
    (7, 'David ', '1987-09-05', 'M', '404 Birch St'),
    (8, 'Sophia ', '1975-12-30', 'F', '505 Spruce St'),
    (9, 'Daniel ', '1998-02-18', 'M', '606 Oakwood Ave'),
    (10, 'Olivia ', '1983-06-22', 'F', '707 Willow St');

-- Insert 10 values into Doctors table
INSERT INTO Doctors (DoctorID, Name, Specializations, PhoneNumber, Qualifications)
VALUES 
    (1, 'Dr. Smith', 'Cardiology', '123-456-7890', 'MD, PhD'),
    (2, 'Dr. Johnson', 'Orthopedics', '234-567-8901', 'DO'),
    (3, 'Dr. Brown', 'Pediatrics', '345-678-9012', 'MD'),
    (4, 'Dr. Wilson', 'Neurology', '456-789-0123', 'MD, PhD'),
    (5, 'Dr. Miller', 'Dermatology', '567-890-1234', 'MD'),
    (6, 'Dr. Davis', 'Ophthalmology', '678-901-2345', 'OD'),
    (7, 'Dr. Taylor', 'Obstetrics', '789-012-3456', 'MD'),
    (8, 'Dr. Moore', 'Gastroenterology', '890-123-4567', 'MD, MPH'),
    (9, 'Dr. Williams', 'Rheumatology', '901-234-5678', 'MD'),
    (10, 'Dr. Brown', 'Cardiac Surgery', '012-345-6789', 'MD, FACS');

-- Insert 10 values into Appointments table
INSERT INTO Appointments (AppointmentID, PatientID, DoctorID, AppointmentDateTime, Notes)
VALUES 
    (1, 1, 1, '2024-01-15 10:00:00', 'Routine check-up'),
    (2, 2, 2, '2024-02-01 14:30:00', 'Follow-up appointment'),
    (3, 3, 3, '2024-03-10 09:15:00', 'Vaccination'),
    (4, 4, 4, '2024-04-05 11:45:00', 'Headache consultation'),
    (5, 5, 5, '2024-05-20 16:00:00', 'Skin rash examination'),
    (6, 6, 6, '2024-06-15 13:30:00', 'Eye exam'),
    (7, 7, 7, '2024-07-02 08:45:00', 'Prenatal check-up'),
    (8, 8, 8, '2024-08-18 12:00:00', 'Colonoscopy'),
    (9, 9, 9, '2024-09-22 15:15:00', 'Arthritis evaluation'),
    (10, 10, 10, '2024-10-10 17:30:00', 'Heart surgery consultation');
INSERT INTO MedicalRecords (RecordID, PatientID, DoctorID, RecordDate, Diagnosis, Treatment)
VALUES 
    (1, 1, 1, '2024-01-15', 'Hypertension', 'Prescribed medication'),
    (2, 2, 2, '2024-02-01', 'Fractured ankle', 'Orthopedic cast'),
    (3, 3, 3, '2024-03-10', 'Measles', 'Vaccination'),
    (4, 4, 4, '2024-04-05', 'Migraine', 'Prescribed pain relievers'),
    (5, 5, 5, '2024-05-20', 'Contact dermatitis', 'Topical ointment'),
    (6, 6, 6, '2024-06-15', 'Myopia', 'Prescription glasses'),
    (7, 7, 7, '2024-07-02', 'Pregnancy', 'Prenatal care'),
    (8, 8, 8, '2024-08-18', 'Colitis', 'Colonoscopy and medication'),
    (9, 9, 9, '2024-09-22', 'Rheumatoid arthritis', 'Medication and physical therapy'),
    (10, 10, 10, '2024-10-10', 'Coronary artery disease', 'Scheduled for surgery');

-- Insert 10 values into Departments table
INSERT INTO Departments (DepartmentID, DepartmentName)
VALUES 
    (1, 'Cardiology'),
    (2, 'Orthopedics'),
    (3, 'Pediatrics'),
    (4, 'Neurology'),
    (5, 'Dermatology'),
    (6, 'Ophthalmology'),
    (7, 'Obstetrics'),
    (8, 'Gastroenterology'),
    (9, 'Rheumatology'),
    (10, 'Cardiac Surgery');

-- Insert 10 values into Nurses table
INSERT INTO Nurses (NurseID, Name, DepartmentID, PhoneNumber)
VALUES 
    (1, 'Nurse Johnson', 1, '555-1234'),
    (2, 'Nurse Smith', 2, '555-5678'),
    (3, 'Nurse Davis', 3, '555-9012'),
    (4, 'Nurse Wilson', 4, '555-3456'),
    (5, 'Nurse Miller', 5, '555-7890'),
    (6, 'Nurse Taylor', 6, '555-2345'),
    (7, 'Nurse Moore', 7, '555-6789'),
    (8, 'Nurse Williams', 8, '555-0123'),
    (9, 'Nurse Brown', 9, '555-4567'),
    (10, 'Nurse Jones', 10, '555-8901');
SELECT Patients.PatientID, Patients.Name AS PatientName, Patients.DateOfBirth, Patients.Gender,
       Appointments.AppointmentID, Appointments.AppointmentDateTime, Appointments.Notes,
       Doctors.Name AS DoctorName, Doctors.Specializations
FROM Patients, Appointments, Doctors
WHERE Patients.PatientID = Appointments.PatientID
      AND Appointments.DoctorID = Doctors.DoctorID;
SELECT Nurses.NurseID, Nurses.Name AS NurseName, Nurses.PhoneNumber,
       Departments.DepartmentID, Departments.DepartmentName
FROM Nurses, Departments
WHERE Nurses.DepartmentID = Departments.DepartmentID;











