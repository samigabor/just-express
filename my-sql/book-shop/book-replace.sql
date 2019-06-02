-- SELECT REPLACE(title, 'e', '3') FROM books;
-- reverse and uppercase: Why does my cat look at me with such hatred?

-- SELECT
--   REVERSE
--   (
--   UPPER('Why does my cat look at me with such hatred?')
--   )

-- SELECT author_lname AS forwards, REVERSE(author_fname) AS backwards FROM books;
    
SELECT
  CONCAT
  (
  UPPER(author_fname),
  ' ',
  UPPER(author_lname)
  ) AS 'full name in caps'
FROM books;

SELECT
    CONCAT
    (
    title,
    ' was released in ',
    released_year
    ) AS blurb
FROM books;

SELECT 
    title, 
    CHAR_LENGTH(title) AS 'character count'
FROM books;

SELECT
    CONCAT
    (
    SUBSTRING(title, 1, 10),
    '...'
    ) AS 'short title',
    
    CONCAT_WS
    (
    ',',
    author_lname,
    author_fname
    ) AS author,

    CONCAT
    (
    stock_quantity,
    ' in stock'
    ) AS quantity
FROM books;

















    
    
    
    
    
    
    
    
    