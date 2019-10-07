class Assignment < ApplicationRecord
    has_many :course_assignments, dependent: :destroy
    validates(:name, presence: true, uniqueness: true)
end
