class ChageAttandancesColumns < ActiveRecord::Migration[6.0]
  def change
    change_column :attendances, :am, :integer, using: 'am::integer'
    change_column :attendances, :pm, :integer, using: 'am::integer'
    change_column :attendances, :evening, :integer, using: 'evening::integer'
  end
end
