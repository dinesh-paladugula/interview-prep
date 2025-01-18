create database employee;
use employee;

create table Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50) NOT NULL
);

create table Employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50) NOT NULL,
    salary decimal(10,2) NOT NULL,
    department_id INT,
    foreign key (department_id) REFERENCES Departments(department_id)
);

INSERT INTO Departments(department_id, department_name) VALUES
(1, 'Human Resources'),
(2, 'Finance'),
(3,'Engineering');

INSERT INTO Employees (employee_id, employee_name, salary, department_id) VALUES
(101, 'Alice', 60000, 1),
(102, 'Bob', 45000, 2),
(103, 'Charlie', 55000, 3),
(104, 'Diana', 75000, 3),
(105, 'Eve', 50000, 1);

-- Query 1: Retrieve the details of employees with a salary greater than 50,000

SELECT * FROM Employees WHERE salary>50000;

-- Query 2: Find the total salary paid to employees in each department

SELECT d.department_name, SUM(e.salary) AS total_salary
FROM employees e
JOIN Departments d on e.department_id = d.department_id
GROUP BY d.department_name;

-- Query 3: Retrieve a list of employees with their department names
SELECT e.employee_name, d.department_name
FROM Employees e
JOIN Departments d ON e.department_id = d.department_id;

-- Query 4: Retrieve each employee's salary along with the average salary of their department
SELECT e.employee_name, e.salary, AVG(e.salary) OVER (PARTITION BY e.department_id) AS avg_department_salary
FROM Employees e;
