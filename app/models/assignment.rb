class Assignment < ApplicationRecord
    has_many :course_assignments, dependent: :destroy
end
