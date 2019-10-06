# This is the rake task for importing users into the user table from a CSV. 
# THIS IS A WORK IN PROGRESS
#lib/tasks/import_users_csv.rake


# To execute this code, type:

# bundle exec rake import_users_csv filename
# If you want to have it auto import from a file, change :filename to the file name in task
# CSV.foreach('myfile.csv', :headers => true) do |row|


require ‘csv’
Namespace :import_users_csv do
	desc "Imports a CSV file with correct User headers into User table"
	task :import_users_csv, [:filename] => :environment do
		CSV.foreach(:filename, :headers => true) do |row|
  			User.create!(row.to_hash)
		end
	end	
end


