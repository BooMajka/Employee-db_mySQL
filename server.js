const express = require("express");
const db = require("./db/connection");
const Inquirer = require("inquirer");
const MySQL = require("mysql2");
const Employee = require("./lib/Employee.js");
const Role = require("./lib/Role.js");
const Department = require("./lib/Department.js");

const PORT = process.env.PORT || 3001;
const app = express();

let employee = new Employee(db);
let role = new Role(db);
let department = new Department(db);

// This is the entry point of the user interface
function start() {
  let question = "What would you like to do?";
  let options = [
    "View All Employees",
    "View All Roles",
    "View All Departments",
    "Add Employee",
    "Add Role",
    "Add Department",
    "Update Employee",
    "Update Role",
    "Update Department",
    "Remove Employee",
    "Remove Role",
    "Remove Department",
    "Exit",
  ];

  Inquirer.prompt({
    name: "action",
    type: "list",
    message: question,
    choices: options,
  }).then((data) => {
    switch (data.action) {
      case "View All Employees":
        employee.printEmployees();
        start();
        break;
      case "View All Roles":
        role.printRoles();
        start();
        break;
      case "View All Departments":
        department.printDepartments();
        start();
        break;
      case "Add Employee":
        Inquirer.prompt([
          {
            name: "first_name",
            type: "input",
            message: "What's employee's first name?",
          },
          {
            name: "last_name",
            type: "input",
            message: "What's employee's last name?",
          },
          {
            name: "manager_id",
            type: "input",
            message: "What's employee's manager id?",
          },
        ]).then((data) => {
          employee.insertEmployee(
            data.first_name,
            data.last_name,
            data.manager_id
          );
          employee.printEmployees();
          start();
        });
        break;


      case "Add Role":
        Inquirer.prompt([
          {
            name: "title",
            type: "input",
            message: "What's the role's title?",
          },
          {
            name: "salary",
            type: "input",
            message: "What's the role's salary?",
          },
          {
            name: "department_id",
            type: "list",
            message: "What's the role's department id?",
            choices: [
              {
                name: "Marketing and Sales",
                value: 1,
              },
              {
                name: "Administration",
                value: 2,
              },
              {
                name: "Research and development",
                value: 3,
              },
              {
                name: "Human resources",
                value: 4,
              },
              {
                name: "Customer service",
                value: 5,
              },
              {
                name: "Accounting and finance",
                value: 6,
              },
            ],
          },
        ]).then((data) => {
          role.insertRole(
            data.title, 
            data.salary, 
            data.department_id);
          role.printRoles();
          start();
        });
        break;



      case "Add Department":
        Inquirer.prompt([
          {
            name: "name",
            type: "input",
            message: "What's the department name?",
          },
        ]).then((data) => {
          department.insertDepartment(data.name);
          department.printDepartments();
          start();
        });
        break;

      case "Update Employee":
        Inquirer.prompt([
          {
            name: "id",
            type: "input",
            message: "What's the employee's id?",
          },
          {
            name: "first_name",
            type: "input",
            message: "What's the employee's new first name?",
          },
          {
            name: "last_name",
            type: "input",
            message: "What's the employee's new last name?",
          },
          {
            name: "role_id",
            type: "input",
            message: "What's the employee's new role id?",
          },
          {
            name: "manager_id",
            type: "input",
            message: "What's the employee's new manager id?",
          },
        ]).then((data) => {
          employee.updateEmployee(
            data.id,
            data.first_name,
            data.last_name,
            data.role_id,
            data.manager_id
          );
          employee.printEmployees();
          start();
        });
        break;


      case "Update Role":
        Inquirer.prompt([
          {
            name: "id",
            type: "input",
            message: "What's the role's id?",
          },
          {
            name: "title",
            type: "input",
            message: "What's the role's new title?",
          },
          {
            name: "salary",
            type: "input",
            message: "What's the role's new salary?",
          },
          {
            name: "department",
            type: "input",
            message: "What's the role's new department?",
          },
        ]).then((data) => {
          role.updateRole(
            data.id, 
            data.title, 
            data.salary, 
            data.department);
          role.printRoles();
          start();
        });
        break;


      case "Update Department":
        Inquirer.prompt([
          {
            name: "id",
            type: "input",
            message: "What's the department's id?",
          },
          {
            name: "name",
            type: "input",
            message: "What's the department's new name?",
          }
        ]).then(data => {
          department.updateDepartment(data.id, data.name);
          department.printDepartments();
          start();
        });
        break;

      case "Remove Employee":
         Inquirer.prompt([
          {
            name: "id",
            type: "input",
            message: "What's the id of the employee you want to remove?"
          }]).then(data => {
            employee.deleteEmployee(data.id);
            employee.printEmployees();
            start();
          });
        break;

      case "Remove Role":
         Inquirer.prompt([
           {
             name: "id",
             type: "input",
             message: "What's the id of the role you want to remove?"
           }
         ]).then((data) => {
           role.deleteRole(data.id);
           role.printRoles();
           start();
         });
        break;

      case "Remove Department":
        Inquirer.prompt([
          {
            name: "department_id",
            type: "list",
            message: "Which department would you like to remove?",
            choices: [
              {
                name: "Marketing and Sales",
                value: 1,
              },
              {
                name: "Administration",
                value: 2,
              },
              {
                name: "Research and development",
                value: 3,
              },
              {
                name: "Human resources",
                value: 4,
              },
              {
                name: "Customer service",
                value: 5,
              },
              {
                name: "Accounting and finance",
                value: 6,
              },
            ],
          },
        ]).then((data) => {
          department.deleteDepartment(data.department_id);
          department.printDepartments();
          start();
        });
        break;
      case "Exit":
        console.log(
          "Thank you for using our HR Employee Tracker. Have a great day."
        );
        break;
      default:
        console.log("choose your option to start");
        start();
        break;
    }
  });
}

start();

// Default response for any other request (Not Found)
app.use((req, res) => {
  res.status(404).end();
});

// Start server after DB connection
db.connect((err) => {
  if (err) throw err;
  console.log("Database connected.");
  app.listen(PORT, () => {
    console.log(`Server running on port ${PORT}`);
  });
});
