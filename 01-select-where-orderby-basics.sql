-- ============================================================
-- SQL Practice: SELECT, WHERE, ORDER BY, LIMIT (Stage 1)
-- Author: Purti Ladani
-- Dataset: students table
-- ============================================================

-- Setup: create and populate the practice table
CREATE TABLE students (
  student_id INTEGER,
  name TEXT,
  city TEXT,
  course TEXT,
  grade INTEGER,
  fee_paid INTEGER,
  enroll_date TEXT
);

INSERT INTO students VALUES
(1, 'Aarav Shah', 'Toronto', 'Business Analysis', 88, 3000, '2023-01-15'),
(2, 'Priya Patel', 'Hamilton', 'Cybersecurity', 74, 2500, '2023-03-10'),
(3, 'Sara Nair', 'Toronto', 'Business Analysis', 91, 3000, '2023-02-20'),
(4, 'James Kim', 'Mississauga', 'Data Science', 65, 3500, '2023-04-05'),
(5, 'Aisha Malik', 'Hamilton', 'Business Analysis', 79, 3000, '2023-01-28'),
(6, 'Ravi Mehta', 'Toronto', 'Cybersecurity', 83, 2500, '2023-05-12'),
(7, 'Emily Chen', 'Mississauga', 'Data Science', 92, 3500, '2023-02-14'),
(8, 'Omar Hassan', 'Hamilton', 'Cybersecurity', 58, 2500, '2023-06-01'),
(9, 'Nina Verma', 'Toronto', 'Data Science', 77, 3500, '2023-03-30'),
(10, 'Kabir Singh', 'Mississauga', 'Business Analysis', 85, 3000, '2023-04-18');


-- ============================================================
-- SECTION 1: SELECT basics
-- ============================================================

-- Get all columns
SELECT * FROM students;

-- Get specific columns
SELECT name, salary FROM students; -- (example pattern, no salary col here)
SELECT name, course, grade FROM students;

-- Rename a column using AS
SELECT name, fee_paid AS annual_pay FROM students;

-- Remove duplicate values
SELECT DISTINCT course FROM students;


-- ============================================================
-- SECTION 2: WHERE clause
-- ============================================================

-- Q1: Students from Hamilton
SELECT name, city, grade
FROM students
WHERE city = 'Hamilton';

-- Q2: Students who scored more than 80, sorted highest first
SELECT name, course, grade
FROM students
WHERE grade > 80
ORDER BY grade DESC;

-- Q3: Students in Business Analysis OR Cybersecurity,
--     sorted by fee_paid lowest first, then name A-Z
SELECT name, city, fee_paid
FROM students
WHERE course IN ('Business Analysis', 'Cybersecurity')
ORDER BY fee_paid ASC, name ASC;

-- Q4: Students from Toronto with grade between 75 and 90 (inclusive)
SELECT name, course, grade
FROM students
WHERE city = 'Toronto' AND grade BETWEEN 75 AND 90
ORDER BY name ASC;

-- Q5: Students whose name starts with 'A' OR fee_paid > 3000,
--     sorted by fee_paid highest first
SELECT name, course, city, fee_paid
FROM students
WHERE name LIKE 'A%' OR fee_paid > 3000
ORDER BY fee_paid DESC;


-- ============================================================
-- SECTION 3: More WHERE practice (harder set)
-- ============================================================

-- Q6: Students NOT from Toronto whose grade is NOT between 60-75,
--     sorted by grade highest first
SELECT name, grade
FROM students
WHERE city != 'Toronto' AND grade NOT BETWEEN 60 AND 75
ORDER BY grade DESC;

-- Q7: Students who enrolled after Feb 28, 2023, earliest first
SELECT name, course, enroll_date
FROM students
WHERE enroll_date > '2023-02-28'
ORDER BY enroll_date ASC;

-- Q8: Students whose name ends with 'a' OR ends with 'h', sorted A-Z
SELECT name, city, course, grade
FROM students
WHERE name LIKE '%a' OR name LIKE '%h'
ORDER BY name ASC;

-- Q9: Students in Data Science or Cybersecurity, grade > 70,
--     NOT from Hamilton, sorted by course A-Z then grade highest first
SELECT name, course, grade, fee_paid
FROM students
WHERE course IN ('Data Science', 'Cybersecurity')
AND grade > 70
AND city != 'Hamilton'
ORDER BY course ASC, grade DESC;

-- Q10: Top 3 students by grade, who paid fee >= 3000
--      and whose name contains the letter 'i'
SELECT name, city, grade, fee_paid
FROM students
WHERE fee_paid >= 3000 AND name LIKE '%i%'
ORDER BY grade DESC
LIMIT 3;


-- ============================================================
-- KEY LEARNINGS / NOTES TO SELF
-- ============================================================
-- 1. Clause order: SELECT -> FROM -> WHERE -> ORDER BY -> LIMIT
-- 2. Text values need quotes: 'Toronto'  | Numbers do not: 80
-- 3. DESC/ASC belongs in ORDER BY, never in WHERE
-- 4. Use IN ('A', 'B') instead of multiple OR conditions
-- 5. After OR, repeat the full condition:
--      name LIKE '%a' OR name LIKE '%h'   (correct)
--      name LIKE '%a' OR '%h'             (wrong - incomplete)
-- 6. BETWEEN x AND y is inclusive of both x and y
-- 7. Date format in SQLite: 'YYYY-MM-DD'

