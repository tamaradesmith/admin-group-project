# This is the rake task for importing users into the user table from a CSV. 
# THIS IS A WORK IN PROGRESS
#lib/tasks/import_users_csv.rake


# To execute this code, type:

# bundle exec rake import_users_csv:import_users_csv
# Put the file named users.csv into the base folder of the rails app.
# I will try to get it working later for any file from the command line/choosing a file on the website.

# If you want to have it auto import from a file, change :filename to the file name in task
# CSV.foreach('myfile.csv', :headers => true) do |row|


require "csv"
namespace :import_users_csv do
	desc "Imports a CSV file with correct User headers into User table"
	task :import_users_csv => :environment do
		CSV.foreach('users.csv', :headers => true) do |row|
  			User.create!(row.to_hash)
		end
	end	
end