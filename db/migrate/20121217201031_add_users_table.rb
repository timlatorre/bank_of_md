class AddUsersTable < ActiveRecord::Migration
  def change
    create_table :users do |t|
    t.string :last_name
    t.string :first_name
    t.string :email
    t.string :text_number
    t.boolean :is_parent      # parent or child
    t.integer :family_id      # The family that the user belongs to
    t.string :password_digest
    t.timestamps
    end
  end
end
