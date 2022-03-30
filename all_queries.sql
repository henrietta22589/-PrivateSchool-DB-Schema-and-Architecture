--BHMA 1 : δημιουργία βάσης
--CREATE DATABASE eriettaDB2;
--ΒΗΜΑ 2: use της νεας βασης που δημιουργηθηκε
USE eriettaDB2;

--ΒΗΜΑ 3: δημιουργια πινάκων στη βάση που δημιουργήθηκε (ΒΗΜΑ 2)
CREATE TABLE Assignments(
AssignmentsID  	  INT PRIMARY KEY IDENTITY,
Title		   	  VARCHAR(50) NOT NULL,
Descriptions    	  VARCHAR(50) NOT NULL,
DateOfSubmission  DATE NOT NULL,
Mark         	  INT,
Courses 	      VARCHAR(50) NOT NULL 
--REFERENCES Courses(Title), 
);
----------------------
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
StudentsID 		  INT PRIMARY KEY IDENTITY,
FirstName  		  VARCHAR(60) NOT NULL,
LastName          VARCHAR(60) NOT NULL, 
DateOfBirth 	  DATE NOT NULL,
TuitionFees 	  INT,
Courses      	  VARCHAR(50) NOT NULL ,
--REFERENCES Courses(Title),
Assignments  	  VARCHAR(50) NOT NULL,
);
---------------------------------------------------------------
CREATE TABLE Trainers(
TrainersID  	  INT PRIMARY KEY IDENTITY,
FirstName  	      VARCHAR(60) NOT NULL,
LastName    	  VARCHAR(60) NOT NULL, 
Courses     	  VARCHAR(50) NOT NULL ,
--REFERENCES Courses(Title),
Assignments  	  VARCHAR(50) NOT NULL 
--REFERENCES Assignments(Title),
);


--BHMA 4: Insert δεδομενων στους πινακες
USE eriettaDB1;

INSERT INTO Students( FirstName, LastName, DateOfBirth, TuitionFees, Courses, Assignments)VALUES
 (  'Alex',    'Sofianatos', '1980-01-01', 2000,  'Java Programming',   'Assignement_A')
,(  'Jorge',   'Alivizatos', '1970-02-11',    0,  'Java Programming',   'Assignement_A')
,(  'Sofia',   'Melisanidi', '1985-01-12', 3000,  'C Programming',      'Assignement_B')
,(  'Kwstas',  'Marinakis',  '1992-03-28', 53.20, 'C# Programming',     'Assignement_C')
,(  'Panos',   'Papakidis',  '1993-06-05', 11000, 'SQL Programming',    'Assignement_D')
,(  'Ektoras', 'Trikositis', '2000-05-14', 3000,  'C# Programming',     'Assignement_C')
,(  'Erietta', 'Sapariti',   '1972-11-16', 400,   'C  Programming',     'Assignement_B')
,(  'Pavlos',  'Piperidis',  '1945-12-20', 230,   'Java  Programming',  'Assignement_A')
,(  'Τασσος',  'Γκιωνης',    '1990-05-02', 7000,  'Python Programming', 'Assignement_E')
,( 'Θανος',   'Γκιγκας',    '1999-02-07', 3000,  'SQL Programming',    'Assignement_D')
,( 'Θανος',   'Γκιγκας',    '1999-02-07', 3000,  'Python Programming', 'Assignement_E')
;


INSERT INTO Trainers(FirstName, LastName, Courses, Assignments)VALUES
 ( 'Alex',   'Xamalidis',   'Java Programming',   'Assignement_A')
,( 'Kwstas', 'Papalampros', 'C Programming',      'Assignement_B')
,( 'Nikos',  'Papalampros', 'C# Programming',     'Assignement_C')
,( 'Κωστας', 'Κατσαρος',    'SQL Programming',    'Assignement_D')
,( 'Giouli', 'Kikidi',      'Python Programming', 'Assignement_E')
;


INSERT INTO Courses(Title, TypeOfCourse, DateOfStart, DateOfEnd, Assignments)VALUES
 ( 'Java Programming',   'Full Time', '2022-01-31', '2022-07-29', 'Assignement_A')
,( 'C Programming',      'Full Time', '2022-01-31', '2022-07-29', 'Assignement_B')
,( 'C# Programming',     'Full Time', '2022-01-31', '2022-07-29', 'Assignement_C')
,( 'SQL Programming',    'Full Time', '2022-01-31', '2022-07-29', 'Assignement_D')
,( 'Python Programming', 'Part Time', '2022-01-31', '2022-12-30', 'Assignement_E')
;


