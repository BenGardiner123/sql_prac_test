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

DROP TABLE IF EXISTS ENROLLMENT;
DROP TABLE IF EXISTS SUBJECT_OFFERING;
DROP TABLE IF EXISTS STUDENT;
DROP TABLE IF EXISTS TEACHER;
DROP TABLE IF EXISTS SUBJECT;

GO

CREATE TABLE SUBJECT (
    SubjCode NVARCHAR(100),
    Description NVARCHAR(500)
)

CREATE TABLE STUDENT (
    StudentID NVARCHAR(10), 
    Surname NVARCHAR(100) NOT NULL, 
    GivenName NVARCHAR(100) NOT NULL, 
    Gender NVARCHAR(1) CONSTRAINT Check_student_gender CHECK (Gender = "M""F""I") NULL,
    PRIMARY KEY (StudentID)
);

CREATE TABLE TEACHER (
    StaffID INT CONSTRAINT Check_teacher_staff_id CHECK (LENGTH(StaffID) = 8), 
    Surname NVARCHAR(100) NOT NULL, 
    GivenName NVARCHAR(100) NOT NULL
);

CREATE TABLE ENROLLMENT (
    StudentID NVARCHAR(10), 
    Year INT CONSTRAINT Check_Enrollment_Year CHECK (LENGTH (Year) = 4), 
    SubjCode NVARCHAR(100) , 
    Semester INT CONSTRAINT Check_Enrollment_Semester CHECK (Semester = 1 OR Semester = 2), 
    DateEnrolled DATE, 
    Grade NVARCHAR(2) CONSTRAINT Check_Enrollment_Grade CHECK (Grade = 'N''P''C''D''HD') NULL,
    PRIMARY KEY (StudentID, Year, Semester, StaffID, SubjCode),
    FOREIGN KEY (StudentID) REFERENCES STUDENT,
    FOREIGN KEY (SubjCode, Year, Semester) REFERENCES SUBJECT_OFFERING
);

CREATE TABLE SUBJECT_OFFERING (
    SubjCode NVARCHAR(100), 
    StaffID INT CONSTRAINT Check_SubjectOffering_staff_id CHECK (LENGTH(StaffID) = 8) NULL, 
    Year INT CONSTRAINT Check_SubjectOffering_Year CHECK (LENGTH (Year) = 4), 
    Semester INT CONSTRAINT Check_SubjectOffering_Semester CHECK (Semester = 1 OR Semester = 2),  
    Fee MONEY CONSTRAINT Check_SubjectOffering_Fee CHECK (Fee > 0)
);

SELECT * 
FROM sys.tables;