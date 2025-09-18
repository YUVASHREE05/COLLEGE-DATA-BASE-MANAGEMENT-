CREATE DATABASE CollegeDB;
USE CollegeDB;
CREATE TABLE Students (student_id INT PRIMARY KEY,
    name VARCHAR(100),
    age INT,
    department VARCHAR(50));
    CREATE TABLE Courses (course_id INT PRIMARY KEY,
    course_name VARCHAR(100),
    credits INT);
    CREATE TABLE Enrollments (
    enroll_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    grade DECIMAL(5,2),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id));
    ALTER TABLE Students ADD email VARCHAR(100);

INSERT INTO Students VALUES (1, 'Alice', 20, 'CS', 'alice@example.com');
INSERT INTO Students VALUES (2, 'Bob', 21, 'IT', 'bob@example.com');
INSERT INTO STUDENTS VALUES (3,'MAY',22,'HONS','MAY@EXAMPLE.COM');
INSERT INTO STUDENTS VALUES (4,'LOVE',23,'AF','AF@EXAMPLE.COM');
INSERT INTO STUDENTS VALUES (5,'JAY',24,'COP','JAY@EXAMPLE.COM');

INSERT INTO Courses VALUES (101, 'Database Systems', 3);
INSERT INTO Courses VALUES (102, 'Data Structures', 4);
INSERT INTO Courses VALUES (103, 'Database systems', 5);
INSERT INTO Courses VALUES (104, 'Data Structures', 2);
INSERT INTO Courses VALUES (105, 'Data Structures', 4);

INSERT INTO Enrollments VALUES (1, 1, 101, 88.5);
UPDATE Students SET age = 22 WHERE name = 'Bob';
INSERT INTO Enrollments VALUES (2, 2, 101, 78.0);
INSERT INTO Enrollments VALUES (3, 3, 102, 68.0);
INSERT INTO Enrollments VALUES (4, 4, 103, 66.0);
INSERT INTO Enrollments VALUES (5, 5, 105, 98.0);


UPDATE Students SET age = 22 WHERE name = 'Bob';
SELECT name FROM Students
UNION
SELECT course_name FROM Courses;
SELECT name FROM Students
UNION ALL
SELECT course_name FROM Courses;

SELECT s.name, c.course_name
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
JOIN Courses c ON e.course_id = c.course_id;

DELETE FROM Enrollments WHERE grade < 80;

SELECT SUM(grade), AVG(grade), COUNT(*) FROM Enrollments;

SELECT student_id, grade, 
RANK() OVER (ORDER BY grade DESC) AS rank_position
FROM Enrollments;

SELECT student_id, AVG(grade) as avg_grade
FROM Enrollments
GROUP BY student_id
ORDER BY avg_grade DESC;
SELECT name FROM Students
WHERE student_id IN (
    SELECT student_id FROM Enrollments WHERE grade > 85);
    
TRUNCATE TABLE Enrollments;

DROP TABLE Enrollments;

CREATE USER 'readonly_user'@'localhost' IDENTIFIED BY 'password123';
GRANT SELECT ON CollegeDB.* TO 'readonly_user'@'localhost';

CREATE VIEW student_grades AS
SELECT s.name, c.course_name, e.grade
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
JOIN Courses c ON c.course_id = e.course_id;
 SELECT * FROM STUDENT_GRADES;

DELIMITER $$
CREATE TRIGGER before_enroll_insert
BEFORE INSERT ON Enrollments
FOR EACH ROW
BEGIN
    IF NEW.grade < 0 OR NEW.grade > 100 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Grade must be between 0 and 100';
    END IF;
END$$
DELIMITER ;

-- Input from form: '1 OR 1=1'
SELECT * FROM Students WHERE student_id = '1 OR 1=1';


SELECT student_id, grade,
       AVG(grade) OVER (PARTITION BY student_id) AS avg_by_student
FROM Enrollments;
    