INSERT INTO Assignments(Title,Descriptions, DateOfSubmission, Mark, Courses)VALUES
 ( 'Assignement_A',  'Develop Application',     '2022-07-29',  10,  'Java Programming'   )
,( 'Assignement_A',  'Develop Application',     '2022-07-29',  7,   'Java Programming'   )
,( 'Assignement_A',  'Develop Application',     '2022-07-29',  7,   'Java Programming'   )
,( 'Assignement_A',  'Develop Application',     '2022-07-29',  7,   'Java Programming'   )
,( 'Assignement_A',  'Develop Application',     '2022-07-29',  7,   'Java Programming'   )
,( 'Assignement_B',  'PowerPoint Presentation', '2022-07-29',  10,  'C Programming'      )
,( 'Assignement_B',  'PowerPoint Presentation', '2022-07-29',  5,   'C Programming'      )
,( 'Assignement_C',  'Quiz Examination',        '2022-07-29',  8,   'C# Programming'     )
,( 'Assignement_C',  'Quiz Examination',        '2022-07-29',  9,   'C# Programming'     )
,( 'Assignement_C',  'Quiz Examination',        '2022-07-29',  5.5, 'C# Programming'     )
,( 'Assignement_C',  'Quiz Examination',        '2022-07-29',  3,   'C# Programming'     )
,( 'Assignement_D',  'Lab exercises',           '2022-07-29',  2,   'SQL Programming'    )
,( 'Assignement_D',  'Lab exercises',           '2022-07-29',  5,   'SQL Programming'    )
,( 'Assignement_D',  'Lab exercises',           '2022-07-29',  2,   'SQL Programming'    )
,( 'Assignement_E',  'Oral examination',        '2022-12-30',  10,  'Python Programming' )
;

--ΒΗΜΑ 5: Δημιουργία Foreign keys για κάθε πίνακα που δημιούργησα (ΒΗΜΑ 3)
ALTER TABLE Assignments 
ADD FOREIGN KEY (Courses) REFERENCES Courses(Title);

ALTER TABLE Students
ADD FOREIGN KEY (Courses) REFERENCES   Courses(Title);

ALTER TABLE Trainers
ADD FOREIGN KEY (Courses) REFERENCES   Courses(Title);

--BHΜΑ 6: Ερωτησεις-Απαντησεις ασκησης

----A list of all the students
CREATE VIEW Question1 AS
SELECT *
FROM Students;

----A list of all the trainers
CREATE VIEW Question2 AS
SELECT *
FROM Trainers;

----A list of all the assignments
CREATE VIEW Question3 AS
SELECT *
FROM Assignments;


----A list of all the courses
CREATE VIEW Question4 AS
SELECT *
FROM Courses;

----All the students per course
CREATE VIEW Question5 AS
SELECT Students.FirstName,Students.LastName, Courses.Title
FROM Students, Courses
WHERE Students.Courses = Courses.Title ;

----All the trainers per course
CREATE VIEW Question6 AS
SELECT Trainers.FirstName,Trainers.LastName, Courses.Title
FROM  Trainers, Courses
WHERE Trainers.Courses = Courses.Title ;

----All the assignments per course
CREATE VIEW Question7 AS
SELECT DISTINCT Courses.Title AS CourseTitle, Assignments.Title AS AssignTitle, Assignments.Descriptions AS DescriptionAssign
FROM  Assignments, Courses
WHERE Assignments.Courses = Courses.Title ;

--All the assignments per course per student
CREATE VIEW Question8 AS
SELECT Assignments.Title  AS AssigmentsTitle, Assignments.Descriptions, Courses.Title  AS CourseTitle, Students.FirstName,Students.LastName
FROM  Assignments, Courses, Students, Trainers
WHERE Trainers.Courses 		= Courses.Title 
 AND  Students.Courses  	= Courses.Title 
 AND  Assignments.Courses	= Courses.Title  
;


----A list of students that belong to more than one courses 
CREATE VIEW Question9 AS
SELECT COUNT(Students.LastName) AS NumberOfCourses,Students.LastName, Students.FirstName
FROM Courses, Students 
WHERE Students.Courses  		= Courses.Title  
GROUP BY Students.LastName, Students.FirstName
HAVING COUNT(Students.LastName)>1;