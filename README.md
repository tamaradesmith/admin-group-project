# Administration Group Project
> This project was designed to allow for admin/instructors to mark students for attendance, grades, and add assignments.
It also allows for students to see their grades, attendance, and courses/programs they are enrolled in. Administration can manage programs/courses, and other users.

## Table of contents
* [Team](#team)
* [Screenshots](#screenshots)
* [Technologies](#technologies)
* [Setup](#setup)
* [Features](#features)
* [Roles](#roles)

## Team
* Logan
* Mao
* Tamara
* Daseul

## Screenshots
![Example screenshot](url =250px)

## Technologies
* Ruby on Rails
* HTML/CSS
* JavaScript
* Heroku
* Possible JS frameworks?

## Setup
Please note, you have to rails db:reset the DB, not rails db:seed everytime you are starting over. We have hard-coded user roles and don't want them to auto-increment (and break).

```
git clone 
git@github.com:caffkane/admin-group-project.git
cd admin-group-project
yarn install --check-files
bundle install
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
* Administrators can manage all aspects of users/courses/assignments/programs
* Instructors can manage courses/assignments/attendance (in development)
* Students can view their marks/assignments/attendance (in development)

To-do list:
* Complete attendance
* Complete marks

## Roles
**Logan**
* Git Master/Team Lead
* ERD
* Users/Sessions - Models/Views/Controllers 
* Assign user abilities
* Filters for users/courses/programs
* CSV Import from command line
* Deploy to Heroku
* Github/Trello/Slack

**Tamara**
* ERD
* Explanations for group
* Seeds
* Testing
* Views - Reworking
* CSS - All
* Github/Trello/Slack

**Mao**
* ERD
* Migrations - ALL
* Assignments - Models/Views/Controllers
* Instructors - Models/Views/Controllers
* Seeds - Reworked
* Testing
* Github/Trello/Slack

**Daseul**
* ERD
* Courses - Models/Views/Controllers 
* Archiving and listing of courses
* Adding users to courses 
* Programs - Models/Views/Controllers
* Testing
* Github/Trello/Slack	