class CreateSyncLogs < ActiveRecord::Migration[8.1]
  def change
    create_table :sync_logs do |t|
      t.string :stripe_event_id
      t.string :event_type
      t.integer :status
      t.string :qbo_entity_type
      t.string :qbo_entity_id
      t.json :payload
      t.text :error_message
      t.integer :attempts
      t.integer :duration_ms

      t.timestamps
    end
    add_index :sync_logs, :stripe_event_id, unique: true
    add_index :sync_logs, :event_type
    add_index :sync_logs, :status
  end
end
