class CreateAdministrators < ActiveRecord::Migration[7.0]
  def change
    create_table :administrators do |t|
      t.string :email
      t.string :hashed_password
      t.boolean :suspended

      t.timestamps
    end
    add_index :administrators, :email, unique: true
  end
end
