class Course < ApplicationRecord
  belongs_to :status
  belongs_to :program

  has_many :students, through: :enrollments, source: :user
  has_many :assignments, through: :course_assignments
end
