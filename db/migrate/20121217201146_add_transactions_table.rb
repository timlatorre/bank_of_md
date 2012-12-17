class AddTransactionsTable < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer :account_id     # The account that the transaction is affecting
      t.integer :parent_id      # The parent who created the transaction
      t.integer :family_id      # The family that the user belongs to
      t.string :description     # Primary description of the transaction
      t.string :memo            # Secondary description of the transaction (if needed)
      t.boolean :is_credit      # t = credit, f = debit
      t.decimal :strt_balance   # Balance before transaction
      t.decimal :amt_change     # The amount being changed
      t.decimal :end_balance    # New balance
      t.timestamps
    end
  end
end
