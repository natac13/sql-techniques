SELECT
  CONCAT(T1.FirstName, ' ', T1.LastName) AS FullName,
  Concat(T2.FirstName, ' ', T2.LastName) AS ReportsTo
FROM
  `Employee` T1
  LEFT JOIN Employee T2 ON (T1.ReportsTo = T2.EmployeeId)