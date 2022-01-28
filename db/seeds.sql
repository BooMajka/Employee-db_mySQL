INSERT INTO departments
  (department_id, department_name)
VALUES
  (1, 'IT'),
  (2, 'Marketing and sales'),
  (3, 'Administration'),
  (4, 'Research and development'),
  (5, 'Human resources'),
  (6, 'Customer service'),
  (7, 'Accounting and finance');

INSERT INTO roles
  (role_id, job_title, salary, department_id)
VALUES
	(1, "UI/UX Developer", 95.000, 1),
	(2, "Sales Representative", 45.000, 2),
    (3, "Secretary", 95.000, 3),
	(4, "Research Specialist", 70.000, 4),
	(5, "Recruiter", 30.000, 5),
	(6, "Receptionist", 30.000, 6),
	(7, "Financial Analyst", 50.000, 7);

  
 INSERT INTO employees
  (employee_id, first_name, last_name, manager)
VALUES
  (1, 'Ronald', 'Firbank', "Alf"),
  (2, 'Virginia', 'Woolf', "Samurai"),
  (3, 'Piers', 'Gaveston', "Alfons"),
  (4, 'Charles', 'LeRoi', "Boldi"),
  (5, 'Katherine', 'Mansfield', "Bossi"),
  (6, 'Dora', 'Carrington', "Sassy"),
  (7, 'Edward', 'Bellamy', "Charlie");
