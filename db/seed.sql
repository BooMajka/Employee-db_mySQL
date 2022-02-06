USE employeeDb;
-- Departments Data
INSERT INTO departments (name) VALUES 
("Finance"),
("Marketing"),
("Operations"),
("Engineering"),
("Human-ressouces");

-- Roles Data
INSERT INTO role (title, salary, department_id) VALUES 
("Accountant Manager", 100000, 1),
("Financial Associate", 62000, 1),
("Sales Manager", 90000, 2),
("Sales Associate", 50000, 2),
("Operations Manager", 80000, 3),
("Operations Associate", 50000, 3),
("Chef Engineer", 110000, 4),
("Engineer", 100000, 4),
("HR Manager", 80000, 5),
("HR Associate", 60000, 5);

-- Employees Data
INSERT INTO employees (first_name, last_name, role_id, manager_id) VALUES
("Kouassi", "Kouadio", 7, NULL),
("Jake", "Albano", 5, NULL),
("Mick", "Jason", 8, 1),
("Mary", "Jane", 1, NULL),
("Richard", "Cook", 3, NULL),
("Jean", "Walker", 6, 2),
("Sonia", "Twains", 2, 4),
("Sylvia", "Kim", 4, 5),
("Marc", "Rich", 9, NULL),
("Bryan", "Ken", 10, 9);



