class CreateReconciliations < ActiveRecord::Migration[8.1]
  def change
    create_table :reconciliations do |t|
      t.string :stripe_payout_id
      t.integer :gross_cents
      t.integer :fee_cents
      t.integer :net_cents
      t.string :currency
      t.string :qbo_deposit_id
      t.string :qbo_expense_id
      t.integer :status
      t.datetime :payout_date

      t.timestamps
    end
    add_index :reconciliations, :stripe_payout_id, unique: true
    add_index :reconciliations, :status
    add_index :reconciliations, :payout_date
  end
end
