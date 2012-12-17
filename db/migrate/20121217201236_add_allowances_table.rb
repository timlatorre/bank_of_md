class AddAllowancesTable < ActiveRecord::Migration
  def change
    create_table :allowances do |t|
      t.integer :child_id        # Child's user number
      t.integer :family_id       # The family that the child belongs to
      t.string :name
      t.string :payday          # mon, tues, weds, thurs, fri, sat, or sun
      t.string :frequency       # 'w' = weekly, '2x-m' = twice monthly, 'm' = monthly
      t.decimal :amount         # Amount
      t.timestamps
    end
  end
end