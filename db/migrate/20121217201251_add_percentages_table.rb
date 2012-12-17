class AddPercentagesTable < ActiveRecord::Migration
  def change
    create_table :percentages do |t|
      t.integer :allowance_id       # the allowance that the percentage corresponds to
      t.integer :account_id         # the account that this percentage relates to
      t.float :percentage           # the percentage value
      t.timestamps
    end
  end
end