CREATE TABLE Departments (
    DepartmentID SERIAL PRIMARY KEY,  -- ���������� SERIAL ��� �������������� ��������� ���������������
    DepartmentName VARCHAR(100) NOT NULL
);

CREATE TABLE Roles (
    RoleID SERIAL PRIMARY KEY,  -- ���������� SERIAL ��� �������������� ��������� ���������������
    RoleName VARCHAR(100) NOT NULL
);

CREATE TABLE Employees (
    EmployeeID SERIAL PRIMARY KEY,  -- ���������� SERIAL ��� �������������� ��������� ���������������
    Name VARCHAR(100) NOT NULL,
    Position VARCHAR(100),
    ManagerID INT,
    DepartmentID INT,
    RoleID INT,
    FOREIGN KEY (ManagerID) REFERENCES Employees(EmployeeID) ON DELETE SET NULL,  -- ������������� ��������� ��� ��������
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID) ON DELETE CASCADE,  -- ������������� ��������� ��� ��������
    FOREIGN KEY (RoleID) REFERENCES Roles(RoleID) ON DELETE SET NULL  -- ������������� ��������� ��� ��������
);

CREATE TABLE Projects (
    ProjectID SERIAL PRIMARY KEY,  -- ���������� SERIAL ��� �������������� ��������� ���������������
    ProjectName VARCHAR(100) NOT NULL,
    StartDate DATE,
    EndDate DATE,
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID) ON DELETE CASCADE  -- ������������� ��������� ��� ��������
);

CREATE TABLE Tasks (
    TaskID SERIAL PRIMARY KEY,  -- ���������� SERIAL ��� �������������� ��������� ���������������
    TaskName VARCHAR(100) NOT NULL,
    AssignedTo INT,
    ProjectID INT,
    FOREIGN KEY (AssignedTo) REFERENCES Employees(EmployeeID) ON DELETE SET NULL,  -- ������������� ��������� ��� ��������
    FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID) ON DELETE CASCADE  -- ������������� ��������� ��� ��������
);