-- Ben garadiner 102151272

-- task1-------
/* SUBJECT (SubjCode, Description)
PK:SubjCode

TEACHER(StaffID, Surname, GivenName)
PK:StaffID

SUBJECTOFFERING (SubjCode, Year, Semester, Fee, StaffID)
PK:SubjCode, Year, Semester
FK:(SubjCode) REFERENCES Subject
FK:(StaffID) REFERENCES Teacher

STUDENT(StudentID, Surname, GivenName, Gender)
PK:StudentID

ENROLMENT(StudentID, SubjCode, Year, Semester, DateEnrolled, Grade)
PK:SubjCode, Year, Semester
FK:(SubjCode, Year, Semester) REFERENCES SubjectOffering */


-- task2-------
IF OBJECT_ID('ENROLMENT') IS NOT NULL
DROP TABLE ENROLMENT;
IF OBJECT_ID('SUBJECTOFFERING') IS NOT NULL
DROP TABLE SUBJECTOFFERING;
IF OBJECT_ID('SUBJECT') IS NOT NULL
DROP TABLE SUBJECT;
IF OBJECT_ID('TEACHER') IS NOT NULL
DROP TABLE TEACHER;
IF OBJECT_ID('STUDENT') IS NOT NULL
DROP TABLE STUDENT;


CREATE TABLE SUBJECT(
SubjCode NVARCHAR(100) 
, Description NVARCHAR(500)
, PRIMARY KEY (SubjCode)
);


CREATE TABLE TEACHER(
StaffID INT CONSTRAINT check_TEACHER_sTAFFid CHECK (LEN(StaffID)= 8)
, Surname NVARCHAR(50) NOT NULL
, GivenName NVARCHAR(1) NOT NULL
, PRIMARY KEY (StaffID)
);


CREATE TABLE SUBJECTOFFERING(
SubjCode NVARCHAR(100)
, Year INT CONSTRAINT check_subjoffering_Year CHECK (LEN(Year)= 4)
, Semester INT CONSTRAINT check_subjoffering_Semester CHECK (Semester = 1 or Semester = 2)
, Fee MONEY CONSTRAINT check_subjoffering_Fee CHECK (Fee > 0) NOT NULL 
, StaffID INT NULL
, PRIMARY KEY (SubjCode, Year, Semester) 
, Foreign key (SubjCode) REFEReNCES SUBJECT
, Foreign key (StaffID) REFEReNCES TEACHER
);


CREATE TABLE STUDENT(
StudentID NVARCHAR(10)
, Surname NVARCHAR(100) NOT NULL
, GivenName NVARCHAR(100) NOT NULL
, Gender NVARCHAR(1) CONSTRAINT Check_Student_Gender CHECK (Gender = 'M' or Gender = 'F' OR Gender = 'I') NULL
, PRIMARY KEY (StudentID)
);


CREATE TABLE ENROLMENT(
StudentID NVARCHAR(10)
, SubjCode NVARCHAR(100)
, Year INT CONSTRAINT check_ENROLMENT_Year CHECK (LEN(Year)= 4)
, Semester INT CONSTRAINT check_ENROLMENT_Semester CHECK (Semester = 1 or Semester = 2)
, Grade NVARCHAR(2) CONSTRAINT check_ENROLMENT_Grade CHECK(Grade in('N', 'P', 'C', 'D', 'HD')) NULL
, DateEnrolled DATE
, PRIMARY KEY (StudentID, SubjCode, Year, Semester)
, FOREIGN KEY (SubjCode, Year, Semester) REFERENCES SUBJECTOFFERING
, FOREIGN KEY (StudentID) REFERENCES STUDENT
);

GO

-- task2 CHECK TABLES-------

SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES;
​
EXEC SP_COLUMNS Subject;
EXEC SP_COLUMNS Student;
EXEC SP_COLUMNS Teacher;
EXEC SP_COLUMNS SubjectOffering;
EXEC SP_COLUMNS Enrolment;
​
GO
