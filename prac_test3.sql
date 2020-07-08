-- 102151272 BEN GARDINER

-- tASK 1 SCHEMA

/* 
SUBJECT (SubjCode, Description)
PK: SubjCode

STUDENT (StudentID, Surname, GivenName, Gender)
PK: StudentID

TEACHER (StaffID, Surname, GivenName)
PK: StaffID

ENROLMENT (StudentID, Year, Semester, StaffID, SubjCode, DateEnrolled, Grade)
PK: StudentID, Year, Semester, StaffID, SubjCode
FK: StudentID REFERENCES STUDENT
FK: Year, Semester, StaffID, SubjCode REFERENCES SUBJECT_OFFERING


SUBJECT_OFFERING (SubjCode, StaffID, Year, Semester, Fee)
PK:SubjCode, StaffID, Year, Semester
FK:SubjCode REFERENCES SUBJECT
FK:StaffID REFERENCES TEACHER 

*/

-- Task 2

/* DROP TABLE IF EXISTS ENROLLMENT;
DROP TABLE IF EXISTS SUBJECT_OFFERING;
DROP TABLE IF EXISTS STUDENT;
DROP TABLE IF EXISTS TEACHER;
DROP TABLE IF EXISTS SUBJECT;

GO

SELECT 
    *
FROM
    information_schema.tables; */


DROP TABLE IF EXISTS ENROLLMENT;
DROP TABLE IF EXISTS SUBJECT_OFFERING;
DROP TABLE IF EXISTS STUDENT;
DROP TABLE IF EXISTS TEACHER;
DROP TABLE IF EXISTS SUBJECT;



CREATE TABLE SUBJECT(
SubjCode NVARCHAR(100) 
, Description NVARCHAR(500)
, PRIMARY KEY (SubjCode)
);


CREATE TABLE TEACHER(
StaffID INT CONSTRAINT check_TEACHER_sTAFFid CHECK (LEN(StaffID)= 8)
, Surname NVARCHAR(100) NOT NULL
, GivenName NVARCHAR(100) NOT NULL
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

-- Task 2 check Tables

SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES;
EXEC SP_COLUMNS Subject;
EXEC SP_COLUMNS Student;
EXEC SP_COLUMNS Teacher;
EXEC SP_COLUMNS SubjectOffering;
EXEC SP_COLUMNS Enrolment;

GO