class AddEveningToAttendances < ActiveRecord::Migration[6.0]
  def change
    add_column :attendances, :evening, :string
  end
end
