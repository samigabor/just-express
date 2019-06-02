-- SELECT CONCAT
--     (   
--         SUBSTRING(title, 1, 10),
--         "..."
--     )
-- AS 'short title'
-- FROM books;

-- SELECT title FROM books WHERE title LIKE '%stories%';

-- SELECT title, pages FROM books ORDER BY pages DESC LIMIT 1;

-- SELECT
--     CONCAT_WS
--     (
--     ' - ',
--     title,
--     released_year
--     ) AS summary
-- FROM books
-- ORDER BY released_year DESC
-- LIMIT 3;

-- SELECT 
--     title, 
--     author_lname 
-- FROM books 
-- WHERE author_lname LIKE '% %';

-- SELECT
--     title, 
--     released_year, 
--     stock_quantity
-- FROM books
-- ORDER BY stock_quantity, released_year
-- LIMIT 3;

-- SELECT 
--     title,
--     author_lname
-- FROM books
-- ORDER BY author_lname, title;

-- SELECT
--   UPPER(
--   CONCAT
--   (
--   'my favorite authos is ',
--   author_fname,
--   ' ',
--   author_lname,
--   '!'
--   )
--   ) AS yell
-- FROM books
-- ORDER BY author_lname;

-- SELECT author_fname, author_lname, COUNT(*) FROM books GROUP BY author_lname, author_fname;

-- SELECT author_fname, author_lname, released_year, COUNT(*) FROM books GROUP BY released_year;
-- SELECT author_fname, author_lname, released_year, COUNT(*) AS count FROM books GROUP BY released_year ORDER BY count DESC, released_year DESC;
-- SELECT MIN(pages), MAX(pages) FROM books;
-- SELECT title, pages FROM books ORDER BY pages DESC LIMIT 1;


-- SELECT CONCAT_WS(' ', author_fname, author_lname) AS 'author name', released_year FROM books ORDER BY author_fname;
-- Find the year each author published their first book.
-- SELECT 
--   CONCAT_WS(' ', author_fname, author_lname) AS 'author name',
--   MIN(released_year) AS 'first release'
-- FROM books
-- GROUP BY author_fname, author_lname;

-- SELECT 
--   author_fname, 
--   author_lname,
--   MIN(released_year) AS 'first release'
-- FROM books
-- GROUP BY author_fname, author_lname;

-- Longest page count for each author.
-- SELECT 
--   author_fname,
--   author_lname,
--   MAX(pages)
-- FROM books
-- GROUP BY author_fname, author_lname;

SELECT 
  author_fname,
  author_lname, 
  pages
FROM books;
-- Select all the pages each author has written
-- SELECT 
--   author_fname, 
--   author_lname,
--   SUM(pages)
-- FROM books
-- GROUP BY author_fname, author_lname;

-- Calculate the average released year accross all books
-- SELECT AVG(released_year)
-- FROM books; 

-- SELECT AVG(pages)
-- FROM books; 

-- SELECT 
--   author_fname,
--   author_lname,
--   AVG(pages)
-- FROM books
-- GROUP BY author_fname, author_lname; 

-- Calculate the stock average quantity for books release in the same year
-- SELECT 
--   AVG(stock_quantity), released_year
-- FROM books
-- GROUP BY released_year
-- ORDER BY released_year;

-- Print the number of books in the database
-- SELECT COUNT(title) AS 'number of books in database' FROM books;

-- How many books were released in each year?
-- SELECT 
--   COUNT(title) AS 'books released',
--   released_year
-- FROM books
-- GROUP BY released_year;

-- Total number of books in stock
-- SELECT SUM(stock_quantity) FROM books;

-- Average released year for each author
-- SELECT author_fname, author_lname, AVG(released_year) AS 'average released year' FROM books GROUP BY author_fname, author_lname;

-- Full name of the author who wrote the longest book
-- SELECT 
--   CONCAT(author_fname, ' ', author_lname) AS 'author who wrote the longest book',
--   title,
--   pages
-- FROM books
-- WHERE pages=(SELECT MAX(pages) FROM books);
-- SELECT 
--   CONCAT(author_fname, ' ', author_lname) AS 'author who wrote the longest book',
--   title,
--   pages
-- FROM books
-- ORDER BY pages DESC
-- LIMIT 1;

-- year / # books / avg pages
SELECT * FROM books;
SELECT
  released_year AS year,
  COUNT(title) AS '# books', 
  AVG(pages) AS 'avg pages'
FROM books
GROUP BY released_year;


SELECT 10 != 10;
SELECT 15 > 14 && 99 - 5 <= 94;
SELECT 1 IN (5, 3) || 9 BETWEEN 8 AND 10;
SELECT * FROM books WHERE released_year < 1980;
SELECT * FROM books WHERE author_lname = 'eggers' || author_lname = 'chabon';
SELECT * FROM books WHERE author_lname IN ('eggers', 'chabon');
SELECT * FROM books WHERE author_lname = 'lahiri' AND released_year > 2000;
SELECT * FROM books WHERE author_lname = 'lahiri';
SELECT * FROM books WHERE pages BETWEEN 100 AND 200;
SELECT * FROM books WHERE author_lname LIKE 'C%' OR author_lname LIKE 'S%';

SELECT 
  title, 
  author_lname, 
  CASE
    WHEN title LIKE '%stories%' THEN 'Short Stories'
    WHEN title = 'Just Kids' OR title LIKE 'A Heartbreaking Work%' THEN 'Momoir'
    ELSE 'Novel'
  END AS Type
FROM books;

SELECT
  title,
  author_lname, 
  CONCAT_WS(
    ' ',
    COUNT(*),
    CASE
      WHEN COUNT(*) = 1 THEN 'book'
      ELSE 'books'
    END
  ) AS 'COUNT'
FROM books GROUP BY author_lname;