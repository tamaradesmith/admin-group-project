# Administration Group Project
> This project was designed to allow for admin/instructors to mark students for attendance, grades, and add assignments.
It also allows for students to see their grades, attendance, and courses/programs they are enrolled in.

## Table of contents
* [Team](#team)
* [Screenshots](#screenshots)
* [Technologies](#technologies)
* [Setup](#setup)
* [Features](#features)
* [Roles](#roles)

## Team
* Logan
* Mao Li
* Tamara
* Daseul

## Screenshots
![Example screenshot](./img/screenshot.png)

## Technologies
* Ruby on Rails
* HTML/CSS
* JavaScript
* Possible JS frameworks?

## Setup
Please note, you have to rails db:reset the DB, not rails db:seed everytime you are starting over. We have hard-coded user roles and don't want them to auto-increment (and break).

```
git clone 
git@github.com:caffkane/admin-group-project.git
cd admin-group-project
rails db:reset
rails s
```
This will clone the integration branch onto your computer.

To execute the rake task to import users from a CSV:
```
bundle exec rake import_users_csv:import_users_csv
```
Make sure that the csv is in the root folder of your application.

## Features
List of features ready and TODOs for future development
* Feature 1
* Feature 2
* Feature 3

To-do list:
* Improvement to be done 1
* Improvement to be done 2

## Roles
**Logan**
* Git Master/Team Lead
* ERD
* Users - Models/Views/Controllers 
* CSV
* Testing
* Deploy to Heroku

**Tamara**
* ERD
* Explanations for group
* Seeds
* Testing
* Views
* CSS

**Mao**
* ERD
* Migrations
* Instructors
* Seeds
* Testing

**Daseul**
* ERD
* Courses - Models/Views/Controllers  
* Programs - Models/Views/Controllers
* Testing
