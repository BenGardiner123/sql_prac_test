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
Year DATE, 
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
Gender CHAR,
PRIMARY KEY (StudentID)
);

CREATE TABLE ENROLMENT
(StudentID NVARCHAR(50), 
SubjCode NVARCHAR(50),
Year DATE, 
Semester INT,
DateEnrolled DATE,
PRIMARY KEY (StudentID, SubjCode, Year, Semester), 
FOREIGN KEY (SubjCode, Year, Semester) REFERENCES SubjectOffering,
FOREIGN KEY (StudentID) REFERENCES student 
);

GO */

SELECT 
    *
FROM
    information_schema.tables;