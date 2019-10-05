class CreateAttendances < ActiveRecord::Migration[6.0]
  def change
    create_table :attendances do |t|
      t.references :user, null: false, foreign_key: true
      t.string :am
      t.string :pm
      t.datetime :date

      t.timestamps
    end
  end
end
