class CreateMarks < ActiveRecord::Migration[6.0]
  def change
    create_table :marks do |t|
      t.references :user, null: false, foreign_key: true
      t.string :grade
      t.references :course_assignment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
