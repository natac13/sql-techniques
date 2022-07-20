SELECT
  *
FROM
  `Employee`
WHERE
  EmployeeId IN (
    SELECT
      DISTINCT ReportsTo
    FROM
      `Employee`
  );