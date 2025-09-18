# 🎓 College Database Management System (SQL Project)

The **College Database Management System** is a SQL project built using **MySQL** that simulates an academic environment with relational tables such as Students, Courses, and Enrollments. It demonstrates the use of both **DDL (Data Definition Language)** and **DML (Data Manipulation Language)** for creating, managing, and manipulating data, along with advanced SQL concepts like **joins, subqueries, views, triggers, window functions, and user privileges**. The project focuses on database integrity, analytical insights, and secure data access.  

## 🔹 Tools & Technologies  
- MySQL for database management  
- SQL Workbench / CLI for execution  
- DDL & DML Queries (CREATE, INSERT, UPDATE, DELETE, DROP, TRUNCATE)  
- Advanced SQL concepts: Joins, Subqueries, Views, Triggers, Window Functions (RANK, ROW_NUMBER), and GRANT for user security  

## 🔹 Features  
- Student Management: Add, update, and delete student records  
- Course Management: Define courses with IDs and credits  
- Enrollment Tracking: Manage student-course relationships  
- Grading & Ranking: Use window functions to calculate ranks and performance  
- Views: Create reusable queries for quick reporting  
- Triggers: Automate business rules and maintain integrity  
- Access Control: Manage permissions with GRANT to secure data  

## 🔹 Example Queries  
**1.Create Students table:**  
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(100),
    Age INT,
    Department VARCHAR(50)
);
2. **Inner Join (Students with Courses)**
SELECT s.Name, c.CourseName
FROM Students s
INNER JOIN Enrollment e ON s.StudentID = e.StudentID
INNER JOIN Courses c ON e.CourseID = c.CourseID;

3. **Rank Students by Marks**
SELECT StudentID, Marks,
RANK() OVER (ORDER BY Marks DESC) AS RankPosition
FROM Results;

4.**Create a View for Performance**
CREATE VIEW StudentPerformance AS
SELECT s.Name, c.CourseName, r.Marks
FROM Students s
JOIN Results r ON s.StudentID = r.StudentID
JOIN Courses c ON r.CourseID = c.CourseID;

**Insights & Learnings**
This project strengthened my ability to build normalized relational databases, perform advanced SQL queries, and ensure data integrity. I practiced Joins, Subqueries, Triggers, and Views to handle complex database requirements, applied Window Functions for ranking and analytics, and implemented GRANT for access control. These skills are essential for real-world database management and data analytics.

🔹 **Conclusion**

The College Database Management System project provided hands-on experience in SQL programming and relational database management. It enhanced my skills in designing databases, maintaining data integrity, applying business logic with triggers, creating analytical insights with queries and views, and ensuring security through permissions. This project not only improved my technical expertise but also prepared me to solve real-time database and analytics challenges.
