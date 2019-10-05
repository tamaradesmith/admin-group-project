class Course < ApplicationRecord
  belongs_to :status
  belongs_to :program
  has_many :course_assignments, dependent: :destroy
  has_many :assignments, through: :course_assignments
end
