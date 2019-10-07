class Attendance < ApplicationRecord
  belongs_to :user
  belongs_to :course
  validates(:am, presence: true)
  validates(:pm, presence: true)
  validates(:evening, presence: true)
end
