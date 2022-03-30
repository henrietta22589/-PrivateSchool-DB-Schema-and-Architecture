 --BHMA 1 : δημιουργία βάσης
--CREATE DATABASE eriettaDB2;
--ΒΗΜΑ 2: use της νεας βασης που δημιουργηθηκε
--USE eriettaDB2;

--ΒΗΜΑ 3: δημιουργια πινάκων στη βάση που δημιουργήθηκε (ΒΗΜΑ 2)
CREATE TABLE Assignments(
AssignmentsID     INT PRIMARY KEY IDENTITY,
Title             VARCHAR(50) NOT NULL,
Descriptions          VARCHAR(50) NOT NULL,
DateOfSubmission  DATE NOT NULL,
Mark              INT,
Courses           VARCHAR(50) NOT NULL 
--REFERENCES Courses(Title), 
);
---------------------------------------------------------------
CREATE TABLE Courses(
CoursesID         INT PRIMARY KEY IDENTITY,
Title             VARCHAR(50) NOT NULL UNIQUE,
TypeOfCourse      VARCHAR(50) NOT NULL,
DateOfStart       DATE NOT NULL,
DateOfEnd         DATE NOT NULL,
Assignments       VARCHAR(50) NOT NULL, 
--REFERENCES  Assignments(Title),
);
---------------------------------------------------------------
CREATE TABLE Students(
StudentsID        INT PRIMARY KEY IDENTITY,
FirstName         VARCHAR(60) NOT NULL,
LastName          VARCHAR(60) NOT NULL, 
DateOfBirth       DATE NOT NULL,
TuitionFees       INT,
Courses           VARCHAR(50) NOT NULL ,
--REFERENCES Courses(Title),
Assignments       VARCHAR(50) NOT NULL,
);
---------------------------------------------------------------
CREATE TABLE Trainers(
TrainersID        INT PRIMARY KEY IDENTITY,
FirstName         VARCHAR(60) NOT NULL,
LastName          VARCHAR(60) NOT NULL, 
Courses           VARCHAR(50) NOT NULL ,
--REFERENCES Courses(Title),
Assignments       VARCHAR(50) NOT NULL 
--REFERENCES Assignments(Title),
);


--ΒΗΜΑ 5: Δημιουργία Foreign keys για κάθε πίνακα που δημιούργησα (ΒΗΜΑ 3)
ALTER TABLE Assignments 
ADD FOREIGN KEY (Courses) REFERENCES Courses(Title);

ALTER TABLE Students
ADD FOREIGN KEY (Courses) REFERENCES   Courses(Title);

ALTER TABLE Trainers
ADD FOREIGN KEY (Courses) REFERENCES   Courses(Title);


