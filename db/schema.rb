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

ActiveRecord::Schema.define(version: 20160309035901) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "companies", force: :cascade do |t|
    t.string   "company_logo"
    t.text     "company_profile"
    t.string   "company_name"
    t.string   "hr_email"
    t.string   "company_url"
    t.integer  "status",              default: 0
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.hstore   "talent_requirements",                          array: true
    t.string   "technology_stack"
    t.text     "culture"
    t.text     "team_info"
  end

  add_index "companies", ["id"], name: "index_companies_on_id", unique: true, using: :btree

  create_table "jobs", force: :cascade do |t|
    t.string   "title"
    t.text     "job_description"
    t.string   "location"
    t.string   "job_poster_email"
    t.string   "company_name"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.hstore   "employment_terms",                          array: true
    t.integer  "status",           default: 0
  end

  add_index "jobs", ["id"], name: "index_jobs_on_id", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.integer  "role",                           default: 0, null: false
    t.string   "email",                                      null: false
    t.string   "encrypted_password", limit: 128,             null: false
    t.string   "confirmation_token", limit: 128
    t.string   "remember_token",     limit: 128,             null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["id"], name: "index_users_on_id", unique: true, using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

end
