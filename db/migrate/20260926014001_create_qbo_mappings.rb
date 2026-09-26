class CreateQboMappings < ActiveRecord::Migration[8.1]
  def change
    create_table :qbo_mappings do |t|
      t.references :qbo_credential, null: false, foreign_key: true
      t.string :clearing_account_id
      t.string :checking_account_id
      t.string :fee_account_id
      t.string :sales_account_id

      t.timestamps
    end
  end
end
