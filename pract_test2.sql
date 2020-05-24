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


-- task2------

/*  IF OBJECT_ID('ENROLMENT') IS NOT NULL
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
  */

--  task 3 ----- 
/* INSERT INTO STUDENT (StudentId, Surname, GivenName, Gender) VALUES
('s12233445',	'Morrison',	'Scott',	'M'),
('s23344556',	'Gillard',	'Julia',	'F'),
('s39349499',	'Gardienr',	'Ben',	    'M'),
('s34455667',	'Whitlam',	'Gough',	'M');


INSERT INTO Subject (subjCode, Description) VALUES
('ICTWEB425',	'Apply SQL to extract & manipulate data'),
('ICTDBS403',	'Create Basic Databases'),
('ICTDBS502',	'Design a Database');


INSERT INTO Teacher (StaffID, Surname, GivenName) VALUES
('98776655',	'Starr',	'Ringo'),
('87665544',    'Lennon',	'John'),
('76554433',	'McCartney', 'Paul'); 


INSERT INTO SubjectOffering (SubjCode,Year,Semester,Fee,StaffID) VALUES
('ICTWEB425',	'2018',	'1',	'200',	'98776655'),
('ICTWEB425',	'2019',	'1',	'225',	'98776655'),
('ICTDBS403',	'2019',	'1',	'200',	'87665544'),
('ICTDBS403',	'2019',	'2',	'200',	'76554433'),
('ICTDBS502',	'2018',	'2',	'225',	'87665544');

INSERT INTO ENROLMENT (StudentId, SubjCode, Year, Semester, Grade) VALUES
('s12233445',    'ICTWEB425',	'2018',	'1',	'D'),
('s23344556',   'ICTWEB425',	'2018',	'1',	'P'),
('s12233445',    'ICTWEB425',	'2019',	'1',	'C'),
('s23344556',	'ICTWEB425',    '2019',	'1',	'HD'),
('s34455667',	'ICTWEB425',	'2019',	'1',	'P'),
('s12233445',    'ICTDBS403',	'2019',	'1',	'C'),
('s23344556',	'ICTDBS403',	'2019',	'2',    NULL),
('s34455667',	'ICTDBS403',	'2019',	'2',	NULL),
('s23344556',	'ICTDBS502',	'2018',	'2',	'P'),
('s34455667',	'ICTDBS502',	'2018',	'2',	'N');  */
/* 
SELECT *
FROM Student; */

SELECT 
ST.GivenName,
ST.Surname,
E.SubjCode,
S.Description,
E.Year,
E.Semester, 
SO.Fee, 
T.GivenName,
T.Surname

FROM ENROLMENT E
LEFT JOIN SubjectOffering SO 
ON SO.SubjCode = E.SubjCode
AND SO.[Year] = E.[Year]
AND SO.Semester = E.Semester

LEFT JOIN Student ST
ON st.StudentID = e.StudentID

LEFT JOIN Subject S
on S.SubjCode = so.SubjCode

LEFT join Teacher T
on T.StaffID = so.StaffID



