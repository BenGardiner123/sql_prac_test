-- Ben garadiner 102151272

/* SUBJECT (SubjCode, Description)
PK:SubjCode

TEACHER(StaffID, Surname, GivenName)
PK:StaffID

SUBJECTOFFERING (SubjCode, Year, Semester, Fee)
PK:SubjCode, Year, Semester
FK:(SubjCode) REFERENCES Subject

STUDENT(StudentID, Surname, GivenName, Gender)
PK:StudentID

ENROLMENT(StudentID, SubjCode, Year, Semester, DateEnrolled, Grade)
PK:SubjCode, Year, Semester
FK:(SubjCode, Year, Semester) REFERENCES SubjectOffering */



