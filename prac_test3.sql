-- 102151272 BEN GARDINER

-- tASK 2 SCHEMA

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