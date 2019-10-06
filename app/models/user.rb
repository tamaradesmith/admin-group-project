class User < ApplicationRecord
  require 'csv'
  has_secure_password
  belongs_to :role

  has_many :attendances
  has_many :marks


  has_many :enrollments, dependent: :nullify

  has_many :courses, through: :enrollments, source: :course, dependent: :nullify

  has_many :assignments, dependent: :nullify
  has_many :course_assignments, through: :marks, source: :assignments

  def full_name
      "#{first_name} #{last_name}".strip
  end

  # Method to import, with the given file as an argument
  def self.import(file)
    #loops through the CSV data
    CSV.foreach(file.path, headers: true) do |row|
      #Creates a user for each row in the CSV file
      User.create! row.to_hash
    end
  end
end
