class ChangeAmInAttendances < ActiveRecord::Migration[6.0]
  def change
    change_column :attendances, :am, :boolean, using: 'am::boolean'
    change_column :attendances, :pm, :boolean, using: 'am::boolean'
    change_column :attendances, :evening, :boolean, using: 'evening::boolean'
  end
end
