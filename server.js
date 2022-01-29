const express = require('express');
const db = require('./db/connection');
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

  db.query( `figlet Employees Database`, (err, res) => {
    if (err) console.log(err);
  });


  let question = "What would you like to do?";
  let options = [
    "View All Employees",
    "Add Employee",
    "Remove Employee",
    "Update Employee Role",
    "Update Employee Manager",
    "View All Roles",
    "Add Role",
    "Remove Role",
    "View All Departments",
    "Add Department",
    "Remove Department",
    "Exit",
  ];

  Inquirer.prompt(
        {
            name: "action",
            type: "list",
            message: question,
            choices: options
        })
        .then((data) => {
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
              addEmployee();
              break;
            case "Add Role":
              addRole();
              break;
            case "Add Department":
              addDepartment();
              break;
            case "Update Employee Role":
              updateEmployeeRole();
              break;
            case "Update Employee Manager":
              updateEmployeeManager();
              break;
            case "Remove Employee":
              removeEmployee();
              break;
            case "Remove Role":
              removeRole();
              break;
            case "Remove Department":
              removeDepartment();
              break;
            case "Exit":
              console.log(
                "Thank you for using our HR Employee Tracker. Have a great day."
              );
              break;
            default:
              console.log(`Action (${data.action}) is not supported.`);
              start();
              break;
          }
        })
}



start();

// Default response for any other request (Not Found)
app.use((req, res) => {
  res.status(404).end();
});

// Start server after DB connection
db.connect(err => {
  if (err) throw err;
  console.log('Database connected.');
  app.listen(PORT, () => {
    console.log(`Server running on port ${PORT}`);
  });
});