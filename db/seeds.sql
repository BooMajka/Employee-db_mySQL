INSERT INTO department
(name) VALUES 
  ('Marketing and sales'),
  ('Administration'),
  ('Research and development'),
  ('Human resources'),
  ('Customer service'),
  ('Accounting and finance');

INSERT INTO role
(title, salary, department_id) VALUES 
("Sales Representative", 45000, 2),
("Secretary", 95000, 3),
("Research Specialist", 70000, 4),
("Recruiter", 30000, 5),
("Receptionist", 30000, 6),
("Financial Analyst", 50000, 7);

INSERT INTO employee
(first_name, last_name, role_id, manager_id) VALUES
('Virginia', 'Woolf', 2, 1),
('Piers', 'Gaveston', 3, 2),
('Charles', 'LeRoi', 4, 3),
('Katherine', 'Mansfield', 5, 4),
('Dora', 'Carrington', 6, 5),
('Edward', 'Bellamy', 7, 6);
