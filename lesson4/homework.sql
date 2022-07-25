-- 1. select the order number and average number of items ordered for each order
SELECT
  OrderId,
  AVG(Count) As 'Average Number of items ordered'
FROM
  `OrderItems`
Group By
  OrderId;

-- 2. select the item name and average number of items ordered for each item ordered
SELECT
  i.Name,
  AVG(Count) As 'Average ordered'
FROM
  `OrderItems` o
  Join Items i on i.ItemId = o.ItemId
Group By
  i.Name;

-- 3. select the first name, last name, and average number of items ordered for each customer
SELECT
  c.FirstName,
  c.LastName,
  COALESCE(AVG(oi.Count), 0) AS 'Average items ordered by Customer'
FROM
  Customers AS c
  LEFT JOIN Orders AS o ON o.CustomerId = c.CustomerId
  LEFT JOIN OrderItems AS oi ON oi.OrderId = o.OrderId
GROUP BY
  c.FirstName,
  c.LastName;

-- 4. Complete the 'Select basics' section of sqlzoo.net