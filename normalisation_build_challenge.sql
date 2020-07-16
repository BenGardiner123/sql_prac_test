/* 
DROP TABLE STAFF;  
DROP TABLE COURSE;
DROP TABLE WAREHOUSE;
DROP TABLE CUSTOMER;
DROP TABLE BOOKING;
DROP TABLE COURSE_OFFERING;  
DROP TABLE STAFF_ALLOCATION;
 */


SELECT *
FROM
information_schema.tables; 


/* CREATE TABLE STAFF (
StaffLastname NVARCHAR(100) NOT NULL,	  
StaffFirstName	NVARCHAR(100) NOT NULL,	
StaffID	NVARCHAR(100) NOT NULL,
PRIMARY KEY (StaffID)	
);

CREATE TABLE WAREHOUSE(
WarehouseLocation NVARCHAR(100) NOT NULL,
PRIMARY KEY (WarehouseLocation)	
);

CREATE TABLE CUSTOMER (
CustomerID NVARCHAR(50),		
CustomerName  NVARCHAR(100) NOT NULL,
CustomerAddress	NVARCHAR(100) NOT NULL,
CustomerCity  NVARCHAR(100) NOT NULL,
PRIMARY KEY (CustomerID)	
);

CREATE TABLE COURSE (
CourseID	NVARCHAR(25),
CourseName	NVARCHAR(100) NOT NULL,
PRIMARY KEY (CourseID)	
);

CREATE TABLE COURSE_OFFERING (
WarehouseLocation NVARCHAR(100) NOT NULL,
CourseID NVARCHAR(25) NOT NULL,
CourseDate DATE,
PRIMARY KEY (WarehouseLocation,CourseID,CourseDate), 
FOREIGN KEY (CourseID) REFERENCES COURSE,
FOREIGN KEY (WarehouseLocation) REFERENCES WAREHOUSE
);

CREATE TABLE BOOKING (
CustomerID NVARCHAR(50) NOT NULL,	
WarehouseLocation NVARCHAR(100) NOT NULL,	
CourseID NVARCHAR(25) NOT NULL,	
CourseDate DATE,
BookingDate	DATE,
PaymentAmount MONEY CHECK (PaymentAmount > 0) NOT NULL, 
Review NVARCHAR(100) NULL,

PRIMARY KEY (CustomerID, WarehouseLocation, CourseID, CourseDate),	
FOREIGN KEY (WarehouseLocation, CourseID, CourseDate) REFERENCES COURSE_OFFERING,
FOREIGN KEY (CustomerID) REFERENCES CUSTOMER
);

CREATE TABLE STAFF_ALLOCATION (
StaffID NVARCHAR(100) NOT NULL,
CourseDate DATE,
WarehouseLocation NVARCHAR(100) NOT NULL,
CourseID NVARCHAR(25) NOT NULL,
PRIMARY KEY (StaffID, CourseDate, CourseID, WarehouseLocation),
FOREIGN KEY (StaffID) REFERENCES STAFF,
FOREIGN KEY (WarehouseLocation, CourseID, CourseDate) REFERENCES COURSE_OFFERING,
);  

SELECT 
    *
FROM
    information_schema.tables;  

INSERT INTO STAFF (StaffID, StaffFirstName, StaffLastname) VALUES
('10000212',	'Ben',	'Gardiner'),
('10000213',    'Harry',	'McLarry'),
('10000214',	'Toni',     'Tony'); 

INSERT INTO WAREHOUSE (WarehouseLocation) VALUES
('OAKLIEGH'),
('SKYE'), 
('DANDENONG');

INSERT INTO CUSTOMER (CustomerID, CustomerName, CustomerAddress, CustomerCity) VALUES
('193840923847', 'Barry', 'Welcome Street', 'Melbourne'),
('193834923847', 'Sally', 'Mrfode Street', 'Melbourne'),
('134403563847', 'Larry', 'Harfaor Street', 'Melbourne');

INSERT INTO COURSE (CourseID, CourseName) VALUES
('BRICK101', 'Basic Bricklaying'),
('CARPENTRY102', 'Basic Carpentry'),
('PLUMBING103', 'How to fix your toilet');

INSERT INTO COURSE_OFFERING (WarehouseLocation, CourseID, CourseDate) VALUES
('OAKLIEGH','BRICK101','2020-06-15'),
('SKYE','CARPENTRY102', '2020-06-15'), 
('DANDENONG','PLUMBING103', '2020-06-15');

INSERT INTO BOOKING (CustomerID, WarehouseLocation, CourseID, CourseDate, BookingDate, PaymentAmount, Review) VALUES
('193840923847', 'OAKLIEGH', 'BRICK101', '2020-06-15', '2020-03-15', '500.00', NULL),
('193834923847', 'SKYE', 'CARPENTRY102', '2020-06-15', '2020-03-32', '400.00', NULL),
('134403563847', 'DANDENONG', 'PLUMBING103', '2020-06-15', '2020-03-23', '600.00', 'This course was amazing i especiialy like the instructor Toni');

INSERT INTO STAFF_ALLOCATION (StaffID, CourseDate, WarehouseLocation, CourseID) VALUES
('10000212','2020-06-15','OAKLIEGH', 'BRICK101'),
('10000213', '2020-06-15', 'SKYE', 'CARPENTRY102'),
('10000214','2020-06-15','DANDENONG','PLUMBING103');  

GO 

