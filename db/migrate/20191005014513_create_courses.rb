class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.string :title
      t.string :session
      t.datetime :start
      t.datetime :end
      t.string :picture_url
      t.string :slack_group
      t.references :status, null: false, foreign_key: true
      t.references :program, null: false, foreign_key: true

      t.timestamps
    end
  end
end
