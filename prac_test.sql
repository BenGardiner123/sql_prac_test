/* Name: Ben Gardiner  
   Student ID: 102151272
*/

-- SCHEMA TASK1--

/* SUBJECT (SubjCode, Description)
PK:SubjCode

TEACHER (StaffID, Surname,GivenName)
PK: StaffID

SubjectOffering (Year,Semester, Fee, StaffID)
PK: SubjCode, Year, Semester
FK: SubjCode REFERENCES subject
FK: StaffID REFERENCES TEACHER

ENROLMENT ( StudentID, SubjCode, Year, Semester, DateEnrolled, Grade)
PK: StudentID, SubjCode, Year, Semester
FK: SubjCode, Year, Semester REFERENCES SubjectOffering
FK: StudentID REFERENCES student 

STUDENT (StudentID, Surname, GivenName, Gender)
PK:StudentID */

-- need to chec the composite key for enrolement is right the way it is written
-- also need to check about the nullls

-- TASK 2 ---

/* data dictionary not available at this time */

-- TASK 3
/* IF OBJECT_ID('ENROLMENT') IS NOT NULL
DROP TABLE ENROLMENT;
IF OBJECT_ID('SubjectOffering') IS NOT NULL
DROP TABLE SubjectOffering;
IF OBJECT_ID('SUBJECT') IS NOT NULL
DROP TABLE SUBJECT;
IF OBJECT_ID('TEACHER') IS NOT NULL
DROP TABLE TEACHER;
IF OBJECT_ID('STUDENT') IS NOT NULL
DROP TABLE STUDENT;


CREATE TABLE SUBJECT
(SubjCode NVARCHAR(50), 
Description NVARCHAR(50), 
PRIMARY KEY (SubjCode)
);


CREATE TABLE TEACHER
(StaffID NVARCHAR(50), 
Surname NVARCHAR(50), 
GivenName NVARCHAR(50),
PRIMARY KEY (StaffID)
);

CREATE TABLE SubjectOffering
(SubjCode NVARCHAR(50), 
Year INT, 
Semester INT,
Fee INT, 
StaffID NVARCHAR(50),
PRIMARY KEY (SubjCode, Year, Semester),
FOREIGN key (SubjCode) REFERENCES SUBJECT,
FOREIGN KEY (StaffID) REFERENCES teacher 
);

CREATE TABLE STUDENT
(StudentID NVARCHAR(50), 
Surname NVARCHAR(50), 
GivenName NVARCHAR(50), 
Gender CHAR NULL,
PRIMARY KEY (StudentID)
);

CREATE TABLE ENROLMENT
(StudentID NVARCHAR(50), 
SubjCode NVARCHAR(50),
Year INT, 
Semester INT,
DateEnrolled DATE NULL,
Grade NVARCHAR(5),
PRIMARY KEY (StudentID, SubjCode, Year, Semester), 
FOREIGN KEY (SubjCode, Year, Semester) REFERENCES SubjectOffering,
FOREIGN KEY (StudentID) REFERENCES student 
);

GO */

-- task 3 prove all tables have been created -- 
/* SELECT 
    *
FROM
    information_schema.tables; */

INSERT INTO SUBJECT (SubjCode, Description) VALUES
('ICTWEB425', 'Apply SQL to extract & manipulate data'),
('ICTDBS403', 'Create Basic Databases'),
('ICTDBS502', 'Design a Database');


INSERT INTO TEACHER (StaffID, Surname,GivenName) VALUES
('98776655', 'Starr', 'Ringo'),
('87665544', 'Lennon', 'John'),
('76554433', 'McCartney', 'Paul');


INSERT INTO SubjectOffering (Year,Semester, Fee, StaffID) VALUES
('ICTWEB425'	'2018'	'1'	'200'	'98776655'),
('ICTWEB425'	'2019'	'1'	'225'	'98776655'),
('ICTDBS403'	'2019'	'1'	'200'	'87665544'),
('ICTDBS403'	'2019'	'2'	'200'	'76554433'),
('ICTDBS502'	'2018'	'2'	'225'	'87665544');


INSERT INTO ENROLMENT ( StudentID, SubjCode, Year, Semester, DateEnrolled, Grade) VALUES
('ICTWEB425'	'2018'	'1'	'200'	'98776655')
('ICTWEB425'	'2019'	'1'	'225'	'98776655')
('ICTDBS403'	'2019'	'1'	'200'	'87665544')
('ICTDBS403'	'2019'	'2'	'200'	'76554433')
('ICTDBS502'	'2018'	'2'	'225'	'87665544')


INSERT INTO STUDENT (StudentID, Surname, GivenName, Gender) VALUES
('s12233445'	'Morrison'	'Scott'	'M'),
('s23344556'	'Gillard'	'Julia'	'F'),
('s34455667'	'Whitlam'	'Gough'	'M');

