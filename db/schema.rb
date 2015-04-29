# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150429063849) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
  end

  create_table "ciaoappusers", force: :cascade do |t|
    t.integer  "country_code"
    t.integer  "state_id"
    t.integer  "gender"
    t.integer  "is_active"
    t.datetime "modified_at"
    t.datetime "signed_up_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "partner_id"
    t.datetime "date_of_birth"
  end

  add_index "ciaoappusers", ["partner_id"], name: "index_ciaoappusers_on_partner_id", using: :btree

  create_table "fixed_costs", force: :cascade do |t|
    t.integer  "salaries"
    t.integer  "server_hosting"
    t.integer  "rent"
    t.integer  "misc"
    t.integer  "admin_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "fixed_costs", ["admin_id"], name: "index_fixed_costs_on_admin_id", using: :btree

  create_table "partners", force: :cascade do |t|
    t.integer  "employee_size"
    t.integer  "revenue_size"
    t.string   "address"
    t.integer  "city"
    t.integer  "country"
    t.integer  "zipcode"
    t.integer  "channel_type_id"
    t.integer  "retail_chain_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.integer  "role"
    t.integer  "roleable_id"
    t.string   "roleable_type"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["roleable_type", "roleable_id"], name: "index_users_on_roleable_type_and_roleable_id", using: :btree

end
