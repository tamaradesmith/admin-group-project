class User < ApplicationRecord
  has_secure_password
  belongs_to :role

  has_many :attendances
  has_many :marks

  has_many :courses, dependent: :nullify
  has_many :assignments, dependent: :nullify
  has_many :course_assignments, through: :marks, source: :assignments

  def full_name
      "#{first_name} #{last_name}".strip
  end
end
