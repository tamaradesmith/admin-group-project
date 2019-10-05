class User < ApplicationRecord
  has_secure_password
  belongs_to :role
  has_many :course_assignments
  # has_many :mark_assignments through: :course_assignments, source: :assignments
end
