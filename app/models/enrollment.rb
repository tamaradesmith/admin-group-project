class Enrollment < ApplicationRecord
  belongs_to :user
  belongs_to :course

  validates(
    :course_id, uniqueness: {
      scope: :user_id,
      message: "has already been enrolled"
    }
  )
end
