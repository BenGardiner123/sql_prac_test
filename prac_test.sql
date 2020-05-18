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



