-- CREATE DATABASE students_and_grades;
-- show databases;
-- USE students_and_grades;
-- SELECT DATABASE();
-- CREATE TABLE students (
--     id INT PRIMARY KEY AUTO_INCREMENT,
--     first_name VARCHAR(100) NOT NULL
-- );
-- DESC students;
-- CREATE TABLE grades(
--     title VARCHAR(100) NOT NULL,
--     grade TINYINT NOT NULL,
--     student_id INT,
--     FOREIGN KEY (student_id) 
--         REFERENCES students(id)
--         ON DELETE CASCADE
-- );
-- DESC grades;
-- INSERT INTO students 
--     (first_name)
-- VALUES 
--     ('Caleb'),
--     ('Samantha'),
--     ('Raj'),
--     ('Carlos'),
--     ('Lisa');
-- SELECT * FROM students;
-- INSERT INTO grades 
--     (student_id, title, grade)
-- VALUES
--     (1, 'My first book report', 60),
--     (1, 'My second book report', 75),
--     (2, 'Russian Lit Through The Ages', 94),
--     (2, 'The Montagne And The Art Of The Essay', 98),
--     (4, 'Borges And Magical Realism', 89);
-- RENAME TABLE grades TO papers;
-- show tables;

-- SELECT first_name, title, grade FROM students 
-- JOIN papers
--     ON students.id = papers.student_id
-- ORDER BY grade DESC;

-- SELECT first_name, title, grade FROM students 
-- LEFT JOIN papers
--     ON students.id = papers.student_id;

-- SELECT 
--     first_name, 
--     IFNULL(title, 'MISSING'), 
--     IFNULL(grade, 0) AS grade
-- FROM students 
-- LEFT JOIN papers
--     ON students.id = papers.student_id;

SELECT 
    first_name,
    IFNULL(AVG(grade), '0') AS average
FROM students
LEFT JOIN papers
    ON students.id = papers.student_id
GROUP BY students.first_name
ORDER BY average DESC;

SELECT 
    first_name,
    IFNULL(AVG(grade), '0') AS average,
    CASE 
        WHEN AVG(grade) IS NULL THEN 'FAILING / NULL >= 75'
        WHEN AVG(grade) >= 75 THEN 'PASSING'
        ELSE 'FAILING'
    END AS passing_status
FROM students
LEFT JOIN papers
    ON students.id = papers.student_id
GROUP BY students.first_name
ORDER BY average DESC;