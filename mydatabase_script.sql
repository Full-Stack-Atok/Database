-- Create 5 tables
CREATE TABLE Students (
    student_id INTEGER PRIMARY KEY,
    name TEXT,
    age INTEGER,
    major TEXT
);

CREATE TABLE Courses (
    course_id INTEGER PRIMARY KEY,
    course_name TEXT,
    credits INTEGER
);


CREATE TABLE Enrollments (
    enrollment_id INTEGER PRIMARY KEY,
    student_id INTEGER,
    course_id INTEGER,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

CREATE TABLE Professors (
    professor_id INTEGER PRIMARY KEY,
    name TEXT,
    department TEXT 
);

CREATE TABLE Departments (
    department_id INTEGER PRIMARY KEY,
    department_name TEXT
);

-- Insert 25 Rows (Populating Tables)
INSERT INTO Students (name, age, major) VALUES
    ('Alice', 20, 'Computer Science'),
    ('Bob', 22, 'Mathematics'),
    ('Charlie', 21, 'Physics'),
    ('David', 23, 'Engineering'),
    ('Eve', 19, 'Biology');

INSERT INTO Courses (course_name, credits) VALUES 
    ('Database System', 3),
    ('Linear Algebra', 4),
    ('Physics 101', 3),
    ('Computer Networks', 3),
    ('Chemistry', 3);

INSERT INTO Enrollments (student_id, course_id) VALUES
    (1, 1), (1, 2), (2,3), (3, 4), (4, 5);

INSERT INTO Professors (name, department) VALUES
    ('Dr. Smith', 'Computer Science'),
    ('Dr. Johnson', 'Mathematics'),
    ('Dr. Brown', 'Physics'),
    ('Dr. White', 'Engineering'),
    ('Dr. Green', 'Biology'); 

INSERT INTO Departments (department_name) VALUES
    ('Computer Science'),
    ('Mathematics'),
    ('Physics'),
    ('Engineering'),
    ('Biology');

-- Create 30 SQL Views

CREATE VIEW StudentDetails AS
SELECT student_id, name, age, major FROM Students;

CREATE VIEW CourseDetails AS
SELECT course_id, course_name, credits FROM Courses;

CREATE VIEW EnrollmentSummary AS
SELECT e.enrollment_id, s.name AS student_name, c.course_name
FROM Enrollments e
JOIN Students s ON e.student_id = s.student_id
JOIN Courses c ON e.course_id = c.course_id;

CREATE VIEW ProfessorDetails AS
SELECT professor_id, name, department FROM Professors;

CREATE VIEW DepartmentDetails AS
SELECT department_id, department_name FROM Departments;