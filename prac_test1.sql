/* Ben Gardiner 102151272 */


IF OBJECT_ID('Enrolment') IS NOT NULL
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
Gender NVARCHAR(1) CONSTRAINT Check_student_gender CHECK (Gender = 'M''F''I') NULL,
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
Grade NVARCHAR(2) CONSTRAINT Check_Enrolment_Grade CHECK (Grade = 'N''P''C''D''HD') DEFAULT (NULL),
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
FROM sys.tables;