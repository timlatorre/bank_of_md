class AddChoresTable < ActiveRecord::Migration
  def change
    create_table :chores do |t|
      t.integer :parent_id       # Parent assigning the task
      t.integer :child_id        # Child assigned the task
      t.integer :family_id       # The family that the child and parent belong to
      t.string :name             # Chore name
      t.string :description      # Description of the chore (if necessary)
      t.boolean :is_allowance    # true = allowance, false = extra money
      t.decimal :amount          # Amount for extra chore
      t.boolean :is_approved     # Has a parent approved the chore?
      t.timestamps
    end
  end
end
