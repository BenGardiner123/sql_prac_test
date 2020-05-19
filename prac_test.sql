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
PK: (StudentID, SubjCode, Year, Semester)
FK: (SubjCode, Year, Semester) REFERENCES SubjectOffering
FK: (StudentID) REFERENCES student 

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

GO    */

-- task 3 prove all tables have been created -- 
/* SELECT 
    *
FROM
    information_schema.tables; */

/* INSERT INTO SUBJECT (SubjCode, Description) VALUES
('ICTWEB425', 'Apply SQL to extract & manipulate data'),
('ICTDBS403', 'Create Basic Databases'),
('ICTDBS502', 'Design a Database');


INSERT INTO TEACHER (StaffID, Surname,GivenName) VALUES
('98776655', 'Starr', 'Ringo'),
('87665544', 'Lennon', 'John'),
('76554433', 'McCartney', 'Paul');


INSERT INTO SubjectOffering (SubjCode, Year, Semester, Fee, StaffID) VALUES
('ICTWEB425',   '2018',	'1', '200', '98776655'),
('ICTWEB425',	'2019',	'1',  '225', '98776655'),
('ICTDBS403',	'2019',	'1', '200', '87665544'),
('ICTDBS403',	'2019',	'2', '200', '76554433'),
('ICTDBS502',	'2018',	'2', '225', '87665544');

INSERT INTO STUDENT (StudentID, Surname, GivenName, Gender) VALUES
('s12233445',   'Morrison', 'Scott',	'M'),
('s23344556',	'Gillard',	'Julia',	'F'),
('s34455667',	'Whitlam',	'Gough',	'M'),
('s102151272',	'Gardiner',	'Ben',	    'M'), 
('s1223344',	'Mitch',	'Mitch',	'M'); 
 


INSERT INTO ENROLMENT (StudentID, SubjCode, Year, Semester, DateEnrolled, Grade) VALUES
('s1223344', 'ICTWEB425','2018',	'1', NULL,	'D'),
('s23344556','ICTWEB425', '2018',	'1', NULL,	'P'),
('s1223344', 'ICTWEB425', '2019',   '1', NULL,	'C'),
('s23344556', 'ICTWEB425', '2019',	'1', NULL,	'HD'),
('s34455667', 'ICTWEB425', '2019',	'1', NULL,	'P'),
('s1223344', 'ICTDBS403', '2019',	'1', NULL,	'C'),
('s23344556', 'ICTDBS403', '2019',	'2', NULL,   NULL),
('s34455667', 'ICTDBS403', '2019',	'2', NULL,   NULL),
('s23344556', 'ICTDBS502', '2018',	'2', NULL,	'P'),
('s34455667', 'ICTDBS502', '2018',	'2', NULL,	'N');   */


-- select *
-- need to check with tim how to do this better--
-- also need a better shortcut to enter and separate the data

/* 
Query 1:
Write a query that shows the student first name and surname, the subject code and
description, the subject offering year, semester & fee and the given name and surname of the
teacher for that subject offering.
inner joins

*/
-- Select rows from a Table or View 'TableOrViewName' in schema 'SchemaName'
/* SELECT st.GivenName, st.Surname, s.SubjCode, s.[Description], so.[Year], so.Semester, so.Fee, t.GivenName, t.Surname

/* stu.GivenName, stu.Surname, sub.SubjCode, sub.Description, suboff.subjyear, suboff.semester, suboff.fee, t.GivenName, t.Surname
 */

/* FROM  ENROLMENT e
LEFT JOIN SubjectOffering so
ON e.SubjCode = so.SubjCode
AND e.year = so.year
AND e.Semester = so.Semester
-- use and to join tables with composite keys

LEFT JOIN student st 
ON e.StudentID  = st.StudentID

LEFT join subject s 
on so.SubjCode = s.SubjCode

left join teacher t
on so.StaffID = t.StaffID

ORDER BY s.SubjCode; 



SELECT * 
FROM sys.tables;
 */


/* Query 2:
• Write a query which shows the number of enrolments, for each year and semester in the
following example format. For example:  
----i think this is a count  */
/* 
SELECT E.YEAR, E.SEMESTER, COUNT(*) as 'Num Enrollments'

FROM ENROLMENT E

GROUP BY E.YEAR, E.Semester

ORDER BY E.Year ASC, E.SEMESTER DESC; */

-- this looks correct==== yes only took me 20 minutes




/* Query 3:
Write a query which lists all enrolments which for the subject offering which has the highest
fee. (This query must use a sub-query.) 
*/
-- SELECT *


-- ENROLMENTS HAS A RELATIONSHIP WITH SUBJECTOFFERING WHIC HAS A COMPSITEE KEY THAT REQUIRES THE AND ++ BELOW. wHERE SELECTS THE FEILD AND THEN USE A SUBQUERY TO SELECT THE THE MAX VALUE(FEE) FORM SUBJECT OFFERING AND BIIND IT TO THE FEE IN THE WHERE. 
/* FROM ENROLMENT E 
LEFT JOIN SubjectOffering SO
ON E.SubjCode = SO.SubjCode
AND E.YEAR = SO.YEAR
AND E.SEMESTER = SO.Semester

WHERE SO.Fee = (SELECT MAX(SO.Fee) FROM SubjectOffering SO
)

ORDER BY SO.SubjCode ASC; */

-- THINK THIS IS OK


-- TASK 5 need to create a view  for the QUERY 1 IN TASK 4
/* 
*/


/*  CREATE VIEW ENRLALL AS
-- here i have to create aliases for the given name and surnames. The view has no way of knowing that they are from different tables.
SELECT st.GivenName as "student given name", st.Surname as "student surname", s.SubjCode, s.[Description], so.[Year], so.Semester, so.Fee, t.GivenName as "Teachers Given Name", t.Surname as "Teacher Surname"

FROM  ENROLMENT e
LEFT JOIN SubjectOffering so
ON e.SubjCode = so.SubjCode
AND e.year = so.year
AND e.Semester = so.Semester
-- use and to join tables with composite keys

LEFT JOIN student st 
ON e.StudentID  = st.StudentID

LEFT join subject s 
on so.SubjCode = s.SubjCode

left join teacher t
on so.StaffID = t.StaffID  */


--can't use order by apprently in a view ====ORDER BY s.SubjCode;  


/* 

select *
FROM ENRLALL; 
--DROP VIEW ENRLALL;
*/


--task 6 ---------------------------------

select count(SubjCode)
from ENROLMENT;
-- this does not count any null values as enrolment date is potentially null you could end up counting instances wher thestudent is not enrolled.





