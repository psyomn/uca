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

ActiveRecord::Schema.define(version: 20160220222331) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bands", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "user_id"
    t.text     "description"
  end

  add_index "bands", ["name"], name: "index_bands_on_name", using: :btree
  add_index "bands", ["user_id"], name: "index_bands_on_user_id", using: :btree

  create_table "newsitems", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.text     "body"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "user_id"
  end

  add_index "newsitems", ["user_id"], name: "index_newsitems_on_user_id", using: :btree

  create_table "offenses", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "offense_type"
    t.text     "message"
    t.string   "attempted_resource"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "offenses", ["user_id"], name: "index_offenses_on_user_id", using: :btree

  create_table "ratings", force: :cascade do |t|
    t.integer  "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "song_id"
    t.integer  "user_id"
    t.text     "comment"
  end

  add_index "ratings", ["song_id"], name: "index_ratings_on_song_id", using: :btree
  add_index "ratings", ["user_id"], name: "index_ratings_on_user_id", using: :btree

  create_table "songs", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "user_id"
    t.integer  "band_id"
    t.text     "description"
    t.string   "status"
    t.string   "powertab"
  end

  add_index "songs", ["band_id"], name: "index_songs_on_band_id", using: :btree
  add_index "songs", ["user_id"], name: "index_songs_on_user_id", using: :btree

  create_table "submission_comments", force: :cascade do |t|
    t.integer  "submission_id"
    t.string   "comment"
    t.integer  "user_id"
    t.integer  "vote_type"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "submission_comments", ["user_id"], name: "index_submission_comments_on_user_id", using: :btree

  create_table "submissions", force: :cascade do |t|
    t.integer  "song_id"
    t.integer  "user_id"
    t.text     "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "real_name",              limit: 255
    t.text     "bio"
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "nickname"
    t.string   "role"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
