# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



Assignment.destroy_all
Attendance.destroy_all
CourseAssignment.destroy_all
Course.destroy_all
Enrollment.destroy_all
Mark.destroy_all
Program.destroy_all
Role.destroy_all
Status.destroy_all
User.destroy_all


NUM_USERS = 100
NUM_USERS_INSTUCTOR = 10
NUM_ASSIGNMENTS = 15
PASSWORD = 'corecode'


ROLES = ["student", "instructor", "admin"]
ROLES.each do |roles|
Role.create( role: roles
)
end

# Role.create(
#   role: "instructor"
# )

# Role.create(
#   role: "admin"
# )

 
admin_user = User.create(
  first_name = "Ian",
  last_name = "Mck",
  email: "ian@example.com",
  password: PASSWORD,
  role_id: 3
)  


NUM_USERS_INSTUCTOR.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  User.create(
    first_name: first_name,
    last_name: last_name,
    email: "#{first_name}.#{last_name}@example.com",
    password: PASSWORD,
    role_id: 2
    )

end

NUM_USERS.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  User.create(
    first_name: first_name,
    last_name: last_name,
    email: "#{first_name}.#{last_name}@example.com",
    password: PASSWORD,
    role_id: 1
  )
end

  NUM_ASSIGNMENTS.times do
    Assignments.create(
      name: Faker::Space.constellation,
      description: Faker::GreekPhilosophers.quote
    )
  end

  PROGRAMS = ["bootcamp", "1-year Coding", "1-business", "coding fundamental"]

  PROGRAMS.each do |program|
    Programs.create(
      name: program
    )
  end

  STATUS = ["ongoing", "completed", "setup", "archived"]

  STATUS.each do |stat|
    Status.create(
      status: stat
    )
  end

  COURSES = ["cohort33", "bussiness_2019", "coding_2019", "fundametal_May_2019"]

COURSES.each do |course|
  i = 1
  course.create(
    title: course,
    session: Faker::Date.backward(days: 30),
    start: Faker::Date.backward(days: 30),
    end: Faker::Date.forward(days: 90),
    slack_group: "#{course}_slack",
    status: 1,
    program_id: i
    )
    i =+ 1
end



  user = Users.all
  course = Course.all

  puts user.count
  puts course.count 

  puts User.first