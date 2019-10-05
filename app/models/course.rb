class Course < ApplicationRecord
  belongs_to :status
  belongs_to :program
end
