DROP DATABASE IF EXISTS employees_db;
CREATE DATABASE employees_db;
USE employees_db;

DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS roles;
DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
  id INTEGER AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(30) NOT NULL,
  last_name VARCHAR(30) NOT NULL,
  role_id INTEGER,
  manager VARCHAR(30) NOT NULL
  CONSTRAINT role_id
  FOREIGN KEY (role_id)
  REFERENCES role (id)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
);

CREATE TABLE roles (
  id INTEGER AUTO_INCREMENT PRIMARY KEY,
  job_title VARCHAR(30) NOT NULL,
  salary DECIMAL(10,3),
  department_id INTEGER,
  CONSTRAINT department_id
  FOREIGN KEY (department_id)
  REFERENCES departments(id)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,

  CONSTRAINT manager
  FOREIGN KEY (manager)
  REFERENCES employee (id)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION
);

CREATE TABLE departments (
  id INTEGER AUTO_INCREMENT PRIMARY KEY,
  department_name VARCHAR(30) NOT NULL
);


INSERT INTO departments
  (department_name)
VALUES
  ('IT'),
  ('Marketing and sales'),
  ('Administration'),
  ('Research and development'),
  ('Human resources'),
  ('Customer service'),
  ('Accounting and finance');

INSERT INTO roles
  (job_title, salary, department_id)
VALUES
	("UI/UX Developer", 95.000, 1),
	("Sales Representative", 45.000, 2),
    ("Secretary", 95.000, 3),
	("Research Specialist", 70.000, 4),
	("Recruiter", 30.000, 5),
	("Receptionist", 30.000, 6),
	("Financial Analyst", 50.000, 7);

  
 INSERT INTO employees
  (first_name, last_name, role_id, manager)
VALUES
  ('Ronald', 'Firbank', 1, "Alf"),
  ('Virginia', 'Woolf', 2, "Samurai"),
  ('Piers', 'Gaveston', 3, "Alfons"),
  ('Charles', 'LeRoi', 4, "Boldi"),
  ('Katherine', 'Mansfield', 5, "Bossi"),
  ('Dora', 'Carrington', 6, "Sassy"),
  ('Edward', 'Bellamy', 7, "Charlie");

