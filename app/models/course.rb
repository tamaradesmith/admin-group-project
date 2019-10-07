class Course < ApplicationRecord
  belongs_to :status
  belongs_to :program
  has_many :course_assignments, dependent: :destroy

  has_many :enrollments, dependent: :destroy
  has_many :students, ->{ where(role_id: 1)} , through: :enrollments, source: :user
  has_many :instructors, ->{ where(role_id: 2)} , through: :enrollments, source: :user

  has_many :assignments, through: :course_assignments
end
