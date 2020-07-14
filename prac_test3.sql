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


/* DROP TABLE IF EXISTS ENROLLMENT;
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

GO */

-- TASK 3 Insert test data

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

GO 

SELECT *

FROM STUDENT;

*/

-- Task 4 ---- 

/* SELECT st.GivenName, st.Surname, so.subjCode, s.Description, so.Year, so.Semester, so.Fee, t.GivenName, t.Surname
FROM  SUBJECTOFFERING so 
left JOIN ENROLMENT e 
ON so.SubjCode = e.SubjCode
AND so.Year = e.Year
AND so.Semester = e.Semester

LEFT JOIN STUDENT st
ON st.StudentID = e.studentID 

LEFT JOIN SUBJECT s
ON s.SubjCode = so.SubjCode

LEFT JOIN TEACHER t
ON t.StaffID = so.StaffID
 */

/* SELECT e.Year, e.Semester, COUNT(Distinct e.StudentID) as 'Num_Enrolments'
FROM ENROLMENT e
GROUP BY e.YEAR, e.Semester
ORDER BY YEAR ASC, Semester DESC; 
 */

/* SELECT *
FROM ENROLMENT E
INNER JOIN SUBJECTOFFERING SO
ON SO.Subjcode = E.Subjcode
AND SO.YEAR = E.YEAR
AND SO.Semester = E.Semester

WHERE SO.FEE = (SELECT MAX(SO.Fee) FROM SUBJECTOFFERING SO)

ORDER BY SO.Subjcode ASC; */

-- Create the view in the specified schema
/* CREATE VIEW fullenrol
AS
    -- body of the view
    SELECT st.GivenName as "Student Given Name",
        st.Surname as "Student Surname",
        s.Subjcode as "Subject Code",
        s.Description, 
        so.Year, 
        so.Semester,
        so.Fee, 
        t.GivenName as "Teacher Given Name", 
        t.Surname as "Teacher Surname"
    FROM  SUBJECTOFFERING so 
    left JOIN ENROLMENT e 
    ON so.SubjCode = e.SubjCode
    AND so.Year = e.Year
    AND so.Semester = e.Semester

    LEFT JOIN STUDENT st
    ON st.StudentID = e.studentID 

    LEFT JOIN SUBJECT s
    ON s.SubjCode = so.SubjCode

    LEFT JOIN TEACHER t
    ON t.StaffID = so.StaffID  */

SELECT * 
FROM fullenrol; 
       