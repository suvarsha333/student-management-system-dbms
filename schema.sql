CREATE DATABASE StudentManagementSystem;
USE StudentManagementSystem;

CREATE TABLE Student(
    StudentID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT,
    Department VARCHAR(50)
);

CREATE TABLE Course(
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(50),
    Credits INT
);

CREATE TABLE Enrollment(
    StudentID INT,
    CourseID INT,
    Grade CHAR(2),
    PRIMARY KEY(StudentID, CourseID),
    FOREIGN KEY(StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY(CourseID) REFERENCES Course(CourseID)
);

INSERT INTO Student VALUES (1, 'Ravi', 20, 'CSE');
INSERT INTO Student VALUES (2, 'Anita', 21, 'ECE');
INSERT INTO Student VALUES (3, 'Seetha', 20, 'CSE');
INSERT INTO Student VALUES (4, 'Ram', 19, 'IT');

INSERT INTO Course VALUES (101, 'Database Systems', 4);
INSERT INTO Course VALUES (102, 'Operating Systems', 3);
INSERT INTO Course VALUES (103, 'Computer Networks', 3);

INSERT INTO Enrollment VALUES (1,101,'A');
INSERT INTO Enrollment VALUES (2,102,'B');
INSERT INTO Enrollment VALUES (3,101,'A');
INSERT INTO Enrollment VALUES (4,103,'B');

SELECT Student.Name, Course.CourseName, Enrollment.Grade
FROM Enrollment
JOIN Student ON Enrollment.StudentID = Student.StudentID
JOIN Course ON Enrollment.CourseID = Course.CourseID;