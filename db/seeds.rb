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


NUM_USERS = 30
NUM_USERS_INSTUCTOR = 10
NUM_ASSIGNMENTS = 15
PASSWORD = 'corecode'


ROLES = ["student", "instructor", "admin"]
ROLES.each do |roles|
Role.create( role: roles
)
end
 
admin_user = User.create(
  first_name: "Ian",
  last_name: "Mckinnon",
  email: "ian@example.com",
  password: PASSWORD,
  role_id: 3,
  address: Faker::Address.street_address,
  phone_number: Faker::PhoneNumber.cell_phone,
  picture_url: 'https://i.pinimg.com/736x/d6/c8/bc/d6c8bc86b0f8a5ae829a4a9b992e8b51--cat-stuff-funny-puppies.jpg',
  status: true
)  


NUM_USERS_INSTUCTOR.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  User.create(
    first_name: first_name,
    last_name: last_name,
    email: "#{first_name}.#{last_name}@example.com",
    password: PASSWORD,
    role_id: 2,
    address: Faker::Address.street_address,
    phone_number: Faker::PhoneNumber.cell_phone,
    picture_url: 'http://randomfunnycat.com/wp-content/uploads/2017/03/Ragdoll-Cat-Colors-seal-mitted.jpg',
    status: true
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
    role_id: 1,
    address: Faker::Address.street_address,
    phone_number: Faker::PhoneNumber.cell_phone,
    picture_url: 'https://i.pinimg.com/474x/c5/51/27/c55127c91da74d2d03886a07e3db06c7--ragdoll-cats-animal-pics.jpg',
    status: true
  )
end

USERS = User.all



  NUM_ASSIGNMENTS.times do
    Assignment.create(
      name: Faker::Space.constellation,
      description: Faker::GreekPhilosophers.quote
    )
  end

  PROGRAMS = ["Bootcamp", "One Year Coding Diploma", "Business", "Coding Fundamentals"]

  PROGRAMS.each do |program|
    Program.create(
      name: program
    )
  end

  STATUS = ["Ongoing", "Completed", "Setup", "Archived"]

  STATUS.each do |stat|
    Status.create(
      status: stat
    )
  end

  COURSES = ["Cohort 33", "Business 45", "Coding Diploma 4", "Fundamentals 22"]

COURSES.each do |course|
  i = 1
  Course.create(
    title: course,
    session: Faker::Date.backward(days: 30),
    start: Faker::Date.backward(days: 30),
    end: Faker::Date.forward(days: 90),
    slack_group: "#{course}_slack",
    status_id: 1,
    program_id: i,
    picture_url: 'http://www.ragdollchapps.com/uploads/3/7/3/8/37386167/68517829-2441901322498919-2986375474843746304-n_orig.jpg',
    )
    i += 1
end

USERS.each do |user|
  Enrollment.create(
    user_id:  user.id,
    course_id: rand(1..4),
  ) 
end

# byebug


  user = User.all
  course = Course.all

  puts "Seeding created #{user.count} Users"
  puts "Seeding created #{course.count} Courses"
