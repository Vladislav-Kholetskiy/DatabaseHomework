WITH RECURSIVE Subordinates AS (
    SELECT 
        e.EmployeeID,
        e.Name,
        e.ManagerID,
        e.DepartmentID,
        d.DepartmentName,
        r.RoleName
    FROM Employees e
    LEFT JOIN Departments d ON e.DepartmentID = d.DepartmentID
    LEFT JOIN Roles r ON e.RoleID = r.RoleID
    WHERE r.RoleName = 'Менеджер'

    UNION ALL

    SELECT 
        e.EmployeeID,
        e.Name,
        e.ManagerID,
        e.DepartmentID,
        d.DepartmentName,
        r.RoleName
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
    COUNT(DISTINCT t.TaskID) AS TaskCount,
    COUNT(DISTINCT e.EmployeeID) AS SubordinateCount
FROM Subordinates s
LEFT JOIN Projects p ON p.DepartmentID = s.DepartmentID
LEFT JOIN Tasks t ON t.AssignedTo = s.EmployeeID
LEFT JOIN Employees e ON e.ManagerID = s.EmployeeID
GROUP BY s.EmployeeID, s.Name, s.ManagerID, s.DepartmentName, s.RoleName
HAVING COUNT(DISTINCT e.EmployeeID) > 0
ORDER BY s.Name;
