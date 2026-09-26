# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.1].define(version: 2026_09_26_014001) do
  create_table "qbo_credentials", force: :cascade do |t|
    t.string "realm_id"
    t.text "access_token"
    t.text "refresh_token"
    t.datetime "access_token_expires_at"
    t.datetime "refresh_token_expires_at"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["realm_id"], name: "index_qbo_credentials_on_realm_id", unique: true
  end

  create_table "qbo_mappings", force: :cascade do |t|
    t.integer "qbo_credential_id", null: false
    t.string "clearing_account_id"
    t.string "checking_account_id"
    t.string "fee_account_id"
    t.string "sales_account_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["qbo_credential_id"], name: "index_qbo_mappings_on_qbo_credential_id"
  end

  add_foreign_key "qbo_mappings", "qbo_credentials"
end
