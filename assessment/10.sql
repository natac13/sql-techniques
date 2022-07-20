SELECT
  T2.OrderId,
  SUM(T2.Count * T3.Cost) AS TotalCost
FROM
  `OrderItems` T2
  JOIN Items T3 ON (T2.ItemId = T3.ItemId)
GROUP BY
  T2.OrderId
HAVING
  TotalCost > 10;