class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.boolean :status
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone_number
      t.string :address
      t.string :picture_url
      t.references :role, null: false, foreign_key: true
      t.string :password_digest

      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
