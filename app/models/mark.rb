class Mark < ApplicationRecord
  belongs_to :user
  belongs_to :course_assignment
end
