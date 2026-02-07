-- Lab 1: Analytical Queries
-- Author: Muhammad Asad

-- Query 1: Books by rating
SELECT title, author, rating
FROM books_read
ORDER BY rating DESC;

-- Query 2: Average pages by category
SELECT category, AVG(pages) AS avg_pages
FROM books_read
GROUP BY category;

-- Query 3: Highly rated books
SELECT title, category, rating
FROM books_read
WHERE rating > 4.0;

-- Query 4: Monthly reading progress
SELECT TO_CHAR(date_finished, 'YYYY-MM') AS month, COUNT(*)
FROM books_read
GROUP BY month
ORDER BY month;

-- Query 5: Machine Learning books with high rating
SELECT title, rating
FROM books_read
WHERE category = 'Machine Learning' AND rating >= 4.0;
-- Query 6: Total number of books
SELECT COUNT(*) AS total_books
FROM books_read;
