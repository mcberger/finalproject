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

ActiveRecord::Schema.define(version: 20160113220930) do

  create_table "availabilities", force: :cascade do |t|
    t.integer  "user_id"
    t.date     "date"
    t.boolean  "day"
    t.boolean  "night"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string   "text"
    t.integer  "post_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.datetime "start_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.string   "body"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "schedules", force: :cascade do |t|
    t.integer  "week"
    t.integer  "year"
    t.integer  "day_one"
    t.integer  "day_two"
    t.integer  "day_three"
    t.integer  "day_four"
    t.integer  "day_five"
    t.integer  "day_six"
    t.integer  "day_seven"
    t.string   "d_one_nine"
    t.string   "d_one_ten"
    t.string   "d_one_eleven"
    t.string   "d_one_twelve"
    t.string   "d_one_thirteen"
    t.string   "d_one_fourteen"
    t.string   "d_one_fifteen"
    t.string   "d_one_sixteen"
    t.string   "d_one_seventeen"
    t.string   "d_one_eighteen"
    t.string   "d_one_nineteen"
    t.string   "d_one_twenty"
    t.string   "d_two_nine"
    t.string   "d_two_ten"
    t.string   "d_two_eleven"
    t.string   "d_two_twelve"
    t.string   "d_two_thirteen"
    t.string   "d_two_fourteen"
    t.string   "d_two_fifteen"
    t.string   "d_two_sixteen"
    t.string   "d_two_seventeen"
    t.string   "d_two_eighteen"
    t.string   "d_two_nineteen"
    t.string   "d_two_twenty"
    t.string   "d_three_nine"
    t.string   "d_three_ten"
    t.string   "d_three_eleven"
    t.string   "d_three_twelve"
    t.string   "d_three_thirteen"
    t.string   "d_three_fourteen"
    t.string   "d_three_fifteen"
    t.string   "d_three_sixteen"
    t.string   "d_three_seventeen"
    t.string   "d_three_eighteen"
    t.string   "d_three_nineteen"
    t.string   "d_three_twenty"
    t.string   "d_four_nine"
    t.string   "d_four_ten"
    t.string   "d_four_eleven"
    t.string   "d_four_twelve"
    t.string   "d_four_thirteen"
    t.string   "d_four_fourteen"
    t.string   "d_four_fifteen"
    t.string   "d_four_sixteen"
    t.string   "d_four_seventeen"
    t.string   "d_four_eighteen"
    t.string   "d_four_nineteen"
    t.string   "d_four_twenty"
    t.string   "d_five_nine"
    t.string   "d_five_ten"
    t.string   "d_five_eleven"
    t.string   "d_five_twelve"
    t.string   "d_five_thirteen"
    t.string   "d_five_fourteen"
    t.string   "d_five_fifteen"
    t.string   "d_five_sixteen"
    t.string   "d_five_seventeen"
    t.string   "d_five_eighteen"
    t.string   "d_five_nineteen"
    t.string   "d_five_twenty"
    t.string   "d_six_nine"
    t.string   "d_six_ten"
    t.string   "d_six_eleven"
    t.string   "d_six_twelve"
    t.string   "d_six_thirteen"
    t.string   "d_six_fourteen"
    t.string   "d_six_fifteen"
    t.string   "d_six_sixteen"
    t.string   "d_six_seventeen"
    t.string   "d_six_eighteen"
    t.string   "d_six_nineteen"
    t.string   "d_six_twenty"
    t.string   "d_seven_nine"
    t.string   "d_seven_ten"
    t.string   "d_seven_eleven"
    t.string   "d_seven_twelve"
    t.string   "d_seven_thirteen"
    t.string   "d_seven_fourteen"
    t.string   "d_seven_fifteen"
    t.string   "d_seven_sixteen"
    t.string   "d_seven_seventeen"
    t.string   "d_seven_eighteen"
    t.string   "d_seven_nineteen"
    t.string   "d_seven_twenty"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "fname"
    t.string   "lname"
    t.boolean  "admin"
    t.string   "function"
    t.string   "establishment"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
