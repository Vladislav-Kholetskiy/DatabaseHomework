WITH RECURSIVE Subordinates AS (
    SELECT 
        e.EmployeeID,
        e.Name,
        e.ManagerID,
        e.DepartmentID,
        d.DepartmentName,
        r.RoleName,
        NULL AS ProjectNames,
        NULL AS TaskNames
    FROM Employees e
    LEFT JOIN Departments d ON e.DepartmentID = d.DepartmentID
    LEFT JOIN Roles r ON e.RoleID = r.RoleID
    WHERE e.EmployeeID = 1

    UNION ALL

    SELECT 
        e.EmployeeID,
        e.Name,
        e.ManagerID,
        e.DepartmentID,
        d.DepartmentName,
        r.RoleName,
        NULL AS ProjectNames,
        NULL AS TaskNames
    FROM Employees e
    LEFT JOIN Departments d ON e.DepartmentID = d.DepartmentID
    LEFT JOIN Roles r ON e.RoleID = r.RoleID
    JOIN Subordinates s ON e.ManagerID = s.EmployeeID
)
SELECT 
    s.EmployeeID,
    s.Name,
    s.ManagerID,
    s.DepartmentName,
    s.RoleName,
    STRING_AGG(DISTINCT p.ProjectName, ', ') AS ProjectNames,
    STRING_AGG(DISTINCT t.TaskName, ', ') AS TaskNames,
    COUNT(t.TaskID) AS TaskCount,
    (SELECT COUNT(*) FROM Employees e WHERE e.ManagerID = s.EmployeeID) AS SubordinateCount
FROM Subordinates s
LEFT JOIN Projects p ON p.DepartmentID = s.DepartmentID
LEFT JOIN Tasks t ON t.AssignedTo = s.EmployeeID
GROUP BY s.EmployeeID, s.Name, s.ManagerID, s.DepartmentName, s.RoleName
ORDER BY s.Name;

