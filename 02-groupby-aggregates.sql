-- ============================================================
-- SQL Practice: GROUP BY & Aggregate Functions (Stage 2)
-- Author: Purti Ladani
-- Dataset: students table (same as Stage 1 file)
-- ============================================================

-- Reminder: run 01-select-where-orderby-basics.sql first
-- to create and populate the students table.


-- ============================================================
-- SECTION 1: GROUP BY basics
-- ============================================================

-- Count how many students are in each course
SELECT course, COUNT(*) AS total_students
FROM students
GROUP BY course;

-- Count how many students are in each city
SELECT city, COUNT(*) AS total_students
FROM students
GROUP BY city;


-- ============================================================
-- SECTION 2: SUM and AVG
-- ============================================================

-- Total fees collected and average grade per course
SELECT course,
       SUM(fee_paid) AS total_fees,
       AVG(grade) AS avg_grade
FROM students
GROUP BY course;


-- ============================================================
-- SECTION 3: MIN and MAX
-- ============================================================

-- Lowest and highest grade per course
SELECT course,
       MIN(grade) AS lowest_grade,
       MAX(grade) AS highest_grade
FROM students
GROUP BY course;


-- ============================================================
-- SECTION 4: HAVING - filter groups after aggregation
-- ============================================================

-- Courses with more than 3 students
SELECT course, COUNT(*) AS total
FROM students
GROUP BY course
HAVING COUNT(*) > 3;

-- Courses where average grade is above 75
SELECT course, AVG(grade) AS avg_grade
FROM students
GROUP BY course
HAVING AVG(grade) > 75;


-- ============================================================
-- SECTION 5: Full structure - WHERE + GROUP BY + HAVING + ORDER BY + LIMIT
-- ============================================================

SELECT course,
       COUNT(*) AS total,
       AVG(grade) AS avg_grade
FROM students
WHERE city != 'Hamilton'         -- filter rows first
GROUP BY course                  -- then group
HAVING AVG(grade) > 75           -- then filter groups
ORDER BY avg_grade DESC          -- then sort
LIMIT 2;                         -- then cap output


-- ============================================================
-- KEY LEARNINGS / NOTES TO SELF
-- ============================================================
-- 1. Full clause order:
--    SELECT -> FROM -> WHERE -> GROUP BY -> HAVING -> ORDER BY -> LIMIT
-- 2. COUNT(*) counts all rows in a group
-- 3. SUM(), AVG(), MIN(), MAX() work on numeric columns
-- 4. WHERE filters individual ROWS before grouping
-- 5. HAVING filters GROUPS after grouping (use with aggregate functions)
-- 6. Any column in GROUP BY must also appear in SELECT

