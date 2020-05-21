/* Ben Gardiner 102151272 */

/*  IF OBJECT_ID('Enrolment') IS NOT NULL
DROP TABLE Enrolment;
IF OBJECT_ID('SubjectOffering') IS NOT NULL
DROP TABLE SubjectOffering;
IF OBJECT_ID('Student') IS NOT NULL
DROP TABLE Student;
IF OBJECT_ID('Teacher') IS NOT NULL
DROP TABLE Teacher;
IF OBJECT_ID('STUDENT') IS NOT NULL
DROP TABLE STUDENT;
IF OBJECT_ID('SUBJECT') IS NOT NULL
DROP TABLE SUBJECT;


GO

CREATE TABLE Subject(
SubjCode NVARCHAR(100),
Description NVARCHAR(100),
PRIMARY KEY (SubjCode)
);

CREATE TABLE Student(
StudentId NVARCHAR(10),
Surname NVARCHAR(100) NOT NULL,
GivenName NVARCHAR(100) NOT NULL,
Gender NVARCHAR(1) CONSTRAINT Check_student_gender CHECK (Gender = 'M' or Gender = 'F' or Gender = 'I') NULL,
PRIMARY KEY (StudentID)
);

CREATE TABLE SubjectOffering(
SubjCode NVARCHAR(100),
Year INT CONSTRAINT Check_SubjecOffering_Year CHECK (LEN(Year) = 4),
Semester INT CONSTRAINT Check_SubjecOffering_Semester CHECK (Semester = 1 OR Semester = 2), 
Fee MONEY CONSTRAINT Check_SubjecOffering_Fee CHECK (Fee > 0) NOT NULL, 
StaffID INT NOT NULL,
PRIMARY KEY (SubjCode, Year, Semester),
FOREIGN KEY (SubjCode) REFERENCES Subject
);

CREATE TABLE ENROLMENT(
StudentID NVARCHAR(10),
SubjCode NVARCHAR(100),
Year INT CONSTRAINT Check_Enrolment_Year CHECK (LEN(Year) = 4),
Semester INT CONSTRAINT Check_Enrolment_Semester CHECK (Semester = 1 OR Semester = 2),
Grade NVARCHAR(2) CONSTRAINT Check_Enrolment_Grade CHECK (Grade = 'N' OR Grade = 'P' OR Grade = 'C' OR Grade = 'D' OR Grade = 'HD') NULL,
-- not sure the default is required
DateEnrolled DATE, 
PRIMARY KEY (StudentID, SubjCode, Year, Semester),
FOREIGN KEY (StudentID) REFERENCES Student,
FOREIGN KEY (SubjCode, Year, Semester) REFERENCES SubjectOffering
);


CREATE TABLE Teacher(
StaffID INT CONSTRAINT Check_Teacher_StaffID CHECK (LEN(StaffID) = 8),
Surname NVARCHAR(100),
GivenName NVARCHAR(100),
PRIMARY KEY (StaffID)
);

SELECT * 
FROM sys.tables;    */
 

INSERT INTO STUDENT (StudentId, Surname, GivenName, Gender) VALUES
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


INSERT INTO SubjectOffering (SubjCode,Year,Semester,Fee,StaffID
) VALUES
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
('s34455667',	'ICTDBS502',	'2018',	'2',	'N');




