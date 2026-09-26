class CreateQboCredentials < ActiveRecord::Migration[8.1]
  def change
    create_table :qbo_credentials do |t|
      t.string :realm_id
      t.text :access_token
      t.text :refresh_token
      t.datetime :access_token_expires_at
      t.datetime :refresh_token_expires_at
      t.integer :status

      t.timestamps
    end
    add_index :qbo_credentials, :realm_id, unique: true
  end
end
