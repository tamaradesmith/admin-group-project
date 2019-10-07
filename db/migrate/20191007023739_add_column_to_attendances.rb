class AddColumnToAttendances < ActiveRecord::Migration[6.0]
  def change
    add_reference :attendances, :course, null: false, foreign_key: true
  end
end
