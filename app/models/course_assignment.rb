class CourseAssignment < ApplicationRecord
  belongs_to :course
  belongs_to :assignment
  belongs_to :user
  has_many :marks
  validates :course_id, uniqueness: { scope: :assignment_id, message: "already had this assignment"}
end
