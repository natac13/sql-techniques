-- 1. get a list of all customers
SELECT
  *
FROM
  `Customers`;

-- 2. get a list of all customers with last name 'smith'
SELECT
  *
FROM
  `Customers`
WHERE
  `LastName` = 'smith';

-- 3. get a list of all customers with a first name that starts with 'j'
SELECT
  *
FROM
  `Customers`
WHERE
  FirstName LIKE 'j%';

-- 4. get a count of how many customers have each unique first name and what the names are
SELECT
  FirstName,
  Count(FirstName) AS 'Count'
FROM
  Customers
GROUP BY
  FirstName;

-- 5. get a count of how many customers have a first name that starts with 'j' using a having clause
SELECT
  FirstName,
  Count(FirstName) AS 'Count'
FROM
  Customers
GROUP BY
  FirstName
HAVING
  FirstName LIKE 'j%';

-- 6. get a count of how many customers have a first name that starts with 'j' without using a having clause
SELECT
  FirstName,
  Count(FirstName) AS 'Count'
FROM
  Customers
WHERE
  FirstName LIKE 'j%'
GROUP BY
  FirstName;

-- 7. is it better to use #5 or #6 and why?
-- #5 becuase we should favour filtering the rows for our desired result, before we group all the rows the find the counts, instead of filtering after the grouping. 
-- Theses leads to better preformance as less rows are grouped since they are filtered first.