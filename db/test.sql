DROP DATABASE IF EXISTS employees;
CREATE DATABASE employees;

USE employees;

DROP TABLE IF EXISTS department;
DROP TABLE IF EXISTS role;
DROP TABLE IF EXISTS employee;


CREATE TABLE employee (
    id INT NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    role_id INT,
    manager_id INT,
    PRIMARY KEY (id)
);

CREATE TABLE role (
    id INT NOT NULL AUTO_INCREMENT,
    title VARCHAR(30),
    salary DECIMAL,
    department_id INT,
    PRIMARY KEY(id)
);

CREATE TABLE department (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(30),
    PRIMARY KEY (id)
);

ALTER TABLE employee
ADD CONSTRAINT manager_id    
    FOREIGN KEY (manager_id)
        REFERENCES employee (id)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION;

ALTER TABLE employee
ADD CONSTRAINT role_id
    FOREIGN KEY (id)
        REFERENCES role (id)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION;

ALTER TABLE role
ADD CONSTRAINT department_id
    FOREIGN KEY (id)
        REFERENCES department (id)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION;

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
