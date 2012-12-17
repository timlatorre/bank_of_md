class AddAccountsTable < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.integer :child_id       # Which child owns it?
      t.integer :family_id      # The family that the user belongs to
      t.string :name
      t.decimal :balance        # balance
      t.timestamps
    end
  end
end
