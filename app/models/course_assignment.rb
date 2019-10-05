class CourseAssignment < ApplicationRecord
  belongs_to :course
  belongs_to :assignment
  belongs_to :user
end
