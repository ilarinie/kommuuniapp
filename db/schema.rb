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

ActiveRecord::Schema.define(version: 20160424081843) do

  create_table "chore_users", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "chore_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "chores", force: :cascade do |t|
    t.string   "name"
    t.integer  "priority"
    t.integer  "reward"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "creator_id"
    t.boolean  "private"
    t.string   "completion_text"
  end

  create_table "purchase_categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "purchases", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "purchase_category_id"
    t.string   "description"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.decimal  "price",                precision: 8, scale: 2
  end

  create_table "refunds", force: :cascade do |t|
    t.integer  "payer_id"
    t.integer  "receiver_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.decimal  "amount",      precision: 8, scale: 2
    t.boolean  "confirmed"
  end

  create_table "tasks", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "chore_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "todo_categories", force: :cascade do |t|
    t.string   "name"
    t.integer  "priority"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "todo_comments", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "comment"
    t.integer  "todo_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "todo_solutions", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "solution"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "todo_id"
  end

  create_table "todo_users", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "todo_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "todos", force: :cascade do |t|
    t.integer  "todo_user_id"
    t.string   "title"
    t.string   "description"
    t.integer  "todo_category_id"
    t.datetime "due"
    t.boolean  "private"
    t.integer  "creator_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "todo_solution_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "username"
    t.integer  "xp"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
    t.boolean  "admin"
    t.boolean  "deactivated"
  end

  create_table "xps", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "source"
    t.integer  "points"
    t.integer  "user_id"
  end

end
